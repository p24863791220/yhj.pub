
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenCvSharp;
//using TensorFlow;
using System.IO;
using OpenCvSharp.Dnn;
using OpenCvSharp.XFeatures2D;
using OpenCvSharp.Extensions;
using System.Windows.Forms;
using System.Drawing;
using Point = OpenCvSharp.Point;
using Size = OpenCvSharp.Size;

namespace 螺丝自动锁付
{
   public static  class maskrcnnpredict
    {
        public static void test()
        {

            
        }
        public static Bitmap  RunTextRecog2(Bitmap bt)
        {
            using (Mat img = bt.ToMat())
            using (Mat img_gray = new Mat())
            using (Mat img_sobel = new Mat())
            using (Mat img_threshold = new Mat())
            {
                Cv2.CvtColor(img, img_gray, ColorConversionCodes.BGR2GRAY);
                Cv2.Sobel(img_gray, img_sobel, MatType.CV_8U, 1, 0, 3, 1, 0, BorderTypes.Default);
                Cv2.Threshold(img_sobel, img_threshold, 0, 255, ThresholdTypes.Otsu | ThresholdTypes.Binary);
                return img_threshold.ToBitmap();
            }
        }


        public static System.Collections.Generic . List<System .Drawing.Rectangle> RunTextRecog(Bitmap bt)
        {
            System.Collections.Generic.List<System.Drawing.Rectangle> boundRect = new List<System.Drawing.Rectangle >();
            using (Mat img = bt.ToMat ())
            using (Mat img_gray = new Mat())
            using (Mat img_sobel = new Mat())
            using (Mat img_threshold = new Mat())
            {
                Cv2.CvtColor(img, img_gray, ColorConversionCodes.BGR2GRAY);
                Cv2.Sobel(img_gray, img_sobel, MatType.CV_8U, 1, 0, 3, 1, 0, BorderTypes.Default);
                Cv2.Threshold(img_sobel, img_threshold, 0, 255, ThresholdTypes.Otsu | ThresholdTypes.Binary);
                using (Mat element = Cv2.GetStructuringElement(MorphShapes.Rect, new Size(10, 15)))
                {
                    Cv2.MorphologyEx(img_threshold, img_threshold, MorphTypes.Close, element);

                    Point[][] edgesArray = img_threshold.Clone().FindContoursAsArray(RetrievalModes.External, ContourApproximationModes.ApproxNone);
                    foreach (Point[] edges in edgesArray)
                    {
                        Point[] normalizedEdges = Cv2.ApproxPolyDP(edges, 17, true);
                        var appRect=  Cv2.BoundingRect(normalizedEdges);

                        boundRect.Add(new Rectangle( appRect.X ,appRect.Y,appRect.Width ,appRect.Height ));
                    }
                }
            }
            return boundRect;
        }
        public static Bitmap exemaskrcnn(Bitmap bt)
        {
            String textGraph = Application.StartupPath.ToString() + @"\maskrcnn\mask_rcnn.pbtxt";
            String modelWeights = Application.StartupPath.ToString() + @"\maskrcnn\frozen_inference_graph.pb";
            String classesFile = Application.StartupPath.ToString() + @"\maskrcnn\mscoco_labels.names";
            String colorsFile = Application.StartupPath.ToString() + @"\maskrcnn\colors.txt";

            float confThreshold = 0.3f;  //此处只是设置你的预测框阈值，判断是否显示
            float maskThreshold = 0.3f;


            List<string> classes = new List<string>();   //用来存放类型数据在其中
            List<Scalar> colors = new List<Scalar>();   //用来存放画图的颜色
            Mat blob;
            float m_fWidthScale;
            float m_fHeighScale;

            //下面这段主要是用于读取文件，并将其中内容放置classes中。
            //和上一篇文章中的void LoadLabelAndColor()函数一个意思，不懂可以去看看python版本或者C++版本
            FileStream myfs = new FileStream(classesFile, FileMode.Open);
            StreamReader reader = new StreamReader(myfs);
            string con;
            con = reader.ReadToEnd();
            var a = con.Split(new string[] { "\r\n" }, StringSplitOptions.None);


            foreach (var ai in a)
            {
                Console.WriteLine(ai);
                classes.Add(ai);
            }

            //这个地方也是读取文件，但是没用上
            FileStream myfs1 = new FileStream(colorsFile, FileMode.OpenOrCreate);
            StreamReader reader1 = new StreamReader(myfs1);
            string con1;
            con1 = reader1.ReadToEnd();
            var a1 = con1.Split(new string[] { "\r\n" }, StringSplitOptions.None);


            //因为我这里单独拿出来了
            colors.Add(new Scalar(0, 255, 0));
            colors.Add(new Scalar(0, 0, 255));
            colors.Add(new Scalar(255, 0, 0));


            OpenCvSharp.Dnn.Net net=new OpenCvSharp.Dnn.Net();
            net.SetPreferableBackend(Backend.OPENCV);    //opencv是使用intel编译的
            net.SetPreferableTarget(Target.CPU);
            net = OpenCvSharp.Dnn.CvDnn.ReadNetFromTensorflow(modelWeights,textGraph);



            int ImgWidth =300;
            int ImgHight = 300;

            Mat frame = bt.ToMat ();

            Mat m_DstMat = frame.Clone();
            OpenCvSharp.Size s2f = new OpenCvSharp.Size(ImgWidth, ImgHight);
            Cv2.Resize(frame, frame, s2f);

            m_fWidthScale = (float)(m_DstMat.Cols * 1.0 / frame.Cols);
            m_fHeighScale = (float)(m_DstMat.Rows * 1.0 / frame.Rows);

            // Stop the program if reached end of video
            if (frame.Empty())
            {
                return null;
            }


            blob = OpenCvSharp.Dnn.CvDnn.BlobFromImage(frame, 1.0, new OpenCvSharp.Size(frame.Cols, frame.Rows), new Scalar(), true, false);

            net.SetInput(blob);

            List<string> outNames = new List<string>(2);
            outNames.Add("detection_out_final");  //此处是预测的边框点
            outNames.Add("detection_masks");  //这些名字设置和模型中的设置有关系，主要也是利用名称取索引相应的结果，此处是预测的掩模图

            List<Mat> outs = new List<Mat>();


            Mat outDetections;
            Mat outMasks;

            //预测的图我选择了分开写，调用其他两种出不来，原因还在找，知道的可以交流交流，谢谢。详情可以打开net.ForWard()看一看
            //结果有三种：
            /*public Mat Forward([NullableAttribute(2)] string? outputName = null);
public void Forward(IEnumerable<Mat> outputBlobs, [NullableAttribute(2)] string? outputName = null);
public void Forward(IEnumerable<Mat> outputBlobs, IEnumerable<string> outBlobNames);*/
            outMasks = net.Forward("detection_masks");
            outDetections = net.Forward("detection_out_final");


            int numDetections = outDetections.Size(2);
            int numClasses = outMasks.Size(1);


            // 预测框结果outDetections   掩膜结果outMasks 
            outDetections = outDetections.Reshape(1, (int)outDetections.Total() / 7);
            for (int i = 0; i < numDetections; ++i)
            {
                float score = outDetections.At<float>(i, 2);
                if (score > confThreshold)
                //if (score > 0.2)
                {
                    // Extract the bounding box
                    int classId = (int)(outDetections.At<float>(i, 1));
                    int left = (int)(frame.Cols * outDetections.At<float>(i, 3));
                    int top = (int)(frame.Rows * outDetections.At<float>(i, 4));
                    int right = (int)(frame.Cols * outDetections.At<float>(i, 5));
                    int bottom = (int)(frame.Rows * outDetections.At<float>(i, 6));

                    left = Math.Max(0, Math.Min(left, frame.Cols - 1));
                    top = Math.Max(0, Math.Min(top, frame.Rows - 1));
                    right = Math.Max(0, Math.Min(right, frame.Cols - 1));
                    bottom = Math.Max(0, Math.Min(bottom, frame.Rows - 1));
                    Rect box = new Rect(left, top, right - left + 1, bottom - top + 1);

                    /************************************************/
                    box.X = (int)Math.Round(box.X * m_fWidthScale);
                    box.Y = (int)Math.Round(box.Y * m_fHeighScale);
                    box.Width = (int)Math.Round(box.Width * m_fWidthScale);
                    box.Height = (int)Math.Round(box.Height * m_fHeighScale);
                    /************************************************/

                    // Extract the mask for the object
                    Mat objectMask = new Mat(outMasks.Size(2), outMasks.Size(3), MatType.CV_32F, outMasks.Ptr(i, classId));
                    // Draw bounding box, colorize and show the mask on the image

                    OpenCvSharp.Scalar s3 = new Scalar(255, 178, 50);

                    //Draw a rectangle displaying the bounding box
                    Cv2.Rectangle(m_DstMat, new OpenCvSharp.Point(box.X, box.Y), new OpenCvSharp . Point(box.X + box.Width, box.Y + box.Height), s3, 3);



                    //Get the label for the class name and its confidence
                    string label1;
                    label1 = score.ToString("F4");
                    string labelasdfa;
                    labelasdfa = classes[classId] + ":" + label1;



                    //Display the label at the top of the bounding box
                    int baseLine;
                    OpenCvSharp.Size labelSize = Cv2.GetTextSize(labelasdfa, 0, 0.5, 1, out baseLine);
                    box.Y = Math.Max(box.Y, labelSize.Height);

                    Cv2.Rectangle(m_DstMat, new OpenCvSharp . Point(box.X, box.Y - Math.Round(1.5 * labelSize.Height)), new OpenCvSharp. Point(box.X + Math.Round(1.5 * labelSize.Width), box.Y + baseLine), new Scalar(255, 255, 255), Cv2.FILLED);

                    Cv2.PutText(m_DstMat, labelasdfa, new OpenCvSharp. Point(box.X, box.Y), 0, 0.75, new Scalar(0, 0, 0), 1);


                    Scalar color = colors[classId % colors.Capacity];

                    // Resize the mask, threshold, color and apply it on the image
                    Cv2.Resize(objectMask, objectMask, new OpenCvSharp . Size(box.Width, box.Height));


                    Mat mask = objectMask;

                    Mat pos1 = new Mat(m_DstMat, box);


                    //Mat coloredRoi = (0.3 * color + 0.7 * m_DstMat(box));


                    Mat coloredRoi = new Mat(m_DstMat, box);
                    coloredRoi.ConvertTo(coloredRoi, MatType.CV_8UC3);



                    mask.ConvertTo(mask, MatType.CV_8U);
                    Point[][] contours;
                    Cv2.FindContours(mask,out contours, out HierarchyIndex[] hierarchy, RetrievalModes.CComp, ContourApproximationModes.ApproxSimple);

                    Cv2.DrawContours(coloredRoi, contours, -1, color, 5, LineTypes.Link8, hierarchy, 100);

                    Mat pos = new Mat(m_DstMat, box);
                    coloredRoi.CopyTo(pos, mask);


                }
            }


            double[] layersTimes = new double[] { };
            double freq = Cv2.GetTickFrequency() / 1000;
            double t = net.GetPerfProfile(out layersTimes) / freq;
            string label = "Inference time for a frame " + t.ToString("F4") + "ms";

            OpenCvSharp.Scalar s2 = new Scalar(0, 0, 0);
            OpenCvSharp.Point xy = new OpenCvSharp . Point(0, 15);
            Cv2.PutText(m_DstMat, label, xy, 0, 0.5, s2);
            Cv2.ImShow("Result", m_DstMat);
            return m_DstMat.ToBitmap();
           
            //Cv2.WaitKey(0);


        }
    }
}
