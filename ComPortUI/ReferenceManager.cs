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

        const string portName = "COM7";
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
            Settings? loadedSettings = LoadFromXml<Settings>(settingsPath);
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

        private static string GetCompilerCall(string file, string buildPath, List<string> arguments, string optLevel, string includes)
        {
            string fileName = Path.GetFileName(file);
            string message = $"echo Compiling {fileName}...";
            StringBuilder compilerCall = new StringBuilder();
            compilerCall.Append("riscv-none-elf-gcc.exe");
            for (int i = 0; i < arguments.Count; i++)
            {
                compilerCall.Append($" {arguments[i]}" );
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
            compilerCall.Append($" -c {file} -o {buildPath}{fileName.Substring(0, fileName.Length - 2)}.o");
            compilerCall.Append($"\r\n{GetErrorCheck(file)}");
   
            return compilerCall.ToString();
        }

        private static string GetLinkerCall(string linkerPath, string binaryName, List<string> arguments, List<string> objectPaths, List<string> stdLibs)
        {
            StringBuilder linkerCall = new StringBuilder();
            linkerCall.Append("riscv-none-elf-gcc.exe");
            for (int i = 0; i < arguments.Count; i++)
            {
                linkerCall.Append($" {arguments[i]}");
            }
            linkerCall.Append($" -T {linkerPath} -o {binaryName}.elf");
            for (int i = 0; i < objectPaths.Count; i++)
            {
                linkerCall.Append($" {objectPaths[i]}");
            }
            for (int i = 0; i < stdLibs.Count; i++)
            {
                linkerCall.Append($" -l{stdLibs[i]}");
            }
            linkerCall.Append("\r\nif %errorlevel% neq 0 (\r\n    echo Linking failed!\r\n    exit /b 1\r\n)");

            return linkerCall.ToString();
        }

        public static string GenerateBatchFile(string mainPath)
        {
            StringBuilder batchContent = new StringBuilder();
            List<string> objPaths = new List<string>();
            batchContent.AppendLine("@echo off");
            string startUpPath = Path.Combine(settings.BuildPath, "startup.s");
            batchContent.AppendLine(GetCompilerCall(startUpPath, settings.BuildPath, settings.asmBaseArguments, string.Empty, settings.LibPath)); // start up
            objPaths.Add($"{startUpPath.Substring(0, startUpPath.Length - 2)}.o");
            batchContent.AppendLine(GetCompilerCall(mainPath, settings.BuildPath, settings.cBaseArguments, settings.mainOptLevel, settings.LibPath)); // main
            string mainFileName = Path.GetFileName(mainPath);
            objPaths.Add($"{settings.BuildPath}{mainFileName.Substring(0, mainFileName.Length - 2)}.o");
            string[] allASMFiles = Directory.GetFiles(settings.LibPath, "*.s", SearchOption.AllDirectories);
            string[] allCFiles = Directory.GetFiles(settings.LibPath, "*.c", SearchOption.AllDirectories);
            string fileName = string.Empty;
            for (int i = 0; i < allASMFiles.Length ; i++) 
            {   
                fileName = Path.GetFileName(allASMFiles[i]);
                batchContent.AppendLine(GetCompilerCall(allASMFiles[i], settings.BuildPath, settings.asmBaseArguments, string.Empty, settings.LibPath));
                objPaths.Add($"{settings.BuildPath}{fileName.Substring(0, fileName.Length - 2)}.o");
            }
            for (int i = 0; i < allCFiles.Length; i++)
            {
                fileName = Path.GetFileName(allCFiles[i]);
                batchContent.AppendLine(GetCompilerCall(allCFiles[i], settings.BuildPath, settings.cBaseArguments, settings.LibOptLevel, settings.LibPath));
                objPaths.Add($"{settings.BuildPath}{fileName.Substring(0, fileName.Length - 2)}.o");
            }

            //Linker Call
            string binaryPath = $"{settings.BuildPath}{mainFileName.Substring(0, mainFileName.Length - 2)}";
            batchContent.AppendLine(GetLinkerCall(settings.LinkerPath, binaryPath, settings.linkerArguments, objPaths, settings.stdLibs)); 
            //.elf -> .bin
            batchContent.AppendLine($"riscv-none-elf-objcopy.exe -O binary {binaryPath}.elf {binaryPath}.bin");

            batchContent.AppendLine("echo ========================================\r\necho Build complete!\r\necho ========================================");
            if (settings.createDis == true)
            {
                batchContent.AppendLine($"riscv-none-elf-objdump.exe -d {binaryPath}.elf > {binaryPath}.dis");
            }
            batchContent.AppendLine($"riscv-none-elf-size.exe {binaryPath}.elf");

            string batchPath = Path.Combine(settings.BuildPath, "build.bat");
            File.WriteAllText(batchPath, batchContent.ToString());
            return batchPath;
        }

        public static void SaveToXml<T>(T obj, string filePath)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            using (StreamWriter writer = new StreamWriter(filePath))
            {
                serializer.Serialize(writer, obj);
            }
        }

        public static T? LoadFromXml<T>(string filePath)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            try
            {
                using (StreamReader reader = new StreamReader(filePath))
                {
                    return (T?)serializer.Deserialize(reader);
                }
            }
            catch
            {
                return (T?)(object?)null;
            }

        }

    }
}
