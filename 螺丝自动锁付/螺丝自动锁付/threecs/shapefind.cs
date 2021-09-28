using Emgu.CV;
using Emgu.CV.CvEnum;
using Emgu.CV.Structure;
using Emgu.CV.Util;

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;



namespace 螺丝自动锁付
{
    public static class shapefind
    {
        public static void linesPfind(string imagePath = "", PictureBox pt = null, int linelength = 20)
        {
            if (imagePath == "" && pt == null) return;
            //从文件加载图像
            //Image<Bgr, byte> src=new Image<Bgr, byte>();
            Mat srcmt = new Mat();
            //Image<Bgr, byte> imageSource;
            if (imagePath != "")
                //imageSource = new Image<Bgr, byte>(imagePath);
                srcmt = new Mat(imagePath);
            if (pt != null)
            {
                Bitmap bt = new Bitmap(pt.Image);
                srcmt = bt.ToMat();
            }
            CvInvoke.Imshow("src", srcmt);
            //将图像转换为灰度
            UMat grayImage = new UMat();
            CvInvoke.CvtColor(srcmt, grayImage, ColorConversion.Bgr2Gray);
            //使用高斯滤波去除噪声
            CvInvoke.GaussianBlur(grayImage, grayImage, new Size(5, 5), 3);
            //CvInvoke.Imshow("Blur Image", grayImage);

            #region Lines detection
            UMat cannyEdges = new UMat();
            CvInvoke.Canny(grayImage, cannyEdges, 300, 500, 7);
            CvInvoke.Imshow("edges Image", cannyEdges);
            //IInputArray image,//8位单通道二进制图像
            //double rho,//累加器的距离分辨率，以像素为单位
            //double theta, 累加器的角度分辨率，以弧度表示
            //int threshold,//累加器阈值参数，只返回达到票数的
            //double minLineLength = 0,//最小线长，过短的线段被放弃
            //double maxGap = 0//在同一行上的点之间允许的最大距离
            LineSegment2D[] lines = CvInvoke.HoughLinesP(cannyEdges, 2, Math.PI / 30.0, 50, linelength, 20);
            #endregion

            #region draw lines
            Image<Bgr, Byte> lineImage = srcmt.ToImage<Bgr, Byte>().Clone();
            foreach (LineSegment2D line in lines)
                lineImage.Draw(line, new Bgr(Color.Red), 2);
            CvInvoke.Imshow("lineImage", lineImage);
            //CvInvoke.WaitKey();
            #endregion
        }
        public static void linesfind(bool linespbool = false, string imagePath = "", PictureBox pt = null, int linelength = 20, double corner = 10, int distance = 20, double jinbu = 1)
        {
            ////载入原始图
            //Mat srcImage = CvInvoke.Imread("Building2.jpg");
            if (imagePath == "" && pt == null) return;
            //从文件加载图像
            //Image<Bgr, byte> src=new Image<Bgr, byte>();
            Mat srcmt = new Mat();
            //Image<Bgr, byte> imageSource;
            if (imagePath != "")
                //imageSource = new Image<Bgr, byte>(imagePath);
                srcmt = new Mat(imagePath);
            if (pt != null)
            {
                Bitmap bt = new Bitmap(pt.Image);
                srcmt = bt.ToMat();
            }
            Image<Bgr, Byte> img = srcmt.ToImage<Bgr, byte>();//   new Image<Bgr, byte>(fileNameTextBox.Text)   .Resize(400, 400, Emgu.CV.CvEnum.Inter.Linear, true);
            UMat uimage = new UMat();
            CvInvoke.CvtColor(img, uimage, ColorConversion.Bgr2Gray);

            //use image pyr to remove noise
            UMat pyrDown = new UMat();
            CvInvoke.PyrDown(uimage, pyrDown);
            CvInvoke.PyrUp(pyrDown, uimage);
            //临时变量和目标图的定义
            UMat tempImage = new UMat(), dstImage = new UMat();

            //进行Canny边缘检测
            CvInvoke.Canny(srcmt, tempImage, 80, 240);
            //CvInvoke.Sobel(srcmt, tempImage, 100,250);
            //灰度转换，此处dstImage之所以要转换成color形式，是为了后面绘制line时，可以使用彩色line
            CvInvoke.CvtColor(tempImage, dstImage, ColorConversion.Gray2Bgr);
            if (linespbool = true)
            {
                LineSegment2D[] linesp = CvInvoke.HoughLinesP(
                               tempImage,
                               distance,//1, //Distance resolution in pixel-related units
                               Math.PI / corner,// Math.PI / 45.0, //Angle resolution measured in radians.
                               20, //threshold
                               linelength,//30, //min Line width
                               jinbu);//10); //gap between lines
                                      //LineSegment2D[] linesp = CvInvoke.HoughLinesP(tempImage, distance, Math.PI / corner, 50, linelength, jinbu);
                Image<Bgr, Byte> lineImage = srcmt.ToImage<Bgr, Byte>().Clone();
                foreach (LineSegment2D line in linesp)
                    lineImage.Draw(line, new Bgr(Color.Red), 2);
                CvInvoke.DestroyWindow("linePImage");
                CvInvoke.Imshow("linePImage", lineImage);
                return;
            }
            //进行霍夫线变换
            VectorOfPointF lines = new VectorOfPointF(); //定义一个矢量结构lines，等价于opencv中的vector<Vec2f>
            CvInvoke.HoughLines(tempImage, lines, 50, Math.PI / 3, 120, 1, 1);
            CvInvoke.HoughLines(tempImage, lines, jinbu, Math.PI / corner, distance, 1, 1); //垂直直线
            //依次在图中绘制出每条线段
            for (int i = 0; i < lines.Size; i++)
            {
                PointF p = lines[i];
                float rho = p.X; //原点到直线的距离
                float theta = p.Y; //直线的角度

                double a = Math.Cos(theta), b = Math.Sin(theta);
                double x0 = rho * a, y0 = rho * b;

                Point pt1 = new Point(), pt2 = new Point();
                //pt1.X = (int)Math.Round(x0 -   b);
                //pt1.Y = (int)Math.Round(y0 +   a);
                //pt2.X = (int)Math.Round(x0 +   b);
                //pt2.Y = (int)Math.Round(y0 -   a);
                pt1.X = (int)Math.Round(x0 - 100 * b);
                pt1.Y = (int)Math.Round(y0 + 100 * a);
                pt2.X = (int)Math.Round(x0 + 100 * b);
                pt2.Y = (int)Math.Round(y0 - 100 * a);

                CvInvoke.Line(dstImage, pt1, pt2, new MCvScalar(55, 100, 195), 1, LineType.AntiAlias); //LineType.AntiAlias表示抗锯齿 
            }
            //CvInvoke.Imshow("SourceImage", srcmt); //显示原始图
            //CvInvoke.Imshow("CannyImage", tempImage); //显示Canny边缘检测后的图
            CvInvoke.DestroyWindow("HoughTransformImage");
            CvInvoke.Imshow("HoughTransformImage", dstImage); //显示霍夫变换后的效果图

            //CvInvoke.WaitKey(0);
        }

        //        此函数可以找出采用标准霍夫变换的二值图像线条。在OpenCV中，我们可以用其来调用标准霍夫变换SHT和多尺度霍夫变换MSHT的OpenCV内建算法。
        //C++: void HoughLines(InputArray image, OutputArray lines, double rho, double theta, int threshold, double srn = 0, double stn = 0, double min_theta = 0, double max_theta = CV_PI)
        //第一个参数，InputArray类型的image，输入图像，即源图像，需为8位的单通道二进制图像，可以将任意的源图载入进来后由函数修改成此格式后，再填在这里。
        //第二个参数，InputArray类型的lines，经过调用HoughLines函数后储存了霍夫线变换检测到线条的输出矢量。每一条线由具有两个元素的矢量表示，其中，是离坐标原点((0,0)（也就是图像的左上角）的距离。 是弧度线条旋转角度（0~垂直线，π/2~水平线）。
        //第三个参数，double类型的rho，以像素为单位的距离精度。另一种形容方式是直线搜索时的进步尺寸的单位半径。PS:Latex中/rho就表示 。
        //第四个参数，double类型的theta，以弧度为单位的角度精度。另一种形容方式是直线搜索时的进步尺寸的单位角度。
        //第五个参数，int类型的threshold，累加平面的阈值参数，即识别某部分为图中的一条直线时它在累加平面中必须达到的值。大于阈值threshold的线段才可以被检测通过并返回到结果中。
        //第六个参数，double类型的srn，有默认值0。对于多尺度的霍夫变换，这是第三个参数进步尺寸rho的除数距离。粗略的累加器进步尺寸直接是第三个参数rho，而精确的累加器进步尺寸为rho/srn。
        //第七个参数，double类型的stn，有默认值0，对于多尺度霍夫变换，srn表示第四个参数进步尺寸的单位角度theta的除数距离。且如果srn和stn同时为0，就表示使用经典的霍夫变换。否则，这两个参数应该都为正数。
        //第八个参数，double类型的 min_theta，对于标准和多尺度Hough变换，检查线条的最小角度。必须介于0和max_theta之间。
        //第九个参数，double类型的 max_theta, 对于标准和多尺度Hough变换，检查线条的最大角度。必须介于min_theta和CV_PI之间.

        //        此函数在HoughLines的基础上末尾加了一个代表Probabilistic（概率）的P，表明它可以采用累计概率霍夫变换（PPHT）来找出二值图像中的直线。
        //C++: void HoughLinesP(InputArray image, OutputArray lines, double rho, double theta, int threshold, double minLineLength = 0, double maxLineGap = 0)
        //第一个参数，InputArray类型的image，输入图像，即源图像，需为8位的单通道二进制图像，可以将任意的源图载入进来后由函数修改成此格式后，再填在这里。
        //第二个参数，InputArray类型的lines，经过调用HoughLinesP函数后后存储了检测到的线条的输出矢量，每一条线由具有四个元素的矢量(x_1, y_1, x_2, y_2）  表示，其中，(x_1, y_1) 和(x_2, y_2) 是是每个检测到的线段的结束点。
        //第三个参数，double类型的rho，以像素为单位的距离精度。另一种形容方式是直线搜索时的进步尺寸的单位半径。
        //第四个参数，double类型的theta，以弧度为单位的角度精度。另一种形容方式是直线搜索时的进步尺寸的单位角度。
        //第五个参数，int类型的threshold，累加平面的阈值参数，即识别某部分为图中的一条直线时它在累加平面中必须达到的值。大于阈值threshold的线段才可以被检测通过并返回到结果中。
        //第六个参数，double类型的minLineLength，有默认值0，表示最低线段的长度，比这个设定参数短的线段就不能被显现出来。
        //第七个参数，double类型的maxLineGap，有默认值0，允许将同一行点与点之间连接起来的最大的距离。

        public static void circlefind(string imagePath = "", PictureBox pt = null)
        {
            if (imagePath == "" && pt == null) return;
            //从文件加载图像
            //Image<Bgr, byte> src=new Image<Bgr, byte>();
            Mat srcmt = new Mat();
            //Image<Bgr, byte> imageSource;
            if (imagePath != "")
                //imageSource = new Image<Bgr, byte>(imagePath);
                srcmt = new Mat(imagePath);
            if (pt != null)
            {
                Bitmap bt = new Bitmap(pt.Image);
                srcmt = bt.ToMat();
            }
            CvInvoke.Imshow("src", srcmt);
            //将图像转换为灰度
            UMat grayImage = new UMat();
            CvInvoke.CvtColor(srcmt, grayImage, ColorConversion.Bgr2Gray);

            //使用高斯滤波去除噪声
            CvInvoke.GaussianBlur(grayImage, grayImage, new Size(5, 5), 3);
            //CvInvoke.Imshow("Blur Image", grayImage);
            //霍夫圆检测
            CircleF[] circles = CvInvoke.HoughCircles(grayImage, HoughModes.Gradient, 2.0, 20.0, 100.0, 180.0, 5);
            #region draw circles
            Image<Bgr, Byte> circleImage = srcmt.ToImage<Bgr, Byte>().Clone();
            foreach (CircleF circle in circles)
                circleImage.Draw(circle, new Bgr(Color.Blue), 4);
            CvInvoke.Imshow("HoughCircles", circleImage);
            //CvInvoke.WaitKey(0);
            #endregion
        }
        public static void find(string imagePath = "", PictureBox pt = null)
        {
            if (imagePath == "" && pt == null) return;
            //从文件加载图像
            //Image<Bgr, byte> src=new Image<Bgr, byte>();
            Mat srcmt = new Mat();
            //Image<Bgr, byte> imageSource;
            if (imagePath != "")
                //imageSource = new Image<Bgr, byte>(imagePath);
                srcmt = new Mat(imagePath);
            if (pt != null)
            {
                Bitmap bt = new Bitmap(pt.Image);
                srcmt = bt.ToMat();
            }
            CvInvoke.Imshow("src", srcmt);
            //将图像转换为灰度
            UMat grayImage = new UMat();
            CvInvoke.CvtColor(srcmt, grayImage, ColorConversion.Bgr2Gray);
            //使用高斯滤波去除噪声
            CvInvoke.GaussianBlur(grayImage, grayImage, new Size(3, 3), 3);
            //CvInvoke.Imshow("Blur Image", grayImage);

            #region Canny and edge detection
            UMat cannyEdges = new UMat();
            CvInvoke.Canny(grayImage, cannyEdges, 60, 180);
            CvInvoke.Imshow("Canny Image", cannyEdges);
            #endregion


            #region Find triangles and rectangles
            List<Triangle2DF> triangleList = new List<Triangle2DF>();
            List<RotatedRect> boxList = new List<RotatedRect>(); //旋转的矩形框

            using (VectorOfVectorOfPoint contours = new VectorOfVectorOfPoint())
            {
                CvInvoke.FindContours(cannyEdges, contours, null, RetrType.List, ChainApproxMethod.ChainApproxSimple);
                int count = contours.Size;
                for (int i = 0; i < count; i++)
                {
                    using (VectorOfPoint contour = contours[i])
                    using (VectorOfPoint approxContour = new VectorOfPoint())
                    {
                        CvInvoke.ApproxPolyDP(contour, approxContour, CvInvoke.ArcLength(contour, true) * 0.08, true);
                        //仅考虑面积大于50的轮廓
                        if (CvInvoke.ContourArea(approxContour, false) > 50)
                        {
                            if (approxContour.Size == 3) //轮廓有3个顶点：三角形
                            {
                                Point[] pts = approxContour.ToArray();
                                triangleList.Add(new Triangle2DF(pts[0], pts[1], pts[2]));
                            }
                            else if (approxContour.Size == 4) //轮廓有4个顶点
                            {
                                #region determine if all the angles in the contour are within [80, 100] degree
                                bool isRectangle = true;
                                Point[] pts = approxContour.ToArray();
                                LineSegment2D[] edges = PointCollection.PolyLine(pts, true);

                                for (int j = 0; j < edges.Length; j++)
                                {
                                    double angle = Math.Abs(edges[(j + 1) % edges.Length].GetExteriorAngleDegree(edges[j]));
                                    if (angle < 80 || angle > 100)
                                    {
                                        isRectangle = false;
                                        break;
                                    }
                                }
                                #endregion
                                if (isRectangle) boxList.Add(CvInvoke.MinAreaRect(approxContour));
                            }
                        }
                    }
                }
            }
            #endregion

            //显示结果
            #region draw triangles and rectangles
            Image<Bgr, Byte> triangleRectangleImage = srcmt.ToImage<Bgr, byte>().CopyBlank();
            foreach (Triangle2DF triangle in triangleList)
                triangleRectangleImage.Draw(triangle, new Bgr(Color.DarkBlue), 2);

            CvInvoke.Imshow("triangleRectangleImage", triangleRectangleImage);

            Image<Bgr, Byte> RectangleImage = srcmt.ToImage<Bgr, byte>().CopyBlank();
            foreach (RotatedRect box in boxList)
                RectangleImage.Draw(box, new Bgr(Color.DarkOrange), 2);

            CvInvoke.Imshow("RectangleImage", RectangleImage);
            //CvInvoke.WaitKey(3000);
            #endregion

        }

    }
}
