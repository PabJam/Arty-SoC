using System;
using System.Collections.Generic;
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
        public string BuildPath;
        public string LibPath;
        public string LinkerPath;
        public string GccPath;
        public string[] asmBaseArguments;
        public string[] cBaseArguments;
        public string[] linkerArguments;
        public string[] stdLibs;
        public string LibOptLevel;
        public string mainOptLevel;
        public bool createDis;

        public Settings() 
        {
            BuildPath = string.Empty;
            LibPath = string.Empty;
            LinkerPath = string.Empty;
            GccPath = string.Empty;
            asmBaseArguments = new string[] { "-march=rv32i", "-mabi=ilp32" };
            cBaseArguments = new string[] { "-march=rv32i", "-mabi=ilp32", "-ffreestanding", "-nostdlib" };
            linkerArguments = new string[] { "-march=rv32i", "-mabi=ilp32", "-nostdlib" };
            stdLibs = new string[] { "gcc" };
            LibOptLevel = "-O2";
            mainOptLevel = "-O2";
            createDis = false;
        }
        
    }
}
