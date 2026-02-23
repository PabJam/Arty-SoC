using System;
using System.IO.Ports;
using System.Text;
using System.Windows;
using System.Windows.Threading;
using System.Collections.Concurrent;

namespace ComPortUI
{
    public static class ReferenceManager
    {
        public static MainWindow mainWindow { get; }
        public static SerialPort serialPort { get; }
        public static ConcurrentQueue<byte[]> dataQueue {  get; }

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

    }
}
