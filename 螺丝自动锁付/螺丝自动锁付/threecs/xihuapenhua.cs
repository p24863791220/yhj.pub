using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace 螺丝自动锁付
{
    public static class xihuapenhua
    {

        /// <summary>
        /// 图形细化
        /// </summary>
        /// <param name="srcImg"></param>
        /// <returns></returns>
        public static unsafe Bitmap ToThinner(Bitmap srcImg)
        {
            int iw = srcImg.Width;
            int ih = srcImg.Height;
            bool bModified;     //二值图像修改标志            
            bool bCondition1;   //细化条件1标志            
            bool bCondition2;   //细化条件2标志            
            bool bCondition3;   //细化条件3标志            
            bool bCondition4;   //细化条件4标志
            int nCount;
            //5X5像素块            
            byte[,] neighbour = new byte[5, 5];
            //新建临时存储图像            
            Bitmap NImg = new Bitmap(iw, ih, PixelFormat.Format24bppRgb);
            bModified = true;
            //细化修改标志, 用作循环条件
            BitmapData dstData = srcImg.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
            byte* data = (byte*)(dstData.Scan0);
            //将图像转换为0,1二值得图像; 
            int step = dstData.Stride;
            for (int i = 0; i < dstData.Height; i++)
            {
                for (int j = 0; j < dstData.Width * 3; j += 3)
                {
                    if (data[i * step + j] > 128)
                        //如果是白线条，只要将0改成1，将1改成0
                        data[i * step + j]
                            = data[i * step + j + 1]
                            = data[i * step + j + 2]
                            = 0;
                    else
                        data[i * step + j]
                            = data[i * step + j + 1]
                            = data[i * step + j + 2]
                            = 1;
                }
            }

            BitmapData dstData1 = NImg.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, NImg.PixelFormat);
            byte* data1 = (byte*)(dstData1.Scan0);
            int step1 = dstData1.Stride;
            //细化循环开始           
            while (bModified)
            {
                bModified = false;
                //初始化临时二值图像NImg                
                for (int i = 0; i < dstData1.Height; i++)
                {
                    for (int j = 0; j < dstData1.Width * 3; j++)
                    {
                        data1[i * step1 + j] = 0;
                    }
                }
                for (int i = 2; i < ih - 2; i++)
                {
                    for (int j = 6; j < iw * 3 - 6; j += 3)
                    {
                        bCondition1 = false;
                        bCondition2 = false;
                        bCondition3 = false;
                        bCondition4 = false;
                        if (data[i * step + j] == 0)
                            //若图像的当前点为白色，则跳过                           
                            continue;
                        for (int k = 0; k < 5; k++)
                        {
                            //取以当前点为中心的5X5块                           
                            for (int l = 0; l < 5; l++)
                            {
                                //1代表黑色, 0代表白色                             
                                //neighbour[k, l] = bw[i + k - 2, j + l - 2];         
                                //neighbour[k, l] = data[(i + k - 2) * step + (j + l - 2)];
                                neighbour[k, l] = data[(i + k - 2) * step + (j + l * 3 - 6)];
                            }
                        }
                        //(1)判断条件2<=n(p)<=6          
                        nCount = neighbour[1, 1] + neighbour[1, 2] + neighbour[1, 3] + neighbour[2, 1] + neighbour[2, 3] + neighbour[3, 1] + neighbour[3, 2] + neighbour[3, 3];
                        if (nCount >= 2 && nCount <= 6)
                            bCondition1 = true;
                        else
                        {
                            data1[i * step1 + j] = 1;
                            continue;
                            //跳过, 加快速度                       
                        }
                        //(2)判断s(p)=1                      
                        nCount = 0;
                        if (neighbour[2, 3] == 0 && neighbour[1, 3] == 1)
                            nCount++;
                        if (neighbour[1, 3] == 0 && neighbour[1, 2] == 1)
                            nCount++;
                        if (neighbour[1, 2] == 0 && neighbour[1, 1] == 1)
                            nCount++;
                        if (neighbour[1, 1] == 0 && neighbour[2, 1] == 1)
                            nCount++;
                        if (neighbour[2, 1] == 0 && neighbour[3, 1] == 1)
                            nCount++;
                        if (neighbour[3, 1] == 0 && neighbour[3, 2] == 1)
                            nCount++;
                        if (neighbour[3, 2] == 0 && neighbour[3, 3] == 1)
                            nCount++;
                        if (neighbour[3, 3] == 0 && neighbour[2, 3] == 1)
                            nCount++;
                        if (nCount == 1)
                            bCondition2 = true;
                        else
                        {
                            data1[i * step1 + j] = 1;
                            continue;
                        }
                        //(3)判断p0*p2*p4=0 or s(p2)!=1   
                        if (neighbour[2, 3] * neighbour[1, 2] * neighbour[2, 1] == 0)
                            bCondition3 = true;
                        else
                        {
                            nCount = 0;
                            if (neighbour[0, 2] == 0 && neighbour[0, 1] == 1)
                                nCount++;
                            if (neighbour[0, 1] == 0 && neighbour[1, 1] == 1)
                                nCount++;
                            if (neighbour[1, 1] == 0 && neighbour[2, 1] == 1)
                                nCount++;
                            if (neighbour[2, 1] == 0 && neighbour[2, 2] == 1)
                                nCount++;
                            if (neighbour[2, 2] == 0 && neighbour[2, 3] == 1)
                                nCount++;
                            if (neighbour[2, 3] == 0 && neighbour[1, 3] == 1)
                                nCount++;
                            if (neighbour[1, 3] == 0 && neighbour[0, 3] == 1)
                                nCount++;
                            if (neighbour[0, 3] == 0 && neighbour[0, 2] == 1)
                                nCount++;
                            if (nCount != 1)
                                //s(p2)!=1                              
                                bCondition3 = true;
                            else
                            {
                                data1[i * step1 + j] = 1;
                                continue;
                            }
                        }
                        //(4)判断p2*p4*p6=0 or s(p4)!=1    
                        if (neighbour[1, 2] * neighbour[2, 1] * neighbour[3, 2] == 0)
                            bCondition4 = true;
                        else
                        {
                            nCount = 0;
                            if (neighbour[1, 1] == 0 && neighbour[1, 0] == 1)
                                nCount++;
                            if (neighbour[1, 0] == 0 && neighbour[2, 0] == 1)
                                nCount++;
                            if (neighbour[2, 0] == 0 && neighbour[3, 0] == 1)
                                nCount++;
                            if (neighbour[3, 0] == 0 && neighbour[3, 1] == 1)
                                nCount++;
                            if (neighbour[3, 1] == 0 && neighbour[3, 2] == 1)
                                nCount++;
                            if (neighbour[3, 2] == 0 && neighbour[2, 2] == 1)
                                nCount++;
                            if (neighbour[2, 2] == 0 && neighbour[1, 2] == 1)
                                nCount++;
                            if (neighbour[1, 2] == 0 && neighbour[1, 1] == 1)
                                nCount++;
                            if (nCount != 1)//s(p4)!=1       
                                bCondition4 = true;
                        }
                        if (bCondition1 && bCondition2 && bCondition3 && bCondition4)
                        {
                            data1[i * step1 + j] = 0;
                            bModified = true;
                        }
                        else
                        {
                            data1[i * step1 + j] = 1;
                        }
                    }
                }
                // 将细化了的临时图像bw_tem[w,h]copy到bw[w,h],完成一次细化   
                for (int i = 0; i < ih - 0; i++)
                    for (int j = 0; j < iw * 3 - 0; j++)
                        data[i * step + j] = data1[i * step1 + j];
            }
            for (int i = 0; i < ih - 0; i++)
            {
                for (int j = 0; j < iw * 3 - 0; j += 3)
                {
                    if (data[i * step + j] == 1)
                    {
                        data[i * step + j] = data[i * step + j + 1] = 0;
                        data[i * step + j + 2] = 255;
                    }
                    else

                        data[i * step + j]
                            = data[i * step + j + 1]
                            = data[i * step + j + 2]
                            = 255;

                }
            }
            srcImg.UnlockBits(dstData);
            NImg.UnlockBits(dstData1);
            //Bitmap rebitmap = new Bitmap(iw, ih, srcImg.PixelFormat);
            //BitmapData redstData = rebitmap.LockBits(new Rectangle(0, 0, iw, ih), ImageLockMode.ReadWrite, srcImg.PixelFormat);
            //byte* redataptr = (byte*)(redstData.Scan0);
            ////byte* ptr = (byte*)bmpData.Scan0.ToPointer();
            //rebitmap.UnlockBits(redstData);
            return srcImg;
        }

        public static Bitmap dilate(Bitmap curBitmap, Int32 i32 = 0x11)
        {
            if (curBitmap != null)
            {
                Rectangle rect = new Rectangle(0, 0, curBitmap.Width, curBitmap.Height);
                BitmapData bmpData = curBitmap.LockBits(rect, ImageLockMode.ReadWrite, curBitmap.PixelFormat);
                IntPtr ptr = bmpData.Scan0;
                int bytes = curBitmap.Width * curBitmap.Height;
                byte[] grayValues = new byte[bytes];
                Marshal.Copy(ptr, grayValues, 0, bytes);

                Int32 flagStru = i32;

                byte[] tempArray = new byte[bytes];
                for (int i = 0; i < bytes; i++)
                {
                    tempArray[i] = 255;
                }

                switch (flagStru)
                {
                    case 0x11:
                        for (int i = 0; i < curBitmap.Height; i++)
                        {
                            for (int j = 1; j < curBitmap.Width - 1; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x21:
                        for (int i = 0; i < curBitmap.Height; i++)
                        {
                            for (int j = 2; j < curBitmap.Width - 2; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 2] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x12:
                        for (int i = 1; i < curBitmap.Height - 1; i++)
                        {
                            for (int j = 0; j < curBitmap.Width; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x22:
                        for (int i = 2; i < curBitmap.Height - 2; i++)
                        {
                            for (int j = 0; j < curBitmap.Width; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x14:
                        for (int i = 1; i < curBitmap.Height - 1; i++)
                        {
                            for (int j = 1; j < curBitmap.Width - 1; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x24:
                        for (int i = 2; i < curBitmap.Height - 2; i++)
                        {
                            for (int j = 2; j < curBitmap.Width - 2; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 2] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x18:
                        for (int i = 1; i < curBitmap.Height - 1; i++)
                        {
                            for (int j = 1; j < curBitmap.Width - 1; j++)
                            {
                                if (grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j + 1] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    case 0x28:
                        for (int i = 2; i < curBitmap.Height - 2; i++)
                        {
                            for (int j = 2; j < curBitmap.Width - 2; j++)
                            {
                                if (grayValues[(i - 2) * curBitmap.Width + j - 2] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[(i - 2) * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j - 2] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[(i - 1) * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 2] == 0 ||
                                    grayValues[i * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[i * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j - 2] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[(i + 2) * curBitmap.Width + j + 2] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j - 2] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j - 1] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j + 1] == 0 ||
                                    grayValues[(i + 1) * curBitmap.Width + j + 2] == 0)
                                {
                                    tempArray[i * curBitmap.Width + j] = 0;
                                }

                            }
                        }
                        break;
                    default:
                        MessageBox.Show("错误的结构元素！");
                        break;
                }


                grayValues = (byte[])tempArray.Clone();

                System.Runtime.InteropServices.Marshal.Copy(grayValues, 0, ptr, bytes);
                curBitmap.UnlockBits(bmpData);
            }
            return curBitmap;
        }


        #region 关于图像尺寸的说明

        //本代码只能处理8位深度的512*512图像。可自行修改，例如修改3位水平方向结构元素代码：

        //01修改成如下代码即可处理任意尺寸的8位深度的图像
        //int bytes = bmpData.Stride * curBitmap.Height;
        //for (int i = 0; i < curBitmap.Height; i++)
        //{
        //    for (int j = 1; j < curBitmap.Width - 1; j++)
        //    {
        //        if (grayValues[i * bmpData.Stride + j] == 0 ||
        //            grayValues[i * bmpData.Stride + j + 3] == 0 ||
        //            grayValues[i * bmpData.Stride + j - 1] == 0)
        //        {
        //            tempArray[i * bmpData.Stride + j] = 0;
        //            tempArray[i * bmpData.Stride + j + 1] = 0;
        //            tempArray[i * bmpData.Stride + j + 2] = 0;
        //        }
        //    }
        //}

        //02修改成如下代码即可处理任意尺寸的24位深度的图像
        //int bytes = bmpData.Stride * curBitmap.Height;
        //for (int i = 0; i < curBitmap.Height; i++)
        //{
        //    for (int j = 4; j < curBitmap.Width * 3 - 3; j += 3)
        //    {
        //        if (grayValues[i * bmpData.Stride + j] == 0 ||
        //            grayValues[i * bmpData.Stride + j + 3] == 0 ||
        //            grayValues[i * bmpData.Stride + j - 1] == 0)
        //        {
        //            tempArray[i * bmpData.Stride + j] = 0;
        //            tempArray[i * bmpData.Stride + j + 1] = 0;
        //            tempArray[i * bmpData.Stride + j + 2] = 0;
        //        }
        //    }
        //}
        #endregion
    }
}
