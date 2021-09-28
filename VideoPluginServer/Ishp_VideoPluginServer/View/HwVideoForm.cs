using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ishp_PluginServer.View
{
    public partial class HwVideoForm : Form
    {
        /// <summary>
        /// 日志管理
        /// </summary>
        public static NLog.Logger _Logger = NLog.LogManager.GetCurrentClassLogger();

        public HwVideoForm()
        {
            InitializeComponent();
            try
            {

                string platform = "vcmapp";

                string IP = "192.168.24.199";

                int port = 9900;

                string username = "vcmapp";

                string password = "Xs123456*88";

                int code = hwocx.VCM_SDK_SetVideoPlatParam(platform, IP, port, username, password);

                _Logger.Info("华为平台初始化登录信息：" + code);
            }
            catch (Exception ex)
            {
                MessageBox.Show("发生错误");
            }
        }

        private void HwVideoForm_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// 华为视频播放
        /// </summary>
        /// <param name="msg">浏览器请求报文</param>
        /// <returns></returns>
        public bool hwspbf(string msg)
        {
            JObject jRet = JObject.Parse(msg);
            string topic = jRet["topic"].ToString();
            int code = -1;
            string devID="";
            string socketMsg = "";
            string msgid= jRet["msgid"].ToString();
            switch (topic)
            {
                case "video.huawei.replay":
                    //华为录像视频
                    try
                    {
                        devID = jRet["param"]["cameraid"].ToString();

                        string lx_kssj = GetTimeStamp(DateTime.ParseExact(jRet["param"]["starttime"].ToString(), "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.CurrentCulture)); 

                        string lx_jssj = GetTimeStamp(DateTime.ParseExact(jRet["param"]["endtime"].ToString(), "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.CurrentCulture)); 

                        int lx_cgid = int.Parse(jRet["param"]["channel"].ToString());

                        code = hwocx.VCM_SDK_PlayCameraHistoryReverse(devID, lx_kssj, lx_jssj, lx_cgid);

                        foreach (var item in Message._server.WebSocket.GetAllSessions())
                            Message._server.SendMessage(item, "服务器时间：" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    }
                    catch (Exception ex)
                    {
                        socketMsg += "录像播放发生错误！详情:" + ex;
                        _Logger.Error("录像播放发生错误:"+ex);
                    }
                    break;
                case "video.huawei.play":
                    //华为实时视频
                    try
                    {
                        devID = jRet["param"]["cameraid"].ToString();

                        int sk_cgid = int.Parse(jRet["param"]["channel"].ToString());

                        code = hwocx.VCM_SDK_Play(devID, "", "", 1, "", sk_cgid);
                 
                    }
                    catch (Exception ex)
                    {
                        socketMsg += "实况视频播放发生错误！详情" + ex;
                        _Logger.Error("实况视频播放发生错误:" + ex);
                    }
                    break;
            }
            if (code == 0)
            {
                _Logger.Info("华为OCX控件调用成功:" + code);
                socketMsg += "华为视频播放成功";
                SocketSend(devID, 1 , socketMsg,msgid);
                return true;
            }
            else
            {
                _Logger.Info("华为OCX控件调用发生错误:" + code);
                socketMsg += "华为视频播放失败！详情"+code;
                SocketSend(devID, 0 , socketMsg,msgid);
                return false;
            }
            
        }

        public void SocketSend(string cameraid,int code,string msg,string msgid)
        {
            JObject paramjRet = new JObject();

            paramjRet.Add(new JProperty("cameraid", cameraid));
            paramjRet.Add(new JProperty("code", code));
            paramjRet.Add(new JProperty("msg", msg));

            JObject jRet = new JObject();

            jRet.Add(new JProperty("msgid", msgid));
            jRet.Add(new JProperty("msgtime",DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
            jRet.Add(new JProperty("msgtype", "event"));
            jRet.Add(new JProperty("topic", "video.huawei.replay.result"));
            jRet.Add(new JProperty("param",paramjRet.ToString()));

            foreach (var item in Message._server.WebSocket.GetAllSessions())
                Message._server.SendMessage(item, jRet.ToString());
        }

        /// <summary>
        /// 获取时间戳
        /// </summary>
        /// <returns></returns>
        public static string GetTimeStamp(System.DateTime time, int length = 13)
        {
            long ts = ConvertDateTimeToInt(time);
            return ts.ToString().Substring(0, length);
        }

        /// <summary>  
        /// 将c# DateTime时间格式转换为Unix时间戳格式  
        /// </summary>  
        /// <param name="time">时间</param>  
        /// <returns>long</returns>  
        public static long ConvertDateTimeToInt(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1, 0, 0, 0, 0));
            long t = (time.Ticks - startTime.Ticks) / 10000;   //除10000调整为13位      
            return t;
        }

        private void Btn_close_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }
    }
}
