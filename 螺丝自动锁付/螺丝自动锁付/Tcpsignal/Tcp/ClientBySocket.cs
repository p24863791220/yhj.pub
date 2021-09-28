using System;
using System.Configuration;
using System.Net;
using System.Net.Sockets;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SignalCommunication.TCP
{
    public class SocketClientManager:IDisposable
    {
        #region 初始化全局参数

        #region 自定义事件
        /// <summary>
        /// 连接成功事件
        /// </summary>
        public delegate void OnConnectedHandler();
        /// <summary>
        /// 连接成功事件
        /// </summary>
        public event OnConnectedHandler OnConnected;
        /// <summary>
        /// 连接失败事件
        /// </summary>
        public event OnConnectedHandler OnFaildConnect;
        /// <summary>
        /// 接收到消息事件
        /// </summary>
        public delegate void OnReceiveMsgHandler(string strMsgInfo);
        /// <summary>
        /// 接收到消息事件
        /// </summary>
        public event OnReceiveMsgHandler OnReceiveMsg;
        /// <summary>
        /// 服务器断开事件
        /// </summary>
        public delegate void OnServerDisconnected();
        /// <summary>
        /// 服务器断开事件
        /// </summary>
        public event OnServerDisconnected onServerDisconnected;
        /// <summary>
        /// 读取数据时发生错误事件
        /// </summary>
        public delegate void OnSocketErrorevent(SocketException ErrorInfo);
        /// <summary>
        /// /// <summary>
        /// 读取数据时发生错误事件
        /// </summary>
        /// </summary>
        public event OnSocketErrorevent SocketErrorevent;
        /// <summary>
        /// 通信超时事件,设置的超时时间不进行通信，将进行重新连接,时间默认为一分钟,如需修改超时时间，请设置CommuuicationOutTim属性
        /// </summary>
        public delegate void OnCommuuicationOutTimeEvent();
        /// <summary>
        /// 通信超时事件,设置的超时时间不进行通信，将进行重新连接,时间默认为一分钟,如需修改超时时间，请设置CommuuicationOutTim属性
        /// </summary>
        public event OnCommuuicationOutTimeEvent OnCommuuicationOutTime;
        #endregion 结束自定义事件

        /// <summary>
        /// 当前异步连接的通信对象
        /// </summary>
        private Socket _socket = null;
        /// <summary>
        /// 连接的终点
        /// </summary>
        private EndPoint _endPointendPoint = null;
        /// <summary>
        /// 消息对象
        /// </summary>
        public SocketInfo socketInfo = new SocketInfo();
        /// <summary>
        /// 当前连接状态
        /// </summary>
        public bool _isConnected = false;
        /// <summary>
        /// 消息是否已经接收完成
        /// </summary>
        private bool IsOKMsg = false;
        /// <summary>
        /// 通信线程对象
        /// </summary>
        private Thread socketClientThread;
        /// <summary>
        /// 设置的超时时间,单位为钞,该时间不进行通信，将进行重新连接,时间默认为一分钟,单位为钞
        /// </summary>
        public int CommuuicationOutTim { get; set; }
        /// <summary>
        /// 定时检测并执行,用于从服务器是否通信超进
        /// </summary>
        private System.Timers.Timer ExecTime = new System.Timers.Timer();
        /// <summary>
        /// 设置超时的数值，用于检测是否超时
        /// </summary>
        private int Intwhile = 0;
        /// <summary>
        /// 线程停止时间
        /// </summary>
        private int IntSleep = 5;
        /// <summary>
        /// 计算超时循环的次数
        /// </summary>
        private int IntOutTimeFor = 0;
        /// <summary>
        /// 验证心跳包是否成功
        /// </summary>
        private bool BoolVerifyHeartbeatPacket=false;
        /// <summary>
        /// 服务器断开连接时向客户端发送的消息数据,文本内容详见配置文件ServerClose节点
        /// </summary>
        private string ServerClose { get; set; }
        /// <summary>
        /// 客户端心跳包消息文本,文本内容详见配置文件ClientHeartbeatPpacketMsg节点
        /// </summary>
        private string ClientHeartbeatPpacketMsg { get; set; }
        /// <summary>
        /// 客户端用于心跳包消息的验证文本,文本内容详见配置文件ClientHeartbeatPpacketVerificationMsg节点
        /// </summary>
        private string ClientHeartbeatPpacketVerificationMsg { get; set; }
        /// <summary>
        /// 是否订时验证心跳包,如果开启验证，默认为3秒验证一次，如需更改，请设置BoolVerifyHeartbeatPacketTime属性
        /// </summary>
        public bool IsBoolVerifyHeartbeatPacket { get; set; }
        /// <summary>
        /// 心跳包验证时间，单位：毫秒,默认为3秒验证一次
        /// </summary>
        public double BoolVerifyHeartbeatPacketTime { get; set; }
        /// <summary>
        /// 本机的第一块网卡的IP地址
        /// </summary>
        public string LocalIP { get;private set; }
        #endregion 结束初始化全局参数

        /// <summary>
        /// 初始化本地客户端
        /// </summary>
        /// <param name="ip">远程服务器的IP地址</param>
        /// <param name="port">远程服务器的通信端口</param>
        public SocketClientManager(string ip, int port)
        {
            this.CommuuicationOutTim = 60;
            this.Intwhile = 0;
            IPAddress _ip = IPAddress.Parse(ip);
            _endPointendPoint = new IPEndPoint(_ip, port);
            _socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            this.IsBoolVerifyHeartbeatPacket = false;
            this.BoolVerifyHeartbeatPacketTime = 3000;
            LocalIP = GetAddressIP();
        }
        /// <summary>
        /// 关闭当前连接
        /// </summary>
        public void Close()
        {
            if (IsBoolVerifyHeartbeatPacket)
            {
                //关闭订时器
                ExecTime.Enabled = false;
                ExecTime.Interval = BoolVerifyHeartbeatPacketTime;
                ExecTime.AutoReset = false;
                ExecTime.Elapsed -= new System.Timers.ElapsedEventHandler(ExecTime_Tick);
                ExecTime.Stop();
            }

            if (socketClientThread != null)
            {
                socketClientThread.Abort();
            }
            _isConnected = false;
            _socket.Close();
           
        }
        /// <summary>
        /// 启动本地客户端
        /// </summary>
        public void Start()
        {
            _socket.BeginConnect(_endPointendPoint, ConnectedCallback, _socket);
            _isConnected = true;
             socketClientThread = new Thread(SocketClientReceive);
            socketClientThread.IsBackground = true;
            socketClientThread.Priority = ThreadPriority.Highest;
            socketClientThread.Start();

            this.ServerClose = ConfigurationManager.AppSettings["ServerClose"];
            this.ClientHeartbeatPpacketMsg = ConfigurationManager.AppSettings["ClientHeartbeatPpacketMsg"];
            this.ClientHeartbeatPpacketVerificationMsg = ConfigurationManager.AppSettings["ClientHeartbeatPpacketVerificationMsg"];

            this.IntOutTimeFor = (int)(CommuuicationOutTim * 1000 / IntSleep);

            if (IsBoolVerifyHeartbeatPacket)
            {
                //设置内部订时器
                ExecTime.Enabled = true;
                ExecTime.Interval = BoolVerifyHeartbeatPacketTime;
                ExecTime.AutoReset = true;
                ExecTime.Elapsed += new System.Timers.ElapsedEventHandler(ExecTime_Tick);
                ExecTime.Start();
            }

        }
      
        /// <summary>
        /// 开始异步通信入口
        /// </summary>
        private void SocketClientReceive()
        {
                while (_isConnected)
                {
                    try
                    {
                        SocketInfo _socketInfo = new SocketInfo();
                        _socket.BeginReceive(_socketInfo.buffer, 0, _socketInfo.buffer.Length, SocketFlags.None, ReceiveCallback, _socketInfo);
                        while (this.IsOKMsg==false)
                        {
                            this.Intwhile++;
                            Thread.Sleep(IntSleep);
                            if (IntOutTimeFor <= Intwhile)
                            {
                                ClientAuthenticationAndReconnection();
                                break;
                            }
                        }
                        this.Intwhile = 0;
                        this.IsOKMsg = false;
                    }
                    catch (SocketException ex)
                    {
                        if (SocketErrorevent != null)
                        {
                            SocketErrorevent(ex);
                        }
                    }
                }
        }
        /// <summary>
        /// 客户端验证并重新连接
        /// </summary>
        private void ClientAuthenticationAndReconnection()
        {
            //客户端尝试发送心跳包到服务器，用于验证是否真正失去了连接
            this.SendMsg(this.ClientHeartbeatPpacketMsg);
            int _IntBoolVerifyHeartbeatPacketWhile = 0;
            this.BoolVerifyHeartbeatPacket = false;
            while (this.BoolVerifyHeartbeatPacket == false && _IntBoolVerifyHeartbeatPacketWhile <= 200)
            {
                _IntBoolVerifyHeartbeatPacketWhile++;
                Thread.Sleep(IntSleep);
            }

            //验证心跳包失败，为真正没有办法通信，需要进行重新连接
            if (BoolVerifyHeartbeatPacket == false)
            {
                //关闭连接，并进行重新连接
                this._socket.Close();
                this._socket.Dispose();
                this._socket = null;
                this._isConnected = false;
                for (int i = 0; i < 6 && this._isConnected == false; i++)
                {
                    if (_socket == null)
                    {
                        this._socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream,ProtocolType.Tcp);
                    }
                    if (OnCommuuicationOutTime != null)
                    {
                        OnCommuuicationOutTime();
                    }
                    //重新连接
                    this._socket.BeginConnect(_endPointendPoint, ConnectedCallback, _socket);
                    Thread.Sleep(10000);
                }
            }
        }
        /// <summary>
        /// 开始异步读取消息
        /// </summary>
        /// <param name="ar">数据对象</param>
        private  void ReceiveCallback(IAsyncResult ar)
        {
            //int read = _socket.EndReceive(ar);
            //SocketInfo _socketInfo=(SocketInfo) ar.AsyncState;
            // _socketInfo.Dispose();
            using (this.socketInfo = ar.AsyncState as SocketInfo)
            {
                if (this.OnReceiveMsg != null)
                {
                    string strMsg = Encoding.UTF8.GetString(this.socketInfo.buffer).Replace("\0", "");
                    if (strMsg == this.ServerClose)
                    {
                        if (onServerDisconnected != null)
                        {
                            //服务器断开
                            onServerDisconnected();
                            this.BoolVerifyHeartbeatPacket = false;
                        }
                    }
                    else
                    {
                        if (strMsg == this.ClientHeartbeatPpacketVerificationMsg)
                        {
                            this.BoolVerifyHeartbeatPacket = true;
                        }
                        else
                        {
                            if (string.Empty.Equals(strMsg))
                            {
                                return;
                            }
                            else
                            {
                                OnReceiveMsg(strMsg);
                            }
                        }
                    }
                }
            }
            //每条消息接收完成，更改标识，必须，要不然不能接收一下条数据
            this.IsOKMsg = true;
        }
        /// <summary>
        /// 开始连接异步方法
        /// </summary>
        /// <param name="ar">对象</param>
        private void ConnectedCallback(IAsyncResult ar)
        {
            Socket socket = ar.AsyncState as Socket;
            if (socket.Connected)
            {
                if (this.OnConnected != null)
                {
                    OnConnected();
                    this._isConnected = true;
                }
            }
            else
            {
                if (this.OnFaildConnect != null)
                {
                    OnFaildConnect();
                    this._isConnected = false;
                }
            }
        }
        /// <summary>
        /// 以UTF8编码发送消息
        /// </summary>
        /// <param name="msg">消息文本</param>
        public void SendMsg(string msg)
        {
            if (_socket.Connected)
            {
                byte[] buffer = Encoding.UTF8.GetBytes(msg);
                _socket.Send(buffer);
            }
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
        /// <summary>
        /// 获取当前可用的端口号
        /// </summary>
        /// <returns>得到的端口号</returns>
        private int GetPort()
        {
            long tick = DateTime.Now.Ticks;
            Random ran = new Random((int)(tick & 0xffffffffL) | (int)(tick >> 32));
            int aLocalPort = ran.Next(10000, 65535);
            if (PortInUse(aLocalPort))
            {
                GetPort();
            }
            return aLocalPort;
        }
        /// <summary>
        /// 判断当前端口号是否被占用
        /// </summary>
        /// <param name="port">端口号</param>
        /// <returns>结果true占用 ，false没有占用</returns>
        private bool PortInUse(int port)
        {
            bool inUse = false;
            System.Net.NetworkInformation.IPGlobalProperties ipProperties = System.Net.NetworkInformation.IPGlobalProperties.GetIPGlobalProperties();
            IPEndPoint[] ipEndPoints = ipProperties.GetActiveTcpListeners();

            foreach (IPEndPoint endPoint in ipEndPoints)
            {
                if (endPoint.Port == port)
                {
                    inUse = true;
                    break;
                }
            }
            return inUse;
        }
        #region 订时器执行入口
        /// <summary>
        /// 定时检测,并且执行
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void ExecTime_Tick(object source, System.Timers.ElapsedEventArgs e)
        {
            if (this._isConnected&&_socket.Connected)
            {
                //客户端尝试发送心跳包到服务器，用于验证是否真正失去了连接
                this.SendMsg(this.ClientHeartbeatPpacketMsg);
            }
        }
        #endregion 结束订时器执行入口
        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            if (_isConnected)
            {
                this.Close();
            }
            GC.Collect();
            GC.SuppressFinalize(this);
        }
    }
}
