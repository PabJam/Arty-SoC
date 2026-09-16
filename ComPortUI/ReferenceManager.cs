using Microsoft.Win32;
using System;
using System.Collections.Concurrent;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.IO.Ports;
using System.Security.Policy;
using System.Text;
using System.Windows;
using System.Windows.Threading;
using System.Xml.Serialization;

namespace ComPortUI
{
    public static class ReferenceManager
    {
        public static MainWindow mainWindow { get; }
        public static SerialPort serialPort { get; }
        public static ConcurrentQueue<byte[]> dataQueue {  get; }
        public static Settings settings { get; }
        public static readonly string appPath = AppDomain.CurrentDomain.BaseDirectory;
        public static string settingsPath { get; } 

        const string portName = "COM3";
        const int baudRate = 115200;
        const Parity parity = Parity.None;
        const int dataBits = 8;
        const StopBits stopBits = StopBits.One;

        static ReferenceManager()
        {
            mainWindow = (MainWindow)System.Windows.Application.Current.MainWindow;
            serialPort = new SerialPort(portName, baudRate, parity, dataBits, stopBits);
            serialPort.Encoding = Encoding.Latin1;
            serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataRecievedHandler);
            dataQueue = new ConcurrentQueue<byte[]>();
            settingsPath = $"{appPath}Settings.xml";
            Settings? loadedSettings = Settings.Load(settingsPath, out _);
            settings = loadedSettings == null? new Settings() : loadedSettings; 
        }

        private static void SerialDataRecievedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;
            try
            {
                int bytesToRead = sp.BytesToRead;
                byte[] bytes = new byte[bytesToRead];
                sp.Read(bytes, 0, bytesToRead);

                dataQueue.Enqueue(bytes);
            }
            catch (Exception ex)
            {
                mainWindow.Dispatcher.BeginInvoke(new Action(() =>
                {
                    MessageBox.Show("Serial Error: " + ex.Message);
                }));    
            }
        }

        public static string GetPathFromFileDialog()
        {
            OpenFileDialog ofd = new OpenFileDialog();
            bool? result = ofd.ShowDialog();
            if (result == null || result == false)
            {
                return string.Empty;
            }
            return ofd.FileName;
        }

        private static string GetErrorCheck(string file)
        {
            return $"if %errorlevel% neq 0 (\r\n    echo {Path.GetFileName(file)} compilation failed!  \r\n    exit /b 1\r\n)";
        }

        /// <summary>
        /// Registers the object file a source will produce. Throws if two sources map
        /// to the same object name, which would otherwise be silently overwritten.
        /// </summary>
        private static void AddObject(Dictionary<string, string> objOwners, List<string> objPaths, string sourceFile, string buildPath)
        {
            string objName = Path.GetFileNameWithoutExtension(sourceFile) + ".o";

            string? existingOwner;
            if (objOwners.TryGetValue(objName, out existingOwner))
            {
                throw new InvalidOperationException(
                    "Object file name collision: both\r\n" +
                    "    " + existingOwner + "\r\n" +
                    "    " + sourceFile + "\r\n" +
                    "produce " + objName + " in " + buildPath + ".\r\n" +
                    "Rename one of them, they cannot share a build directory.");
            }

            objOwners.Add(objName, sourceFile);
            objPaths.Add(Path.Combine(buildPath, objName));
        }

        private static string GetCompilerCall(string file, string buildPath, string[] arguments, string optLevel, string includes)
        {
            string fileName = Path.GetFileName(file);
            StringBuilder compilerCall = new StringBuilder();
            compilerCall.AppendLine($"echo Compiling {fileName}...");
            compilerCall.Append("riscv-none-elf-gcc.exe");
            for (int i = 0; i < arguments.Length; i++)
            {
                compilerCall.Append($" {arguments[i]}");
            }
            if (string.IsNullOrEmpty(optLevel) == false)
            {
                compilerCall.Append($" {optLevel}");
            }
            List<string> allIncludes = new List<string>(Directory.GetDirectories(includes, "*", SearchOption.AllDirectories));
            allIncludes.Add(includes);
            for (int i = 0; i < allIncludes.Count; i++)
            {
                compilerCall.Append($" -I{allIncludes[i]}");
            }
            compilerCall.Append($" -c {file} -o {Path.Combine(buildPath, Path.GetFileNameWithoutExtension(file))}.o");
            compilerCall.Append($"\r\n{GetErrorCheck(file)}");

            return compilerCall.ToString();
        }

        private static string GetLinkerCall(string linkerPath, string binaryName, string[] arguments, List<string> objectPaths, string[] stdLibs, bool createMap)
        {
            StringBuilder linkerCall = new StringBuilder();
            linkerCall.AppendLine("echo Linking...");
            linkerCall.Append("riscv-none-elf-gcc.exe");
            for (int i = 0; i < arguments.Length; i++)
            {
                linkerCall.Append($" {arguments[i]}");
            }
            if (createMap == true)
            {
                linkerCall.Append($" -Wl,-Map={binaryName}.map");
            }
            linkerCall.Append($" -T {linkerPath} -o {binaryName}.elf");
            for (int i = 0; i < objectPaths.Count; i++)
            {
                linkerCall.Append($" {objectPaths[i]}");
            }
            for (int i = 0; i < stdLibs.Length; i++)
            {
                linkerCall.Append($" -l{stdLibs[i]}");
            }
            linkerCall.Append("\r\nif %errorlevel% neq 0 (\r\n    echo Linking failed!\r\n    exit /b 1\r\n)");

            return linkerCall.ToString();
        }

        /// <summary>
        /// Echoes the flags the batch was generated with.
        /// </summary>
        private static string GetFlagBanner(Settings s)
        {
            StringBuilder banner = new StringBuilder();
            banner.AppendLine("echo ========================================");
            banner.AppendLine($"echo Settings version : {s.Version}");
            banner.AppendLine($"echo asm   : {string.Join(" ", s.asmBaseArguments)}");
            banner.AppendLine($"echo c     : {string.Join(" ", s.cBaseArguments)} {s.LibOptLevel}");
            banner.AppendLine($"echo link  : {string.Join(" ", s.linkerArguments)}");
            banner.AppendLine("echo ========================================");
            return banner.ToString();
        }

        public static string GenerateBatchFile(string mainPath)
        {
            // Migration happens in Settings.Load. This only re-checks the things
            // migration cannot fix, such as an arch that differs between steps.
            settings.ValidateOrThrow();

            StringBuilder batchContent = new StringBuilder();
            List<string> objPaths = new List<string>();
            Dictionary<string, string> objOwners = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

            batchContent.AppendLine("@echo off");
            batchContent.AppendLine($"set \"PATH={settings.GccPath};%PATH%\"");
            batchContent.AppendLine(GetFlagBanner(settings));

            // startup
            string startUpPath = Path.Combine(settings.BuildPath, "startup.s");
            batchContent.AppendLine(GetCompilerCall(startUpPath, settings.BuildPath, settings.asmBaseArguments, string.Empty, settings.LibPath));
            AddObject(objOwners, objPaths, startUpPath, settings.BuildPath);

            // main
            batchContent.AppendLine(GetCompilerCall(mainPath, settings.BuildPath, settings.cBaseArguments, settings.mainOptLevel, settings.LibPath));
            AddObject(objOwners, objPaths, mainPath, settings.BuildPath);

            string[] allASMFiles = Directory.GetFiles(settings.LibPath, "*.s", SearchOption.AllDirectories);
            string[] allCFiles = Directory.GetFiles(settings.LibPath, "*.c", SearchOption.AllDirectories);

            for (int i = 0; i < allASMFiles.Length; i++)
            {
                batchContent.AppendLine(GetCompilerCall(allASMFiles[i], settings.BuildPath, settings.asmBaseArguments, string.Empty, settings.LibPath));
                AddObject(objOwners, objPaths, allASMFiles[i], settings.BuildPath);
            }
            for (int i = 0; i < allCFiles.Length; i++)
            {
                batchContent.AppendLine(GetCompilerCall(allCFiles[i], settings.BuildPath, settings.cBaseArguments, settings.LibOptLevel, settings.LibPath));
                AddObject(objOwners, objPaths, allCFiles[i], settings.BuildPath);
            }

            // Linker Call
            string binaryPath = Path.Combine(settings.BuildPath, Path.GetFileNameWithoutExtension(mainPath));
            batchContent.AppendLine(GetLinkerCall(settings.LinkerPath, binaryPath, settings.linkerArguments, objPaths, settings.stdLibs, settings.createMap));

            // .elf -> .bin
            batchContent.AppendLine($"riscv-none-elf-objcopy.exe -O binary {binaryPath}.elf {binaryPath}.bin");

            batchContent.AppendLine("echo ========================================\r\necho Build complete!\r\necho ========================================");

            if (settings.createDis == true)
            {
                // -S interleaves source, which needs -g on the compile line
                batchContent.AppendLine($"riscv-none-elf-objdump.exe -d -S {binaryPath}.elf > {binaryPath}.dis");
            }

            batchContent.AppendLine($"riscv-none-elf-size.exe {binaryPath}.elf");

            string batchPath = Path.Combine(settings.BuildPath, "build.bat");
            File.WriteAllText(batchPath, batchContent.ToString());
            return batchPath;
        }

        //public static void SaveToXml<T>(T obj, string filePath)
        //{
        //    XmlSerializer serializer = new XmlSerializer(typeof(T));
        //    using (StreamWriter writer = new StreamWriter(filePath))
        //    {
        //        serializer.Serialize(writer, obj);
        //    }
        //}
        //
        //public static T? LoadFromXml<T>(string filePath)
        //{
        //    XmlSerializer serializer = new XmlSerializer(typeof(T));
        //    try
        //    {
        //        using (StreamReader reader = new StreamReader(filePath))
        //        {
        //            return (T?)serializer.Deserialize(reader);
        //        }
        //    }
        //    catch
        //    {
        //        return (T?)(object?)null;
        //    }
        //
        //}

    }
}
