using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO.Ports;

namespace ComPortUI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        // Hard coded constants (for now)
        const string portName = "COM7";
        const int baudRate = 9600;
        const Parity parity = Parity.None;
        const int dataBits = 8;
        const StopBits stopBits = StopBits.One;


        private SerialPort serialPort;
        public MainWindow()
        {
            InitializeComponent();
            serialPort = new SerialPort(portName, baudRate, parity, dataBits, stopBits);
            serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataRecievedHandler);
        }

        private static void SerialDataRecievedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;

            //Read all available data
            string data = sp.ReadExisting();
            //TODO write to text window
        }
    }
}