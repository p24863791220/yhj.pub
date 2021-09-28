using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.Net.Sockets;
using System.Net;
//using Microsoft.Office.Interop;
using System.Globalization;
using System.IO;
using System.Data.OleDb;
using System.IO.Ports;

namespace SmtTest
{
    public partial class TcpDemo : Form
    {
        int nums = 1;
        #region 机器人通讯指令
        const string INFO = "001";//消息类型和领域
        const string RESET = "000";
        const string MOVE_ID = "400";//运动到指定的点位
        const string MOVE_POINT = "401";//运动到指定的坐标值
        const string SET_POINT = "203";//将当前位置设置到指定的点位
        const string SET_POINT_ID = "005";//将指定坐标设置到指定的点位
        const string SET_IO_O = "300";//设置机器人的输出端口
        const string CLEAR_IO_O = "301";//清除机器人的输出端口
        const string GET_IO_I = "302";//获取机器人的输入端口
        const string GET_CUR_RPOINT = "003";//获取当前机器人的坐标值
        const string STOP = "017";//取消正在执行的动作  快速暂停
        const string SET_CUR_V = "100";//设定速度 加速度 减速度
        const string OFFSET_ID = "402";//相对某点 (当前位置）做偏移
        const string CYLIND1_O = "001";//气缸1输出
        const string CYLIND2_O = "002";//气缸2输出
        const string CYLIND3_O = "004";//气缸3输出
        const string AIR1_O = "008";//气缸1真空输出
        const string AIR2_O = "016";//气缸1真空输出
        const string AIR3_O = "032";//气缸1真空输出
        const string CYLIND1_D = "009";//气缸1下降输入
        const string CYLIND2_D = "011";//气缸2下降输入
        const string CYLIND3_D = "013";//气缸3下降输入
        const string CYLIND1_U = "008";//气缸1上升输入
        const string CYLIND2_U = "010";//气缸2上升输入
        const string CYLIND3_U = "012";//气缸3上升输入
        const string AIR1_I = "014";//气缸1真空输入
        const string AIR2_I = "015";//气缸2真空输入
        const string AIR3_I = "016";//气缸3真空输入

        #endregion

        #region 界面初始化

        /// <summary>
        /// 初始化界面
        /// </summary>
        public void InitDiag()
        {

            txt_IP2.Text = ClassIni.Read("Vision2", "CIP", strFilePath);
            text_Port2.Text = ClassIni.Read("Vision2", "CPort", strFilePath);

            textBox_RIP.Text = ClassIni.Read("Robot", "CIP", strFilePath);
            textBox_RPort.Text = ClassIni.Read("Robot", "CPort", strFilePath);

            textBox_CalibH.Text = ClassIni.Read("Scene", "CalibH", strFilePath);
            textBox_CalibR.Text = ClassIni.Read("Scene", "Calib32No", strFilePath);
            textBox_CalibFeed.Text = ClassIni.Read("Scene", "CalibFeedNo", strFilePath);
            textBox_CalibClip.Text = ClassIni.Read("Scene", "CalibClipNo", strFilePath);
            textBox_FindMark.Text = ClassIni.Read("Scene", "FindMarkNo", strFilePath);

            textBox_JZAQ_ID.Text = ClassIni.Read("PointID", "JZAQ", strFilePath);
            textBox_JZ_ID.Text = ClassIni.Read("PointID", "JZ", strFilePath);
            textBox_Leave_ID.Text = ClassIni.Read("PointID", "PL", strFilePath);

            comboBox_AbsOrRelat.Items.AddRange(new string[] { "相对坐标", "绝对坐标" });
            comboBox_AbsOrRelat.SelectedIndex = 0;

            comboBox_Cyl.Items.AddRange(new string[] { "气缸1", "气缸2", "气缸3" });
            comboBox_Cyl.SelectedIndex = 0;

            comboBox_OffsetDirec.Items.AddRange(new string[] { "顺时针", "逆时针" });
            comboBox_OffsetDirec.SelectedIndex = 0;
            //comboBox_OffsetMod.Items.AddRange(new string[] { "2X2", "3X3", "4X4" });
            //comboBox_OffsetMod.SelectedIndex = 0;

            //dataGridView_RPoint.RowCount = 100;

            //  通讯信息初始化

            listView_v2.View = View.Details;
            listView_v2.LabelEdit = false;
            listView_v2.AllowColumnReorder = false;
            listView_v2.CheckBoxes = false;
            listView_v2.FullRowSelect = true;
            listView_v2.GridLines = true;
            listView_v2.Sorting = SortOrder.None;

            listView_V3.View = View.Details;
            listView_V3.LabelEdit = false;
            listView_V3.AllowColumnReorder = false;
            listView_V3.CheckBoxes = false;
            listView_V3.FullRowSelect = true;
            listView_V3.GridLines = true;
            listView_V3.Sorting = SortOrder.None;

            listView_Rob.View = View.Details;
            listView_Rob.LabelEdit = false;
            listView_Rob.AllowColumnReorder = false;
            listView_Rob.CheckBoxes = false;
            listView_Rob.FullRowSelect = true;
            listView_Rob.GridLines = true;
            listView_Rob.Sorting = SortOrder.None;




            DataSet ds = new DataSet();
            //dataGridView1.Columns[0].Width = 60;
            //dataGridView1.Columns[1].Width = 60;
            //dataGridView1.Columns[2].Width = 260;

            //combox3发送消息初始化
            //string[] s1 = File.ReadAllLines(robotPath);
            //string[] s2 = s1[1].Split('=');
            //StreamReader sr = new StreamReader(robotPath, Encoding.Default);
            //string content = sr.ReadToEnd();
            ////以回车为分隔符，分割读取的文本
            //string []s3 = content.Split(new string[] { "\r\n" }, StringSplitOptions.None);
            //TrackBar_VJog.Value = 10;
            //groupBox_HandVel.Text = " 位移速度:  " + TrackBar_VJog.Value + "%";
        }
        public void InitPoint()
        {
            StreamReader sr = new StreamReader(robotPath, Encoding.Default);//读文件
            string sP = "";
            int i = 0;
            string[] ch = new string[100];
            while ((sP = sr.ReadLine()) != null)            //一行行读，如果读取内空不为空
            {
                ch = sP.Split(new char[] { '=' }, StringSplitOptions.RemoveEmptyEntries); //遇到空格截取，得到数组。 sl+ (char)13;
                i++;//一行一行读
                //textBox5.Text = ch[i] + (char)13;
                dataGridView_RPoint.Rows.Add(ch[0], ch[1], ch[2]);
            }
            sr.Dispose();
            sr.Close();
        }
        public void initRS1()
        {
            ComDevice.PortName = "COM1";// cbbComList.SelectedItem.ToString();
            ComDevice.BaudRate = 115200;// Convert.ToInt32(cbbBaudRate.SelectedItem.ToString());
            ComDevice.Parity = (Parity)0; //(Parity)Convert.ToInt32(cbbParity.SelectedIndex.ToString());
            ComDevice.DataBits = 8;// Convert.ToInt32(cbbDataBits.SelectedItem.ToString());
            ComDevice.StopBits = (StopBits)1; ;// (StopBits)Convert.ToInt32(cbbStopBits.SelectedItem.ToString());
            ComDevice.ReadTimeout = 500;
            try
            {
                ComDevice.Open();
                ListViewV3Show("已连接位移传感器");
                //btnSend.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            InitPoint();
            InitDiag();
            init();
           // initRS1();
        }
        #endregion

        string[] send = new string[10];

        string strFilePath = Application.StartupPath + "\\参数文件\\tcp.ini";//获取INI文件路径
        string robotPath = Application.StartupPath + "\\参数文件\\机器人点位坐标.ini";//获取INI文件路径
        float[] factor;
        // string receiveInfoByRob;
        public TcpDemo()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;

            //关闭对文本框的非线程操作检查
            TextBox.CheckForIllegalCrossThreadCalls = false;

            //保存父窗体的长宽，以及每个控件的X,Y坐标的相对位置：
            int count = this.Controls.Count * 2 + 2;
            factor = new float[count];
            int i = 0;
            factor[i++] = Size.Width;
            factor[i++] = Size.Height;
            foreach (Control ctrl in this.Controls)
            {
                factor[i++] = ctrl.Location.X / (float)Size.Width;
                factor[i++] = ctrl.Location.Y / (float)Size.Height;
                ctrl.Tag = ctrl.Size;
            }
            Tag = factor;
        }
        private void TcpDemo_SizeChanged(object sender, EventArgs e)
        {
            int i = 2;
            foreach (Control ctrl in this.Controls)
            {
                ctrl.Left = (int)(Size.Width * factor[i++]);
                ctrl.Top = (int)(Size.Height * factor[i++]);
                ctrl.Width = (int)(Size.Width / (float)factor[0] * ((Size)ctrl.Tag).Width);
                ctrl.Height = (int)(Size.Height / (float)factor[1] * ((Size)ctrl.Tag).Height);
            }

        }
        #region RS232串口
        private SerialPort ComDevice = new SerialPort();
        public void init()
        {
            btnSend.Enabled = false;
            cbbComList.Items.AddRange(SerialPort.GetPortNames());
            if (cbbComList.Items.Count > 0)
            {
                cbbComList.SelectedIndex = 0;
            }
            cbbBaudRate.SelectedIndex = 5;
            cbbDataBits.SelectedIndex = 0;
            cbbParity.SelectedIndex = 0;
            cbbStopBits.SelectedIndex = 0;
            // pictureBox1.BackgroundImage = Properties.Resources.red;

            ComDevice.DataReceived += new SerialDataReceivedEventHandler(Com_DataReceived);//绑定事件

        }
        public void SendRS()
        {
            try
            {
                byte[] arrSendData = Encoding.ASCII.GetBytes("MEASURE");
                //byte[]arrSendData=new char[]{02 4D 45 41 53 55 52 45 03 }
                ComDevice.Write(arrSendData, 0, arrSendData.Length);

                ListViewV3Show("To_RS:" + "MEASURE");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void btnSend_Click(object sender, EventArgs e)
        {
            SendRS();
        }
        public void initRS()
        {
            ComDevice.PortName = cbbComList.SelectedItem.ToString();
            ComDevice.BaudRate = Convert.ToInt32(cbbBaudRate.SelectedItem.ToString());
            ComDevice.Parity = (Parity)Convert.ToInt32(cbbParity.SelectedIndex.ToString());
            ComDevice.DataBits = Convert.ToInt32(cbbDataBits.SelectedItem.ToString());
            ComDevice.StopBits = (StopBits)Convert.ToInt32(cbbStopBits.SelectedItem.ToString());
            try
            {
                ComDevice.Open();
                btnSend.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }
        /// <summary>
        /// 打开串口
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpen_Click(object sender, EventArgs e)
        {
            if (cbbComList.Items.Count <= 0)
            {
                MessageBox.Show("没有发现串口,请检查线路！");
                return;
            }

            if (ComDevice.IsOpen == false)
            {
                ComDevice.PortName = cbbComList.SelectedItem.ToString();
                ComDevice.BaudRate = Convert.ToInt32(cbbBaudRate.SelectedItem.ToString());
                ComDevice.Parity = (Parity)Convert.ToInt32(cbbParity.SelectedIndex.ToString());
                ComDevice.DataBits = Convert.ToInt32(cbbDataBits.SelectedItem.ToString());
                ComDevice.StopBits = (StopBits)Convert.ToInt32(cbbStopBits.SelectedItem.ToString());
                try
                {
                    ComDevice.Open();
                    btnSend.Enabled = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                btnOpen.Text = "关闭串口";
                ListViewV3Show("已连接位移传感器");
                pictureBox1.BackgroundImage = 螺丝自动锁付. Properties.Resources.green;
            }
            else
            {
                try
                {
                    ComDevice.Close();
                    btnSend.Enabled = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                btnOpen.Text = "打开串口";
                pictureBox1.BackgroundImage =螺丝自动锁付. Properties.Resources.red;
            }

            cbbComList.Enabled = !ComDevice.IsOpen;
            cbbBaudRate.Enabled = !ComDevice.IsOpen;
            cbbParity.Enabled = !ComDevice.IsOpen;
            cbbDataBits.Enabled = !ComDevice.IsOpen;
            cbbStopBits.Enabled = !ComDevice.IsOpen;
        }

        /// <summary>
        /// 关闭串口
        /// </summary>
        public void ClearSelf()
        {
            if (ComDevice.IsOpen)
            {
                ComDevice.Close();
            }
        }
        string recByRS;
        /// <summary>
        /// 接收数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Com_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            byte[] ReDatas = new byte[ComDevice.BytesToRead];
            ComDevice.Read(ReDatas, 0, ReDatas.Length);//读取数据
            string strRecRS = new UTF8Encoding().GetString(ReDatas);
            string str1 = strRecRS.Substring(1, strRecRS.Length - 2);
            recByRS = str1;
            txtShowData.AppendText(recByRS);
            ListViewV3Show(str1);
        }
        public void SendToRS()
        {
            ComDevice.WriteLine("MEASURE");//02 4D 45 41 53 55 52 45 03 
        }
        public string RecRS()
        {
            Thread.Sleep(30);
            if (recByRS.Length < 0)
            {
                MessageBox.Show("未接受到位移传感器数据", "提示：");
            }
            //ListViewV3Show("From_RS:" + recByRS);
            return recByRS;
        }
        /// <summary>
        /// 发送数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="data"></param>
        public bool SendData(byte[] data)
        {
            if (ComDevice.IsOpen)
            {
                try
                {
                    ComDevice.Write(data, 0, data.Length);//发送数据
                    return true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("串口未打开", "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return false;
        }


        /// <summary>
        /// 字符串转换16进制字节数组
        /// </summary>
        /// <param name="hexString"></param>
        /// <returns></returns>
        private byte[] strToHexByte(string hexString)
        {
            hexString = hexString.Replace(" ", "");
            if ((hexString.Length % 2) != 0) hexString += " ";
            byte[] returnBytes = new byte[hexString.Length / 2];
            for (int i = 0; i < returnBytes.Length; i++)
                returnBytes[i] = Convert.ToByte(hexString.Substring(i * 2, 2).Replace(" ", ""), 16);
            return returnBytes;
        }

        /// <summary>
        /// 字节数组转16进制字符串
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static string byteToHexStr(byte[] bytes)
        {
            string returnStr = "";
            if (bytes != null)
            {
                for (int i = 0; i < bytes.Length; i++)
                {
                    returnStr += bytes[i].ToString("X2");
                }
            }
            return returnStr;
        }


        #endregion

        #region 显示通讯信息
        public delegate void pfnListAddMessage(string str);//定義一個委託類型，沒有返回值但是有一個字符串類型的參數  

        public void ListViewV2Show(string str)    //listview中加入消息
        {
            if (listView_v2.InvokeRequired)
            {
                pfnListAddMessage fn = ListViewV2Show;//定義委託對象，放入ListShowAddStr方法
                listView_v2.Invoke(fn, str);//這個ListShow控件就被委託了，第一個參數是指委託的方法，第二個是指委託方法的參數，若無參數，就為null即可
            }
            else
            {
                ListViewItem ItemAdd = new ListViewItem();
                DateTime TimeNow = DateTime.Now;

                ItemAdd.Text = TimeNow.ToString("yyyy/MM/dd HH:mm:ss");
                ItemAdd.SubItems.Add(str);
                listView_v2.Items.Insert(0, ItemAdd);

                //多于500條則清空
                if (listView_v2.Items.Count > 2000)
                {
                    listView_v2.Items.Clear();
                }
            }
        }
        public void ListViewV3Show(string str)    //listview中加入消息
        {
            if (listView_V3.InvokeRequired)
            {
                pfnListAddMessage fn = ListViewV3Show;//定義委託對象，放入ListShowAddStr方法
                listView_V3.Invoke(fn, str);//這個ListShow控件就被委託了，第一個參數是指委託的方法，第二個是指委託方法的參數，若無參數，就為null即可
            }
            else
            {
                ListViewItem ItemAdd = new ListViewItem();
                DateTime TimeNow = DateTime.Now;

                ItemAdd.Text = TimeNow.ToString("yyyy/MM/dd HH:mm:ss");
                ItemAdd.SubItems.Add(str);
                listView_V3.Items.Insert(0, ItemAdd);

                //多于500條則清空
                if (listView_V3.Items.Count > 2000)
                {
                    listView_V3.Items.Clear();
                }
            }
        }
        public void ListViewRobShow(string str)    //listview中加入消息
        {
            if (listView_V3.InvokeRequired)
            {
                pfnListAddMessage fn = ListViewRobShow;//定義委託對象，放入ListShowAddStr方法
                listView_Rob.Invoke(fn, str);//這個ListShow控件就被委託了，第一個參數是指委託的方法，第二個是指委託方法的參數，若無參數，就為null即可
            }
            else
            {
                ListViewItem ItemAdd = new ListViewItem();
                DateTime TimeNow = DateTime.Now;

                ItemAdd.Text = TimeNow.ToString("yyyy/MM/dd HH:mm:ss");
                ItemAdd.SubItems.Add(str);
                listView_Rob.Items.Insert(0, ItemAdd);

                //多于500條則清空
                if (listView_Rob.Items.Count > 2000)
                {
                    listView_Rob.Items.Clear();

                }
            }
        }
        #endregion


        /// <summary>
        /// 获取当前系统时间的方法
        /// </summary>
        /// <returns>当前时间</returns>
        private DateTime GetCurrentTime()
        {
            DateTime currentTime = new DateTime();
            currentTime = DateTime.Now;
            return currentTime;
        }
        private void button_VCon2_Click(object sender, EventArgs e)
        {
            Application.DoEvents();
            //定义一个套字节监听  包含3个参数(IP4寻址协议,流式连接,TCP协议)
            socketClient2 = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //需要获取文本框中的IP地址
            IPAddress ipaddress = IPAddress.Parse(txt_IP2.Text.Trim());
            //将获取的ip地址和端口号绑定到网络节点endpoint上
            IPEndPoint endpoint = new IPEndPoint(ipaddress, int.Parse(text_Port2.Text.Trim()));
            //这里客户端套接字连接到网络节点(服务端)用的方法是Connect 而不是Bind
            try
            {
                socketClient2.Connect(endpoint);
                ListViewV2Show("视觉通讯成功！");
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void button_VSend2_Click(object sender, EventArgs e)
        {
            //调用ClientSendMsg方法 将文本框中输入的信息发送给服务端
            ClientSendMsg2(text_VSend2.Text.Trim());
 
            textBox_VRec2.Text = recCCDMsg;

        }
        string strToRob;
        private void button_RSend_Click(object sender, EventArgs e)
        {
            strToRob = textBox_RSend.Text.Trim();
            //调用ClientSendMsg方法 将文本框中输入的信息发送给服务端
            ClientSendMsg(strToRob);
            ListViewRobShow("To_Robot:" + strToRob);
        }
        //创建 1个客户端套接字 和1个负责监听服务端请求的线程  
        Socket socketClient = null;
        private void button_RCon_Click(object sender, EventArgs e)
        {
            Application.DoEvents();
            //定义一个套字节监听  包含3个参数(IP4寻址协议,流式连接,TCP协议)
            socketClient = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            //需要获取文本框中的IP地址
            IPAddress ipaddress = IPAddress.Parse(textBox_RIP.Text.Trim());
            //将获取的ip地址和端口号绑定到网络节点endpoint上
             IPEndPoint endpoint = new IPEndPoint(ipaddress, int.Parse(textBox_RPort.Text.Trim()));
            //这里客户端套接字连接到网络节点(服务端)用的方法是Connect 而不是Bind

            try
            {
                socketClient.Connect(endpoint);
                ListViewRobShow("与机器人通讯成功！");
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString(), "未连接到有效的服务器");
                return;
            }
        }
        string recRobotMsg;//接收到来自机器人的信息
        /// <summary>
        /// 接收服务端发来信息的方法
        /// </summary>
        public void RecMsg()
        {

        rr:
            recRobotMsg = null;

            try
            {
                Thread.Sleep(100);
                byte[] arrRecMsg = new byte[256];
                socketClient.ReceiveTimeout = 10000;
                int length = 0;
                length = socketClient.Receive(arrRecMsg);

                if (length == 14)
                {
                    //strRecMsgR = Encoding.UTF8.GetString(arrRecMsg, 0, length);
                    Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
                    goto rr;
                }
                else if (length >= 18)
                {
                    recRobotMsg = Encoding.UTF8.GetString(arrRecMsg, 0, length);

                    Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
                }
                //                 else if (length > 18)
                //                 {
                //                     recRobotMsg = Encoding.UTF8.GetString(arrRecMsg, 0, length);
                // 
                //                     Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
                //                 }
                else if (length == 4)
                {
                    recRobotMsg = Encoding.UTF8.GetString(arrRecMsg, 0, length);
                    MessageBox.Show("发送指令参数格式错误", "错误");
                }
                ListViewRobShow("F_Rob:" + recRobotMsg);

            }
            catch
            {
                MessageBox.Show("未接受到数据,请查看通讯是否正常", "提示");
                return;
            }
        }
        //public string RecMsg()
        //{
        //    string Msg = "";
        //    string strRecMsgR = "";
        //a: Thread.Sleep(20);
        //    //定义一个1M的内存缓冲区 用于临时性存储接收到的信息
        //    byte[] arrRecMsg = new byte[1024 * 1024];

        //    Array.Clear(arrRecMsg, 0, arrRecMsg.Length);

        //    try
        //    {
        //        socketClient.ReceiveTimeout = 3000;
        //        //将客户端套接字接收到的数据存入内存缓冲区, 并获取其长度               
        //        int length = socketClient.Receive(arrRecMsg);
        //        if (length < 15)
        //        {
        //            //Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //            Msg = Encoding.UTF8.GetString(arrRecMsg, 0, length); 
        //            goto a;
        //        }
        //        else
        //        {

        //            strRecMsgR = Msg + Encoding.UTF8.GetString(arrRecMsg, 0, length);

        //            //Array.Clear(arrRecMsg, 0, arrRecMsg.Length);

        //            if ("0000" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {
        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //            }

        //            else if ("0001" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {
        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //                MessageBox.Show("未定义错误");

        //            }
        //            else if ("0002" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {

        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //                MessageBox.Show("机器人领域暂不支持此指令");
        //            }
        //            else if ("0003" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {

        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //                MessageBox.Show("机器人领域暂不支持此指令");
        //            }
        //            else if ("0004" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {

        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //                MessageBox.Show("发送指令缺少参数");
        //            }
        //            else if ("0005" == strRecMsgR.Substring(strRecMsgR.Length - 4))
        //            {

        //                ListViewRobShow("From_Robot：" + strRecMsgR);
        //                //清空缓冲区
        //                Array.Clear(arrRecMsg, 0, arrRecMsg.Length);
        //                MessageBox.Show("发送指令参数格式错误");
        //            }
        //            else 
        //            {
        //                 length = socketClient.Receive(arrRecMsg);
        //                 strRecMsgR = strRecMsgR + Encoding.UTF8.GetString(arrRecMsg, 0, length);
        //            }

        //        }


        //        return strRecMsgR;
        //    }
        //    catch
        //    {
        //        MessageBox.Show("未接受到数据");
        //        return "";
        //    }

        //}

        /// <summary>
        /// 发送字符串信息到服务端的方法
        /// </summary>
        /// <param name="sendMsg">发送的字符串信息</param>
        private void ClientSendMsg(string sendMsg)
        {
            try
            {
                //if (null == socketClient) { MessageBox.Show("服务器中断"); }
                //将输入的内容字符串转换为机器可以识别的字节数组
                byte[] arrClientSendMsg = Encoding.UTF8.GetBytes(sendMsg);
                //调用客户端套接字发送字节数组
                socketClient.Send(arrClientSendMsg);
                //将发送的信息追加到文本框中
                ListViewRobShow("To_Robot:" + sendMsg);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "未连接到服务器");
            }
            finally
            {

            }
            //catch
            //{
            //    socketClient.Shutdown(SocketShutdown.Both);
            //    socketClient.Close();
            //    return;
            //}

        }

        private void textBox6_KeyDown(object sender, KeyEventArgs e)
        {
            //当光标位于文本框时 如果用户按下了键盘上的Enter键 
            if (e.KeyCode == Keys.Enter)
            {
                //则调用客户端向服务端发送信息的方法
                ClientSendMsg(textBox_RSend.Text.Trim());
            }
        }

        private void button_SaveTcp_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("是否保存所有参数？", "提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Cancel)
            { }
            else
            {
                ClassIni.Write("Vision2", "CIP", txt_IP2.Text, strFilePath);
                ClassIni.Write("Vision2", "CPort", text_Port2.Text, strFilePath);

                ClassIni.Write("Robot", "CIP", textBox_RIP.Text, strFilePath);
                ClassIni.Write("Robot", "CPort", textBox_RPort.Text, strFilePath);

                ClassIni.Write("Scene", "CalibH", textBox_CalibH.Text, strFilePath);
                ClassIni.Write("Scene", "Calib32No", textBox_CalibR.Text, strFilePath);
                ClassIni.Write("Scene", "CalibFeedNo", textBox_CalibFeed.Text, strFilePath);
                ClassIni.Write("Scene", "CalibClipNo", textBox_CalibClip.Text, strFilePath);
                ClassIni.Write("Scene", "FindMarkNo", textBox_FindMark.Text, strFilePath);

                ClassIni.Write("PointID", "JZAQ", textBox_JZAQ_ID.Text, strFilePath);
                ClassIni.Write("PointID", "JZ", textBox_JZ_ID.Text, strFilePath);
                ClassIni.Write("PointID", "PL", textBox_Leave_ID.Text, strFilePath);
            }
        }

        Socket socketClient2 = null;
        private void ClientSendMsg2(string sendMsg)
        {
            try
            {
                //if (null == socketClient2) { MessageBox.Show("服务器中断"); }
                //将输入的内容字符串转换为机器可以识别的字节数组
                byte[] arrClientSendMsg = Encoding.UTF8.GetBytes(sendMsg);
                //调用客户端套接字发送字节数组
                socketClient2.Send(arrClientSendMsg);
                //将发送的信息追加到聊天内容文本框中
                ListViewV2Show("To_CCD:触发相机拍照");
                Thread.Sleep(100);
                RecMsg2();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "未连接到视觉服务器");
            }

        }
        public void ClientSendMsgToCha(string scene)
        {
            byte[] arrClientSendMsg = Encoding.UTF8.GetBytes("s " + scene);
            socketClient2.Send(arrClientSendMsg);
            ListViewV2Show("To_CCD:切换视觉场景-" + scene);

            Thread.Sleep(200);
            byte[] arrRecMsgCCD = new byte[256];
            socketClient2.ReceiveTimeout = 1000;
            try
            {
                int length = socketClient2.Receive(arrRecMsgCCD);
                if (length <= 4)
                {
                    string strRecMsgV = Encoding.UTF8.GetString(arrRecMsgCCD, 0, length);
                    if (strRecMsgV.Contains("OK"))
                    {
                        ListViewV2Show("From_CCD：切换" + strRecMsgV);
                    }
                    else { MessageBox.Show("切换失败！！！"); }
                    Array.Clear(arrRecMsgCCD, 0, arrRecMsgCCD.Length);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "接收数据超时", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #region 机器人协议
        /// <summary>
        /// 获取当前坐标
        /// </summary>
        public void GetCurCoor()
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = GET_CUR_RPOINT;
            int leng = (send[1] + send[2] + send[3]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3];
            ClientSendMsg(strSend);
            RecMsg();
        }
        /// <summary>
        /// 将当前位置设置到指定的点位
        /// </summary>
        public void SetCurCoorToPointID()
        {
            int rIndex = dataGridView_RPoint.CurrentCell.RowIndex;
            string strID = dataGridView_RPoint.Rows[rIndex].Cells[0].Value.ToString();//当前行的点位ID
            send[1] = JudgeNums();
            send[3] = SET_POINT;
            send[4] = strID;
            int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng1.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
        }
        /// <summary>
        /// 将指定的坐标设置到指定的点位
        /// </summary>
        public void SetAppointCoorToPointID()
        {
            int rIndex = dataGridView_RPoint.CurrentCell.RowIndex;
            string strID = dataGridView_RPoint.Rows[rIndex].Cells[0].Value.ToString().Trim();//当前行的点位ID
            send[1] = JudgeNums();
            send[3] = SET_POINT_ID;
            send[4] = strID + ";" + dataGridView_RPoint.CurrentCell.Value.ToString().Trim();
            int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng1.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
        }
        /// <summary>
        /// 在坐标中运动到指定的坐标值
        /// </summary>
        public void MoveToCoor()
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = MOVE_POINT;
            send[4] = dataGridView_RPoint.CurrentCell.Value.ToString().Trim();
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
        }

        /// <summary>
        /// 运动到指定的点位
        /// </summary>
        public void MoveToPointID(string pointID)
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = MOVE_ID;
            send[4] = pointID;//dataGridView_RPoint.CurrentCell.Value.ToString().Trim();
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
            RecMsg();
        }
        /// <summary>
        /// 单轴走偏移
        /// </summary>
        /// <param name="axis">1X，2Y，3Z，4U</param>
        /// <param name="dir">0，-1</param>
        /// <param name="value"></param>
        public void MoveByOffSet(int axis, string dir, string value)
        {
            send[1] = JudgeNums();
            send[2] = INFO;
            send[3] = OFFSET_ID;
//             double jogVal = Convert.ToDouble(value);
//             string strF = string.Format("{0:0000}", jogVal);
            string strF = value;
            switch (axis)
            {
                case 1: send[4] = "000;" + dir + strF + ",0,0,0"/* + ",0,0"*/;
                    break;
                case 2: send[4] = "000;" + "0," + dir + strF + ",0,0"/* + ",0,0"*/;
                    break;
                case 3: send[4] = "000;" + "0," + "0," + dir + strF + ",0"/* + ",0,0"*/;
                    break;
                case 4: send[4] = "000;" + "0," + "0," + "0," + dir + strF/* + ",0,0"*/;
                    break;
            }
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
            RecMsg();
        }
        /// <summary>
        /// 机器人IO操作
        /// 
        /// </summary>
        /// <param name="command">SET_IO_O = "006";//设置机器人的输出端口  CLEAR_IO_O = "007";//清除机器人的输出端口  GET_IO_I = "008";//获取机器人的输入端口</param>
        /// <param name="IO_O_No"> CYLIND1_O = "001";//气缸1输出 CYLIND2_O = "002";//气缸2输出CYLIND3_O = "004";//气缸3输出AIR1_O = "008";//气缸1输出AIR2_O = "016";//气缸1输出AIR3_O = "032";//气缸1输出</param>
        public void OperIO(string command, string IO_O_No)
        {
            if (socketClient != null)
            {
                send[1] = JudgeNums();
                send[2] = INFO;
                send[3] = command;
                send[4] = IO_O_No;
                int leng = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                ClientSendMsg(strSend);
                RecMsg();
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        /// <summary>
        /// 获取机器人IO状态
        /// </summary>
        /// <param name="IONo"></param>
        /// <returns></returns>
        public void Get_IO_Status(string IO_I_No)
        {
            send[1] = JudgeNums();
            send[2] = INFO;
            send[3] = GET_IO_I;
            send[4] = IO_I_No;
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
            RecMsg();
            //             if (recRobotMsg.Substring(recRobotMsg.Length - 3) =="1")//完成回复  001400021013020000;val
            //             {
            //                 return true;
            //             }
            //             else
            //                 return false;
        }
        /// <summary>
        /// 机器人回原
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button_GoHome_Click(object sender, EventArgs e)
        {
            bHome = false;
            //三个夹爪复位   
            //发送速度参数给机器人
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            //发送回原命令给机器人
            SetResetToRob();
        }
        /// <summary>
        /// 发送命令让机器人暂停
        /// </summary>
        public void SetStopToRob()
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = STOP;
            int leng = (send[1] + send[2] + send[3]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3];
            ClientSendMsg(strSend);
            RecMsg();
        }
        /// <summary>
        /// 机器人暂停
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button_StopRob_Click(object sender, EventArgs e)
        {
            SetStopToRob();
        }
        /// <summary>
        /// 设定当前的速度 加速度 减速度
        /// </summary>
        public void SetCurVel(string strV, string strA, string strD)
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = SET_CUR_V;
            double vel = Convert.ToDouble(strV);
            double acc = Convert.ToDouble(strA);
            double dec = Convert.ToDouble(strD);
            string strFV = string.Format("{0:000}", vel);
            string strFA = string.Format("{0:000}", acc);
            string strFD = string.Format("{0:000}", dec);
            send[4] = strFV + ";" + strFA + ";" + strFD;
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            ClientSendMsg(strSend);
            RecMsg();
        }
        #endregion


        /// <summary>
        /// 将第一列设为序列号
        /// </summary>
        /// <param name="e"></param>
        /// <param name="datagridview"></param>
        private void SetDataGridViewRowXh(DataGridViewRowPostPaintEventArgs e, DataGridView datagridview)
        {
            SolidBrush solidBrush = new SolidBrush(datagridview.RowHeadersDefaultCellStyle.ForeColor);
            int xh = e.RowIndex + 1;
            e.Graphics.DrawString(xh.ToString(CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, solidBrush,
                e.RowBounds.Location.X + 5, e.RowBounds.Location.Y + 4);
        }
        public static DataSet GetExcelData(string str)
        {
            string strCon = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + str + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;'";
            OleDbConnection myConn = new OleDbConnection(strCon);
            string strCom = " SELECT * FROM [Sheet1$]";
            myConn.Open();
            OleDbDataAdapter myCommand = new OleDbDataAdapter(strCom, myConn);
            DataSet myDataSet = new DataSet();
            myCommand.Fill(myDataSet, "[Sheet1$]");
            myConn.Close();
            return myDataSet;
        }

        private void button12_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();//首先根据打开文件对话框，选择excel表格
            ofd.Filter = "表格|*.xls";//打开文件对话框筛选器
            string strPath;//文件完整的路径名
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    strPath = ofd.FileName;
                    string strCon = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strPath + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=1;'";//关键是红色区域
                    OleDbConnection Con = new OleDbConnection(strCon);//建立连接
                    string strSql = "select * from [Sheet1$]";//表名的写法也应注意不同，对应的excel表为sheet1，在这里要在其后加美元符号$，并用中括号
                    OleDbCommand Cmd = new OleDbCommand(strSql, Con);//建立要执行的命令
                    OleDbDataAdapter da = new OleDbDataAdapter(Cmd);//建立数据适配器
                    DataSet ds = new DataSet();//新建数据集
                    da.Fill(ds, "shyman");//把数据适配器中的数据读到数据集中的一个表中（此处表名为shyman，可以任取表名）
                    //指定datagridview1的数据源为数据集ds的第一张表（也就是shyman表），也可以写ds.Table["shyman"]

                    dataGridView_RPoint.DataSource = ds.Tables[0];
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);//捕捉异常
                }
            }
        }


        private void button_SaveRobP_Click(object sender, EventArgs e)
        {
            string[] arrDGV = new string[100];
            string strB, strLine;
            string filename = robotPath; //"C:\\Documents and Settings\\Administrator\\桌面\\CST.txt";
            FileStream sr = File.Open(filename, FileMode.Create);
            StreamWriter sw = new StreamWriter(sr, System.Text.Encoding.Unicode);
            StringBuilder strBuilder = new StringBuilder();
            try
            {
                for (int i = 0; i < dataGridView_RPoint.Rows.Count - 1; i++)
                {
                    strBuilder = new StringBuilder();
                    for (int j = 0; j < dataGridView_RPoint.Columns.Count; j++)
                    {
                        strBuilder.Append(dataGridView_RPoint.Rows[i].Cells[j].Value.ToString().Trim() + ' ');
                    }
                    strBuilder.Remove(strBuilder.Length - 1, 1);
                    strB = strBuilder.ToString();
                    arrDGV = strB.Split(new char[] { ' ' });//, StringSplitOptions.RemoveEmptyEntries);
                    strLine = arrDGV[0] + "=" + arrDGV[1] + "=" + arrDGV[2];
                    sw.WriteLine(strLine);
                }
                this.Cursor = Cursors.Default;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Generic Exception Handler: {0}", ex.ToString());

            }
            finally
            {
                sw.Close();
                sr.Close();
            }
        }


        private void 删除此行ToolStripMenuItem2_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("是否要删除此行？", "提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Cancel)
            {
                int rowIndex;
                rowIndex = dataGridView_RPoint.CurrentCell.RowIndex;
                if (rowIndex < dataGridView_RPoint.RowCount - 1)
                {
                    dataGridView_RPoint.Rows.RemoveAt(rowIndex);
                    dataGridView_RPoint.Refresh();
                }
            }
            else { }
        }

        private void 插入一行ToolStripMenuItem3_Click(object sender, EventArgs e)
        {
            int rowIndex = dataGridView_RPoint.CurrentCell.RowIndex;
            int rowCount = dataGridView_RPoint.RowCount;
            if (rowCount != (-1))
            {
                dataGridView_RPoint.Rows.Insert(rowIndex, 1);
            }
            else
                MessageBox.Show("未选择操作行！");
        }

        private void 捕获坐标ToolStripMenuItem4_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                bHome = true;
                if (true == bHome)
                {
                    //发送命令获取当前机器人坐标
                    GetCurCoor();
                    string strCoor1 = recRobotMsg;
                    string strCoor = strCoor1.Substring(18/*15, strCoor1.Length - 5 - 15*/);
                    dataGridView_RPoint.CurrentCell.Value = strCoor;
                    Thread.Sleep(10);

                    SetCurCoorToPointID();//讲当前位置设置到指定的点位
                    RecMsg();
                }

                else
                {
                    MessageBox.Show("请先回原点，然后示教");
                }
            }
            else
            {
                MessageBox.Show("未连接机器人");
            }

            //Thread.Sleep(10);
            //SetAppointCoorToPointID();//讲指定坐标设置到指定的点位
            //RecMsg();


            //string[] strR = RecMsg().Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
            // dataGridView_RPoint.CurrentCell.Value = strR[2];

            //string str1 = strR[0].Substring(15, 3);
            //int len = Convert.ToInt32(str1);
            //string str2 = strR[1].Substring(0, len);
            //dataGridView_RPoint.CurrentCell.Value = str2;

            //将当前位置设置到指定的点位
            //int rIndex = dataGridView_RPoint.CurrentCell.RowIndex;
            //string strID = dataGridView_RPoint.Rows[rIndex].Cells[0].Value.ToString();//当前行的点位ID
            //send[1] = JudgeNums();
            //send[3] = SET_POINT;
            //send[4] = strID;
            //int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
            //send[0] = leng1.ToString("0000");
            //strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            //ClientSendMsg(strSend);
            //Thread.Sleep(100);

            //RecMsg();

        }

        private void 执行坐标ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            Thread.Sleep(100);
            //             string str1;
            // 
            //             str1 = recRobotMsg;
            //             if ("0000" == str1.Substring(str1.Length - 4))
            //             {
            MoveToCoor();
            Thread.Sleep(100);
            RecMsg();
            //             }
            //             else { MessageBox.Show("机器人操作失败"); }

            //send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            //send[2] = INFO;
            //send[3] = MOVE_POINT;
            //send[4] = dataGridView_RPoint.CurrentCell.Value.ToString().Trim();
            //int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            //send[0] = leng.ToString("0000");
            //strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            //ClientSendMsg(strSend);
            //Thread.Sleep(100);
            //RecMsg();
        }

        private void 执行当前点位ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MoveToPointID(dataGridView_RPoint.CurrentCell.Value.ToString().Trim());
        }

        private void dataGridView_RPoint_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            Rectangle rectangle = new Rectangle(e.RowBounds.Location.X,
               e.RowBounds.Location.Y,
               dataGridView_RPoint.RowHeadersWidth - 4,
               e.RowBounds.Height);

            TextRenderer.DrawText(e.Graphics, (e.RowIndex + 1).ToString(),
                dataGridView_RPoint.RowHeadersDefaultCellStyle.Font,
                rectangle,
                dataGridView_RPoint.RowHeadersDefaultCellStyle.ForeColor,
                TextFormatFlags.VerticalCenter | TextFormatFlags.Right);
        }

        private void trackBar_Vel_Scroll(object sender, EventArgs e)
        {
            label_Vel.Text = trackBar_Vel.Value.ToString();
        }

        private void trackBar_Acc_Scroll(object sender, EventArgs e)
        {
            label_Acc.Text = trackBar_Acc.Value.ToString();
        }

        private void trackBar_Dec_Scroll(object sender, EventArgs e)
        {
            label_Dec.Text = trackBar_Dec.Value.ToString();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            FileStream fileStream = new FileStream(robotPath, FileMode.OpenOrCreate);
            StreamWriter streamWriter = new StreamWriter(fileStream, System.Text.Encoding.Unicode);

            StringBuilder strBuilder = new StringBuilder();

            try
            {
                for (int i = 0; i < dataGridView_RPoint.Rows.Count; i++)
                {
                    strBuilder = new StringBuilder();
                    for (int j = 0; j < dataGridView_RPoint.Columns.Count; j++)
                    {
                        strBuilder.Append(dataGridView_RPoint.Rows[i].Cells[j].Value.ToString() + " ");
                    }
                    strBuilder.Remove(strBuilder.Length - 1, 1);
                    streamWriter.WriteLine(strBuilder.ToString());
                }
            }
            catch (Exception ex)
            {
                string strErrorMessage = ex.Message;
            }
            finally
            {
                streamWriter.Close();
                fileStream.Close();
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            dataGridView_RPoint.Rows.Clear();
            StreamReader sr = new StreamReader(robotPath, Encoding.Default);//读文件
            string read = null;
            read = sr.ReadLine();
            int i = 0;
            string[] ch = new string[100];
            while (read != null)
            {
                ch = read.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                i++;
                dataGridView_RPoint.Rows.Add(ch[0], ch[1], ch[2]);//截得的数组添加到 dataGridView，列数要固定，多少列根据情况修改。行数可以不固定
            }
        }

        private void button12_Click_1(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();//首先根据打开文件对话框，选择excel表格
            ofd.Filter = "表格|*.xls";//打开文件对话框筛选器
            string strPath;//文件完整的路径名
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    strPath = ofd.FileName;
                    //string strCon = "provider=microsoft.jet.oledb.4.0;data source=" + strPath + ";extended properties=excel 8.0";//关键是红色区域
                    string strCon = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + strPath + ";Extended Properties=Excel 12.0";//关键是红色区域
                    OleDbConnection Con = new OleDbConnection(strCon);//建立连接
                    Con.Open();
                    string strSql = "select * from [Sheet1$]";//表名的写法也应注意不同，对应的excel表为sheet1，在这里要在其后加美元符号$，并用中括号
                    OleDbCommand Cmd = new OleDbCommand(strSql, Con);//建立要执行的命令
                    OleDbDataAdapter da = new OleDbDataAdapter(Cmd);//建立数据适配器
                    DataSet ds = new DataSet();//新建数据集
                    da.Fill(ds, "Sheet1");//把数据适配器中的数据读到数据集中的一个表中（此处表名为shyman，可以任取表名）
                    //指定datagridview1的数据源为数据集ds的第一张表（也就是shyman表），也可以写ds.Table["shyman"]

                    dataGridView_RPoint.DataSource = ds.Tables["Sheet1"];
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);//捕捉异常
                }

            }
        }
        public bool ExportDataGridview(DataGridView dgv, bool isShowExcel)
        {
            if (dgv.Rows.Count == 0)
            {
                return false;
            }
            //建立Excel对象
            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
            excel.Application.Workbooks.Add(true);
            excel.Visible = isShowExcel;
            //生成字段名称
            for (int i = 0; i < dgv.ColumnCount; i++)
            {
                excel.Cells[1, i + 1] = dgv.Columns[i].HeaderText;
            }
            //填充数据
            for (int i = 0; i < dgv.RowCount - 1; i++)
            {
                for (int j = 0; j < dgv.ColumnCount; j++)
                {
                    if (dgv[j, i].ValueType == typeof(string))
                    {
                        excel.Cells[i + 2, j + 1] = "" + dgv[j, i].Value.ToString();
                    }
                    else
                    {
                        excel.Cells[i + 2, j + 1] = dgv[j, i].Value.ToString();
                    }
                }
            }
            return true;
        }
        private void button10_Click(object sender, EventArgs e)
        {
            ExportDataGridview(dataGridView_RPoint, true);
            //OpenFileDialog ofd = new OpenFileDialog();//首先根据打开文件对话框，选择excel表格
            //ofd.Filter = "表格|*.xls";//打开文件对话框筛选器
            //string strPath;//文件完整的路径名
            //if (ofd.ShowDialog() == DialogResult.OK)
            //{
            //    try
            //    {
            //        strPath = ofd.FileName;
            //       // string strCon = "Provider=Microsoft.Ace.OleDb.12.0;" + "data source=" + Server.MapPath("ExcelFiles/Mydata2007.xlsx") + ";Extended Properties='Excel 12.0; HDR=Yes; IMEX=1'"; //此连接可以操作.xls与.xlsx文件 (支持Excel2003 和 Excel2007 的连接字符串)
            //        //string strCon = "Provider=Microsoft.Ace.OleDb.12.0;" + "data source=" + strPath + ";Extended Properties='Excel 12.0; HDR=Yes; IMEX=1'"; //此连接可以操作.xls与.xlsx文件 (支持Excel2003 和 Excel2007 的连接字符串)

            //        string strCon = "provider=Microsoft.ACE.OLEDB.12.0;data source=" + strPath + ";Extended Properties=Excel 12.0";//关键是红色区域
            //        OleDbConnection Con = new OleDbConnection(strCon);//建立连接
            //        string strSql = "select * from [Sheet1$]";//表名的写法也应注意不同，对应的excel表为sheet1，在这里要在其后加美元符号$，并用中括号
            //        OleDbCommand Cmd = new OleDbCommand(strSql, Con);//建立要执行的命令
            //        OleDbDataAdapter da = new OleDbDataAdapter(Cmd);//建立数据适配器
            //        DataSet ds = new DataSet();//新建数据集
            //        da.Fill(ds, "shyman");//把数据适配器中的数据读到数据集中的一个表中（此处表名为shyman，可以任取表名）
            //        //指定datagridview1的数据源为数据集ds的第一张表（也就是shyman表），也可以写ds.Table["shyman"]

            //        dataGridView_RPoint.DataSource = ds.Tables[0];
            //    }
            //    catch (Exception ex)
            //    {
            //        MessageBox.Show(ex.Message);//捕捉异常
            //    }
            //}

        }
        string strSend;//发送的指令
        bool bHome;//回原标志
        public void SetResetToRob()
        {
            send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
            send[2] = INFO;
            send[3] = RESET;
            int leng = (send[1] + send[2] + send[3]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3];
            ClientSendMsg(strSend);
            RecMsg();

        }


        /// <summary>
        /// 判断序列号
        /// </summary>
        public string JudgeNums()
        {
            if (nums < 9999)
            {
                nums++;
            }
            else if (9999 == nums)
            {
                nums = 1;
            }
            string s = nums.ToString("0000");

            return s;
        }
        /// <summary>
        /// 机器人点动信息
        /// </summary>
        /// <param name="dir"></param>
        /// <returns></returns>
        public string JogMoveVal(string dir, string value)
        {
            send[1] = JudgeNums();
            send[2] = INFO;
            send[3] = OFFSET_ID;
            double jogVal = Convert.ToDouble(value);
            string strF = string.Format("{0:0}", jogVal);
            //if (textBox_Calib_X.Text == value || textBox_XOffsetDist.Text == value)
            //{
            //    iClicked = 20;
            //}
            //else if (textBox_Calib_Y.Text == value || textBox_YOffsetDist.Text == value)
            //{
            //    iClicked = 21;
            //}
            switch (iClicked)
            {

                case 1: send[4] = "000;" + dir + strF + ",0,0,0";/* + ",0,0"*/;
                    break;
                case 2: send[4] = "000;" + "0," + dir + strF + ",0,0"/* + ",0,0"*/;
                    break;
                case 3:
                case 10:
                case 11: send[4] = "000;" + "0," + "0," + dir + strF + ",0";/* + ",0,0";*/
                    break;
                case 4: send[4] = "000;" + "0," + "0," + "0," + dir + strF;/*+ ",0,0"*/;
                    break;

                case 20: send[4] = "000;" + dir + strF + ",0,0,0"; /*+ ",0,0"*/;
                    break;
                case 21: send[4] = "000;" + "0," + dir + strF + ",0,0";/* + ",0,0"*/;
                    break;
            }
            //send[4] = "0" + dir + strF + "0,0,0" + "0,0";
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            return strSend;
        }


        public void JogBTNEnable(int i)
        {
            if (0 == i)
            {
                button_X0.Enabled = false;
                button_X1.Enabled = false;
                button_Y0.Enabled = false;
                button_Y1.Enabled = false;
                button_Z0.Enabled = false;
                button_Z1.Enabled = false;
                button_U0.Enabled = false;
                button_U1.Enabled = false;
            }
            else
            {
                button_X0.Enabled = true;
                button_X1.Enabled = true;
                button_Y0.Enabled = true;
                button_Y1.Enabled = true;
                button_Z0.Enabled = true;
                button_Z1.Enabled = true;
                button_U0.Enabled = true;
                button_U1.Enabled = true;
            }
        }

        int iClicked = 0;//判断哪个按钮被按下
        /// <summary>
        /// 手动操作机器人
        /// </summary>
        /// <param name="dir"></param>
        public void JogMove(string dir)
        {
            JogBTNEnable(0);
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            Thread.Sleep(20);
            ClientSendMsg(JogMoveVal(dir, textBox_Jog.Text));
            RecMsg();
            string str2 = recRobotMsg;
            if ("0000" == str2.Substring(str2.Length - 4))
            {
                JogBTNEnable(1);
            }
        }
        /// <summary>
        /// 手动移动机器人
        /// </summary>
        /// <param name="axis"></param>
        /// <param name="dir"></param>
        public void Jog_Move_Rob(int axis, string dir)
        {
            JogBTNEnable(0);
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            Thread.Sleep(20);
            MoveByOffSet(axis, dir, textBox_Jog.Text.Trim());
            Thread.Sleep(50);
            JogBTNEnable(1);
        }
        private void button_X0_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //           iClicked = 1;
                //           JogMove("0");
                //           JogBTNEnable(0);
                Jog_Move_Rob(1, "0");

            }
            else
                MessageBox.Show("未连接到机器人", "提示");

        }
        private void button_X1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 1;
                //                 JogMove("-");
                Jog_Move_Rob(1, "-");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");

        }

        private void button_Y0_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 2;
                //                 JogMove("0");
                Jog_Move_Rob(2, "0");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }

        private void button_Y1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 2;
                //                 JogMove("-");
                Jog_Move_Rob(2, "-");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }

        private void button_Z0_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 3;
                //                 JogMove("0");
                Jog_Move_Rob(3, "0");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }

        private void button_Z1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 3;
                //                 JogMove("-");
                Jog_Move_Rob(3, "-");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }

        private void button_U0_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 4;
                //                 JogMove("0");
                Jog_Move_Rob(4, "0");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }

        private void button_U1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 iClicked = 4;
                //                 JogMove("-");
                Jog_Move_Rob(4, "-");
            }
            else
                MessageBox.Show("未连接到机器人", "提示");
        }
        /// <summary>
        /// 标定32个工站
        /// </summary>
        public void Calib32()
        {
            if ((socketClient != null) && (socketClient2 != null))
            {
                SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);

                int i = 1;
                do
                {
                    //MoveToPointID("00" + i.ToString());
                    //Thread.Sleep(100);
                    //MoveToPointID("00" + (i + 1).ToString());
                    //MoveByOffset_FindMToCalib();
                    //MoveToPointID("00" + i.ToString());
                    //i = i + 2;
                    MoveToPointID(i.ToString("000"));
                    Thread.Sleep(100);
                    MoveToPointID((i + 1).ToString("000"));
                    MoveByOffset_FindMToCalib();
                    MoveToPointID(i.ToString("000"));
                    i = i + 2;
                } while (i <= 64);

            }
            else
            {
                MessageBox.Show("请检查相机和机器人的通讯状态");
            }
        }
        Thread thAutoCalib;
        /// <summary>
        /// 自动标定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button_Calib_Click(object sender, EventArgs e)
        {
            thAutoCalib = new Thread(Calib32);
            thAutoCalib.IsBackground = true;
            thAutoCalib.Start();
            //Calib32();
            //             iClicked = 11;
            //             //检测机器人是否回原OK
            //             if (bHome == false)
            //             {
            //                 MessageBox.Show("请先将机器人回原再标定");
            //                 return;
            //             }
            //             //设置速度
            //             SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            //             RecMsg();
            //             //运行至第一个点    
            //             MoveToPointID("001");
            //             //切换到拍照场景  触发拍照
            //             ClientSendMsg2("s " + textBox_FindMark.Text.Trim());
            //             Thread.Sleep(300);
            //             ClientSendMsg2("M \r");
            //             arrRecByCCD = RecMsg2().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            //             if ("1.0000" == arrRecByCCD[0].Trim())
            //             {
            //                 //切换到标定场景 开始标定
            //                 ClientSendMsg2("s " + textBox_CalibClip.Text.Trim());
            //                 Thread.Sleep(300);
            //                 button_SingleCalib.PerformClick();
            //             }
            //             ClientSendMsg2("s " + textBox_CalibClip.Text.Trim());
            //             Thread.Sleep(20);
            //             //触发相机拍照
            //             ClientSendMsg2("M \r\n");
            //             //判断相机拍照结果      拍照OK则进行标定，NG则走偏移找Mark点
            //             arrRecByCCD = RecMsg2().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            //             if ("1.0000" == arrRecByCCD[0].Trim())
            //             {//走标定
            //                 if ("" == receiveInfoByCcd2)//如果标定OK，运行至第二个点
            //                 {
            //                     MoveToPointID("002");
            //                 }
            //             }
            //             else
            //             {//方形阵列偏移找Mark点
            //                 MoveByOffset_FindMToCalib();
            //             }

        }
        public void ChangeSceneAndM(string scene)
        {
            ClientSendMsg2("s " + scene/*textBox_FindMark.Text.Trim()*/);

        }
        /// <summary>
        /// 走24个点取寻找Mark点,到视野中心进行标定
        /// </summary>
        public void MoveByOffset_FindMToCalib()
        {
            //切换到拍Mark场景  触发相机拍照
            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
            Thread.Sleep(50);
            ClientSendMsg2("m\r\n");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            if ("1.0000" == arrRecByCCD[0].Trim())
            // if (recCCDMsg.Contains("OK"))
            {
                GoByCCD();//走到视野中心位置  进行标定
                Thread.Sleep(100);
                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                Thread.Sleep(50);
                CalibRobCam();//button_SingleCalib.PerformClick();
            }
            else
            {
                MoveByOffSet(1, "0", textBox_XOffsetDist.Text.Trim());// ClientSendMsg(XFindMarkOffSet("0", textBox_XOffsetDist.Text));RecMsg();// 1 往X+偏移**            
                //触发相机拍照  Mark
                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                Thread.Sleep(50);
                ClientSendMsg2("m\r\n");
                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                if ("1.0000" == arrRecByCCD[0].Trim())
                {
                    GoByCCD();
                    Thread.Sleep(100);
                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                    Thread.Sleep(50);
                    CalibRobCam();
                }
                else
                {
                    MoveByOffSet(2, "-", textBox_YOffsetDist.Text.Trim());//ClientSendMsg(YFindMarkOffSet("-", textBox_YOffsetDist.Text)); RecMsg();// 2 往Y-偏移**                   
                    //触发相机拍照  Mark
                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                    Thread.Sleep(50);
                    ClientSendMsg2("m\r\n");
                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    if ("1.0000" == arrRecByCCD[0].Trim())
                    {
                        GoByCCD();
                        Thread.Sleep(100);
                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                        Thread.Sleep(50);
                        CalibRobCam();
                    }
                    else
                    {
                        MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 3 往X-偏移**
                        //触发相机拍照
                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                        Thread.Sleep(50);
                        ClientSendMsg2("m\r\n");
                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                        if ("1.0000" == arrRecByCCD[0].Trim())
                        {
                            GoByCCD();
                            Thread.Sleep(100);
                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                            Thread.Sleep(50);
                            CalibRobCam();
                        }
                        else
                        {
                            MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 4 往X-偏移**

                            //触发相机拍照
                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                            Thread.Sleep(50);
                            ClientSendMsg2("m\r\n");

                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                            if ("1.0000" == arrRecByCCD[0].Trim())
                            {
                                GoByCCD();
                                Thread.Sleep(100);
                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                Thread.Sleep(50);
                                CalibRobCam();
                            }
                            else
                            {
                                MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 5 往Y+偏移**

                                //触发相机拍照
                                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                Thread.Sleep(50);
                                ClientSendMsg2("m\r\n");

                                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                if ("1.0000" == arrRecByCCD[0].Trim())
                                {
                                    GoByCCD();
                                    Thread.Sleep(100);
                                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                    Thread.Sleep(50);
                                    CalibRobCam();
                                }
                                else
                                {
                                    MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 6 往Y+偏移**

                                    //触发相机拍照
                                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                    Thread.Sleep(50);
                                    ClientSendMsg2("m\r\n");
                                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                    if ("1.0000" == arrRecByCCD[0].Trim())
                                    {
                                        GoByCCD();
                                        Thread.Sleep(100);
                                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                        Thread.Sleep(50);
                                        CalibRobCam();
                                    }
                                    else
                                    {
                                        MoveByOffSet(1, "0", textBox_XOffsetDist.Text.Trim());// 7 往X+偏移**

                                        //触发相机拍照
                                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                        Thread.Sleep(50);
                                        ClientSendMsg2("m\r\n");

                                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                        if ("1.0000" == arrRecByCCD[0].Trim())
                                        {
                                            GoByCCD();
                                            Thread.Sleep(100);
                                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                            Thread.Sleep(50);
                                            CalibRobCam();
                                        }
                                        else
                                        {
                                            MoveByOffSet(1, "0", textBox_XOffsetDist.Text.Trim());// 8 往X+偏移**

                                            //触发相机拍照
                                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                            Thread.Sleep(50);
                                            ClientSendMsg2("m\r\n");

                                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                            if ("1.0000" == arrRecByCCD[0].Trim())
                                            {
                                                GoByCCD();
                                                Thread.Sleep(100);
                                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                Thread.Sleep(50);
                                                CalibRobCam();
                                            }
                                            else
                                            {
                                                MoveByOffSet(1, "0", textBox_XOffsetDist.Text.Trim());// 9 往X+偏移**

                                                //触发相机拍照
                                                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                Thread.Sleep(50);
                                                ClientSendMsg2("m\r\n");

                                                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                if ("1.0000" == arrRecByCCD[0].Trim())
                                                {
                                                    GoByCCD();
                                                    Thread.Sleep(100);
                                                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                    Thread.Sleep(50);
                                                    CalibRobCam();
                                                }
                                                else
                                                {
                                                    MoveByOffSet(2, "-", textBox_YOffsetDist.Text.Trim());// 10 往Y-偏移**

                                                    //触发相机拍照
                                                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                    Thread.Sleep(50);
                                                    ClientSendMsg2("m\r\n");

                                                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                    if ("1.0000" == arrRecByCCD[0].Trim())
                                                    {
                                                        GoByCCD();
                                                        Thread.Sleep(100);
                                                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                        Thread.Sleep(50);
                                                        CalibRobCam();
                                                    }
                                                    else
                                                    {
                                                        MoveByOffSet(2, "-", textBox_YOffsetDist.Text.Trim());// 11 往Y-偏移**

                                                        //触发相机拍照
                                                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                        Thread.Sleep(50);
                                                        ClientSendMsg2("m\r\n");

                                                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                        if ("1.0000" == arrRecByCCD[0].Trim())
                                                        {
                                                            GoByCCD();
                                                            Thread.Sleep(100);
                                                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                            Thread.Sleep(50);
                                                            CalibRobCam();
                                                        }
                                                        else
                                                        {
                                                            MoveByOffSet(2, "-", textBox_YOffsetDist.Text.Trim());// 12 往Y-偏移**

                                                            //触发相机拍照
                                                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                            Thread.Sleep(50);
                                                            ClientSendMsg2("m\r\n");

                                                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                            if ("1.0000" == arrRecByCCD[0].Trim())
                                                            {
                                                                GoByCCD();
                                                                Thread.Sleep(100);
                                                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                Thread.Sleep(50);
                                                                CalibRobCam();
                                                            }
                                                            else
                                                            {
                                                                MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 13 往X-偏移**

                                                                //触发相机拍照
                                                                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                Thread.Sleep(50);
                                                                ClientSendMsg2("m\r\n");

                                                                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                if ("1.0000" == arrRecByCCD[0].Trim())
                                                                {
                                                                    GoByCCD();
                                                                    Thread.Sleep(100);
                                                                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                    Thread.Sleep(50);
                                                                    CalibRobCam();
                                                                }
                                                                else
                                                                {
                                                                    MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 14 往X-偏移**

                                                                    //触发相机拍照
                                                                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                    Thread.Sleep(50);
                                                                    ClientSendMsg2("m\r\n");

                                                                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                    if ("1.0000" == arrRecByCCD[0].Trim())
                                                                    {
                                                                        GoByCCD();
                                                                        Thread.Sleep(100);
                                                                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                        Thread.Sleep(50);
                                                                        CalibRobCam();
                                                                    }
                                                                    else
                                                                    {
                                                                        MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 15 往X-偏移**

                                                                        //触发相机拍照
                                                                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                        Thread.Sleep(50);
                                                                        ClientSendMsg2("m\r\n");

                                                                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                        if ("1.0000" == arrRecByCCD[0].Trim())
                                                                        {
                                                                            GoByCCD();
                                                                            Thread.Sleep(100);
                                                                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                            Thread.Sleep(50);
                                                                            CalibRobCam();
                                                                        }
                                                                        else
                                                                        {
                                                                            MoveByOffSet(1, "-", textBox_YOffsetDist.Text.Trim());// 16 往X-偏移**

                                                                            //触发相机拍照
                                                                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                            Thread.Sleep(50);
                                                                            ClientSendMsg2("m\r\n");

                                                                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                            if ("1.0000" == arrRecByCCD[0].Trim())
                                                                            {
                                                                                GoByCCD();
                                                                                Thread.Sleep(100);
                                                                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                Thread.Sleep(50);
                                                                                CalibRobCam();
                                                                            }
                                                                            else
                                                                            {
                                                                                MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 17 往Y+偏移**

                                                                                //触发相机拍照
                                                                                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                Thread.Sleep(50);
                                                                                ClientSendMsg2("m\r\n");

                                                                                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                {
                                                                                    GoByCCD();
                                                                                    Thread.Sleep(100);
                                                                                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                    Thread.Sleep(50);
                                                                                    CalibRobCam();
                                                                                }
                                                                                else
                                                                                {
                                                                                    MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 18 往Y+偏移**

                                                                                    //触发相机拍照
                                                                                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                    Thread.Sleep(50);
                                                                                    ClientSendMsg2("m\r\n");

                                                                                    if (recCCDMsg.Contains("OK"))
                                                                                    {
                                                                                        GoByCCD();
                                                                                        Thread.Sleep(100);
                                                                                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                        Thread.Sleep(50);
                                                                                        CalibRobCam();
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 19 往Y+偏移**

                                                                                        //触发相机拍照
                                                                                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                        Thread.Sleep(50);
                                                                                        ClientSendMsg2("m\r\n");

                                                                                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                        if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                        {
                                                                                            GoByCCD();
                                                                                            Thread.Sleep(100);
                                                                                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                            Thread.Sleep(50);
                                                                                            CalibRobCam();
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            MoveByOffSet(2, "0", textBox_YOffsetDist.Text.Trim());// 20 往Y+偏移**

                                                                                            //触发相机拍照
                                                                                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                            Thread.Sleep(50);
                                                                                            ClientSendMsg2("m\r\n");

                                                                                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                            if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                            {
                                                                                                GoByCCD();
                                                                                                Thread.Sleep(100);
                                                                                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                                Thread.Sleep(50);
                                                                                                CalibRobCam();
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                MoveByOffSet(1, "0", textBox_YOffsetDist.Text.Trim());// 21 往X+偏移**

                                                                                                //触发相机拍照
                                                                                                ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                                Thread.Sleep(50);

                                                                                                ClientSendMsg2("m\r\n");

                                                                                                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                                if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                                {
                                                                                                    GoByCCD();
                                                                                                    Thread.Sleep(100);
                                                                                                    ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                                    Thread.Sleep(50);
                                                                                                    CalibRobCam();
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    MoveByOffSet(1, "0", textBox_YOffsetDist.Text.Trim());// 22 往X+偏移**

                                                                                                    //触发相机拍照
                                                                                                    ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                                    Thread.Sleep(50);
                                                                                                    ClientSendMsg2("m\r\n");
                                                                                                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                                    if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                                    {
                                                                                                        GoByCCD();
                                                                                                        Thread.Sleep(100);
                                                                                                        ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                                        Thread.Sleep(50);
                                                                                                        CalibRobCam();
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        MoveByOffSet(1, "0", textBox_YOffsetDist.Text.Trim());// 23 往X+偏移**

                                                                                                        //触发相机拍照
                                                                                                        ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                                        Thread.Sleep(50);
                                                                                                        ClientSendMsg2("m\r\n");
                                                                                                        arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                                        if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                                        {
                                                                                                            GoByCCD();
                                                                                                            Thread.Sleep(100);
                                                                                                            ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                                            Thread.Sleep(50);
                                                                                                            CalibRobCam();
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            MoveByOffSet(1, "0", textBox_YOffsetDist.Text.Trim());// 24 往X+偏移**

                                                                                                            //触发相机拍照
                                                                                                            ClientSendMsgToCha(textBox_FindMark.Text.Trim());
                                                                                                            Thread.Sleep(50);
                                                                                                            ClientSendMsg2("m\r\n");
                                                                                                            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                                                                                                            if ("1.0000" == arrRecByCCD[0].Trim())
                                                                                                            {
                                                                                                                GoByCCD();
                                                                                                                Thread.Sleep(100);
                                                                                                                ClientSendMsgToCha(textBox_CalibR.Text.Trim());
                                                                                                                Thread.Sleep(50);
                                                                                                                CalibRobCam();
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                ListViewV2Show("未捕捉到Mark点");
                                                                                                                MessageBox.Show("没有找到Mark点！");

                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }

                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        public void Test24()
        {
            ClientSendMsg(XFindMarkOffSet("0", textBox_XOffsetDist.Text));// 1 往X+偏移**
            RecMsg();
            //button_SingleCalib.PerformClick();
            ClientSendMsg(YFindMarkOffSet("-", textBox_YOffsetDist.Text));// 2 往Y-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 3 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 4 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 5 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 6 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 7 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 8 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 9 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("-", textBox_YOffsetDist.Text));// 10 往Y-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("-", textBox_YOffsetDist.Text));// 11 往Y-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("-", textBox_YOffsetDist.Text));// 12 往Y-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 13 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 14 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 15 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("-", textBox_YOffsetDist.Text));// 16 往X-偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 17 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 18 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 19 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(YFindMarkOffSet("0", textBox_YOffsetDist.Text));// 20 往Y+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 21 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 22 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 23 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            ClientSendMsg(XFindMarkOffSet("0", textBox_YOffsetDist.Text));// 24 往X+偏移**
            RecMsg();
            ////触发相机拍照
            //ClientSendMsg2("m\r\n");
            //if ("0" == receiveInfoByCcd2)
            //{
            //    MessageBox.Show("没有找到Mark点！");
            //    ListViewV2Show("未捕捉到Mark点");
            //}
            //else
            //{
            //    ListViewV2Show("成功捕捉到Mark点");
            //}
            MessageBox.Show("跑完24个点");
        }

        string[] arrRecByCCD = new string[6];
        string recCCDMsg;//接收来自CCD的数据
        /// <summary>
        /// 标定信息处理
        /// </summary>
        public void RecMsg2()
        {
            recCCDMsg = null;
        re:
            Thread.Sleep(500);
            byte[] arrRecMsgCCD = new byte[256];
            socketClient2.ReceiveTimeout = 1000;
            try
            {
                int length = socketClient2.Receive(arrRecMsgCCD);
                if (length <= 4)
                {
                    goto re;
                }
                string strRecMsgV = Encoding.UTF8.GetString(arrRecMsgCCD, 0, length);
                string[] arrCInfo = strRecMsgV.Split(Environment.NewLine.ToCharArray());
                recCCDMsg = arrCInfo[1];
                Array.Clear(arrRecMsgCCD, 0, arrRecMsgCCD.Length);
                ListViewV2Show("From_CCD：" + recCCDMsg);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "接收数据超时", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        //             //Thread.Sleep(200);
        //             ////定义一个1M的内存缓冲区 用于临时性存储接收到的信息
        //             //byte[] arrRecMsgCCD = new byte[1024 * 1024];
        //             //try
        //             //{
        // 
        //             //    socketClient2.ReceiveTimeout = 2000;
        //             //    //将客户端套接字接收到的数据存入内存缓冲区, 并获取其长度
        //             //    int length = socketClient2.Receive(arrRecMsgCCD);
        //             //    //将套接字获取到的字节数组转换为字符串
        //             //    string strRecMsgV = Encoding.UTF8.GetString(arrRecMsgCCD, 0, length);
        //             //    //清空缓冲区
        //             //    Array.Clear(arrRecMsgCCD, 0, arrRecMsgCCD.Length);
        //             //    ListViewV2Show("From_CCD：" + strRecMsgV);
        //             //    return strRecMsgV;
        //             //}
        //             //catch
        //             //{
        //             //    MessageBox.Show("未接受到数据");
        //             //    return "";
        //             //}


        /// <summary>
        /// 走相机给的  偏移坐标
        /// </summary>
        /// <returns></returns>
        public void GoByCCD()
        {
            if (1 == comboBox_AbsOrRelat.SelectedIndex)
            {
                #region 走绝对坐标
                send[1] = JudgeNums();        //走绝对坐标
                send[2] = INFO;
                send[3] = MOVE_POINT;//offset_id;
                for (int i = 1; i <= 3; i++)
                {
                    arrRecByCCD[i] = string.Format("{0:0}", arrRecByCCD[i]);
                }
                //send[4] = "000;" + arrrecbyccd[1].trim() + "," + arrrecbyccd[2].trim() + ",0," + arrrecbyccd[3].trim() + ",0,0";
                send[4] = arrRecByCCD[1].Trim() + "," + arrRecByCCD[2].Trim() + "," + sZ + "," + arrRecByCCD[3].Trim() + ",0,0,1,0,0,0";
                int leng = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                // return strSend;
                #endregion
            }
            else if (0 == comboBox_AbsOrRelat.SelectedIndex)
            {
                send[1] = JudgeNums();     //  走相对坐标
                send[2] = INFO;
                send[3] = OFFSET_ID;
                for (int i = 1; i <= 3; i++)
                {
                    arrRecByCCD[i] = string.Format("{0:0}", arrRecByCCD[i]);
                }
                send[4] = "000;" + arrRecByCCD[1].Trim() + "," + arrRecByCCD[2].Trim() + ",0," + arrRecByCCD[3].Trim()/* + ",0,0"*/;
                int leng = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                //return strSend;
            }
            ClientSendMsg(strSend);
            RecMsg();
        }
        /// <summary>
        /// 将Z运动到标定高度
        /// </summary>
        public void MoveZByOffset()
        {
            SendRS();
            Thread.Sleep(200);
            //string z = recByRS;
            double dZ = Convert.ToDouble(recByRS);//double dZ = double.Parse(z);

            double dCalibH = Convert.ToDouble(textBox_CalibH.Text);
            double zOffset = dCalibH - dZ;
            double zAOffset = Math.Abs(zOffset);
            string offSet = zAOffset.ToString();
            //RobotZ Move offset
            if (zOffset > 0.00001)
            {
                MoveByOffSet(3, "0", offSet); //  ClientSendMsg(JogMoveVal("0", offSet));
            }
            else if (zOffset < -0.00001)
            {
                MoveByOffSet(3, "-", offSet);//ClientSendMsg(JogMoveVal("-", offSet));
            }
            else if (zOffset == 0)
            {
            }
            // RecMsg();
        }
        ManualResetEvent mre;
        bool suspend_resume = false;
        bool stop = false;
        private void button5_Click(object sender, EventArgs e)
        {
            if (button5.Text == "暂停")
            {
                suspend_resume = true;

                button5.Text = "继续";

            }
            else if (button5.Text == "继续")
            {
                suspend_resume = false;
                mre.Set();

                button5.Text = "暂停";
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            button5.Text = "暂停";
            stop = true;


        }
        public void SusOrRes()
        {
            if (stop)
            {
                return;
            }
            if (suspend_resume)
            {
                mre = new ManualResetEvent(false);
                mre.WaitOne();
            }
        }
        /// <summary>
        /// 标定机器人相机
        /// </summary>
        public void CalibRobCam()
        {

            //MoveZByOffset();//将z轴移动到标定高度
            // string z=GetCurZ();
            GetCurCoor();
            string strcurcoor1 = recRobotMsg;
            string strCurCoor = strcurcoor1.Substring(18/*15, strcurcoor1.Length - 5 - 15*/);
            string[] ss = strCurCoor.Split(new char[] { ',' });
            //string sZ = ss[3];
            sZ = ss[2];
            // ClientSendMsg2("S " + textBox_CalibR.Text.Trim());  //切换到机器人相机标定场景
            Thread.Sleep(100);
            if (1 == comboBox_AbsOrRelat.SelectedIndex)
            {
                #region  走绝对坐标
            Mflag: ClientSendMsg2("M \r\n");
                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                if ("-1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("结束校准，标定失败");
                    MessageBox.Show("结束校准，标定失败");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[5].Trim()))
                {
                    ListViewV2Show("校准完毕");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("0.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    //string str1 = GoByCCD();
                    //ClientSendMsg(str1);              
                    //RecMsg();
                    GoByCCD();
                    goto Mflag;
                }
                #endregion
            }

            else if (0 == comboBox_AbsOrRelat.SelectedIndex)
            {
                #region  走相对位置
            //double dCZ = Convert.ToDouble(sZ);
            Mflag1:
                //SusOrRes();
                //if (stop)
                //{
                //    button5.Text = "暂停";
                //    return;
                //}
                //if (suspend_resume)
                //{
                //    mre = new ManualResetEvent(false);
                //    mre.WaitOne();
                //}

                ClientSendMsg2("M \r\n");
                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                if ("-1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("结束校准，标定失败");
                    MessageBox.Show("结束校准，标定失败");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[5].Trim()))
                {
                    //回起始标定位置
                    send[1] = JudgeNums();
                    send[3] = MOVE_POINT;
                    send[4] = strCurCoor;
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4]; ;
                    ClientSendMsg(strSend);
                    RecMsg();
                    ListViewV2Show("校准完毕");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("0.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    //                     string str1 = GoByCCD();
                    //                     ClientSendMsg(str1);
                    //                     RecMsg();
                    GoByCCD();
                    Thread.Sleep(500);
                    goto Mflag1;
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    //回起始标定位置
                    send[1] = JudgeNums();
                    send[3] = MOVE_POINT;
                    send[4] = strCurCoor;
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4]; ;
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);
                    //                     string str2 = GoByCCD();
                    //                     ClientSendMsg(str2);
                    //                     RecMsg();
                    GoByCCD();
                    Thread.Sleep(500);
                    goto Mflag1;
                }
                #endregion
            }

        }
        /// <summary>
        /// 获取当前位置Z轴高度
        /// </summary>
        public string GetCurZ()
        {
            GetCurCoor();
            string strcurcoor1 = recRobotMsg;
            string strCurCoor = strcurcoor1.Substring(15, strcurcoor1.Length - 5 - 15);
            string[] ss = strCurCoor.Split(new char[] { ',' });
            //string sZ = ss[3];
            sZ = ss[2];
            return sZ;
        }
        string sZ;//标定时当前Z轴高度
        Thread thSingCali;
        /// <summary>
        /// 单工站标定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button_SingleCalib_Click(object sender, EventArgs e)
        {
            Application.DoEvents();
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            Thread.Sleep(20);
            thSingCali = new Thread(CalibRobCam);
            thSingCali.IsBackground = true;
            thSingCali.Start();
            //CalibRobCam();
            /*
            iClicked = 10;
            //检测当前传感器值,并移动z
            MoveZByOffset();
            //记录机器人当前坐标  Z轴的值
            GetCurCoor();
            string strcurcoor1 = RecMsg();
            string strCurCoor = strcurcoor1.Substring(15, strcurcoor1.Length - 5 - 15);
            string[] ss = strCurCoor.Split(new char[] { ',' });
            //string sZ = ss[3];
            sZ = ss[2];

            if (1 == comboBox_AbsOrRelat.SelectedIndex)
            {
                #region  走绝对坐标
            ////记录机器人当前坐标
            //GetCurCoor();
            //string strcurcoor1 = RecMsg();
            //string strCurCoor = strcurcoor1.Substring(15, strcurcoor1.Length - 5 - 15);
            //string[] ss = strCurCoor.Split(new char[] { ',' });
            //sZ = ss[2];

                    //触发机器人相机拍照

                Mflag: ClientSendMsg2("M \r");
                //ClientSendMsg2(textBox_CalibR.Text.Trim());//选择标定场景号
                //接收相机拍照结果
                arrRecByCCD = RecMsg2().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                if ("-1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("结束校准，标定失败");
                    MessageBox.Show("结束校准，标定失败");
                }
                //else if (("1.0000" == arrRecByCCD[5].Trim()))
                //{
                //    ListViewV2Show("结束校准");
                //    MessageBox.Show("结束校准");
                //}
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[5].Trim()))
                {
                    ListViewV2Show("校准完毕");
                    // MessageBox.Show("校准完毕");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("0.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    string str1 = GoByCCD();
                    ClientSendMsg(str1);//发消息让机器人动作
                    RecMsg();//接收机器人回PC指令
                    goto Mflag;
                }
                #endregion
            }

            else if (0 == comboBox_AbsOrRelat.SelectedIndex)
            {
                #region  走相对位置
                //iClicked = 10;
                ////检测当前传感器值,并移动z
                //MoveZByOffset();
                ////记录机器人当前坐标
                //GetCurCoor();
                //string strcurcoor1 = RecMsg();
                //string strCurCoor = strcurcoor1.Substring(15, strcurcoor1.Length - 5 - 15);
                //string[] ss = strCurCoor.Split(new char[] { ',' });
                ////string sZ = ss[3];
                //sZ = ss[2];
                double dCZ = Convert.ToDouble(sZ);

            //触发机器人相机拍照

            Mflag: ClientSendMsg2("M \r");
                // ClientSendMsg2(textBox_CalibR.Text.Trim());//选择标定场景号
                //接收相机拍照结果
                arrRecByCCD = RecMsg2().Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                if ("-1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("结束校准，标定失败");
                    MessageBox.Show("结束校准，标定失败");
                }
                //else if (("1.0000" == arrRecByCCD[5].Trim()))
                //{
                //    ListViewV2Show("结束校准");
                //    MessageBox.Show("结束校准");
                //}
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[5].Trim()))
                {
                    ListViewV2Show("校准完毕");
                    MessageBox.Show("校准完毕");
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("0.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    string str1 = GoByCCD();
                    ClientSendMsg(str1);//发消息让机器人动作
                    RecMsg();//接收机器人回PC指令
                    goto Mflag;
                }
                else if (("1.0000" == arrRecByCCD[0].Trim()) && ("1.0000" == arrRecByCCD[4].Trim()) && ("0.0000" == arrRecByCCD[5].Trim()))
                {
                    //回起始标定位置
                    send[1] = JudgeNums();
                    send[3] = MOVE_POINT;
                    send[4] = strCurCoor;
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4]; ;
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(20);
                    string str2 = GoByCCD();
                    ClientSendMsg(str2);
                    RecMsg();
                    goto Mflag;
                }
                #endregion
            }
            */


        }


        private void button1_Click(object sender, EventArgs e)
        {
            Test24();
        }
        public string XFindMarkOffSet(string dir, string xOffset)
        {
            send[1] = JudgeNums();
            send[2] = INFO;
            send[3] = OFFSET_ID;
            double xVal = Convert.ToDouble(xOffset);
            string strX = string.Format("{0:0}", xVal);

            send[4] = "000;" + dir + strX + ",0,0,0" + ",0,0";

            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            return strSend;
        }
        public string YFindMarkOffSet(string dir, string yOffset)
        {
            send[1] = JudgeNums();
            send[2] = INFO;
            send[3] = OFFSET_ID;

            double yVal = Convert.ToDouble(yOffset);
            string strY = string.Format("{0:0}", yVal);

            send[4] = "000;" + "0," + dir + strY + ",0,0" + ",0,0";
            int leng = (send[1] + send[2] + send[3] + send[4]).Length;
            send[0] = leng.ToString("0000");
            strSend = send[0] + send[1] + send[2] + send[3] + send[4];
            return strSend;
        }

        #region OPIO

        private void button_Cy1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                Get_IO_Status(CYLIND1_U);
                if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                {
                    button_Cy1.Text = "1气缸缩";
                    OperIO(SET_IO_O, CYLIND1_O);
                }
                else
                {
                    button_Cy1.Text = "1气缸伸";
                    OperIO(CLEAR_IO_O, CYLIND1_O);
                }

                //                 if (true == Get_IO_Status(CYLIND1_U))
                //                 {
                //                     button_Cy1.Text = "1气缸伸";
                //                     OperIO(SET_IO_O, CYLIND1_O);
                //                 }
                //                 else if (true == Get_IO_Status(CYLIND1_D))
                //                 {
                //                     button_Cy1.Text = "1气缸缩";
                //                     OperIO(CLEAR_IO_O, CYLIND1_O);
                //                 }

            }
            else { MessageBox.Show("未连接机器人", "提示"); }

        }
        private void button_Cy2_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                Get_IO_Status(CYLIND2_U);
                if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                {
                    button_Cy2.Text = "2气缸缩";
                    OperIO(SET_IO_O, CYLIND2_O);
                }
                else
                {
                    button_Cy2.Text = "2气缸伸";
                    OperIO(CLEAR_IO_O, CYLIND2_O);
                }
                //if (true == Get_IO_Status(CYLIND2_U))
                //{
                //    button_Cy1.Text = "2气缸伸";
                //    OperIO(SET_IO_O, CYLIND2_O);
                //}
                //else if (true == Get_IO_Status(CYLIND2_D))
                //{
                //    button_Cy1.Text = "2气缸缩";
                //    OperIO(CLEAR_IO_O, CYLIND2_O);
                //}
                //if (button_Cy2.Text == "2气缸伸")
                //{
                //    OperIO(SET_IO_O, CYLIND2_O);
                //    //OperIO(GET_IO_I, CYLIND2_D);
                //    button_Cy2.Text = "2气缸缩";
                //}
                //else
                //{
                //    OperIO(CLEAR_IO_O, CYLIND2_O);
                //    //OperIO(GET_IO_I, CYLIND2_U);
                //    button_Cy2.Text = "2气缸伸";
                //}
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        private void button_Cy3_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                Get_IO_Status(CYLIND3_U);
                if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                {
                    button_Cy3.Text = "3气缸缩";
                    OperIO(SET_IO_O, CYLIND3_O);
                }
                else
                {
                    button_Cy3.Text = "3气缸伸";
                    OperIO(CLEAR_IO_O, CYLIND3_O);
                }
                //if (true == Get_IO_Status(CYLIND3_U))
                //{
                //    button_Cy1.Text = "3气缸伸";
                //    OperIO(SET_IO_O, CYLIND3_O);
                //}
                //else if (true == Get_IO_Status(CYLIND3_D))
                //{
                //    button_Cy1.Text = "3气缸缩";
                //    OperIO(CLEAR_IO_O, CYLIND3_O);
                //}
                //                 if (button_Cy3.Text == "3气缸伸")
                //                 {
                //                     OperIO(SET_IO_O, CYLIND3_O);
                //                    // OperIO(GET_IO_I, CYLIND3_D);
                //                     button_Cy3.Text = "3气缸缩";
                //                 }
                //                 else
                //                 {
                //                     OperIO(CLEAR_IO_O, CYLIND3_O);
                //                    // OperIO(GET_IO_I, CYLIND3_U);
                //                     button_Cy3.Text = "3气缸伸";
                //                 }
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        private void button_Air1_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 Get_IO_Status(AIR1_I);
                //                 if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                //                 {
                //                     button_Air1.Text = "1真空关";
                //                     OperIO(SET_IO_O, AIR1_O);
                //                 }
                //                 else
                //                 {
                //                     button_Air1.Text = "1真空开";
                //                     OperIO(CLEAR_IO_O, AIR1_O);
                //                 }
                if (button_Air1.Text == "1真空开")
                {
                    OperIO(SET_IO_O, AIR1_O);
                    button_Air1.Text = "1真空关";
                }
                else
                {
                    OperIO(CLEAR_IO_O, AIR1_O);
                    button_Air1.Text = "1真空开";
                }
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        private void button_Air2_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                //                 Get_IO_Status(AIR2_I);
                //                 if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                //                 {
                //                     button_Air2.Text = "2真空关";
                //                     OperIO(SET_IO_O, AIR2_O);
                //                 }
                //                 else
                //                 {
                //                     button_Air2.Text = "2真空开";
                //                     OperIO(CLEAR_IO_O, AIR2_O);
                //                 }
                if (button_Air2.Text == "2真空开")
                {
                    OperIO(SET_IO_O, AIR2_O);
                    button_Air2.Text = "2真空关";
                }
                else
                {
                    OperIO(CLEAR_IO_O, AIR2_O);
                    button_Air2.Text = "2真空开";
                }
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        private void button_Air3_Click(object sender, EventArgs e)
        {
            if (socketClient != null)
            {
                Get_IO_Status(AIR3_I);
                if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                {
                    button_Air1.Text = "3真空关";
                    OperIO(SET_IO_O, AIR3_O);
                }
                else
                {
                    button_Air3.Text = "3真空开";
                    OperIO(CLEAR_IO_O, AIR3_O);
                }
                //                 if (button_Air3.Text == "3真空开")
                //                 {
                //                     OperIO(SET_IO_O, AIR3_O);
                //                     button_Air3.Text = "3真空关";
                //                 }
                //                 else
                //                 {
                //                     OperIO(CLEAR_IO_O, AIR3_O);
                //                     button_Air3.Text = "3真空开";
                //                 }
            }
            else { MessageBox.Show("未连接机器人", "提示"); }
        }
        #endregion

        private void button2_Click(object sender, EventArgs e)
        {
            textBox_VRec2.Text = RecRS();
        }

        private void button_GetCalibH_Click(object sender, EventArgs e)
        {
            SendRS();
            Thread.Sleep(200);
            textBox_CalibH.Text = recByRS;
        }

        private void TcpDemo_FormClosed(object sender, FormClosedEventArgs e)
        {
            //if (socketClient != null)
            //{
            //    //socketClient.Shutdown(SocketShutdown.Both);
            //    //socketClient.Disconnect(true);
            //    socketClient.Dispose();
            //    socketClient.Close();
            //}
            //if (socketClient2 != null)
            //{
            //    socketClient2.Dispose();
            //    socketClient2.Close();
            //}
        }

        Thread thCalib24;
        private void button3_Click(object sender, EventArgs e)
        {
            thCalib24 = new Thread(MoveByOffset_FindMToCalib);
            thCalib24.Start();
            //MoveByOffset_FindMToCalib();
        }
        /// <summary>
        /// 三夹爪标定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button_CalibClip_Click(object sender, EventArgs e)
        {
            Application.DoEvents();
            MoveToPointID("033");
            Thread.Sleep(20);

            ClientSendMsg2("m ");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            if ("1.0000" == arrRecByCCD[0].Trim())
            {
                ListViewV2Show("夹爪1 OK");
                Thread.Sleep(20);
                //顺时针旋转90度
                MoveByOffSet(4, "0", "90");
                ClientSendMsg2("m ");
                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                if ("1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("夹爪2 OK");
                    Thread.Sleep(20);
                    //顺时针旋转90度
                    MoveByOffSet(4, "0", "90");
                    ClientSendMsg2("m ");
                    arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    if ("1.0000" == arrRecByCCD[0].Trim())
                    {
                        ListViewV2Show("夹爪3 OK");
                    }
                    else
                    {
                        MessageBox.Show("夹爪3校准失败");
                    }
                }
                else
                {
                    MessageBox.Show("夹爪2校准失败");
                }
            }
            else
            {
                MessageBox.Show("夹爪1校准失败");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int i = 1;
            do
            {
                MoveToPointID("00" + i.ToString());
                Thread.Sleep(50);
                MoveToPointID("00" + (i + 1).ToString());
                Thread.Sleep(50);
                MoveToPointID("00" + i.ToString());
                Thread.Sleep(50);

                i = i + 2;
            } while (i <= 11);


        }

        private void TcpDemo_FormClosing(object sender, FormClosingEventArgs e)
        {
            //DialogResult dia = MessageBox.Show("是否真的退出系统！", "", MessageBoxButtons.OKCancel);
            //if (dia == DialogResult.Cancel)
            //{
            //    e.Cancel = true;
            //}
            //else if (dia == DialogResult.OK)
            //{
            //    if (socketClient != null)
            //    {
            //        //socketClient.Shutdown(SocketShutdown.Both);
            //        //socketClient.Disconnect(true);
            //        socketClient.Dispose();
            //        socketClient.Close();
            //    }
            //    if (socketClient2 != null)
            //    {
            //        socketClient2.Dispose();
            //        socketClient2.Close();
            //    }
            //    System.Environment.Exit(0);//Application.Exit();
            //}
        }


        private void button6_Click(object sender, EventArgs e)
        {
            ClientSendMsg2("m");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            if (("1.0000" == arrRecByCCD[0].Trim()))
            {
                GoByCCD();

            }
            else
            {
                MessageBox.Show("NG");
            }
        }
        /// <summary>
        /// 在坐标中获取指定位置的坐标
        /// </summary>
        public string Get_Fing_Coor(int row)
        {
            string strCoor = dataGridView_RPoint.Rows[row - 1].Cells[1].Value.ToString();
            return strCoor;
        }
        private void button9_Click(object sender, EventArgs e)
        {
            //拍照    偏移值+点位坐标=取料位
            ClientSendMsg2("m");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            if ("-1.0000" == arrRecByCCD[0].Trim())
            {
                ListViewV2Show("拍照NG");
                MessageBox.Show("拍照NG");
            }
            else
            {
//                 string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_JZAQ_ID.Text.Trim()))).Split(',');   yyyy
//                 string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
//                 string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
//                 string zAQ = arrJZAQCoor[2].ToString();
//                 string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();
// 
//                 SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
//                 Thread.Sleep(50);
// 
//                 send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
//                 send[2] = INFO;
//                 send[3] = MOVE_POINT;
//                 send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
//                 int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
//                 send[0] = leng1.ToString("0000");
//                 strSend = send[0] + send[1] + send[2] + send[3] + send[4];
//                 ClientSendMsg(strSend);
//                 RecMsg();
//                 Thread.Sleep(50);     yyyy

//                 MoveByOffSet(4, "0", "90");
//                 Thread.Sleep(50);
                if (comboBox_Cyl.SelectedIndex == 0)//气缸1
                {
                    string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_1JA.Text.Trim()))).Split(',');
                    string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                    string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                    string zAQ = arrJZAQCoor[2].ToString();
                    string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                    SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                    Thread.Sleep(50);

                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(50);


                    //  OperIO(SET_IO_O, AIR1_O);
                    OperIO(SET_IO_O, CYLIND1_O);
                    //if (Get_IO_Status(CYLIND1_D) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND1_D);
                    //                     if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                     {
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_1J.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);
                    OperIO(SET_IO_O, AIR1_O);
                    Thread.Sleep(500);
                    //  Get_IO_Status(AIR3_I);
                    //                         if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                         {
                    OperIO(CLEAR_IO_O, CYLIND1_O);
                    //if (Get_IO_Status(CYLIND1_U) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND3_U);

                    //                           //  if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                             {
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                    //  MoveToPointID("80");
                    //  Thread.Sleep(50);
                    //  MoveToPointID("81");
                    // Thread.Sleep(50);
                    //                 MoveToPointID("82");
                    //                 Thread.Sleep(50);


                    //Thread.Sleep(50);
                    // OperIO(CLEAR_IO_O, AIR1_O);
                    /*}*/

                    //                             else
                    //                                 MessageBox.Show("未接受到气缸顶起到位信号");
                    // 
                    //                         }
                    //                         else
                    //                             MessageBox.Show("未接受到真空1信号");
                    // 
                    //                     }
                    //                     else
                    // 
                    //                         MessageBox.Show("未接受到气缸下降到位信号");
                    /*  }*/
                }
                else if (comboBox_Cyl.SelectedIndex == 1)
                {
                    string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_2JA.Text.Trim()))).Split(',');
                    string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                    string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                    string zAQ = arrJZAQCoor[2].ToString();
                    string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                    SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                    Thread.Sleep(50);

                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(50);


                    //  OperIO(SET_IO_O, AIR3_O);
                    OperIO(SET_IO_O, CYLIND2_O);
                    //if (Get_IO_Status(CYLIND1_D) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND1_D);
                    //                     if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                     {
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_2J.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);
                    OperIO(SET_IO_O, AIR2_O);
                    Thread.Sleep(500);
                    //  Get_IO_Status(AIR3_I);
                    //                         if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                         {
                    OperIO(CLEAR_IO_O, CYLIND2_O);
                    //if (Get_IO_Status(CYLIND1_U) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND3_U);

                    //                           //  if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                             {
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                }
                else if (comboBox_Cyl.SelectedIndex == 2)
                {
                    string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_JZAQ_ID.Text.Trim()))).Split(',');
                    string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                    string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                    string zAQ = arrJZAQCoor[2].ToString();
                    string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                    SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                    Thread.Sleep(50);

                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(50);


                    //  OperIO(SET_IO_O, AIR3_O);
                    OperIO(SET_IO_O, CYLIND3_O);
                    //if (Get_IO_Status(CYLIND1_D) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND1_D);
                    //                     if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                     {
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_JZ_ID.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);
                    OperIO(SET_IO_O, AIR3_O);
                    Thread.Sleep(500);
                    //  Get_IO_Status(AIR3_I);
                    //                         if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                         {
                    OperIO(CLEAR_IO_O, CYLIND3_O);
                    //if (Get_IO_Status(CYLIND1_U) == true)
                    //{
                    Thread.Sleep(500);
                    //  Get_IO_Status(CYLIND3_U);

                    //                           //  if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                    //                             {
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                 }

            }
        }

        private void button8_Click_1(object sender, EventArgs e)
        {
            //             SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
            //             aa:
            //             MoveToPointID("25");
            //             Thread.Sleep(50);
            //             MoveToPointID("26");
            //             Thread.Sleep(50);
            //             MoveToPointID("27");
            //             Thread.Sleep(50);
            //             goto aa;
        }

        private void button10_Click_1(object sender, EventArgs e)
        {
            ClientSendMsg2("m");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            if ("-1.0000" == arrRecByCCD[0].Trim())
            {
                ListViewV2Show("拍照NG");
                MessageBox.Show("拍照NG");
            }
            else
            {
                string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_JZAQ_ID.Text.Trim()))).Split(',');
                string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                string zAQ = arrJZAQCoor[2].ToString();
                string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                Thread.Sleep(50);

                send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                send[2] = INFO;
                send[3] = MOVE_POINT;
                send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng1.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                ClientSendMsg(strSend);
                RecMsg();
                Thread.Sleep(50);

                if (comboBox_Cyl.SelectedIndex == 0)//气缸1
                {
                    OperIO(SET_IO_O, AIR1_O);
                    OperIO(SET_IO_O, CYLIND1_O);
                    //if (Get_IO_Status(CYLIND1_D) == true)
                    //{
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_JZ_ID.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);

                    OperIO(CLEAR_IO_O, CYLIND1_O);
                    //if (Get_IO_Status(CYLIND1_U) == true)
                    //{
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                    MoveToPointID(textBox_Leave_ID.Text.Trim());
                    Thread.Sleep(50);
                    // OperIO(CLEAR_IO_O, AIR1_O);
                    //}
                    //else
                    //    MessageBox.Show("未接受到气缸顶起到位信号");

                    //}
                    //else

                    //    MessageBox.Show("未接受到气缸下降到位信号");
                }
                else if (comboBox_Cyl.SelectedIndex == 1)
                {
                    OperIO(SET_IO_O, AIR2_O);
                    OperIO(SET_IO_O, CYLIND2_O);
                    //if (Get_IO_Status(CYLIND2_D) == true)
                    //{
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_JZ_ID.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);

                    OperIO(CLEAR_IO_O, CYLIND2_O);
                    //if (Get_IO_Status(CYLIND2_U) == true)
                    //{
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                    MoveToPointID(textBox_Leave_ID.Text.Trim());
                    Thread.Sleep(50);
                    OperIO(CLEAR_IO_O, AIR2_O);
                    //}
                    //    else
                    //        MessageBox.Show("未接受到气缸顶起到位信号");

                    //}
                    //else

                    //    MessageBox.Show("未接受到气缸下降到位信号");
                }
                else if (comboBox_Cyl.SelectedIndex == 2)
                {
                    OperIO(SET_IO_O, AIR3_O);
                    OperIO(SET_IO_O, CYLIND3_O);
                    //if (Get_IO_Status(CYLIND3_D) == true)
                    //{
                    string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_JZ_ID.Text.Trim()))).Split(',');
                    string zJZ = arrJZCoor[2].ToString();
                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                    int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng2.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(500);

                    OperIO(CLEAR_IO_O, CYLIND3_O);
                    //if (Get_IO_Status(CYLIND3_U) == true)
                    //{
                    //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    //             send[2] = INFO;
                    //             send[3] = MOVE_POINT;
                    //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                    //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    //             send[0] = leng3.ToString("0000");
                    //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    //             ClientSendMsg(strSend);
                    //             RecMsg();
                    MoveByOffSet(3, "0", "30");
                    Thread.Sleep(50);
                    MoveToPointID(textBox_Leave_ID.Text.Trim());
                    Thread.Sleep(50);
                    // OperIO(CLEAR_IO_O, AIR3_O);
                    //        }
                    //        else
                    //            MessageBox.Show("未接受到气缸顶起到位信号");

                    //    }
                    //    else

                    //        MessageBox.Show("未接受到气缸下降到位信号");
                }

            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            //if (socketClient!=null)
            //{
            //    GetCurCoor();
            //    Thread.Sleep(20);
            //    string[] arrCoor = recRobotMsg.Substring(18).Split(',');
            //    label_CUR_X.Text = arrCoor[0];
            //    label_CUR_Y.Text = arrCoor[1];
            //    label_CUR_Z.Text = arrCoor[2];
            //    label_CUR_U.Text = arrCoor[3];

            //}

        }

        private void button11_Click_1(object sender, EventArgs e)
        {
            ClientSendMsg2("m");
            arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            if ("-1.0000" == arrRecByCCD[0].Trim())
            {
                ListViewV2Show("拍照NG");
                MessageBox.Show("拍照NG");
            }
            else
            {
                string[] arrJZAQCoor = (Get_Fing_Coor(int.Parse(textBox_JZAQ_ID.Text.Trim()))).Split(',');
                string x = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                string y = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                string zAQ = arrJZAQCoor[2].ToString();
                string u = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                Thread.Sleep(50);

                send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                send[2] = INFO;
                send[3] = MOVE_POINT;
                send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                int leng1 = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng1.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                ClientSendMsg(strSend);
                RecMsg();
                Thread.Sleep(50);

                //                 if (comboBox_Cyl.SelectedIndex == 0)//气缸1
                //                 {
                OperIO(SET_IO_O, AIR3_O);
                OperIO(SET_IO_O, CYLIND3_O);
                //if (Get_IO_Status(CYLIND1_D) == true)
                //{
                Thread.Sleep(500);
                Get_IO_Status(CYLIND1_D);
                //                     if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                //                     {
                string[] arrJZCoor = (Get_Fing_Coor(int.Parse(textBox_JZ_ID.Text.Trim()))).Split(',');
                string zJZ = arrJZCoor[2].ToString();
                send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                send[2] = INFO;
                send[3] = MOVE_POINT;
                send[4] = x + "," + y + "," + zJZ + "," + u + "," + "0,0,1,0,0,0";
                int leng2 = (send[1] + send[2] + send[3] + send[4]).Length;
                send[0] = leng2.ToString("0000");
                strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                ClientSendMsg(strSend);
                RecMsg();
                Thread.Sleep(500);

                Get_IO_Status(AIR3_I);
                //                         if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                //                         {
                OperIO(CLEAR_IO_O, CYLIND3_O);
                //if (Get_IO_Status(CYLIND1_U) == true)
                //{
                Thread.Sleep(500);
                Get_IO_Status(CYLIND3_U);

                //                             if (recRobotMsg.Substring(recRobotMsg.Length - 1) == "1")
                //                             {
                //             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                //             send[2] = INFO;
                //             send[3] = MOVE_POINT;
                //             send[4] = x + "," + y + "," + zAQ + "," + u + "," + "0,0,1,0,0,0";
                //             int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                //             send[0] = leng3.ToString("0000");
                //             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                //             ClientSendMsg(strSend);
                //             RecMsg();
                MoveByOffSet(3, "0", "30");
                Thread.Sleep(50);
                MoveToPointID("80");
                Thread.Sleep(50);       
                MoveToPointID("81");
                Thread.Sleep(50);
//                 MoveToPointID("82");
//                 Thread.Sleep(50);

                ClientSendMsg2("s_16");
                Thread.Sleep(400);
                MoveToPointID("77");//B
                Thread.Sleep(50);
                ClientSendMsg2("m");
                Thread.Sleep(50);
                MoveToPointID("76");//A
                Thread.Sleep(50);
                ClientSendMsg2("m");
                Thread.Sleep(50);
                MoveByOffSet(2, "0", "100");
                Thread.Sleep(50);

                arrRecByCCD = recCCDMsg.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                if ("-1.0000" == arrRecByCCD[0].Trim())
                {
                    ListViewV2Show("拍照NG");
                    MessageBox.Show("拍照NG");
                }
                else
                {
                    string[] arrJZAQCoor2 = (Get_Fing_Coor(79)).Split(',');
                    string x2 = (double.Parse(arrRecByCCD[1]) + double.Parse(arrJZAQCoor[0])).ToString();
                    string y2 = (double.Parse(arrRecByCCD[2]) + double.Parse(arrJZAQCoor[1])).ToString();
                    string zAQ2 = arrJZAQCoor[2].ToString();
                    string u2 = (double.Parse(arrRecByCCD[3]) + double.Parse(arrJZAQCoor[3])).ToString();

                    SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
                    Thread.Sleep(50);

                    send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
                    send[2] = INFO;
                    send[3] = MOVE_POINT;
                    send[4] = x2 + "," + y2 + "," + zAQ2 + "," + u2 + "," + "0,0,1,0,0,0";
                    int leng3 = (send[1] + send[2] + send[3] + send[4]).Length;
                    send[0] = leng1.ToString("0000");
                    strSend = send[0] + send[1] + send[2] + send[3] + send[4];
                    ClientSendMsg(strSend);
                    RecMsg();
                    Thread.Sleep(50);
                    OperIO(SET_IO_O, CYLIND3_O);
                    Thread.Sleep(50);
                    MoveByOffSet(3, "-", "17");
                }
            }
        }
        bool bMove=true;
        Thread thtest;
        private void button12_Click_2(object sender, EventArgs e)
        {
//             SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);
//             send[1] = JudgeNums();//label_Vel.Text  label_Acc.Text  label_Dec.Text
//             send[2] = INFO;
//             send[3] = MOVE_ID;
//             send[4] = "001";//dataGridView_RPoint.CurrentCell.Value.ToString().Trim();
//             int leng = (send[1] + send[2] + send[3] + send[4]).Length;
//             send[0] = leng.ToString("0000");
//             strSend = send[0] + send[1] + send[2] + send[3] + send[4];
//             ClientSendMsg(strSend);
//             Thread.Sleep(200);
//             OperIO(SET_IO_O, CYLIND1_O);
//             RecMsg();
//        
//             if(bMove==true)
//             Application.DoEvents();
            thtest = new Thread(test);
            
            thtest.IsBackground = true;
            thtest.Start();

        }
        public void test()
        {
            bMove = true;
            SetCurVel(label_Vel.Text, label_Acc.Text, label_Dec.Text);

            int i =1;
            do
            {
                if (bMove == false)
                {
                    return;
                }
                MoveToPointID(i.ToString());
                Thread.Sleep(100);
                i = i + 1;
                if (i == 3)
                {
                    i = 1;
                }
            } while (i <= 3);
        }
        private void button13_Click(object sender, EventArgs e)
        {
            bMove = false;
        }

        private void exitbutton_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

