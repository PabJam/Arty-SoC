using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComPortUI
{
    public static class ReferenceManager
    {
        public static MainWindow mainWindow { get; }
        public static SerialPort serialPort { get; }

        const string portName = "COM7";
        const int baudRate = 115200;
        const Parity parity = Parity.None;
        const int dataBits = 8;
        const StopBits stopBits = StopBits.One;

        static ReferenceManager()
        {
            mainWindow = (MainWindow)System.Windows.Application.Current.MainWindow;
            serialPort = new SerialPort(portName, baudRate, parity, dataBits, stopBits);
            serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataRecievedHandler);
        }

        private static void SerialDataRecievedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;

            //Read all available data
            byte[] bytes = Encoding.ASCII.GetBytes(sp.ReadExisting());
            string data = Encoding.ASCII.GetString(bytes);
            //byte[] bytes = Encoding.ASCII.GetBytes(data);

            mainWindow.Dispatcher.Invoke(() =>
            {
                //for (int i = 0; i < bytes.Length; i++)
                //{
                //    mainWindow.Output_TB.AppendText(bytes[i].ToString("X") + " "); 
                //}
                data = mainWindow.GetOutputText(false) + data;
                mainWindow.SetOutputText(data);

            });
        }

    }
}
