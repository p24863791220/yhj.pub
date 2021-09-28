using AForge.Video.DirectShow;
using Ishp_PluginServer;
using Ishp_PluginServer.Common;
using Ishp_PluginServer.Common.FaceApi;
using Ishp_VideoPluginServer.Common;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Message = Ishp_PluginServer.Message;

namespace Ishp_VideoPluginServer.View
{
    public partial class FaceRecognitionForm : Form
    {
        private FilterInfoCollection videoDevices;//所有摄像设备
        private VideoCaptureDevice videoDevice;//摄像设备
        private VideoCapabilities[] videoCapabilities;//摄像头分辨率
        FaceCompare faceCompare;
        FaceManager faceManager;
        public FaceRecognitionForm()
        {
            InitializeComponent();
        }

        private void FaceRecognitionForm_Load(object sender, EventArgs e)
        {
            videoDevices = new FilterInfoCollection(FilterCategory.VideoInputDevice);//得到机器所有接入的摄像设备
            if (videoDevices.Count != 0)
            {
                foreach (FilterInfo device in videoDevices)
                {
                    cboVideo.Items.Add(device.Name);//把摄像设备添加到摄像列表中
                }
            }
            else
            {
                cboVideo.Items.Add("没有找到摄像头");
            }

            cboVideo.SelectedIndex = 0;//默认选择第一个

            FaceCompare.load_db_face();

            ConnectCamera();

           

            faceCompare = new FaceCompare();
            faceManager = new FaceManager();

            timer_face.Enabled = true;
            timer_face.Interval = 50;  //定时器时间间隔
            timer_face.Start();   //定时器开始工作
        }

        private void cboVideo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (videoDevices.Count != 0)
            {
                //获取摄像头
                videoDevice = new VideoCaptureDevice(videoDevices[cboVideo.SelectedIndex].MonikerString);
                GetDeviceResolution(videoDevice);//获得摄像头的分辨率
            }
        }

        //获得摄像头的分辨率
        private void GetDeviceResolution(VideoCaptureDevice videoCaptureDevice)
        {
            cboResolution.Items.Clear();//清空列表
            videoCapabilities = videoCaptureDevice.VideoCapabilities;//设备的摄像头分辨率数组
            foreach (VideoCapabilities capabilty in videoCapabilities)
            {
                //把这个设备的所有分辨率添加到列表
                cboResolution.Items.Add($"{capabilty.FrameSize.Width} x {capabilty.FrameSize.Height}");
            }

            cboResolution.SelectedIndex = 0;//默认选择第一个
        }


        //连接摄像头
        public void ConnectCamera()
        {
            JObject restjRet = new JObject();
            restjRet.Add(new JProperty("msgid", Guid.NewGuid()));
            restjRet.Add(new JProperty("msgtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
            restjRet.Add(new JProperty("msgtype", "event"));
            restjRet.Add(new JProperty("topic", "opencamera"));

            JObject paramjRet = new JObject();
            
            if (videoDevice != null)//如果摄像头不为空
            {
                if ((videoCapabilities != null) && (videoCapabilities.Length != 0))
                {
                    string css = cboVideo.Text.ToString();
                    if (cboVideo.Text.ToString().Equals("Doccamera"))//Doccamera
                    {
                        cboResolution.SelectedIndex = 1;//默认高拍仪切换摄像头
                    }
                    else
                    {
                        cboResolution.SelectedIndex = 0;//默认选择第一个
                    }

                    if (cboVideo.Text.ToString().Equals("Doccamera"))//Doccamera
                    {
                        cboVideo.SelectedIndex = 1;//默认高拍仪切换摄像头
                    }
                    else
                    {
                        cboVideo.SelectedIndex = 0;//默认选择第一个
                    }

                    videoDevice.VideoResolution = videoCapabilities[cboResolution.SelectedIndex];//摄像头分辨率
                    vispShoot.VideoSource = videoDevice;//把摄像头赋给控件
                    vispShoot.Start();//开启摄像头
                    EnableControlStatus(false);
                    paramjRet.Add(new JProperty("code", 1));
                    paramjRet.Add(new JProperty("msg", "打开摄像头成功!"));
                    restjRet.Add(new JProperty("param", paramjRet));
                    foreach (var item in Message._server.WebSocket.GetAllSessions())
                        Message._server.SendMessage(item, restjRet.ToString());
                }
            }
            else
            {
                MessageBox.Show("未找到摄像头!");
                paramjRet.Add(new JProperty("code", 0));
                paramjRet.Add(new JProperty("msg", "打开摄像头失败!"));
                restjRet.Add(new JProperty("param", paramjRet.ToString()));
                foreach (var item in Message._server.WebSocket.GetAllSessions())
                    Message._server.SendMessage(item, restjRet.ToString());
            }
        }

        //控件的显示切换
        private void EnableControlStatus(bool status)
        {
            cboVideo.Enabled = status;
            cboResolution.Enabled = status;
        }

        //取消识别
        private void button1_Click(object sender, EventArgs e)
        {
            JObject restjRet = new JObject();
            restjRet.Add(new JProperty("msgid", Guid.NewGuid()));
            restjRet.Add(new JProperty("msgtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
            restjRet.Add(new JProperty("msgtype", "event"));
            restjRet.Add(new JProperty("topic", "recognitionresult"));

            JObject paramjRet = new JObject();
            paramjRet.Add(new JProperty("code", 0));
            paramjRet.Add(new JProperty("xyrbh", ""));
            paramjRet.Add(new JProperty("msg", "人脸识别失败!"));

            restjRet.Add(new JProperty("param", paramjRet));

            foreach (var item in Message._server.WebSocket.GetAllSessions())
                Message._server.SendMessage(item, restjRet.ToString());

            TimerStop();
            
            this.Close();
        }

        //关闭并释放
        private void DisConnect()
        {
            if (vispShoot.VideoSource != null)
            {
                vispShoot.SignalToStop();
                vispShoot.WaitForStop();
                vispShoot.VideoSource = null;
            }
        }

        private void FaceRecognitionForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            DisConnect();//关闭并释放
        }

        private void timer_face_Tick(object sender, EventArgs e)
        {
            FacePhoto();
        }

        //拍照人脸识别
        public void FacePhoto()
        {
            try {

                Bitmap img = vispShoot.GetCurrentVideoFrame();//拍照
                byte[] img_bytes = ImageUtils.Bitmap2Byte(img);
                img.Dispose();
                string recognitionJson = "";

                lock (LockDX.GetInstance().lockerFaceAPI)
                {
                    recognitionJson = faceCompare.test_identify_by_buf_with_all(img_bytes);
                }


                Log.Info(recognitionJson);

                JObject facejRet = JObject.Parse(recognitionJson);
                if (facejRet["msg"].ToString().Equals("success"))
                {
                    if (double.Parse(facejRet["data"]["result"][0]["score"].ToString()) > 80)
                    {
                        string xyrbh = facejRet["data"]["result"][0]["user_id"].ToString();

                        JObject restjRet = new JObject();
                        restjRet.Add(new JProperty("msgid", Guid.NewGuid()));
                        restjRet.Add(new JProperty("msgtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
                        restjRet.Add(new JProperty("msgtype", "event"));
                        restjRet.Add(new JProperty("topic", "recognitionresult"));

                        JObject paramjRet = new JObject();
                        paramjRet.Add(new JProperty("code", 1));
                        paramjRet.Add(new JProperty("xyrbh", xyrbh));
                        paramjRet.Add(new JProperty("msg", "人脸识别成功!"));

                        restjRet.Add(new JProperty("param", paramjRet));

                        foreach (var item in Message._server.WebSocket.GetAllSessions())
                            Message._server.SendMessage(item, restjRet.ToString());
                        TimerStop();
                    }
                }

                #region 注册人脸
                //TaskFactory tf = new TaskFactory();
                //Task taskTrack1 = tf.StartNew(() => FaceService());

                //faceManager.test_user_add_by_buf(img_bytes);

                //R4504059500002012110030 杨
                //R4501034000002012110383 罗
                //R4509238400002012100025 叶
                //R4509238400002012100026 陈

                //faceManager.test_user_delete("R4509238400002012100025", "0101");

                //string addJson = faceManager.test_user_add("R4509238400002012100025", "0101", "d:\\9.jpg");

                //timer_face.Enabled = false;
                //timer_face.Stop();
                #endregion

                #region 测试
                //JObject restjRet = new JObject();
                //restjRet.Add(new JProperty("msgid", Guid.NewGuid()));
                //restjRet.Add(new JProperty("msgtime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
                //restjRet.Add(new JProperty("msgtype", "event"));
                //restjRet.Add(new JProperty("topic", "recognitionresult"));

                //JObject paramjRet = new JObject();
                //paramjRet.Add(new JProperty("code", 1));
                //paramjRet.Add(new JProperty("xyrbh", "R4504059500002012110030"));
                //paramjRet.Add(new JProperty("msg", "人脸识别成功!"));

                //restjRet.Add(new JProperty("param", paramjRet));

                //foreach (var item in Message._server.WebSocket.GetAllSessions())
                //    Message._server.SendMessage(item, restjRet.ToString());
                //TimerStop();
                #endregion


            }
            catch (Exception ex)
            {
                Log.Error("拍照异常：" + ex.Message);
            }
        }
        public void TimerStop()
        {
            DisConnect();//断开连接
            timer_face.Enabled = false;
            timer_face.Stop();
            this.Close();
        }
    }
}
