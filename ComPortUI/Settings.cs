using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace ComPortUI
{
    [Serializable]
    [XmlRoot("Build Tool Settings")]
    public class Settings
    {
        /// <summary>
        /// Bumped whenever the toolchain flags in this class change. A saved
        /// Settings.xml carries the version it was written with, so Load can
        /// refresh the flags while leaving the configured paths alone. Without
        /// this, editing the defaults here has no effect on an existing file.
        /// </summary>
        public const int CurrentVersion = 2;

        /// <summary>
        /// IMPORTANT: the parameterless constructor deliberately leaves this at
        /// 0. XmlSerializer builds the object with that constructor and then
        /// overwrites only the fields present in the file, so a Settings.xml
        /// written before this field existed leaves it at whatever the
        /// constructor set.
        /// </summary>
        public int Version;

        // ---- user configuration, never touched by migration ----
        public string BuildPath;
        public string LibPath;
        public string LinkerPath;
        public string GccPath;
        public string LibOptLevel;
        public string mainOptLevel;
        public bool createDis;
        public bool createMap;

        // ---- toolchain flags, replaced by migration ----
        public string[] asmBaseArguments;
        public string[] cBaseArguments;
        public string[] linkerArguments;
        public string[] stdLibs;

        public Settings()
        {
            Version = 0; // see the comment on the field

            BuildPath = string.Empty;
            LibPath = string.Empty;
            LinkerPath = string.Empty;
            GccPath = string.Empty;

            LibOptLevel = "-O2";
            mainOptLevel = "-O2";
            createDis = true;
            createMap = true;

            asmBaseArguments = new string[0];
            cBaseArguments = new string[0];
            linkerArguments = new string[0];
            stdLibs = new string[0];

            ApplyDefaultFlags();
        }

        /// <summary>
        /// Settings for a fresh install, already marked as current.
        /// </summary>
        public static Settings CreateDefault()
        {
            Settings s = new Settings();
            s.Version = CurrentVersion;
            return s;
        }

        /// <summary>
        /// Overwrites only the toolchain flag arrays. Kept separate from the
        /// constructor so migration can reuse it without disturbing paths or
        /// user preferences.
        /// </summary>
        public void ApplyDefaultFlags()
        {
            asmBaseArguments = new string[]
            {
                "-march=rv32im",
                "-mabi=ilp32"
            };

            cBaseArguments = new string[]
            {
                "-march=rv32im",
                "-mabi=ilp32",
                "-ffreestanding",       // no hosted libc assumptions
                "-Wall",
                "-Wextra",
                "-g",                   // objcopy strips this, the .bin is unaffected
                "-ffunction-sections",  // pair with --gc-sections to drop dead code
                "-fdata-sections"
            };

            linkerArguments = new string[]
            {
                "-march=rv32im",
                "-mabi=ilp32",
                "-nostdlib",
                "-Wl,--gc-sections",
                // one LOAD segment for BRAM is intentional, the bootloader
                // writes a flat image from address 0
                "-Wl,--no-warn-rwx-segments"
            };

            stdLibs = new string[] { "gcc" };
        }

        /// <summary>
        /// Brings an older settings file up to date. Paths, optimisation levels
        /// and the dis/map preferences are preserved; only the toolchain flags
        /// are replaced.
        /// </summary>
        /// <param name="changes">Human readable summary of what was replaced.</param>
        /// <returns>true if anything changed and the file should be saved.</returns>
        public bool MigrateIfNeeded(out string changes)
        {
            changes = string.Empty;
            if (Version == CurrentVersion) { return false; }

            StringBuilder log = new StringBuilder();
            log.AppendLine("Settings migrated from version " + Version + " to " + CurrentVersion + ".");
            log.AppendLine("was:");
            log.AppendLine("  asm  : " + Describe(asmBaseArguments));
            log.AppendLine("  c    : " + Describe(cBaseArguments));
            log.AppendLine("  link : " + Describe(linkerArguments));
            log.AppendLine("  libs : " + Describe(stdLibs));

            ApplyDefaultFlags();

            log.AppendLine("now:");
            log.AppendLine("  asm  : " + Describe(asmBaseArguments));
            log.AppendLine("  c    : " + Describe(cBaseArguments));
            log.AppendLine("  link : " + Describe(linkerArguments));
            log.AppendLine("  libs : " + Describe(stdLibs));
            log.AppendLine("paths and optimisation levels were left unchanged.");

            Version = CurrentVersion;
            changes = log.ToString();
            return true;
        }

        /// <summary>
        /// Loads a settings file, migrating it if it predates the current flag
        /// set. The original is copied to &lt;file&gt;.vN.bak before the updated
        /// version is written, so a hand edited flag list is never lost without
        /// a copy. Creates a default file if none exists.
        /// </summary>
        public static Settings Load(string path, out string migrationLog)
        {
            migrationLog = string.Empty;

            if (File.Exists(path) == false)
            {
                Settings fresh = CreateDefault();
                Save(path, fresh);
                return fresh;
            }

            Settings? loaded;
            XmlSerializer serializer = new XmlSerializer(typeof(Settings));
            using (FileStream stream = File.OpenRead(path))
            {
                loaded = (Settings?)serializer.Deserialize(stream);
            }
            if (loaded == null)
            {
                Settings fresh = CreateDefault();
                Save(path, fresh);
                return fresh;
            }
            int oldVersion = loaded.Version;
            string changes;
            if (loaded.MigrateIfNeeded(out changes) == true)
            {
                string backup = path + ".v" + oldVersion + ".bak";
                File.Copy(path, backup, true);
                Save(path, loaded);
                migrationLog = changes + "old file backed up to " + backup + Environment.NewLine;
            }

            loaded.ValidateOrThrow();
            return loaded;
        }

        public static void Save(string path, Settings s)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Settings));
            using (FileStream stream = File.Create(path))
            {
                serializer.Serialize(stream, s);
            }
        }

        /// <summary>
        /// Checks the things migration cannot fix. An arch or ABI that differs
        /// between the assembler, compiler and linker steps produces confusing
        /// link errors rather than an obvious one, so it is worth catching here.
        /// </summary>
        public void ValidateOrThrow()
        {
            string asmArch = FindArgument(asmBaseArguments, "-march=");
            string cArch = FindArgument(cBaseArguments, "-march=");
            string linkArch = FindArgument(linkerArguments, "-march=");

            if (asmArch != cArch || cArch != linkArch)
            {
                throw new InvalidOperationException(
                    "Architecture mismatch between build steps: asm=" + asmArch +
                    " c=" + cArch + " link=" + linkArch +
                    ". All three must match or the objects will not link cleanly.");
            }

            string asmAbi = FindArgument(asmBaseArguments, "-mabi=");
            string cAbi = FindArgument(cBaseArguments, "-mabi=");
            string linkAbi = FindArgument(linkerArguments, "-mabi=");

            if (asmAbi != cAbi || cAbi != linkAbi)
            {
                throw new InvalidOperationException(
                    "ABI mismatch between build steps: asm=" + asmAbi +
                    " c=" + cAbi + " link=" + linkAbi + ".");
            }
        }

        private static string Describe(string[] arguments)
        {
            if (arguments == null) { return "<none>"; }
            return string.Join(" ", arguments);
        }

        private static string FindArgument(string[] arguments, string prefix)
        {
            if (arguments == null) { return "<none>"; }
            for (int i = 0; i < arguments.Length; i++)
            {
                if (arguments[i].StartsWith(prefix)) { return arguments[i]; }
            }
            return "<none>";
        }
    }
}
