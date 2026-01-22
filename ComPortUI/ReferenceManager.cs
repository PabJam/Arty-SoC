using System.IO.Ports;
using System.Text;

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
            serialPort.Encoding = Encoding.Latin1;
            serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataRecievedHandler);
        }

        private static void SerialDataRecievedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;
            int bytesToRead = sp.BytesToRead;
            byte[] bytes = new byte[bytesToRead];
            for (int i = 0; i < bytesToRead; i++)
            {
                bytes[i] = (byte)sp.ReadByte();
            }


            mainWindow.Dispatcher.Invoke(() =>
            {
                mainWindow.AddOutputBytes(bytes);

            });
        }

    }
}
