using Emgu.CV;
using Emgu.CV.CvEnum;
using Emgu.CV.Structure;
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Runtime.InteropServices;

namespace 螺丝自动锁付
{
    public static class picdeal//图像二值化
    {
        public static byte[] GetGrayArray(Bitmap srcBmp, int startx = 0, int starty = 0, int width = 0, int height = 0)
        {
            //将Bitmap锁定到系统内存中,获得BitmapData
            //这里的第三个参数确定了该图像信息时rgb存储还是Argb存储
            if (width == 0) width = srcBmp.Width;
            if (height == 0) height = srcBmp.Height;
            Rectangle rect = new Rectangle(startx, starty, width, height);  //要得到的区域
            BitmapData srcBmpData = srcBmp.LockBits(rect, ImageLockMode.ReadWrite, PixelFormat.Format32bppArgb);
            //位图中第一个像素数据的地址。它也可以看成是位图中的第一个扫描行
            IntPtr srcPtr = srcBmpData.Scan0;
            //将Bitmap对象的信息存放到byte数组中
            int scanWidth = srcBmpData.Stride;//srcBmpData.Width * 4;
            int src_bytes = scanWidth * rect.Height;
            //int srcStride = srcBmpData.Stride;
            byte[] srcValues = new byte[src_bytes];
            byte[] grayValues = new byte[rect.Width * rect.Height];
            //RGB[] rgb = new RGB[srcBmp.Width * rows];
            //复制GRB信息到byte数组
            Marshal.Copy(srcPtr, srcValues, 0, src_bytes);
            //LogHelper.OutputArray(srcValues, rect.Width * 3, rect.Height, true);
            //Marshal.Copy(dstPtr, dstValues, 0, dst_bytes);
            //解锁位图
            srcBmp.UnlockBits(srcBmpData);
            ////灰度化处理
            //int m = 0, j = 0;
            //int k = 0;
            //byte gray;
            ////根据Y = 0.299*R + 0.587*G + 0.114*B,intensity为亮度
            //for (int i = 0; i < rect.Height; i++)  //行
            //{
            //    for (j = 0; j < rect.Width; j++)  //列
            //    {
            //        //注意位图结构中RGB按BGR的顺序存储
            //        k = 3 * j;
            //        gray = (byte)(srcValues[i * scanWidth + k + 2] * 0.299
            //             + srcValues[i * scanWidth + k + 1] * 0.587
            //             + srcValues[i * scanWidth + k + 0] * 0.114);
            //        grayValues[m] = gray;  //将灰度值存到byte一维数组中
            //        m++;
            //    }
            //}
            return srcValues;
        }
        public unsafe static Bitmap twovalgroupfast(Bitmap srcBitmap, int* currentNo, string two = "", bool hei = true)
        {
            try
            {
                int* htemp;
                int* temp;
                int* rtemp;
                int* gtemp;
                int* btemp;
                int* height = (int*)srcBitmap.Height;
                int* width = (int*)srcBitmap.Width;
                if ((int)currentNo == -1) currentNo = (int*)AutoCheck.currentSelect;
                byte* val = (byte*)(hei ? 0 : 255);
                byte* val2 = (byte*)(hei ? 255 : 0);
                Rectangle rect = new Rectangle(0, 0, (int)width, (int)height);
                Bitmap bmpSource = new Bitmap(srcBitmap);
                //System.Drawing.Imaging.BitmapData bmpData = bmpSource.LockBits(rect, System.Drawing.Imaging.ImageLockMode.ReadWrite, bmpSource.PixelFormat);
                BitmapData bmpData = bmpSource.LockBits(new Rectangle(0, 0, (int)width, (int)height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
                IntPtr ptr = bmpData.Scan0;
                int bytes = (int)width * (int)height * 4;
                byte[] rgbValues = new byte[bytes];
                long* rstart = (long*)0;
                System.Runtime.InteropServices.Marshal.Copy(ptr, rgbValues, 0, bytes);
                if (two == "二值")
                {
                    int* up; int* down;
                    up = (int*)AutoCheck.listRectangle[(int)currentNo].twoUp;
                    down = (int*)AutoCheck.listRectangle[(int)currentNo].twoDown;
                    for (int y = 0; y < (int)height; y++)
                        for (int x = 0; x < (int)width * 4; x += 4)
                        {
                            //获取像素的ＲＧＢ颜色值
                            rstart = (long*)((int)width * 4 * y + x);
                            rtemp = (int*)((rgbValues[(long)rstart] + rgbValues[(long)rstart + 1] + rgbValues[(long)rstart + 2]) / 3);//二值时忽略a,只取rgb
                            temp = (int*)(((int)up >= (int)rtemp) & ((int)rtemp >= (int)down) ? (hei ? 0 : 255) : (hei ? 255 : 0));//0是黑色
                                                                                                                                   //设置像素的ＲＧＢ颜色值
                                                                                                                                   //returnBitmap.SetPixel(x, y, Color.)FromArgb(temp, temp, temp));
                            rgbValues[(long)rstart] = rgbValues[(long)rstart + 1] = rgbValues[(long)rstart + 2] = (byte)temp;
                        }
                }
                else if (two == "彩色二值")
                {
                    int* zhicolorcount = (int*)AutoCheck.zhicolorlist[(int)currentNo].Count;
                    int*[] rup = new int*[(int)zhicolorcount]; int*[] rdown = new int*[(int)zhicolorcount];
                    int*[] gup = new int*[(int)zhicolorcount]; int*[] gdown = new int*[(int)zhicolorcount];
                    int*[] bup = new int*[(int)zhicolorcount]; int*[] bdown = new int*[(int)zhicolorcount];
                    int*[] hup = new int*[(int)zhicolorcount]; int*[] hdown = new int*[(int)zhicolorcount];
                    for (int i = 0; i < (int)zhicolorcount; i++)
                    {
                        //    //if (AutoCheck.zhicolorlist[currentNo].ElementAt(i).hUp > 0)
                        //    //    {
                        //    hup.Add(i); hdown.Add(i);
                        //    rup.Add(i); rdown.Add(i);
                        //    gup.Add(i); gdown.Add(i);
                        //    bup.Add(i);  bdown.Add(i);
                        hup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).hUp;
                        hdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).hDown;
                        rup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).rUp;
                        rdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).rDown;
                        gup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).gUp;
                        gdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).gDown;
                        bup[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).bUp;
                        bdown[i] = (int*)AutoCheck.zhicolorlist[(int)currentNo].ElementAt(i).bDown;
                        //}
                    }

                    for (int y = 0; y < (int)height; y++)
                        for (int x = 0; x < (int)width * 4; x += 4)
                        {
                            //获取像素的ＲＧＢ颜色值
                            rstart = (long*)((int)width * 4 * y + x);

                            for (int i = 0; i < (int)zhicolorcount; i++)
                            {
                                rtemp = (int*)(((int)rup[i] >= rgbValues[(long)rstart + 2]) & (rgbValues[(long)rstart + 2] >= (int)rdown[i]) ? 255 : 0);
                                if ((int)rtemp == 0) goto ernext1;
                                gtemp = (int*)(((int)gup[i] >= rgbValues[(long)rstart + 1]) & (rgbValues[(long)rstart + 1] >= (int)gdown[i]) ? 255 : 0);
                                if ((int)gtemp == 0) goto ernext1;
                                btemp = (int*)(((int)bup[i] >= rgbValues[(long)rstart]) & (rgbValues[(long)rstart] >= (int)bdown[i]) ? 255 : 0);
                                if ((int)btemp == 0) goto ernext1;
                                htemp = (int*)(((int)hup[i] >= rgbValues[(long)rstart + 3]) & (rgbValues[(long)rstart + 3] >= (int)hdown[i]) ? 255 : 0);
                                if ((int)htemp == 0) goto ernext1;
                                rgbValues[(long)rstart] = rgbValues[(long)rstart + 1] = rgbValues[(long)rstart + 2] = (byte)val;
                                goto ernext;
                            ernext1:;
                            }
                            rgbValues[(long)rstart] = rgbValues[(long)rstart + 1] = rgbValues[(long)rstart + 2] = (byte)val2;
                        ernext:;
                        }
                }
                System.Runtime.InteropServices.Marshal.Copy(rgbValues, 0, ptr, bytes);
                bmpSource.UnlockBits(bmpData);
                return bmpSource;
                //return rgbValues;
                //Invalidate();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("twovalgroupfast", ex.ToString());
                return null;
            }
        }
        public unsafe static Bitmap twovalfast(Bitmap srcBitmap, int currentNo, string two = "", bool hei = true)
        {
            try
            {
                int* htemp;
                int* temp;
                int* rtemp;
                int* gtemp;
                int* btemp;
                int* height = (int*)srcBitmap.Height;
                int* width = (int*)srcBitmap.Width;
                Rectangle rect = new Rectangle(0, 0, (int)width, (int)height);
                Bitmap bmpSource = new Bitmap(srcBitmap);
                //System.Drawing.Imaging.BitmapData bmpData = bmpSource.LockBits(rect, System.Drawing.Imaging.ImageLockMode.ReadWrite, bmpSource.PixelFormat);
                BitmapData bmpData = bmpSource.LockBits(new Rectangle(0, 0, (int)width, (int)height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
                IntPtr ptr = bmpData.Scan0;
                int bytes = (int)width * (int)height * 4;
                byte[] rgbValues = new byte[bytes];
                long* rstart = (long*)0;
                System.Runtime.InteropServices.Marshal.Copy(ptr, rgbValues, 0, bytes);
                if (two == "二值")
                {
                    int* up; int* down;
                    up = (int*)AutoCheck.listRectangle[currentNo].twoUp;
                    down = (int*)AutoCheck.listRectangle[currentNo].twoDown;
                    for (int y = 0; y < (int)height; y++)
                        for (int x = 0; x < (int)width * 4; x += 4)
                        {
                            //获取像素的ＲＧＢ颜色值
                            rstart = (long*)((int)width * 4 * y + x);
                            rtemp = (int*)((rgbValues[(long)rstart] + rgbValues[(long)rstart + 1] + rgbValues[(long)rstart + 2]) / 3);//二值时忽略a,只取rgb
                            temp = (int*)(((int)up >= (int)rtemp) & ((int)rtemp >= (int)down) ? (hei ? 0 : 255) : (hei ? 255 : 0));//0是黑色
                                                                                                                                   //设置像素的ＲＧＢ颜色值
                                                                                                                                   //returnBitmap.SetPixel(x, y, Color.FromArgb(temp, temp, temp));
                            rgbValues[(long)rstart] = rgbValues[(long)rstart + 1] = rgbValues[(long)rstart + 2] = (byte)temp;
                        }
                }
                else if (two == "彩色二值")
                {
                    int* rup; int* rdown; int* gup; int* gdown; int* bup; int* bdown; int* hup; int* hdown;
                    hup = (int*)AutoCheck.listRectangle[currentNo].hUp;
                    hdown = (int*)AutoCheck.listRectangle[currentNo].hDown;
                    rup = (int*)AutoCheck.listRectangle[currentNo].rUp;
                    rdown = (int*)AutoCheck.listRectangle[currentNo].rDown;
                    gup = (int*)AutoCheck.listRectangle[currentNo].gUp;
                    gdown = (int*)AutoCheck.listRectangle[currentNo].gDown;
                    bup = (int*)AutoCheck.listRectangle[currentNo].bUp;
                    bdown = (int*)AutoCheck.listRectangle[currentNo].bDown;
                    for (int y = 0; y < (int)height; y++)
                        for (int x = 0; x < (int)width * 4; x += 4)
                        {
                            //获取像素的ＲＧＢ颜色值
                            rstart = (long*)((int)width * 4 * y + x);
                            rtemp = (int*)(((int)rup >= rgbValues[(long)rstart + 2]) & (rgbValues[(long)rstart + 2] >= (int)rdown) ? 255 : 0);
                            gtemp = (int*)(((int)gup >= rgbValues[(long)rstart + 1]) & (rgbValues[(long)rstart + 1] >= (int)gdown) ? 255 : 0);
                            btemp = (int*)(((int)bup >= rgbValues[(long)rstart]) & (rgbValues[(long)rstart] >= (int)bdown) ? 255 : 0);
                            htemp = (int*)(((int)hup >= rgbValues[(long)rstart + 3]) & (rgbValues[(long)rstart + 3] >= (int)hdown) ? 255 : 0);
                            temp = (int*)(((int)rtemp == 255) & ((int)gtemp == 255) & ((int)btemp == 255) & ((int)htemp == 255) ? (hei ? 0 : 255) : (hei ? 255 : 0));//0是黑色
                                                                                                                                                                     //设置像素的ＲＧＢ颜色值
                            rgbValues[(long)rstart] = rgbValues[(long)rstart + 1] = rgbValues[(long)rstart + 2] = (byte)temp;
                        }
                }
                System.Runtime.InteropServices.Marshal.Copy(rgbValues, 0, ptr, bytes);
                bmpSource.UnlockBits(bmpData);
                return bmpSource;
                //return rgbValues;
                //Invalidate();
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("twovalfast", ex.ToString());
                return null;
            }
        }
        public static Bitmap twoval(Bitmap srcBitmap, int currentNo, string two = "")
        {
            Bitmap returnBitmap = new Bitmap(srcBitmap.Width, srcBitmap.Height);
            try
            {
                Color srcColor;
                int htemp;
                int temp;
                int rtemp;
                int gtemp;
                int btemp;
                int wide = srcBitmap.Width;
                int height = srcBitmap.Height;
                if (two == "二值")
                {
                    int up; int down;
                    up = AutoCheck.listRectangle[currentNo].twoUp;
                    down = AutoCheck.listRectangle[currentNo].twoDown;
                    for (int y = 0; y < srcBitmap.Height; y++)
                        for (int x = 0; x < srcBitmap.Width; x++)
                        {
                            //获取像素的ＲＧＢ颜色值
                            srcColor = srcBitmap.GetPixel(x, y);
                            temp = (int)((srcColor.R + srcColor.G + srcColor.B) / 3);
                            temp = (up >= temp) & (temp >= down) ? 0 : 255;//0是黑色
                                                                           //设置像素的ＲＧＢ颜色值
                            returnBitmap.SetPixel(x, y, Color.FromArgb(temp, temp, temp));
                        }
                    return returnBitmap;
                }
                else if (two == "彩色二值")
                {
                    int rup; int rdown; int gup; int gdown; int bup; int bdown; int hup; int hdown;
                    hup = AutoCheck.listRectangle[currentNo].hUp;
                    hdown = AutoCheck.listRectangle[currentNo].hDown;
                    rup = AutoCheck.listRectangle[currentNo].rUp;
                    rdown = AutoCheck.listRectangle[currentNo].rDown;
                    gup = AutoCheck.listRectangle[currentNo].gUp;
                    gdown = AutoCheck.listRectangle[currentNo].gDown;
                    bup = AutoCheck.listRectangle[currentNo].bUp;
                    bdown = AutoCheck.listRectangle[currentNo].bDown;
                    for (int y = 0; y < height; y++)
                        for (int x = 0; x < wide; x++)
                        {
                            //获取像素的ＲＧＢ颜色值
                            srcColor = srcBitmap.GetPixel(x, y);
                            rtemp = (rup >= srcColor.R) & (srcColor.R >= rdown) ? 255 : 0;
                            gtemp = (gup >= srcColor.G) & (srcColor.G >= gdown) ? 255 : 0;
                            btemp = (bup >= srcColor.B) & (srcColor.B >= bdown) ? 255 : 0;
                            htemp = (hup >= srcColor.A) & (srcColor.A >= hdown) ? 255 : 0;
                            temp = (rtemp == 255) & (gtemp == 255) & (btemp == 255) & (htemp == 255) ? 0 : 255;//0是黑色
                                                                                                               //设置像素的ＲＧＢ颜色值
                            returnBitmap.SetPixel(x, y, Color.FromArgb(temp, temp, temp));
                        }
                    return returnBitmap;
                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                setinglogClass.writeLog("twoval", ex.ToString());
                return null;
            }
        }
        public static Bitmap twovalemgu(Bitmap srcBitmap, int currentNo, int two = 0, bool hei = true)
        {
            if (two == 0)
                two = 120;
                try
                {
                    if (srcBitmap == null) return null;
                    //Bitmap returnBitmap = new Bitmap(srcBitmap.Width, srcBitmap.Height);
                    Mat srcmt = srcBitmap.ToMat();
                    //Image<Bgr, byte> img_src = new Image<Bgr, byte>(bt);
                    Image<Bgr, byte> img_src = srcmt.ToImage<Bgr, byte>();
                    //Mat imput_gray = new Mat(new Size(img_src.Cols, img_src.Rows), DepthType.Cv8U, 3);
                    Image<Gray, byte> output_gray = new Image<Gray, byte>(img_src.Size);
                    Mat outmat = new Mat();
                    //Mat outmat2 = new Mat();
                    //CvInvoke.Imshow("原图", img_src);
                    CvInvoke.CvtColor(img_src, output_gray, ColorConversion.Bgr2Gray);
                    //CvInvoke.Imshow("gray", imput_gray);
                    //    Image<Bgr, byte> imge1 = new Image<Bgr, byte>(imput_gray.Size);
                    //    Image<Bgr, byte> imge2 = new Image<Bgr, byte>(imput_gray.Size);
                    ////CvInvoke.Sobel(imput_gray, grad_x1, 0, 1, 3);
                    if (hei)
                        CvInvoke.Threshold(output_gray, outmat, two, 255, ThresholdType.BinaryInv);
                    else
                        CvInvoke.Threshold(output_gray, outmat, two, 255, ThresholdType.Binary);
                    Image<Bgr, byte> outi = outmat.ToImage<Bgr, byte>();
                    return outi.ToBitmap();
                }
                catch (Exception ex)
                {
                    setinglogClass.writeLog("twoval", ex.ToString());
                    return null;
                }
        }

    }
}


