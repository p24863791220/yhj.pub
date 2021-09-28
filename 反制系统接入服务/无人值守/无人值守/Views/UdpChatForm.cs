using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.Threading;

namespace WindowsFormsApplication1
{
    public partial class UdpChatForm : Form
    {
        public  string  ipSa= "192.168.3.12";
        public  int Sport = 6666;
        static IPEndPoint ipeEndS;
        static IPEndPoint ipeEndC;
        static UdpClient udpS;
        public byte[] receiveByte=null;
        //static UdpClient udpC;
        public UdpChatForm()
        {
            InitializeComponent();            
        }
        private ManualResetEvent receiveDone = new ManualResetEvent(false);
        private  void Init_UdpServer()
        {
            ipSa = getIp();
            if (ipSa.IndexOf("192") >= 0) ;
            else
            {
                ipSa = "192.168.3.12";
                listBox2.Items.Add(ipSa);
                listBox2.SelectedIndex = 0;
            }
            ipeEndS = new IPEndPoint(IPAddress.Parse (ipSa), Sport);
            ipeEndC = new IPEndPoint(IPAddress.Any, 6666);
            udpS = new UdpClient(ipeEndS);
            //udpC = new UdpClient();
        }
        private string getIp()
        {
            string hostName = Dns.GetHostName();
            System.Net.IPAddress[] addressList = Dns.GetHostAddresses(hostName);
            foreach (IPAddress ip in addressList )
            {
                string sip = ip.ToString();
                if (sip.IndexOf("192") >= 0)
                {
                    listBox2.Items.Add(sip);
                }
            }
            listBox2.SelectedIndex = 0;
            return listBox2.Text  ;
        }
        private static void AsyncSendCallback(IAsyncResult ar)
        {
            if (ar.IsCompleted )
            {
                udpS.EndSend(ar);
            }
        }
        private void UdpChatForm_Load(object sender, EventArgs e)
        {
            Init_UdpServer();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string strSend = this.textBox1.Text +ipeEndS;
            byte[] sendByte = Encoding.UTF8.GetBytes(strSend);
            IPEndPoint iep =new IPEndPoint (ipeEndC.Address,6666) ;
            udpS.BeginSend(sendByte, sendByte.Length, iep, new AsyncCallback(AsyncSendCallback), null);
        }

        
        private void UdpChatForm_FormClosed(object sender, FormClosedEventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)//udp异步接收
        {
            if (receiveByte == null) ;
            else
                listBox1.Items.Add(Encoding.UTF8.GetString(receiveByte));
            receiveByte=null;
            //timer1.Enabled = false;
            IAsyncResult iar = udpS.BeginReceive(new AsyncCallback(ReceiveCallBack), null);
            //receiveDone.WaitOne();
            Thread.Sleep(100);
        }
        private void ReceiveCallBack(IAsyncResult iar)
        {
            if (iar.IsCompleted)
            {
                 receiveByte = udpS.EndReceive(iar, ref ipeEndC);

                //receiveDone.Set();
                //timer1.Enabled = true;
            }
        }
    }
}
