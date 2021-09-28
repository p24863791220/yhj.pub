using Emgu.CV;
using Emgu.CV.CvEnum;
using Emgu.CV.Face;
using Emgu.CV.Structure;
using Emgu.CV.Util;
using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace threeYears
{
    public static class kindfeilei
    {
        public static string trianfacePath = Application.StartupPath.ToString() + @"\trianface\";
        //static void findfacetarget()
        //{
        //    //DataSet数据格式化
        //    //Console.WriteLine("Please enter face id: ");
        //    //string strID = Console.ReadLine();
        //    //Console.WriteLine("Your face id is : {0}", strID);
        //    //Console.WriteLine("Please enter sample num: ");
        //    //string strNum = Console.ReadLine();
        //    //Console.WriteLine("Sample num is : {0}", strNum);

        //    CascadeClassifier face_cascade = new CascadeClassifier("haarcascade_frontalface_alt.xml"); //加载人脸分类器
        //    Mat faceImg = CvInvoke.Imread("./刘亦菲/1 (2).jpg");
        //    Mat gray = new Mat();
        //    CvInvoke.CvtColor(faceImg, gray, ColorConversion.Bgr2Gray);
        //    CvInvoke.EqualizeHist(gray, gray); //直方图均衡化避免亮度偏暗或偏亮

        //    Rectangle[] facesDetect = face_cascade.DetectMultiScale(gray, 1.1, 2, new Size(50, 50));
        //    foreach (Rectangle face in facesDetect)
        //    {
        //        CvInvoke.Rectangle(faceImg, face, new MCvScalar(0, 255, 0), 2); //矩形标注
        //        Mat faceROI = new Mat(gray, face);
        //        CvInvoke.Resize(faceROI, faceROI, new Size(75, 75));
        //        string savePath = string.Format("DataSet/{0}_{1}.jpg", strID, strNum);
        //        CvInvoke.Imwrite(savePath, faceROI);
        //    }

        //    CvInvoke.Imshow("FaceDetect", faceImg);
        //    CvInvoke.WaitKey(0);
        //}
        public static void trainface(string  facepath="")
        {
            //训练样本
            //批量读取无序图片
            //记得添加using System.IO;
            if (facepath == "") facepath = trianfacePath;
            var files = Directory.GetFiles(facepath,"*.jpg"); //文件夹下jpg bmp类型文件 
            foreach (var file in files)
                Debug.WriteLine(file);

            DirectoryInfo dir = new DirectoryInfo(facepath);
            FileInfo[] afi = dir.GetFiles("*.*");
            string fileName;
            VectorOfMat images = new VectorOfMat(); //Mat图像集合
            VectorOfInt labels = new VectorOfInt(); //int类型ID标签集合
            for (int i = 0; i < afi.Length; i++)
            {
                fileName = afi[i].Name.ToLower();
                if (fileName.EndsWith(".jpg"))
                {
                    //Console.WriteLine(fileName); //1_1.jpg
                    //Console.WriteLine("./DataSet/" + fileName);
                    string[] strArray = fileName.Split('_');
                    int index = Convert.ToInt32(strArray[0]);
                    Mat img = CvInvoke.Imread(facepath + fileName,ImreadModes.AnyColor); //以灰度模式读取
                    images.Push(img); //将图像加入到图像集合
                    int[] a = (index).ToString().Select(s => int.Parse(s.ToString())).ToArray(); //格式化ID
                    labels.Push(a); //将ID加入到ID集合
                }
            }
            
            FaceRecognizer model = new EigenFaceRecognizer(); //创建人脸识别类为EigenFaceRecognizer类
            //FisherFaceRecognizer fmode = new FisherFaceRecognizer();
            model.Train(images, labels); //人脸识别分类器训练（最少2个不同人脸ID）
            model.Write(facepath + "faceData.xml"); //将训练好的分类器保存为xml文件
            Debug .WriteLine("train finished!");
        }
        //public static void findface()
        //{
        //    //人脸识别
        //    string xmlPath = "./xml/faceData.xml"; //训练好的xml文件路径
        //    FaceRecognizer model = new EigenFaceRecognizer(); //创建人脸识别类为EigenFaceRecognizer类
        //    model.Read(xmlPath);//加载人脸识别分类器

        //    CascadeClassifier face_cascade = new CascadeClassifier("haarcascade_frontalface_alt.xml"); //加载人脸分类器
        //    Mat faceImg = CvInvoke.Imread("./刘亦菲/1 (19).jpg");
        //    Mat faceImg2 = CvInvoke.Imread("./黄晓明/1 (15).jpg");
        //    Mat gray = new Mat();
        //    CvInvoke.CvtColor(faceImg, gray, ColorConversion.Bgr2Gray);
        //    CvInvoke.EqualizeHist(gray, gray); //直方图均衡化避免亮度偏暗或偏亮

        //    Rectangle[] facesDetect = face_cascade.DetectMultiScale(gray, 1.1, 2, new Size(50, 50));
        //    foreach (Rectangle face in facesDetect)
        //    {
        //        CvInvoke.Rectangle(faceImg, face, new MCvScalar(0, 255, 0), 2); //矩形标注
        //        Mat faceROI = new Mat(gray, face);
        //        CvInvoke.Resize(faceROI, faceROI, new Size(75, 75));
        //        FaceRecognizer.PredictionResult predictionResult = new FaceRecognizer.PredictionResult(); //定义识别结果类其中包含ID和相似距离
        //        predictionResult = model.Predict(faceROI); //人脸预测识别，返回ID和相似距离
        //        int ID = predictionResult.Label; //获取识别到的人脸ID，ID和DB中的姓名对应起来
        //        string strName = "UnKnown";
        //        if (ID == 1)
        //            strName = "Huang Xiaoming";
        //        else if (ID == 2)
        //            strName = "Liu Yifei";
        //        CvInvoke.PutText(faceImg, strName, new Point(face.X, face.Y), FontFace.HersheySimplex, 0.8,
        //                            new MCvScalar(255, 0, 255), 2);
        //    }

        //    CvInvoke.Imshow("FaceDetect", faceImg);
        //    CvInvoke.WaitKey(0);
        //}
        //public static void trainchinese()
        //{
        //    //中文标识姓名
        //    Mat nameImg1 = CvInvoke.Imread("Name1.png");
        //    Mat nameImg2 = CvInvoke.Imread("Name2.png");
        //    Mat nameImg3 = CvInvoke.Imread("Name3.png");
        //    string xmlPath = "./xml/faceData.xml"; //训练好的xml文件路径
        //    FaceRecognizer model = new EigenFaceRecognizer(); //创建人脸识别类为EigenFaceRecognizer类
        //    model.Read(xmlPath);//加载人脸识别分类器

        //    CascadeClassifier face_cascade = new CascadeClassifier("haarcascade_frontalface_alt.xml"); //加载人脸分类器
        //    Mat faceImg = CvInvoke.Imread("./刘亦菲/1 (2).jpg");
        //    Mat faceImg2 = CvInvoke.Imread("./黄晓明/1 (1).jpg");
        //    Mat faceImg3 = CvInvoke.Imread("1.jpg");
        //    Mat gray = new Mat();
        //    CvInvoke.CvtColor(faceImg, gray, ColorConversion.Bgr2Gray);
        //    CvInvoke.EqualizeHist(gray, gray); //直方图均衡化避免亮度偏暗或偏亮

        //    Rectangle[] facesDetect = face_cascade.DetectMultiScale(gray, 1.1, 2, new Size(50, 50));
        //    foreach (Rectangle face in facesDetect)
        //    {
        //        CvInvoke.Rectangle(faceImg, face, new MCvScalar(0, 255, 0), 2); //矩形标注
        //        Mat faceROI = new Mat(gray, face);
        //        CvInvoke.Resize(faceROI, faceROI, new Size(75, 75));
        //        FaceRecognizer.PredictionResult predictionResult = new FaceRecognizer.PredictionResult(); //定义识别结果类其中包含ID和相似距离
        //        predictionResult = model.Predict(faceROI); //人脸预测识别，返回ID和相似距离
        //        int ID = predictionResult.Label; //获取识别到的人脸ID，ID和DB中的姓名对应起来
        //        Mat nameROI = new Mat(faceImg, new Rectangle(face.X, face.Y - nameImg1.Rows, nameImg1.Cols, nameImg1.Rows));
        //        if (ID == 1)
        //            nameImg1.CopyTo(nameROI);
        //        else if (ID == 2)
        //            nameImg2.CopyTo(nameROI);
        //        else
        //            nameImg3.CopyTo(nameROI);
        //    }

        //    CvInvoke.Imshow("FaceDetect", faceImg);
        //    CvInvoke.WaitKey(0);
        //}
        //public static void videofacefind()
        //{
        //    //视频人脸识别
        //    VideoCapture cap = new VideoCapture(0);
        //    if (!cap.IsOpened)
        //    {
        //        Console.WriteLine("Open video failed!");
        //        return;
        //    }
        //    Mat frame = new Mat();
        //    Mat gray = new Mat();
        //    while (true)
        //    {
        //        cap.Read(frame);
        //        if (frame.IsEmpty)
        //        {
        //            Console.WriteLine("frame is empty ...");
        //            break;
        //        }
        //        Mat result = FaceRecFunc(frame);
        //        CvInvoke.Imshow("video", result);
        //        if (CvInvoke.WaitKey(30) == 27)
        //            break;
        //    }
        //}
        public static CascadeClassifier face_cascade ;
        public static FaceRecognizer modelface; //创建人脸识别类为EigenFaceRecognizer类
        public static Bitmap FaceRecFunc(Mat faceImg,string trianpath="")
        {
            Mat result = faceImg.Clone();
            string xmlPath;
            if (trianpath == "")
                 xmlPath = trianfacePath + "faceData.xml"; //训练好的xml文件路径
            else
                xmlPath = trianpath;
            if (modelface == null)
            {
                modelface = new EigenFaceRecognizer();
                modelface.Read(xmlPath);//加载人脸识别分类器
                face_cascade = new CascadeClassifier(trianfacePath + "haarcascade_frontalface_alt.xml"); //加载人脸分类器
            }
        
            Mat gray = new Mat();
            CvInvoke.CvtColor(faceImg, gray, ColorConversion.Bgr2Gray);
            CvInvoke.EqualizeHist(gray, gray); //直方图均衡化避免亮度偏暗或偏亮
            try
            {
                Rectangle[] facesDetect = face_cascade.DetectMultiScale(gray, 1.1, 2, new Size(50, 50));
                foreach (Rectangle face in facesDetect)
                {
                    CvInvoke.Rectangle(result, face, new MCvScalar(0, 0, 255), 2); //矩形标注
                    Mat faceROI = new Mat(gray, face);
                    CvInvoke.Resize(faceROI, faceROI, new Size(75, 75));
                    FaceRecognizer.PredictionResult predictionResult = new FaceRecognizer.PredictionResult(); //定义识别结果类其中包含ID和相似距离
                    predictionResult = modelface.Predict(faceROI); //人脸预测识别，返回ID和相似距离
                    int ID = predictionResult.Label; //获取识别到的人脸ID，ID和DB中的姓名对应起来
                    string strName = "UnKnown";
                    if (ID == 1)
                        strName = "yang";
                    else if (ID == 2)
                        strName = "pot2";
                    CvInvoke.PutText(result, strName, new Point(face.X, face.Y), FontFace.HersheySimplex, 0.8,
                                        new MCvScalar(255, 0, 255), 2);
                }
            }
            catch(Exception ex)
            {
            }
            Image<Bgra,byte> resulti= result.ToImage<Bgra, byte>();
            return resulti.ToBitmap ();
        }
    }
}
