using Ishp_PluginServer.Common;
using Ishp_PluginServer.Common.FaceApi;
using Ishp_PluginServer.View;
using Ishp_VideoPluginServer;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using NAudio.CoreAudioApi;

namespace Ishp_PluginServer
{
    class Program
    {
        [DllImport("user32.dll", EntryPoint = "ShowWindow", SetLastError = true)]
        static extern bool ShowWindow(IntPtr hWnd, uint nCmdShow);
        [DllImport("user32.dll", EntryPoint = "FindWindow", SetLastError = true)]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        delegate void FaceCallback(IntPtr bytes, int size, String res);
        // sdk初始化
        [DllImport("BaiduFaceApi.dll", EntryPoint = "sdk_init", CharSet = CharSet.Ansi
             , CallingConvention = CallingConvention.Cdecl)]
        private static extern int sdk_init(bool id_card);
        // 是否授权
        [DllImport("BaiduFaceApi.dll", EntryPoint = "is_auth", CharSet = CharSet.Ansi
                , CallingConvention = CallingConvention.Cdecl)]
        private static extern bool is_auth();
        // 获取设备指纹
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_device_id", CharSet = CharSet.Ansi
                 , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_device_id();
        // sdk销毁
        [DllImport("BaiduFaceApi.dll", EntryPoint = "sdk_destroy", CharSet = CharSet.Ansi
             , CallingConvention = CallingConvention.Cdecl)]

        private static extern void sdk_destroy();

        public static IntPtr nPDLLHandle = (IntPtr)0;
        public static IntPtr playbackseq = default(IntPtr);

        private int GetCurrentSpeakerVolume()
        {
            int volume = 0;
            var enumerator = new MMDeviceEnumerator();

            //获取音频输出设备
            IEnumerable<MMDevice> speakDevices = enumerator.EnumerateAudioEndPoints(DataFlow.Render, DeviceState.Active).ToArray();
            if (speakDevices.Count() > 0)
            {
                MMDevice mMDevice = speakDevices.ToList()[0];
                volume = Convert.ToInt16(mMDevice.AudioEndpointVolume.MasterVolumeLevelScalar * 100);
            }
            return volume;
        }
        public static void GetCurrentSpeakerVolume(int volume)
        {
            var enumerator = new MMDeviceEnumerator();
            IEnumerable<MMDevice> speakDevices = enumerator.EnumerateAudioEndPoints(DataFlow.Render, DeviceState.Active).ToArray();
            if (speakDevices.Count() > 0)
            {

                MMDevice mMDevice = speakDevices.ToList()[0];
                mMDevice.AudioEndpointVolume.MasterVolumeLevelScalar = volume / 100.0f;
            }
        }
        [STAThread]
        static void Main(string[] args)
        {
            //GetCurrentSpeakerVolume(60);

            AppConfig config = AppConfig.GetInstance();


            //同步执行
            //bdFaceInit();

            //异步初始化人脸
            TaskFactory tf = new TaskFactory();
            Task taskTrack1 = tf.StartNew(() => bdFaceInit());
            Task.Factory.StartNew(() => bdFaceInit());

            //异步初始化大华平台
            TaskFactory dhtf = new TaskFactory();
            Task dhtaskTrack = dhtf.StartNew(() => DhInit());
            Task.Factory.StartNew(() => DhInit());

            Storage.queue_saveER = new ConcurrentQueue<JObject>();
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            BLL bLL = new BLL();
            bLL.Start();

            Thread _thread;
            _thread = new Thread(PlugServer.plugBus);
            _thread.SetApartmentState(ApartmentState.STA);//设置为 STA 才能操作UI
            _thread.Start();

            Console.Title = "平台插件服务";
            IntPtr intptr = FindWindow("ConsoleWindowClass", "平台插件服务");
            if (intptr != IntPtr.Zero)
            {
                ShowWindow(intptr, 0);//隐藏这个窗口
            }

            string x;
            x = Console.ReadLine();
            //         ServiceBase[] ServicesToRun;
            //         ServicesToRun = new ServiceBase[]
            //         {
            //             new PlugService() //这里的OrderSync新增的Windows服务
            //};
            //         ServiceBase.Run(ServicesToRun);
        }

        public static void bdFaceInit()
        {
            #region 初始化人脸
            Console.WriteLine("in main");
            bool id = false;

            int n = sdk_init(id);
            if (n != 0)
            {
                Console.WriteLine("auth result is {0:D}", n);
                Console.ReadLine();
            }

            // 测试是否授权
            bool authed = is_auth();
            Console.WriteLine("authed res is:" + authed);

            Log.Info("authed res is:" + authed);
            test_get_device_id();
            long t_begin = get_time_stamp();

            test_face_setting();
            #endregion
        }

        /// <summary>
        /// 大华平台初始化
        /// </summary>
        public static void DhInit()
        {
            //DPSDK_CreateParam_t param = null;
            IntPtr result1 = Common.DPSDK_Core.DPSDK_Create(Common.DPSDK_Core.dpsdk_sdk_type_e.DPSDK_CORE_SDK_SERVER, ref nPDLLHandle);//初始化数据交互接口
            IntPtr result2 = Common.DPSDK_Core.DPSDK_InitExt();//初始化解码播放接口
                                                               // String strRet = "";
            if (result1 == (IntPtr)0 && result2 == (IntPtr)0)
            {
                Log.Info("大华视频初始化成功");
            }
            else
            {
                Log.Info("大华初始化失败");
            }
            IntPtr result = (IntPtr)10;
            //设置日志路径，运行程序自动在D盘生成日志
            string strPath = Process.GetCurrentProcess().MainModule.FileName;//获取当前执行的exe的绝对路径
            int iPos = strPath.LastIndexOf('\\');
            strPath = strPath.Substring(0, iPos + 1);
            strPath += "DPSDK_DLL_CSharp";

            //result = Common.DPSDK_Core.DPSDK_SetLog(nPDLLHandle, Common.DPSDK_Core.dpsdk_log_level_e.DPSDK_LOG_LEVEL_DEBUG, strPath, false, false);
            //崩溃自动生成dmp文件
            //result = Common.DPSDK_Core.DPSDK_StartMonitor(nPDLLHandle, "DPSDK_Dump");
            IntPtr pUser = default(IntPtr);

            result = Common.DPSDK_Core.DPSDK_SetSyncTimeOpen(nPDLLHandle, 1);//开启校时

            login();
        }

        /// <summary>
        /// 登录
        /// </summary>
        private static void login()
        {
            Common.DPSDK_Core.Login_Info_t loginInfo = new Common.DPSDK_Core.Login_Info_t();
            loginInfo.szIp = "77.49.196.205";//"10.35.92.116";
            loginInfo.nPort = Convert.ToUInt32(9000);
            loginInfo.szUsername = "system";//"system";
            loginInfo.szPassword = "fsw651001";//"admin12345";
            loginInfo.nProtocol = Common.DPSDK_Core.dpsdk_protocol_version_e.DPSDK_PROTOCOL_VERSION_II;
            loginInfo.iType = 1;
            IntPtr result = Common.DPSDK_Core.DPSDK_Login(nPDLLHandle, ref loginInfo, (IntPtr)10000);
            if (result == (IntPtr)0)
            {
                Log.Info("大华登录成功");
            }
            else
            {
                Log.Info("登录失败，错误码：" + result.ToString());
            }
        }
        // 获取设备指纹device_id
        public static void test_get_device_id()
        {
            IntPtr ptr = get_device_id();
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("device id is:" + buf);
        }

        // 人脸设置相关
        public static void test_face_setting()
        {
            FaceSetting setting = new FaceSetting();
            // 是否执行质量检测
            setting.setCheckQuality();
            // 设置光照阈值
            //   setting.test_set_illum_thr();
            // 设置模糊阈值
            //   setting.test_set_blur_thr();
            // 设置遮挡阈值
            //    setting.test_set_occlu_thr();
            // 设置pitch、yaw、roll等角度的阈值
            //   setting.test_set_eulur_angle_thr();
            // 设置非人脸的置信度阈值
            //   setting.test_set_not_face_thr();
            // 设置检测的最小人脸大小
            setting.setMinFaceSize();
            // 设置跟踪到目标后执行检测的时间间隔
            //  setting.test_set_track_by_detection_interval();
            // 设置未跟踪到目标时的检测间隔
            //  setting.test_set_detect_in_video_interval();
        }

        public static long get_time_stamp()
        {
            TimeSpan ts = DateTime.Now.ToUniversalTime() - new DateTime(1970, 1, 1);
            return (long)ts.TotalMilliseconds;
        }
    }

    public static class Storage
    {
        public static ConcurrentQueue<JObject> queue_saveER { get; set; }
    }

    public static class Message
    {
        public static WSocketServer _server { get; set; }
    }

    

}
