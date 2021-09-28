//using System;
//using System.Text;




//namespace SignalCommunication.TCP
//{
//    /// <summary>
//    /// TCP帮助类
//    /// </summary>
//    public class TCPHelper
//    {
//        #region  初始化全局参数
//        /// <summary>
//        /// 网络心跳包，用于客户端与服务端通讯，客戶端連接對象
//        /// </summary>
//        private SocketClientManager NetworkResponseClientTcp = null;
//        /// <summary>
//        /// TCP服务器对象 
//        /// </summary>
//        private AsyncTcpServer TCPserver;  ///TCP服务器对象 
//        /// <summary>
//        /// 服务器响应时间
//        /// </summary>
//        private int NetworkResponseTime = 100000;
//        /// <summary>
//        /// 上一个心跳包的发送时间
//        /// </summary>
//        private DateTime ThisSendDate = DateTime.Now;
//        /// <summary>
//        /// 是否成功初始化
//        /// </summary>
//        private bool ISLoadOk = false;
//        #endregion  结束初始化全局参数

//        #region 初始化
//        /// <summary>
//        /// 初始化
//        /// </summary>
//        public TCPHelper()
//        {
//            try
//            {
//                InitSocket();
//                ISLoadOk = true;
//            }
//            catch (Exception ex)
//            {
//                UnhandledExceptionEventArgs unhan = new UnhandledExceptionEventArgs(ex, false);
//                ErrorHelper.CurrentDomain_UnhandledException(null, unhan);
//            }
//        }
//        /// <summary>
//        /// 初始化連接
//        /// </summary>
//        public void InitSocket()
//        {
//            if(NetworkResponseClientTcp!=null)
//            {
//                NetworkResponseClientTcp.Close();
//                NetworkResponseClientTcp = null;
//            }

//            string strIPAddress = System.Configuration.ConfigurationManager.AppSettings["AsyncTCPServer"];
//            int intPort = int.Parse(System.Configuration.ConfigurationManager.AppSettings["AsyncTCPProt"]);
//            NetworkResponseClientTcp = new SocketClientManager(strIPAddress, intPort);
//            NetworkResponseClientTcp.OnReceiveMsg += NetworkResponseClientTcpOnReceiveMsg;
//            NetworkResponseClientTcp.OnConnected += NetworkResponseClientTcpOnConnected;
//            NetworkResponseClientTcp.OnFaildConnect += NetworkResponseClientTcpOnFaildConnect;
//            NetworkResponseClientTcp.Start();

//            if (ISLoadOk == false)
//            {
//                //加载TCP服务器
//                LoadServer();
//            }
//        }
//        /// <summary>
//        /// 初始化TCP服务端
//        /// </summary>
//        private void LoadServer()
//        {
//            while (HMIHelper.communicationInfo == null)
//            {
//                System.Threading.Thread.Sleep(10);
//            }
//            if (HMIHelper.communicationInfo != null)
//            {
                
//                    if (HMIHelper.communicationInfo.Port==0)
//                    {
//                        HMIHelper.communicationInfo.Port = 9666;
//                    }
//                    TCPserver = new AsyncTcpServer(HMIHelper.communicationInfo.Port);
//                    TCPserver.Encoding = Encoding.UTF8;

//                    TCPserver.ClientConnected += new EventHandler<TcpClientConnectedEventArgs>(TCPserver_ClientConnected);
//                    TCPserver.ClientDisconnected += new EventHandler<TcpClientDisconnectedEventArgs>(TCPserver_ClientDisconnected);
//                    //server.PlaintextReceived +=
//                    //  new EventHandler<TcpDatagramReceivedEventArgs<string>>(server_PlaintextReceived);
//                    TCPserver.DatagramReceived += new EventHandler<TcpDatagramReceivedEventArgs<byte[]>>(TCPserver_PlainbyteReceived);
//                    TCPserver.Start(500);
//                    Status.SetEventRealTimeStatus(State.LocalServerOpen);
//            }
//            else
//            {
//                Status.SetEventRealTimeStatus(State.LocalServerGateway);
//                ErrorHelper.WriteLog("初始化TCP服务器时，服务器端口为空");
//            }
//        }
//        #endregion 结束初始化

//        #region 客户端接收TCP事件与TCP通讯错误逻辑
//        /// <summary>
//        /// 接收到消息
//        /// </summary>
//        public void NetworkResponseClientTcpOnReceiveMsg()
//        {
//            byte[] buffer = NetworkResponseClientTcp.socketInfo.buffer;
//            string msg = Encoding.ASCII.GetString(buffer).Replace("\0", "");
//            if (string.Empty.Equals(msg)) { return; }
//            else
//            {
//                if (msg.IndexOf("Date:") >= 0)
//                {
//                    ///心跳包
//                    GetMillisecond(ThisSendDate, GetDateTime(msg.Replace("Date:", "")));
//                }
//                else
//                {
//                    //接收到了通信类消息

//                }
//            }

//        }
//        /// <summary>
//        /// 用于发送通信消息
//        /// </summary>
//        /// <param name="command">消息命令对象</param>
//        public void SendMsg(Mes.BLL.TCP.Command command)
//        {

//        }
//        /// <summary>
//        /// 带毫秒的字符转换成时间（DateTime）格式
//        /// 可处理格式：[2014-10-10 10:10:10,666 或 2014-10-10 10:10:10 666]
//        /// </summary>
//        private DateTime GetDateTime(string dateTime)
//        {
//            string[] strArr = dateTime.Split(new char[] { '-', ' ', ':', ',' });
//            DateTime dt = new DateTime(int.Parse(strArr[0]),
//                int.Parse(strArr[1]),
//                int.Parse(strArr[2]),
//                int.Parse(strArr[3]),
//                int.Parse(strArr[4]),
//                int.Parse(strArr[5]),
//                int.Parse(strArr[6]));
//            return dt;
//        }
//        private void NetworkResponseClientTcpOnConnected()
//        {

//        }

//        private void NetworkResponseClientTcpOnFaildConnect()
//        {

//        }
//        #endregion 结束客户端接收TCP事件与TCP通讯错误逻辑
         
//        #region TCP服务器事件处理
//        /// <summary>
//        ///  TCP客户端建立新的连接时事件
//        /// </summary>
//        /// <param name="sender"></param>
//        /// <param name="e"></param>
//        private void TCPserver_ClientConnected(object sender, TcpClientConnectedEventArgs e)
//        {
//            TCPserver.Send(e.TcpClient, "Connection Success");
//        }
//        /// <summary>
//        ///  TCP设备与服务器断开事件
//        /// </summary>
//        /// <param name="sender"></param>
//        /// <param name="e"></param>
//        private void TCPserver_ClientDisconnected(object sender, TcpClientDisconnectedEventArgs e)
//        {
//        }
//        /// <summary>
//        ///  TCP客户端向服务器发送数据时事件
//        /// </summary>
//        /// <param name="sender"></param>
//        /// <param name="e"></param>
//        private void TCPserver_PlainbyteReceived(object sender, TcpDatagramReceivedEventArgs<byte[]> e)
//        {
//            lock (new object())
//            {
//                //string strMsg = System.Text.Encoding.UTF8.GetString(e.Datagram);
//                //Mes.BLL.ErrorHelper.WriteLog(strMsg);
//                //if (strMsg.IndexOf("Heartbeat") >= 0)///当前消息为心跳包时，业务逻辑
//                //{
//                //    TCPserver.Send(e.TcpClient, "Date:" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss fff"));
//                //}
//            }
//        }

//        #endregion 结束TCP服务器事件处理

//        #region 服务器响应时间业务逻辑
//        /// <summary>
//        /// 获取二个时间之间的时间间隔
//        /// </summary>
//        /// <param name="dateBegin">开始时间</param>
//        /// <param name="dateEnd">结束时间</param>
//        /// <returns></returns>
//        private void GetMillisecond(DateTime dateBegin, DateTime dateEnd)
//        {
//            TimeSpan ts1 = new TimeSpan(dateBegin.Ticks);
//            TimeSpan ts2 = new TimeSpan(dateEnd.Ticks);
//            TimeSpan ts3 = dateEnd - dateBegin;
//            NetworkResponseTime = ts3.Minutes * 60 * 1000 + ts3.Seconds * 1000 + ts3.Milliseconds;

//            HMIHelper.NowDateTime = dateEnd;
//            //if(HMIHelper.ISSeverDateTime==false)
//            //{
//            //    HMIHelper.NowDateTime = dateEnd;
//            //    HMIHelper.ISSeverDateTime = true;
//            //}
//        }
//        /// <summary>
//        /// 获取连接的状态
//        /// </summary>
//        /// <returns></returns>
//        public bool GetSocketConnected()
//        {
//            return NetworkResponseClientTcp._isConnected;
//        }
//        /// <summary>
//        /// 获取服务器响应时间
//        /// </summary>
//        /// <returns>响应时间</returns>
//        public int GetNetworkResponseTime()
//        {
//            if (NetworkResponseClientTcp._isConnected)
//            {
//                Status.SetEventRealTimeStatus(State.LocalClientsOpen);
//                ///向服务器发送心跳包
//                NetworkResponseClientTcp.SendMsg("Heartbeat");
//                ThisSendDate = HMIHelper.NowDateTime;
//                return NetworkResponseTime;
//            }
//            else
//            {
//                Status.SetEventRealTimeStatus(State.LocalServerGateway);
//                InitSocket();//重新初始化
//                ///向服务器发送心跳包
//                NetworkResponseClientTcp.SendMsg("Heartbeat");
//                ThisSendDate = HMIHelper.NowDateTime;
//                return NetworkResponseTime;
//            }
//        }
//        #endregion 结束服务器响应时间业务逻辑
//    }
//}
