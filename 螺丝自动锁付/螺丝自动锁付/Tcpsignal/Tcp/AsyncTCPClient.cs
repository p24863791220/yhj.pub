using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Threading;

namespace SignalCommunication.TCP
{
    internal partial class AsyncTCPClient : Component
    {


        #region 变量
        private static Stopwatch watch;
        private static System.Threading.Timer timer;
        public Socket mSocket = null;
        public string localIPAddress = "";
        public int localPort = 0;
        private string remoteIPAddress = "";
        private int remotePort = 0;
        private string keyID = "";
        private bool IsExit = false;
        private SocketObject so = new SocketObject();
        /// <summary>
        /// 是否进行了成功初始化
        /// </summary>
        public bool ISInitAndConnect = false;
        #endregion

        #region 变量属性

      
        /// <summary>
        /// Socket标志
        /// </summary>
        public string KeyID
        {
            get
            {
                return keyID;
            }
        }

        /// <summary>
        /// 本机地址
        /// </summary>
        public string LocalIPAddress
        {
            get
            {
                return localIPAddress;
            }
        }

        /// <summary>
        /// 本机端口
        /// </summary>
        public int LocalPort
        {
            get
            {
                return localPort;
            }
        }

        /// <summary>
        /// 主机地址
        /// </summary>
        private string _RemoteIPAddress;
        /// <summary>
        /// 主机地址
        /// </summary>
        public string RemoteIPAddress
        {
            get { return _RemoteIPAddress; }
            set { _RemoteIPAddress = value; }
        }

        /// <summary>
        /// 主机端口
        /// </summary>
        private string _RemotePort;
        /// <summary>
        /// 主机端口
        /// </summary>
        public string RemotePort
        {
            get { return _RemotePort; }
            set { _RemotePort = value; }
        }

        /// <summary>
        /// 消息的终止判断符
        /// </summary>
        public static string EndChar
        {
            get
            {
                return new string((char)0, 1);
            }
        }

        #endregion

        #region 代理委托

        /// <summary>
        /// Socket异常错误事件
        /// </summary>
        /// <param name="aKeyID">异常错误所有者的标志值</param>
        /// <param name="aErrorMessage">异常错误信息</param>
        public delegate void SocketErrorHandler(string aKeyID, string aErrorMessage);

        /// <summary>
        /// 接收二进制数据
        /// </summary>
        /// <param name="aData">接收到的数据</param>
        public delegate void BinaryDataAvailableHandler(byte[] aData);

        /// <summary>
        /// 接收字符串数据
        /// </summary>
        /// <param name="aData">接收到的数据</param>
        public delegate void StringDataAvailableHandler(string aData);

        /// <summary>
        /// 与服务器通讯断开, 但不需要进行重新连接，会进行自动连接
        /// </summary>
        public delegate void SocketDisconnectHandler();

        #endregion

        #region 事件声明
        /// <summary>
        /// Socket异常错误事件
        /// </summary>
        public event SocketErrorHandler OnSocketError;
        /// <summary>
        /// 接收二进制数据
        /// </summary>
        public event BinaryDataAvailableHandler OnBinaryDataAvailable;
        /// <summary>
        /// 接收字符串数据
        /// </summary>
        public event StringDataAvailableHandler OnStringDataAvailable;
        /// <summary>
        /// 与服务器通讯断开, 但不需要进行重新连接，会进行自动连接
        /// </summary>
        public event SocketDisconnectHandler OnSocketDisconnectHandler;
        #endregion

        #region 构造函数

        /// <summary>
        /// 实始化构造函数，True为进行直接初始化，False不进行初始化
        /// </summary>
        /// <param name="ISInitAndConnect">是否进行初始化</param>
        public AsyncTCPClient(bool ISInitAndConnect)
        {
            if (ISInitAndConnect)
            { 
                if(InitSocket())
                {
                    if (Connect())
                    {
                        //首次连接成功后的业务逻辑
                    }
                }
            }
        }
        /// <summary>
        /// 实始化构造函数
        /// </summary>
        public AsyncTCPClient()
        {
           
        }
        //public AsyncTCPClient(IContainer Container) {
        //    container.Add(this);

        //    InitializeComponent();
        //}

        #endregion


        #region 事件代理方法

        /// <summary>
        /// 显示异常错误信息
        /// </summary>
        /// <param name="aKeyID">异常错误所有者的标志值</param>
        /// <param name="aErrorMessage">异常错误信息</param>
        private void DisplayError(string aKeyID, string aErrorMessage)
        {
            if (OnSocketError != null)
            {
                OnSocketError(aKeyID, aErrorMessage);
            }
        }

        /// <summary>
        /// 接收二进制数据
        /// </summary>
        /// <param name="aData">接收到的数据</param>
        private void BinaryDataAvailable(byte[] aData)
        {
            if (OnBinaryDataAvailable != null)
            {
                OnBinaryDataAvailable(aData);
            }
        }

        /// <summary>
        /// 接收字符串数据
        /// </summary>
        /// <param name="aData">接收到的数据</param>
        private void StringDataAvailable(string aData)
        {
            if (OnStringDataAvailable != null)
            {
                OnStringDataAvailable(aData);
            }
        }

        #endregion

        #region 内部方法

        /// <summary>
        /// 异步接收数据
        /// </summary>
        /// <param name="ar">IAsyncResult接口对象</param>
        private void AsyncDataReceive(IAsyncResult ar)
        {
            SocketObject so = (SocketObject)ar.AsyncState;
            try
            {
                if (IsExit == false)
                {
                    int iReceiveCount = so.WorkSocket.EndReceive(ar);
                    if (iReceiveCount > 0)
                    {
                        so.sbBuffer.Append(Encoding.UTF8.GetString(so.Buffer, 0, iReceiveCount));
                        string strReceive = so.sbBuffer.ToString();
                        if (strReceive.Substring(strReceive.Length - 1, 1) == EndChar)
                        {
                            //本次接收
                            strReceive = strReceive.Remove(strReceive.Length - 1, 1);
                            //调用外部用户接口方法
                            BinaryDataAvailable(Encoding.UTF8.GetBytes(strReceive));
                            StringDataAvailable(strReceive);
                            //清空数据
                            so.sbBuffer.Remove(0, so.sbBuffer.Length);
                        }
                        if (IsExit == false)
                        {
                            so.WorkSocket.BeginReceive(so.Buffer, 0, so.Buffer.Length, SocketFlags.None, new AsyncCallback(AsyncDataReceive), so);
                        }
                    }
                    else
                    {
                        Disconnect();
                    }
                }
                else
                {
                    Disconnect();
                }
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
        }

        /// <summary>
        /// 异步发送消息
        /// </summary>
        /// <param name="ar">IAsyncResult接口对象</param>
        private void AsyncSend(IAsyncResult ar)
        {
            try
            {
                int iSendCount = mSocket.EndSend(ar);
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
        }

        /// <summary>
        /// 发送消息(异步发送)
        /// </summary>
        /// <param name="aData">要发送的消息</param>
        private void Send(byte[] aData)
        {
            try
            {
                mSocket.BeginSend(aData, 0, aData.Length, SocketFlags.None, new AsyncCallback(AsyncSend), null);
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
        }

        private void AsyncConnect(IAsyncResult ar)
        {
            Socket sock = (Socket)ar.AsyncState;
            try
            {
                sock.EndConnect(ar);
                if (sock.Connected)
                {
                    //启动消息接收事件
                    so.KeyID = KeyID;
                    so.WorkSocket = sock;
                    if (IsExit == false)
                    {
                        so.WorkSocket.BeginReceive(so.Buffer, 0, so.Buffer.Length, SocketFlags.None, new AsyncCallback(AsyncDataReceive), so);
                    }
                }
                else
                {
                    new Exception("Unable to connect to remote machine, Connect Failed!");
                }
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
        }

        #endregion

        #region 对外开发的接口方法

        /// <summary>
        /// 初始化本机Socket通信机制
        /// </summary>
        /// <param name="aLocalIPAddress">本机地址</param>
        /// <param name="aLocalPort">本机端口</param>
        /// <returns>返回操作是否成功</returns>
        public bool InitSocket(string aLocalIPAddress, int aLocalPort)
        {
            bool bActive = false;
            mSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            LingerOption lo = new LingerOption(false, 10);
            mSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.Linger, lo);
            try
            {
                IPAddress ip = Dns.GetHostAddresses(aLocalIPAddress)[0];
                localIPAddress = ip.ToString();
                localPort = GetPort();
                IPEndPoint ipe = new IPEndPoint(ip, aLocalPort);
                keyID = Guid.NewGuid().ToString();
                mSocket.Bind(ipe);
                bActive = true;
            }
            catch (Exception ex)
            {
                bActive = false;
                DisplayError(KeyID, ex.Message);
            }
            return bActive;
        }
        /// <summary>
        /// 初始化本机Socket通信机制
        /// </summary>
        /// <param name="aLocalIPAddress">本机地址</param>
        /// <returns>返回操作是否成功</returns>
        public bool InitSocket(string aLocalIPAddress)
        {
            bool bActive = false;
            mSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            LingerOption lo = new LingerOption(false, 10);
            mSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.Linger, lo);
            try
            {
                IPAddress ip = Dns.GetHostAddresses(aLocalIPAddress)[0];
                localIPAddress = ip.ToString();
                localPort = GetPort();
                IPEndPoint ipe = new IPEndPoint(ip, localPort);
                keyID = Guid.NewGuid().ToString();
                mSocket.Bind(ipe);
                bActive = true;
            }
            catch (Exception ex)
            {
                bActive = false;
                DisplayError(KeyID, ex.Message);
            }
            return bActive;
        }

        /// <summary>
        /// 初始化本机Socket通信机制
        /// </summary>
        /// <returns>返回操作是否成功</returns>
        public bool InitSocket()
        {

            bool bActive = false;

            mSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            LingerOption lo = new LingerOption(false, 10);
            mSocket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.Linger, lo);
            try
            {

                //IPAddress ip = IPAddress.Parse(GetAddressIP());
                IPAddress ip = IPAddress.Parse(GetAddressIP());
                localIPAddress = ip.ToString();
                localPort = GetPort();
                IPEndPoint ipe = new IPEndPoint(ip, localPort);
                keyID = Guid.NewGuid().ToString();
                mSocket.Bind(ipe);
                System.Threading.Thread.Sleep(1000);
                bActive = true;
            }
            catch (Exception ex)
            {
                bActive = false;
                DisplayError(KeyID, ex.Message);
            }
            return bActive;
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

        /// <summary>
        /// 连接远程主机
        /// </summary>
        /// <param name="aRemoteIPAddress">主机地址</param>
        /// <param name="aRemotePort">主机端口</param>
        /// <returns>返回操作是否成功</returns>
        internal bool Connect(string aRemoteIPAddress, int aRemotePort)
        {
            if (mSocket == null)
                return false;
            try
            {
                remoteIPAddress = aRemoteIPAddress;
                remotePort = aRemotePort;
                mSocket.Blocking = false;
                mSocket.BeginConnect(remoteIPAddress, remotePort, new AsyncCallback(AsyncConnect), mSocket);
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
            return mSocket.Connected;
        }
       
        /// <summary>
        /// 连接远程主机,在连接前请设置远程服务器的地址与端口，如配置将返回失败
        /// </summary>
        /// <returns>返回操作是否成功</returns>
        internal bool Connect()
        {
          
            this.RemoteIPAddress = System.Configuration.ConfigurationManager.AppSettings["AsyncTCPServer"];
            this.RemotePort = System.Configuration.ConfigurationManager.AppSettings["AsyncTCPProt"];
            if (this.RemoteIPAddress == null || this.RemotePort == null || this.RemoteIPAddress == "" || this.RemotePort == "")
            {
                return false;
            }
            string aRemoteIPAddress = this.RemoteIPAddress;
            int aRemotePort = int.Parse(this.RemotePort);
            if (mSocket == null)
                return false;
            try
            {
                //阻塞器
                watch = new Stopwatch();
                SignalCommunication.TCP.Timeout timeout = new SignalCommunication.TCP.Timeout();
                timeout.Do = new AsyncTCPClient().DoSomething;
                watch.Start();
                timer = new System.Threading.Timer(timerCallBack, null, 0, 1000);


                ///开始连接服务器
                remoteIPAddress = aRemoteIPAddress;
                remotePort = aRemotePort;
                //mSocket.Blocking = false;
                IPEndPoint remoteEp = new IPEndPoint(IPAddress.Parse(remoteIPAddress), remotePort);
                //mSocket.Connect(remoteEp);
                mSocket.BeginConnect(remoteEp, new AsyncCallback(AsyncConnect), mSocket);
                mSocket.Blocking = false;
                //while (mSocket.Connected == false || ConnectFor>60)
                //{
                //    System.Threading.Thread.Sleep(1000);
                //    ConnectFor++;
                //}
                ///设置阻塞时长，一分钟，没有一分钟没有成功，即超时，一分钟内成功，马上停止
                bool bo = timeout.DoWithTimeout(new TimeSpan(0, 0, 0, 60));

                //清除阻塞器
                timerCallBack(null);
                watch.Stop();
                timer.Dispose();
                
            }
            catch (Exception ex)
            {
                DisplayError(KeyID, ex.Message);
            }
            if (mSocket.Connected)
            {
                ISInitAndConnect = true;
            }
            else
            { 
               while(Connect()==false)
               {
                   ISInitAndConnect = false;
                   System.Threading.Thread.Sleep(5000);
               }
            }
            ISInitAndConnect = mSocket.Connected;
            return mSocket.Connected;
        }
        /// <summary>
        /// 正在连接远程服务器时界面处理业务逻辑
        /// </summary>
        /// <param name="obj">对象</param>
        private static void timerCallBack(object obj)
        {
            //string str = "";
            ////
            // Console.WriteLine(string.Format("运行时间:{0}秒", watch.Elapsed.TotalSeconds.ToString("F2")));
        }
        /// <summary>
        /// 线程休眠
        /// </summary>
        public void DoSomething()
        {
            try
            {
                if (mSocket.Connected == false)
                {
                    // 休眠 5秒  
                    System.Threading.Thread.Sleep(new TimeSpan(0, 0, 0, 1));
                }
            }
            catch
            {
                System.Threading.Thread.Sleep(new TimeSpan(0, 0, 0, 1));
            }
        }
        /// <summary>
        /// 断开与主机的连接
        /// </summary>
        /// <returns></returns>
        public bool Disconnect()
        {
            try
            {
                if (mSocket != null)
                {
                    if (mSocket.Connected)
                    {
                        mSocket.Shutdown(SocketShutdown.Both);
                        mSocket.Close();
                        mSocket = null;
                      
                    }
                    else
                    {
                        mSocket = null;
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                DisplayError(keyID, ex.Message);
                return false;
            }
        }

        /// <summary>
        /// 发送消息(异步发送)
        /// </summary>
        /// <param name="aMessage">要发送的消息</param>
        internal void Send(string aMessage)
        {
            string strMessage = aMessage;
            //判断要发送的消息是不是以消息终止判断符号结尾，如果没有则自动加上
            if (strMessage.Substring(strMessage.Length - 1, 1) != EndChar)
            {
                strMessage = strMessage + EndChar;
            }
            Send(Encoding.UTF8.GetBytes(strMessage));
        }

        /// <summary>
        /// 发送消息(异步发送)
        /// </summary>
        /// <param name="aMessage">要发送的消息</param>
        internal void Send(byte[] aMessage, int aMessageLength)
        {
            StringBuilder SendBuffer = new StringBuilder();
            SendBuffer.Append(Encoding.UTF8.GetString(aMessage, 0, aMessageLength));
            string strSend = SendBuffer.ToString();
            Send(strSend);
        }

        #endregion

    }
    /// <summary>
    /// 客户端成员对象
    /// </summary>
    public class SocketObject
    {
        public string KeyID = "";
        public Socket WorkSocket = null;
        public const int BufferSize = 65350;
        public byte[] Buffer = new byte[BufferSize];
        public StringBuilder sbBuffer = new StringBuilder();
    }
}