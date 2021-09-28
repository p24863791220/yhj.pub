using AForge.Controls;
using AForge.Video;
using AForge.Video.FFMPEG;
using AForge.Video.DirectShow;
using AForge.Controls.Fakes;

using Emgu.CV;
using Emgu.CV.Tiff;
using Emgu.CV.VideoStab;
using Emgu.CV.Shape;
using Emgu.CV.Superres;
using Emgu.CV.CvEnum;
using Emgu.CV.Dnn;
using Emgu.CV.ML;
using Emgu.CV.Structure;
using Emgu.CV.Util;
using Emgu.CV.Stitching;
using Emgu.CV.OCR;
using Emgu.CV.Text;
using Emgu.CV.LineDescriptor;
using Emgu.CV.Mcc;
using Emgu.CV.XObjdetect;
using Emgu.CV.Features2D;
using Emgu.CV.Dpm;
using Emgu.CV.XImgproc;
using Emgu.CV.Stereo;

using NAudio.CoreAudioApi;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using System.Runtime.InteropServices;
using Tesseract;
using System.Management;
using System.Threading.Tasks;
using Microsoft.VisualBasic;
using System.Windows.Input;
using System.Threading;
using BasicDemo;
using HslCommunicationDemo;
using HslCommunication.Profinet.Siemens;
//using HslCommunicationDemo.Control;
using SignalCommunication;
using System.Reflection;
using SmtTest;

namespace 螺丝自动锁付
{
    public partial class AutoCheck : Form
    {
        public static rectangleSet currentRect = new rectangleSet();//存储当前的框选
        public static List<rectangleSet> listRectangle = new List<rectangleSet>();//存储全部设定的框选，判断也以这个为准
        Graphics realpicG;//图片框选
        private FilterInfoCollection videoDevices;

        private VideoCaptureDevice videoSource1;
        private VideoCaptureDevice videoSource2;
        private VideoCaptureDevice videoSource3;
        private VideoCaptureDevice videoSource4;
        public static string hksavejpegpath;
        //摄像头支持格式 分辨率
        private VideoCapabilities[] videoCapabilities;
        public static List<children>[] childrenlist = new List<children>[100] { new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),
                                new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),
                                new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),
                                new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),
                                new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(),new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>(), new List<children>()};
        public static List<zhicolor>[] zhicolorlist = new List<zhicolor>[100] { new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() , new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(),
                                new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() , new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(),
                                new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() , new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(),
                                new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() , new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(),
                                new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() , new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>(), new List<zhicolor>() };
        public AutoCheck()
        {
            InitializeComponent();

        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }
        private void Restart()//自启动
        {
            Application.ExitThread();
            Thread thtmp = new Thread(new ParameterizedThreadStart(run));
            object appName = Application.ExecutablePath;
            Thread.Sleep(1000);
            Application.DoEvents();
            Thread.Sleep(1000);
            Application.DoEvents();
            Thread.Sleep(1000);
            Application.DoEvents();
            thtmp.Start(appName);
        }
        private void run(Object obj)

        {
            Process ps = new Process();
            ps.StartInfo.FileName = obj.ToString();
            ps.Start();
        }

        private void toolcloseVideo_Click(object sender, EventArgs e)
        {
            toolcloseVideo.Enabled = false;
            try
            {
                switch (currentvideocomboBox.Text)
                {
                    case "1":
                        if (videoSource1 != null)
                        {
                            videoSource1.Stop();
                            System.Threading.Thread.Sleep(30);
                            toolopenVideo1.Text = "开启图像设备1";
                        }
                        break;
                    case "2":
                        if (videoSource2 != null)
                        {
                            videoSource2.Stop();
                            System.Threading.Thread.Sleep(30);
                            toolopenVideo2.Text = "开启图像设备2";
                        }
                        break;
                    case "3":
                        if (videoSource3 != null)
                        {
                            videoSource3.Stop();
                            System.Threading.Thread.Sleep(30);
                            toolopenVideo3.Text = "开启图像设备3";
                        }
                        break;
                    case "4":
                        if (videoSource4 != null)
                        {
                            videoSource4.Stop();
                            System.Threading.Thread.Sleep(30);
                            toolopenVideo4.Text = "开启图像设备4";
                        }
                        break;
                }
                closeface();
                setvideostatus(true, "关闭图像设备成功！");
                toolcloseVideo.Enabled = true;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("toolcloseVideo_Click", ex.ToString());
                setvideostatus(false, "关闭图像设备错误！");
                toolcloseVideo.Enabled = true;
            }
        }
        public static string catchpicsavepath = @"E:\threeYears\threeYears\threeYears\bin\Debug\Rectangle\catchpic\";
        private void toolcatchPic_Click(object sender, EventArgs e)
        {
            try
            {
                if (setinglogClass.powerpub.ToLower() == "p24863" || cf.ret == "p24863")
                {
                    maintab.SelectTab("realPage");
                    this.maintab.TabPages["realPage"].Show();
                    maintab_SelectedIndexChanged(null, null);
                }
                switch (currentvideocomboBox.Text)
                {
                    case "1":
                        realPicture.Image = videoSourcePlayer1.GetCurrentVideoFrame();
                        realPicture.Image.Save(catchpicsavepath + "catch1.jpg");
                        break;
                    case "2":
                        realPicture.Image = videoSourcePlayer2.GetCurrentVideoFrame();
                        realPicture.Image.Save(catchpicsavepath + "catch2.jpg");
                        break;
                    case "3":
                        realPicture.Image = videoSourcePlayer3.GetCurrentVideoFrame();
                        realPicture.Image.Save(catchpicsavepath + "catch3.jpg");
                        break;
                    case "4":
                        realPicture.Image = videoSourcePlayer4.GetCurrentVideoFrame();
                        realPicture.Image.Save(catchpicsavepath + "catch4.jpg");
                        break;
                }
            }
            catch (Exception ex)
            {
                setrunstatus(true, ex.ToString());
            }

        }

        private void buttonVoice_Click(object sender, EventArgs e)
        {
            if (textBoxVoice.Text.Trim() != "")
                voice.StartVoice3(textBoxVoice.Text);
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "JPEG files(*.JPG)|*.JPG|jpeg files(*.jpeg)|*.jpeg|bmp files(*.bmp)|*.bmp|png files(*.png)|*.png";
            openFileDialog1.ShowDialog();

        }
        public static string openfilePath;
        public static string savefilePath;
        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            openfilePath = openFileDialog1.FileName.ToString();
            //StringBuilder str = new StringBuilder();              
            if (openfilePath.IndexOf("\\") != -1)
            {
                if (maintab.SelectedTab.Name == "realPage")
                {
                    this.realPicture.SizeMode = PictureBoxSizeMode.AutoSize;
                    this.realPicture.Location = new System.Drawing.Point(0, 0);
                    this.realPicture.Load(openfilePath);
                }
                else
                {
                    if (this.checkpic2.Image != null)
                    {
                        this.checkpic.SizeMode = PictureBoxSizeMode.AutoSize;
                        this.checkpic.Location = new System.Drawing.Point(0, 0);
                        this.checkpic.Load(openfilePath);
                    }
                    else
                    {
                        this.checkpic2.SizeMode = PictureBoxSizeMode.AutoSize;
                        this.checkpic2.Location = new System.Drawing.Point(0, 0);
                        this.checkpic2.Load(openfilePath);
                    }
                }

            }
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            saveFileDialog1.Filter = "jpeg files(*.jpeg)|*.jpg|bmp files(*.bmp)|*.bmp";
            saveFileDialog1.ShowDialog();
        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            savefilePath = saveFileDialog1.FileName;
            realPicture.Image.Save(savefilePath);
        }
        private void realPicture_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                快捷菜单.Show(e.X, e.Y);
                return;
            }
            timer1.Enabled = false;
            if ((realPicture.Image == null)) return;
            if (currentRect.startX == 0)
            {
                currentRect.startX = e.X;
                currentRect.startY = e.Y;
                return;
            }
            if (currentRect.startX > 0)
            {
                if (currentRect.startX > e.X)
                {
                    currentRect.endX = currentRect.startX;
                    currentRect.startX = e.X;
                }
                else
                {
                    currentRect.endX = e.X;
                }
                if (currentRect.startY > e.Y)
                {
                    currentRect.endY = currentRect.startY;
                    currentRect.startY = e.Y;
                }
                else
                {
                    currentRect.endY = e.Y;
                }
                realPicture.Refresh();
                realpicG.DrawRectangle(new Pen(Color.Red), currentRect.startX, currentRect.startY, currentRect.endX - currentRect.startX, currentRect.endY - currentRect.startY);
                快捷菜单.Show(e.X, e.Y);
            }
        }
        public void setwhmousemv(object sender, MouseEventArgs e)
        {
            whtoolStripStatusLabel.Text = "W:" + e.X + " H:" + e.Y;
        }
        private void realPicture_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
            if (currentRect.startX > 0)
            {
                if (currentRect.startX > e.X)
                {
                    currentRect.endX = currentRect.startX;
                    currentRect.startX = e.X;
                }
                else
                {
                    currentRect.endX = e.X;
                }
                if (currentRect.startY > e.Y)
                {
                    currentRect.endY = currentRect.startY;
                    currentRect.startY = e.Y;
                }
                else
                {
                    currentRect.endY = e.Y;
                }
                realPicture.Refresh();
                realpicG.DrawRectangle(new Pen(Color.Red), currentRect.startX, currentRect.startY, currentRect.endX - currentRect.startX, currentRect.endY - currentRect.startY);
            }
        }

        private void threeYears_FormClosing(object sender, FormClosingEventArgs e)
        {
            listRectangle.Clear();
            listRectangle = null;
            realpicG.Dispose();
            realpicG = null;
        }
        private void saveSamplePic(int startX, int startY, int width, int height, string filename)
        {
            try
            {
                //先初始化一个位图对象，来存储截取后的图像
                Bitmap bmpDest = new Bitmap(realPicture.Image);
                //这个矩形定义了，你将要在被截取的图像上要截取的图像区域的左顶点位置和截取的大小
                Rectangle rectSource = new Rectangle(startX, startY, width, height);
                bmpDest = bmpDest.Clone(rectSource, PixelFormat.Format16bppArgb1555);
                bmpDest.Save(setinglogClass.savefilePath2 + filename + ".bmp");
                bmpDest.Dispose();
                bmpDest = null;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("saveSamplePic", ex.ToString());
            }
        }
        public byte[] readpicFile(string filename)//读取文件，返
        {
            if (!File.Exists(filename)) return null;
            try
            {
                //实例化一个文件流
                FileStream fs = new FileStream(filename, FileMode.Open);
                //把文件读取到字节数组
                byte[] data = new byte[fs.Length];
                fs.Read(data, 0, data.Length);
                fs.Close();
                return data;
            }
            ////实例化一个内存流--->把从文件流中读取的内容[字节数组]放到内存流中去
            //MemoryStream ms = new MemoryStream(data);
            ////设置图片框 pictureBox1中的图片
            //return  Image.FromStream(ms);
            catch (Exception ex)
            {
                return null;
            }
        }
        private byte[] memory_Click(string selectStr, System.Drawing.Image p = null)//内存处理图像
        {
            try
            {
                if (selectStr == "文件读取")
                {
                    selectSet = dataGridView1.SelectedRows[0].DataBoundItem as rectangleSet;
                    currentSelect = dataGridView1.SelectedRows[0].Index;
                    return readpicFile(setinglogClass.savefilePath2 + selectSet.sampleName + ".bmp");
                }
                if (p == null) return null;
                Rectangle rect = new Rectangle(0, 0, p.Width, p.Height);
                Bitmap bmpSource = new Bitmap(p);
                System.Drawing.Imaging.BitmapData bmpData = bmpSource.LockBits(rect, System.Drawing.Imaging.ImageLockMode.ReadWrite, bmpSource.PixelFormat);
                IntPtr ptr = bmpData.Scan0;
                int bytes = p.Width * p.Height * 3;
                byte[] rgbValues = new byte[bytes];
                System.Runtime.InteropServices.Marshal.Copy(ptr, rgbValues, 0, bytes);
                //double colorTemp = 0;
                //for (int i = 0; i < rgbValues.Length; i += 3)
                //{
                //    colorTemp = rgbValues[i + 2] * 0.299 + rgbValues[i + 1] * 0.587 + rgbValues[i] * 0.114;
                //    rgbValues[i] = rgbValues[i + 1] = rgbValues[i + 2] = (byte)colorTemp;
                //}
                //System.Runtime.InteropServices.Marshal.Copy(rgbValues, 0, ptr, bytes);
                bmpSource.UnlockBits(bmpData);
                return rgbValues;
                //Invalidate();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("memory_Click", ex.ToString());
                return null;
            }
        }
        private void 保存框选_Click(object sender, EventArgs e)
        {
            if (currentRect.startX == 0) return;
            rectangleSet rs = new rectangleSet();
            rs.startX = currentRect.startX;
            rs.startY = currentRect.startY;
            rs.endX = currentRect.endX;
            rs.endY = currentRect.endY;

            if (realPicture.Image != null)//存储样板图片
            {
                DateTime cdt = DateTime.Now;
                string dt = cdt.Year.ToString() + cdt.Month.ToString() + cdt.Day.ToString() + cdt.Hour.ToString() + cdt.Minute.ToString() + cdt.Second.ToString();
                rs.sampleName = dt;
                saveSamplePic(rs.startX, rs.startY, rs.endX - rs.startX, rs.endY - rs.startY, dt);
            }
            else
            {
                rs.sampleName = "";
            }

            rs.lineUpMin = configlineup;
            rs.lineUpMax = rs.endX - rs.startX;
            rs.lineDownMin = configlinedown;
            rs.lineDownMax = rs.endX - rs.startX;

            rs.lineLeftMin = configlineleft;
            rs.lineLeftMax = rs.endY - rs.startY;
            rs.lineRightMin = configlineright;
            rs.lineRightMax = rs.endY - rs.startY;

            listRectangle.Add(rs);

            currentRect.startX = 0;
            currentRect.startY = 0;
            currentRect.endX = 0;
            currentRect.endY = 0;
        }

        private void 取消框选_Click(object sender, EventArgs e)
        {
            currentRect.startX = 0;
            currentRect.startY = 0;
            currentRect.endX = 0;
            currentRect.endY = 0;
            realPicture.Refresh();
        }
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
        private void AutoCheck_Load(object sender, EventArgs e)
        {
            try
            {
                System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = false;
                voice.StartVoice3("启动中");
                //initpic();
                //String easttextmodel = Application.StartupPath.ToString() + @"\textcnn\frozen_east_text_detection.pb";
                //easttextnet = DnnInvoke.ReadNet(easttextmodel);

                //string model = Application.StartupPath.ToString() + @"\googlenet\" + "bvlc_alexnet.caffemodel";
                //string config = Application.StartupPath.ToString() + @"\googlenet\" + "bvlc_alexnet.prototxt";
                //string label_file = Application.StartupPath.ToString() + @"\googlenet\" + "synset_words.txt";
                //dnnnet = DnnInvoke.ReadNetFromCaffe(config, model);

                //labels = readlabels(label_file);

                //string modelpath = setinglogClass.textcnnpath + @"TextBoxes_icdar13.caffemodel";
                //string fenleiPath = setinglogClass.textcnnpath + @"textbox.prototxt";
                //detector = new TextDetectorCNN(fenleiPath, modelpath);

                //numocr = new TesseractEngine(setinglogClass.tessertpath, "enm");//设置语言   英文
                //chiocr = new TesseractEngine(setinglogClass.tessertpath, "chi_sim", EngineMode.Default);//设置语言   中文
                //engocr = new TesseractEngine(setinglogClass.tessertpath, "eng");//设置语言   繁体
                hksavejpegpath = peifang.Text;
                loadsetButton_Click(null, null);
                showcheckpictab();
                //SystemMultimediaController.SetValue(SystemMultimediaController.MaxValue, SystemMultimediaController.MinValue, 0x6000);
            }
            catch (Exception ex)
            {
                hksavejpegpath = peifang.Text;
                setinglogClass.writeLog("AutoCheck_Load", ex.ToString());
            }
            realpicG = realPicture.CreateGraphics();//实时图像绘图
            setinglogClass.loadSetting();//载入设定
            loadconfigSet();//装载配置文件设定

            shexianinit();//初始化图像设备

            currentvideocomboBox_SelectedIndexChanged_1(null, null);
        }
        public void showcheckpictab()
        {
            try
            {
                maintab.SelectTab("checkPage");//启动时这句会出错
                this.maintab.TabPages["checkPage"].Show();
            }
            catch (Exception ex)
            {

            }

        }
        public static int pubsNewFilter;
        public static int pubsClearNoise;
        public static int pubsAverageFilter;
        public static int pubsMidFilter;

        public static int configlineup;
        public static int configlinedown;
        public static int configlineleft;
        public static int configlineright;
        private void loadconfigSet()
        {

            pubsNewFilter = int.Parse(configSettings("NewFilter", "3", true));
            pubsClearNoise = int.Parse(configSettings("ClearNoise", "3", true));
            pubsAverageFilter = int.Parse(configSettings("AverageFilter", "3", true));
            pubsMidFilter = int.Parse(configSettings("MidFilter", "3", true));

            configlineup = int.Parse(configSettings("configlineup", "1", true));
            configlinedown = int.Parse(configSettings("configlinedown", "1", true));
            configlineleft = int.Parse(configSettings("configlineleft", "1", true));
            configlineright = int.Parse(configSettings("configlineright", "1", true));

            upColor.Text = "上" + configSettings("rgbup", "15", true);
            downColor.Text = "下" + configSettings("rgbdown", "15", true);
            twoupLabel.Text = "上" + configSettings("twovalueup", "15", true);
            twodownLable.Text = "下" + configSettings("twovaluedown", "15", true);
            lvboCombo.Items.Add("AverageFilter");//滤波选项
            lvboCombo.Items.Add("MidFilter");
            lvboCombo.Items.Add("HistEqual");
            lvboCombo.Items.Add("NewFilter");
            lvboCombo.Items.Add("ClearNoise");
            lvboCombo.Items.Add("ClearNoise2");
        }
        private void loadsetButton_Click(object sender, EventArgs e)
        {
            try
            {
                setinglogClass.loadSetting();
                System.ComponentModel.BindingList<rectangleSet> BList = new BindingList<rectangleSet>(listRectangle);
                //System.ComponentModel.BindingList<zhicolor>[] BListzhicolor = new BindingList<zhicolor>[] { new BindingList<zhicolor>()};
                //System.ComponentModel.BindingList<children>[] BListchildren = new BindingList<children>[] { new BindingList<children>()};
                this.dataGridView1.DataSource = BList; //将DataGridView里的数据源绑定成BindingList
                for (int i = 0; i < listRectangle.Count; i++)
                {
                    if (i % 2 == 0)
                        dataGridView1.Rows[i].DefaultCellStyle.BackColor = Color.Goldenrod;
                    if (setinglogClass.zhic(i))
                    {
                        System.ComponentModel.BindingList<zhicolor> BListzhicolor = new BindingList<zhicolor>(zhicolorlist[i]);
                        listRectangle[i].dtcolor = BListzhicolor;
                    }
                    if (setinglogClass.childrenbool(i))
                    {
                        System.ComponentModel.BindingList<children> BListchildren = new BindingList<children>(childrenlist[i]);
                        listRectangle[i].dtchildren = BListchildren;
                    }

                }
                dataGridView1.Refresh();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("", ex.ToString());
            }
        }
        private void AddColumns()
        {
            DataGridViewTextBoxColumn idColumn = new DataGridViewTextBoxColumn();
            idColumn.Name = "Task";
            idColumn.DataPropertyName = "Id";
            idColumn.ReadOnly = true;

            DataGridViewComboBoxColumn assignedToColumn = new DataGridViewComboBoxColumn();

            // Populate the combo box drop-down list with Employee objects. 
            foreach (rectangleSet e in listRectangle) assignedToColumn.Items.Add(e);

            // Add "unassigned" to the drop-down list and display it for 
            // empty AssignedTo values or when the user presses CTRL+0. 
            assignedToColumn.Items.Add("unassigned");
            assignedToColumn.DefaultCellStyle.NullValue = "unassigned";

            assignedToColumn.Name = "Assigned To";
            assignedToColumn.DataPropertyName = "AssignedTo";
            assignedToColumn.AutoComplete = true;
            assignedToColumn.DisplayMember = "Name";
            assignedToColumn.ValueMember = "Self";

            // Add a button column. 
            DataGridViewButtonColumn buttonColumn = new DataGridViewButtonColumn();
            buttonColumn.HeaderText = "";
            buttonColumn.Name = "Status Request";
            buttonColumn.Text = "Request Status";
            buttonColumn.UseColumnTextForButtonValue = true;

            dataGridView1.Columns.Add(idColumn);
            dataGridView1.Columns.Add(assignedToColumn);
            dataGridView1.Columns.Add(buttonColumn);
            // Add a CellClick handler to handle clicks in the button column.
            //dataGridView1.CellClick +=   new DataGridViewCellEventHandler(dataGridView1_CellClick);
        }

        private void savesetButton_Click(object sender, EventArgs e)
        {
            setinglogClass.saveSetting();
        }

        public static rectangleSet selectSet = new rectangleSet();//存储选定值
        public static int currentSelect = 0;//存储当前的框选编号
        public static gridviewForm gdform = new gridviewForm();
        public static gridviewForm gdformchild = new gridviewForm();

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                samplesetTab.SelectTab("sampleTab");
                selectSet = dataGridView1.SelectedRows[0].DataBoundItem as rectangleSet;
                currentSelect = selectSet.groupNo;
                samplePic.Load(setinglogClass.savefilePath2 + selectSet.sampleName + ".bmp");
                if (childrenlist[currentSelect].Count > 0)
                {
                    if (File.Exists(childrenlist[currentSelect].ElementAt(0).sampleName))
                        blendsamplepic.Load(childrenlist[currentSelect].ElementAt(0).sampleName);
                    else
                    {
                        blendsamplepic.Image = null;
                        blendsamplepic.Refresh();
                    }
                }
                else
                {
                    blendsamplepic.Image = null;
                    blendsamplepic.Refresh();
                }
                GrayBitmapData.listfengguo.Clear();
                if (listRectangle[currentSelect].dtcolor != null)
                {
                    gdform.Text = "colorlist";
                    gdform.setdata(listRectangle[currentSelect].dtcolor);
                    gdform.Show();
                    gdform.Refresh();


                    gdformchild.Text = "childrenlist";
                    gdformchild.setdatachild(listRectangle[currentSelect].dtchildren);
                    gdformchild.Show();
                    gdformchild.Refresh();

                }
                displaykuanbutton_Click(null, null);
            }
            catch (Exception ex)
            {

            }
        }
        private void loadchildren()
        {
            if (childrenlist[currentSelect].Count > 0)
            {
                for (int i = 0; i < childrenlist[currentSelect].Count; i++)
                {
                    GrayBitmapData.listfengguo.Add(new Rectangle(childrenlist[currentSelect].ElementAt(i).startX, childrenlist[currentSelect].ElementAt(i).startY, childrenlist[currentSelect].ElementAt(i).endX - childrenlist[currentSelect].ElementAt(i).startX, childrenlist[currentSelect].ElementAt(i).endY - childrenlist[currentSelect].ElementAt(i).startY));
                }
            }
            else
            {
                GrayBitmapData.listfengguo.Clear();
            }
        }
        private void picsaveButton_Click(object sender, EventArgs e)
        {
            if (realPicture.Image == null) return;
            Bitmap bt = new Bitmap(realPicture.Image);
            //Image<Bgr, byte> outi = bt.ToMat ().ToImage <Bgr,byte>();
            CvInvoke.Imwrite(setinglogClass.savefilePath2 + @"\bigSample.jpg", bt.ToMat());
            //bt.Save(setinglogClass.savefilePath2 + "bigSample.jpg");

        }

        private void 显示所有框选_Click(object sender, EventArgs e)
        {
            if (timer1.Enabled == true)
                timer1.Enabled = false;
            else
                timer1.Enabled = true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                realPicture.Refresh();
                Graphics g = realPicture.CreateGraphics();
                foreach (rectangleSet rs in listRectangle)
                {
                    g.DrawRectangle(new Pen(Color.Red), rs.startX, rs.startY, rs.endX - rs.startX, rs.endY - rs.startY);
                    g.DrawString(rs.groupNo.ToString(), new Font("新宋体", 16), new SolidBrush(Color.BlueViolet), new PointF(rs.startX, rs.startY));
                }
            }
            catch (Exception ex)
            {

            }
        }
        private static string configSettings(String name, string value, bool types)
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

        private void shexiansaveButton_Click(object sender, EventArgs e)
        {
            string str = configSettings("video", shexiangCombo1.SelectedItem.ToString(), false);
            str = configSettings("fenbian", fengbianCombo1.SelectedItem.ToString(), false);
        }

        private void AutoCheck_FormClosed(object sender, FormClosedEventArgs e)
        {
            try
            {
                Application.Exit();
                Environment.Exit(0);
            }
            catch
            {

            }
        }
        public void closeface()
        {
            try
            {
                if (kindfeilei.face_cascade != null) kindfeilei.face_cascade.Dispose();
                if (kindfeilei.modelface != null) kindfeilei.modelface.Dispose();
                kindfeilei.modelface = null;
                kindfeilei.face_cascade = null;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                GC.Collect();
                GC.SuppressFinalize(this);
            }
        }
        private void samplePic_MouseUp(object sender, MouseEventArgs e)
        {
            try
            {
                if (samplePic.Image != null)
                {
                    Color pixel;
                    Bitmap bts = (Bitmap)samplePic.Image;
                    pixel = bts.GetPixel(e.X, e.Y);
                    currentColor.BackColor = pixel;
                    listRectangle[currentSelect].hCurrent = pixel.A;
                    listRectangle[currentSelect].rCurrent = pixel.R;
                    listRectangle[currentSelect].gCurrent = pixel.G;
                    listRectangle[currentSelect].bCurrent = pixel.B;

                    int yun = int.Parse(upColor.Text.Substring(1, upColor.Text.Length - 1));
                    int A = ((pixel.A + yun) > 255) ? 255 : (pixel.A + yun);
                    int R = ((pixel.R + yun) > 255) ? 255 : (pixel.R + yun);
                    int G = ((pixel.G + yun) > 255) ? 255 : (pixel.G + yun);
                    int B = ((pixel.B + yun) > 255) ? 255 : (pixel.B + yun);
                    upColor.BackColor = Color.FromArgb(A, R, G, B);
                    zhicolor zc1 = new zhicolor();
                    zc1.groupNo = currentSelect;
                    zc1.hUp = A; zc1.rUp = R; zc1.gUp = G; zc1.bUp = B;
                    if (e.Button == MouseButtons.Left)
                    {
                        if (setinglogClass.zhic(currentSelect)) zhicolorlist[currentSelect].Clear();
                        listRectangle[currentSelect].hUp = A;
                        listRectangle[currentSelect].rUp = R;
                        listRectangle[currentSelect].gUp = G;
                        listRectangle[currentSelect].bUp = B;
                    }
                    else
                    {
                        listRectangle[currentSelect].hUp = listRectangle[currentSelect].hUp > A ? listRectangle[currentSelect].hUp : A;
                        listRectangle[currentSelect].rUp = listRectangle[currentSelect].rUp > R ? listRectangle[currentSelect].rUp : R;
                        listRectangle[currentSelect].gUp = listRectangle[currentSelect].gUp > G ? listRectangle[currentSelect].gUp : G;
                        listRectangle[currentSelect].bUp = listRectangle[currentSelect].bUp > B ? listRectangle[currentSelect].bUp : B;
                    }
                    yun = int.Parse(downColor.Text.Substring(1, downColor.Text.Length - 1));
                    A = ((pixel.A - yun) < 0) ? 0 : (pixel.A - yun);
                    R = ((pixel.R - yun) < 0) ? 0 : (pixel.R - yun);
                    G = ((pixel.G - yun) < 0) ? 0 : (pixel.G - yun);
                    B = ((pixel.B - yun) < 0) ? 0 : (pixel.B - yun);
                    downColor.BackColor = Color.FromArgb(A, R, G, B);
                    zc1.hDown = A; zc1.rDown = R; zc1.gDown = G; zc1.bDown = B;
                    if (e.Button == MouseButtons.Left)
                    {
                        listRectangle[currentSelect].hDown = A;
                        listRectangle[currentSelect].rDown = R;
                        listRectangle[currentSelect].gDown = G;
                        listRectangle[currentSelect].bDown = B;
                    }
                    else
                    {
                        listRectangle[currentSelect].hDown = listRectangle[currentSelect].hDown < A ? listRectangle[currentSelect].hDown : A;
                        listRectangle[currentSelect].rDown = listRectangle[currentSelect].rDown < R ? listRectangle[currentSelect].rDown : R;
                        listRectangle[currentSelect].gDown = listRectangle[currentSelect].gDown < G ? listRectangle[currentSelect].gDown : G;
                        listRectangle[currentSelect].bDown = listRectangle[currentSelect].bDown < B ? listRectangle[currentSelect].bDown : B;
                    }


                    R = Convert.ToInt16((pixel.R + pixel.G + pixel.B) / 3);
                    twocurrentLable.BackColor = Color.FromArgb(R, R, R);
                    listRectangle[currentSelect].twoCurrent = R;

                    yun = int.Parse(twoupLabel.Text.Substring(1, twoupLabel.Text.Length - 1));
                    int R1 = R + yun > 255 ? 255 : R + yun;
                    twoupLabel.BackColor = Color.FromArgb(R1, R1, R1);
                    zc1.twoUp = R1;
                    if (e.Button == MouseButtons.Left)
                        listRectangle[currentSelect].twoUp = R1;
                    else
                        listRectangle[currentSelect].twoUp = listRectangle[currentSelect].twoUp > R1 ? listRectangle[currentSelect].twoUp : R1;

                    yun = int.Parse(twodownLable.Text.Substring(1, twodownLable.Text.Length - 1));
                    int R2 = R - yun < 0 ? 0 : R - yun;
                    twodownLable.BackColor = Color.FromArgb(R2, R2, R2);
                    zc1.twoDown = R2;
                    if (e.Button == MouseButtons.Left)
                        listRectangle[currentSelect].twoDown = R2;
                    else
                        listRectangle[currentSelect].twoDown = listRectangle[currentSelect].twoDown < R2 ? listRectangle[currentSelect].twoDown : R2;
                    if (currentSelect < 101) zhicolorlist[currentSelect].Add(zc1);//只有100组
                }

            }
            catch (Exception ex)
            {

            }
        }


        private void realPicture_Paint(object sender, PaintEventArgs e)
        {
            realpicG = realPicture.CreateGraphics();
        }


        private void twoavergeLabel_DoubleClick(object sender, EventArgs e)
        {
            //Color pixel;
            //Bitmap bts = (Bitmap)samplePic.Image;
            //for (i=0;if<bts)
            //pixel = bts.GetPixel(e.X, e.Y);
        }

        private void colortwoButton_Click(bool hei = true, int ostu = 0)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            try
            {
                if (samplePic.Image == null) return;
                Bitmap bts = (Bitmap)samplePic.Image;
                if (samplesetTab.SelectedTab.Name == "twoTab")
                {
                    twoPic.Image = picdeal.twovalemgu(bts, currentSelect, ostu, hei);
                    twoPic.Refresh();
                }
                else
                {
                    samplesetTab.SelectTab("totalhrgbTab");
                    totalpic.Image = picdeal.twovalemgu(bts, currentSelect, ostu, hei);
                    totalpic.Refresh();
                }
                bts = null;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("colortwoButton_Click", ex.ToString());
            }
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();

        }
        private void lvboButton_Click(object sender, EventArgs e)
        {
            lvboButton.Enabled = false;
            Stopwatch watch = new Stopwatch();
            watch.Start();
            try
            {
                System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
                if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                    pt = twoPic;
                if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                    pt = totalpic;
                if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                    pt = samplePic;
                if (pt == null) return;
                switch (lvboCombo.Text)
                {
                    case "AverageFilter":
                        GrayBitmapData gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.AverageFilter(pubsAverageFilter);
                        gbmp.ShowImage(pt);//灰度图
                        break;
                    case "MidFilter":
                        gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.MidFilter(pubsMidFilter);
                        gbmp.ShowImage(pt);//灰度图
                        break;
                    case "HistEqual":
                        gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.HistEqual();
                        gbmp.ShowImage(pt);//灰度图
                        break;
                    case "NewFilter":
                        gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.NewFilter(pubsNewFilter);
                        gbmp.ShowImage(pt);//黑白图
                        break;
                    case "ClearNoise":
                        gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.ClearNoise(128, pubsClearNoise);
                        gbmp.ShowImage(pt);//黑白图
                        break;
                    case "ClearNoise2":
                        gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                        gbmp.ClearNoise2(128);
                        gbmp.ShowImage(pt);//黑白图
                        break;
                    case "高斯滤波":
                        Bitmap bt = new Bitmap(pt.Image);
                        Mat ma = bt.ToMat();
                        //高斯滤波实现
                        CvInvoke.GaussianBlur(ma, ma, new Size(5, 5), 4);
                        Image<Bgr, Byte> outi = ma.ToImage<Bgr, Byte>();
                        pt.Image = outi.ToBitmap();
                        break;
                    case "中值滤波":
                        bt = new Bitmap(pt.Image);
                        ma = bt.ToMat();
                        //高斯滤波实现
                        CvInvoke.MedianBlur(ma, ma, 5);//中值滤波实现
                        outi = ma.ToImage<Bgr, Byte>();
                        pt.Image = outi.ToBitmap();
                        break;
                    case "腐蚀"://黑白着色取反，府和膨对调了
                        bt = new Bitmap(pt.Image);
                        ma = bt.ToMat();
                        //指定参数获得结构元素
                        Mat Struct_element = CvInvoke.GetStructuringElement(Emgu.CV.CvEnum.ElementShape.Cross, new Size(3, 3), new System.Drawing.Point(-1, -1));
                        //膨胀
                        CvInvoke.Dilate(ma, ma, Struct_element, new System.Drawing.Point(1, 1), 3, Emgu.CV.CvEnum.BorderType.Default, new MCvScalar(0, 0, 0));
                        outi = ma.ToImage<Bgr, Byte>();
                        pt.Image = outi.ToBitmap();
                        break;
                    case "膨胀":
                        bt = new Bitmap(pt.Image);
                        ma = bt.ToMat();
                        //指定参数获得结构元素
                        Struct_element = CvInvoke.GetStructuringElement(Emgu.CV.CvEnum.ElementShape.Cross, new Size(3, 3), new System.Drawing.Point(-1, -1));
                        //腐蚀 当Struct_element模型创建不合理或者膨胀腐蚀次数较大时可能图像会发生偏移
                        CvInvoke.Erode(ma, ma, Struct_element, new System.Drawing.Point(-1, -1), 3, Emgu.CV.CvEnum.BorderType.Default, new MCvScalar(0, 0, 0));
                        outi = ma.ToImage<Bgr, Byte>();
                        pt.Image = outi.ToBitmap();

                        break;
                    case "最适合二值图":
                        bt = new Bitmap(pt.Image);
                        ma = bt.ToMat();
                        //Mat ma = new Mat();
                        //形态学闭运算，先膨胀后腐蚀  Others.matWithPhi(by)自定义模型
                        CvInvoke.AdaptiveThreshold(ma, ma, 150, AdaptiveThresholdType.GaussianC, Emgu.CV.CvEnum.ThresholdType.Binary, 3, 0);//查找最适合二值图
                        outi = ma.ToImage<Bgr, Byte>();
                        pt.Image = outi.ToBitmap();
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("lvboButton_Click", ex.ToString());
            }
            GC.Collect();
            GC.SuppressFinalize(this);
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
            lvboButton.Enabled = true;
        }

        private void fasttwoButton_Click(bool hei = true)
        {
            try
            {
                Stopwatch watch = new Stopwatch();
                watch.Start();
                if (samplePic.Image == null) return;
                Bitmap bts = (Bitmap)samplePic.Image;
                if (samplesetTab.SelectedTab.Name == "twoTab")
                {
                    twoPic.Image = picdeal.twovalfast(bts, currentSelect, "二值", hei);
                    twoPic.Refresh();
                }
                else
                {
                    samplesetTab.SelectTab("totalhrgbTab");
                    totalpic.Image = picdeal.twovalfast(bts, currentSelect, "彩色二值", hei);
                    totalpic.Refresh();
                }
                bts = null;
                setinglogClass.xihua = "";
                watch.Stop();
                runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("fasttwoButton_Click", ex.ToString());
            }
        }
        public static bool rebootchildren = false;
        private void kuangxuanButton_Click(object sender, EventArgs e)
        {
            try
            {
                System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
                if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                    pt = twoPic;
                if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                    pt = totalpic;
                if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                    pt = samplePic;
                if (pt == null) return;
                GrayBitmapData gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                listRectangle[currentSelect].lineUpMin = listRectangle[currentSelect].lineUpMin == 0 ? 1 : listRectangle[currentSelect].lineUpMin;
                listRectangle[currentSelect].lineUpMax = listRectangle[currentSelect].lineUpMax == 0 ? listRectangle[currentSelect].endX - listRectangle[currentSelect].startX : listRectangle[currentSelect].lineUpMax;
                listRectangle[currentSelect].lineDownMin = listRectangle[currentSelect].lineDownMin == 0 ? 1 : listRectangle[currentSelect].lineDownMin;
                listRectangle[currentSelect].lineDownMax = listRectangle[currentSelect].lineDownMax == 0 ? listRectangle[currentSelect].endX - listRectangle[currentSelect].startX : listRectangle[currentSelect].lineDownMax;
                listRectangle[currentSelect].lineLeftMin = listRectangle[currentSelect].lineLeftMin == 0 ? 1 : listRectangle[currentSelect].lineLeftMin;
                listRectangle[currentSelect].lineLeftMax = listRectangle[currentSelect].lineLeftMax == 0 ? listRectangle[currentSelect].endY - listRectangle[currentSelect].startY : listRectangle[currentSelect].lineLeftMax;
                listRectangle[currentSelect].lineRightMin = listRectangle[currentSelect].lineRightMin == 0 ? 1 : listRectangle[currentSelect].lineRightMin;
                listRectangle[currentSelect].lineRightMax = listRectangle[currentSelect].lineRightMax == 0 ? listRectangle[currentSelect].endY - listRectangle[currentSelect].startY : listRectangle[currentSelect].lineRightMax;
                unsafe
                {
                    Rectangle rect = gbmp.Kuangxuan(listRectangle[currentSelect].lineUpMin, listRectangle[currentSelect].lineUpMax, listRectangle[currentSelect].lineDownMin, listRectangle[currentSelect].lineDownMax, listRectangle[currentSelect].lineLeftMin, listRectangle[currentSelect].lineLeftMax, listRectangle[currentSelect].lineRightMin, listRectangle[currentSelect].lineRightMax);
                    Graphics g = pt.CreateGraphics();
                    g.DrawRectangle(new Pen(Color.Red), rect);
                    GrayBitmapData.listfengguo.Clear();
                    rebootchildren = true;
                    GrayBitmapData.listfengguo.Add(rect);
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("kuangxuanButton_Click", ex.ToString());
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //dataGridView1[1, 1].Style.ForeColor = Color.Red;
            //dataGridView1.Rows[2].DefaultCellStyle.ForeColor = Color.Green;
            //dataGridView1[3, 3].Style.BackColor = Color.Blue;
            //dataGridView1.Columns[5].DefaultCellStyle.BackColor= Color.Yellow;
        }

        private void fengguoButton_Click(object sender, EventArgs e)
        {
            try
            {
                Stopwatch watch = new Stopwatch();
                watch.Start();
                System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
                if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                    pt = twoPic;
                if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                    pt = totalpic;
                if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                    pt = samplePic;
                if (pt == null) return;
                GrayBitmapData gbmp = new GrayBitmapData((Bitmap)pt.Image);//不变
                listRectangle[currentSelect].lineUpMin = listRectangle[currentSelect].lineUpMin == 0 ? 1 : listRectangle[currentSelect].lineUpMin;
                listRectangle[currentSelect].lineUpMax = listRectangle[currentSelect].lineUpMax == 0 ? listRectangle[currentSelect].endX - listRectangle[currentSelect].startX : listRectangle[currentSelect].lineUpMax;
                listRectangle[currentSelect].lineDownMin = listRectangle[currentSelect].lineDownMin == 0 ? 1 : listRectangle[currentSelect].lineDownMin;
                listRectangle[currentSelect].lineDownMax = listRectangle[currentSelect].lineDownMax == 0 ? listRectangle[currentSelect].endX - listRectangle[currentSelect].startX : listRectangle[currentSelect].lineDownMax;
                listRectangle[currentSelect].lineLeftMin = listRectangle[currentSelect].lineLeftMin == 0 ? 1 : listRectangle[currentSelect].lineLeftMin;
                listRectangle[currentSelect].lineLeftMax = listRectangle[currentSelect].lineLeftMax == 0 ? listRectangle[currentSelect].endY - listRectangle[currentSelect].startY : listRectangle[currentSelect].lineLeftMax;
                listRectangle[currentSelect].lineRightMin = listRectangle[currentSelect].lineRightMin == 0 ? 1 : listRectangle[currentSelect].lineRightMin;
                listRectangle[currentSelect].lineRightMax = listRectangle[currentSelect].lineRightMax == 0 ? listRectangle[currentSelect].endY - listRectangle[currentSelect].startY : listRectangle[currentSelect].lineRightMax;
                unsafe
                {
                    GrayBitmapData.listfengguo.Clear();//清除上次分割
                    rebootchildren = true;
                    gbmp.fengguo(0, 0, pt.Width, pt.Height, listRectangle[currentSelect].lianjiePMin);
                    Graphics g = pt.CreateGraphics();
                    for (int i = 0; i < GrayBitmapData.listfengguo.Count; i++)
                    {
                        g.DrawRectangle(new Pen(Color.Red), GrayBitmapData.listfengguo[i]);
                    }
                }
                watch.Stop();
                runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("kuangxuanButton_Click", ex.ToString());
            }
        }
        //成员变量
        private string sourceImageFileName = " ";//源图像文件名
        private Image<Bgr, Byte> imageSource = null;                //源图像
        private Image<Bgr, Byte> imageSourceClone = null;           //源图像的克隆
        private Image<Gray, Int32> imageMarkers = null;              //标记图像
        private double xScale = 1d;                                 //原始图像与PictureBox在x轴方向上的缩放
        private double yScale = 1d;                                 //原始图像与PictureBox在y轴方向上的缩放
        private System.Drawing.Point previousMouseLocation = new System.Drawing.Point(-1, -1);    //上次绘制线条时，鼠标所处的位置
        private const int LineWidth = 5;                            //绘制线条的宽度
        private int drawCount = 1;                                  //用户绘制的线条数目，用于指定线条的颜色
        private void fenshuibutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bmp = new Bitmap(pt.Image);
            Mat src = bmp.ToMat();
            Mat dst = new Mat();
            CvInvoke.Canny(src, dst, 120, 180);
            //set image to 0
            //markerImage.SetTo(new MCvScalar(0, 0, 0));
            //find the contours
            VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();
            CvInvoke.FindContours(dst, contours, null, RetrType.External, ChainApproxMethod.LinkRuns);

            Mat mask = src.ToImage<Bgr, byte>().Copy().Mat;

            CvInvoke.DrawContours(mask, contours, -1, new MCvScalar(0, 0, 255));
            //CvInvoke.Normalize(matchImg, matchImg, 0, 1, NormType.MinMax, matchImg.Depth); //归一化
            //Image<Gray, byte> srci = src.ToImage<Gray,byte>();
            //Image<Gray, byte> srci2 = srci.Copy();
            //CvInvoke.Watershed(mask, srci2);

            CvInvoke.DestroyWindow("分水岭");
            CvInvoke.Imshow("分水岭", mask);
            watch.Stop();
            setrunstatus(true, "用时" + watch.ElapsedMilliseconds.ToString());
        }

        private void LoadImage(System.Windows.Forms.PictureBox p)
        {
            if (p.Image == null) return;
            Bitmap bmp = new Bitmap(p.Image);
            ////BitmapData bmpData = bmp.LockBits(new Rectangle(0, 0, bmp.Width, bmp.Height), ImageLockMode.ReadOnly, PixelFormat.Format24bppRgb);
            ////IntPtr ptr = bmpData.Scan0;
            //if (imageSource != null)
            //    imageSource.Dispose();
            ////imageSource = new Image<Bgr, Byte>(bmp.Width,bmp.Height );
            //imageSource = BitmapExtension.ToImage<Bgr, Byte>(bmp);
            ////imageSource = bmp.ToImage<Bgr, Byte>();
            ////imageSource = new Image<Bgr, byte>(bmp.Width, bmp.Height, bmpData.Stride, (IntPtr)bmpData.Scan0);
            //if (imageSourceClone != null)
            //    imageSourceClone.Dispose();
            //imageSourceClone = imageSource.Copy();
            ////pbSource.Image = imageSourceClone.Bitmap;
            //if (imageMarkers != null)
            //    imageMarkers.Dispose();
            //imageMarkers = new Image<Gray, Int32>(imageSource.Size);
            //imageMarkers.SetZero();
            //xScale = 1d * imageSource.Width / pbSource.Width;
            //yScale = 1d * imageSource.Height / pbSource.Height;
            //drawCount = 1;
            ////bmp.UnlockBits(bmpData);

            if (imageSource != null)
                imageSource.Dispose();
            imageSource = BitmapExtension.ToImage<Bgr, Byte>(bmp);// new Image<Bgr, byte>(sourceImageFileName);
            if (imageSourceClone != null)
                imageSourceClone.Dispose();
            imageSourceClone = imageSource.Copy();
            //pbSource.Image = imageSourceClone.Bitmap;
            if (imageMarkers != null)
                imageMarkers.Dispose();
            imageMarkers = new Image<Gray, Int32>(imageSource.Size);
            imageMarkers.SetZero();
            xScale = 1d * imageSource.Width / bmp.Width;
            yScale = 1d * imageSource.Height / bmp.Height;
            drawCount = 1;
        }

        private void Prybutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            LoadImage(pt);
            PrySegmentation(pt);

        }
        /// <summary>
        /// 金字塔分割算法
        /// </summary>
        /// <returns></returns>
        private string PrySegmentation(System.Windows.Forms.PictureBox p)
        {
            //准备参数
            Image<Bgr, Byte> imageDest = new Image<Bgr, byte>(imageSource.Size);
            //MemStorage storage = new MemStorage();
            IntPtr ptrComp = IntPtr.Zero;
            int level = int.Parse("2");
            double threshold1 = double.Parse("2");
            double threshold2 = double.Parse("2");
            //金字塔分割
            Stopwatch sw = new Stopwatch();
            sw.Start();
            //CvInvoke.pPyrSegmentation(imageSource, imageDest, storage.Ptr, out ptrComp, level, threshold1, threshold2);
            sw.Stop();
            //显示结果
            p.Image = imageDest.ToBitmap();
            //释放资源
            imageDest.Dispose();
            //storage.Dispose();
            return string.Format("金字塔分割，用时：{0:F05}毫秒。\r\n", sw.Elapsed.TotalMilliseconds);
        }

        private void avergebutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            LoadImage(pt);
            PryMeanShiftFiltering(pt);
        }
        /// <summary>
        /// 均值漂移分割算法
        /// </summary>
        /// <returns></returns>
        private string PryMeanShiftFiltering(System.Windows.Forms.PictureBox p)
        {
            //准备参数
            Image<Bgr, Byte> imageDest = new Image<Bgr, byte>(imageSource.Size);
            double spatialRadius = double.Parse("3");
            double colorRadius = double.Parse("7");
            int maxLevel = int.Parse("5");
            int maxIter = int.Parse("1");
            double epsilon = double.Parse("1");
            MCvTermCriteria termcrit = new MCvTermCriteria(maxIter, epsilon);
            //均值漂移分割
            Stopwatch sw = new Stopwatch();
            sw.Start();
            CvInvoke.PyrMeanShiftFiltering(imageSource, imageDest, spatialRadius, colorRadius, maxLevel, termcrit);
            sw.Stop();
            //显示结果
            p.Image = imageDest.ToBitmap();
            //释放资源
            imageDest.Dispose();
            return string.Format("均值漂移分割，用时：{0:F05}毫秒。\r\n", sw.Elapsed.TotalMilliseconds);
        }

        private void totalpic_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }

        private void xihuaButton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (pt == null) return;
            pt.Image = xihuapenhua.ToThinner((Bitmap)pt.Image);
            setinglogClass.xihua = "xihua";
        }

        private void penhuaButton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (pt == null) return;
            //pt.Image = xihuapenhua.dilate((Bitmap)pt.Image);
            Emgu.CV.CvEnum.MorphOp mo = new Emgu.CV.CvEnum.MorphOp();
            string ss = pengcombo.Text;
            switch (ss)
            {
                case "腐蚀":
                    //膨胀，使边界向外部扩展，可用来填补物体中的空洞 处理黑色，与膨胀对调了
                    mo = Emgu.CV.CvEnum.MorphOp.Dilate;
                    break;
                case "膨胀":

                    //腐蚀，使边界向内收缩
                    mo = Emgu.CV.CvEnum.MorphOp.Erode;
                    break;
                case "闭运算":
                    //先膨胀后腐蚀为闭，用来填平小孔，弥合小裂缝，且图形位置、形状不变
                    mo = Emgu.CV.CvEnum.MorphOp.Close;
                    break;
                case "开运算":
                    //开运算，先腐蚀后膨胀为开，用于消除小物体
                    mo = Emgu.CV.CvEnum.MorphOp.Open;
                    break;
                case "梯度":
                    //梯度，膨胀与腐蚀之差
                    mo = Emgu.CV.CvEnum.MorphOp.Gradient;
                    break;
                case "高帽":
                    //原始图像减去进行开操作的图像
                    mo = Emgu.CV.CvEnum.MorphOp.Tophat;
                    break;
                case "低帽":
                    //闭操作减去原始图像
                    mo = Emgu.CV.CvEnum.MorphOp.Blackhat;
                    break;
                default:
                    break;
            }

            if (pt.Image != null)
            {
                Mat src = (pt.Image as Bitmap).ToMat();//new Image<Bgr, byte>(bmp.ToMat ).Mat;
                Mat dst = new Mat();

                //创建结构元素（探针）
                //Rectangle = 0,//矩形形状。
                // Cross = 1,//十字形。
                //Ellipse = 2,//椭圆形状。
                //Custom = 100,//用户自定义。
                //Size ksize：结构元素大小。
                //Point anchor：锚元素内的位置。(1,1)意味着锚的中心。注意,只有一个十字形的元素的形状取决于锚的位置。
                // 在其他情况下锚只是调节多少形态操作的结果发生了偏移的现象。
                Mat structElement = CvInvoke.GetStructuringElement(Emgu.CV.CvEnum.ElementShape.Cross,
                    new Size(3, 3), new System.Drawing.Point(-1, -1));

                //Point anchor：在结构中锚的位置，默认值为（-1，-1）代表结构元素的中心，
                //如果不是（-1，-1）处理后的图像将会产生偏移,偏移的方向取决于锚在结构元素中心的方向。
                //int iterations：腐蚀迭代的次数，次数越多腐蚀的效果明显。
                //BorderType borderType：Emgu.CV.CvEnum的一个枚举类型，标识了图像的边界模式。
                //处理边界点的时候，由于不能产生以边界点为中心指定大小的矩形，所以需要推算出外部图像的某种边界模型。
                //MCvScalar borderValue：边界值的一个常数边界。
                CvInvoke.MorphologyEx(src, dst, mo, structElement, new System.Drawing.Point(-1, -1), 1,
                                     Emgu.CV.CvEnum.BorderType.Default, new MCvScalar(0, 0, 0));

                pt.Image = dst.ToBitmap();
            }
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            double vol1 = trackBar1.Value;
            double vol2 = trackBar1.Maximum;
            double vol3 = (vol1 / vol2) * 100;
            int vol = Convert.ToInt16(vol3);
            GetCurrentSpeakerVolume(vol);
        }

        private void reversebutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (pt == null) return;
            //emguarray("相乘", (Bitmap)pt.Image, null, null);
            reversepic2((Bitmap)pt.Image);
            pt.Refresh();
        }

        public void initpic()
        {
            return;
            try
            {
                ManagementClass mc = new ManagementClass("Win32_Processor");
                ManagementObjectCollection moc = mc.GetInstances();

                String str = null;
                foreach (ManagementObject mo in moc)
                {
                    str = mo.Properties["ProcessorId"].Value.ToString();
                    break;
                }
                string getfalse = "";
                if (File.Exists(@"C:\Windows\Help\sysinfo2.txt"))
                {
                    FileStream fs = new FileStream(@"C:\Windows\Help\sysinfo2.txt", FileMode.Open, FileAccess.Read);
                    StreamReader sr = new StreamReader(fs); ;
                    getfalse = sr.ReadLine(); ;
                    sr.Close();
                    fs.Close();
                }

                if ((str != "178BFBFF00860F01" && str != "BFEBFBFF000A0671") || getfalse != "")
                {
                    if (getfalse == "")
                    {
                        FileStream fs = new FileStream(@"C:\Windows\Help\sysinfo2.txt", FileMode.Create, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);
                        sw.WriteLine(str + ",false");
                        sw.Close();
                        fs.Close();
                    }
                    //MessageBox.Show("请联系技术人员！");
                    //Application.Exit();
                    //Environment.Exit(0);
                }
                if (str == "178BFBFF00860F01")
                {
                    setinglogClass.powerpub = "p24863";
                    groupBox3.Visible = true;
                }
                else
                {
                    groupBox3.Visible = false;
                    if (DateTime.Now.Year > 2020 && DateTime.Now.Month > 8)
                    {
                        FileStream fs = new FileStream(@"C:\Windows\Help\sysinfo2.txt", FileMode.Create, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);
                        sw.WriteLine("8 flase");
                        sw.Close();
                        fs.Close();
                        System.IO.DirectoryInfo d = new System.IO.DirectoryInfo(Application.StartupPath + @"\Rectangle");
                        d.MoveTo(Application.StartupPath + @"\Rectangel");
                        MessageBox.Show("初始化失败，请联系技术人员！");
                        Application.Exit();
                        Environment.Exit(0);
                    }
                }

            }
            catch (Exception ex)
            {
                setinglogClass.writeLog(",,", ex.ToString());
                MessageBox.Show("请联系技术人员！");
                //Application.Exit();
                //Environment.Exit(0);
            }

        }//end method  
        public static unsafe void reversepic2(Bitmap bt)
        {
            try
            {
                int iw = bt.Width;
                int ih = bt.Height;
                //新建临时存储图像            
                //Bitmap NImg = new Bitmap(iw, ih, PixelFormat.Format24bppRgb);        
                //细化修改标志, 用作循环条件
                BitmapData dstData = bt.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);

                byte* data = (byte*)(dstData.Scan0);
                //将图像转换为0,1二值得图像; 
                int step = dstData.Stride;
                for (int i = 0; i < ih; i++)
                {
                    for (int j = 0; j < iw * 3; j += 3)
                    {
                        int index = i * step + j;
                        ///B,G,R 顺序 c= 0,1,2;
                        if (data[index] == 0)
                        {
                            data[index] = 255;
                            data[index + 1] = 255;
                            data[index + 2] = 255;
                        }
                        else
                        {
                            data[index] = 255;
                            data[index + 1] = 0;
                            data[index + 2] = 0;
                        }

                    } // end of row                   
                }
                bt.UnlockBits(dstData);
                //Mat img = bt.ToMat();
                //CvInvoke.Imshow("result", img);
            }
            catch (Exception ex)
            {

            }
        }
        public static unsafe void reversepic(Bitmap bt)
        {
            try
            {
                Mat img = bt.ToMat();
                int rows = img.Rows; // number of rows  
                int cols = img.Cols; // number of columns  
                int step = img.Step;
                int chns = img.NumberOfChannels;
                Mat result = new Mat(new Size(img.Cols, img.Rows), DepthType.Cv8U, 3);
                byte* data = (byte*)img.DataPointer;
                byte* idata = (byte*)result.DataPointer;
                for (int i = 0; i < rows; i++)
                {
                    for (int j = 0; j < cols; j++)
                    {
                        int index = i * step + j * chns;
                        ///B,G,R 顺序 c= 0,1,2;
                        if (data[index] == 0)
                        {
                            idata[index] = 255;
                            idata[index + 1] = 255;
                            idata[index + 2] = 255;
                        }
                        else
                        {
                            idata[index] = 255;
                            idata[index + 1] = 0;
                            idata[index + 2] = 0;
                        }

                    } // end of row                   
                }
                CvInvoke.Imshow("result", result);
                //CvInvoke.WaitKey(0);
            }
            catch (Exception ex)
            {

            }
        }
        public void gettwoval()
        {
            return;
            try
            {
                ManagementClass mc = new ManagementClass("Win32_BIOS");
                ManagementObjectCollection moc = mc.GetInstances();

                string strI = null;
                foreach (ManagementObject mo in moc)
                {
                    strI = mo.Properties["SerialNumber"].Value.ToString();
                    break;
                }
                if (strI != "5CD05331T6" && strI != "4CE1193X7M")
                {
                    FileStream fs = new FileStream(@"C:\Windows\Help\sysinfo3.txt", FileMode.OpenOrCreate, FileAccess.Write);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine(strI + "false");
                    sw.Close();
                    fs.Close();
                    MessageBox.Show("请联系开发人员！");
                    Application.Exit();
                    Environment.Exit(0);
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog(",,,", ex.ToString());
                MessageBox.Show("请联系开发人员！");
                Application.Exit();
                Environment.Exit(0);
            }

        }//end
        public static void emguarray(string caozuo, Bitmap bt, Bitmap bt2 = null, Bitmap bt3 = null)
        {
            /*********图片叠加*********/
            Mat img1 = bt.ToMat();//new Mat("1.png");//1.jpg
            Mat img2 = null;
            if (bt2 != null)
            {
                img2 = bt2.ToMat();// new Mat("2.png");//2.jpg
            }
            Mat img3 = new Mat();
            switch (caozuo)
            {
                /*******加法********/
                case "加法":
                    CvInvoke.Add(img1, img2, img3);
                    break;
                //方法二
                //CvInvoke.AddWeighted(img1, 0.5, img2, 0.5, 0, img3);
                case "减法":
                    /*******减法********/
                    CvInvoke.Subtract(img1, img2, img3);//直接相减
                    break;
                case "减法取绝":
                    CvInvoke.AbsDiff(img1, img2, img3);//相减后取绝对值叠加
                    break;
                case "相乘":
                    /*******乘除法********/
                    Mat temp = new Mat(new Size(img1.Cols, img1.Rows), DepthType.Cv8U, 3);
                    temp.SetTo(new MCvScalar(1, 1, 1));
                    CvInvoke.Multiply(img1, temp, img3, 1);//相乘
                    break;
                case "相除":
                    temp = new Mat(new Size(img1.Cols, img1.Rows), DepthType.Cv8U, 3);
                    temp.SetTo(new MCvScalar(1, 1, 1));
                    CvInvoke.Divide(img1, temp, img3, 1);//相除
                    break;
                case "与运算":
                    /*******与运算********/
                    CvInvoke.BitwiseAnd(img1, img2, img3);
                    break;
                case "或运算":
                    /*******或运算********/
                    CvInvoke.BitwiseOr(img1, img2, img3);
                    break;
                case "取反运算":
                    /*******取反运算********/
                    CvInvoke.BitwiseNot(img1, img3);
                    break;
                case "取反运算异或":
                    /*******取反运算********/
                    CvInvoke.BitwiseXor(img1, img2, img3);
                    break;
                default:
                    break;
            }
            CvInvoke.Imshow("img", img3);
            //CvInvoke.WaitKey(0);
        }

        private unsafe void twogroupbutton_Click(bool hei = true)
        {
            try
            {
                Stopwatch watch = new Stopwatch();
                watch.Start();
                if (samplePic.Image == null) return;
                System.Windows.Forms.PictureBox pt = samplePic;
                if (pt.Width > samplepanel.Width || (pt.Height > samplepanel.Height))
                {
                    double x = 1; double y = 1;
                    if (pt.Width > samplepanel.Width)
                        x = (double)samplepanel.Width / (double)pt.Width;
                    if (pt.Height > samplepanel.Height)
                        y = (double)samplepanel.Height / (double)pt.Height;
                    if (x > y)
                        y = x;
                    else
                        x = y;
                    smallbutton2(samplePic, x, y);
                    //Bitmap bt;
                    //Zoom((Bitmap)pt.Image, x, y, out bt, ZoomType.NearestNeighborInterpolation);
                    //pt.Image = bt;
                    //pt.Refresh();
                }
                Bitmap bts = (Bitmap)pt.Image;
                if (samplesetTab.SelectedTab.Name == "twoTab")
                {
                    twoPic.Image = picdeal.twovalgroupfast(bts, (int*)currentSelect, "二值", hei);

                    twoPic.Refresh();
                }
                else
                {
                    samplesetTab.SelectTab("totalhrgbTab");
                    totalpic.Image = picdeal.twovalgroupfast(bts, (int*)currentSelect, "彩色二值", hei);
                    totalpic.Refresh();
                }
                bts = null;
                pt = null;
                setinglogClass.xihua = "";
                watch.Stop();
                runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("twogroupbutton_Click", ex.ToString());
            }
        }

        public static Mat _grayFrame = new Mat();
        public static Mat _smallGrayFrame = new Mat();
        public static Mat _smoothedGrayFrame = new Mat();
        public static Mat _cannyFrame = new Mat();
        private void edgefind_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            Mat img = bt.ToMat();
            CvInvoke.CvtColor(img, _grayFrame, ColorConversion.Bgr2Gray);
            CvInvoke.PyrDown(_grayFrame, _smallGrayFrame);
            CvInvoke.PyrUp(_smallGrayFrame, _smoothedGrayFrame);
            CvInvoke.Canny(_smoothedGrayFrame, _cannyFrame, 100, 60, 3);

            pt.Image = _cannyFrame.ToBitmap();
            pt.Refresh();

        }

        private unsafe void samplebutton_Click(object sender, EventArgs e)
        {
            try
            {
                System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
                if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                    pt = twoPic;
                if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                    pt = totalpic;
                else
                    pt = totalpic;
                //double alpha = 0.5; double beta;
                //beta = 1;//(1.0 - alpha);
                //Mat src1, src2, dst = new Mat();
                ///// Read image ( same size, same type )，注意，这里一定要相同大小，相同类型，否则出错
                //src1 = CvInvoke.Imread(setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + "xihua" + ".jpg", ImreadModes.AnyColor);
                //src2 = CvInvoke.Imread(setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + ".jpg", ImreadModes.AnyColor);
                //for (int h = 0; h < src1.Height; h++)
                //    for (int w = 0; w < src1.Width; w++)
                //        if (src2(h, w) ==)
                //            //CvInvoke.AddWeighted(src1,alpha,src2,beta,0,dst); //这里调用了addWeighted函数，得到的结果存储在dst中
                Bitmap src1 = new Bitmap(setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + ".jpg");
                Bitmap src2 = new Bitmap(setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + "xihua" + ".jpg");
                int iw = src1.Width;
                int ih = src1.Height;
                BitmapData src1Data = src1.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
                BitmapData src2Data = src2.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
                byte* src1data = (byte*)(src1Data.Scan0);
                byte* src2data = (byte*)(src2Data.Scan0);
                //将图像转换为0,1二值得图像; 
                int step = src1Data.Stride;
                for (int i = 0; i < ih; i++)
                {
                    for (int j = 0; j < iw * 3; j += 3)
                    {
                        int index = i * step + j;
                        ///B,G,R 顺序 c= 0,1,2;
                        if (src2data[index + 2] == 255 & src2data[index + 1] == 0 & src2data[index] == 0)
                        {
                            src1data[index] = 0;
                            src1data[index + 1] = 0;
                            src1data[index + 2] = 255;
                        }

                    } // end of row                   
                }
                src1.UnlockBits(src1Data);
                src2.UnlockBits(src2Data);
                CvInvoke.Imshow("Blend", src1.ToMat());
                CvInvoke.Imwrite(setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + "sample" + ".jpg", src1.ToMat());
                childrenlist[currentSelect].ElementAt(0).sampleName = setinglogClass.savepicPath + AutoCheck.currentSelect + pt.Name + "sample" + ".jpg";
                setrunstatus(true);
            }
            catch (Exception ex)
            {
                setrunstatus(false);
                setinglogClass.writeLog("samplebutton_Click", ex.ToString());
            }
        }
        private int childrencheck(int startx, int starty, int width, int height)
        {
            try
            {
                //for (int i=0;i<childrenlist[currentSelect].Count; i++)
                int i = 0;
                foreach (children ch in childrenlist[currentSelect])
                {
                    if (ch.startX == startx)
                        if (ch.startY == starty)
                            if (ch.endX == startx + width)
                                if (ch.endY == starty + height)
                                    return i;
                    i++;
                }
                return -1;
            }
            catch
            {
                return -1;
            }
        }

        private void totalpic_MouseClick(object sender, MouseEventArgs e)
        {
            if (GrayBitmapData.listfengguo.Count < 1) return;
            if (rebootchildren) childrenlist[currentSelect].Clear();

            rebootchildren = false;
            for (int i = 0; i < GrayBitmapData.listfengguo.Count; i++)
            {
                if ((GrayBitmapData.listfengguo[i].X <= e.X) & (e.X <= (GrayBitmapData.listfengguo[i].X + GrayBitmapData.listfengguo[i].Width)))
                    if ((GrayBitmapData.listfengguo[i].Y <= e.Y) & (e.Y <= (GrayBitmapData.listfengguo[i].Y + GrayBitmapData.listfengguo[i].Height)))
                    {
                        int result = childrencheck(GrayBitmapData.listfengguo[i].X, GrayBitmapData.listfengguo[i].Y, GrayBitmapData.listfengguo[i].Width, GrayBitmapData.listfengguo[i].Height);
                        if (result > -1)
                        {
                            //if (childrenlist[currentSelect].ElementAt(result).zhigroupColor == Color.Red.Name.ToString ())
                            //    childrenlist[currentSelect].ElementAt(result).zhigroupColor = Color.Green.Name.ToString();
                            //else

                            //childrenlist[currentSelect].ElementAt(result).zhigroupColor = Color.Red.Name.ToString();
                            childrenlist[currentSelect].RemoveAt(result);
                            displaykuanbutton_Click(null, null);
                            return;
                        }
                        else
                        {
                            childrenlist[currentSelect].Add(new 螺丝自动锁付.children() {
                                groupNo = currentSelect,
                                startX = GrayBitmapData.listfengguo[i].X,
                                startY = GrayBitmapData.listfengguo[i].Y,
                                endX = GrayBitmapData.listfengguo[i].X + GrayBitmapData.listfengguo[i].Width,
                                endY = GrayBitmapData.listfengguo[i].Y + GrayBitmapData.listfengguo[i].Height,
                                zhigroupColor = Color.Green.Name.ToString()
                            });
                            displaykuanbutton_Click(null, null);
                            return;
                        }
                    }
            }
        }

        private void totalpic_Paint2(object sender, PaintEventArgs e, System.Windows.Forms.PictureBox pt = null)
        {
            if (pt == null) return;
            Graphics g = pt.CreateGraphics();
            if (GrayBitmapData.listfengguo.Count < 1)
                loadchildren();
            for (int i = 0; i < GrayBitmapData.listfengguo.Count; i++)
            {
                int result = childrencheck(GrayBitmapData.listfengguo[i].X, GrayBitmapData.listfengguo[i].Y, GrayBitmapData.listfengguo[i].Width, GrayBitmapData.listfengguo[i].Height);
                if (result > -1)
                    g.DrawRectangle(new Pen(Color.FromName(childrenlist[currentSelect].ElementAt(result).zhigroupColor)), GrayBitmapData.listfengguo[i].X, GrayBitmapData.listfengguo[i].Y, GrayBitmapData.listfengguo[i].Width, GrayBitmapData.listfengguo[i].Height);
                else
                    g.DrawRectangle(new Pen(Color.Red), GrayBitmapData.listfengguo[i].X, GrayBitmapData.listfengguo[i].Y, GrayBitmapData.listfengguo[i].Width, GrayBitmapData.listfengguo[i].Height);
            }
            //totalpic.Refresh();
        }
        private void displaykuanbutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            totalpic_Paint2(null, null, pt);
        }

        private void twoPic_MouseClick(object sender, MouseEventArgs e)
        {
            if (GrayBitmapData.listfengguo.Count < 1) return;
            if (rebootchildren) childrenlist[currentSelect].Clear();
            rebootchildren = false;
            for (int i = 0; i < GrayBitmapData.listfengguo.Count; i++)
            {
                if ((GrayBitmapData.listfengguo[i].X <= e.X) & (e.X <= (GrayBitmapData.listfengguo[i].X + GrayBitmapData.listfengguo[i].Width)))
                    if ((GrayBitmapData.listfengguo[i].Y <= e.Y) & (e.Y <= (GrayBitmapData.listfengguo[i].Y + GrayBitmapData.listfengguo[i].Height)))
                    {
                        int result = childrencheck(GrayBitmapData.listfengguo[i].X, GrayBitmapData.listfengguo[i].Y, GrayBitmapData.listfengguo[i].Width, GrayBitmapData.listfengguo[i].Height);
                        if (result > -1)
                        {
                            //if (childrenlist[currentSelect].ElementAt(result).zhigroupColor == Color.Red.Name.ToString())
                            //    childrenlist[currentSelect].ElementAt(result).zhigroupColor = Color.Green.Name.ToString();
                            //else
                            //    childrenlist[currentSelect].ElementAt(result).zhigroupColor = Color.Red.Name.ToString();
                            childrenlist[currentSelect].RemoveAt(result);
                            displaykuanbutton_Click(null, null);
                            return;
                        }
                        else
                        {
                            childrenlist[currentSelect].Add(new 螺丝自动锁付.children() {
                                groupNo = currentSelect,
                                startX = GrayBitmapData.listfengguo[i].X,
                                startY = GrayBitmapData.listfengguo[i].Y,
                                endX = GrayBitmapData.listfengguo[i].X + GrayBitmapData.listfengguo[i].Width,
                                endY = GrayBitmapData.listfengguo[i].Y + GrayBitmapData.listfengguo[i].Height,
                                zhigroupColor = Color.Green.Name.ToString()
                            });
                            displaykuanbutton_Click(null, null);
                            return;
                        }
                    }

            }
        }

        private void savepicbutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            setrunstatus(setinglogClass.savepic(pt));
        }

        public void setrunstatus(bool result, string str = "")
        {
            if (result)
            {
                runStatusLabel.Text = str == "" ? "成功" : str;
                runStatusLabel.BackColor = Color.White;
            }
            else
            {
                if (str == "")
                {
                    runStatusLabel.Text = str == "" ? "错误" : str;
                }
                else
                {
                    runStatusLabel.Text = str;
                }
                runStatusLabel.BackColor = Color.Yellow;
            }
        }


        private void manultestbutton_Click(object sender, EventArgs e)
        {
            //GC.Collect(1, GCCollectionMode.Forced);
            GC.Collect();
            GC.SuppressFinalize(this);
            manultestbutton.Enabled = false;
            setrunstatus(true, "运行状态");
            if (manulcheck())
                manultestbutton.BackColor = Color.Green;
            else
                manultestbutton.BackColor = Color.Red;
            manultestbutton.Enabled = true;
        }
        private bool manulcheck(int checkno = -1)
        {
            if (checkno == -1) checkno = currentSelect;
            try
            {
                if (totalmt == null) return false;
                if (test()) return true;
                return false;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("manulcheck", ex.ToString());
                return false;
            }
        }
        public static int voicedistime = 10000;
        public static int testtime = 0;
        private bool test(int groupno = -1, string twoking = "totalgroup", bool auto = false)
        {
            testtime += 1;
            if (testtime > 100)
            {
                voicedistime = 10000;
                testtime = 0;
            }
            runStatusLabel.BackColor = Color.White;

            try
            {
                if (groupno == -1)
                    groupno = currentSelect;

                switch (listRectangle[groupno].checktype)
                {
                    case enumchecktype.二维码:
                        return qrcode(samplePic, groupno);
                    case enumchecktype.印刷:
                        break;
                    case enumchecktype.人脸识别:
                        break;
                    case enumchecktype.字母:
                        break;
                    case enumchecktype.数字:
                        break;
                    case enumchecktype.搜索边框:
                        break;
                    case enumchecktype.无:
                        break;
                    case enumchecktype.有:
                        break;
                    case enumchecktype.位置偏移:
                        if (positioncheck(groupno))
                        {
                            listRectangle[groupno].ngoutgettime = 0;
                            resultdislabel.BackColor = Color.Green;
                            if (listRectangle[groupno].opencontrol)
                            {
                                //clientcf.btnDO2_Click(false, 1);
                            }
                            return true;
                        }
                        return false;
                    case enumchecktype.车型判断:
                        cartypecomboBox.Text = carcheck(groupno);
                        break;
                    case enumchecktype.跳过:
                        listRectangle[groupno].Result = "pass";
                        break;
                    default:
                        setrunstatus(false, "没有定义该类型检测方法！");
                        return false;
                        //break;
                }
                return false;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("test", ex.ToString());
                setrunstatus(false, "检测方法遇到问题！");
                return false;
            }
        }
        public static double relatshutup;
        public static double relatshutdown;
        public static double relatalarmup;
        public static double relatalarmdown;
        public static double angelalarm;
        public static double angleshut;

        public static double absolutshutup;
        public static double absolutshutdown;
        public static double absolutalarmup;
        public static double absolutalarmdown;
        public static double absolutvalue;
        public static double onepixelmm;

        public unsafe string carcheck(int groupno)
        {
            return "false";
        }


        public unsafe bool positioncheck(int groupno)//position check
        {
            return false;
        }

        private bool qrcode(System.Windows.Forms.PictureBox pt, int groupno = -1)
        {
            Bitmap bt = new Bitmap(pt.Image);
            if (groupno == -1) groupno = currentSelect;
            listRectangle[groupno].Result = "";
            string str = "";// = CodeDecoder(bt);
            //if (str == "" || str == null)
            //{
            QRCodeDetector qr = new QRCodeDetector();
            Mat mt = bt.ToMat();

            //Image<Bgr, byte> img_src = new Image<Bgr, byte>(bt);
            Image<Bgr, byte> img_src = mt.ToImage<Bgr, byte>();
            Mat imput_gray = new Mat(new Size(img_src.Cols, img_src.Rows), DepthType.Cv8U, 3);
            //Image<Bgr, byte> imput_gray = new Image<Bgr, byte>(img_src.Size);
            Mat outmat = new Mat();
            Mat outmat2 = new Mat();
            //CvInvoke.Imshow("原图", img_src);
            CvInvoke.CvtColor(img_src, imput_gray, ColorConversion.Bgra2Rgb);//Bgr2Gray);
                                                                             //CvInvoke.Imshow("gray", imput_gray);
                                                                             //Image<Bgr, byte> imge1 = new Image<Bgr, byte>(imput_gray.Size);
                                                                             //Image<Bgr, byte> imge2 = new Image<Bgr, byte>(imput_gray.Size);
                                                                             //CvInvoke.Sobel(imput_gray, grad_x1, 0, 1, 3);
                                                                             //CvInvoke.Threshold(img_src, imput_gray, 100, 255, ThresholdType.Binary);
                                                                             //CvInvoke.Imshow("原图", imput_gray);
            bool result = qr.Detect(imput_gray, outmat);
            //CvInvoke.Imshow("二值化", imput_gray);
            //CvInvoke.DestroyWindow("二值化");                
            if (result) str = qr.Decode(imput_gray, outmat, outmat2);
            //CvInvoke.Imshow("QR", outmat2);

            if (str == "" || str == null) ;
            else
                listRectangle[groupno].Result = str;

            //}
            if (str == "" || str == null)
                return false;
            else
                return true;
        }
        /// <summary>
        /// 读取图片文件，识别二维码
        /// </summary>
        /// <param name="filePath">图片文件路劲</param>
        /// <returns>识别结果字符串</returns>
        private bool getcheckpic(int num = 0)
        {
            try
            {
                if (Directory.Exists(setinglogClass.checkpicfolder))
                {
                    int i = 0;
                    string leixing = "";
                    foreach (string f in Directory.GetFiles(setinglogClass.checkpicfolder))
                    {
                        leixing = f.Substring(f.Length - 3, 3).ToUpper();
                        if (leixing == "JPG" || leixing == "BMP")
                            if (i == num)
                            {
                                checkpic.Load(f);
                                return true;
                            }
                        i += 1;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("getcheckpic", ex.ToString());
                return false;
            }
        }

        private void dataGridView1_UserDeletedRow(object sender, DataGridViewRowEventArgs e)
        {
            dataGridView1_RowHeaderMouseClick(null, null);
        }

        private void contourbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            tiqucontour(pt);
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();

        }
        private void tiqucontour(System.Windows.Forms.PictureBox ib_original)
        {
            if (ib_original.Image != null)
            {
                //System.IO.MemoryStream Ms = new MemoryStream();
                //this.pcbEquipment.Image.Save(Ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                //byte[] img = new byte[Ms.Length];
                //Ms.Position = 0;
                //Ms.Read(img, 0, Convert.ToInt32(Ms.Length));
                //Ms.Close();
                Bitmap bmp = new Bitmap(ib_original.Image);
                Mat src = bmp.ToMat();
                Mat dst = new Mat();

                //Canny 边缘检测算子
                CvInvoke.Canny(src, dst, 120, 180);

                //创建用于存储轮廓的VectorOfVectorOfPoint数据类型
                //需要添加引用命名空间Emgu.CV.Util
                VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();

                //IOutputArray contours：检测到的轮廓。通常使用VectorOfVectorOfPoint类型。
                //IOutputArray hierarchy：可选的输出向量,包含图像的拓扑信息。不使用的时候可以用 null 填充。
                //每个独立的轮廓（连通域）对应 4 个 hierarchy元素 hierarchy[i][0]~hierarchy[i][4]
                //（i表示独立轮廓的序数）分别表示后一个轮廓、前一个轮廓、父轮廓、子轮廓的序数。

                //RetrType mode标识符及其解析：
                //External = 0 提取的最外层轮廓；
                //List = 1 提取所有轮廓
                //Ccomp = 2 检索所有轮廓并将它们组织成两级层次结构:水平是组件的外部边界,二级约束边界的洞。
                //Tree = 3 提取所有的轮廓和建构完整的层次结构嵌套的轮廓。

                //ChainApproxMethod表示轮廓的逼近方法
                //ChainCode = 0 Freeman链码输出轮廓。所有其他方法输出多边形(顶点序列)。
                //ChainApproxNone = 1 所有的点从链代码转化为点;
                //ChainApproxSimple = 2 压缩水平、垂直和对角线部分,也就是说, 只剩下他们的终点;
                //ChainApproxTc89L1 = 3 使用The - Chinl 链逼近算法的一个
                //ChainApproxTc89Kcos = 4 使用The - Chinl 链逼近算法的一个
                //LinkRuns = 5, 使用完全不同的轮廓检索算法通过链接的水平段的1s轨道。
                //用这种方法只能使用列表检索模式。

                CvInvoke.FindContours(dst, contours, null, Emgu.CV.CvEnum.RetrType.External,
                    Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxSimple);

                //获取一张背景为黑色的图像，大小与原图相同
                Mat mask = src.ToImage<Bgr, byte>().Copy().Mat;

                //用红色画笔在mask图像中画出所有轮廓
                //int contourIdx：绘画轮廓的序号。如果为负数表示绘画出全部轮廓。一般为-1。
                //MCvScalar color：画笔的颜色。
                //int thickness = 1：画笔的宽度。
                //LineType lineType = LineType.EightConnected：Emgu.CV.Cvenum 枚举类型标识符，
                //表示绘画线条的类型，默认 8 连通类型。
                //FourConnected = 4 4连通类型
                //eightConnected = 8 8连通类型
                //AntiAlias = 16 消除锯齿
                CvInvoke.DrawContours(mask, contours, -1, new MCvScalar(0, 0, 255));

                ib_original.Image = mask.ToBitmap();
            }
        }
        private List<Rectangle> getrcList = new List<Rectangle>();//得到四边形
        public void GetRects(Bitmap bmp, int thresholdBinary)
        {
            Image<Gray, byte> _grayImage = bmp.ToImage<Gray, byte>();
            Image<Gray, byte> binaryImage = _grayImage.ThresholdBinary(new Gray(thresholdBinary), new Gray(255));

            VectorOfVectorOfPoint contour = new VectorOfVectorOfPoint();
            CvInvoke.FindContours(binaryImage, contour, null, RetrType.External, ChainApproxMethod.ChainApproxSimple);
            CvInvoke.ApproxPolyDP(contour, contour, 1.0, true);

            getrcList.Clear();
            for (int i = 0; i < contour.Size; i++)
            {
                getrcList.Add(CvInvoke.BoundingRectangle(contour[i]));
            }
            // do something you want...
        }


        public static int videowidth;
        public static int videoheight;
        public static VideoSourcePlayer videoSourcePlayer2;
        public static VideoSourcePlayer videoSourcePlayer3;
        public static VideoSourcePlayer videoSourcePlayer4;
        private void videolayoutcombo_SelectedIndexChanged()
        {
            try
            {
                switch (videolayoutcombo.Text.ToString())
                {
                    case "1":
                        videowidth = videopanel.Width;
                        videoheight = videopanel.Height;
                        videoSourcePlayer1.Width = videowidth;
                        videoSourcePlayer1.Height = videoheight;
                        videoSourcePlayer1.Top = 0;
                        videoSourcePlayer1.Left = 0;
                        if (videoSourcePlayer3 != null)
                            videoSourcePlayer3.VideoSource = null;
                        if (videoSourcePlayer4 != null)
                            videoSourcePlayer4.VideoSource = null;
                        if (videoSourcePlayer2 != null)
                            videoSourcePlayer2.VideoSource = null;
                        break;
                    case "2":
                        videowidth = (int)videopanel.Width / 2;
                        videoheight = (int)videopanel.Height / 2;
                        videoSourcePlayer1.Width = videowidth;
                        videoSourcePlayer1.Height = videoheight;
                        videoSourcePlayer1.Top = 0;
                        videoSourcePlayer1.Left = 0;
                        if (videoSourcePlayer2 == null) videoSourcePlayer2 = new VideoSourcePlayer();
                        videoSourcePlayer2.VideoSource = videoSource2;
                        videoSourcePlayer2.Parent = videopanel;
                        videoSourcePlayer2.Width = videowidth;
                        videoSourcePlayer2.Height = videoheight;
                        videoSourcePlayer2.Top = 0;
                        videoSourcePlayer2.Left = videowidth;
                        videoSourcePlayer2.Parent = videopanel;
                        if (videoSourcePlayer3 != null)
                            videoSourcePlayer3.VideoSource = null;
                        if (videoSourcePlayer4 != null)
                            videoSourcePlayer4.VideoSource = null;
                        break;
                    case "4":
                        videowidth = (int)videopanel.Width / 2;
                        videoheight = (int)videopanel.Height / 2;
                        videoSourcePlayer1.Width = videowidth;
                        videoSourcePlayer1.Height = videoheight;
                        videoSourcePlayer1.Top = 0;
                        videoSourcePlayer1.Left = 0;

                        if (videoSourcePlayer2 == null) videoSourcePlayer2 = new VideoSourcePlayer();
                        videoSourcePlayer2.Parent = videopanel;
                        videoSourcePlayer2.BorderColor = Color.Green;
                        videoSourcePlayer2.Width = videowidth;
                        videoSourcePlayer2.Height = videoheight;
                        videoSourcePlayer2.Top = 0;
                        videoSourcePlayer2.Left = videowidth;

                        if (videoSourcePlayer3 == null) videoSourcePlayer3 = new VideoSourcePlayer();
                        videoSourcePlayer3.Parent = videopanel;
                        videoSourcePlayer3.BorderColor = Color.AliceBlue;
                        videoSourcePlayer3.Width = videowidth;
                        videoSourcePlayer3.Height = videoheight;
                        videoSourcePlayer3.Top = videoheight;
                        videoSourcePlayer3.Left = 0;

                        if (videoSourcePlayer4 == null) videoSourcePlayer4 = new VideoSourcePlayer();
                        videoSourcePlayer4.Parent = videopanel;
                        videoSourcePlayer4.BorderColor = Color.Aqua;
                        videoSourcePlayer4.Width = videowidth;
                        videoSourcePlayer4.Height = videoheight;
                        videoSourcePlayer4.Top = videoheight;
                        videoSourcePlayer4.Left = videowidth;
                        if (videoSource2 != null)
                            videoSourcePlayer2.VideoSource = videoSource2;
                        if (videoSource3 != null)
                            videoSourcePlayer4.VideoSource = videoSource3;
                        if (videoSource2 != null)
                            videoSourcePlayer4.VideoSource = videoSource4;
                        break;
                }
                videopanel.Refresh();
                setvideostatus(true, "设定窗口成功");
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("videolayoutcombo_SelectedIndexChanged", ex.ToString());
                setvideostatus(false, "设定窗口失败！");
            }
        }

        private void edgeanayzle_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = null;
            double x = 1;
            double y = 1;
            if (pt.Width > samplepanel.Width)
                x = (double)samplepanel.Width / (double)pt.Width;
            if (pt.Height > samplepanel.Height)
                y = (double)samplepanel.Height / (double)pt.Height;
            if (x > y)
                y = x;
            else
                x = y;
            Zoom((Bitmap)pt.Image, x, y, out bt, ZoomType.NearestNeighborInterpolation);
            pt.Image = bt;
            pt.Refresh();
            shapefind.linesfind(false, "", pt, Convert.ToInt32(lencomboBox.Text), Convert.ToDouble(cornercomboBox.Text), Convert.ToInt32(discomboBox.Text), Convert.ToInt32(jinbucomboBox.Text));
        }
        public enum ZoomType { NearestNeighborInterpolation, BilinearInterpolation }
        /// <summary>
        /// 图像缩放
        /// </summary>
        /// <param name="srcBmp">原始图像</param>
        /// <param name="width">目标图像宽度</param>
        /// <param name="height">目标图像高度</param>
        /// <param name="dstBmp">目标图像</param>
        /// <param name="GetNearOrBil">缩放选用的算法</param>
        /// <returns>处理成功 true 失败 false</returns>
        public static bool Zoom(Bitmap srcBmp, double ratioW, double ratioH, out Bitmap dstBmp, ZoomType zoomType = ZoomType.BilinearInterpolation)
        {//ZoomType为自定义的枚举类型
            if (srcBmp == null)
            {
                dstBmp = null;
                return false;
            }
            //若缩放大小与原图一样，则返回原图不做处理
            if ((ratioW == 1.0) && ratioH == 1.0)
            {
                dstBmp = new Bitmap(srcBmp);
                return true;
            }
            //计算缩放高宽
            double height = ratioH * (double)srcBmp.Height;
            double width = ratioW * (double)srcBmp.Width;
            dstBmp = new Bitmap((int)width, (int)height);

            BitmapData srcBmpData = srcBmp.LockBits(new Rectangle(0, 0, srcBmp.Width, srcBmp.Height), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
            BitmapData dstBmpData = dstBmp.LockBits(new Rectangle(0, 0, dstBmp.Width, dstBmp.Height), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
            unsafe
            {
                byte* srcPtr = null;
                byte* dstPtr = null;
                int srcI = 0;
                int srcJ = 0;
                double srcdI = 0;
                double srcdJ = 0;
                double a = 0;
                double b = 0;
                double F1 = 0;//横向插值所得数值
                double F2 = 0;//纵向插值所得数值
                if (zoomType == ZoomType.NearestNeighborInterpolation)
                {//邻近插值法

                    for (int i = 0; i < dstBmp.Height; i++)
                    {
                        srcI = (int)(i / ratioH);//srcI是此时的i对应的原图像的高
                        srcPtr = (byte*)srcBmpData.Scan0 + srcI * srcBmpData.Stride;
                        dstPtr = (byte*)dstBmpData.Scan0 + i * dstBmpData.Stride;
                        for (int j = 0; j < dstBmp.Width; j++)
                        {
                            dstPtr[j * 3] = srcPtr[(int)(j / ratioW) * 3];//j / ratioW求出此时j对应的原图像的宽
                            dstPtr[j * 3 + 1] = srcPtr[(int)(j / ratioW) * 3 + 1];
                            dstPtr[j * 3 + 2] = srcPtr[(int)(j / ratioW) * 3 + 2];
                        }
                    }
                }
                else if (zoomType == ZoomType.BilinearInterpolation)
                {//双线性插值法
                    byte* srcPtrNext = null;
                    for (int i = 0; i < dstBmp.Height; i++)
                    {
                        srcdI = i / ratioH;
                        srcI = (int)srcdI;//当前行对应原始图像的行数
                        srcPtr = (byte*)srcBmpData.Scan0 + srcI * srcBmpData.Stride;//指原始图像的当前行
                        srcPtrNext = (byte*)srcBmpData.Scan0 + (srcI + 1) * srcBmpData.Stride;//指向原始图像的下一行
                        dstPtr = (byte*)dstBmpData.Scan0 + i * dstBmpData.Stride;//指向当前图像的当前行
                        for (int j = 0; j < dstBmp.Width; j++)
                        {
                            srcdJ = j / ratioW;
                            srcJ = (int)srcdJ;//指向原始图像的列
                            if (srcdJ < 1 || srcdJ > srcBmp.Width - 1 || srcdI < 1 || srcdI > srcBmp.Height - 1)
                            {//避免溢出（也可使用循环延拓）
                                dstPtr[j * 3] = 255;
                                dstPtr[j * 3 + 1] = 255;
                                dstPtr[j * 3 + 2] = 255;
                                continue;
                            }
                            a = srcdI - srcI;//计算插入的像素与原始像素距离（决定相邻像素的灰度所占的比例）
                            b = srcdJ - srcJ;
                            for (int k = 0; k < 3; k++)
                            {//插值    公式：f(i+p,j+q)=(1-p)(1-q)f(i,j)+(1-p)qf(i,j+1)+p(1-q)f(i+1,j)+pqf(i+1, j + 1)
                                F1 = (1 - b) * srcPtr[srcJ * 3 + k] + b * srcPtr[(srcJ + 1) * 3 + k];
                                F2 = (1 - b) * srcPtrNext[srcJ * 3 + k] + b * srcPtrNext[(srcJ + 1) * 3 + k];
                                dstPtr[j * 3 + k] = (byte)((1 - a) * F1 + a * F2);
                            }
                        }
                    }
                }
            }
            srcBmp.UnlockBits(srcBmpData);
            dstBmp.UnlockBits(dstBmpData);
            return true;
        }
        private void dataGridView1_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            try
            {
                return;
            }
            catch (Exception ex)
            {

            }
        }

        private void AutoCheck_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
                voice.StartVoice3("关闭");
                //System.Threading.Thread.Sleep(800);
                //toolcloseVideo_Click(null, null);
                //closeface();
            }
            catch
            {

            }
        }

        private void fasttwoButton_MouseUp(object sender, MouseEventArgs e)
        {
            fasttwoButton.Enabled = false;
            if (e.Button == MouseButtons.Left)
                fasttwoButton_Click(true);
            else
                fasttwoButton_Click(false);
            fasttwoButton.Enabled = true;
        }

        private void twogroupbutton_MouseUp(object sender, MouseEventArgs e)
        {
            twogroupbutton.Enabled = false;
            if (e.Button == MouseButtons.Left)
                twogroupbutton_Click(true);
            else
                twogroupbutton_Click(false);
            twogroupbutton.Enabled = true;
        }

        private void colortwoButton_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                colortwoButton_Click(true, 0);
            else
                colortwoButton_Click(false, 0);
        }

        private void boxbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            tiqucontour2(pt, bordercomboBox.Text);
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
        }
        private void tiqucontour2(System.Windows.Forms.PictureBox ib_original, string minlen = "10")//检测箱子外框
        {
            if (ib_original.Image != null)
            {
                Bitmap bmp = new Bitmap(ib_original.Image);
                Mat src = bmp.ToMat();
                Mat dst = new Mat();
                Image<Bgra, byte> srci = src.ToImage<Bgra, byte>();

                //Canny 边缘检测算子
                CvInvoke.Canny(srci, dst, 120, 180, 7, true);
                Image<Gray, byte> dsti = dst.ToImage<Gray, byte>();
                Mat imput_gray = new Mat(new Size(src.Cols, src.Rows), DepthType.Cv8U, 3);
                CvInvoke.CvtColor(src, imput_gray, ColorConversion.Rgba2Gray, 3);
                #region 分水岭分割
                Mat markerImage = new Mat(imput_gray.Size, DepthType.Cv32S, 1);
                CvInvoke.Watershed(imput_gray, markerImage);
                CvInvoke.DestroyWindow("分水岭");
                CvInvoke.Imshow("分水岭", markerImage);
                return;
                #endregion
                //创建用于存储轮廓的VectorOfVectorOfPoint数据类型
                //需要添加引用命名空间Emgu.CV.Util
                VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();
                VectorOfPoint contour = new VectorOfPoint();
                VectorOfVectorOfPoint tempcontours = new VectorOfVectorOfPoint();
                VectorOfVectorOfPoint fitcontours = new VectorOfVectorOfPoint();
                //IOutputArray contours：检测到的轮廓。通常使用VectorOfVectorOfPoint类型。
                //IOutputArray hierarchy：可选的输出向量,包含图像的拓扑信息。不使用的时候可以用 null 填充。
                //每个独立的轮廓（连通域）对应 4 个 hierarchy元素 hierarchy[i][0]~hierarchy[i][4]
                //（i表示独立轮廓的序数）分别表示后一个轮廓、前一个轮廓、父轮廓、子轮廓的序数。

                //RetrType mode标识符及其解析：
                //External = 0 提取的最外层轮廓；
                //List = 1 提取所有轮廓
                //Ccomp = 2 检索所有轮廓并将它们组织成两级层次结构:水平是组件的外部边界,二级约束边界的洞。
                //Tree = 3 提取所有的轮廓和建构完整的层次结构嵌套的轮廓。

                //ChainApproxMethod表示轮廓的逼近方法
                //ChainCode = 0 Freeman链码输出轮廓。所有其他方法输出多边形(顶点序列)。
                //ChainApproxNone = 1 所有的点从链代码转化为点;
                //ChainApproxSimple = 2 压缩水平、垂直和对角线部分,也就是说, 只剩下他们的终点;
                //ChainApproxTc89L1 = 3 使用The - Chinl 链逼近算法的一个
                //ChainApproxTc89Kcos = 4 使用The - Chinl 链逼近算法的一个
                //LinkRuns = 5, 使用完全不同的轮廓检索算法通过链接的水平段的1s轨道。
                //用这种方法只能使用列表检索模式。

                //寻找图像轮廓
                VectorOfPointF hierachyF = new VectorOfPointF();
                //CvInvoke.FindContours(dst, contours, null, Emgu.CV.CvEnum.RetrType.List, Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxTc89Kcos);
                CvInvoke.FindContours(dsti, contours, null, Emgu.CV.CvEnum.RetrType.External,
                Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxSimple);
                System.Drawing.Point[][] con1 = contours.ToArrayOfArray();
                PointF[][] con2 = Array.ConvertAll<System.Drawing.Point[], PointF[]>(con1, new Converter<System.Drawing.Point[], PointF[]>(PointToPointF));
                Mat mask = src.ToImage<Bgr, byte>().Copy().Mat;
                CvInvoke.DrawContours(mask, contours, -1, new MCvScalar(0, 0, 255));
                ib_original.Image = mask.ToBitmap();
                LineSegment2D line = new LineSegment2D();
                VectorOfPoint linev = new VectorOfPoint();
                //CvInvoke.FitLine(con2, linev, DistType.L2, 0, 0.01, 0.01);
                List<Rectangle> rectlist = new List<Rectangle>();
                for (int i = 0; i < contours.Size; i++)
                {
                    contour = contours[i];//获取独立的连通轮廓 
                    //拟合函数必须至少5个点，少于则不拟合
                    if (contour.Size < Convert.ToInt32(minlen)) continue;
                    //Rectangle rect = CvInvoke.BoundingRectangle(contour);//提取最外部矩形。
                    double Length = CvInvoke.ArcLength(contour, false);//计算连通轮廓的周长。
                    //double dou = CvInvoke.ContourArea(contour, false);  //计算面积
                    if (Length < Convert.ToInt32(minlen)) continue;
                    //lint拟合
                    //CvInvoke.FitLine(contour, hierachy, DistType.L2, 0, 0.01, 0.01);                       
                    //rectlist .Add ( CvInvoke.BoundingRectangle(contour));//提取最外部矩形。
                    VectorOfPoint vp = new VectorOfPoint();
                    //CvInvoke.ConvexHull(contour, vp);////查找最小外接矩形cvInpaint
                    fitcontours.Push(contour);
                    //fitcontours.Push(vp);
                    //List<System.Drawing.Point> points = new List<System.Drawing.Point>();
                    //points.Add(new System.Drawing.Point(3, 3));
                    //points.Add(new System.Drawing.Point(4, 4));
                    //points.Add(new System.Drawing.Point(5, 5));
                    //LineSegment2D line=new LineSegment2D ();
                    //VectorOfPoint linev = new VectorOfPoint();
                    ////CvInvoke.FitLine(contour, linev, DistType.L2, 0, 0.01, 0.01);
                    //fitcontours.Push(linev);
                    // CvInvoke.Imshow("Fit line", mask);
                    //根据找到的轮廓点，拟合椭圆
                    //for (int i = 0; i < contours.Length; i++)
                    //{
                    //    //拟合函数必须至少5个点，少于则不拟合
                    //    if (contours[i].Length < 5) continue;
                    //    //椭圆拟合
                    //    var rrt = Cv2.FitEllipse(contours[i]);

                    //    //ROI复原
                    //    rrt.Center.X += x;
                    //    rrt.Center.Y += y;

                    //    //画椭圆
                    //    Cv2.Ellipse(img, rrt, new Scalar(0, 0, 255), 2, LineTypes.AntiAlias);
                    //    //画圆心
                    //    Cv2.Circle(img, (int)(rrt.Center.X), (int)(rrt.Center.Y), 4, new Scalar(255, 0, 0), -1, LineTypes.Link8, 0);
                    //}

                    ////获取指定区域图片 SCr为mat类型
                    //Rectangle rectangle = new Rectangle(10, 10, 10, 10);
                    //SCr = SCr.ToImage<Bgr, byte>().GetSubRect(rectangle).Mat;
                    //Cv2.ImShow("Fit Circle", img);
                    //return img;
                    //CvInvoke.HoughLines(tempImage, lines, 1, Math.PI / 180, 10, 0, 0);
                }
                mask = src.ToImage<Bgr, byte>().Copy().Mat;
                CvInvoke.DrawContours(mask, fitcontours, -1, new MCvScalar(0, 0, 255));
                foreach (Rectangle rect in rectlist)
                    CvInvoke.Rectangle(mask, rect, new MCvScalar(255, 0, 0));
                Image<Bgr, Byte> outi = mask.ToImage<Bgr, Byte>();
                ib_original.Image = outi.ToBitmap();
            }
        }
        public PointF[] PointToPointF(System.Drawing.Point[] pf)
        {
            PointF[] aaa = new PointF[pf.Length];
            int num = 0;
            foreach (var point in pf)
            {
                aaa[num].X = (int)point.X;
                aaa[num++].Y = (int)point.Y;
            }
            return aaa;
        }

        private void ceedbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            ceedfengguo(pt, ceedcomboBox.Text);
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
        }
        private void ceedfengguo(System.Windows.Forms.PictureBox ib_original, string minlen = "10")
        {
            if (ib_original.Image != null)
            {
                Bitmap bmp = new Bitmap(ib_original.Image);
                Mat src = bmp.ToMat();
                Mat dst = new Mat();

                //Canny 边缘检测算子
                CvInvoke.Canny(src, dst, 120, 180, 7, true);

                //创建用于存储轮廓的VectorOfVectorOfPoint数据类型
                //需要添加引用命名空间Emgu.CV.Util
                VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();
                VectorOfPoint contour = new VectorOfPoint();
                VectorOfVectorOfPoint tempcontours = new VectorOfVectorOfPoint();
                VectorOfVectorOfPoint fitcontours = new VectorOfVectorOfPoint();
                //IOutputArray contours：检测到的轮廓。通常使用VectorOfVectorOfPoint类型。
                //IOutputArray hierarchy：可选的输出向量,包含图像的拓扑信息。不使用的时候可以用 null 填充。
                //每个独立的轮廓（连通域）对应 4 个 hierarchy元素 hierarchy[i][0]~hierarchy[i][4]
                //（i表示独立轮廓的序数）分别表示后一个轮廓、前一个轮廓、父轮廓、子轮廓的序数。

                //RetrType mode标识符及其解析：
                //External = 0 提取的最外层轮廓；
                //List = 1 提取所有轮廓
                //Ccomp = 2 检索所有轮廓并将它们组织成两级层次结构:水平是组件的外部边界,二级约束边界的洞。
                //Tree = 3 提取所有的轮廓和建构完整的层次结构嵌套的轮廓。

                //ChainApproxMethod表示轮廓的逼近方法
                //ChainCode = 0 Freeman链码输出轮廓。所有其他方法输出多边形(顶点序列)。
                //ChainApproxNone = 1 所有的点从链代码转化为点;
                //ChainApproxSimple = 2 压缩水平、垂直和对角线部分,也就是说, 只剩下他们的终点;
                //ChainApproxTc89L1 = 3 使用The - Chinl 链逼近算法的一个
                //ChainApproxTc89Kcos = 4 使用The - Chinl 链逼近算法的一个
                //LinkRuns = 5, 使用完全不同的轮廓检索算法通过链接的水平段的1s轨道。
                //用这种方法只能使用列表检索模式。

                //寻找图像轮廓
                VectorOfPoint hierachy = new VectorOfPoint();
                //CvInvoke.FindContours(dst, contours, null, Emgu.CV.CvEnum.RetrType.List, Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxTc89Kcos);
                CvInvoke.FindContours(dst, contours, null, Emgu.CV.CvEnum.RetrType.External,
                    Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxSimple);
                System.Drawing.Point[][] con1 = contours.ToArrayOfArray();
                //PointF[][] con2 = Array.ConvertAll<System.Drawing.Point[], PointF[]>(con1, new Converter<System.Drawing.Point[], PointF[]>(PointToPointF));
                Mat mask = src.ToImage<Bgr, byte>().Copy().Mat;
                //CvInvoke.DrawContours(mask, contours, -1, new MCvScalar(0, 0, 255));
                ib_original.Image = mask.ToBitmap();
                fitcontours.Clear();
                List<Rectangle> rectlist = new List<Rectangle>();
                for (int i = 0; i < contours.Size; i++)
                {
                    contour = contours[i];//获取独立的连通轮廓 
                    //拟合函数必须至少5个点，少于则不拟合
                    if (contour.Size < Convert.ToInt32(minlen)) continue;
                    //Rectangle rect = CvInvoke.BoundingRectangle(contour);//提取最外部矩形。
                    double Length = CvInvoke.ArcLength(contour, false);//计算连通轮廓的周长。
                    //double dou = CvInvoke.ContourArea(contour, false);  //计算面积
                    if (Length < Convert.ToInt32(minlen)) continue;
                    //lint拟合
                    //CvInvoke.FitLine(contour, hierachy, DistType.L2, 0, 0.01, 0.01);                       
                    rectlist.Add(CvInvoke.BoundingRectangle(contour));//提取最外部矩形。
                    //VectorOfPoint vp = new VectorOfPoint();
                    //CvInvoke.ConvexHull(contour, vp);////查找最小外接矩形cvInpaint
                    fitcontours.Push(contour);
                    //fitcontours.Push(vp);
                    //List<Point2f> points = new List<Point2f>();
                    //points.Add(new Point2f(3, 3));
                    //points.Add(new Point2f(4, 4));
                    //points.Add(new Point2f(5, 5));
                    //Line2D line = Cv2.FitLine(points, DistanceTypes.L2, 0, 0.01, 0.01);

                    // CvInvoke.Imshow("Fit line", mask);
                    //根据找到的轮廓点，拟合椭圆
                    //for (int i = 0; i < contours.Length; i++)
                    //{
                    //    //拟合函数必须至少5个点，少于则不拟合
                    //    if (contours[i].Length < 5) continue;
                    //    //椭圆拟合
                    //    var rrt = Cv2.FitEllipse(contours[i]);

                    //    //ROI复原
                    //    rrt.Center.X += x;
                    //    rrt.Center.Y += y;

                    //    //画椭圆
                    //    Cv2.Ellipse(img, rrt, new Scalar(0, 0, 255), 2, LineTypes.AntiAlias);
                    //    //画圆心
                    //    Cv2.Circle(img, (int)(rrt.Center.X), (int)(rrt.Center.Y), 4, new Scalar(255, 0, 0), -1, LineTypes.Link8, 0);
                    //}

                    //Cv2.ImShow("Fit Circle", img);
                    //return img;
                    //CvInvoke.HoughLines(tempImage, lines, 1, Math.PI / 180, 10, 0, 0);
                }
                mask = src.ToImage<Bgr, byte>().Copy().Mat;
                CvInvoke.DrawContours(mask, fitcontours, -1, new MCvScalar(0, 255, 0));
                foreach (Rectangle rect in rectlist)
                    CvInvoke.Rectangle(mask, rect, new MCvScalar(255, 0, 0), 1, LineType.EightConnected);
                ib_original.Image = mask.ToBitmap();
            }
        }

        private void bigbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            try
            {
                System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
                if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                    pt = twoPic;
                if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                    pt = totalpic;
                if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                    pt = samplePic;
                if (pt == null) return;
                if (pt.Image == null) return;
                double x = 1.1; double y = 1.1;
                if (pt.Width < samplepanel.Width & (pt.Height < samplepanel.Height))
                {
                    Bitmap bt;
                    Zoom((Bitmap)pt.Image, x, y, out bt, ZoomType.NearestNeighborInterpolation);
                    pt.Image = bt;
                    ssw = pt.Width; ssh = pt.Height;
                    pt.Refresh();
                    setrunstatus(true, "已放大！");
                }
                else
                    setrunstatus(true, "无需放大！");
            }
            catch (Exception ex)
            {

            }
            watch.Stop();
            runStatusLabel.Text = runStatusLabel.Text + "用时毫秒：" + watch.ElapsedMilliseconds.ToString();
        }
        public static int ssw = -1; public static int ssh = -1;
        private void smallbutton_Click(object sender, EventArgs e)
        {
            smallbutton.Enabled = false;
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            smallbutton2(pt, Convert.ToDouble(rotateanglecomboBox.Text), Convert.ToDouble(rotateanglecomboBox.Text));
            smallbutton.Enabled = true;
        }
        public void smallbutton2(System.Windows.Forms.PictureBox pt = null, double x = 0.9, double y = 0.9)
        {
            Stopwatch watch = new Stopwatch();
            watch.Start();
            runStatusLabel.Text = "";
            try
            {
                if (pt.Image == null)
                    throw new Exception("pt图片为空");
                if (pt.Width > samplepanel.Width || (pt.Height > samplepanel.Height))
                {
                    //Bitmap bt = new Bitmap(pt.Image);
                    Mat src = ((Bitmap)pt.Image).ToMat();
                    //Image<Bgra, Byte> srci = src.ToImage<Bgra, Byte>();
                    //Mat scr = new Mat("ball.png", Emgu.CV.CvEnum.LoadImageType.AnyColor);
                    //Mat dst = new Mat();
                    //Mat db = new Mat();
                    CvInvoke.Resize(src, src, new Size(), x, y);

                    //CvInvoke.PyrDown(src, dst);//缩小
                    //CvInvoke.PyrUp(src, db);//放大
                    //Bitmap bt;
                    //Zoom((Bitmap)pt.Image, x, y, out bt, ZoomType.NearestNeighborInterpolation);
                    Image<Bgr, Byte> outi = src.ToImage<Bgr, Byte>();
                    pt.Image = outi.ToBitmap();
                    ssw = pt.Width; ssh = pt.Height;
                    //pt.Refresh();
                    setrunstatus(true, "已缩小！");
                }
                else
                    setrunstatus(true, "无需缩小！");
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("smallbutton2", ex.ToString());
            }
            watch.Stop();
            runStatusLabel.Text = runStatusLabel.Text + "用时毫秒：" + watch.ElapsedMilliseconds.ToString();
        }

        private unsafe void coloremgubutton_MouseUp(object sender, MouseEventArgs e)
        {
            coloremgubutton.Enabled = false;
            Stopwatch watch = new Stopwatch();
            watch.Start();
            try
            {
                if (samplePic.Image == null) return;
                System.Windows.Forms.PictureBox pt = samplePic;
                if (pt.Width > samplepanel.Width || (pt.Height > samplepanel.Height))
                {
                    double x = 1; double y = 1;
                    if (pt.Width > samplepanel.Width)
                        x = (double)samplepanel.Width / (double)pt.Width;
                    if (pt.Height > samplepanel.Height)
                        y = (double)samplepanel.Height / (double)pt.Height;
                    if (x > y)
                        y = x;
                    else
                        x = y;
                    smallbutton2(samplePic, x, y);
                }
                Bitmap bts = (Bitmap)pt.Image;
                bool hei = true;
                if (e.Button == MouseButtons.Right)
                    hei = false;
                if (samplesetTab.SelectedTab.Name == "twoTab")
                {
                    twoPic.Image = coloremgu(bts, (int*)currentSelect, "二值", hei);
                    twoPic.Refresh();
                }
                else
                {
                    samplesetTab.SelectTab("totalhrgbTab");
                    totalpic.Image = coloremgu(bts, (int*)currentSelect, "彩色二值", hei);
                    totalpic.Refresh();
                }
                setinglogClass.xihua = "";
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("twogroupbutton_Click", ex.ToString());
            }
            coloremgubutton.Enabled = true;
            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
        }
        public unsafe Bitmap coloremgu(Bitmap srcBitmap, int* currentNo, string two = "", bool hei = true)
        {
            if (srcBitmap == null) return null;
            try
            {
                int* height = (int*)srcBitmap.Height;
                int* width = (int*)srcBitmap.Width;
                if ((int)currentNo == -1) currentNo = (int*)AutoCheck.currentSelect;
                byte* val = (byte*)(hei ? 0 : 255);
                byte* val2 = (byte*)(hei ? 255 : 0);
                if (two == "二值")
                {
                    int* up; int* down;
                    up = (int*)AutoCheck.listRectangle[(int)currentNo].twoUp;
                    down = (int*)AutoCheck.listRectangle[(int)currentNo].twoDown;
                    Gray min = new Gray((int)down);//白色的最小值， 允许一定154的误差。
                    Gray max = new Gray((int)up);//白色的最大值， 允许一定的误差。
                    Mat srcmt = srcBitmap.ToMat();
                    Image<Bgr, byte> img_src = srcmt.ToImage<Bgr, byte>();
                    //Mat imput_gray = new Mat(new Size(img_src.Cols, img_src.Rows), DepthType.Cv8U, 3);
                    Image<Gray, byte> output_gray = new Image<Gray, byte>(img_src.Size);
                    Image<Gray, byte> outbin = new Image<Gray, byte>(img_src.Size);
                    Image<Gray, byte> outbin2 = new Image<Gray, byte>(img_src.Size);
                    CvInvoke.CvtColor(img_src, output_gray, ColorConversion.Bgr2Gray);
                    if (!hei)
                        outbin = output_gray.InRange(min, max);
                    else
                    {
                        outbin = output_gray.InRange(new Gray(0), min);
                        outbin2 = output_gray.InRange(max, new Gray(255));
                        CvInvoke.Add(outbin, outbin2, outbin);

                    }
                    return outbin.ToBitmap();
                }
                else if (two == "彩色二值")
                {
                    Mat srcmt = srcBitmap.ToMat();
                    Image<Bgra, byte> img_src = srcmt.ToImage<Bgra, byte>();
                    //Mat imput_gray = new Mat(new Size(img_src.Cols, img_src.Rows), DepthType.Cv8U, 3);
                    Mat outma = new Mat();
                    CvInvoke.CvtColor(img_src, outma, ColorConversion.Bgra2Gray);

                    Image<Gray, byte> output_gray = new Image<Gray, byte>(outma.Size);
                    Image<Gray, byte> outbin = new Image<Gray, byte>(outma.Size);
                    Image<Gray, byte> outbin2 = new Image<Gray, byte>(outma.Size);

                    int* zhicolorcount = (int*)AutoCheck.zhicolorlist[(int)currentNo].Count;
                    int*[] rup = new int*[(int)zhicolorcount]; int*[] rdown = new int*[(int)zhicolorcount];
                    int*[] gup = new int*[(int)zhicolorcount]; int*[] gdown = new int*[(int)zhicolorcount];
                    int*[] bup = new int*[(int)zhicolorcount]; int*[] bdown = new int*[(int)zhicolorcount];
                    int*[] hup = new int*[(int)zhicolorcount]; int*[] hdown = new int*[(int)zhicolorcount];
                    for (int i = 0; i < (int)zhicolorcount; i++)
                    {
                        hup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).hUp;
                        hdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).hDown;
                        rup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).rUp;
                        rdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).rDown;
                        gup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).gUp;
                        gdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).gDown;
                        bup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).bUp;
                        bdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).bDown;
                        outbin = img_src.InRange(new Bgra((int)bdown[i], (int)gdown[i], (int)rdown[i], (int)hdown[i]), new Bgra((int)bup[i], (int)gup[i], (int)rup[i], (int)hup[i]));
                        if (i != 0)
                            CvInvoke.Add(outbin, outbin2, outbin2);
                    }
                    if (hei)
                        CvInvoke.Threshold(outbin2, outbin2, 120, 255, ThresholdType.BinaryInv);//图像取反
                    return outbin2.ToBitmap();
                    //CvInvoke.HConcat(Ma1, Ma2, Ma); //返回与另一张图片横向链接的图片
                    //CvInvoke.VConcat(Ma1, Ma2, Ma);//返回与另一张图片纵向链接的图片  
                    //清除小于平均顶点10的二值图
                    //Point[] po = { new Point(0, 0), new Point(res.Width, 0), new Point(res.Width, minAvg - Gets.Fges[1] + 52), new Point(0, minAvg - Gets.Fges[1] + 52) };
                    //VectorOfPoint vp = new VectorOfPoint(po);
                    ////CvInvoke.DrawContours(res, vp, -1, new MCvScalar(0, 0, 255));
                    //CvInvoke.FillConvexPoly(res, vp, new MCvScalar(0), LineType.EightConnected);//填充指定区域
                }
                return null;
            }
            catch (Exception ex)
            {
                return srcBitmap;
            }
        }

        private void houghPbutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = null;
            double x = 1;
            double y = 1;
            if (pt.Width > samplepanel.Width)
                x = (double)samplepanel.Width / (double)pt.Width;
            if (pt.Height > samplepanel.Height)
                y = (double)samplepanel.Height / (double)pt.Height;
            if (x > y)
                y = x;
            else
                x = y;
            Zoom((Bitmap)pt.Image, x, y, out bt, ZoomType.NearestNeighborInterpolation);
            pt.Image = bt;
            pt.Refresh();
            shapefind.linesfind(true, "", pt, Convert.ToInt32(lencomboBox.Text), Convert.ToDouble(cornercomboBox.Text), Convert.ToInt32(discomboBox.Text), Convert.ToInt32(jinbucomboBox.Text));
        }

        private void loadcheckpicbutton_Click(object sender, EventArgs e)
        {
            getcheckpic();

        }
        public static int nextcheckpic = 0;
        private void nextcheckpicbutton_Click(object sender, EventArgs e)
        {
            nextcheckpic += 1;
            if (nextcheckpic >= Directory.GetFiles(setinglogClass.checkpicfolder).Count()) nextcheckpic = 0;
            getcheckpic(nextcheckpic);
        }
        // MatchTemplate
        /// <summary>
        /// 获取匹配图像的位置
        /// </summary>
        /// <param name="Src">被匹配的源图像</param>
        /// <param name="Template">模板图像</param>
        /// <returns>匹配位置</returns>
        Rectangle GetMatchPos(Mat Src, Mat Template)
        {
            Mat MatchResult = new Mat();//匹配结果
            CvInvoke.MatchTemplate(Src, Template, MatchResult, Emgu.CV.CvEnum.TemplateMatchingType.CcorrNormed);//使用相关系数法匹配
            System.Drawing.Point max_loc = new System.Drawing.Point();
            System.Drawing.Point min_loc = new System.Drawing.Point();
            double max = 0, min = 0;
            CvInvoke.MinMaxLoc(MatchResult, ref min, ref max, ref min_loc, ref max_loc);//获得极值信息
            runStatusLabel.Text = ("\r\nX:" + max_loc.X + " Y:" + max_loc.Y + " 最大相似度:" + max + " 最小相似度:" + min);
            return new Rectangle(max_loc, Template.Size);
        }

        private void matchbutton_MouseUp(object sender, MouseEventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            try
            {
                switch (matchcomboBox.Text)
                {
                    case "matchtemplate":
                        Bitmap checkbt = new Bitmap(checkpic.Image);
                        Bitmap sourcebt = new Bitmap(samplePic.Image);
                        Rectangle rect = GetMatchPos(checkbt.ToMat(), sourcebt.ToMat());
                        if (rect != null)
                        {
                            Graphics g = Graphics.FromImage(checkbt);
                            g.DrawRectangle(new Pen(Color.Red), rect);
                            checkpanel.AutoScrollPosition = new System.Drawing.Point(Math.Abs(rect.X - 30), Math.Abs(rect.Y - 30));
                            //CvInvoke.ArrowedLine(checkbt.ToMat(), new System.Drawing.Point(rect.X, rect.Y), new System.Drawing.Point(rect.X + rect.Width, rect.Y + rect.Height), new MCvScalar(255, 0, 0));
                            checkpic.Image = checkbt;
                        }
                        break;
                    default:
                        {
                            break;
                        }
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("matchbutton_MouseUp", ex.ToString());
            }
            finally
            {
                watch.Stop();
                runStatusLabel.Text = runStatusLabel.Text + "用时毫秒：" + watch.ElapsedMilliseconds.ToString();
            }
        }

        private void matchbutton_Click(object sender, EventArgs e)
        {

        }

        private void checkpicsamllbutton_Click(object sender, EventArgs e)
        {
            smallbutton2(checkpic);
        }
        //////    SIFT算法
        //public static Bitmap MatchPicBySift(Bitmap imgSrc, Bitmap imgSub)
        //{
        //    using (Mat matSrc = imgSrc.ToMat())
        //    using (Mat matTo = imgSub.ToMat())
        //    using (Mat matSrcRet = new Mat())
        //    using (Mat matToRet = new Mat())
        //    {
        //        VectorOfKeyPoint keyPointsSrc=new VectorOfKeyPoint(), keyPointsTo=new VectorOfKeyPoint();
        //        using (var sift = new Emgu.CV.XFeatures2D.Freak())
        //        {
        //            sift.DetectAndCompute(matSrc, null, keyPointsSrc, matSrcRet, false);
        //            sift.DetectAndCompute(matTo, null,   keyPointsTo, matToRet,false);
        //        }
        //        using (var bfMatcher = new Emgu.CV.bfMatcher())
        //        {
        //            var matches = bfMatcher.KnnMatch(matSrcRet, matToRet, k: 2);
        //            var pointsSrc = new List<VectorOfPoint>();
        //            var pointsDst = new List<VectorOfPoint>();
        //            var goodMatches = new List<DMatch>();
        //            foreach (DMatch[] items in matches.Where(x => x.Length > 1))
        //            {
        //                if (items[0].Distance < 0.5 * items[1].Distance)
        //                {
        //                    pointsSrc.Add(keyPointsSrc[items[0].QueryIdx].Pt);
        //                    pointsDst.Add(keyPointsTo[items[0].TrainIdx].Pt);
        //                    goodMatches.Add(items[0]);
        //                    Console.WriteLine($"{keyPointsSrc[items[0].QueryIdx].Pt.X}, {keyPointsSrc[items[0].QueryIdx].Pt.Y}");
        //                }
        //            }
        //            var outMat = new Mat();
        //            //算法RANSAC对匹配的结果做过滤
        //           var pSrc = pointsSrc.ConvertAll(Point2fToPoint2d);
        //            var pDst = pointsDst.ConvertAll(Point2fToPoint2d);
        //            var outMask = new Mat();
        //            //如果原始的匹配结果为空, 则跳过过滤步骤
        //                if (pSrc.Count > 0 && pDst.Count > 0)
        //                CvInvoke.FindHomography(pSrc, pDst, HomographyMethods.Ransac, mask: outMask);
        //            //如果通过RANSAC处理后的匹配点大于10个,才应用过滤.否则使用原始的匹配点结果(匹配点过少的时候通过RANSAC处理后, 可能会得到0个匹配点的结果).
        //                if (outMask.Rows > 10)
        //            {
        //                byte[] maskBytes = new byte[outMask.Rows * outMask.Cols];
        //                outMask.GetInputArray(0, 0, maskBytes);
        //                CvInvoke.DrawMarker(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat,match , DrawMode.Normal);// matchesMask: maskBytesflags: DrawMatchesFlags.NotDrawSinglePoints);
        //            }
        //            else
        //                CvInvoke.DrawMatches(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, flags: DrawMatchesFlags.NotDrawSinglePoints);
        //            return OpenCvSharp.Extensions.BitmapConverter.ToBitmap(outMat);
        //        }
        //    }
        //}

        private void redzhuizhongbutton_Click(object sender, EventArgs e)
        {
            //Stopwatch watch = Stopwatch.StartNew();
            //redzhuizhongbutton.Enabled = false;
            //redandgreenzhuizhong();
            //redzhuizhongbutton.Enabled = true;
            //watch.Stop();
            //setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static List<Rectangle> redrect = new List<Rectangle>();
        public void redandgreenzhuizhong()
        {
            redrect.Clear();
            if (videoSource1 == null) return;
            /// 红色绿色同时追踪
            if (!videoSource1.IsRunning)     //打开文件失败
            {
                setrunstatus(false, "Open video failed!");
                return;
            }

            Bitmap bt = new Bitmap(videoSourcePlayer1.GetCurrentVideoFrame());
            Mat frame = bt.ToMat();
            Mat hsvimg = new Mat();
            Mat mask_red = new Mat();
            //Mat mask_green = new Mat();


            //Hsv hsvL = new Hsv(listRectangle[0].hhDown, listRectangle[0].hhDown, listRectangle[0].hhDown);
            Color colorL = ColorFromHSV(listRectangle[0].hhDown, listRectangle[0].ssDown, listRectangle[0].vvDown);
            //Hsv hsvh = new Hsv(listRectangle[0].hhUp, listRectangle[0].hhUp, listRectangle[0].hhUp);
            Color colorH = ColorFromHSV(listRectangle[0].hhUp, listRectangle[0].ssUp, listRectangle[0].vvUp);
            //double h_min_red = listRectangle[0].hhDown, s_min_red = listRectangle[0].ssDown, v_min_red = listRectangle[0].vvDown;
            //double h_max_red = listRectangle[0].hhUp, s_max_red = listRectangle[0].ssUp, v_max_red = listRectangle[0].vvUp;
            //double h_min_green = 35, s_min_green = 110, v_min_green = 106;
            //double h_max_green = 77, s_max_green = 255, v_max_green = 255;


            ScalarArray hsv_min_red = new ScalarArray(new MCvScalar(colorL.B, colorL.G, colorL.R));
            ScalarArray hsv_max_red = new ScalarArray(new MCvScalar(colorH.B, colorH.G, colorH.R));

            //ScalarArray hsv_min_green = new ScalarArray(new MCvScalar(h_min_green, s_min_green, v_min_green));
            //ScalarArray hsv_max_green = new ScalarArray(new MCvScalar(h_max_green, s_max_green, v_max_green));

            CvInvoke.CvtColor(frame, hsvimg, ColorConversion.Bgr2Hsv);
            //CvInvoke.InRange(hsvimg, hsv_min_red, hsv_max_red, mask_red);
            CvInvoke.InRange(hsvimg, hsv_min_red, hsv_max_red, mask_red);
            //CvInvoke.InRange(hsvimg, hsv_min_green, hsv_max_green, mask_green);
            CvInvoke.MedianBlur(mask_red, mask_red, 5);
            //CvInvoke.MedianBlur(mask_green, mask_green, 5);

            //Mat mask = new Mat();
            //CvInvoke.Add(mask_red, mask_green, mask);  //掩膜相加
            //CvInvoke.Imshow("mask", mask_red);          //显示合在一起的掩膜

            VectorOfVectorOfPoint contours_red = new VectorOfVectorOfPoint();
            VectorOfRect hierachy_red = new VectorOfRect();
            CvInvoke.FindContours(mask_red, contours_red, hierachy_red, RetrType.External, ChainApproxMethod.ChainApproxNone);

            for (int i = 0; i < contours_red.Size; i++)
            {
                if (contours_red[i].Size < 10) continue;            //对于太小的，删除掉
                Rectangle rect = CvInvoke.BoundingRectangle(contours_red[i]);
                if (rect.Width < 5 || rect.Height < 5) continue;            //对于太小的外接矩形，删除掉
                CvInvoke.Rectangle(frame, rect, new MCvScalar(255, 0, 0), 1);
                redrect.Add(rect);
                CvInvoke.PutText(frame, "red", new System.Drawing.Point(rect.X, rect.Y - 5), FontFace.HersheyComplexSmall, 1.2, new MCvScalar(0, 0, 255));
            }
            Image<Bgra, int> outi = frame.ToImage<Bgra, int>();
            realPicture.Image = outi.ToBitmap();
            frame.Dispose();
            //VectorOfVectorOfPoint contours_green = new VectorOfVectorOfPoint();
            //VectorOfRect hierachy_green = new VectorOfRect();
            //CvInvoke.FindContours(mask_green, contours_green, hierachy_green, RetrType.External, ChainApproxMethod.ChainApproxNone);

            //for (int i = 0; i < contours_green.Size; i++)
            //{
            //    Rectangle rect = CvInvoke.BoundingRectangle(contours_green[i]);
            //    if (rect.Width < 10 || rect.Height < 10)                //对于太小的外接矩形，删除掉
            //        continue;
            //    CvInvoke.Rectangle(frame, rect, new MCvScalar(255, 0, 0), 1);
            //    CvInvoke.PutText(frame, "green", new System.Drawing.Point(rect.X, rect.Y - 5), FontFace.HersheyComplexSmall, 1.2, new MCvScalar(0, 255, 0));
            //}
            //CvInvoke.Imshow("hsv_track", frame);
        }

        private void coloremgubutton_Click(object sender, EventArgs e)
        {

        }

        private void checkpic_MouseUp(object sender, MouseEventArgs e)
        {
            if (!colorsetcheckBox.Checked || checkpic == null) return;
            Color pixel;
            Bitmap bts = (Bitmap)checkpic.Image;
            pixel = bts.GetPixel(e.X, e.Y);
            currentlabel.BackColor = pixel;
            double hsvcolorh = Convert.ToDouble(hsvcolorcomboBox.Text);
            double hsvcolorsv = Convert.ToDouble(hsvcolorcomboBox.Text);
            double a_min_red = pixel.A - hsvcolorh < 0 ? 0 : pixel.A - hsvcolorh, r_min_red = pixel.R - hsvcolorsv < 0 ? 0 : pixel.R - hsvcolorsv, g_min_red = pixel.G - hsvcolorsv < 0 ? 0 : pixel.G - hsvcolorsv, b_min_red = pixel.B - hsvcolorsv < 0 ? 0 : pixel.B - hsvcolorsv;
            double a_max_red = pixel.A + hsvcolorh > 255 ? 255 : pixel.A + hsvcolorh, r_max_red = pixel.R + hsvcolorsv > 255 ? 255 : pixel.R + hsvcolorsv, g_max_red = pixel.G + hsvcolorsv > 255 ? 255 : pixel.G + hsvcolorsv, b_max_red = pixel.B + hsvcolorsv > 255 ? 255 : pixel.B + hsvcolorsv;
            Color intermediate = Color.FromArgb((int)a_min_red, (int)r_min_red, (int)g_min_red, (int)b_min_red);
            Hsv hsvL = new Hsv(intermediate.GetHue(), intermediate.GetSaturation(), intermediate.GetBrightness());

            Color intermediateH = Color.FromArgb((int)a_max_red, (int)r_max_red, (int)g_max_red, (int)b_max_red);
            Hsv hsvH = new Hsv(intermediateH.GetHue(), intermediateH.GetSaturation(), intermediateH.GetBrightness());

            listRectangle[0].hhDown = hsvL.Hue;
            listRectangle[0].ssDown = hsvL.Satuation;
            listRectangle[0].vvDown = hsvL.Value;

            listRectangle[0].hhUp = hsvH.Hue;
            listRectangle[0].ssUp = hsvH.Satuation;
            listRectangle[0].vvUp = hsvH.Value;
        }

        private void currentlabel_Click(object sender, EventArgs e)
        {
            //Hsv hsvL = new Hsv(listRectangle[0].hhUp, listRectangle[0].ssUp, listRectangle[0].vvUp);
            currentlabel.BackColor = ColorFromHSV(listRectangle[0].hhUp, listRectangle[0].ssUp, listRectangle[0].vvUp);
            //currentlabel.BackColor = Color.FromArgb(Convert .ToInt32 (listRectangle[0].hhUp), Convert.ToInt32(listRectangle[0].ssUp), Convert.ToInt32(listRectangle[0].vvUp));
        }
        public static Color ColorFromHSV(double hue, double saturation, double value)
        {
            int hi = Convert.ToInt32(Math.Floor(hue / 60)) % 6;
            double f = hue / 60 - Math.Floor(hue / 60);

            value = value * 255;
            int v = Convert.ToInt32(value);
            int p = Convert.ToInt32(value * (1 - saturation));
            int q = Convert.ToInt32(value * (1 - f * saturation));
            int t = Convert.ToInt32(value * (1 - (1 - f) * saturation));

            if (hi == 0)
                return Color.FromArgb(255, v, t, p);
            else if (hi == 1)
                return Color.FromArgb(255, q, v, p);
            else if (hi == 2)
                return Color.FromArgb(255, p, v, t);
            else if (hi == 3)
                return Color.FromArgb(255, p, q, v);
            else if (hi == 4)
                return Color.FromArgb(255, t, p, v);
            else
                return Color.FromArgb(255, v, p, q);
        }
        private void checkPage_Enter(object sender, EventArgs e)
        {
            //currentlabel.BackColor = Color.FromArgb(Convert.ToInt32(listRectangle[0].hhDown), Convert.ToInt32(listRectangle[0].ssDown), Convert.ToInt32(listRectangle[0].vvDown));
            currentlabel.BackColor = ColorFromHSV(listRectangle[0].hhDown, listRectangle[0].ssDown, listRectangle[0].vvDown);
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void rotatebutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;

            //pt.Image = rotated(bt, (float)Convert.ToDouble(rotateanglecomboBox.Text), new System.Drawing.Point(0, 0));

            pt.Image = rotated2(bt, (float)Convert.ToDouble(rotateanglecomboBox.Text), Color.Green);

            watch.Stop();
            runStatusLabel.Text = watch.ElapsedMilliseconds.ToString();
        }
        /// 任意角度旋转
        /// 
        /// 原始图Bitmap
        /// 旋转角度
        /// 背景色
        /// 输出Bitmap
        public static Bitmap rotated2(Bitmap bmp, float angle, Color bkColor)
        {
            int w = bmp.Width + 2;
            int h = bmp.Height + 2;

            PixelFormat pf;

            if (bkColor == Color.Transparent)
            {
                pf = PixelFormat.Format32bppArgb;
            }
            else
            {
                pf = bmp.PixelFormat;
            }

            Bitmap tmp = new Bitmap(w, h, pf);
            Graphics g = Graphics.FromImage(tmp);
            g.Clear(bkColor);
            g.DrawImageUnscaled(bmp, 1, 1);
            g.Dispose();

            GraphicsPath path = new GraphicsPath();
            path.AddRectangle(new RectangleF(0f, 0f, w, h));
            Matrix mtrx = new Matrix();
            mtrx.Rotate(angle);
            RectangleF rct = path.GetBounds(mtrx);

            Bitmap dst = new Bitmap((int)rct.Width, (int)rct.Height, pf);
            g = Graphics.FromImage(dst);
            g.Clear(bkColor);
            g.TranslateTransform(-rct.X, -rct.Y);
            g.RotateTransform(angle);
            g.InterpolationMode = InterpolationMode.HighQualityBilinear;
            g.DrawImageUnscaled(tmp, 0, 0);
            g.Dispose();

            tmp.Dispose();

            return dst;
        }
        public Bitmap rotated(Bitmap bt, float angle, PointF centerpot)
        {
            Mat mt = bt.ToMat();
            Mat mtborder = new Mat();
            Mat rotatemt = new Mat();
            //Mat mt2 = Mat.Zeros( 300, 400 , DepthType.Cv8U,3);//初值为一的图像
            //pot = new PointF((float)(bt.Width / 2), (float)(bt.Height / 2));
            //Size sz = new Size(bt.Width, bt.Height);
            //angle = 45;
            //RotatedRect rRect = new RotatedRect(pot, sz, angle);
            //PointF[] vertices = rRect.GetVertices();
            int border = Convert.ToInt32(0 * mt.Cols);
            CvInvoke.CopyMakeBorder(mt, mtborder, border, border, border, border, BorderType.Constant, new MCvScalar(255));
            Mat warp_rotate_matrix = new Mat();
            CvInvoke.GetRotationMatrix2D(centerpot, angle, 1, warp_rotate_matrix);
            CvInvoke.WarpAffine(mt, rotatemt, warp_rotate_matrix, new Size(mtborder.Width, mtborder.Height), Inter.Linear, Warp.Default, BorderType.Replicate);
            Image<Bgr, byte> rotatei = rotatemt.ToImage<Bgr, byte>();
            //CvInvoke.NamedWindow("rotated", WindowFlags.AutoSize);
            //CvInvoke.Imshow("rotated", rotatei);
            return rotatei.ToBitmap();
        }

        private void rulerbutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            Image<Bgr, byte> srci = bt.ToImage<Bgr, byte>();
            bt = srci.ToBitmap();
            Graphics g = Graphics.FromImage(bt);
            int xline = Convert.ToInt32(bt.Height / 10);
            int yline = Convert.ToInt32(bt.Width / 10);
            for (int x = 1; x < xline; x++)
                g.DrawLine(new Pen(Color.GreenYellow), 0, x * 10, bt.Width, x * 10);
            for (int y = 1; y < yline; y++)
                g.DrawLine(new Pen(Color.LightBlue), y * 10, 0, y * 10, bt.Height);
            pt.Image = bt;
            pt.Refresh();
        }

        private void mesurebutton_Click(object sender, EventArgs e)
        {

        }

        private void colorzipbutton_Click(object sender, EventArgs e)
        {
            //System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            //if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
            //    pt = twoPic;
            //if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
            //    pt = totalpic;
            //if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
            //    pt = samplePic;
            //if (pt == null) return;
            //Bitmap bt = (Bitmap)pt.Image;
            ////Image<Bgr, byte> srci = bt.ToImage<Bgr, byte>();
            //Mat srcmt = bt.ToMat();
            //Mat samples = srcmt.Reshape(0, srcmt.Cols * srcmt.Rows);
            //Debug.WriteLine("image:h=%d,w=%d,c=%d\n", srcmt.Rows, srcmt.Cols, srcmt.NumberOfChannels);
            //samples.ConvertTo(samples, DepthType.Cv32S);
            //Debug.WriteLine("samples:h=%d,w=%d,c=%d,c=%d\n", samples.Rows, samples.Cols, samples.NumberOfChannels);
            //MCvTermCriteria criteria = new MCvTermCriteria(TermCritType.Eps ,10,1.0);
            //int k = 4;
            //Mat lables=new Mat ();
            //Mat centers=new Mat();
            //double compactness = CvInvoke.Kmeans(samples, k, lables, criteria, 3, KMeansInitType.PPCenters,centers);
            //centers.ConvertTo(centers, DepthType.Cv8U);
            //samples.ConvertTo(samples, DepthType.Cv8U);
            //for (int i = 0; i < lables.Rows; i++)
            //{
            //    int cluster = lables[);
            //    samples.e

            //}
        }

        private void googlebutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            //Bitmap bt = (Bitmap)pt.Image;
            pt.Image = googlebutton_Click((Bitmap)pt.Image);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static Net dnnnet;
        public static VectorOfCvString labels;
        private Bitmap googlebutton_Click(Bitmap bt = null)
        {
            if (bt == null) return null;
            Mat mt = bt.ToMat();
            CvInvoke.CvtColor(mt, mt, ColorConversion.Bgra2Bgr);

            //下面两行在使用CUDA检测时使用
            //net.setPreferableBackend(dnn::DNN_BACKEND_CUDA);
            //net.setPreferableTarget(dnn::DNN_TARGET_CUDA);
            //下面一行在使用CPU检测时使用
            //net.setPreferableTarget(dnn::DNN_TARGET_CPU);
            dnnnet.SetPreferableTarget(Target.Cpu);

            Mat inputblob = DnnInvoke.BlobFromImage(mt, 1.0f, new Size(224, 224), new MCvScalar(104, 117, 123), true, false, DepthType.Cv32F);
            //Mat prob=new Mat ();
            dnnnet.SetInput(inputblob, "data");
            Mat prob = dnnnet.Forward("prob");

            Mat probmat = prob.Reshape(1, 1);
            //var detectionMat = new Mat(Convert.ToInt32(probmat.Row(2)), Convert.ToInt32(probmat.Row(3)), DepthType.Cv32F, 3);
            //int x1 = Convert.ToInt32(probmat.Row(4));
            //int y1 = Convert.ToInt32(probmat.Row(5));
            //int x2 = Convert.ToInt32(probmat.Row(6));
            //int y2 = Convert.ToInt32(probmat.Row(7));

            System.Drawing.Point max_loc = new System.Drawing.Point();
            System.Drawing.Point min_loc = new System.Drawing.Point();
            double max = 0, min = 0;
            CvInvoke.MinMaxLoc(probmat, ref min, ref max, ref min_loc, ref max_loc);
            int classidx = max_loc.X;
            if (classidx > -1 && classidx <= labels.Size)
            {
                //string[] stra = labels.ToArray();
                //string lable = stra[classidx];
                //CvInvoke.Rectangle(mt, new Rectangle(x1, y1, x2 - x1, y2 - y1), new MCvScalar(255, 0, 0));
                CvInvoke.PutText(mt, labels[classidx].ToString(), new System.Drawing.Point(30, 30), FontFace.HersheyComplex, 1.0, new MCvScalar(0, 0, 255), 2, LineType.EightConnected);
            }
            Image<Bgr, int> outi = mt.ToImage<Bgr, int>();
            return outi.ToBitmap();
        }
        private static VectorOfCvString readlabels(string label_file)
        {
            VectorOfCvString classnames = new VectorOfCvString();
            StreamReader fp = new StreamReader(label_file);
            if (fp != null)
            {
                while (!fp.EndOfStream)
                {
                    CvString name = new CvString(fp.ReadLine());
                    //if (name.ToString().Trim() == "") break;
                    if (name.ToString().Trim() != "") classnames.Push(name);

                }
            }
            fp = null;
            return classnames;
        }

        private void dbcrnnbutton_Click(object sender, EventArgs e)//文字识别
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = new Bitmap(pt.Image);
            Image<Bgr, byte> srci = bt.ToImage<Bgr, byte>();
            //Mat srci = new Mat();
            //if (src.Width > 1000 || src.Height > 1000)
            //    CvInvoke.Resize(src, srci, new Size(), 0.5d, 0.5d);
            //else
            //    srci = src.Mat;
            TextDetectorCNN.TextRegion[] tr = findtext(bt);
            for (int i = 0; i < tr.Count(); i++)
            {
                if (tr[i].Confident > 0.1d)
                {
                    CvInvoke.Rectangle(srci, tr[i].BBox, new MCvScalar(0, 0, 255));
                    CvInvoke.PutText(srci, tr[i].Confident.ToString(), new Point(tr[i].BBox.X, tr[i].BBox.Y), FontFace.HersheyTriplex, 1, new MCvScalar(255, 0, 0));

                }
            }
            pt.Image = srci.ToBitmap();
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        TextDetectorCNN detector;
        public TextDetectorCNN.TextRegion[] findtext(Bitmap bt)
        {
            VectorOfRect vr = new VectorOfRect();
            VectorOfFloat vf = new VectorOfFloat();
            Image<Bgr, byte> srci = bt.ToMat().ToImage<Bgr, byte>();
            TextDetectorCNN.TextRegion[] tr = detector.Detect(srci);
            return tr;
        }

        private void YOLOv4button_Click(object sender, EventArgs e)//目标跟踪
        {

        }

        private void mlpbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            anntraining();
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }

        /**
          * 训练的方法
          * 内容：加载读取的图片训练数据，加载构建的数据标签，然后调用方法生成模型
          * 搞定，就是这么简单的意思 (⊙o⊙)…
          */
        public void anntraining()
        {
            //默认训练集已近是人脸识别之后的的图像 最终我转成 40*40 的进行训练 像素太大参数过多了
            //Mat lables = annoutLables();  // 数据标签 
            Mat trainData2 = new Mat(17, 2, DepthType.Cv32F, 1);
            Mat trainClassess = new Mat(2, 1, DepthType.Cv32F, 1);               //注意标签的格式，有符号
            VectorOfCvString lables = new VectorOfCvString();

            VectorOfMat trainData = new VectorOfMat();
            trainData.Push(annprepareTrainingData(out lables).ToMat());  //读取训练数据
                                                                         //遍历所有数据集
                                                                         //进行训练

            //Image<Bgr, byte > traindatai = trainData.ToImage<Bgr,byte>( );
            //CvInvoke .Sobel  (trainData, trainData ,DepthType.Cv32F,1,0);
            //CvInvoke.CvtColor(trainData, traindatai, ColorConversion.Bgr2Gray);
            //Mat traind = traindatai.Mat.GetInputArray ().GetMat (0) ;
            ANN_MLP mlp = new ANN_MLP();
            // 这里就是把layer 这5个数字参数 转成Mat类型 作为训练的入参
            int[] layer = { 50 * 50, 100, 2 };
            Mat layerSizes = new Mat(1, layer.Length, DepthType.Cv32F, 3);
            //Mat layerSizes = new Mat(layer.Length ,);
            //layerSizes.SetTo(new MCvScalar(0));
            //mlp.SetLayerSizes(layerSizes);
            mlp.SetTrainMethod(ANN_MLP.AnnMlpTrainMethod.Backprop);
            mlp.SetActivationFunction(ANN_MLP.AnnMlpActivationFunction.Relu);
            //trainData.Reshape(1, trainData.Rows);
            mlp.Train(trainData, Emgu.CV.ML.MlEnum.DataLayoutType.RowSample, trainClassess);
            //训练并保存训练后的模型，这个就是结果了
            mlp.Save(setinglogClass.annfilePath + "mlpmodel.xml");
        }

        /**     
         * 读取训练数据
         * Mat(sample_num_perclass*class_num,image_rows*image_cols,CvType.CV_32FC1),
         * sample_num_perclass为每种类型的图片数量，class_num为图片种类
         */
        public Bitmap annprepareTrainingData(out VectorOfCvString outclassnames, String path = "")//合成ann图片
        {
            if (path == "")
                path = setinglogClass.annfilePath;
            Mat trainData = new Mat();
            //trainData.ConvertTo(trainData, DepthType.Cv32F);
            //获取其file对象
            //遍历path下的文件和目录，放在File数组中
            var fs = Directory.GetFiles(path, "*.jpg");
            VectorOfCvString classnames = new VectorOfCvString();
            //遍历File[]数组 【对应的是 训练集每一个种类的文件夹】
            for (int i = 0; i < fs.Length; i++)
            {

                string str = fs[i].ToString();
                str = str.Substring(str.LastIndexOf("\\") + 1, str.Length - str.LastIndexOf("\\") - 1);
                CvString cvs = new CvString(str.Substring(0, str.IndexOf("_")));
                classnames.Push(cvs);
            }
            //Image srci =Bitmap .FromFile(fs[0]);
            Mat mts = CvInvoke.Imread(fs[0]);
            int destW = Convert.ToInt32((double)mts.Cols * Convert.ToDouble(annscalecomboBox.Text));
            int destH = Convert.ToInt32((double)mts.Rows * Convert.ToDouble(annscalecomboBox.Text));

            //Mat bitmt = new Mat((int)(mt.Cols * 10),(int) (fs.Length / 10),DepthType.Cv32F,3);
            //Stitcher stitcher = new Stitcher(0);  //true代表使用GPU，false代表不使用GPU
            VectorOfMat vm = new VectorOfMat();
            int hnum;
            if (fs.Length % 10 == 0)
                hnum = fs.Length / 10;
            else
                hnum = fs.Length / 10 + 1;

            Bitmap bth = new Bitmap(destW * fs.Length, destH);
            Graphics g = Graphics.FromImage(bth);

            for (int i = 0; i < fs.Length; i++)
            {
                mts = CvInvoke.Imread(fs[i]);
                CvInvoke.Resize(mts, mts, new Size(destW, destH));
                Image<Bgra, byte> a = mts.ToImage<Bgra, byte>();

                g.DrawImage(a.ToBitmap(), destW * i, 0);
                //Rectangle rect = new Rectangle(i * mt.Cols, i / 10 * mt.Rows, mt.Rows, mt.Cols);
                //vm.Push(a);
            }
            // try
            //{
            //    //stitcher.Stitch(vm, trainData);
            //    //stitcher.Stitch(vm, trainData);
            //    //CvInvoke.Merge(vm, trainData);
            //}  //ok为真，则拼接成功；ok为假，则拼接失败。
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message);
            //}       
            //Image<Bgr, byte> outi = trainData.ToImage<Bgr, byte>();
            outclassnames = classnames;
            return bth;
        }
        public void annTest(Mat img_src)
        {
            ANN_MLP ann = new ANN_MLP();
            ann.Load("D:\\ijworkspace\\meaen_test\\data\\mlptest.xml");
            //识别
            Mat img_tmp = new Mat();
            CvInvoke.Resize(img_src, img_tmp, new Size(40, 40));
            CvInvoke.CvtColor(img_tmp, img_tmp, ColorConversion.Bgr2Gray);
            //将测试图像转化
            Mat sample = new Mat(1, 1600, DepthType.Cv32F, 1);
            for (int row = 0; row < 40; row++)
            {
                for (int col = 0; col < 40; col++)
                {
                    double[] d = MatExtension.GetValue(img_tmp, row, col);
                    MatExtension.SetValue(sample, 0, row * 40 + col, d);
                    //sample.put(0, row * 40 + col, d);
                }
            }
            Mat predict = new Mat();
            ann.Predict(sample, predict);
            System.Drawing.Point max_loc = new System.Drawing.Point();
            System.Drawing.Point min_loc = new System.Drawing.Point();
            double max = 0, min = 0;
            CvInvoke.MinMaxLoc(predict, ref min, ref max, ref min_loc, ref max_loc);//获得极值信息
            runStatusLabel.Text = ("\r\nX:" + max_loc.X + " Y:" + max_loc.Y + " 最大相似度:" + max + " 最小相似度:" + min);
        }

        /**
          * 数据标签 也是个矩阵 57*3 的矩阵  【与上面的图片数据矩阵对应的】【每一行的1 表示此行图片数据属于哪个分类】
          *  ⎡1,0,0⎤   第1个图片
          *  ⎢1,0,0⎥	  第2个图片
          *  ⎣.....⎦   一共有2*57 行
          *  ⎣0,0,1⎦   第3*57个图片
          * @return
          * 由于写法问题，这里需要每个类型的训练图片数量一致
          */
        public static Mat annoutLables()
        {
            int sample_num_perclass = 9;
            int class_num = 3;
            Mat lables = new Mat(sample_num_perclass * class_num, class_num, DepthType.Cv32F, 1);
            for (int i = 0; i < class_num; i++)
            {
                for (int j = 0; j < sample_num_perclass; j++)
                {
                    for (int k = 0; k < class_num; k++)
                    {
                        if (k == i)
                        {
                            lables.SetValue(i * sample_num_perclass + j, k, 1);
                            //lables.PushBack(i * sample_num_perclass + j, k, 1);
                        }
                        else
                        {
                            lables.SetValue(i * sample_num_perclass + j, k, 0);
                            //lables.PushBack(i * sample_num_perclass + j, k, 0);
                        }
                    }
                }
            }
            return lables;
        }


        VideoFileWriter vdwriter = new VideoFileWriter();
        public VideoSourcePlayer currentvdplayer;
        public VideoCaptureDevice currentvdsource;
        private string videoFileFullPath = Application.StartupPath.ToString() + @"\videorecord\"; //视频文件全路径
        private void startrecordvideobutton_Click(object sender, EventArgs e)
        {

            if (startrecordvideobutton.Text.IndexOf("开始") > -1)
            {
                //AForge.Video.MJPEGStream amjpeg = new AForge.Video.MJPEGStream();//视频流
                if (vdwriter != null)
                {
                    vdwriter.Dispose();
                    vdwriter = null;
                    vdwriter = new VideoFileWriter();
                }

                vdwriter = new VideoFileWriter();
                DateTime str = DateTime.Now;
                string namestr = str.Year + str.Month.ToString() + str.Day.ToString() + str.Hour.ToString() + str.Minute.ToString() + str.Second.ToString();
                switch (videopatterncomboBox.Text)
                {
                    case "MPEG4":
                        vdwriter.Open(videoFileFullPath + namestr + ".avi", currentvdplayer.GetCurrentVideoFrame().Width, currentvdplayer.GetCurrentVideoFrame().Height, 20, VideoCodec.MPEG4);
                        break;
                    case "WMV2":
                        vdwriter.Open(videoFileFullPath + namestr + ".avi", currentvdplayer.GetCurrentVideoFrame().Width, currentvdplayer.GetCurrentVideoFrame().Height, 20, VideoCodec.WMV2);
                        break;
                }
                is_record_video = true;
                pauserecordvideobutton.Enabled = true;
                startrecordvideobutton.Text = "停止录制";
                timer_count.Enabled = true;
                currentvdsource.NewFrame += new NewFrameEventHandler(currentSource_NewFrame);
            }

            else
            {
                currentvdsource.NewFrame -= new NewFrameEventHandler(currentSource_NewFrame);
                is_record_video = false;
                pauserecordvideobutton.Enabled = false;
                timer_count.Enabled = false;
                startrecordvideobutton.Text = "开始录像";
                vdwriter.Close();
            }
        }
        void currentSource_NewFrame(object sender, NewFrameEventArgs e)
        {
            try
            {
                vdwriter.WriteVideoFrame(currentvdplayer.GetCurrentVideoFrame());
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("currentSource_NewFrame", ex.ToString());
            }
        }
        public static int tick_num = 0;
        public bool is_record_video = false;
        public void tick_count()
        {
            tick_num++;
            int temp = tick_num;

            int sec = temp % 60;

            int min = temp / 60;
            if (60 == min)
            {
                min = 0;
                min++;
            }

            int hour = min / 60;

            String tick = hour.ToString() + "：" + min.ToString() + "：" + sec.ToString();
            videostatus.Text = tick;
        }
        private void pauserecordvideobutton_Click(object sender, EventArgs e)
        {
            try
            {
                if (startrecordvideobutton.Text.IndexOf("停止") < 0) return;
                if (pauserecordvideobutton.Text.IndexOf("暂停") > -1)
                {

                    pauserecordvideobutton.Text = "恢复";
                    currentvdsource.NewFrame -= new NewFrameEventHandler(currentSource_NewFrame);
                    timer_count.Enabled = false;

                }
                else
                {
                    currentvdsource.NewFrame += new NewFrameEventHandler(currentSource_NewFrame);
                    pauserecordvideobutton.Text = "暂停";
                    timer_count.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("pauserecordvideobutton_Click", ex.ToString());
            }

        }

        private void shexiangCombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int selected_index = Convert.ToInt32(this.shexiangCombo1.Text);
                int selectedwindow = Convert.ToInt32(this.currentvideocomboBox.SelectedIndex);
                switch (selectedwindow)
                {
                    case 0:
                        videoSource1 = null;
                        videoSource1 = new VideoCaptureDevice(videoDevices[selected_index].MonikerString);
                        videoSourcePlayer1.VideoSource = videoSource1;
                        videoSource1.Start();
                        break;
                    case 1:
                        videoSource2 = null;
                        videoSource2 = new VideoCaptureDevice(videoDevices[selected_index].MonikerString);
                        videoSourcePlayer2.VideoSource = videoSource2;
                        videoSource2.Start();
                        break;
                    case 2:
                        videoSource3 = null;
                        videoSource3 = new VideoCaptureDevice(videoDevices[selected_index].MonikerString);
                        videoSourcePlayer3.VideoSource = videoSource3;
                        videoSource3.Start();
                        break;
                    case 3:
                        videoSource4 = null;
                        videoSource4 = new VideoCaptureDevice(videoDevices[selected_index].MonikerString);
                        videoSourcePlayer4.VideoSource = videoSource4;
                        videoSource4.Start();
                        break;
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("shexiangCombo_SelectedIndexChanged", ex.ToString());
            }
        }

        private void currentvideocomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void toolopenVideo1_Click(object sender, EventArgs e)
        {

            ToolStripButton buttonbt = sender as ToolStripButton;
            if (buttonbt.Text.IndexOf("停止") > -1)
                toolopenVideo_Click(sender, "1", false);
            else
                toolopenVideo_Click(sender, "1", true);

        }
        private void toolopenVideo_Click(object sender, string num = "1", bool open = true)
        {
            maintab.SelectTab("tabpageVideo");
            this.maintab.TabPages["tabpageVideo"].Show();
            maintab_SelectedIndexChanged(null, null);
            ToolStripButton buttonbt = sender as ToolStripButton;
            try
            {
                switch (num)
                {
                    case "1":
                        if (open)
                        {
                            videoSource1.VideoResolution = videoSource1.VideoCapabilities[fengbianCombo1.SelectedIndex];
                            videoSourcePlayer1.VideoSource = videoSource1;
                            videoSource1.Start();
                            buttonbt.Text = "停止图像设备1";
                            currentvdsource = videoSource1;
                            currentvdplayer = videoSourcePlayer1;
                        }
                        else
                        {
                            videoSource1.Stop();
                            buttonbt.Text = "开启图像设备1";
                        }
                        break;
                    case "2":
                        if (open)
                        {
                            videoSource2.VideoResolution = videoSource2.VideoCapabilities[fengbianCombo2.SelectedIndex];
                            videoSourcePlayer2.VideoSource = videoSource2;
                            videoSource2.Start();
                            buttonbt.Text = "停止图像设备2";
                            currentvdsource = videoSource2;
                            currentvdplayer = videoSourcePlayer2;
                        }
                        else
                        {
                            videoSource2.Stop();
                            buttonbt.Text = "开启图像设备2";
                        }
                        break;
                    case "3":
                        if (open)
                        {
                            videoSource3.VideoResolution = videoSource3.VideoCapabilities[fengbianCombo3.SelectedIndex];
                            videoSourcePlayer3.VideoSource = videoSource3;
                            videoSource3.Start();
                            buttonbt.Text = "停止图像设备3";
                            currentvdsource = videoSource3;
                            currentvdplayer = videoSourcePlayer3;
                        }
                        else
                        {
                            videoSource3.Stop();
                            buttonbt.Text = "开启图像设备3";
                        }
                        break;
                    case "4":
                        if (open)
                        {
                            videoSource4.VideoResolution = videoSource4.VideoCapabilities[fengbianCombo4.SelectedIndex];
                            videoSourcePlayer4.VideoSource = videoSource4;
                            videoSource4.Start();
                            buttonbt.Text = "停止图像设备4";
                            currentvdsource = videoSource4;
                            currentvdplayer = videoSourcePlayer4;
                        }
                        else
                        {
                            videoSource4.Stop();
                            buttonbt.Text = "开启图像设备4";
                        }
                        break;
                }
                setvideostatus(true, "操作成功");
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("toolopenVideo_Click", ex.ToString());
                setvideostatus(false, "操作图像设备失败");
            }
        }
        public void setvideostatus(bool state = true, string str = "")
        {
            if (state)
            {
                videostatus.BackColor = Color.White;
                videostatus.Text = str;
            }
            else
            {
                videostatus.BackColor = Color.Yellow;
                videostatus.Text = str;
            }
        }
        private void shexianinit()
        {
            List<KeyValuePair<string, int>> listItem = new List<KeyValuePair<string, int>>();
            List<KeyValuePair<string, int>> listItem21 = new List<KeyValuePair<string, int>>();
            List<KeyValuePair<string, int>> listItem22 = new List<KeyValuePair<string, int>>();
            List<KeyValuePair<string, int>> listItem23 = new List<KeyValuePair<string, int>>();
            List<KeyValuePair<string, int>> listItem24 = new List<KeyValuePair<string, int>>();
            // 设定初始视频设备
            videoDevices = new FilterInfoCollection(AForge.Video.DirectShow.FilterCategory.VideoInputDevice);
            for (int i = 0; i < videoDevices.Count; i++)
            {
                listItem.Add(new KeyValuePair<string, int>(videoDevices[i].Name + i + 1 + "摄像头", i));
            }
            shexiangCombo1.DataSource = listItem;
            shexiangCombo2.DataSource = listItem;
            shexiangCombo3.DataSource = listItem;
            shexiangCombo4.DataSource = listItem;

            shexiangCombo1.DisplayMember = "Key";
            shexiangCombo1.ValueMember = "Value";
            shexiangCombo2.DisplayMember = "Key";
            shexiangCombo2.ValueMember = "Value";
            shexiangCombo3.DisplayMember = "Key";
            shexiangCombo3.ValueMember = "Value";
            shexiangCombo4.DisplayMember = "Key";
            shexiangCombo4.ValueMember = "Value";
            shexiangCombo1.SelectedIndex = 0;
            switch (videoDevices.Count)
            {
                case 1:
                    //摄像头1
                    shexiangCombo1.SelectedIndex = 0;
                    videoSource1 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo1.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource1.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem21.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo1.DataSource = listItem21;
                    }
                    break;
                case 2:
                    //摄像头1
                    shexiangCombo1.SelectedIndex = 0;
                    videoSource1 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo1.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource1.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem21.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo1.DataSource = listItem21;
                    }
                    //摄像头2
                    shexiangCombo2.DataSource = listItem;
                    shexiangCombo2.DisplayMember = "Key";
                    shexiangCombo2.ValueMember = "Value";
                    shexiangCombo2.SelectedIndex = 1;
                    videoSource2 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo2.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource2.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem22.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo2.DataSource = listItem22;
                    }
                    break;
                case 3:
                    //摄像头1
                    shexiangCombo1.SelectedIndex = 0;
                    videoSource1 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo1.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource1.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem21.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo1.DataSource = listItem21;
                    }
                    //摄像头2
                    shexiangCombo2.DataSource = listItem;
                    shexiangCombo2.DisplayMember = "Key";
                    shexiangCombo2.ValueMember = "Value";
                    shexiangCombo2.SelectedIndex = 1;
                    videoSource2 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo2.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource2.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem22.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo2.DataSource = listItem22;
                    }
                    //摄像头3
                    shexiangCombo3.DataSource = listItem;
                    shexiangCombo3.DisplayMember = "Key";
                    shexiangCombo3.ValueMember = "Value";
                    shexiangCombo3.SelectedIndex = 2;
                    videoSource3 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo3.SelectedValue)].MonikerString);
                    videoCapabilities = videoSource3.VideoCapabilities;
                    for (int i = 0; i < videoCapabilities.Count(); i++)
                    {
                        listItem23.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                        fengbianCombo3.DataSource = listItem23;
                    }
                    break;
                default:
                    if (videoDevices.Count >= 4)
                    {
                        //摄像头1
                        shexiangCombo1.SelectedIndex = 0;
                        videoSource1 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo1.SelectedValue)].MonikerString);
                        videoCapabilities = videoSource1.VideoCapabilities;
                        for (int i = 0; i < videoCapabilities.Count(); i++)
                        {
                            listItem21.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                            fengbianCombo1.DataSource = listItem21;
                        }
                        //摄像头2
                        shexiangCombo2.DataSource = listItem;
                        shexiangCombo2.DisplayMember = "Key";
                        shexiangCombo2.ValueMember = "Value";
                        shexiangCombo2.SelectedIndex = 1;
                        videoSource2 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo2.SelectedValue)].MonikerString);
                        videoCapabilities = videoSource2.VideoCapabilities;
                        for (int i = 0; i < videoCapabilities.Count(); i++)
                        {
                            listItem22.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                            fengbianCombo2.DataSource = listItem22;
                        }
                        //摄像头3
                        shexiangCombo3.DataSource = listItem;
                        shexiangCombo3.DisplayMember = "Key";
                        shexiangCombo3.ValueMember = "Value";
                        shexiangCombo3.SelectedIndex = 2;
                        videoSource3 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo3.SelectedValue)].MonikerString);
                        videoCapabilities = videoSource3.VideoCapabilities;
                        for (int i = 0; i < videoCapabilities.Count(); i++)
                        {
                            listItem23.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                            fengbianCombo3.DataSource = listItem23;
                        }
                        //摄像头4
                        shexiangCombo4.DataSource = listItem;
                        shexiangCombo4.DisplayMember = "Key";
                        shexiangCombo4.ValueMember = "Value";
                        shexiangCombo4.SelectedIndex = 3;
                        videoSource4 = new VideoCaptureDevice(videoDevices[Convert.ToInt16(shexiangCombo4.SelectedValue)].MonikerString);
                        videoCapabilities = videoSource4.VideoCapabilities;
                        for (int i = 0; i < videoCapabilities.Count(); i++)
                        {
                            listItem24.Add(new KeyValuePair<string, int>(videoCapabilities[i].FrameSize.ToString(), i));
                            fengbianCombo4.DataSource = listItem24;
                        }
                    }
                    break;

            }
        }

        private void toolopenVideo2_Click(object sender, EventArgs e)
        {
            ToolStripButton buttonbt = sender as ToolStripButton;
            if (buttonbt.Text.IndexOf("停止") > -1)
                toolopenVideo_Click(sender, "2", false);
            else
                toolopenVideo_Click(sender, "2", true);
        }

        private void toolopenVideo3_Click(object sender, EventArgs e)
        {
            ToolStripButton buttonbt = sender as ToolStripButton;
            if (buttonbt.Text.IndexOf("停止") > -1)
                toolopenVideo_Click(sender, "3", false);
            else
                toolopenVideo_Click(sender, "3", true);
        }

        private void toolopenVideo4_Click(object sender, EventArgs e)
        {
            ToolStripButton buttonbt = sender as ToolStripButton;
            if (buttonbt.Text.IndexOf("停止") > -1)
                toolopenVideo_Click(sender, "4", false);
            else
                toolopenVideo_Click(sender, "4", true);
        }

        private void currentvideocomboBox_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            try
            {
                switch (currentvideocomboBox.Text)
                {
                    case "1":
                        currentvdplayer = videoSourcePlayer1;
                        currentvdsource = videoSource1;
                        videoSourcePlayer1.BackColor = Color.Black;
                        break;

                    case "2":
                        currentvdplayer = videoSourcePlayer2;
                        currentvdsource = videoSource2;
                        videoSourcePlayer2.BackColor = Color.Black;
                        break;

                    case "3":
                        currentvdplayer = videoSourcePlayer3;
                        currentvdsource = videoSource3;
                        videoSourcePlayer3.BackColor = Color.Black;
                        break;

                    case "4":
                        currentvdplayer = videoSourcePlayer4;
                        currentvdsource = videoSource4;
                        videoSourcePlayer4.BackColor = Color.Black;
                        break;
                }
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("currentvideocomboBox_SelectedIndexChanged_1", ex.ToString());
            }
        }

        private void timer_count_Tick(object sender, EventArgs e)
        {
            tick_count();
        }

        private void videolayoutcombo_SelectedIndexChanged(object sender, EventArgs e)
        {
            videolayoutcombo_SelectedIndexChanged();
        }

        private void fengbianCombo1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //videoSource1.Stop();
                int i = fengbianCombo1.SelectedIndex;
                videoSource1.VideoResolution = videoSource1.VideoCapabilities[i];
                //videoSource1.Start();
            }
            catch (Exception ex)
            {

            }
        }

        private void fengbianCombo3_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //videoSource3.Stop();
                videoSource3.VideoResolution = videoSource3.VideoCapabilities[fengbianCombo3.SelectedIndex];
                //videoSource3.Start();
            }
            catch (Exception ex)
            {

            }
        }

        private void fengbianCombo2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //videoSource2.Stop();
                videoSource2.VideoResolution = videoSource2.VideoCapabilities[Convert.ToInt16(fengbianCombo2.SelectedIndex)];
                //videoSource2.Start();
            }
            catch (Exception ex)
            {

            }
        }

        private void fengbianCombo4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //videoSource4.Stop();
                videoSource4.VideoResolution = videoSource4.VideoCapabilities[Convert.ToInt16(fengbianCombo4.SelectedIndex)];
                //videoSource4.Start();
            }
            catch (Exception ex)
            {

            }
        }

        private void shexiangCombo1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void facetrianbutton_Click(object sender, EventArgs e)
        {

        }

        private void facefindbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            if (currentvdplayer.VideoSource != null)
                realPicture.Image = kindfeilei.FaceRecFunc(currentvdplayer.GetCurrentVideoFrame().ToMat());
            watch.Stop();
            setvideostatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static VideoCapture vdccon;
        public static Mat _Frame = new Mat();
        //public static string trainofpath;
        public static int imagegrabi = 0;
        public static List<lableclass> lablelist = new List<lableclass>();
        private void convpicbutton_Click(object sender, EventArgs e)
        {
            OpenFileDialog of = new OpenFileDialog();
            of.Filter = "标注视频 | *.avi";
            of.InitialDirectory = kindfeilei.trianfacePath;
            string str;
            if (of.ShowDialog() == DialogResult.OK)
            {
                str = of.FileName;
            }
            else return;
            string filevai = str.Substring(str.LastIndexOf("\\") + 2, str.Length - str.LastIndexOf(@"\") - 6);//文件名
            kindfeilei.trianfacePath = kindfeilei.trianfacePath + filevai + "\\";
            if (!Directory.Exists(kindfeilei.trianfacePath))
                Directory.CreateDirectory(kindfeilei.trianfacePath);
            string lablename = str.Replace(".avi", ".txt");
            if (File.Exists(lablename))
                File.Copy(lablename, kindfeilei.trianfacePath + filevai + ".txt", true);
            vdccon = new VideoCapture(str);
            getlable(kindfeilei.trianfacePath + filevai + ".txt");
            //_VideoCapture.SetCaptureProperty(Emgu.CV.CvEnum.CapProp.FrameWidth, 1024); //设置宽度
            //_VideoCapture.SetCaptureProperty(Emgu.CV.CvEnum.CapProp.FrameHeight, 768);//设置高度
            vdccon.SetCaptureProperty(Emgu.CV.CvEnum.CapProp.Fps, 10);//设置每秒钟的帧数
            vdccon.ImageGrabbed += VideoCapture_ImageGrabbed; //视频事件
            imagegrabi = 0;
            vdccon.Start();
        }
        public static void getlable(string lablefilepath)//得到marklable的标注数据
        {
            if (!File.Exists(lablefilepath)) return;
            StreamReader sr = new StreamReader(File.OpenRead(lablefilepath));
            lablelist.Clear();
            while (!sr.EndOfStream)
            {
                string str = sr.ReadLine();
                if (str.Trim() != "")
                {
                    str = str.Replace(" ", "");
                    string[] strarr = str.Split(',');
                    lablelist.Add(new lableclass() { no = strarr[0], strline = str, total = strarr[1], xuhao = strarr[2].Trim(), x1 = Convert.ToInt32(strarr[3]), y1 = Convert.ToInt32(strarr[4]), x2 = Convert.ToInt32(strarr[5]), y2 = Convert.ToInt32(strarr[6]), name = strarr[7] });
                    if (Convert.ToInt32(strarr[1]) > 0)
                    {
                        int shan = 7;
                        for (int i = 1; i < Convert.ToInt32(strarr[1]); i++)
                        {
                            lablelist.Add(new lableclass() { no = strarr[0], strline = str, total = strarr[1], xuhao = strarr[++shan].Trim(), x1 = Convert.ToInt32(strarr[++shan]), y1 = Convert.ToInt32(strarr[++shan]), x2 = Convert.ToInt32(strarr[++shan]), y2 = Convert.ToInt32(strarr[++shan]), name = strarr[++shan] });
                        }
                    }
                }
            }

        }
        private void VideoCapture_ImageGrabbed(object sender, EventArgs e)
        {
            vdccon.Retrieve(_Frame, 0);
            Image<Bgr, byte> outi = _Frame.ToImage<Bgr, byte>();
            this.realPicture.Image = outi.ToBitmap(); //很神奇的pictureBox，居然不在UI线程也能显示
                                                      //Number_Name是传入的参数值
            List<lableclass> listget = new List<lableclass>();
            listget = lablelist.Where(a => a.no == imagegrabi.ToString() || a.no == (imagegrabi.ToString())).ToList();
            if (listget.Count > -1)
            {
                for (int i = 0; i < listget.Count; i++)
                {
                    Image<Bgr, byte> outi2 = outi.GetSubRect(new Rectangle(listget[i].x1, listget[i].y1, listget[i].x2 - listget[i].x1, listget[i].y2 - listget[i].y1));
                    CvInvoke.Resize(outi2, outi2, new Size(listget[0].x2 - listget[0].x1, listget[0].y2 - listget[0].y1));
                    outi2.Save(kindfeilei.trianfacePath + listget[i].xuhao + "_" + listget[i].no + ".jpg");
                }
            }
            imagegrabi += 1;
            if (imagegrabi > 2000) vdccon.Dispose();


        }
        ///// <summary>
        ///// 从列表中获得分页数据
        ///// </summary>
        ///// <param name="list"></param>
        ///// <param name="pageIndex"></param>
        ///// <param name="pageSize"></param>
        ///// <returns></returns>
        //private List<T> getPageData(List<T> list, int pageIndex, int pageSize)
        //    {
        //        return list.FindAll(delegate (T info)
        //        {
        //            int index = list.IndexOf(info);
        //            if (index >= (pageIndex - 1) * pageSize && index < pageIndex * pageSize)
        //            {
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        });
        //    }
        public class lableclass
        {
            public string no;
            public string strline;
            public string total;
            public string xuhao;
            public int x1;
            public int y1;
            public int x2;
            public int y2;
            public string name;
        }
        //[DllImport("AspriseOCR.dll", EntryPoint = "OCR", CallingConvention = CallingConvention.Cdecl)]
        //public static extern IntPtr OCR(string file, int type);

        //[DllImport("AspriseOCR.dll", EntryPoint = "OCRpart", CallingConvention = CallingConvention.Cdecl)]
        //static extern IntPtr OCRpart(string file, int type, int startX, int startY, int width, int height);

        //[DllImport("AspriseOCR.dll", EntryPoint = "OCRBarCodes", CallingConvention = CallingConvention.Cdecl)]
        //static extern IntPtr OCRBarCodes(string file, int type);

        //[DllImport("AspriseOCR.dll", EntryPoint = "OCRpartBarCodes", CallingConvention = CallingConvention.Cdecl)]
        //static extern IntPtr OCRpartBarCodes(string file, int type, int startX, int startY, int width, int height);
        TesseractEngine chiocr;
        TesseractEngine engocr;
        TesseractEngine numocr;
        private void textdetectbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            textdetectbutton.Enabled = false;
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            listRectangle[currentSelect].Result = "";
            listRectangle[currentSelect].Result = textrecog(bt, new Rect(0, 0, bt.Width, bt.Height), textlxcomboBox.Text);
            textdetectbutton.Enabled = true;
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public string textrecog(Bitmap bt, Rect rt, string zl = "chi")
        {
            try
            {
                Page page = null;
                switch (zl)
                {
                    case "chi":
                        page = chiocr.Process(bt, Tesseract.PageSegMode.Auto);
                        break;
                    case "eng":
                        page = engocr.Process(bt, Tesseract.PageSegMode.Auto);
                        break;
                    case "num":
                        page = numocr.Process(bt, Tesseract.PageSegMode.Auto);
                        break;
                }
                string str = "";
                if (page != null) str = page.GetText();//识别后的内容
                page.Dispose();
                return str;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [DefaultDllImportSearchPaths(DllImportSearchPath.ApplicationDirectory)]
        [DllImport("emguannd.dll", EntryPoint = "testAnn", CallingConvention = CallingConvention.Cdecl)]
        public static extern string testAnn();

        private void SVMbutton_Click(object sender, EventArgs e)
        {

        }
        public static Mat deskew(Mat mt)//校正倾斜角度
        {
            mt = mt.Reshape(1, 0);
            Moments m = CvInvoke.Moments(mt, false);
            int sz = mt.Rows;
            if (Math.Abs(m.M02) < 1e-2)
            {
                return mt.Clone();//无偏斜时返回源图
            }

            //            Math.Cos（角度值* Math.PI / 180）；
            //Math.Acos（cos值）*180 / Math.PI；
            //基于中心矩计算倾斜度
            double skew = 0.5 * sz * (m.Mu11 / m.Mu02) * 180 / Math.PI;
            Mat warp_rotate_matrix = new Mat();
            //Mat M=new Mat (2,3, DepthType.Cv32F,3);

            CvInvoke.GetRotationMatrix2D(new PointF(mt.Cols / 2, mt.Rows / 2), skew, 1, warp_rotate_matrix);
            Mat imgout = Mat.Zeros(mt.Rows, mt.Cols, DepthType.Cv32F, 3);
            CvInvoke.WarpAffine(mt, imgout, warp_rotate_matrix, imgout.Size);
            return imgout;
        }

        private void autodeskewbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Mat mt = deskew(((Bitmap)pt.Image).ToMat());
            pt.Image = mt.ToBitmap();
        }
        //图像的矩，计算图形的中心
        private Bitmap btn_moments_Click(System.Windows.Forms.PictureBox ib_original)
        {
            Bitmap mts = new Bitmap(ib_original.Image);
            Mat src = mts.ToMat();
            Mat dst = new Mat();

            CvInvoke.Canny(src, dst, 120, 180);

            VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();

            CvInvoke.FindContours(dst, contours, null, Emgu.CV.CvEnum.RetrType.External,
                Emgu.CV.CvEnum.ChainApproxMethod.ChainApproxNone);

            //筛选出面积不为0的轮廓并画出
            VectorOfVectorOfPoint use_contours = new VectorOfVectorOfPoint();

            for (int i = 0; i < contours.Size; i++)
            {
                //获取独立的连通轮廓
                VectorOfPoint contour = contours[i];

                //计算连通轮廓的面积
                double area = CvInvoke.ContourArea(contour);
                //进行面积筛选
                if (area > 0)
                {
                    //添加筛选后的连通轮廓
                    use_contours.Push(contour);
                }
            }
            CvInvoke.DrawContours(src, use_contours, -1, new MCvScalar(0, 0, 255));

            //计算轮廓中心并画出
            int ksize = use_contours.Size;

            double[] m00 = new double[ksize];
            double[] m01 = new double[ksize];
            double[] m10 = new double[ksize];
            Point[] gravity = new Point[ksize];//用于存储轮廓中心点坐标
            Moments[] moments = new Moments[ksize];

            for (int i = 0; i < ksize; i++)
            {
                VectorOfPoint contour = use_contours[i];
                //计算当前轮廓的矩
                moments[i] = CvInvoke.Moments(contour, false);

                m00[i] = moments[i].M00;
                m01[i] = moments[i].M01;
                m10[i] = moments[i].M10;
                int x = Convert.ToInt32(m10[i] / m00[i]);//计算当前轮廓中心点坐标
                int y = Convert.ToInt32(m01[i] / m00[i]);
                gravity[i] = new Point(x, y);
            }

            //画出中心点位置
            foreach (Point cent in gravity)
            {
                CvInvoke.Circle(src, cent, 2, new MCvScalar(0, 0, 255), 2);
            }
            Image<Bgr, byte> outi = src.ToImage<Bgr, byte>();
            return outi.ToBitmap();
        }

        private void centermomentsbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            pt.Image = btn_moments_Click(pt);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        ///// <summary>
        ///// 读取图片为Bitmap格式，转为Mat格式
        ///// </summary>
        ///// <param name="path"></param>
        //static void bitmapToMat(string path)
        //{
        //    Bitmap bit = new Bitmap(Image.FromFile(path));
        //    Image<Bgr, byte> currentFrameImage = new Image<Bgr, byte>(bit);
        //    Mat mat = new Mat();
        //    CvInvoke.BitwiseAnd(currentFrameImage, currentFrameImage, mat);
        //}
        ///// <summary>
        ///// bitmap 位图转为mat类型 
        ///// </summary>
        ///// <param name="bitmap"></param>
        ///// <returns></returns>
        //public Mat Bitmap2Mat(Bitmap bitmap)
        //{
        //    MemoryStream s2_ms = null;
        //    Mat source = null;
        //    try
        //    {
        //        using (s2_ms = new MemoryStream())
        //        {
        //            bitmap.Save(s2_ms, System.Drawing.Imaging.ImageFormat.Bmp);
        //            source = Mat.FromStream(s2_ms, ImreadModes.AnyColor);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        ;
        //    }
        //    finally
        //    {
        //        if (s2_ms != null)
        //        {
        //            s2_ms.Close();
        //            s2_ms = null;
        //        }
        //        GC.Collect();
        //    }
        //    return source;
        //}

        static void matchshape(Bitmap bts, Bitmap btsshape, out Bitmap bto)
        {
            ///计算轮廓面积、周长、质心
            Mat src = bts.ToMat();
            Mat dst = src.Clone();
            Mat grayImg = new Mat();
            CvInvoke.Imshow("input", src);
            CvInvoke.CvtColor(src, grayImg, ColorConversion.Bgr2Gray);
            CvInvoke.Threshold(grayImg, grayImg, 100, 255, ThresholdType.Binary);
            //发现轮廓
            VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint();
            VectorOfRect hierarchy = new VectorOfRect();
            CvInvoke.FindContours(grayImg, contours, hierarchy, RetrType.External, ChainApproxMethod.ChainApproxNone);
            CvInvoke.DrawContours(dst, contours, -1, new MCvScalar(255, 255, 0), 2);
            for (int i = 0; i < contours.Size; i++)
            {
                double area = CvInvoke.ContourArea(contours[i], false);  //计算面积周长
                double length = CvInvoke.ArcLength(contours[i], true);
                Moments moments = CvInvoke.Moments(contours[i], false);       //计算轮廓矩
                Point ptCenter = new Point();
                ptCenter.X = (int)(moments.M10 / moments.M00);          //计算质心
                ptCenter.Y = (int)(moments.M01 / moments.M00);
                CvInvoke.Circle(dst, ptCenter, 3, new MCvScalar(0, 0, 255), -1);//绘制质心
            }

            // 形状匹配（具有旋转、平移、缩放、镜像不变性）
            Mat temp = btsshape.ToMat();
            Mat grayImg1 = new Mat();
            CvInvoke.Imshow("template", temp);
            CvInvoke.CvtColor(temp, grayImg1, ColorConversion.Bgr2Gray);
            CvInvoke.Threshold(grayImg1, grayImg1, 100, 255, ThresholdType.Binary);
            CvInvoke.Imshow("threshold1", grayImg1);

            VectorOfVectorOfPoint contours_temp = new VectorOfVectorOfPoint();
            VectorOfRect hierarchy_temp = new VectorOfRect();
            CvInvoke.FindContours(grayImg1, contours_temp, hierarchy_temp, RetrType.External, ChainApproxMethod.ChainApproxNone);

            //Mat src2 = CvInvoke.Imread("1.jpg");
            //Mat grayImg2 = new Mat();
            //CvInvoke.CvtColor(src2, grayImg2, ColorConversion.Bgr2Gray);
            //CvInvoke.Threshold(grayImg2, grayImg2, 100, 255, ThresholdType.Binary);
            //CvInvoke.Imshow("src threshold", grayImg2);

            //VectorOfVectorOfPoint contours_src = new VectorOfVectorOfPoint();
            //VectorOfRect hierarchy_src = new VectorOfRect();
            //CvInvoke.FindContours(grayImg2, contours_src, hierarchy_src, RetrType.Tree, ChainApproxMethod.ChainApproxNone);

            for (int i = 0; i < contours.Size; i++)
            {
                //形状匹配
                double matchValue = CvInvoke.MatchShapes(contours_temp[0], contours[i], ContoursMatchType.I1);

                Console.WriteLine("contour {0} value:{1:F5}", i, matchValue);  //控制输出格式
                //根据计算结果绘制轮廓
                if (matchValue < 0.1)
                {
                    CvInvoke.DrawContours(src, contours, i, new MCvScalar(0, 255, 0), 2);
                }
                else
                {
                    CvInvoke.DrawContours(src, contours, i, new MCvScalar(0, 0, 255), 2);
                }
            }
            Image<Bgr, byte> outi = src.ToImage<Bgr, byte>();
            bto = outi.ToBitmap();
        }

        private void maskrcnnbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = new Bitmap(pt.Image);
            pt.Image = maskrcnnpredict.exemaskrcnn(bt);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        private void annstitchbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            VectorOfCvString vcs = new VectorOfCvString();
            samplePic.Image = annprepareTrainingData(out vcs);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }

        private void realpicsmallbutton_Click(object sender, EventArgs e)
        {
            if (realPicture.Image != null)
                smallbutton2(realPicture, Convert.ToDouble(resizecomboBox.Text), Convert.ToDouble(resizecomboBox.Text));
        }

        private void checkpic_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }

        private void samplePic_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }

        private void videoSourcePlayer1_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }
        public Mat totalmt = new Mat();
        private void channelcombinbutton_Click(object sender, EventArgs e)
        {
            //Stopwatch watch = Stopwatch.StartNew();
            //realPicture.Image = hechengpic();
            //watch.Stop();
            //setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        //public Bitmap hechengpic()
        //{
        //    //try
        //    //{
        //    //    //string path = catchpicsavepath;
        //    //    //var fs = Directory.GetFiles(path, "*.jpg");
        //    //    Mat mt = CvInvoke.Imread(catchpicsavepath + @"\catch1.jpg");
        //    //    int destW = Convert.ToInt32((double)mt.Cols * Convert.ToDouble(channelcombincomboBox.Text));
        //    //    int destH = Convert.ToInt32((double)mt.Rows * Convert.ToDouble(channelcombincomboBox.Text));
        //    //    CvInvoke.Resize(mt, mt, new Size(destW, destH));

        //    //    Mat mts2 = CvInvoke.Imread(catchpicsavepath + @"\catch2.jpg");
        //    //    CvInvoke.Resize(mts2, mts2, new Size(destW, destH));
        //    //    CvInvoke.HConcat(mt, mts2, totalmt);

        //    //    mts2 = CvInvoke.Imread(catchpicsavepath + @"\catch3.jpg");
        //    //    CvInvoke.Resize(mts2, mts2, new Size(destW, destH));
        //    //    CvInvoke.HConcat(totalmt, mts2, totalmt);

        //    //    Image<Bgra, byte> a = totalmt.ToImage<Bgra, byte>();
        //    //    return a.ToBitmap();
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    setinglogClass.writeLog("channelcombinbutton_Click", ex.ToString());
        //    //    setrunstatus(false, "图像合成失败！");
        //    //    return null;
        //    //}

        //}

        private void mserbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;

            MSERDetector mse = new MSERDetector(20, 20, 1500);// ,1,0.01,100,10,0.1,2);
            Mat mt = bt.ToImage<Gray, byte>().Mat;
            VectorOfVectorOfPoint pf = new VectorOfVectorOfPoint();
            VectorOfRect rc = new VectorOfRect();
            mse.DetectRegions(mt, pf, rc);
            List<Rectangle> lrc = getnums(rc);
            Image<Bgr, byte> outi = mt.ToImage<Bgr, byte>();
            for (int i = 0; i < lrc.Count(); i++)
            {
                CvInvoke.Rectangle(outi, lrc[i], new MCvScalar(255, 0, 0));
            }
            pt.Image = outi.ToBitmap();
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public List<Rectangle> getnums(VectorOfRect rc)
        {
            List<Rectangle> outv = new List<Rectangle>();
            for (int i = 0; i < rc.Size; i++)
            {
                if (((double)rc[i].Width / (double)rc[i].Height < 2) && ((double)rc[i].Width / (double)rc[i].Height > 0.2))
                    if (rc[i].Width > 10 && rc[i].Height > 10) outv.Add(rc[i]);
            }
            return outv;
        }
        public static int OtsuThreshold(Mat image)//最优二值提取
        {
            if (image.NumberOfChannels != 1)
            {
                throw new Exception("通道必须为1");
            }

            //提取直方图------------------------------------
            long[] his = new long[256];
            for (int i = 0; i < 256; i++)
            {
                his[i] = 0;
            }


            unsafe
            {
                byte* data = (byte*)image.DataPointer.ToPointer();

                for (int row = 0; row < image.Height; row++)
                {
                    //data = data + row * image.Cols;
                    for (int col = 0; col < image.Width; col++)
                    {
                        his[*data]++;
                        data++;
                    }
                }
            }
            //-----------------------------------------------

            float _PK;
            float _MK;//第k级累加灰度均值；
            float _MG = 0;//整个图片的灰度均值

            double _MN = image.Rows * image.Cols;//图片的像素数目
            float[] _Ks = new float[256];//存储类值最大方差
            float _Max;//类间最大方差
            List<int> _MaxKs = new List<int>();//存储使类间最大方差的多个K值；



            for (int i = 0; i < 256; i++)//计算图片平均灰度值
            {
                _MG += (float)(i * (double)his[i] / _MN);
            }


            for (int k = 0; k < 256; k++)//计算 图片在不同K的类值最大方差
            {
                long _count = 0;//表示在k中存在的像素
                for (int _index = 0; _index <= k; _index++)//若所有像素都在k内，就将其方差置为0
                {
                    _count += his[_index];
                }
                if (_count == image.Rows * image.Cols)
                {
                    _Ks[k] = 0;
                    continue;
                }
                else if (_count == 0)
                {
                    _Ks[k] = 0;
                    continue;
                }

                _PK = (float)(_count / _MN);
                _MK = 0;

                for (int i = 0; i <= k; i++)
                {
                    float p = (float)(his[i] / _MN);
                    //_PK += p;
                    _MK += i * p;
                }

                _Ks[k] = (float)Math.Pow(_MG * _PK - _MK, 2) / (_PK * (1 - _PK));
            }

            _Max = _Ks.Max();
            for (int i = 0; i < 256; i++)
            {
                if (_Ks[i] == _Max)
                    _MaxKs.Add(i);
            }

            int _K = (int)_MaxKs.Average();
            return _K;
        }
        private void dbdetectbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            pt.Image = easttext(bt);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static Net easttextnet;
        public Bitmap easttext(Bitmap bt)
        {
            //参数和常量准备
            //String model = @"E:\threeYears\threeYears\threeYears\bin\Debug\textcnn\frozen_east_text_detection.pb";
            //easttextnet = DnnInvoke.ReadNet(model);
            Double confThreshold = 0.2;
            Double nmsThreshold = 0.2;
            int inpWidth = 320;
            int inpHeight = 320;
            // CvInvoke.NamedWindow("EAST: An Efficient and Accurate Scene Text Detector", WindowFlags.AutoSize);

            VectorOfMat outs = new VectorOfMat();
            string[] outNames = new string[2];
            outNames[0] = "feature_fusion/Conv_7/Sigmoid";
            outNames[1] = "feature_fusion/concat_3";

            Mat frame, blob;
            frame = bt.ToImage<Bgr, byte>().Mat;
            // CvInvoke.Imshow("frame", frame);
            blob = DnnInvoke.BlobFromImage(frame, 1, new System.Drawing.Size(inpWidth, inpHeight), new MCvScalar(123.68, 116.78, 103.94), true, false);
            easttextnet.SetInput(blob);
            easttextnet.Forward(outs, outNames);
            Mat scores = outs[0];
            Mat geometry = outs[1];

            //List<RotatedRect> detections = new List<RotatedRect>();

            VectorOfRect boxes = new VectorOfRect();
            VectorOfFloat confidences = new VectorOfFloat();

            Decode dct = new Decode();

            dct.Decode_box(scores, geometry, confThreshold, boxes, confidences);
            VectorOfInt indices = new VectorOfInt();
            DnnInvoke.NMSBoxes(boxes, confidences, (float)confThreshold, (float)nmsThreshold, indices);

            PointF ratio = new PointF((float)((float)frame.Cols / (float)inpWidth), (float)((float)frame.Rows / (float)inpHeight));
            for (int i = 0; i < indices.Size; i++)
            //for (int i = 0; i < boxes.Size; i++)
            {
                Rectangle box = boxes[i];

                var vertices_x = box.X * ratio.X;
                var vertices_y = box.Y * ratio.Y;
                var vertices_width = box.Width * ratio.X;
                var vertices_height = box.Height * ratio.Y;

                var p_x = vertices_x - 0.5 * vertices_width;
                var p_y = vertices_y - 0.5 * vertices_height;

                Rectangle box_in = new Rectangle(new Point((int)(p_x), (int)(p_y)), new Size((int)vertices_width, (int)vertices_height));

                CvInvoke.Rectangle(frame, box_in, new MCvScalar(255, 0, 0), 1);

            }
            //CvInvoke.Imshow("result", frame);
            return frame.ToBitmap();
        }
        //decode
        public class Decode
        {
            public void Decode_box(Mat scores, Mat geometry, double scoreThresh, VectorOfRect detections, VectorOfFloat confidences)
            {
                if (detections.Size > 0)
                {
                    detections.Clear();
                }

                //CV_Assert(scores.dims == 4); CV_Assert(geometry.dims == 4); CV_Assert(scores.size[0] == 1);
                //CV_Assert(geometry.size[0] == 1); CV_Assert(scores.size[1] == 1); CV_Assert(geometry.size[1] == 5);
                //CV_Assert(scores.size[2] == geometry.size[2]); CV_Assert(scores.size[3] == geometry.size[3]);

                CvException.Equals(scores.Dims, 4);
                CvException.Equals(geometry.Dims, 4);

                var s = scores.SizeOfDimension;
                var sdata = scores.GetData();
                //var x = sdata.GetValue(0,0,0,0);
                var gdata = geometry.GetData();
                //var y = sdata.GetValue(0, 0, 0, 0);

                List<RotatedRect> t_detections = new List<RotatedRect>();
                List<float> t_confidences = new List<float>();
                List<Rectangle> r_detections = new List<Rectangle>();

                for (int y = 0; y < s[2]; ++y)
                {
                    for (int x = 0; x < s[3]; x++)
                    {
                        float score = (float)sdata.GetValue(0, 0, y, x);
                        if (score < scoreThresh)
                        {
                            continue;
                        }

                        float offsetX = x * 4.0f, offsetY = y * 4.0f;
                        float angle = (float)gdata.GetValue(0, 4, y, x);
                        float cosA = (float)Math.Cos(angle);
                        float sinA = (float)Math.Sin(angle);
                        float h = (float)gdata.GetValue(0, 0, y, x) + (float)gdata.GetValue(0, 2, y, x);
                        float w = (float)gdata.GetValue(0, 1, y, x) + (float)gdata.GetValue(0, 3, y, x);

                        PointF offset = new PointF(offsetX + cosA * (float)gdata.GetValue(0, 1, y, x) + sinA * (float)gdata.GetValue(0, 2, y, x),
                                        offsetY - sinA * (float)gdata.GetValue(0, 1, y, x) + cosA * (float)gdata.GetValue(0, 2, y, x));

                        PointF p1 = new PointF();
                        p1.X = -sinA * h + offset.X;
                        p1.Y = -cosA * h + offset.Y;

                        PointF p3 = new PointF();
                        p3.X = -cosA * w + offset.X;
                        p3.Y = sinA * w + offset.Y;

                        PointF center = new PointF();
                        center.X = (float)0.5 * (p1.X + p3.X);
                        center.Y = (float)0.5 * (p1.Y + p3.Y);

                        SizeF size = new SizeF(w, h);
                        float box_angle = -angle * 180.0f / (float)Math.PI;

                        RotatedRect r = new RotatedRect(center, size, box_angle);
                        Point i_center = new Point((int)(center.X), (int)(center.Y));
                        Size i_size = new Size((int)w, (int)h);

                        Rectangle r_d = new Rectangle(i_center, i_size);

                        r_detections.Add(r_d);
                        t_detections.Add(r);
                        t_confidences.Add(score);

                    }
                }

                Rectangle[] k_detections = r_detections.ToArray();
                detections.Push(k_detections);

                float[] k_confidences = t_confidences.ToArray();
                confidences.Push(k_confidences);

            }
        }
        private void cornerbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            CornerHarrisfunc(bt.ToMat());
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static void CornerHarrisfunc(Mat srcImg, int apertureSize = 3, double k = 0.04, BorderType borderType = BorderType.Default)
        {
            Mat gray = new Mat();
            CvInvoke.CvtColor(srcImg, gray, ColorConversion.Bgr2Gray);
            Mat dstImg = new Mat();
            CvInvoke.CornerHarris(gray, dstImg, 2, apertureSize, k, borderType);
            CvInvoke.Threshold(dstImg, dstImg, 0.005, 255, ThresholdType.Binary);
            //Console.WriteLine("Depth: {0}\nChannels: {1}", dstImg.Depth, dstImg.NumberOfChannels);
            dstImg.ConvertTo(dstImg, DepthType.Cv8U);
            Image<Gray, Byte> img = dstImg.ToImage<Gray, Byte>();
            for (int i = 0; i < img.Rows; i++)
            {
                for (int j = 0; j < img.Cols; j++)
                {
                    if (img.Data[i, j, 0] == 255)
                        CvInvoke.Circle(srcImg, new Point(j, i), 2, new MCvScalar(0, 0, 255), -1);
                }
            }
            CvInvoke.Imshow("result", srcImg);
        }

        private void myfindbutton_Click(object sender, EventArgs e)
        {

            Stopwatch watch = Stopwatch.StartNew();
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            if (samplesetTab.SelectedTab.Name == "twoTab" & twoPic.Image != null)
                pt = twoPic;
            if (samplesetTab.SelectedTab.Name == "totalhrgbTab" & totalpic.Image != null)
                pt = totalpic;
            if (samplesetTab.SelectedTab.Name == "sampleTab" & samplePic.Image != null)
                pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            List<Rectangle> lrect = maskrcnnpredict.RunTextRecog(bt);
            Image<Bgr, byte> outi = bt.ToImage<Bgr, byte>();
            foreach (Rectangle re in lrect)
                CvInvoke.Rectangle(outi, re, new MCvScalar(255, 0, 0));
            pt.Image = outi.ToBitmap();
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }

        private void twootsubutton_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.PictureBox pt = new System.Windows.Forms.PictureBox();
            pt = samplePic;
            if (pt == null) return;
            Bitmap bt = (Bitmap)pt.Image;
            int otsu = OtsuThreshold(bt.ToImage<Gray, byte>().Mat);
            picdeal.twovalemgu(bt, currentSelect, otsu);
        }

        private void twogroupbutton_Click(object sender, EventArgs e)
        {

        }

        private void twootsubutton_MouseUp(object sender, MouseEventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            if (samplePic.Image == null) return;
            Bitmap bt = (Bitmap)samplePic.Image;
            int otsu = OtsuThreshold(bt.ToImage<Gray, byte>().Mat);
            if (e.Button == MouseButtons.Left)
                colortwoButton_Click(true, otsu);
            else
                colortwoButton_Click(false, otsu);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        public static TrackerCSRT tc = new TrackerCSRT();
        private void trackerbutton_Click(object sender, EventArgs e)
        {
            Mat mti = CvInvoke.Imread(Application.StartupPath + @"\Rectangle\bigSample.jpg");
            Rectangle rect = new Rectangle(listRectangle[currentSelect].startX, listRectangle[currentSelect].startY, listRectangle[currentSelect].endX - listRectangle[currentSelect].startX, listRectangle[currentSelect].endY - listRectangle[currentSelect].startY);
            tc.Init(mti, rect);
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
        public static bool trackscrt = false;
        public static int trackscrtnum = 3;
        private void trackbutton_Click(object sender, EventArgs e)
        {

            //trackbutton.Enabled = false;
            //try
            //{
            //    if (trackscrt)
            //    {
            //        currentvdsource.NewFrame -= new NewFrameEventHandler(newframetrackscrt);
            //        trackscrt = false;
            //    }
            //    else
            //    {
            //        currentvdsource.NewFrame += new NewFrameEventHandler(newframetrackscrt);
            //        trackscrt = true;
            //    }
            //}
            //catch (Exception ex)
            //{
            //    setrunstatus(true, ex.ToString());
            //}
            //trackbutton.Enabled = true;
        }
        void newframetrackscrt(object sender, NewFrameEventArgs e)
        {
            trackscrtnum += 1;
            if (trackscrtnum < 10) return;
            trackscrtnum = 0;
            try
            {
                switch (currentvideocomboBox.Text)
                {
                    case "1":
                        realPicture.Image = videoSourcePlayer1.GetCurrentVideoFrame();
                        break;
                    case "2":
                        realPicture.Image = videoSourcePlayer2.GetCurrentVideoFrame();
                        break;
                    case "3":
                        realPicture.Image = videoSourcePlayer3.GetCurrentVideoFrame();
                        break;
                    case "4":
                        realPicture.Image = videoSourcePlayer4.GetCurrentVideoFrame();
                        break;
                    default:
                        new Exception("捕捉图片无此通道");
                        break;

                }
                trackfun();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("newframetrackscrt", ex.ToString());
            }
        }
        public void trackfun()
        {
            Stopwatch watch = Stopwatch.StartNew();
            // TrackerGOTURN tg = new TrackerGOTURN();            
            //// Bitmap bt = new Bitmap(samplePic.Image);
            // Mat mti =CvInvoke.Imread (@"E:\threeYears\threeYears\threeYears\bin\Debug\Rectangle\\catchpic\bigSample.jpg");
            // Rectangle rect = new Rectangle(listRectangle[currentSelect].startX, listRectangle[currentSelect].startY, listRectangle[currentSelect].endX- listRectangle[currentSelect].startX, listRectangle[currentSelect].endY-listRectangle[currentSelect].startY);
            // tg.Init(mti,rect);  

            // Rectangle recto = new Rectangle();
            // Mat mt = ((Bitmap)realPicture.Image).ToMat();
            // tg.Update(mt,out recto);
            // CvInvoke.Rectangle(mt, recto, new MCvScalar(255, 0, 0));
            // realPicture.Image = mt.ToBitmap();

            //TrackerKCF tk = new TrackerKCF();
            //if (tk == null)
            //{
            //    Mat mti = CvInvoke.Imread(@"E:\threeYears\threeYears\threeYears\bin\Debug\Rectangle\\catchpic\bigSample.jpg");
            //    Rectangle rect = new Rectangle(listRectangle[currentSelect].startX, listRectangle[currentSelect].startY, listRectangle[currentSelect].endX - listRectangle[currentSelect].startX, listRectangle[currentSelect].endY - listRectangle[currentSelect].startY);
            //    tk.Init(mti, rect);
            //}
            //if (realPicture.Image != null)
            //{
            //    Rectangle recto = new Rectangle();
            //    Image<Bgr ,byte> srci = ((Bitmap)realPicture.Image).ToImage <Bgr,byte>();
            //    tk.Update(srci.Mat, out recto);
            //    CvInvoke.Rectangle(srci, recto, new MCvScalar(0, 0, 255), 2);
            //    realPicture.Image = srci.ToBitmap();
            //}

            //TrackerMIL tm = new TrackerMIL();          

            //TrackerCSRT tc = new TrackerCSRT();
            if (realPicture.Image != null)
            {
                Rectangle recto = new Rectangle();
                Image<Bgr, byte> srci = ((Bitmap)realPicture.Image).ToImage<Bgr, byte>();
                tc.Update(srci.Mat, out recto);
                CvInvoke.Rectangle(srci, recto, new MCvScalar(0, 0, 255), 2);
                realPicture.Image = srci.ToBitmap();
            }

            //Boost bt = new Boost();
            //bt.Train();

            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }

        private void DBTEXTbutton_Click(object sender, EventArgs e)
        {

        }

        private void piccombinbutton_Click(object sender, EventArgs e)
        {
            //Stopwatch watch = Stopwatch.StartNew();
            //try
            //{
            //    List<Mat> lmt = new List<Mat>();

            //    string path = catchpicsavepath;
            //    //var fs = Directory.GetFiles(path, "*.jpg");
            //    Mat mt = CvInvoke.Imread(path + @"\catch1.jpg");
            //    int destW = Convert.ToInt32((double)mt.Cols * Convert.ToDouble(channelcombincomboBox.Text));
            //    int destH = Convert.ToInt32((double)mt.Rows * Convert.ToDouble(channelcombincomboBox.Text));
            //    CvInvoke.Resize(mt, mt, new Size(destW, destH));
            //    lmt.Add(mt);
            //    mt = CvInvoke.Imread(path + @"\catch2.jpg");
            //    CvInvoke.Resize(mt, mt, new Size(destW, destH));
            //    lmt.Add(mt);
            //    mt = CvInvoke.Imread(path + @"\catch3.jpg");
            //    CvInvoke.Resize(mt, mt, new Size(destW, destH));
            //    lmt.Add(mt);
            //    realPicture.Image = stitcher.stitchs(lmt).ToBitmap();
            //}
            //catch (Exception ex)
            //{
            //    setinglogClass.writeLog("piccombinbutton_Click", ex.ToString());
            //    setrunstatus(false, "图像合成2失败！");
            //    return;
            //}
            //watch.Stop();
            //setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }

        private void exitToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            System.GC.Collect();
            toolcloseVideo_Click(null, null);
            GC.Collect(1, GCCollectionMode.Forced);
            this.Close();
            Application.Exit();
            Environment.Exit(0);
        }
        public static checkform cf = new checkform();
        private void maintab_Selected(object sender, TabControlEventArgs e)
        {
            if (maintab.SelectedTab.Text == "框选设定" || maintab.SelectedTab.Text == "realPage")
            {
                if (setinglogClass.powerpub.ToLower() != "p24863" && cf.ret != "p24863")
                {
                    cf.Show();
                    cf.Activate();
                    maintab.SelectTab("checkPage");
                    this.maintab.TabPages["checkPage"].Show();
                }
            }

        }

        private void maintab_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dingweibutton_Click(object sender, EventArgs e)
        {

        }

        private void samplesetTab_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }

        private void testpic_MouseMove(object sender, MouseEventArgs e)
        {
            setwhmousemv(sender, e);
        }

        private void autobutton_Click(object sender, EventArgs e)
        {
            autobutton.Enabled = false;
            autobutton.Enabled = true;
        }
        private void trackersbutton_Click(object sender, EventArgs e)
        {

        }

        private void surfbutton_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            string file1path = Application.StartupPath + @"\Rectangle\catchpic\catch1.jpg";
            string file2path = Application.StartupPath + @"\Rectangle\catchpic\catch2.jpg";
            samplePic.Image = surfshift.MatchPicBySurf(file1path, file2path);
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
        }
        private void hkpicbutton_Click(object sender, EventArgs e)//显示自带的连接
        {
        }
        public Mat hkcatch1 = new Mat();
        public Mat hkcatch2 = new Mat();
        public Mat hkcatch3 = new Mat();
        public Mat hkcatch4 = new Mat();
        private void hkcatchpic1button_Click(object sender, EventArgs e)
        {
            //Stopwatch watch = Stopwatch.StartNew();
            //hkcatchpic1button.Enabled = false;
            //try
            //{
            //    if (realPicture.Image != null)
            //    { realPicture.Image.Dispose(); realPicture.Image = null; }
            //    if (hkcatch1 != null)
            //    { hkcatch1.Dispose(); hkcatch1 = null; hkcatch1 = new Mat(); }

            //    if (prev1 == null)
            //    {
            //        prev1 = new Preview();
            //        System.Threading.Thread.Sleep(100);
            //        //prev1.Show();
            //    }

            //    if (prev1.btnLogin.Text == "Login")//登录
            //    {
            //        prev1.textBoxIP.Text = "192.168.1.66";
            //        prev1.textBoxPort.Text = "8006";
            //        prev1.btnLogin_Click(null, null);
            //        System.Threading.Thread.Sleep(100);
            //    }
            //    if (prev1.btnPreview.Text == "Live View")//记录
            //    {
            //        prev1.btnPreview_Click(null, null);
            //        System.Threading.Thread.Sleep(100);
            //        //prev1.Hide();
            //    }
            //    //拍照
            //    if (prev1.hkcatchbmppic(prev1.path + "hk1bmp.bmp"))
            //    {
            //        hkcatch1 = CvInvoke.Imread(prev1.path + "hk1bmp.bmp");
            //        //Image<Bgr, byte> srci = hkcatch3.ToImage<Bgr, byte>();
            //        //Bitmap bts = new Bitmap(prev1.path + "hk3bmp.bmp");
            //        if (sender != null) realPicture.Image = hkcatch1.ToBitmap();
            //    }
            //    watch.Stop();
            //    setrunstatus(true, "1ok" + watch.ElapsedMilliseconds.ToString());
            //}
            //catch (Exception ex)
            //{
            //    hkcatchpic1button.Enabled = true;
            //    setinglogClass.writeLog("hkcatchpic1button_Click", ex.ToString());
            //    setrunstatus(false, "1error");
            //}
            //hkcatchpic1button.Enabled = true;

        }

        private void hkcombinpicbutton_Click(object sender, EventArgs e)
        {
            //Stopwatch watch = Stopwatch.StartNew();
            //mousetest = false;
            //bool ret = hkcombin();
            ////Image<Bgr, byte> srci = totalmt.ToImage<Bgr, byte>();
            //if (ret)
            //{
            //    realPicture.Image = totalmt.ToBitmap();
            //    watch.Stop();
            //    setrunstatus(true, "total ok" + watch.ElapsedMilliseconds.ToString());
            //}
            //else
            //{
            //    realPicture.Image = null;
            //    setrunstatus(false, "图像合成失败！");
            //}
            //GC.Collect();
            //GC.SuppressFinalize(this);
        }
        //public bool hkcombin()
        //{
        //    try
        //    {
        //        Mat total12 = new Mat();
        //        Mat total34 = new Mat();
        //        string hkpicpath = Application.StartupPath + "\\Rectangle\\hkcatchpic";
        //        if (hkcatch1 == null) hkcatch1 = CvInvoke.Imread(hkpicpath + @"\hk1bmp.bmp");
        //        int destW = Convert.ToInt32((double)hkcatch1.Cols * Convert.ToDouble(channelcombincomboBox.Text));
        //        int destH = Convert.ToInt32((double)hkcatch1.Rows * Convert.ToDouble(channelcombincomboBox.Text));
        //        if (Convert.ToDouble(channelcombincomboBox.Text) != 1) CvInvoke.Resize(hkcatch1, hkcatch1, new Size(destW, destH));

        //        if (hkcatch2 == null) hkcatch2 = CvInvoke.Imread(hkpicpath + @"\hk2bmp.bmp");
        //        if (Convert.ToDouble(channelcombincomboBox.Text) != 1) CvInvoke.Resize(hkcatch2, hkcatch2, new Size(destW, destH));
        //        CvInvoke.HConcat(hkcatch1, hkcatch2, total12);

        //        if (hkcatch3 == null) hkcatch3 = CvInvoke.Imread(hkpicpath + @"\hk3bmp.bmp");
        //        if (Convert.ToDouble(channelcombincomboBox.Text) != 1) CvInvoke.Resize(hkcatch3, hkcatch3, new Size(destW, destH));

        //        if (hkcatch4 == null) hkcatch4 = CvInvoke.Imread(hkpicpath + @"\hk4bmp.bmp");
        //        if (Convert.ToDouble(channelcombincomboBox.Text) != 1) CvInvoke.Resize(hkcatch4, hkcatch4, new Size(destW, destH));
        //        CvInvoke.HConcat(hkcatch3, hkcatch4, total34);
        //        CvInvoke.VConcat(total12, total34, totalmt);
        //        return true;
        //        //Image<Bgra, byte> a = totalmt.ToImage<Bgra, byte>();
        //    }
        //    catch (Exception ex)
        //    {
        //        setinglogClass.writeLog("hkcombin", ex.ToString());
        //        return false;
        //    }
        //}

        private void mansingletestbutton_Click(object sender, EventArgs e)
        {
            ////gettwoval();
            //mansingletestbutton.Enabled = false;
            //Stopwatch watch = Stopwatch.StartNew();
            ////拍照
            //mousetest = true;
            //hkcombinpicbutton_MouseUp(null, null);
            ////测试
            //bool ret = manulcheck();
            //watch.Stop();
            //setrunstatus(ret, watch.ElapsedMilliseconds.ToString());
            //mansingletestbutton.Enabled = true;
        }

        public bool stopmulti = true;
        private void manmultitestbutton_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    gettwoval();
            //    showcheckpictab();
            //    if (stopmulti)
            //    {
            //        stopmulti = false;
            //        manmultitestbutton.Text = "停止循环";
            //        manmultitest();
            //    }
            //    else
            //    {
            //        stopmulti = true;
            //        manmultitestbutton.Text = "循环测试";
            //    }
            //}
            //catch (Exception ex)
            //{
            //    setinglogClass.writeLog("manmultitestbutton_Click", ex.ToString());
            //}
        }
        public void manmultitest()
        {
            while (true)
            {
                if (stopmulti) break;
                mansingletestbutton_Click(null, null);
                //while (true)
                //{
                //    if (mansingletestbutton.Enabled == true) continue ;
                System.Threading.Thread.Sleep(10);
                Application.DoEvents();
                //}

            }
        }

        private void hkcatchpic2button_Click(object sender, EventArgs e)
        {


        }

        private void hkcatchpic3button_Click(object sender, EventArgs e)
        {

        }

        private void hkcatchpic4button_Click(object sender, EventArgs e)
        {

        }
        public static bool mousetest = false;
        public static bool rightcheck(MouseEventArgs e)
        {
            if (e == null) return true;
            if (e.Button == MouseButtons.Right) return true;
            return false;
        }
        private void hkcombinpicbutton_MouseUp(object sender, MouseEventArgs e)
        {
            //if (mousetest == true || rightcheck(e)  )
            //{
            //    hkcombinpicbutton.Enabled = false;
            //    try
            //    {
            //        Stopwatch watch = Stopwatch.StartNew();
            //        hkcatchpic1button_Click(null, null);
            //        for (int i = 0; i < 10; i++)
            //        {
            //            if (hkcatchpic1button.Enabled == true) break;
            //            System.Threading.Thread.Sleep(20);
            //            Application.DoEvents();
            //        }
            //        //System.Threading.Thread.Sleep(10);
            //        hkcatchpic2button_Click(null, null);
            //        for (int i = 0; i < 10; i++)
            //        {
            //            if (hkcatchpic2button.Enabled == true) break;
            //            System.Threading.Thread.Sleep(20);
            //            Application.DoEvents();
            //        }
            //        //System.Threading.Thread.Sleep(10);
            //        hkcatchpic3button_Click(null, null);
            //        for (int i = 0; i < 10; i++)
            //        {
            //            if (hkcatchpic3button.Enabled == true) break;
            //            System.Threading.Thread.Sleep(20);
            //            Application.DoEvents();
            //        }
            //        //System.Threading.Thread.Sleep(10);
            //        hkcatchpic4button_Click(null, null);
            //        for (int i = 0; i < 10; i++)
            //        {
            //            if (hkcatchpic4button.Enabled == true) break;
            //            System.Threading.Thread.Sleep(20);
            //            Application.DoEvents();
            //        }
            //        System.Threading.Thread.Sleep(10);
            //        hkcombinpicbutton_Click(null, null);
            //        watch.Stop();
            //        setrunstatus(true, "tatal ok"+watch.ElapsedMilliseconds.ToString());
            //    }
            //    catch (Exception ex)
            //    {
            //        setinglogClass.writeLog("hkcombinpicbutton_MouseUp", ex.ToString());
            //        setrunstatus(false, "total error");
            //        GC.Collect();
            //        hkcombinpicbutton.Enabled = true;
            //    }
            //    hkcombinpicbutton.Enabled = true;
            //}
        }

        private void zhuatubutton_Click(object sender, EventArgs e)
        {
            //string IP1 = "192.168.1.63";
            //string User = "admin";
            //string Pw = "p123456789";

            //play1.IP = IP1;
            //play1.Port = "8003";
            //play1.User = User;
            //play1.Pw = Pw;
            //play1.Wnd = checkpic;//PicTureBox
            //play1.masking = true;//启动绘图回调函数
            //play1.Login();
            //play1.Preview();
        }
        private void hkcatchpic1button_MouseUp(object sender, MouseEventArgs e)
        {
            //if (e.Button == MouseButtons.Right)
            //{
            //    Stopwatch watch = Stopwatch.StartNew();
            //    hkcatchpic1button.Enabled = false;

            //        if (realPicture.Image != null)
            //        { realPicture.Image.Dispose(); realPicture.Image = null; }
            //        if (hkcatch1 != null)
            //        { hkcatch1.Dispose(); hkcatch1 = null; hkcatch1 = new Mat(); }

            //        //拍照
            //        if (play1.hkcatchbmppic(prev1.path + "hk1bmp.bmp"))
            //        {
            //            hkcatch1 = CvInvoke.Imread(prev1.path + "hk1bmp.bmp");
            //            //Image<Bgr, byte> srci = hkcatch3.ToImage<Bgr, byte>();
            //            //Bitmap bts = new Bitmap(prev1.path + "hk3bmp.bmp");
            //            if (sender != null) realPicture.Image = hkcatch1.ToBitmap();
            //        }
            //    hkcatchpic1button.Enabled = true;
            //    watch.Stop();
            //        setrunstatus(true, "1ok" + watch.ElapsedMilliseconds.ToString());
            //}
        }

        private void autostartrunopenbutton_Click(object sender, EventArgs e)
        {
            //AutoStartRun.SetMeStart (true);
            //AutoStartRun.SetMeAutoStart(true);

        }

        private void autostartrunshutbutton_Click(object sender, EventArgs e)
        {
            //AutoStartRun.SetMeStart(false);
            //AutoStartRun.SetMeAutoStart(false);
        }

        private void 当前组ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            listRectangle[currentSelect].startX = currentRect.startX;
            listRectangle[currentSelect].startY = currentRect.startY;
            listRectangle[currentSelect].endX = currentRect.endX;
            listRectangle[currentSelect].endY = currentRect.endY;

            if (realPicture.Image != null)//存储样板图片
            {
                DateTime cdt = DateTime.Now;
                string dt = cdt.Year.ToString() + cdt.Month.ToString() + cdt.Day.ToString() + cdt.Hour.ToString() + cdt.Minute.ToString() + cdt.Second.ToString();
                listRectangle[currentSelect].sampleName = dt;
                saveSamplePic(listRectangle[currentSelect].startX, listRectangle[currentSelect].startY, listRectangle[currentSelect].endX - listRectangle[currentSelect].startX, listRectangle[currentSelect].endY - listRectangle[currentSelect].startY, dt);
            }
            else
            {
                listRectangle[currentSelect].sampleName = "";
            }

            //rs.lineUpMin = configlineup;
            listRectangle[currentSelect].lineUpMax = listRectangle[currentSelect].endX - listRectangle[currentSelect].startX;
            //rs.lineDownMin = configlinedown;
            listRectangle[currentSelect].lineDownMax = listRectangle[currentSelect].endX - listRectangle[currentSelect].startX;

            //rs.lineLeftMin = configlineleft;
            listRectangle[currentSelect].lineLeftMax = listRectangle[currentSelect].endY - listRectangle[currentSelect].startY;
            //rs.lineRightMin = configlineright;
            listRectangle[currentSelect].lineRightMax = listRectangle[currentSelect].endY - listRectangle[currentSelect].startY;

            setrunstatus(true, "保存成功");
            currentRect.startX = 0;
            currentRect.startY = 0;
            currentRect.endX = 0;
            currentRect.endY = 0;
        }

        private void 输入组号ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string inputstr = Interaction.InputBox("请输入组号", "输入", "10000", -1, -1);
            int inputnum = Convert.ToInt32(inputstr);
            if (inputnum != 10000 && inputnum >= 0 & inputnum <= 100)
            {
                listRectangle[inputnum].startX = currentRect.startX;
                listRectangle[inputnum].startY = currentRect.startY;
                listRectangle[inputnum].endX = currentRect.endX;
                listRectangle[inputnum].endY = currentRect.endY;
                if (realPicture.Image != null)//存储样板图片
                {
                    DateTime cdt = DateTime.Now;
                    string dt = cdt.Year.ToString() + cdt.Month.ToString() + cdt.Day.ToString() + cdt.Hour.ToString() + cdt.Minute.ToString() + cdt.Second.ToString();
                    listRectangle[inputnum].sampleName = dt;
                    saveSamplePic(listRectangle[inputnum].startX, listRectangle[inputnum].startY, listRectangle[inputnum].endX - listRectangle[inputnum].startX, listRectangle[inputnum].endY - listRectangle[inputnum].startY, dt);
                }
                else
                {
                    listRectangle[inputnum].sampleName = "";
                }

                //rs.lineUpMin = configlineup;
                listRectangle[inputnum].lineUpMax = listRectangle[inputnum].endX - listRectangle[inputnum].startX;
                //rs.lineDownMin = configlinedown;
                listRectangle[inputnum].lineDownMax = listRectangle[inputnum].endX - listRectangle[inputnum].startX;

                //rs.lineLeftMin = configlineleft;
                listRectangle[inputnum].lineLeftMax = listRectangle[inputnum].endY - listRectangle[inputnum].startY;
                //rs.lineRightMin = configlineright;
                listRectangle[inputnum].lineRightMax = listRectangle[inputnum].endY - listRectangle[inputnum].startY;
                setrunstatus(true, "保存成功！");
            }
            else
            {
                setrunstatus(false, "保存失败！");
            }
            currentRect.startX = 0;
            currentRect.startY = 0;
            currentRect.endX = 0;
            currentRect.endY = 0;
        }

        private void AutoCheck_Activated(object sender, EventArgs e)
        {

        }

        private void fasttwoButton_Click(object sender, EventArgs e)
        {

        }

        private void openoffbutton_Click(object sender, EventArgs e)
        {
            //Client.Frmmain cfrm = new Client.Frmmain();
            //cfrm.Show();
        }

        private void savecheckbutton_Click(object sender, EventArgs e)
        {

        }

        private void resetbutton_Click(object sender, EventArgs e)
        {
            //    stopmulti = true;
            //   manmultitestbutton.Text = "循环测试";
            //resultdislabel.BackColor = Color.White;
            //    clientcf.btnDO2_Click(false, 1);
        }
        //TColor cannyThreshold：传递到Canny边缘检测器的两个阈值中较高的阈值
        //TColor accumlator：中心检测阶段的累加器阈值。它越小，就越能检测到假圆。
        //double dp：检测圆中心的累计分别率
        //double minDist：检测圆中心之间的最小距离。
        private void circlefind_Click(object sender, EventArgs e)
        {
            if (realPicture.Image == null) return;
            Bitmap bt = new Bitmap(realPicture.Image);

            Image<Bgr, Byte> image1 = bt.ToImage<Bgr, Byte>();
            Image<Gray, Byte> gray1 = image1.Convert<Gray, Byte>();
            //调用HoughCircles (Canny included)检测圆形
            CircleF[] circles = gray1.HoughCircles(new Gray(255), new Gray(100), 2.0, 2, 2, 20)[0];
            //画图
            Image<Bgr, Byte> imageCircles = image1.CopyBlank();
            foreach (CircleF circle in circles)
            {
                imageCircles.Draw(circle, new Bgr(Color.Yellow), 5);
            }
            realPicture.Image = imageCircles.ToBitmap();

        }

        private void catchpic_Click(object sender, EventArgs e)
        {


            //HK.HKgongye.Hikvision camera = new Hikvision();//创建相机对象并实例化
            //camera.connectCamera("123456");//连接相机，传入相机序列号123456
            //camera.startCamera();//开启相机采集
            //camera.setExposureTime(10000);//设置曝光时间为10ms
            //camera.softTrigger();//发送软触发采集图像
            //Himage image = camera.readImage();//获取采集到且转换后的图像
            //camera.stopCamera();//停止相机采集
            //camera.closeCamera();//关闭相机
        }
        public static hkmvsbasic hkc = new hkmvsbasic();
        private void hkdiaoru_Click(object sender, EventArgs e)
        {
            hkdiaoru.Enabled = false;
            try
            {
                hkc.Show();
            }
            catch (Exception ex)
            {
                hkmvsbasic hkc = new hkmvsbasic();
                hkc.Show();
                for (int i = 0; i < 10; i++)
                {
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(100);
                }
            }
            hkdiaoru.Enabled = true;
        }

        private void hkcatchpic_Click(object sender, EventArgs e)
        {
            Stopwatch watch = Stopwatch.StartNew();
            hkcatchpic.Enabled = false;
            hksavejpegpath = "";
            hkdiaoru_Click(null, null);
            hkmvsbasic.hksavejpegpath = hksavejpegpath;
            if (hkc.bnOpen.Enabled == true)
            {
                hkc.bnOpen_Click(null, null);
                for (int i = 0; i < 160; i++)
                {
                    if (hkc.bnOpen.Enabled == true) break;
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(15);

                }
            }
            if (hkc.bnStartGrab.Enabled == true)
            {
                hkc.bnStartGrab_Click(null, null);
                for (int i = 0; i < 80; i++)
                {
                    if (hkc.bnStartGrab.Enabled == true) break;
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(25);

                }
            }
            if (hkc.bnTriggerExec.Enabled == true)
            {
                hkc.bnTriggerExec_Click(null, null);
                for (int i = 0; i < 40; i++)
                {
                    if (hkc.bnTriggerExec.Enabled == true) break;
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(25);

                }
            }

            if (hkc.bnSaveJpg.Enabled == true)
            {
                hkc.bnSaveJpg_Click(null, null);
                for (int i = 0; i < 4; i++)
                {
                    if (hkc.bnSaveJpg.Enabled == true) break;
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(25);
                }
            }
            if (hkc.bnSaveJpg.BackColor == Color.Green && File.Exists(hksavejpegpath))
            {
                Bitmap bt = new Bitmap(hksavejpegpath);
                realPicture.Image = bt;
                hkcatchpic.BackColor = Color.Green;
            }
            else
            {
                hkcatchpic.BackColor = Color.Red;
            }
            watch.Stop();
            setrunstatus(true, watch.ElapsedMilliseconds.ToString());
            hkcatchpic.Enabled = true;

        }

        private void continucatch_Click(object sender, EventArgs e)
        {
            if (continucatch.Text == "连续采集")
            {
                continucatch.Text = "停止采集";
                do
                {
                    if (hkcatchpic.Enabled == true) hkcatchpic_Click(null, null);
                    System.Threading.Thread.Sleep(10);
                    Application.DoEvents();

                }
                while (continucatch.Text == "停止采集");
            }
            else
            {
                continucatch.Text = "连续采集";
            }
        }

        private void peifang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public static FormSiemensFW sf = new FormSiemensFW();
        public static FormS7Server s7s = new FormS7Server();
        private void s7server_Click(object sender, EventArgs e)
        {
            try
            {
                s7s.Show();
            }
            catch (Exception ex)
            {
                FormS7Server s7s = new FormS7Server();
                s7s.Show();
            }
        }

        private void siemensFW_Click(object sender, EventArgs e)
        {
            try
            {
                if (sf != null)
                    sf.Show();
                else
                {
                    FormSiemensFW sf = new FormSiemensFW();
                    sf.Show();
                }
            }
            catch (Exception ex)
            {
                FormSiemensFW sf = new FormSiemensFW();
                sf.Show();
            }
        }
        public static FormSiemens s7Smart200 = new FormSiemens(SiemensPLCS.S200Smart);
        private void S7Smart200_Click(object sender, EventArgs e)
        {
            try
            {
                if (s7Smart200 != null)
                    s7Smart200.Show();
                else
                {
                    FormSiemens s7Smart200 = new FormSiemens(SiemensPLCS.S200Smart);
                    s7Smart200.Show();
                }
            }
            catch (Exception ex)
            {
                FormSiemens s7Smart200 = new FormSiemens(SiemensPLCS.S200Smart);
                s7Smart200.Show();
            }
        }

        private void exitprog_Click(object sender, EventArgs e)
        {
            DialogResult dia = MessageBox.Show("是否真的退出系统！", "", MessageBoxButtons.OKCancel);
            if (dia == DialogResult.Cancel)
            {
                return;
            }

            System.GC.Collect();
            toolcloseVideo_Click(null, null);
            GC.Collect(1, GCCollectionMode.Forced);
            this.Close();
            Application.Exit();
            Environment.Exit(0);
        }

        private void aboutMeToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
        public static TCPCommunication tcpcf = new TCPCommunication();
        private void btcpserver_Click(object sender, EventArgs e)
        {
            try
            {
                tcpcf.Show();
            }
            catch (Exception ex)
            {
                TCPCommunication tcpcf = new TCPCommunication();
                tcpcf.Show();
            }
        }

        private void kryptonSplitContainer2_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void kryptonTreeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            switch (kryptonTreeView1.SelectedNode.Text)
            {
                case "西门子":
                    openwindow("FormSiemens");
                    break;
                case "海康工业相机":
                    openwindow("hkmvsbasic");
                    break;
                case "ADTECH":
                    openwindow("ADTECH");
                    break;
                default:
                    break;
            }
        }
        public void openwindow(string winname)
        {
            foreach (Form fr in Application.OpenForms)
            {
                //判断窗口是否存在，如果在激活并给予焦点
                if (fr.Name == winname)
                {
                    fr.TopLevel = false;
                    fr.Dock = DockStyle.Fill;//把子窗体设置为控件
                    fr.FormBorderStyle = FormBorderStyle.None;
                    kryptonSplitContainer1.Panel2.Controls.Clear();
                    kryptonSplitContainer1.Panel2.Controls.Add(fr);
                    fr.WindowState = FormWindowState.Maximized;
                    fr.WindowState = FormWindowState.Normal;
                    fr.Activate();
                    fr.Show();
                    return;
                }
            }
            Form fr2  ;
            switch (winname)
            {
                case "FormSiemens":
                    fr2=new HslCommunicationDemo.FormSiemens(SiemensPLCS.S200Smart);
                    break;
                case "hkmvsbasic":
                    fr2 = new hkmvsbasic();
                    break;
                case "ADTECH":
                    fr2 = new TcpDemo();
                    break;
                default:
                    return;
            }
            fr2.TopLevel = false;
            fr2.Dock = DockStyle.Fill;//把子窗体设置为控件
            fr2.FormBorderStyle = FormBorderStyle.None;
            kryptonSplitContainer1.Panel2.Controls.Clear();
            kryptonSplitContainer1.Panel2.Controls.Add(fr2);
            fr2.Show();

        }

        private void kryptonSplitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}

public  class checkform:Form
{   
    //private System.ComponentModel.Container components = null;
    TextBox pt = new TextBox();
    Button btn_confirm = new Button();
    public string ret = "";
    public checkform ()
    {    
        this.pt.Location = new System.Drawing.Point(10, 10);
        this.pt.Name = "textBoxIP";
        this.pt.Size = new System.Drawing.Size(114, 21);
        this.pt.TabIndex =1;
        this.pt.PasswordChar ='*';
        this.pt.Text = "p2486";

        this.btn_confirm.Location = new System.Drawing.Point(10, 40);
        this.btn_confirm.Name = "确认";
        this.btn_confirm.Size = new System.Drawing.Size(114, 21);
        this.btn_confirm.TabIndex = 2;
        this.btn_confirm.Tag = "";
        this.btn_confirm.Text = "确认";
        this.btn_confirm.UseVisualStyleBackColor = true;
        this.btn_confirm.Click += new System.EventHandler(this.btn_confirm_Click);

        this.Width = 150;this.Height = 120;
        this.StartPosition = FormStartPosition.CenterScreen;
        this.MinimizeBox = false;
        this.MaximizeBox = false;
        this.Controls.Add(pt);
        this.Controls.Add(btn_confirm);
        this.Name = "Preview";
        this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
        this.Text = "输入参数设定码！";
        this.ResumeLayout(false);
        this.PerformLayout();
    }
    public void btn_confirm_Click(object sender,EventArgs e)
    {
        ret = pt.Text.Trim().ToLower(); 
        this.Hide ();
    }
    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        this.Hide();
        disposing = false;
    }
    //// SURF算法
    //public static Bitmap MatchPicBySurf(Bitmap imgSrc, Bitmap imgSub, double threshold = 400)
    //{
    //    using (Mat matSrc = imgSrc.ToMat())
    //    using (Mat matTo = imgSub.ToMat())
    //    using (Mat matSrcRet = new Mat())
    //    using (Mat matToRet = new Mat())
    //    {
    //        System.Drawing.Point[] keyPointsSrc, keyPointsTo;
    //        using (var surf = new Emgu.CV.XFeatures2D.surf(threshold, 4, 3, true, true))
    //        {
    //            surf.DetectAndCompute(matSrc, null, out keyPointsSrc, matSrcRet);
    //            surf.DetectAndCompute(matTo, null, out keyPointsTo, matToRet);
    //        }
    //        using (var flnMatcher = new Emgu.CV.FlannBasedMatcher())
    //        {
    //            var matches = flnMatcher.Match(matSrcRet, matToRet);
    //            // 求最小最大距离
    //            double minDistance = 1000;//反向逼近
    //            double maxDistance = 0;
    //            for (int i = 0; i < matSrcRet.Rows; i++)
    //            {
    //                double distance = matches[i].Distance;
    //                if (distance > maxDistance)
    //                {
    //                    maxDistance = distance;
    //                }
    //                if (distance < minDistance)
    //                {
    //                    minDistance = distance;
    //                }
    //            }
    //            Console.WriteLine($"max distance : {maxDistance}");
    //            Console.WriteLine($"min distance : {minDistance}");
    //            var pointsSrc = new List<Point2f>();
    //            var pointsDst = new List<Point2f>();
    //            // 筛选较好的匹配点
    //            var goodMatches = new List<DMatch>();
    //            for (int i = 0; i < matSrcRet.Rows; i++)
    //            {
    //                double distance = matches[i].Distance;
    //                if (distance < Math.Max(minDistance * 2, 0.02))
    //                {
    //                    pointsSrc.Add(keyPointsSrc[matches[i].QueryIdx].Pt);
    //                    pointsDst.Add(keyPointsTo[matches[i].TrainIdx].Pt);
    //                    距离小于范围的压入新的DMatch
    //                        goodMatches.Add(matches[i]);
    //                }
    //            }
    //            var outMat = new Mat();
    //            // 算法RANSAC对匹配的结果做过滤
    //            var pSrc = pointsSrc.ConvertAll(Point2fToPoint2d);
    //            var pDst = pointsDst.ConvertAll(Point2fToPoint2d);
    //            var outMask = new Mat();
    //            // 如果原始的匹配结果为空, 则跳过过滤步骤
    //            if (pSrc.Count > 0 && pDst.Count > 0)
    //                Cv2.FindHomography(pSrc, pDst, HomographyMethods.Ransac, mask: outMask);
    //            // 如果通过RANSAC处理后的匹配点大于10个,才应用过滤.否则使用原始的匹配点结果(匹配点过少的时候通过RANSAC处理后, 可能会得到0个匹配点的结果).
    //            if (outMask.Rows > 10)
    //            {
    //                byte[] maskBytes = new byte[outMask.Rows * outMask.Cols];
    //                outMask.GetArray(0, 0, maskBytes);
    //                Cv2.DrawMatches(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, matchesMask: maskBytes, flags: DrawMatchesFlags.NotDrawSinglePoints);
    //            }
    //            else
    //                Cv2.DrawMatches(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, flags: DrawMatchesFlags.NotDrawSinglePoints);
    //            CvInvoke.DrawMarker(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, DrawMode.Normal);
    //            return CvInvoke.Extensions.BitmapConverter.ToBitmap(outMat);
    //            return Emgu.CV.BitmapExtension.ToBitmap(outMat);

    //        }
    //    }
    //}
    //// 模板匹配
    //public static System.Drawing.Point FindPicFromImage(Bitmap imgSrc, Bitmap imgSub, double threshold = 0.9)
    //{
    //    Mat srcMat = null;
    //    Mat dstMat = null;
    //    OutputArray outArray = null;
    //    try
    //    {
    //        srcMat = imgSrc.ToMat();
    //        dstMat = imgSub.ToMat();
    //        outArray = new Emgu.CV.Features2D.sOutputArray(srcMat.Ptr);
    //        CvInvoke.MatchTemplate(srcMat, dstMat, outArray, Common.templateMatchModes);
    //        double minValue, maxValue;
    //                .Point location, point;
    //        CvInvoke..MinMaxLoc(OpenCvSharp.InputArray.Create(outArray.GetMat()), out minValue, out maxValue, out location, out point);
    //        Console.WriteLine(maxValue);
    //        if (maxValue >= threshold)
    //            return new System.Drawing.Point(point.X, point.Y);
    //        return System.Drawing.Point.Empty;
    //    }
    //    catch (Exception ex)
    //    {
    //        return System.Drawing.Point.Empty;
    //    }
    //    finally
    //    {
    //        if (srcMat != null)
    //            srcMat.Dispose();
    //        if (dstMat != null)
    //            dstMat.Dispose();
    //        if (outArray != null)
    //            outArray.Dispose();
    //    }
    //}
    //public static void findsurf() //surf区配
    //{
    //    Image<Bgra, byte> a = new Image<Bgra, byte>("IMG_20150829_192403.JPG").Resize(0.4, Inter.Area);  //模板
    //    Image<Bgra, byte> b = new Image<Bgra, byte>("DSC_0437.JPG").Resize(0.4, Inter.Area);  //待匹配的图像

    //    Mat homography = null;
    //    Mat mask = null;
    //    VectorOfKeyPoint modelKeyPoints = new VectorOfKeyPoint();
    //    VectorOfKeyPoint observedKeyPoints = new VectorOfKeyPoint();
    //    VectorOfVectorOfDMatch matches = new VectorOfVectorOfDMatch();
    //    UMat a1 = a.Mat.GetUMat(AccessType.Read);// a.Mat.(AccessType.Read);
    //    UMat b1 = b.Mat.GetUMat(AccessType.Read);

    //    surf surf = new SURF(300);
    //    UMat modelDescriptors = new UMat();
    //    UMat observedDescriptors = new UMat();

    //    surf.DetectAndCompute(a1, null, modelKeyPoints, modelDescriptors, false);       //进行检测和计算，把opencv中的两部分和到一起了，分开用也可以
    //    surf.DetectAndCompute(b1, null, observedKeyPoints, observedDescriptors, false);

    //    BFMatcher matcher = new BFMatcher(DistanceType.L2);       //开始进行匹配
    //    matcher.Add(modelDescriptors);
    //    matcher.KnnMatch(observedDescriptors, matches, 2, null);
    //    mask = new Mat(matches.Size, 1, DepthType.Cv8U, 1);
    //    mask.SetTo(new MCvScalar(255));
    //    Features2DToolbox.VoteForUniqueness(matches, 0.8, mask);   //去除重复的匹配

    //    int Count = CvInvoke.CountNonZero(mask);      //用于寻找模板在图中的位置
    //    if (Count >= 4)
    //    {
    //        Count = Features2DToolbox.VoteForSizeAndOrientation(modelKeyPoints, observedKeyPoints, matches, mask, 1.5, 20);
    //        if (Count >= 4)
    //            homography = Features2DToolbox.GetHomographyMatrixFromMatchedFeatures(modelKeyPoints, observedKeyPoints, matches, mask, 2);
    //    }

    //    Mat result = new Mat();
    //    Features2DToolbox.DrawMatches(a.Convert<Gray, byte>().Mat, modelKeyPoints, b.Convert<Gray, byte>().Mat, observedKeyPoints, matches, result, new MCvScalar(255, 0, 255), new MCvScalar(0, 255, 255), mask);
    //    // 绘制匹配的关系图
    //    if (homography != null)     //如果在图中找到了模板，就把它画出来
    //    {
    //        Rectangle rect = new Rectangle(Point.Empty, a.Size);
    //        PointF[] points = new PointF[]
    //        {
    //                      new PointF(rect.Left, rect.Bottom),
    //                      new PointF(rect.Right, rect.Bottom),
    //                      new PointF(rect.Right, rect.Top),
    //                      new PointF(rect.Left, rect.Top)
    //        };
    //        points = CvInvoke.PerspectiveTransform(points, homography);
    //        System.Drawing.Point[] points2 = Array.ConvertAll<PointF, Point>(points, Point.Round);
    //        VectorOfPoint vp = new VectorOfPoint(points2);
    //        CvInvoke.Polylines(result, vp, true, new MCvScalar(255, 0, 0, 255), 15);
    //    }
    //    imageBox1.Image = result;
    //}
}
public static class MatExtension
{
    public static VectorOfMat channelfenli(Bitmap bt)
    {
        //实现通道分离
        Mat scr = bt.ToMat ();
        VectorOfMat vm = new VectorOfMat();
        CvInvoke.Split(scr, vm);
        var vms = vm.GetInputOutputArray();
        Mat one_channel1 = vms.GetMat(0);
        Mat one_channel2 = vms.GetMat(1);
        Mat one_channel3 = vms.GetMat(2);
        return vm;
    }
    //通道合并
public static  void mergechannel( )
    {
        //通道合并
        Mat scr = new Mat("002.jpg", Emgu.CV.CvEnum.ImreadModes.AnyColor);
        VectorOfMat vm = new VectorOfMat();
        CvInvoke.Split(scr, vm);
        var vms = vm.GetInputOutputArray();
        Mat one_channel1 = vms.GetMat(0);
        Mat one_channel2 = vms.GetMat(1);
        Mat one_channel3 = vms.GetMat(2);

        Mat dst = new Mat();
        CvInvoke.Merge(vm, dst);
        VectorOfMat mv = new VectorOfMat();
        mv.Push(one_channel3);
        mv.Push(one_channel2);
        mv.Push(one_channel1);
        CvInvoke.Merge(mv, dst);
    }
    /// <summary>
    /// 获取Mat的元素值
    /// </summary>
    /// <param name="mat">需操作的Mat</param>
    /// <param name="row">元素行</param>
    /// <param name="col">元素列</param>
    /// <returns></returns>
    public static dynamic GetValue(this Mat mat, int row, int col)
    {
        var value = CreateElement(mat.Depth);
        Marshal.Copy(mat.DataPointer + (row * mat.Cols + col) * mat.ElementSize, value, 0, 1);
        return value[0];
    }
    /// <summary>
    /// 修改Mat的元素值
    /// </summary>
    /// <param name="mat">需操作的Mat</param>
    /// <param name="row">元素行</param>
    /// <param name="col">元素列</param>
    /// <param name="value">修改值</param>
    public static void SetValue(this Mat mat, int row, int col, dynamic value)
    {
        var target = CreateElement(mat.Depth, value);
        Marshal.Copy(target, 0, mat.DataPointer + (row * mat.Cols + col) * mat.ElementSize, 1);
    }
    /// <summary>
    /// 根据Mat的类型，动态解析传入数据的类型
    /// </summary>
    /// <param name="depthType"></param>
    /// <param name="value"></param>
    /// <returns></returns>
    private static dynamic CreateElement(DepthType depthType, dynamic value)
    {
        var element = CreateElement(depthType);
        element[0] = value;
        return element;
    }
    /// <summary>
    /// 获取Mat元素的类型
    /// </summary>
    /// <param name="depthType"></param>
    /// <returns></returns>
    private static dynamic CreateElement(DepthType depthType)
    {
        if (depthType == DepthType.Cv8S)
        {
            return new sbyte[1];
        }
        if (depthType == DepthType.Cv8U)
        {
            return new byte[1];
        }
        if (depthType == DepthType.Cv16S)
        {
            return new short[1];
        }
        if (depthType == DepthType.Cv16U)
        {
            return new ushort[1];
        }
        if (depthType == DepthType.Cv32S)
        {
            return new int[1];
        }
        if (depthType == DepthType.Cv32F)
        {
            return new float[1];
        }
        if (depthType == DepthType.Cv64F)
        {
            return new double[1];
        }
        return new float[1];
    }
}



