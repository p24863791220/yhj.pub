using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Net;
using SignalCommunication.TCP;


namespace SignalCommunication
{
    public partial class TCPCommunication : Form
    {
        #region 初始化全局参数
        /// <summary>
        /// 正在加载动画
        /// </summary>
         LoadingHelper locading;

        /// <summary>
        /// 线程辅助对象
        /// </summary>
        SignalCommunication.ThreadHelper TH = null;

        /// <summary>
        /// 网络心跳包，用于客户端与服务端通讯，客戶端連接對象
        /// </summary>
        private SocketClientManager ClientTcp = null;
        /// <summary>
        /// TCP服务器对象 
        /// </summary>
        private AsyncTcpServer ServerTCP;  ///TCP服务器对象 

        /// <summary>
        /// 服务器断开连接时向客户端发送的消息数据
        /// </summary>
        private string StringServerClose { get; set; }
        /// <summary>
        /// 客户端心跳包消息文本
        /// </summary>
        private string ClientHeartbeatPpacketMsg { get; set; }
        /// <summary>
        /// 客户端用于心跳包消息的验证文本
        /// </summary>
        private string ClientHeartbeatPpacketVerificationMsg { get; set; }
        #endregion 结束初始化全局参数
        public TCPCommunication()
        {
            InitializeComponent();
            locading = new LoadingHelper(this);
            this.TH = new SignalCommunication.ThreadHelper(this);
            
        }

        private void TCPCommunication_Load(object sender, EventArgs e)
        {
            locading.ShowOpaqueLayer(this, 0, true);
            Thread thread = new Thread(new ParameterizedThreadStart(LoadData));
            TH.StartThread(thread);
        }

        /// <summary>
        /// 初始化加载
        /// </summary>
        /// <param name="objGuid"></param>
        private void LoadData(object objGuid)
        {
            string strIP = GetAddressIP();
            TH.SetTextBoxText(txtServerIP,strIP);
            TH.SetTextBoxText(txtClientIP,strIP);
            TH.SetTextBoxEnabled(txtServerIP,false);
            TH.SetButtonEnabled(btServerSend, false);
            TH.SetButtonEnabled(btClientSend, false);
            this.StringServerClose = ConfigurationManager.AppSettings["ServerClose"];
            this.ClientHeartbeatPpacketMsg = ConfigurationManager.AppSettings["ClientHeartbeatPpacketMsg"];
            this.ClientHeartbeatPpacketVerificationMsg = ConfigurationManager.AppSettings["ClientHeartbeatPpacketVerificationMsg"];
            locading.HideOpaqueLayer();
        }
        /// <summary>
        /// 获取本地IP地址信息
        /// </summary>
        private string GetAddressIP()
        {
            ///获取本地的IP地址
            string AddressIP = string.Empty;
            foreach (IPAddress _IPAddress in Dns.GetHostEntry(Dns.GetHostName()).AddressList)
            {
                if (_IPAddress.AddressFamily.ToString() == "InterNetwork")
                {
                    //if (_IPAddress.ToString() != "" && _IPAddress.ToString() != "0" && _IPAddress.ToString() != "127.0.0.1")
                    if (_IPAddress.ToString() != "" && _IPAddress.ToString() != "0" && _IPAddress.ToString() != "127.0.0.1")
                    {
                        AddressIP = _IPAddress.ToString();
                    }
                }
            }
            return AddressIP;
        }

        private void TCPCommunication_FormClosing(object sender, FormClosingEventArgs e)
        {
            TH.Dispose();
            locading.Dispose();
            this.Dispose();
        }

        /// <summary>
        /// 启动服务器端
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btStartServer_Click(object sender, EventArgs e)
        {
            if (ComputerInfo.GetNetworkIsAvailable())
            {
                int intServerProt = int.Parse(txtServerProt.Text.Trim());
                ServerTCP = new AsyncTcpServer(intServerProt);
                ServerTCP.Encoding = Encoding.UTF8;

                ServerTCP.ClientConnected += new EventHandler<TcpClientConnectedEventArgs>(TCPserver_ClientConnected);
                ServerTCP.ClientDisconnected += new EventHandler<TcpClientDisconnectedEventArgs>(TCPserver_ClientDisconnected);
                //server.PlaintextReceived +=
                //  new EventHandler<TcpDatagramReceivedEventArgs<string>>(server_PlaintextReceived);
                ServerTCP.DatagramReceived += new EventHandler<TcpDatagramReceivedEventArgs<byte[]>>(TCPserver_PlainbyteReceived);
                ServerTCP.Start(1000);
                TH.SetButtonEnabled(btStartServer, false);
                this.TH.SetLabelText(lbServerMsgTips, "服务端启动成功");
                TH.SetButtonEnabled(btServerSend, true);
                TH.SetButtonEnabled(btClsoeServer, true);
                TH.SetRichTextBoxADD(rtxtServerMsgList,"服务器成功启动，端口："+ txtServerProt.Text.Trim() + " \r\n");
            }
            else
            {
                MessageBox.Show("未连接网络!");
            }
        }

        #region 服务器相关事件
        /// <summary>
        ///  TCP客户端建立新的连接时事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TCPserver_ClientConnected(object sender, TcpClientConnectedEventArgs e)
        {
            TH.SetRichTextBoxADD(rtxtServerMsgList,"客户端："+ e.TcpClient.Client.RemoteEndPoint.ToString() + " 连接成功! \r\n");
            //ServerTCP.Send(e.TcpClient, "Connection Success");
        }
        /// <summary>
        ///  TCP设备与服务器断开事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TCPserver_ClientDisconnected(object sender, TcpClientDisconnectedEventArgs e)
        {
            TH.SetRichTextBoxADD(rtxtServerMsgList, "客户端：" + e.TcpClient.Client.RemoteEndPoint.ToString() + " 失去连接! \r\n");
        }
        /// <summary>
        ///  TCP客户端向服务器发送数据时事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TCPserver_PlainbyteReceived(object sender, TcpDatagramReceivedEventArgs<byte[]> e)
        {
            lock (new object())
            {
                string strMsg = System.Text.Encoding.UTF8.GetString(e.Datagram);
                if (strMsg ==this.ClientHeartbeatPpacketMsg)
                {
                    ServerTCP.Send(e.TcpClient, this.ClientHeartbeatPpacketVerificationMsg);
                    TH.SetRichTextBoxADD(rtxtServerMsgList,"接收到："+ e.TcpClient.Client.RemoteEndPoint.ToString() + "心跳包验证 \r\n");
                }
                else
                {
                    TH.SetRichTextBoxADD(rtxtServerMsgList, e.TcpClient.Client.RemoteEndPoint.ToString() + "消息：" + strMsg + " \r\n");
                }
                
               
            }
        }
        #endregion 结束 服务器相关事件


        #region 客户端相关事件
        /// <summary>
        /// 接收到消息
        /// </summary>
        public void NetworkResponseClientTcpOnReceiveMsg(string strMsg)
        {
            if (string.Empty.Equals(strMsg)) { return; }
            else
            {
                TH.SetRichTextBoxADD(rtxtClientList, "接收服务器消息：" + strMsg + " \r\n");
            }
        }
            private void NetworkResponseClientTcpOnConnected()
        {
            TH.SetRichTextBoxADD(rtxtClientList, "远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 连接成功!\r\n");
            this.TH.SetLabelText(lbClientMsgTips, "客户端连接成功");
        }

        private void NetworkResponseClientTcpOnFaildConnect()
        {
            TH.SetRichTextBoxADD(rtxtClientList, "远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 连接失败!\r\n");
            ClientTcp.Close();
            TH.SetButtonEnabled(btCloseClient, false);
            TH.SetButtonEnabled(btStartClient, true);
            TH.SetButtonEnabled(btClientSend, false);
        }
        /// <summary>
        /// 通信超时事件
        /// </summary>
        private void CommuuicationOutTime()
        {
            TH.SetRichTextBoxADD(rtxtClientList, "与远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 通信超时，正在进行重新连接!....\r\n");
        }
        /// <summary>
        /// 服务器断开事件
        /// </summary>
        private void NetworkResponseClientTcpServerDisconnected()
        {
            if (ClientTcp._isConnected)
            {
                ClientTcp.Close();
            }
            TH.SetButtonEnabled(btCloseClient, false);
            TH.SetButtonEnabled(btStartClient, true);
            TH.SetButtonEnabled(btClientSend, false);
            TH.SetRichTextBoxADD(rtxtClientList, "与远程服务器失去连接!\r\n");
        }
        #endregion 结束客户端相关事件

        /// <summary>
        /// 启动客户端
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btStartClient_Click(object sender, EventArgs e)
        {
            if (ComputerInfo.GetNetworkIsAvailable())
            {
                Thread thread = new Thread(new ParameterizedThreadStart(StartClientTcp));
                TH.StartThread(thread);
            }
            else
            {
                MessageBox.Show("未连接网络");
            }

        }

        private void ClientTcpConnect()
        {
            if(ClientTcp!=null)
            {
                ClientTcp.Close();
                System.Threading.Thread.Sleep(500);
            }

            ClientTcp = new SocketClientManager(txtClientIP.Text.Trim(), int.Parse(txtClientProt.Text.Trim()));
            ClientTcp.OnReceiveMsg += NetworkResponseClientTcpOnReceiveMsg;
            ClientTcp.OnConnected += NetworkResponseClientTcpOnConnected;
            ClientTcp.OnFaildConnect += NetworkResponseClientTcpOnFaildConnect;
            ClientTcp.onServerDisconnected += NetworkResponseClientTcpServerDisconnected;
            ClientTcp.OnCommuuicationOutTime += CommuuicationOutTime;
            ClientTcp.Start();
        }
        /// <summary>
        /// 启动客户端
        /// </summary>
        /// <param name="objGuid"></param>
        private void StartClientTcp(object objGuid)
        {
            locading.ShowOpaqueLayer(this, 0, true);
            this.TH.SetLabelText(lbClientMsgTips,"客户端启动中");
            TH.SetRichTextBoxADD(rtxtClientList, "远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 连接中!\r\n");
            ClientTcpConnect();
            //检测是否完成初始化连接
            int intFofCount = 0;
            while(!ClientTcp._isConnected)
            {
                intFofCount++;
                System.Threading.Thread.Sleep(800);
                if(intFofCount>50)
                {
                    TH.SetLabelText(lbClientMsgTips,"连接服务器超时");
                    TH.SetControlEnabled(btStartClient, true);
                    TH.SetButtonEnabled(btClientSend, false);
                    break;
                }
                ClientTcpConnect();
            }

            ///输出操作
            if(ClientTcp._isConnected)
            {
                TH.SetButtonEnabled(btStartClient, false);
                TH.SetLabelText(lbClientMsgTips, "连接成功");
                TH.SetButtonEnabled(btClientSend, true);
                TH.SetButtonEnabled(btCloseClient, true);
                //TH.SetRichTextBoxADD(rtxtClientList,"远程服务器："+ txtClientIP.Text.Trim()+@" 端口："+ txtClientProt.Text.Trim()+" 连接成功!\r\n");
            }
            else
            {
                if(intFofCount<=50)
                {
                    TH.SetLabelText(lbClientMsgTips, "连接失败");
                    TH.SetButtonEnabled(btClientSend, false);
                    TH.SetButtonEnabled(btCloseClient, false);
                   // TH.SetRichTextBoxADD(rtxtClientList, "远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 连接失败!\r\n");
                }
            }

            //关闭线程
            TH.StopThred(objGuid);
            locading.HideOpaqueLayer();
        }

        private void btClsoeServer_Click(object sender, EventArgs e)
        {
            Thread thread = new Thread(new ParameterizedThreadStart(ServerClose));
            TH.StartThread(thread);
        }
        /// <summary>
        /// 关闭服务器
        /// </summary>
        /// <param name="objGUID"></param>
        private void ServerClose(object objGUID)
        {
            ServerTCP.SendAll(this.StringServerClose);
            Thread.Sleep(500);
            ServerTCP.Stop();
            TH.SetButtonEnabled(btClsoeServer, false);
            TH.SetButtonEnabled(btStartServer, true);
            TH.SetButtonEnabled(btServerSend, false);
            TH.SetRichTextBoxADD(rtxtServerMsgList, "服务器关闭成功，端口：" + txtServerProt.Text.Trim() + " \r\n");
            ServerTCP = null;
            TH.StopThred(objGUID);
        }
        private void btCloseClient_Click(object sender, EventArgs e)
        {
            if (ClientTcp._isConnected)
            {
                ClientTcp.Close();
            }
            TH.SetButtonEnabled(btCloseClient, false);
            TH.SetButtonEnabled(btStartClient, true);
            TH.SetButtonEnabled(btClientSend, false);
            TH.SetRichTextBoxADD(rtxtClientList, "远程服务器：" + txtClientIP.Text.Trim() + @" 端口：" + txtClientProt.Text.Trim() + " 断开成功!\r\n");
        }

        /// <summary>
        /// 客户端发送消息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btClientSend_Click(object sender, EventArgs e)
        {
            string strClientMsg = txtClientMsg.Text.Trim();
            if(strClientMsg!=string.Empty)
            {

                ClientTcp.SendMsg(strClientMsg);
            }
            else
            {
                MessageBox.Show("消息为空");
            }
        }

        private void btServerSend_Click(object sender, EventArgs e)
        {
            string strMsg = txtServerMsg.Text;
            if(strMsg!=string.Empty)
            {
                ServerTCP.SendAll(strMsg);
            }
        }
    }
}
