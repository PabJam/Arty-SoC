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
using Microsoft.Win32;
using System.IO;
using System.Diagnostics.Eventing.Reader;

//012356789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ

namespace ComPortUI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SerialPort serialPort;
        private string formattedOutputText = string.Empty;
        private string realOutput = string.Empty;
        public MainWindow()
        {
            InitializeComponent();
            serialPort = ReferenceManager.serialPort;
            try
            {
                serialPort.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error {ex.Message}");
            }

        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (serialPort.IsOpen)
            {
                serialPort.Close();
            }
        }

        private void Input_TB_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                if (Keyboard.IsKeyDown(Key.LeftShift))
                {
                    Input_TB.AppendText("\r\n");
                    Input_TB.CaretIndex = Input_TB.Text.Length;
                    return;
                }
                
                string message = Input_TB.Text;

                Output_TB.Clear();
                Input_TB.Clear();

                serialPort.Write(message);

            }
        }

        private void LoadFileButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            bool? result = ofd.ShowDialog();
            byte[] fileBytes;
            if (result == null || result == false) 
            {
                return;
            }
            string path = ofd.FileName;
            if (ConvertStringToBin.IsChecked == false)
            {
                fileBytes = File.ReadAllBytes(path);
                
            }
            else
            {
                string[] lines = File.ReadAllLines(path);
                string content = string.Join("", lines);
                content = content.Replace(" ", "");
                if (string.IsNullOrEmpty(content))
                {
                    MessageBox.Show("Binary string cannot be null or empty", "File was empty", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (!content.All(c => c == '0' || c == '1'))
                {
                    MessageBox.Show("String must contain only '0' and '1' characters", "File contained invalid characters", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (content.Length % 8 != 0)
                {
                    MessageBox.Show($"Binary string length must be a multiple of 8. Current length: {content.Length}", "File was not divisible by 8", MessageBoxButton.OK, MessageBoxImage.Error);
                }

                fileBytes = BinaryStringToBytes(content);
            }

            if (fileBytes.Length >= 1 << 16)
            {
                MessageBox.Show("File could not be loadet because it exceeded the Program memory of 65.536 bytes", "File too large", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            serialPort.Write(fileBytes, 0, fileBytes.Length);
        }


        public static byte[] BinaryStringToBytes(string binaryString)
        {
            byte[] bytes = new byte[binaryString.Length / 8];
            for (int i = 0; i < binaryString.Length; i += 8)
            {
                string byteString = binaryString.Substring(i, 8);
                bytes[i / 8] = Convert.ToByte(byteString, 2);
            }
            return bytes;
        }

        public void SetOutputText(string text)
        {
            realOutput = text; 
            switch (OutputFormat_CB.SelectedIndex)
            {
                case 0: // ASCII
                    formattedOutputText = text;
                    break;

                case 1: // HEX
                    StringBuilder sb = new StringBuilder();
                    byte[] asciiBytes = Encoding.ASCII.GetBytes(text);
                    for (int i = 0; i < asciiBytes.Length; i++)
                    {
                        if (i != 0 && i % 4 == 0)
                        {
                            sb.Append("| ");
                           
                        }
                        sb.Append($"{asciiBytes[i].ToString("X2")} ");
                    }
                    formattedOutputText = sb.ToString();
                    break;
            }
            Output_TB.Text = formattedOutputText;
        }

        public string GetOutputText(bool formatted)
        {
            if (formatted)
            {
                return formattedOutputText;
            }
            else
            {
                return realOutput;
            }
        }

        private void OutputFormat_CB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SetOutputText(GetOutputText(false));
        }

        private void ClearOutput_Btn_Click(object sender, RoutedEventArgs e)
        {
            SetOutputText(string.Empty);
        }
    }   
}