using System;
using System.Net;
using System.Net.Sockets;


namespace SignalCommunication.TCP
{
    /// <summary>
    /// 通信的消息对象
    /// </summary>
    public class SocketInfo : IDisposable
    {
        public Socket socket = null;
        public byte[] buffer = null;
        public SocketInfo()
        {
            buffer = new byte[1024];
        }

        public void Dispose()
        {
           this.socket = null;
           this.buffer=null;
            GC.Collect();
            GC.SuppressFinalize(this);
        }
    }
}
