using System;
using System.Net;
using System.Net.Sockets;

namespace SignalCommunication.TCP
{

    /// <summary>
    /// Internal class to join the TCP client and buffer together
    /// for easy management in the server
    /// </summary>
    public class TcpClientState
    {
        /// <summary>
        /// Constructor for a new Client
        /// </summary>
        /// <param name="tcpClient">The TCP client</param>
        /// <param name="buffer">The byte array buffer</param>
        public TcpClientState(TcpClient tcpClient, byte[] buffer)
        {
            if (tcpClient == null)
                throw new ArgumentNullException("tcpClient");
            if (buffer == null)
                throw new ArgumentNullException("buffer");
            tcpClient.ReceiveBufferSize = 65365;
            this.TcpClient = tcpClient;
            this.Buffer = buffer;
        }
        public int MsgConn { get; set; }
        /// <summary>
        /// Gets the TCP Client
        /// </summary>
        public TcpClient TcpClient { get; private set; }

        /// <summary>
        /// Gets the Buffer.
        /// </summary>
        public byte[] Buffer { get; private set; }

        /// <summary>
        /// Gets the network stream
        /// </summary>
        public NetworkStream NetworkStream
        {
           
            get {
                if (TcpClient.Connected)
                {
                    return TcpClient.GetStream();
                }
                else
                {
                    System.Net.Sockets.NetworkStream netstream = null;
                    return netstream;
                }
            }
        }
      
    }

}
