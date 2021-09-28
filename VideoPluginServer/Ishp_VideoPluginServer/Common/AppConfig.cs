using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Ishp_PluginServer.Common
{
    public class AppConfig
    {
        // 定义一个静态变量来保存类的实例
        private static AppConfig uniqueInstance;
        //定义一个标识确保线程同步 
        private static readonly object locker = new object();

        public static AppConfig GetInstance()
        {
            // 当第一个线程运行到这里时，此时会对locker对象 "加锁"，
            // 当第二个线程运行该方法时，首先检测到locker对象为"加锁"状态，该线程就会挂起等待第一个线程解锁
            // lock语句运行完之后（即线程运行完之后）会对该对象"解锁"
            // 双重锁定只需要一句判断就可以了
            if (uniqueInstance == null)
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (uniqueInstance == null)
                    {
                        uniqueInstance = LoadAppConfig();
                    }
                }
            }
            return uniqueInstance;
        }

        /// <summary>
        /// 加载应用程序配置
        /// </summary>
        private static AppConfig LoadAppConfig()
        {
            AppConfig ret = null;
            string AppConfigFile = AppDomain.CurrentDomain.BaseDirectory;
            AppConfigFile += @"Config\appPassageway.yaml";
            if (!System.IO.File.Exists(AppConfigFile))
            {
                Log.Error(string.Format("配置文件[{0}]不存在！", AppConfigFile));
            }
            else
            {
                try
                {
                    YamlConfig.SetFilePath(AppConfigFile);
                    ret = YamlConfig.Deserializer<AppConfig>();
                }
                catch (Exception ex)
                {
                    Log.Error(string.Format("配置文件[{0}]读取错误！详细信息：{1}", AppConfigFile, ex));

                }

            }
            return ret;

        }


        public string AppName { get; set; }
        public string CompanyName { get; set; }
        public string AuthCode { get; set; }
        public string UnitID { get; set; }
        public int MaxCaptureFace { get; set; }
        public int FCShowTime { get; set; }
        public int MaxQueueLen_CF { get; set; }
        public int MaxQueueLen_FC { get; set; }
        public int FC_SDK_Delay { get; set; }
        public int FT_FrameInterval { get; set; }
        public int FC_FrameInterval { get; set; }

        public List<PassageWay> PassageWays = new List<PassageWay>();

        public DBInfo DB { get; set; }
        public MQInfo MQ { get; set; }

        public FaceSDKSetting FaceSetting { get; set; }



        public class PassageWay
        {
            public window window { get; set; }
            public cap cap { get; set; }
        }

        public class window
        {
            public int falg { get; set; }
            public string title { get; set; }
            public int left { get; set; }
            public int top { get; set; }
            public int width { get; set; }
            public int height { get; set; }
            public bool showAppLogo { get; set; }
            public bool showAppName { get; set; }
            public bool showCompanyName { get; set; }

        }

        public class cap
        {
            public int left { get; set; }
            public int top { get; set; }
            public int width { get; set; }
            public int height { get; set; }

            public int type { get; set; }
            public int usbidx { get; set; }
            public string url { get; set; }

        }

        public class DBInfo
        {
            public string Host { get; set; }
            public string Port { get; set; }
            public string Database { get; set; }
            public string UserName { get; set; }
            public string UserPwd { get; set; }
        }

        public class MQInfo
        {
            public int MsgTimeout { get; set; }
            public string Host { get; set; }
            public string Port { get; set; }
            public string VHost { get; set; }
            public string UserName { get; set; }
            public string UserPwd { get; set; }

            public string Exchange { get; set; }
            public string Queue { get; set; }
            public string BindKey { get; set; }

        }

        public class FaceSDKSetting
        {
            public float  match_score_thr { get; set; }
            public int    max_face_len { get; set; }
            public bool   check_quality { get; set; }
            public float  illum_thr { get; set; }
            public float  blur_thr { get; set; }
            public float  occlu_thr { get; set; }
            public int    eulur_angle_pitch_thr { get; set; }
            public int    eulur_angle_yaw_thr { get; set; }
            public int    eulur_angle_roll_thr { get; set; }
            public float  not_face_thr { get; set; }
            public int    min_face_size { get; set; }
            public int    track_by_detection_interval { get; set; }
            public int    detect_in_video_interval { get; set; }

        }
    }
}
