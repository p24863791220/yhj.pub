using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Configuration;
using 无人值守.Moders;
using System.IO;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;

namespace WindowsFormsApplication1
{
    public partial class FormAuto : Form
    {
        //private static IPEndPoint ipEndS;//接收用
        //private static IPEndPoint ipEndC; //发射用   
        private static UdpClient udpS = new UdpClient();//接收用
        private static UdpClient udpC = new UdpClient();//发射用 
                                                        //private ManualResetEvent receiveDone = new ManualResetEvent(false)

        private Queue<string> queue = new Queue<string>(10);
        private Queue<RadioTargetFrame> queue2 = new Queue<RadioTargetFrame>(10);

        private static string Settings(String name, string value, bool types)
        {

            Configuration config = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            if (types)//true读取
            {
                string str = config.AppSettings.Settings[name].Value;
                return str;
            }
            else//false写入
            {
                config.AppSettings.Settings[name].Value = value;
                //增加<add>元素
                //config.AppSettings.Settings.Add("url", "http://www.163.net");
                //删除<add>元素
                //config.AppSettings.Settings.Remove("name");
                config.Save();
                System.Configuration.ConfigurationManager.RefreshSection("appSettings");
                return "1";
            }
        }
        public FormAuto()
        {
            InitializeComponent();
            listBox1.HorizontalScrollbar = true;
            //findtargetListview.Clear();
            //runstateListview.Clear();
            //stoken = getToken();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = false;
            this.GetIp();
            string str = Settings("LocalIP", "", true).Trim();
            this.ipcomboBox.Items.Add(str);
            this.ipcomboBox.Text = str;

            str = Settings("LocalPort", "", true).Trim();
            this.portcomboBox.Items.Add(str);
            this.portcomboBox.Text = str;

            str = Settings("yLocalIP", "", true).Trim();
            this.cipcomboBox.Items.Add(str);
            this.cipcomboBox.Text = str;
            str = Settings("yLocalPort", "", true).Trim();
            this.cportcomboBox.Items.Add(str);
            this.cportcomboBox.Text = str;

            str = Settings("unitid", "", true).Trim();
            this.unitidTextbox.Text =str;

            str = Settings("sendtime", "", true).Trim();
            this.statepisTextbox.Text =str;

            str = Settings("userid", "", true).Trim();
            this.useridTextbox .Text = str;

        }
        private void createDataFind(findtarget ft)//
        {
                this.findtargetListview.BeginUpdate();    //数据更新，UI暂时挂起，直到EndUpdate绘制控件，可以有效避免闪烁并大大提高加载速度
                ListViewItem lvi2 = new ListViewItem();
                lvi2.SubItems.Add(ft.unitid);
                lvi2.SubItems.Add(ft.sid);
                lvi2.SubItems.Add(ft.sbjd);
                lvi2.SubItems.Add(ft.sbwd );
                lvi2.SubItems.Add(ft.hbgd);
                lvi2.SubItems.Add(ft.mbfw);
                lvi2.SubItems.Add(ft.mbjl);
                lvi2.SubItems.Add(ft.userid );
                this.findtargetListview.Items.Add(lvi2);
                this.findtargetListview.EndUpdate();   //结束数据处理，UI界面一次性绘制。
                findtargetListview.Items[0].Selected =true;
                sendfinddata();
                return;
        }
        private void createDataState(RunState rs)//
        {
                this.runstateListview.BeginUpdate();    //数据更新，UI暂时挂起，直到EndUpdate绘制控件，可以有效避免闪烁并大大提高加载速度
                ListViewItem lvi2 = new ListViewItem();
                lvi2.SubItems.Add(rs.unitid);
                lvi2.SubItems.Add(rs.sid);
                lvi2.SubItems.Add(rs.yxzt);
                lvi2.SubItems.Add(rs.sbjd);
                lvi2.SubItems.Add(rs.sbwd);
                lvi2.SubItems.Add(rs.hbgd);
                lvi2.SubItems.Add(rs.userid);
                this.runstateListview.Items.Add(lvi2);
                this.runstateListview.EndUpdate();   //结束数据处理，UI界面一次性绘制。

                runstateListview.Items[0].Selected = true;
            if (sendtime == null)
                sendtime = DateTime.Now;
            else
            {

                double secInterval1 = DateTime .Now .Subtract(sendtime).TotalSeconds;
                if (secInterval1 < sencondtime)
                    return;
                else
                    sendtime = DateTime.Now;
            }

                sendstateData();    

        }
        public static long sencondtime;//设定间隔时间 秒
        public static DateTime  sendtime;//上次发送时间
        private static void AsyncSendCallback(IAsyncResult iar)
        {
            UdpClient udpState = iar.AsyncState as UdpClient;
            if (iar.IsCompleted)
            {
                udpState.EndSend(iar);
            }
        }

        public void button1_Click(object sender, EventArgs e)//发送
        {
            try
            {
                if ((cipcomboBox.Text.Trim() == "") || (cportcomboBox.Text.Trim() == "")) return;
                IPEndPoint ipEndC = new IPEndPoint(IPAddress.Parse(cipcomboBox.Text.Trim()), int.Parse ( cportcomboBox.Text.Trim()));
                udpC.Client.Connect(ipEndC);
                string strSend = this.textBox1.Text +" test";
                byte[] sendByte = Encoding.UTF8.GetBytes(strSend);
                udpC.BeginSend(sendByte, sendByte.Length, ipEndC, new AsyncCallback(AsyncSendCallback), udpC);
                //toolStripStatusLabel1.BackColor = Color.Green;
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
            }
        }
        private void timer1_Tick(object sender, EventArgs e)//udp后台进程接收
        {
            timer1.Enabled = false;
            receive();//启动udp接收消息
        }
        public static Thread threadOne;//udp接收线程
        public void receive()//udp同步接收
        {
            try
            {
                if ((ipcomboBox.Text.Trim() == "") || (portcomboBox.Text.Trim() == "")) return;
                IPEndPoint ipEndS = new IPEndPoint(IPAddress.Parse(ipcomboBox.Text.Trim()), int.Parse(portcomboBox.Text.Trim()));
                udpS.Client.Bind(ipEndS);
                //threadOne = new Thread(new ParameterizedThreadStart(ReceiveMessages));//同步接收
                threadOne = new Thread(new ParameterizedThreadStart(receiveUdpAsyn));//异步接收
                threadOne.IsBackground = true;
                Application.DoEvents();
                threadOne.Start(udpS);
                Application.DoEvents();
                toolStripStatusLabel1.BackColor = Color.Green;
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;                
            }
        }
        public void GetIp()
        {
            string hostName = Dns.GetHostName();
            IPAddress[] addressList = Dns.GetHostAddresses(hostName);
            foreach (IPAddress ip in addressList)
            {
                if (ip.ToString().IndexOf(".") > 0)
                {
                    ipcomboBox.Items.Add(ip.ToString());
                }
            }
        }
        public void ReceiveMessages(object o)//后台同步udp接收线程
        {
            try
            {
                UdpClient u = o as UdpClient;
                byte[] buffers;
                IPEndPoint iep = new IPEndPoint(IPAddress.Any, 0);
                while (true)
                {
                    buffers = u.Receive(ref iep);
                    if (buffers.Length > 0)
                    {
                        string str = Encoding.UTF8.GetString(buffers);
                        listBox1.Items.Add(str);
                    }
                    if (iep.Address != null)
                    {
                        //cipcomboBox.Text = iep.Address.ToString();
                        //cportcomboBox.Text = iep.Port.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
                udpS = new UdpClient();
            }

        }

        private void button2_Click(object sender, EventArgs e)//savebutton存储设定值
        {
            {
                string str = Settings("LocalIP", ipcomboBox.Text.Trim(), false);
                str = Settings("LocalPort", portcomboBox.Text.Trim(), false);
                str = Settings("yLocalIP", cipcomboBox.Text.Trim(), false);
                str = Settings("yLocalPort", cportcomboBox.Text.Trim(), false);
                str = Settings("userid", useridTextbox.Text.Trim(), false);
                str = Settings("sendtime",statepisTextbox.Text.Trim(),false);
                str = Settings("unitid", unitidTextbox.Text.Trim(), false);
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
        private void getArray(string str)
        {
            String[] strArray = str.Split(' ').ToArray();
            string[] sdataT = new string[strArray.Count()];
            strArray = 无人值守.Controller.Datatransfrom.transformReverse(strArray, ref sdataT, strArray.Length);
            strArray = sdataT;
            string stra = "";
            try
            {
                if (strArray.Count() > 0)
                {
                    for (int i = 0; i < strArray.Count() - 1; i++)
                    {
                        if (i == 0)
                            stra = strArray.ElementAt(i).ToString();
                        else
                            stra = stra + "," + strArray.ElementAt(i).ToString();
                    }
                }
                textBox2.Text = stra;
            }
            catch (Exception ex)
            {
                textBox2.Text = stra;
            }  
        }
        private void textBox1_DoubleClick(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim ().Length > 0)
            {
                string strtext = textBox1.Text.Trim();
                //以%分割字符串，并去掉空字符
                string[] chars = strtext.Split(' ');//new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                byte[] b = new byte[chars.Length];
                //逐个字符变为16进制字节数据
                for (int i = 0; i < chars.Length; i++)
                {
                    b[i] = Convert.ToByte(chars[i], 16);
                }
                int outlen;
                byte[] getbytes=dataTransform.DisTranslate(b,b.Length, out outlen);
                bool returnb = dataTransform.ParseData(b, b.Length);
                string str = byteToHexStr(getbytes ,outlen);//System.Text.Encoding.UTF8.GetString(getbytes);
                textBox2.Text = str;
            }
        }        
        /// <summary>
        /// 字节数组转16进制字符串
        /// </summary>
        /// <param name="bytes"></param>
        /// <returns></returns>
        public static string byteToHexStr(byte[] bytes,int outlen)
        {
            string returnStr = "";
            if (bytes != null)
            {
                for (int i = 0;i<outlen  ; i++)// i < bytes.Length / 2 - 1
                {
                    if (i==0)
                    returnStr = bytes[i].ToString("X2");
                    else
                    returnStr +=" "+ bytes[i].ToString("X2");
                }
            }
            return returnStr;
        }
        private void findtargetListview_DoubleClick(object sender, EventArgs e)
        {

            if (cipcomboBox.Enabled == true)
            {
                int Index = 0;
                if (this.findtargetListview.SelectedItems.Count > 0)//判断listview有被选中项
                {
                    Index = this.findtargetListview.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0  
                }
                else
                    return;
                sendfinddata();
                if (findtargetListview.Items[Index].BackColor == Color.Green)
                    findtargetListview.Items.RemoveAt(Index);
            }
        }
        public void sendfinddata()
        { 
            int Index = 0;
            if (this.findtargetListview.SelectedItems.Count > 0)//判断listview有被选中项
            {
                Index = this.findtargetListview.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0  
            }
            else
                return;
            findtarget ft = new findtarget();
            ft.unitid = findtargetListview.SelectedItems[0].SubItems[1].Text;
            ft.sid = findtargetListview.SelectedItems[0].SubItems[2].Text;
            ft.sbjd = findtargetListview.SelectedItems[0].SubItems[3].Text;
            ft.sbwd = findtargetListview.SelectedItems[0].SubItems[4].Text;
            ft.hbgd = findtargetListview.SelectedItems[0].SubItems[5].Text;
            ft.mbfw = findtargetListview.SelectedItems[0].SubItems[6].Text;
            ft.mbjl = findtargetListview.SelectedItems[0].SubItems[7].Text;
            ft.userid = findtargetListview.SelectedItems[0].SubItems[8].Text;

            if (stoken == null)
                stoken = getToken();
            if (stoken == "error" || stoken == null)
            {
                stoken = getToken();
            }
            if (stoken.Length > 10)
            {
                string returnStr = sendfindTarget(ft);
                if (returnStr == "success")
                {
                    findtargetListview.Items[Index].BackColor = Color.Green;
                    toolStripStatusLabel2.Text = "运行信息提示:";
                }
                else
                {
                    findtargetListview.Items[Index].BackColor = Color.Yellow;
                    toolStripStatusLabel2.Text = "运行信息提示:发送目标信息数据未成功";
                }
            }
            else
            {
                findtargetListview.Items[Index].BackColor = Color.Yellow;
                toolStripStatusLabel2.Text = "运行信息提示：未得到token!";
            }
        }

        private void runstateListview_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void runstateListview_DoubleClick(object sender, EventArgs e)
        {
            if (cipcomboBox.Enabled == true)
            {

                int Index = 0;
                if (this.runstateListview.SelectedItems.Count > 0)//判断listview有被选中项
                {
                    Index = this.runstateListview.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0  
                }
                sendstateData();
                if (runstateListview.Items[Index].BackColor == Color.Green )
                    runstateListview.Items.RemoveAt(Index);
            }
            }
        public void sendstateData()
        { 
            int Index=0 ;
            if (this.runstateListview.SelectedItems.Count > 0)//判断listview有被选中项
            {
                Index = this.runstateListview.SelectedItems[0].Index;//取当前选中项的index,SelectedItems[0]这必须为0  
            }
            else
                return;
            RunState rs = new RunState();
            rs.unitid = runstateListview.SelectedItems[0].SubItems[1].Text;
            rs.sid = runstateListview.SelectedItems[0].SubItems[2].Text;
            rs.yxzt = runstateListview.SelectedItems[0].SubItems[3].Text;
            rs.sbjd = runstateListview.SelectedItems[0].SubItems[4].Text;
            rs.sbwd = runstateListview.SelectedItems[0].SubItems[5].Text;
            rs.hbgd = runstateListview.SelectedItems[0].SubItems[6].Text;
            rs.userid = runstateListview.SelectedItems[0].SubItems[7].Text;            
            if (stoken==null)
            stoken=getToken();
            if (stoken == "error" || stoken == null)
            {            
                stoken=getToken();
            }
            if (stoken.Length > 10)
            {
                string returnStr = sendrunState(rs);
                if (returnStr == "success")
                {
                    runstateListview.Items[Index].BackColor = Color.Green;
                    toolStripStatusLabel2.Text = "运行信息提示：";
                }
                else
                {
                    runstateListview.Items[Index].BackColor = Color.Yellow;
                    toolStripStatusLabel2.Text = "运行信息提示:发送设备状态数据未成功";
                }
            }
            else
            {
                runstateListview.Items[Index].BackColor = Color.Yellow;
                toolStripStatusLabel2.Text = "运行信息提示：未得到token!";
            }
        }
        public string sendfindTarget(findtarget  rs)
        {               
                
                try
                {
                    string urlfind = "http://"+cipcomboBox.Text+ ":"+cportcomboBox.Text+"/api/afpt/uavgl/mbxx/add/1.0"; //发现目标记录
                    JavaScriptSerializer json = new JavaScriptSerializer();
                    string jsonpara = json.Serialize(rs);
                    string strReturn = Post(urlfind + "?sysToken=" + stoken + " ", jsonpara);
                    if (strReturn.IndexOf("成功") > 0)
                        return "success";
                    else
                    {
                        returnsendResult ctokenResult = (returnsendResult)json.Deserialize<returnsendResult>(strReturn);
                        if (strReturn.IndexOf("过期") > 0 || strReturn.ToLower().IndexOf("token") > 0 || strReturn.IndexOf("失效") > 0) getToken();
                        return "failed";
                    }
                }
                catch (Exception ex)
                {
                    return "error";
                }
            }
        public string sendrunState(RunState  ft)
        {
            try 
                {
                 
                 string urlrun = "http://" + cipcomboBox.Text + ":" + cportcomboBox.Text + "/api/afpt/uavgl/yxzt/add/1.0";//运行状态
                JavaScriptSerializer json = new JavaScriptSerializer();
                string jsonpara = json.Serialize(ft);
                string strReturn = Post(urlrun + "?sysToken=" + stoken + " ", jsonpara);

                if (strReturn.IndexOf("成功") > 0)
                    return "success";
                    
                else
                    {
                        returnsendResult ctokenResult = (returnsendResult)json.Deserialize<returnsendResult>(strReturn);
                    if (strReturn.IndexOf("过期") > 0 || strReturn.ToLower ().IndexOf("token") > 0|| strReturn.IndexOf("失效") > 0) getToken();
                        return "failed";
                    }
                 }
            catch (Exception ex)
                {
                    return "error";
                 }   
         }
        public static string stoken;
        public string getToken()
        {
            try
            {
                string urltoken = "http://" + cipcomboBox.Text + ":" + cportcomboBox.Text + "/api/common/auth/system/token/get/1.0";//得到token
                checkName ck = new checkName();
                ck.authcode = "ishp-app";
                ck.password = "123456";
                JavaScriptSerializer json = new JavaScriptSerializer();
                string ckname = json.Serialize(ck);
                string strReturn = Post(urltoken, ckname);
                returnResult ctokenResult = (returnResult)json.Deserialize<returnResult>(strReturn);
                return (string )ctokenResult.data.token  .ToString ();
                
            }
            catch (Exception ex)
            {
                return "error";
            }
        }
        public class returnsendResult
        {
            public int code; //必须 结果代码 0:失败 1:成功 10:用户token失效 11:系统token失效                mock: 1
            public int errorcode; //必须 结果代码 0:无异常  100001:当前记录已存在            mock: 0
            public string msg; //必须      提示信息            mock: 新增发现目标记录成功
            public string errormsg;  // 必须      详细错误信息            mock: 空的字符串
            public string data;   // 必须      注：（新增时返回主键，更新不反回）
        }
        public class returnResult
        {
            public int code; //必须 结果代码 0:失败 1:成功 10:用户token失效 11:系统token失效                mock: 1
            public int errorcode; //必须 结果代码 0:无异常  100001:当前记录已存在            mock: 0
            public string msg; //必须      提示信息            mock: 新增发现目标记录成功
            public string errormsg;  // 必须      详细错误信息            mock: 空的字符串
	        public string id;
            public stdata data;   // 必须      注：（新增时返回主键，更新不反回）
            public struct stdata
            {
                public string token;
            }

        }
            
        struct  checkName
                {
                   public  string authcode; //= "ishp-app";
                   public string password;// = "123456";
                }
        public  string Post(string Url, string jsonParas)
        {
            string strURL = Url;
            //创建一个HTTP请求  
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
            //Post请求方式  
            request.Method = "POST";
            //内容类型
            request.ContentType = "application/json";

            //设置参数，并进行URL编码 

            string paraUrlCoded = jsonParas;//System.Web.HttpUtility.UrlEncode(jsonParas);   

            byte[] payload;
            //将Json字符串转化为字节  
            payload = System.Text.Encoding.UTF8.GetBytes(paraUrlCoded);
            //设置请求的ContentLength   
            request.ContentLength = payload.Length;
            //发送请求，获得请求流 

            Stream writer;
            try
            {
                writer = request.GetRequestStream();//获取用于写入请求数据的Stream对象
            }
            catch (Exception ex)
            {

                writer = null;
             }
            //将请求参数写入流
            writer.Write(payload, 0, payload.Length);
            writer.Close();//关闭请求流
                           // String strValue = "";//strValue为http响应所返回的字符流
            HttpWebResponse response;
            try
            {
                //获得响应流
                response = (HttpWebResponse)request.GetResponse();
            }
            catch (WebException ex)
            {
                response = ex.Response as HttpWebResponse;
            }
            Stream s = response.GetResponseStream();
            //  Stream postData = Request.InputStream;
            StreamReader sRead = new StreamReader(s);
            string postContent = sRead.ReadToEnd();
            sRead.Close();
            return postContent;//返回Json数据
        }
        //调用：   string askurl = testUrl + "?sid=" + sid + "&mobi=" + mobi + "&sign=" + sign + "&msg=" + encodeMsgs;
        //string relust = Post(askurl, "");
        // 或者  string relust = Post(askurl, sid=" + sid + "&mobi=" + mobi + "&sign=" + sign + "&msg=" + encodeMsgs);
        public static string HttpPost(string url, string body)
        {
            //ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            Encoding encoding = Encoding.UTF8;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.Accept = "text/html, application/xhtml+xml, */*";
            request.ContentType = "application/json";

            byte[] buffer = encoding.GetBytes(body);
            request.ContentLength = buffer.Length;
            request.GetRequestStream().Write(buffer, 0, buffer.Length);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }
        /// <summary> 
        /// 调用api返回json  
        /// </summary>  
        /// <param name="url">api地址</param>
        /// <param name="jsonstr">接收参数</param>
        /// <param name="type">类型</param>  
        /// <returns></returns>  
        public static string HttpApi(string url, string jsonstr, string type)
        {
            try
            {
                Encoding encoding = Encoding.UTF8;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);//webrequest请求api地址  
                request.Accept = "text/html,application/xhtml+xml,*/*";
                request.ContentType = "application/json";
                request.Method = type.ToUpper().ToString();//get或者post  
                byte[] buffer = encoding.GetBytes(jsonstr);
                request.ContentLength = buffer.Length;
                request.GetRequestStream().Write(buffer, 0, buffer.Length);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                {
                    return reader.ReadToEnd();
                }
            }
            catch (Exception ex)
            {
                //statusStrip1.Items(1).BackColor = Color.Yellow;// ="运行信息提示: " +ex.ToString ();
                return "error";
            }
            }

        /// <summary>
        /// Post获取信息
        /// </summary>
        /// <typeparam name="T">实体对象</typeparam>
        /// <param name="url">post url</param>
        /// <param name="data">post json data</param>
        /// <returns></returns>
        public static T PostOfUrl<T>(string url, string data)
        {
            System.Net.HttpWebRequest httpWebRequest = (HttpWebRequest)System.Net.WebRequest.Create(url);
            httpWebRequest.Method = "POST";

            httpWebRequest.Headers.Add("Accept-Charset", "utf-8");

            byte[] postBytes = Encoding.UTF8.GetBytes(data);
            //httpWebRequest.ContentType = "text/xml"; 
            httpWebRequest.ContentType = "application/json; charset=utf-8";// httpWebRequest.ContentLength = Encoding.UTF8.GetByteCount(data);//strJson为json字符串 
            Stream stream = httpWebRequest.GetRequestStream();
            stream.Write(postBytes, 0, postBytes.Length);
            stream.Close();//发送完毕，接受返回值 
            var response = httpWebRequest.GetResponse();
            Stream streamResponse = response.GetResponseStream();
            StreamReader streamRead = new StreamReader(streamResponse);
            String responseString = streamRead.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            var list = js.Deserialize<T>(responseString);
            return list;
        }
        private void runstateListview_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (cipcomboBox.Enabled == true)
                sendstateData();
        }

        private void ipcomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (threadOne != null)
            {
                udpS.Client.Close();
                udpS.Close();
                udpS = new UdpClient();
                threadOne.Abort();
            }
            if (timer1.Enabled ==false )
                timer1.Enabled=true;
        }

        private void buttonBroadcast_Click(object sender, EventArgs e)
        {
            try
            {
                if ((cportcomboBox.Text.Trim() == ""))
                {
                    toolStripStatusLabel2.Text = "远端网络Port不能为空";
                    return;
                }
                IPEndPoint ipEndC = new IPEndPoint(IPAddress.Parse("255.255.255.255"), int.Parse (cportcomboBox.Text.Trim ()));
                udpC.Client.Connect(ipEndC);
                string strSend = this.textBox1.Text + " test";
                byte[] sendByte = Encoding.UTF8.GetBytes(strSend);
                udpC.BeginSend(sendByte, sendByte.Length, ipEndC, new AsyncCallback(AsyncSendCallback), udpC);
                //toolStripStatusLabel1.BackColor = Color.Green;
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
            }
        }

        private void timerSecond_Tick(object sender, EventArgs e)
        {
            try
            {
                if (toolStripStatusLabel1.BackColor == Color.Yellow)
                {
                    //if ((ipcomboBox.Text.Trim() == "") || (portcomboBox.Text.Trim() == "")) return;
                    if (udpS != null)
                    {
                        udpS.Client .Close();
                        udpS.Close();
                        udpS = new UdpClient();
                    }
                    if (threadOne != null) threadOne.Abort();
                    timer1.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
            }
        }
        private void receiveUdpAsyn(object o)//udp异步接收
        {
            try
            {
                IAsyncResult iar = udpS.BeginReceive(new AsyncCallback(ReceiveCallBack), null);
                toolStripStatusLabel1.BackColor = Color.Green;
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
                udpS = new UdpClient();
            }
        }

        private void ReceiveCallBack(IAsyncResult iar)
        {
            try
            {
                if (iar.IsCompleted)
                {
                    byte[] buffers;
                    IPEndPoint iep = new IPEndPoint(IPAddress.Any, 0);
                    buffers = udpS.EndReceive(iar, ref iep);
                    receiveUdpAsyn(udpS);
                    if (buffers.Length > 0)
                    {
                        if (listBox1.Items.Count >= 20) listBox1.Items.Clear();
                        strpaseData(buffers); 
                        if (dataTransform.ed.comandtype ==2)
                        {
                            string str = Encoding.UTF8.GetString(buffers);
                              listBox1.Items.Add(str);
                        }
                    }
                    if (iep.Address != null)
                    {
                        //cipcomboBox.Text = iep.Address.ToString();
                        //cportcomboBox.Text = iep.Port.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                toolStripStatusLabel1.BackColor = Color.Yellow;
                udpS = new UdpClient();
            }
        }
        public string   strpaseData(byte[] buffers)
        {
            try
            {
                bool returnbool=dataTransform.ParseData(buffers, buffers.Length);//解析数据
                if (dataTransform.ed .comandtype ==0)//运行状态
                {
                    RunState rs = new RunState();
                    rs.unitid = unitidTextbox.Text.ToString();
                    rs.userid = useridTextbox.Text.ToString();
                    rs.yxzt = dataTransform.ed.yxzt;
                    rs.hbgd = dataTransform.ed.hgt;
                    rs.sbjd = dataTransform.ed.lon;
                    rs.sbwd = dataTransform.ed.weidu;
                    rs.sid = dataTransform.ed.sid;//sidTextbox.Text.ToString();
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    listBox1.Items.Add(js.Serialize (rs));
                    if (runstateListview.Items.Count >= 1) runstateListview.Items.RemoveAt(0);
                    createDataState(rs);
                }
                    else if (dataTransform.ed.comandtype == 1)//发现目标状态
                {
                    findtarget ft = new findtarget();
                    ft.hbgd = dataTransform.ed.hgt;//目标海拨高度
                    ft.sbjd = dataTransform.ed.lon;//经度
                    ft.sbwd = dataTransform.ed.weidu;//纬度
                    ft.mbfw = dataTransform.ed.fw;//方位
                    ft.mbjl = dataTransform.ed.distance;//距离
                    ft.sid = dataTransform.ed.sid;// sidTextbox .Text .ToString ();//
                    ft.unitid = unitidTextbox.Text.ToString () ;//
                    ft.userid = useridTextbox .Text .ToString ();//
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    listBox1.Items.Add(js.Serialize(ft));
                    if (findtargetListview.Items.Count >= 1) findtargetListview.Items.RemoveAt(0);
                    createDataFind(ft);
                }
                return "success";
            }
            catch (Exception ex)
            {
                return "error";
            }
        }
        private void buttonEdit_Click(object sender, EventArgs e)
        {
            DialogResult resault = MessageBox.Show("确认编辑IP地址和端口地址吗", "确认", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            if (resault == DialogResult.OK)
            {
                ipcomboBox.Enabled = true;
                portcomboBox.Enabled = true;
                cipcomboBox.Enabled = true;
               cportcomboBox.Enabled = true;
                saveButton.Enabled = true;
                buttonBroadcast.Enabled = true;
                  button1.Enabled = true;
                useridTextbox.Enabled = true;
                unitidTextbox.Enabled = true;
                statepisTextbox.Enabled = true;
                saveButton.Enabled = true;
            }
            else
            {
                ipcomboBox.Enabled = false;
                portcomboBox.Enabled = false;
                cipcomboBox.Enabled = false;
                cportcomboBox.Enabled = false;
                saveButton.Enabled = false;
                buttonBroadcast.Enabled = false;
                button1.Enabled = false;
                useridTextbox.Enabled = false;
                unitidTextbox.Enabled = false;
                statepisTextbox.Enabled = false;
                saveButton.Enabled = false;
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void ipcomboBox_TextChanged(object sender, EventArgs e)
        {
            if (threadOne != null)
            {
                udpS.Client.Close();
                udpS.Close();
                udpS = new UdpClient();
                threadOne.Abort();
            }
            if (timer1.Enabled == false)
                timer1.Enabled = true;
        }

        private void portcomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void portcomboBox_TextChanged(object sender, EventArgs e)
        {
            if (threadOne != null)
            {
                udpS.Client.Close();
                udpS.Close();
                udpS = new UdpClient();
                threadOne.Abort();
            }
            if (timer1.Enabled == false)
                timer1.Enabled = true;
        }

        private void FormAuto_FormClosing(object sender, FormClosingEventArgs e)
        {
            //saveOriginData();
        }

        public void saveOriginData()
        {
            if (listBox1.Items.Count == 0) return;
            try
            {
                DirectoryInfo di = new DirectoryInfo(string.Format(@"{0}..\", Application.StartupPath));
                DateTime dt = DateTime.Now;
                string filepathstr = di.FullName + dt.Year +"-"+dt.Month +"-"+dt.Day +"-"+dt.Hour +"."+dt.Minute +"."+dt.Second+"-originalData.txt";
                FileStream fs = new FileStream(filepathstr , FileMode.Create);
                StreamWriter sw = new StreamWriter(fs);
                //开始写入
                for (int i=0;i<listBox1.Items.Count;i++)
                sw.Write(listBox1.Items[i].ToString()+"\n");
                //清空缓冲区
                sw.Flush();
                //关闭流
                sw.Close();
                fs.Close();

            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void findtargetListview_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void statepisTextbox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string statepicstr= Regex.Replace(statepisTextbox.Text.ToString(), @"[^\d\d]", "");
                int inets = int.Parse (statepicstr);
                statepisTextbox.Text = inets.ToString ()+ "秒";
                sencondtime = inets;
                toolStripStatusLabel2.Text = "运行信息提示:";
                statepisTextbox.BackColor = Color.White;
            }
            catch (Exception ex)
            {
                toolStripStatusLabel2.Text = "运行信息提示:" + ex.Message;
                statepisTextbox.BackColor = Color.Yellow;
            }
        }
    }
}
