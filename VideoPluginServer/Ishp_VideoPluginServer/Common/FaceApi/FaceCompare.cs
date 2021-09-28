using System;
using System.Runtime.InteropServices;
using System.IO;
using OpenCvSharp;
using System.Collections.Concurrent;
using System.Drawing;
using System.Threading;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Ishp_PluginServer.Common;
using Ishp_VideoPluginServer.Common;

namespace Ishp_PluginServer.Common.FaceApi
{
    // 人脸比较1:1、1:N、抽取人脸特征值、按特征值比较等
    public class FaceCompare
    {
        // 提取人脸特征值(传图片文件路径)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_face_feature", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_face_feature(string file_name, ref int length);
        // 提取人脸特征值(传二进制图片buffer）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_face_feature_by_buf", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_face_feature_by_buf(byte[] buf, int size, ref int length);
        // 获取人脸特征值（传入opencv视频帧及人脸信息，适应于多人脸）
        //[DllImport("BaiduFaceApi.dll", EntryPoint = "get_face_feature_by_face", CharSet = CharSet.Ansi
        //    , CallingConvention = CallingConvention.Cdecl)]
        //public static extern int get_face_feature_by_face(IntPtr mat, ref TrackFaceInfo info, ref IntPtr feaptr);
        // 人脸1:1比对(传图片文件路径)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "match", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr match(string file_name1, string file_name2);
        // 人脸1:1比对（传二进制图片buffer）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "match_by_buf", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr match_by_buf(byte[] buf1, int size1, byte[] buf2, int size2);
        // 人脸1:1比对（传opencv视频帧）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "match_by_mat", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr match_by_mat(IntPtr img1, IntPtr img2);// byte[] buf1, int size1, byte[] buf2, int size2);
        // 人脸1:1比对（传人脸特征值和二进制图片buffer)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "match_by_feature", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr match_by_feature(byte[] feature, int fea_len, byte[] buf2, int size2);
        // 特征值比对（传2个人脸的特征值）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "compare_feature", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern float compare_feature(byte[] f1, int f1_len, byte[] f2, int f2_len);
        // 1:N人脸识别（传图片文件路径和库里的比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify(string image, string group_id_list, string user_id, int user_top_num = 1);
        // 1:N人脸识别（传图片二进制文件buffer和库里的比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify_by_buf", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify_by_buf(byte[] buf, int size, string group_id_list,
            string user_id, int user_top_num = 1);
        // 1:N人脸识别（传人脸特征值和库里的比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify_by_feature", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify_by_feature(byte[] feature, int fea_len, string group_id_list,
            string user_id, int user_top_num = 1);

        // 提前加载库里所有数据到内存中
        [DllImport("BaiduFaceApi.dll", EntryPoint = "load_db_face", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        public static extern bool load_db_face();

        // 1:N人脸识别（传人脸图片文件和内存已加载的整个库数据比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify_with_all", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify_with_all(string image, int user_top_num = 1);

        // 1:N人脸识别（传人脸图片文件和内存已加载的整个库数据比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify_by_buf_with_all", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify_by_buf_with_all(byte[] image, int size, int user_top_num = 1);

        // 1:N人脸识别（传人脸特征值和内存已加载的整个库数据比对）
        [DllImport("BaiduFaceApi.dll", EntryPoint = "identify_by_feature_with_all", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr identify_by_feature_with_all(byte[] feature, int fea_len, int user_top_num = 1);


        public bool canClose = false; // 是否可以关闭程序




        // 测试获取人脸特征值(2048个byte）
        public void test_get_face_feature()
        {
            byte[] fea = new byte[2048];
            string file_name = "d:\\2.jpg";
            int len = 0;
            IntPtr ptr = get_face_feature(file_name, ref len);
            if (ptr == IntPtr.Zero)
            {
                Console.WriteLine("get face feature error");
            }
            else
            {
                if (len == 2048)
                {
                    Console.WriteLine("get face feature success");
                    Marshal.Copy(ptr, fea, 0, 2048);
                    // 可保存特征值2048个字节的fea到文件中
                    // FileUtil.byte2file("d:\\fea1.txt",fea, 2048);
                }
                else
                {
                    Console.WriteLine("get face feature error");
                }
            }
        }

        // 测试获取人脸特征值(2048个byte）
        public void test_get_face_feature_by_buf()
        {
            byte[] fea = new byte[2048];
            System.Drawing.Image img = System.Drawing.Image.FromFile("d:\\2.jpg");
            byte[] img_bytes = ImageUtils.img2byte(img);
            int len = 0;
            IntPtr ptr = get_face_feature_by_buf(img_bytes, img_bytes.Length, ref len);
            if (ptr == IntPtr.Zero)
            {
                Console.WriteLine("get face feature error");
            }
            else
            {
                if (len == 2048)
                {
                    Console.WriteLine("get face feature success");
                    Marshal.Copy(ptr, fea, 0, 2048);
                    // 可保存特征值2048个字节的fea到文件中
                    //  FileUtil.byte2file("d:\\fea2.txt",fea, 2048);
                }
                else
                {
                    Console.WriteLine("get face feature error");
                }
            }
        }
        // 测试1:1比较，传入图片文件路径
        public void test_match()
        {
            string file1 = "d:\\2.jpg";
            string file2 = "d:\\8.jpg";
            IntPtr ptr = match(file1, file2);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("match res is:" + buf);
        }
        // 测试1:1比较，传入图片文件二进制buffer
        public void test_match_by_buf()
        {
            System.Drawing.Image img1 = System.Drawing.Image.FromFile("d:\\444.bmp");
            byte[] img_bytes1 = ImageUtils.img2byte(img1);

            System.Drawing.Image img2 = System.Drawing.Image.FromFile("d:\\555.png");
            byte[] img_bytes2 = ImageUtils.img2byte(img2);
            Console.WriteLine("IntPtr ptr = match_by_buf");
            IntPtr ptr = match_by_buf(img_bytes1, img_bytes1.Length, img_bytes2, img_bytes2.Length);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("match_by_buf res is:" + buf);
        }
        // 测试1:1比较，传入mat
        //public void test_match_by_mat()
        //{
        //    Mat img1 = Cv2.ImRead("d:\\444.bmp");
        //    Mat img2 = Cv2.ImRead("d:\\555.png");
        //    IntPtr ptr = match_by_mat(img1.CvPtr, img2.CvPtr);// img_bytes1, img_bytes1.Length, img_bytes2, img_bytes2.Length);
        //    string buf = Marshal.PtrToStringAnsi(ptr);
        //    Console.WriteLine("match_by_buf res is:" + buf);
        //}

        // 测试根据特征值和图片二进制buf比较
        public void test_match_by_feature()
        {
            // 获取特征值2048个字节
            byte[] fea = new byte[2048];
            string file_name = "d:\\2.jpg";
            int len = 0;
            IntPtr ptr = get_face_feature(file_name, ref len);
            if (len != 2048)
            {
                Console.WriteLine("get face feature error!");
                return;
            }
            Marshal.Copy(ptr, fea, 0, 2048);
            // 获取图片二进制buffer
            System.Drawing.Image img2 = System.Drawing.Image.FromFile("d:\\8.jpg");
            byte[] img_bytes2 = ImageUtils.img2byte(img2);

            IntPtr ptr_res = match_by_feature(fea, fea.Length, img_bytes2, img_bytes2.Length);
            string buf = Marshal.PtrToStringAnsi(ptr_res);
            Console.WriteLine("match_by_feature res is:" + buf);

        }

        // 测试1:N比较，传入图片文件路径
        public /*void*/string test_identify(string str, string usr_grp, string usr_id)
        {
            string file1 = str;//"d:\\6.jpg";
            string user_group = usr_grp;//"test_group";
            string user_id = usr_id;//"test_user";
            IntPtr ptr = identify(file1, user_group, user_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("identify res is:" + buf);
            return buf;
        }

        // 测试1:N比较，传入图片文件二进制buffer
        public void test_identify_by_buf(string str, string usr_grp, string usr_id)
        {
            System.Drawing.Image img = System.Drawing.Image.FromFile(str);//"d:\\2.jpg");
            byte[] img_bytes = ImageUtils.img2byte(img);

            string user_group = usr_grp;//"test_group";
            string user_id = usr_id;// "test_user";
            IntPtr ptr = identify_by_buf(img_bytes, img_bytes.Length, user_group, user_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("identify_by_buf res is:" + buf);
        }

        // 测试1:N比较，传入提取的人脸特征值
        public void test_identify_by_feature()
        {
            // 获取特征值2048个字节
            byte[] fea = new byte[2048];
            string file_name = "d:\\2.jpg";
            int len = 0;
            IntPtr ptr = get_face_feature(file_name, ref len);
            if (len != 2048)
            {
                Console.WriteLine("get face feature error!");
                return;
            }
            Marshal.Copy(ptr, fea, 0, 2048);

            string user_group = "test_group";
            string user_id = "test_user";
            IntPtr ptr_res = identify_by_feature(fea, fea.Length, user_group, user_id);
            string buf = Marshal.PtrToStringAnsi(ptr_res);
            Console.WriteLine("identify_by_feature res is:" + buf);
        }
        // 通过特征值比对（1:1）
        public void test_compare_feature()
        {
            // 获取特征值1   共2048个字节
            byte[] fea1 = new byte[2048];
            string file_name1 = "d:\\2.jpg";
            int len1 = 0;
            IntPtr ptr1 = get_face_feature(file_name1, ref len1);
            if (len1 != 2048)
            {
                Console.WriteLine("get face feature error!");
                return;
            }
            Marshal.Copy(ptr1, fea1, 0, 2048);

            // 获取特征值2   共2048个字节
            byte[] fea2 = new byte[2048];
            string file_name2 = "d:\\8.jpg";
            int len2 = 0;
            IntPtr ptr2 = get_face_feature(file_name2, ref len2);
            if (len2 != 2048)
            {
                Console.WriteLine("get face feature error!");
                return;
            }
            Marshal.Copy(ptr2, fea2, 0, 2048);
            // 比对
            float score = compare_feature(fea1, len1, fea2, len2);
            Console.WriteLine("compare_feature score is:" + score);
        }

        // 测试1:N比较，传入提取的人脸特征值和已加载的内存中整个库比较
        public void test_identify_by_feature_with_all()
        {
            // 加载整个数据库到内存中
            load_db_face();
            // 获取特征值2048个字节
            byte[] fea = new byte[2048];
            string file_name = "d:\\2.jpg";
            int len = 0;
            IntPtr ptr = get_face_feature(file_name, ref len);
            if (len != 2048)
            {
                Console.WriteLine("get face feature error!");
                return;
            }
            Marshal.Copy(ptr, fea, 0, 2048);
            IntPtr ptr_res = identify_by_feature_with_all(fea, fea.Length);
            string buf = Marshal.PtrToStringAnsi(ptr_res);
            Console.WriteLine("identify_by_feature_with_all res is:" + buf);
        }

        // 测试1:N比较，传入图片文件路径和已加载的内存中整个库比较
        public string test_identify_with_all(string file)
        {
            // 加载整个数据库到内存中
            load_db_face();
            // 1:N
            IntPtr ptr = identify_with_all(file);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("identify_with_all res is:" + buf);
            return buf;
        }

        // 测试1:N比较，传入图片文件二进制buffer和已加载的内存中整个库比较
        public string test_identify_by_buf_with_all(byte[] img_bytes)
        {
            // 加载整个数据库到内存中
            //load_db_face();
            // 1:N
            //System.Drawing.Image img = System.Drawing.Image.FromFile("d:\\2.jpg");
            //byte[] img_bytes = ImageUtils.img2byte(img);

            IntPtr ptr = identify_by_buf_with_all(img_bytes, img_bytes.Length);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("identify_by_buf_with_all res is:" + buf);
            return buf;
        }

        ///// <summary>
        ///// 人脸识别1:N , 传入图片文件二进制buffer和已加载的内存中整个库比较
        ///// </summary>
        ///// <param name="img">要识别的人脸照片</param>
        //public void fc_1N_byBuf(Bitmap img)
        //{
        //    try
        //    {
        //        byte[] img_bytes = ImageUtil.img2byte(img);

        //        IntPtr ptr;

        //        //if (Monitor.Enter(WindowPassageway.GetInstance().lockerFaceAPI))
        //        lock (WindowPassageway.GetInstance().lockerFaceAPI)
        //        {
        //            Thread.Sleep(AppConfig.GetInstance().FC_SDK_Delay);  // 由于SDK多线程不安全，采用延时进行处理
        //            ptr = identify_by_buf_with_all(img_bytes, img_bytes.Length);
        //        }

        //        string buf = Marshal.PtrToStringAnsi(ptr);
        //        Log.Debug(string.Format("人脸识别结果: {0}", buf));

        //        // 判断识别是否成功
        //        JObject jRet = JObject.Parse(buf);
        //        string errno = jRet["errno"].ToString();
        //        if (errno.Equals("0"))
        //        {
        //            // 识别成功，将结果压入主界面显示队列
        //            // 构建比对结果
        //            JObject jFCret = new JObject();
        //            JArray retData = (JArray)JsonConvert.DeserializeObject(jRet["data"]["result"].ToString());
        //            float curScore = float.Parse(retData[0]["score"].ToString());
        //            if (curScore >= AppConfig.GetInstance().FaceSetting.match_score_thr)
        //            {
        //                // 识别结果的分值 大于等于 设定的阀值 时才显示
        //                jFCret["mantype"] = retData[0]["group_id"].ToString();
        //                jFCret["faceid"] = retData[0]["user_id"].ToString();
        //                jFCret["facedata"] = ImageUtil.GetBase64FromImage(img);
        //                jFCret["xm"] = "";
        //                jFCret["score"] = retData[0]["score"].ToString();
        //                jFCret["reason"] = "";
        //                jFCret["inouttime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        //                // 查询数据库 获取 姓名、注册照片
        //                try
        //                {
        //                    JObject jFaceInfo = dbservice.queryFaceInfo(retData[0]["user_id"].ToString());
        //                    JArray jRetData = (JArray)JsonConvert.DeserializeObject(jFaceInfo["result"]["data"].ToString());
        //                    foreach (JObject curRow in jRetData)
        //                    {
        //                        jFCret["xm"] = curRow["xm"].ToString();
        //                        jFCret["regfacedata"] = curRow["faceimage"].ToString();
        //                        jFCret["mantype"] = curRow["sfbm"].ToString();
        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    Log.Error(string.Format("获取人脸信息（姓名、注册照片等）未成功！详细信息: {0}", ex));
        //                }

        //                //TODO 如果为在押人员，则查询是否有办理出所手续（提解出所、临时出所、请假出所、出所就医、处置出所等）




        //                // 如果为外来人员，则查询最近未入所的进监区登记记录
        //                // tip_status 0:异常 红色（未登记）  1:正常 绿色
        //                if (jFCret["mantype"].ToString().Equals("10"))
        //                {
        //                    try
        //                    {
        //                        JObject jFaceInfo = dbservice.queryWlryJjqXX(retData[0]["user_id"].ToString());
        //                        JArray jRetData = (JArray)JsonConvert.DeserializeObject(jFaceInfo["result"]["data"].ToString());
        //                        jFCret["tip_status"] = "0";
        //                        jFCret["tip_msg"] = "未登记";
        //                        foreach (JObject curRow in jRetData)
        //                        {
        //                            // 提示信息（状态、消息内容）
        //                            jFCret["tip_status"] = "1";
        //                            jFCret["tip_msg"] = curRow["jjq_symc"].ToString();

        //                            // 进监区登记记录ID
        //                            jFCret["jjq_jlid"] = curRow["id"].ToString();

        //                        }
        //                    }
        //                    catch (Exception ex)
        //                    {
        //                        Log.Error(string.Format("获取外来人员进监区登记信息未成功！详细信息: {0}", ex));
        //                    }
        //                }
                         



        //                // 压入队列
        //                WindowPassageway.GetInstance().queue_fcResult.Enqueue(jFCret);
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        Log.Error(string.Format("人脸识别未成功！详细信息: {0}", e));
        //    }
        //}

        ///// <summary>
        ///// 开始人脸识别线程
        ///// </summary>
        ///// <param name="queue_fc"></param>
        //public void startFaceCompare(ConcurrentQueue<Bitmap> queue_fc)
        //{
        //    Bitmap curimg;

        //    // 加载本地人脸库到内存
        //    lock (WindowPassageway.GetInstance().lockerFaceAPI)
        //    {
        //        load_db_face();
        //    }
            
        //    while (true)
        //    {
        //        if (canClose)
        //        {
        //            break;
        //        }
        //        // 循环处理待识别人脸
        //        try
        //        {
        //            bool ret = queue_fc.TryDequeue(out curimg);
        //            if (ret & !(curimg == null))
        //            {
        //                fc_1N_byBuf(curimg);
        //            }
        //        }
        //        catch
        //        {

        //        }
        //        Thread.Sleep(100);
        //    }
        //}
    }
}
