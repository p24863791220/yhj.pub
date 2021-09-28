//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Windows.Forms;
//using System.Drawing;

//namespace 螺丝自动锁付
//{
//    class PlayVideo
//    {

//        #region Field
//        / <summary>
//        / 相机IP地址.
//        / </summary>
//        private string _ip;

//        / <summary>
//        / 相机IP地址.
//        / </summary>
//        private string _port;

//        / <summary>
//        / 相机用户名.
//        / </summary>
//        private string _user;

//        / <summary>
//        / 密码.
//        / </summary>
//        private string _pw;

//        / <summary>
//        / 显示窗口.
//        / </summary>
//        private PictureBox _wnd;
//        #endregion


//        #region Property
//        / <summary>
//        / Specify to what level the sent settings will be reflected(LJV7IF_SETTING_DEPTH).
//        / </summary>
//        public string IP
//        {
//            get { return _ip; }
//            set { _ip = value; }
//        }

//        / <summary>
//        / Specify to what level the sent settings will be reflected(LJV7IF_SETTING_DEPTH).
//        / </summary>
//        public string Port
//        {
//            get { return _port; }
//            set { _port = value; }
//        }

//        / <summary>
//        / Identify the item that is the target to send.
//        / </summary>
//        public string User
//        {
//            get { return _user; }
//            set { _user = value; }
//        }
//        / <summary>
//        / Specify the buffer that stores the setting data to send.
//        / </summary>
//        public string Pw
//        {
//            get { return _pw; }
//            set { _pw = value; }
//        }
//        public PictureBox Wnd
//        {
//            get { return _wnd; }
//            set { _wnd = value; }
//        }
//        #endregion
//        private bool m_bInitSDK = false;
//        private uint iLastErr = 0;
//        private Int32 m_lUserID = -1;
//        private Int32 m_lRealHandle = -1;
//        private CHCNetSDK.NET_DVR_DEVICEINFO_V40 DeviceInfo;
//        private CHCNetSDK.NET_DVR_USER_LOGIN_INFO struLogInfo;
//        public CHCNetSDK.DRAWFUN DrawFun = null;
//        public bool masking = false;

//        public bool hkcatchbmppic(string sBmpPicFileName, string optin = "bmp")
//        {
//            if (optin == "bmp")
//                return CHCNetSDK.NET_DVR_CapturePicture(m_lRealHandle, sBmpPicFileName);
//            else
//            {
//                int lChannel = Int16.Parse("1"); //通道号 Channel number
//                CHCNetSDK.NET_DVR_JPEGPARA lpJpegPara = new CHCNetSDK.NET_DVR_JPEGPARA();
//                lpJpegPara.wPicQuality = 0; //图像质量 Image quality
//                lpJpegPara.wPicSize = 0xff; //抓图分辨率 Picture size: 2- 4CIF，0xff- Auto(使用当前码流分辨率)，抓图分辨率需要设备支持，更多取值请参考SDK文档
//                JPEG抓图 Capture a JPEG picture
//                return CHCNetSDK.NET_DVR_CaptureJPEGPicture(m_lUserID, lChannel, ref lpJpegPara, sBmpPicFileName);
//            }
//        }

//        public void Login()
//        {
//            m_bInitSDK = CHCNetSDK.NET_DVR_Init();
//            if (m_lUserID < 0)
//            {
//                struLogInfo = new CHCNetSDK.NET_DVR_USER_LOGIN_INFO();

//                设备IP地址或者域名
//                byte[] byIP = System.Text.Encoding.Default.GetBytes(_ip);
//                struLogInfo.sDeviceAddress = new byte[129];
//                byIP.CopyTo(struLogInfo.sDeviceAddress, 0);

//                设备用户名
//                byte[] byUserName = System.Text.Encoding.Default.GetBytes(_user);
//                struLogInfo.sUserName = new byte[64];
//                byUserName.CopyTo(struLogInfo.sUserName, 0);

//                设备密码
//                byte[] byPassword = System.Text.Encoding.Default.GetBytes(_pw);
//                struLogInfo.sPassword = new byte[64];
//                byPassword.CopyTo(struLogInfo.sPassword, 0);

//                struLogInfo.wPort = ushort.Parse(_port);//设备服务端口号

//                DeviceInfo = new CHCNetSDK.NET_DVR_DEVICEINFO_V40();

//                登录设备 Login the device
//                m_lUserID = CHCNetSDK.NET_DVR_Login_V40(ref struLogInfo, ref DeviceInfo);
//                if (m_lUserID < 0)
//                {
//                    iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                    return;
//                }
//                else
//                {
//                    登录成功
//                }

//            }
//            else
//            {
//                注销登录 Logout the device
//                if (m_lRealHandle >= 0)
//                {
//                    return;
//                }

//                if (!CHCNetSDK.NET_DVR_Logout(m_lUserID))
//                {
//                    iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                    return;
//                }
//                m_lUserID = -1;
//            }
//            return;
//        }

//        public void Loginout()
//        {
//            if (!CHCNetSDK.NET_DVR_StopRealPlay(m_lRealHandle))
//            {
//                iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                return;
//            }
//            if (!CHCNetSDK.NET_DVR_Logout(m_lUserID))
//            {
//                iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                return;
//            }
//            m_lUserID = -1;
//            m_lRealHandle = -1;
//            return;
//        }

//        public void Preview()
//        {
//            if (m_lUserID < 0)
//            {
//                MessageBox.Show("Please login the device firstly");
//                return;
//            }

//            if (m_lRealHandle < 0)
//            {
//                CHCNetSDK.NET_DVR_PREVIEWINFO lpPreviewInfo = new CHCNetSDK.NET_DVR_PREVIEWINFO();
//                lpPreviewInfo.hPlayWnd = _wnd.Handle;//预览窗口
//                lpPreviewInfo.lChannel = 1;//预te览的设备通道
//                lpPreviewInfo.dwStreamType = 0;//码流类型：0-主码流，1-子码流，2-码流3，3-码流4，以此类推
//                lpPreviewInfo.dwLinkMode = 0;//连接方式：0- TCP方式，1- UDP方式，2- 多播方式，3- RTP方式，4-RTP/RTSP，5-RSTP/HTTP 
//                lpPreviewInfo.bBlocked = true; //0- 非阻塞取流，1- 阻塞取流
//                lpPreviewInfo.dwDisplayBufNum = 1; //播放库播放缓冲区最大缓冲帧数
//                lpPreviewInfo.byProtoType = 0;
//                lpPreviewInfo.byPreviewMode = 0;

//                IntPtr pUser = new IntPtr();//用户数据

//                打开预览 Start live view
//                m_lRealHandle = CHCNetSDK.NET_DVR_RealPlay_V40(m_lUserID, ref lpPreviewInfo, null/*RealData*/, pUser);
//                if (m_lRealHandle < 0)
//                {
//                    iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                    return;
//                }
//                else
//                {
//                    预览成功
//                    if (masking)
//                    {
//                        DrawFun = new CHCNetSDK.DRAWFUN(DrawFunCallBack);
//                        bool b = CHCNetSDK.NET_DVR_RigisterDrawFun(m_lRealHandle, DrawFun, 0);
//                    }
//                }
//            }
//            else
//            {
//                停止预览 Stop live view
//                if (!CHCNetSDK.NET_DVR_StopRealPlay(m_lRealHandle))
//                {
//                    iLastErr = CHCNetSDK.NET_DVR_GetLastError();
//                    return;
//                }
//                m_lRealHandle = -1;

//            }
//            return;
//        }
//        public void DrawFunCallBack(int lRealHandle, IntPtr hDc, uint dwUser)
//        {
//            Graphics g = Graphics.FromHdc(hDc);
//            if (null == g)
//                return;
//            int Wid = _wnd.Width;
//            int Hig = _wnd.Height;
//            Pen pen = new Pen(Color.Red, 1);
//            pen.DashStyle = System.Drawing.Drawing2D.DashStyle.Custom;
//            pen.DashPattern = new float[] { 5, 5 };
//            Point point1 = new Point(Wid / 2, 0);
//            Point point2 = new Point(Wid / 2, Hig);
//            Point point3 = new Point(0, Hig / 2);
//            Point point4 = new Point(Wid, Hig / 2);
//            Rectangle rect = new Rectangle(Wid / 2 - Hig / 4, Hig / 4, Hig / 2, Hig / 2);
//            g.DrawLine(pen, point1, point2);
//            g.DrawLine(pen, point3, point4);
//            g.DrawEllipse(pen, rect);
//            pen.Dispose();
//            g.Dispose();
//        }
//    }
//}
