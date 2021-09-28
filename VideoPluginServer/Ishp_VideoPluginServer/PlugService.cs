using Ishp_PluginServer;
using Ishp_PluginServer.Common;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ishp_VideoPluginServer
{
    partial class PlugService : ServiceBase
    {
        public PlugService()
        {
            InitializeComponent();
            base.ServiceName = "PlugService";

            Storage.queue_saveER = new ConcurrentQueue<JObject>();
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            BLL bLL = new BLL();
            bLL.Start();

            Thread _thread;
            _thread = new Thread(PlugServer.plugBus);
            _thread.SetApartmentState(ApartmentState.STA);//设置为 STA 才能操作UI
            _thread.Start();
        }

        protected override void OnStart(string[] args)
        {
            // TODO: 在此处添加代码以启动服务。
        }

        protected override void OnStop()
        {
            // TODO: 在此处添加代码以执行停止服务所需的关闭操作。
        }
    }
}
