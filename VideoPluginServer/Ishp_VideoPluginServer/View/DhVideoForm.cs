using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NAudio.CoreAudioApi;

namespace Ishp_PluginServer.View
{
    public partial class DhVideoForm : Form
    {
        //public IntPtr nPDLLHandle = (IntPtr)0;
        //public IntPtr playbackseq = default(IntPtr);

        DateTime nBegin;
        DateTime nEnd;
        string devID = "";
        /// <summary>
        /// 日志管理
        /// </summary>
        public static NLog.Logger _Logger = NLog.LogManager.GetCurrentClassLogger();
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
        public DhVideoForm()
        {
            GetCurrentSpeakerVolume(80);
            InitializeComponent();
            //Init();
//login();
        }

        /// <summary>
        /// 初始化
        /// </summary>
        //private void Init()
        //{
        //    //DPSDK_CreateParam_t param = null;
        //    IntPtr result1 = Common.DPSDK_Core.DPSDK_Create(Common.DPSDK_Core.dpsdk_sdk_type_e.DPSDK_CORE_SDK_SERVER, ref this.nPDLLHandle);//初始化数据交互接口
        //    IntPtr result2 = Common.DPSDK_Core.DPSDK_InitExt();//初始化解码播放接口
        //                                                                                  // String strRet = "";
        //    if (result1 == (IntPtr)0 && result2 == (IntPtr)0)
        //    {
        //        _Logger.Info("大华视频初始化成功");
        //    }
        //    else
        //    {
        //        _Logger.Info("大华初始化失败");
        //    }
        //    IntPtr result = (IntPtr)10;
        //    //设置日志路径，运行程序自动在D盘生成日志
        //    string strPath = Process.GetCurrentProcess().MainModule.FileName;//获取当前执行的exe的绝对路径
        //    int iPos = strPath.LastIndexOf('\\');
        //    strPath = strPath.Substring(0, iPos + 1);
        //    strPath += "DPSDK_DLL_CSharp";

        //    result = Common.DPSDK_Core.DPSDK_SetLog(nPDLLHandle, Common.DPSDK_Core.dpsdk_log_level_e.DPSDK_LOG_LEVEL_DEBUG, strPath, false, false);
        //    //崩溃自动生成dmp文件
        //    result = Common.DPSDK_Core.DPSDK_StartMonitor(nPDLLHandle, "DPSDK_Dump");
        //    IntPtr pUser = default(IntPtr);

        //    result = Common.DPSDK_Core.DPSDK_SetSyncTimeOpen(nPDLLHandle, 1);//开启校时

        //}

        ///// <summary>
        ///// 登录
        ///// </summary>
        //private void login()
        //{
        //    Common.DPSDK_Core.Login_Info_t loginInfo = new Common.DPSDK_Core.Login_Info_t();
        //    loginInfo.szIp = "77.49.196.205";//"10.35.92.116";
        //    loginInfo.nPort = Convert.ToUInt32(9000);
        //    loginInfo.szUsername = "system";//"system";
        //    loginInfo.szPassword = "fsw651001";//"admin12345";
        //    loginInfo.nProtocol = Common.DPSDK_Core.dpsdk_protocol_version_e.DPSDK_PROTOCOL_VERSION_II;
        //    loginInfo.iType = 1;
        //    IntPtr result = Common.DPSDK_Core.DPSDK_Login(this.nPDLLHandle, ref loginInfo, (IntPtr)10000);
        //    if (result == (IntPtr)0)
        //    {
        //        _Logger.Info("大华登录成功");
        //    }
        //    else
        //    {
        //        _Logger.Info("登录失败，错误码：" + result.ToString());
        //    }
        //}

        /// <summary>
        /// 大华视频播放
        /// </summary>
        /// <param name="msg">浏览器请求报文</param>
        /// <returns></returns>
        public bool dhspbf(string msg)
        {
            JObject jRet = JObject.Parse(msg);
            string topic = jRet["topic"].ToString();
            int code = -1;
            
            string socketMsg = "";
            string msgid= jRet["msgid"].ToString().ToLower();
            switch (topic)
            {
                case "video.dahua.replay":
                    //大华录像视频
                    try
                    {
                        devID = jRet["param"]["cameraid"].ToString();

                        string lx_kssj = jRet["param"]["starttime"].ToString();

                        string lx_jssj = jRet["param"]["endtime"].ToString();

                        int lx_cgid = int.Parse(jRet["param"]["channel"].ToString());

                        
                        if (Program.playbackseq != (IntPtr)0)
                        {
                            Common.DPSDK_Core.DPSDK_StopPlaybackBySeq(Program.nPDLLHandle, Program.playbackseq, (IntPtr)10000);//先关闭之前播放的视频
                        }
                        IntPtr handle = pbPlayback.Handle;
                        Common.DPSDK_Core.Get_RecordStream_Time_Info_t Info = new Common.DPSDK_Core.Get_RecordStream_Time_Info_t();
                        Info.szCameraId = devID;
                        Info.nRight = Common.DPSDK_Core.dpsdk_check_right_e.DPSDK_CORE_NOT_CHECK_RIGHT;
                        Info.nMode = Common.DPSDK_Core.dpsdk_pb_mode_e.DPSDK_CORE_PB_MODE_NORMAL;

                        Info.nSource = Common.DPSDK_Core.dpsdk_recsource_type_e.DPSDK_CORE_PB_RECSOURCE_DEVICE; //设备录像
                        //if (cbRecordSource.SelectedIndex == 1)
                        //{
                        //    Info.nSource = Common.DPSDK_Core.dpsdk_recsource_type_e.DPSDK_CORE_PB_RECSOURCE_PLATFORM; ; //平台录像
                        //}
                        nBegin =  DateTime.ParseExact(lx_kssj, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.CurrentCulture);        //开始时间
                        nEnd = DateTime.ParseExact(lx_jssj, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.CurrentCulture); ;          //结束时间

                        TimeSpan span = nEnd.Subtract(nBegin);
                        int sjcMinutes = (int)span.TotalMinutes;
                        trackBar1.Maximum = sjcMinutes + 1;

                        Info.uBeginTime = Convert.ToUInt64(nBegin.Subtract(Convert.ToDateTime("1970-1-1 8:00:00")).TotalSeconds);
                        Info.uEndTime = Convert.ToUInt64(nEnd.Subtract(Convert.ToDateTime("1970-1-1 8:00:00")).TotalSeconds);
                        StartAudio_Click(null, null);
                        int outVol;
                        IntPtr resultvol = Common.DPSDK_Core.DPSDK_GetVolume(Program.nPDLLHandle, Program.playbackseq, out outVol);
                        labelvol.Text  = outVol.ToString ();
                        IntPtr result = Common.DPSDK_Core.DPSDK_StartPlaybackByTime(Program.nPDLLHandle, out Program.playbackseq, ref Info, handle, (IntPtr)10000);

                        if (result != IntPtr.Zero)
                        {
                            socketMsg += "按时间回放录像失败，错误码：" + result.ToString();
                            lab_msg.Text = "录像播放失败";
                        }
                        else
                        {
                            socketMsg += "大华按时间回放录像成功";
                            lab_msg.Text = "录像播放成功";
                            pbPlayback.Refresh();    //刷新窗口
                        }
                    }
                    catch (Exception ex)
                    {
                        socketMsg += "大华录像播放发送错误！ 详情：" + ex;
                        lab_msg.Text = "录像播放失败";
                        _Logger.Error("大华录像播放发生错误:" + ex);
                    }
                    break;
                case "video.dahua.play":
                    //大华实时视频
                    try
                    {
                        devID = jRet["param"]["cameraid"].ToString();

                        int sk_cgid = int.Parse(jRet["param"]["channel"].ToString());

                        if (Program.playbackseq != IntPtr.Zero)
                        {
                            IntPtr IRet = Common.DPSDK_Core.DPSDK_StopRealplayBySeq(Program.nPDLLHandle, Program.playbackseq, (IntPtr)10000);
                        }
                        IntPtr handle = pbPlayback.Handle;
                        Common.DPSDK_Core.Get_RealStream_Info_t Info = new Common.DPSDK_Core.Get_RealStream_Info_t();
                        Info.szCameraId = devID;
                        Info.nRight = Common.DPSDK_Core.dpsdk_check_right_e.DPSDK_CORE_NOT_CHECK_RIGHT;
                        Info.nStreamType = Common.DPSDK_Core.dpsdk_stream_type_e.DPSDK_CORE_STREAMTYPE_MAIN;
                        Info.nMediaType = Common.DPSDK_Core.dpsdk_media_type_e.DPSDK_CORE_MEDIATYPE_ALL;
                        Info.nTransType = Common.DPSDK_Core.dpsdk_trans_type_e.DPSDK_CORE_TRANSTYPE_TCP;
                        IntPtr result = Common.DPSDK_Core.DPSDK_StartRealplay(Program.nPDLLHandle, out Program.playbackseq, ref Info, handle, (IntPtr)10000);


                        if (result != IntPtr.Zero)
                        {
                            socketMsg += "大华打开实况视频失败，错误码：" + result.ToString();
                            pbPlayback.Refresh();
                        }
                        else
                        {
                            socketMsg += "大华打开实况视频成功";
                            pbPlayback.Refresh();
                        }
                    }
                    catch (Exception ex)
                    {
                        socketMsg += "大华实况视频播放发送错误！ 详情：" + ex;
                        _Logger.Error("实况视频播放发生错误:" + ex);
                    }
                    break;
            }
            if (code == 0)
            {
                _Logger.Info("大华OCX控件调用成功:" + code);
                SocketSend(devID, 1 , socketMsg , msgid);
                return true;
            }
            else
            {
                _Logger.Info("大华OCX控件调用发生错误:" + code);
                SocketSend(devID, 0 , socketMsg , msgid);
                return false;
            }

        }

        /// <summary>
        /// 视频调用消息返回
        /// </summary>
        /// <param name="cameraid"></param>
        /// <param name="code"></param>
        /// <param name="msg"></param>
        /// <param name="msgid"></param>
        public void SocketSend(string cameraid, int code, string msg,string msgid)
        {
            JObject paramjRet = new JObject();

            paramjRet.Add(new JProperty("cameraid", cameraid));
            paramjRet.Add(new JProperty("code", code));
            paramjRet.Add(new JProperty("msg", msg));

            JObject jRet = new JObject();

            jRet.Add(new JProperty("msgid", msgid));
            jRet.Add(new JProperty("msgtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
            jRet.Add(new JProperty("msgtype", "event"));
            jRet.Add(new JProperty("topic", "video.dahua.replay.result"));
            jRet.Add(new JProperty("param", paramjRet.ToString()));

            foreach (var item in Message._server.WebSocket.GetAllSessions())
                Message._server.SendMessage(item, jRet.ToString());
        }

        private void Btn_close_Click(object sender, EventArgs e)
        {
            //Common.DPSDK_Core.DPSDK_Destroy(Program.nPDLLHandle);
            CloseAudio_Click(null, null);
            this.Close();
        }

        /// <summary>
        /// 录像播放速率
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CbSpeed_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Program.playbackseq != (IntPtr)0)
            {
                button5_Click(null, null);
                //Common.DPSDK_Core.AudioUserParam_t = 20;
                Common.DPSDK_Core.dpsdk_playback_speed_e speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_NORMAL;
                string strRate = Convert.ToString(cbSpeed.Text);
                //if (cbSpeed.SelectedIndex != 4)
                //{
                    switch (cbSpeed.SelectedIndex)
                    {
                        case 0:
                            speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_SLOW4;
                            break;
                        case 1:
                            speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_SLOW2;
                            break;
                        case 2:
                            speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_NORMAL;
                            break;
                        case 3:
                            speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_FAST2;
                            break;
                        case 4:
                            speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_FAST4;
                            break;
                    default:
                        speed = Common.DPSDK_Core.dpsdk_playback_speed_e.DPSDK_CORE_PB_NORMAL;
                        break;
                    }
                //}
                IntPtr result = Common.DPSDK_Core.DPSDK_SetPlaybackSpeed(Program.nPDLLHandle, Program.playbackseq, speed, (IntPtr)10000);
                button6_Click(null, null);
                if (result != IntPtr.Zero)
                {
                    _Logger.Info("播放速度调整失败，错误码：" + result.ToString());
                }
                else
                {
                    _Logger.Info("播放速度调整成功！，当前速率为 " + strRate + "倍速");
                }
            }
        }

        private void trackBar1_MouseCaptureChanged(object sender, EventArgs e)
        {
            lx();
        }

        /// <summary>
        /// 单帧进
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button3_Click(object sender, EventArgs e)
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_PlayOneByOne(Program.nPDLLHandle, Program.playbackseq);//单帧回放
            lab_msg.Text = "单帧播放成功！";
            if (result != IntPtr.Zero)
            {
                lab_msg.Text = "单帧播放失败，错误码：" + result.ToString();
            }
        }

        /// <summary>
        /// 单帧退(仅限本地录像)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button4_Click(object sender, EventArgs e)
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_PlayOneByOneBack(Program.nPDLLHandle, Program.playbackseq);//单帧回退
            lab_msg.Text = "单帧播放成功！";
            if (result != IntPtr.Zero)
            {
                lab_msg.Text = "单帧播放失败，错误码：" + result.ToString();
            }
        }

        /// <summary>
        /// 录像播放
        /// </summary>
        public void lx()
        {
            if (Program.playbackseq != (IntPtr)0)
            {
                Common.DPSDK_Core.DPSDK_StopPlaybackBySeq(Program.nPDLLHandle, Program.playbackseq, (IntPtr)10000);//先关闭之前播放的视频
            }
            IntPtr handle = pbPlayback.Handle;
            Common.DPSDK_Core.Get_RecordStream_Time_Info_t Info = new Common.DPSDK_Core.Get_RecordStream_Time_Info_t();
            Info.szCameraId = devID;
            Info.nRight = Common.DPSDK_Core.dpsdk_check_right_e.DPSDK_CORE_NOT_CHECK_RIGHT;
            Info.nMode = Common.DPSDK_Core.dpsdk_pb_mode_e.DPSDK_CORE_PB_MODE_NORMAL;

            Info.nSource = Common.DPSDK_Core.dpsdk_recsource_type_e.DPSDK_CORE_PB_RECSOURCE_DEVICE; //设备录像
                                                                                                    //if (cbRecordSource.SelectedIndex == 1)
                                                                                                    //{
                                                                                                    //    Info.nSource = Common.DPSDK_Core.dpsdk_recsource_type_e.DPSDK_CORE_PB_RECSOURCE_PLATFORM; ; //平台录像
                                                                                                    //}

            TimeSpan span = nEnd.Subtract(nBegin);
            int sjcMinutes = (int)span.TotalMinutes;
            trackBar1.Maximum = sjcMinutes + 1;

            DateTime kssj = nBegin.AddMinutes(trackBar1.Value);

            Info.uBeginTime = Convert.ToUInt64(kssj.Subtract(Convert.ToDateTime("1970-1-1 8:00:00")).TotalSeconds);
            Info.uEndTime = Convert.ToUInt64(nEnd.Subtract(Convert.ToDateTime("1970-1-1 8:00:00")).TotalSeconds);

            IntPtr result = Common.DPSDK_Core.DPSDK_StartPlaybackByTime(Program.nPDLLHandle, out Program.playbackseq, ref Info, handle, (IntPtr)10000);

            if (result != IntPtr.Zero)
            {
                lab_msg.Text = "回放录像失败,请重试";
            }
            else
            {
                lab_msg.Text = "录像操作成功";
                pbPlayback.Refresh();    //刷新窗口
            }
        }

        /// <summary>
        /// 暂停录像播放
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button5_Click(object sender, EventArgs e)
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_PausePlaybackBySeq(Program.nPDLLHandle, Program.playbackseq, (IntPtr)10000);
            if (result != IntPtr.Zero)
            {
                lab_msg.Text = "暂停播放失败，错误码：" + result.ToString();
            }
            else
            {
                lab_msg.Text = "暂停播放成功！";
            }
        }

        /// <summary>
        /// 恢复播放
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button6_Click(object sender, EventArgs e)
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_ResumePlaybackBySeq(Program.nPDLLHandle, Program.playbackseq, (IntPtr)10000);
            if (result != IntPtr.Zero)
            {
                lab_msg.Text = "恢复播放失败，错误码：" + result.ToString();
            }
            else
            {
                lab_msg.Text = "恢复播放成功！";
            }
        }

        /// <summary>
        /// 截取当前画面并保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button7_Click(object sender, EventArgs e)
        {
            //chartControl
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "JPG(*.jpg)|*.jpg|BMP(*.bmp)|*.bmp|所有文件|*.*";
            DateTime dt = System.DateTime.Now;
            sfd.FileName = dt.ToString("yyyy-MM-dd-HH-mm-ss");//默认打开文件夹时间为图片名称
            sfd.RestoreDirectory = true;    //记忆上次路径
            sfd.AddExtension = true;        //默认添加后缀名
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                string filename = sfd.FileName.ToString();
                Common.DPSDK_Core.dpsdk_pic_type_e nPicType = Common.DPSDK_Core.dpsdk_pic_type_e.DPSDK_CORE_PIC_FORMAT_JPEG;//默认写入jpg文件
                if (filename.Contains(".bmp"))
                {
                    nPicType = Common.DPSDK_Core.dpsdk_pic_type_e.DPSDK_CORE_PIC_FORMAT_BMP;
                }
                IntPtr result = Common.DPSDK_Core.DPSDK_PicCapture(Program.nPDLLHandle, Program.playbackseq, nPicType, filename);
                if (result != IntPtr.Zero)
                {
                    lab_msg.Text = "抓图失败，错误码：" + result.ToString();
                }
                else
                {
                    lab_msg.Text = "抓图成功！，文件路径为：" + filename;
                }
            }


            button5_Click(null, null);

            Bitmap bmp = new Bitmap(pbPlayback.Width, pbPlayback.Height);
            pbPlayback.DrawToBitmap(bmp, pbPlayback.ClientRectangle);

            string filepath="";

            FolderBrowserDialog dialog = new FolderBrowserDialog();
            dialog.Description = "请选择图片报错文件夹";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                filepath = dialog.SelectedPath;
            }

            bmp.Save(filepath + "//"+Guid.NewGuid().ToString()+".jpg");
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            if (button4.Text.Equals("最大化"))
            {
                this.WindowState = FormWindowState.Maximized;
                button4.Text = "还原";

                
            }
            else if (button4.Text.Equals("还原"))
            {
                this.WindowState = FormWindowState.Normal;
                this.Width = 640;
                this.Height = 520;
                button4.Text = "最大化";
            }

            label1.Top = this.Height - 60;

            cbSpeed.Top = this.Height - 60;

            lab_msg.Top = this.Height - 30;

            button3.Left = this.Width - 90;
            button3.Top = this.Height - 60;

            button6.Left = this.Width - 180;
            button6.Top = this.Height - 60;

            button5.Left = this.Width - 240;
            button5.Top = this.Height - 60;

            button7.Left = this.Width - 380;
            button7.Top = this.Height - 60;

            btn_close.Left = this.Width - 90;
            btn_close.Top = this.Height - 30;

            button4.Left = this.Width - 180;
            button4.Top = this.Height - 30;

            pbPlayback.Height = this.Height - 120;
            pbPlayback.Width = this.Width;

            trackBar1.Width = this.Width;
            trackBar1.Top = pbPlayback.Height;

        }

        private void DhVideoForm_Load(object sender, EventArgs e)
        {
             StartAudio_Click(null, null);
            GetCurrentSpeakerVolume(80);
        }
        #region 音量
        [DllImport("winmm.dll")]
        public static extern long waveOutSetVolume(UInt32 deviceID, UInt32 Volume);
        [DllImport("winmm.dll")]
        public static extern long waveOutGetVolume(UInt32 deviceID, out UInt32 Volume);

        private void GetSoundVolume()
        {
            UInt32 d, v;
            d = 0;
            long i = waveOutGetVolume(d, out v);
            UInt32 vleft = v & 0xFFFF;
            UInt32 vright = (v & 0xFFFF0000) >> 16;
            trackBar2.Value = (int.Parse(vleft.ToString()) | int.Parse(vright.ToString())) * (this.trackBar2.Maximum - this.trackBar2.Minimum) / 0xFFFF;
        }

        // 滑块值改变时，修改音量值  
        private void trackBar2_Scroll_1(object sender, EventArgs e)
        {
            UInt32 Value = (System.UInt32)((double)0xffff * (double)trackBar2.Value / (double)(trackBar2.Maximum - trackBar2.Minimum));//先把trackbar的value值映射到0x0000～0xFFFF范围     
            //限制value的取值范围     
            if (Value < 0) Value = 0;
            if (Value > 0xffff) Value = 0xffff;
            UInt32 left = (System.UInt32)Value;//左声道音量     
            UInt32 right = (System.UInt32)Value;//右     
            waveOutSetVolume(0, left << 16 | right); //"<<"左移，“|”逻辑或运算   
        }
        #endregion
        private void trackBar2_Scroll(object sender, EventArgs e)
        {
            try
            {
                StartAudio_Click(null, null);
                double vol1 = trackBar2.Value;
                double vol2 = trackBar2.Maximum;
                double vol3 = (vol1 / vol2) * 100;
                int vol = Convert.ToInt16(vol3);
                IntPtr result = Common.DPSDK_Core.DPSDK_SetVolume(Program.nPDLLHandle, Program.playbackseq, (IntPtr)vol);
                int outVol;
                IntPtr resultvol = Common.DPSDK_Core.DPSDK_GetVolume(Program.nPDLLHandle, Program.playbackseq, out outVol);
                labelvol.Text = outVol.ToString();
            }
            catch (Exception ex)
            {
                double vol1 = trackBar2.Value;
                double vol2 = trackBar2.Maximum;
                double vol3 = (vol1 / vol2) * 100;
                int vol = Convert.ToInt16(vol3);
                IntPtr result = Common.DPSDK_Core.DPSDK_SetVolume(Program.nPDLLHandle, Program.playbackseq, (IntPtr)vol);
            }
        }
   
        private void CloseAudio_Click(object sender, EventArgs e)//关闭音频
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_OpenAudio(Program.nPDLLHandle, Program.playbackseq, false);
            if (result != IntPtr.Zero)
            {
                strRet = "关闭音频失败，错误码：" + result.ToString();
            }
            else
            {
                strRet = "关闭音频成功！";
            }
            //Test_DPSDK_Core_CSharp.m_dlgGeneral.ShowCallResultInfo((int)result, strRet);
        }

        private void GetVolume_Click(object sender, EventArgs e)//获取音量
        {
            int nVol;
            IntPtr result = Common.DPSDK_Core.DPSDK_GetVolume(Program.nPDLLHandle, Program.playbackseq, out nVol);

            if (m_nVolPlayback == 0)//先获取音量
            {
                m_nVolPlayback = nVol;
            }
            else if (m_nVolPlayback != 0)//设置了音量以后又获取音量
            {
                nVol = m_nVolPlayback;
            }
            trackBar2.Value =nVol;

            if (result != IntPtr.Zero)
            {
                strRet = "获取音量失败，错误码：" + result.ToString();
            }
            else
            {
                strRet = "获取音量成功！";
            }
            //Test_DPSDK_Core_CSharp.m_dlgGeneral.ShowCallResultInfo((int)result, strRet);
        }
        public string strRet;
        public int m_nVolPlayback;
        private void SetVolume_Click(object sender, EventArgs e)//设置音量
        {
            double vol1 = trackBar2.Value;
            double vol2 = trackBar2.Maximum;
            double vol3 = (vol1 / vol2) * 100;
            int vol = Convert.ToInt16(vol3);
            IntPtr result = Common.DPSDK_Core.DPSDK_SetVolume(Program.nPDLLHandle, Program.playbackseq,(IntPtr)vol);
            //if (result == IntPtr.Zero)
            //{
            //    m_nVolPlayback = nVol;//成功返回0，才去设置m_nVolreal
            //    strRet = "设置音量成功！";
            //}
            //else
            //{
            //    strRet = "设置音量失败，错误码：" + result.ToString();
            //}
            //Test_DPSDK_Core_CSharp.m_dlgGeneral.ShowCallResultInfo((int)result, strRet);
        }


        private void StartAudio_Click(object sender, EventArgs e)//开启音频
        {
            IntPtr result = Common.DPSDK_Core.DPSDK_OpenAudio(Program.nPDLLHandle, Program.playbackseq, true);
          }

        private void DhVideoForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            CloseAudio_Click(null, null);
        }

        private void trackBar3_Scroll(object sender, EventArgs e)
        {
            try
            {
                double vol1 = trackBar3.Value;
                double vol2 = trackBar3.Maximum;
                double vol3 = (vol1 / vol2) * 100;
                int vol = Convert.ToInt16(vol3);
                GetCurrentSpeakerVolume(vol);
                labelmainvol.Text  = GetCurrentSpeakerVolume().ToString();
            }
            catch (Exception)
            {

            }
        }
    }
}
