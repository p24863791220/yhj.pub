using Ishp_PluginServer.View;
using Ishp_VideoPluginServer.View;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ishp_PluginServer.Common
{
    static class PlugServer
    {
        public static class TestClass
        {
            public static string str;
            public static  DhVideoForm dahuaform ;
            public static  void Showdh()
            {         
                 if (dahuaform==null) dahuaform = new DhVideoForm();
                dahuaform.dhspbf(str);
                dahuaform.Show();
            }
        }
        private static Thread  _thread;
        static void startform(string str)
        {
            TestClass.str =str;
            _thread = new Thread(TestClass.Showdh);
            _thread.SetApartmentState(ApartmentState.STA);//设置为 STA 才能操作UI
            _thread.Start();
        }
        public static void plugBus()
        {
            while (true)
            {
                JObject jRet;
                bool ret = Storage.queue_saveER.TryDequeue(out jRet);
                if (ret & !(jRet == null))
                {
                    string topic = jRet["topic"].ToString().ToLower();
                    switch (topic)
                    {
                        case "video.huawei.replay":
                            HwVideoForm hw = new HwVideoForm();
                            hw.hwspbf(jRet.ToString());
                            Application.Run(hw);
                            break;
                        case "video.huawei.play":
                            HwVideoForm hw2 = new HwVideoForm();
                            hw2.hwspbf(jRet.ToString());
                            Application.Run(hw2);
                            break;
                        case "video.dahua.replay":
                            DhVideoForm dh = new DhVideoForm();
                            dh.dhspbf(jRet.ToString());
                            Application.Run(dh);
                            break;      
                        case "video.dahua.play":
                            //startform(jRet.ToString());
                            DhVideoForm dh2 = new DhVideoForm();
                            dh2.dhspbf(jRet.ToString());
                            Application.Run(dh2);
                            break;
                        case "heartbeat":
                            JObject xtjRet = jRet;
                            xtjRet["msgtime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                            xtjRet["msgtype"] = "event";
                           
                            foreach (var item in Message._server.WebSocket.GetAllSessions())
                                Message._server.SendMessage(item, xtjRet.ToString());
                            break;
                        case "faceRecognition":
                            FaceRecognitionForm fr = new FaceRecognitionForm();
                            Application.Run(fr);
                            break;
                    }
                }
                Thread.Sleep(300);
            }
        }
    }
}
