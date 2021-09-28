using System;
using System.IO;
using System.Windows;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using OpenCvSharp;
using System.Drawing;
using System.Windows.Media.Imaging;
using System.Collections.Concurrent;
using System.Collections;
using System.Threading;

using Ishp_PluginServer.Common;

namespace Ishp_PluginServer.Common.FaceApi
{
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    //[StructLayout(LayoutKind.Explicit)]
    public struct FaceInfo
    {
        public FaceInfo(float iWidth, float iAngle, float iCenter_x, float iCenter_y, float iConf)
        {
            mWidth = iWidth;
            mAngle = iAngle;
            mCenter_x = iCenter_x;
            mCenter_y = iCenter_y;
            mConf = iConf;
        }
        public float mWidth;        // rectangle width
        public float mAngle;        // = 0.0F;     // rectangle tilt angle [-45 45] in degrees
        public float mCenter_y;     // = 0.0F;      // rectangle center y
        public float mCenter_x;     // = 0.0F;      // rectangle center x
        public float mConf;         // = 0.0F;
    };
    
    //   [StructLayout(LayoutKind.Explicit, CharSet = CharSet.Ansi, Size = 596)]
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct TrackFaceInfo
    {
        [MarshalAs(UnmanagedType.Struct)]
        public FaceInfo box;
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 144)]
        public int[] landmarks;// = new int[144];
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 3)]
        public float[] headPose;// = new float[3];
        public float score;// = 0.0F;
        public UInt32 face_id;// = 0;
    }

    // 人脸检测
    class FaceTrack
    {
        [DllImport("user32.dll")]
        public static extern IntPtr FindWindowA(string lpClassName, string lpWindowName);
        [DllImport("user32.dll")]
        public static extern int GetWindowLong(IntPtr hWnd, int nIndex);
        [DllImport("user32.dll")]
        public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);
        [DllImport("user32.dll")]
        private static extern bool SetWindowPos(IntPtr hWnd, int hWndlnsertAfter, int X, int Y, int cx, int cy, int Flags);

        const int WS_THICKFRAME = 262144;
        const int WS_BORDER = 8388608;
        const int GWL_STYLE = -16;
        const int WS_OVERLAPPEDWINDOW = 0x00000000 | 0x00C00000 | 0x00080000 | 0x00040000 | 0x00020000 | 0x00010000 | 0x40000000;

        public AppConfig appcfg = AppConfig.GetInstance();  // 配置文件
        public int WindowIndex;  // 窗体索引号

        public bool canClose = false; // 是否可以关闭程序

        private FaceCompare fc; // 人脸比对

        /// <summary>
        /// 窗口样式
        /// </summary>
        [FlagsAttribute] /* 指示可以将枚举作为位域（即一组标志）处理, 只有添加此属性才能使用&与运算进行判断。*/
        public enum WindowStyles : uint
        {
            WS_BORDER = 0x00800000,

            WS_CAPTION = 0x00C00000,

            WS_CHILD = 0x40000000,

            WS_CHILDWINDOW = 0x40000000,

            WS_CLIPCHILDREN = 0x02000000,

            WS_CLIPSIBLINGS = 0x04000000,

            WS_DISABLED = 0x08000000,

            WS_DLGFRAME = 0x00400000,

            WS_GROUP = 0x00020000,

            WS_HSCROLL = 0x00100000,

            WS_ICONIC = 0x20000000,

            WS_MAXIMIZE = 0x01000000,

            WS_MAXIMIZEBOX = 0x00010000,

            WS_MINIMIZE = 0x20000000,

            WS_MINIMIZEBOX = 0x00020000,

            WS_OVERLAPPED = 0x00000000,

            WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX,

            WS_POPUP = 0x80000000,

            WS_POPUPWINDOW = WS_POPUP | WS_BORDER | WS_SYSMENU,

            WS_SIZEBOX = 0x00040000,

            WS_SYSMENU = 0x00080000,

            WS_TABSTOP = 0x00010000,

            WS_THICKFRAME = 0x00040000,

            WS_TILED = 0x00000000,

            WS_TILEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX,

            WS_VISIBLE = 0x10000000,

            WS_VSCROLL = 0x00200000
        }

        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        public delegate void FaceCallback(IntPtr bytes, int size, String res);

        /// <summary>
        /// 人脸检测 by 文件
        /// </summary>
        /// <param name="file_name">图像文件名</param>
        /// <param name="max_track_num">检测到的最大人脸数，传入外部分配人脸数，需要分配对应的内存大小。传出检测到的最大人脸数</param>
        /// <returns></returns>
        [DllImport("BaiduFaceApi.dll", EntryPoint = "track", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr track(string file_name, int max_track_num);
        

        /// <summary>
        /// 人脸检测 by Mat
        /// </summary>
        /// <param name="oface"></param>
        /// <param name="mat"></param>
        /// <param name="max_track_num">检测到的最大人脸数，传入外部分配人脸数，需要分配对应的内存大小。传出检测到的最大人脸数</param>
        /// <returns>传入的人脸数 和 检测到的人脸数 中的最小值</returns>
        [DllImport("BaiduFaceApi.dll", EntryPoint = "track_mat", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        public static extern int track_mat(IntPtr oface, IntPtr mat, ref int max_track_num);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "track_max_face", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr track_max_face(string file_name);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "track_by_buf", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr track_by_buf(byte[] image, int size, int max_track_num);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "track_max_face_by_buf", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr track_max_face_by_buf(byte[] image, int size);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "clear_tracked_faces", CharSet = CharSet.Ansi
         , CallingConvention = CallingConvention.Cdecl)]
        private static extern void clear_tracked_faces();


        //public RotatedRect bounding_box(int[] landmarks, int size)
        //{
        //    int min_x = 1000000;
        //    int min_y = 1000000;
        //    int max_x = -1000000;
        //    int max_y = -1000000;
        //    for (int i = 0; i < size / 2; ++i)
        //    {
        //        min_x = (min_x < landmarks[2 * i] ? min_x : landmarks[2 * i]);
        //        min_y = (min_y < landmarks[2 * i + 1] ? min_y : landmarks[2 * i + 1]);
        //        max_x = (max_x > landmarks[2 * i] ? max_x : landmarks[2 * i]);
        //        max_y = (max_y > landmarks[2 * i + 1] ? max_y : landmarks[2 * i + 1]);
        //    }
        //    int width = ((max_x - min_x) + (max_y - min_y)) / 2;
        //    float angle = 0;
        //    Point2f center = new Point2f((min_x + max_x) / 2, (min_y + max_y) / 2);
        //    return new RotatedRect(center, new Size2f(width, width), angle);
        //}
        //public void draw_rotated_box(ref Mat img, ref RotatedRect box, Scalar color)
        //{
        //    Point2f[] vertices = new Point2f[4];
        //    vertices = box.Points();
        //    for (int j = 0; j < 4; j++)
        //    {
        //       // Cv2.Line(img, vertices[j], vertices[(j + 1) % 4], color, 2);
        //    }
        //}

        //private static Bitmap MatToBitmap(Mat mat)
        //{
        //    using (var ms = mat.ToMemoryStream())
        //    {
        //        Bitmap bm = (Bitmap)Image.FromStream(ms);
        //        ms.Dispose();
        //        return bm;

        //    }
        //}

        //public BitmapImage MatToBitmapImage(Mat image)
        //{
        //    Bitmap bitmap = MatToBitmap(image);
        //    using (MemoryStream stream = new MemoryStream())
        //    {
        //        bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png); // 坑点：格式选Bmp时，不带透明度

        //        stream.Position = 0;
        //        BitmapImage result = new BitmapImage();
        //        result.BeginInit();
        //        // According to MSDN, "The default OnDemand cache option retains access to the stream until the image is needed."
        //        // Force the bitmap to load right now so we can dispose the stream.
        //        result.CacheOption = BitmapCacheOption.OnLoad;
        //        result.StreamSource = stream;
        //        result.EndInit();
        //        result.Freeze();
        //        return result;
        //    }
        //}

        /// <summary>
        /// 摄像头实时人脸检测
        /// </summary>
        public void startTrackFace(ConcurrentQueue<Bitmap> queue_fc)
        {
            //FaceCallback callback =
            //(bytes, buf_len, res_out) =>
            // {
            //     if(buf_len>0)
            //     {
            //         byte[] b = new byte[buf_len];
            //         Marshal.Copy(bytes, b, 0, buf_len);
            //        // ImageUtil.byte2img(b, buf_len,"d:\\test_byte.jpg");
            //      //   Console.WriteLine("callback result is {0} and {1} and {2}", bytes, buf_len, res_out);
            //     }
            //  };
            // 默认电脑自带摄像头，device可能为0，若外接usb摄像头，则device可能为1.

            fc = new FaceCompare();  // 人脸比对
            //FaceCompare.load_db_face(); // 加载人脸特征库到内存中

            string WindowTitle = "facewindow-" + WindowIndex;  // 视频窗口标题
            int CapType = appcfg.PassageWays[WindowIndex].cap.type;  // 摄像头来源: 0:USB摄像头 1:RTSP流
            int CapUsbIndex = appcfg.PassageWays[WindowIndex].cap.usbidx; // usb设备序号
            string CapRtspUrl = appcfg.PassageWays[WindowIndex].cap.url; // rtsp源url
            int MaxFaceLen = appcfg.FaceSetting.max_face_len; //最大检测人脸数量

            //while (true)
            //{
            //    if (canClose)
            //    {
            //        //canClose=True 则退出
            //        break;
            //    }

            //    try
            //    {
            //        // 创建视频显示窗体
            //        var window = new OpenCvSharp.Window(WindowTitle, WindowMode.Normal);

            //        #region 确定视频来源
            //        // 确定视频来源
            //        VideoCapture cap;
            //        if (CapType == 0)
            //        {
            //            cap = VideoCapture.FromCamera(CapUsbIndex);
            //        }
            //        else
            //        {
            //            cap = VideoCapture.FromFile(CapRtspUrl);
            //        }
            //        #endregion

            //        using (window)
            //        using (cap)
            //        {
            //            #region 设置视频窗体 视频帧
            //            // 设置视频窗体无边框
            //            var wnd = FindWindowA(null, WindowTitle);
            //            Int32 wndStyle = GetWindowLong(wnd, GWL_STYLE);
            //            wndStyle &= ~WS_OVERLAPPEDWINDOW;
            //            SetWindowLong(wnd, GWL_STYLE, wndStyle);
            //            // 设置视频窗体 置顶 & 位置 & 大小
            //            SetWindowPos(wnd, -1,
            //                    appcfg.PassageWays[WindowIndex].cap.left,
            //                    appcfg.PassageWays[WindowIndex].cap.top,
            //                    appcfg.PassageWays[WindowIndex].cap.width,
            //                    appcfg.PassageWays[WindowIndex].cap.height,
            //                    0x40);

            //            // 设置视频帧大小
            //            cap.Set(CaptureProperty.FrameWidth, appcfg.PassageWays[WindowIndex].cap.width);
            //            cap.Set(CaptureProperty.FrameHeight, appcfg.PassageWays[WindowIndex].cap.height);
            //            #endregion

            //            if (!cap.IsOpened())
            //            {
            //                Log.Error(string.Format("打开视频源[CapType={0},UsbIndex={1},RtspURL={2}]未成功！", CapType, CapUsbIndex, CapRtspUrl));
            //                continue;
            //            }

            //            #region 变量、对象定义
            //            // 变量、对象定义
            //            Mat image = new Mat();
            //            int cnt_frame_compare = 0;
            //            int cnt_frame_cap = 0;

            //            TrackFaceInfo[] last_track_info = new TrackFaceInfo[0]; // 上一次的人脸检测结果

            //            int sizeTrack = Marshal.SizeOf(typeof(TrackFaceInfo));
            //            int LastSizeTrack = sizeTrack;
            //            IntPtr ptT = Marshal.AllocHGlobal(sizeTrack * (MaxFaceLen + 1));
            //            IntPtr LastptT = ptT;
            //            int faceSize = MaxFaceLen;//返回人脸数  分配人脸数和检测到人脸数的最小值
            //            int LastFaceSize = faceSize;
            //            int curSize = MaxFaceLen;//当前人脸数 输入分配的人脸数，输出实际检测到的人脸数
            //            int LastCurSize = curSize;
            //            #endregion


            //            while (true)
            //            {
            //                try
            //                {
            //                    if (canClose)
            //                    {
            //                        //canClose=True 则退出
            //                        break;
            //                    }

            //                    cnt_frame_compare++;
            //                    cnt_frame_cap++;
            //                    RotatedRect box;

            //                    // 读取一帧图像
            //                    cap.Read(image);
            //                    if (!image.Empty())
            //                    {
            //                        #region 为优化性能，跳帧进行人脸检测
            //                        // 为优化性能，跳帧进行人脸检测
            //                        if (cnt_frame_cap % appcfg.FT_FrameInterval == 0)
            //                        {
            //                            cnt_frame_cap = 0;

            //                            #region 尝试重复绘制上一次的人脸框
            //                            // 尝试重复绘制上一次的人脸框
            //                            try
            //                            {
            //                                if (last_track_info.Length > 0)
            //                                {
            //                                    for (int index = 0; index < last_track_info.Length; index++)
            //                                    {
            //                                        // 画人脸框
            //                                        box = bounding_box(last_track_info[index].landmarks, last_track_info[index].landmarks.Length);
            //                                        draw_rotated_box(ref image, ref box, new Scalar(240, 176, 0));
            //                                    }
            //                                }
            //                            }
            //                            catch (Exception ex)
            //                            {
            //                                Log.Error(string.Format("尝试重复绘制上一次的人脸框时出错！详细信息：{0}", ex));
            //                            }
            //                            #endregion

            //                            window.ShowImage(image);
            //                            Cv2.WaitKey(1);
            //                            continue;
            //                        }
            //                        #endregion

            //                        // 初始化人脸结果结构体列表
            //                        TrackFaceInfo[] track_info = new TrackFaceInfo[MaxFaceLen];
            //                        for (int i = 0; i < MaxFaceLen; i++)
            //                        {
            //                            track_info[i] = new TrackFaceInfo();
            //                            track_info[i].landmarks = new int[144];
            //                            track_info[i].headPose = new float[3];
            //                            track_info[i].face_id = 0;
            //                            track_info[i].score = 0;
            //                        }
                                    


            //                        if (Monitor.TryEnter(WindowPassageway.GetInstance().lockerFaceAPI))
            //                        {
            //                            try
            //                            {
            //                                faceSize = MaxFaceLen;//返回人脸数  分配人脸数和检测到人脸数的最小值
            //                                curSize = MaxFaceLen;//当前人脸数 输入分配的人脸数，输出实际检测到的人脸数

            //                                // 调用SDK进行人脸检测
            //                                faceSize = track_mat(ptT, image.CvPtr, ref curSize);

                                            
            //                                last_track_info = track_info;
            //                                LastSizeTrack = sizeTrack;
            //                                LastptT = ptT;
            //                                LastFaceSize = faceSize;
            //                                LastCurSize = curSize;
            //                            }
            //                            finally
            //                            {
            //                                Monitor.Exit(WindowPassageway.GetInstance().lockerFaceAPI);
            //                            }
  
            //                        }
            //                        else
            //                        {
            //                            track_info = last_track_info;
            //                            sizeTrack = LastSizeTrack;
            //                            ptT = LastptT;
            //                            faceSize = LastFaceSize;
            //                            curSize = LastCurSize;


            //                        }

            //                        Mat image_o = image.Clone();
            //                        //Console.WriteLine("faceSize = {0}", faceSize);
            //                        for (int index = 0; index < faceSize; index++)
            //                        {
            //                            IntPtr ptr = new IntPtr();
            //                            if (8 == IntPtr.Size)
            //                            {
            //                                ptr = (IntPtr)(ptT.ToInt64() + sizeTrack * index);
            //                            }
            //                            else if (4 == IntPtr.Size)
            //                            {
            //                                ptr = (IntPtr)(ptT.ToInt32() + sizeTrack * index);
            //                            }

            //                            track_info[index] = (TrackFaceInfo)Marshal.PtrToStructure(ptr, typeof(TrackFaceInfo));

            //                            // 画人脸框
            //                            box = bounding_box(track_info[index].landmarks, track_info[index].landmarks.Length);
            //                            draw_rotated_box(ref image, ref box, new Scalar(240, 176, 0));

            //                            #region 进行人脸识别
            //                            // 进行人脸识别
            //                            // 实时检测人脸识别可能会视频卡顿，可考虑跳帧  设为12识别速度较快， 也可设为24
            //                            if (cnt_frame_compare % appcfg.FC_FrameInterval == 0)
            //                            {
            //                                cnt_frame_compare = 0;

            //                                try
            //                                {
            //                                    Bitmap img_bm = MatToBitmap(image);

            //                                    // 截取人脸图片
            //                                    // 人脸区域
            //                                    OpenCvSharp.Rect rect = new OpenCvSharp.Rect(
            //                                        (int)(box.Points()[0].X),
            //                                        (int)(box.Points()[1].Y),
            //                                        (int)box.Size.Width,
            //                                        (int)box.Size.Height
            //                                        );
            //                                    if (rect.X >= 0 && rect.X + rect.Width <= image_o.Width && rect.Y >= 0 && rect.Y + rect.Height <= image_o.Height)
            //                                    {
            //                                        Mat curFace = image_o.Clone()[rect];
            //                                        Bitmap img_face = MatToBitmap(curFace);

            //                                        // 如果队列长度超过最大长度，则直接出队一个成员
            //                                        try
            //                                        {
            //                                            if (WindowPassageway.GetInstance().queue_face.Count >= appcfg.MaxQueueLen_CF)
            //                                            {
            //                                                Bitmap curimg;
            //                                                bool ret = WindowPassageway.GetInstance().queue_face.TryDequeue(out curimg);
            //                                            }
            //                                        }
            //                                        catch (Exception ex)
            //                                        {
            //                                            Log.Error(string.Format("[人脸抓拍队列]控制队列长度时出错！详细信息：{0}", ex));
            //                                        }
            //                                        WindowPassageway.GetInstance().queue_face.Enqueue(img_face);
            //                                        //img_face.Save("d:\\2.jpg");  // 测试
            //                                        Bitmap img_face_fc = MatToBitmap(curFace);
            //                                        // 如果队列长度超过最大长度，则直接出队一个成员
            //                                        try
            //                                        {
            //                                            if (queue_fc.Count >= appcfg.MaxQueueLen_FC)
            //                                            {
            //                                                Bitmap curimg;
            //                                                bool ret = queue_fc.TryDequeue(out curimg);
            //                                            }
            //                                        }
            //                                        catch (Exception ex)
            //                                        {
            //                                            Log.Error(string.Format("[人脸识别队列]控制队列长度时出错！详细信息：{0}", ex));
            //                                        }
            //                                        queue_fc.Enqueue(img_face_fc);
            //                                        //Log.Debug(string.Format("[人脸识别队列]队列长度 = {0}", queue_fc.Count));
            //                                    }
            //                                    else
            //                                    {
            //                                        Log.Error(string.Format("[人脸识别队列]人脸信息不完整！"));
            //                                    }

            //                                }
            //                                catch (Exception e)
            //                                {
            //                                    Log.Error(string.Format("[人脸识别队列]入队错误！{0}", e));
            //                                }
            //                            }
            //                            last_track_info = track_info;  // 暂存本次识别结果 => last_track_info

            //                            #endregion
            //                        }

            //                        //    Marshal.FreeHGlobal(ptT); // 不需要再释放了
                                    
            //                        //Mat displayImage = new Mat();
            //                        //Cv2.Resize(image, displayImage, new OpenCvSharp.Size(appcfg.PassageWays[WindowIndex].cap.width, appcfg.PassageWays[WindowIndex].cap.height));
            //                        window.ShowImage(image);

            //                        Cv2.WaitKey(1);

            //                    }
            //                    else
            //                    {
            //                        Log.Error("mat is empty");
            //                        break;
            //                    }

            //                }
            //                catch (Exception e)
            //                {
            //                    Log.Error(e.Message);
            //                }
            //            }

            //            // 释放资源
            //            try
            //            {
            //                image.Release();
            //                cap.Release();
            //                window.Dispose();
            //            }
            //            catch (Exception ex)
            //            {
            //                Log.Error(string.Format("释放视频资源时出错！详细信息：{0}", ex));
            //            }

            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        Log.Error(string.Format("初始化视频时出错！详细信息：{0}", ex));
            //    }

            //}

        }


        /// <summary>
        /// 清除跟踪的人脸信息
        /// </summary>
        public void clearTrackedFaces()
        {
            clear_tracked_faces();
            Console.WriteLine("after clear tracked faces");
        }


    }
}
