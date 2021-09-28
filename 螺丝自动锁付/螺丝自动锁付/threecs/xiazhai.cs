using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace 螺丝自动锁付
{
    public static class xiazhai
    {


        //一.底片效果
        //原理: GetPixel方法获得每一点像素的值, 然后再使用SetPixel方法将取反后的颜色值设置到对应的点.
        //效果图:
        //代码实现:
        public static Bitmap dipian(Bitmap bt)
        {
            //以底片效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap newbitmap = new Bitmap(Width, Height);
                Bitmap oldbitmap = bt;
                Color pixel;
                for (int x = 1; x < Width; x++)
                {
                    for (int y = 1; y < Height; y++)
                    {
                        int r, g, b;
                        pixel = oldbitmap.GetPixel(x, y);
                        r = 255 - pixel.R;
                        g = 255 - pixel.G;
                        b = 255 - pixel.B;
                        newbitmap.SetPixel(x, y, Color.FromArgb(r, g, b));
                    }
                }
                return newbitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //二.浮雕效果
        //原理: 对图像像素点的像素值分别与相邻像素点的像素值相减后加上128, 然后将其作为新的像素点的值.
        //效果图:
        //代码实现:
        public static Bitmap fudiao(Bitmap bt)
        {
            //以浮雕效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap newBitmap = new Bitmap(Width, Height);
                Bitmap oldBitmap = bt;
                Color pixel1, pixel2;
                for (int x = 0; x < Width - 1; x++)
                {
                    for (int y = 0; y < Height - 1; y++)
                    {
                        int r = 0, g = 0, b = 0;
                        pixel1 = oldBitmap.GetPixel(x, y);
                        pixel2 = oldBitmap.GetPixel(x + 1, y + 1);
                        r = Math.Abs(pixel1.R - pixel2.R + 128);
                        g = Math.Abs(pixel1.G - pixel2.G + 128);
                        b = Math.Abs(pixel1.B - pixel2.B + 128);
                        if (r > 255)
                            r = 255;
                        if (r < 0)
                            r = 0;
                        if (g > 255)
                            g = 255;
                        if (g < 0)
                            g = 0;
                        if (b > 255)
                            b = 255;
                        if (b < 0)
                            b = 0;
                        newBitmap.SetPixel(x, y, Color.FromArgb(r, g, b));
                    }
                }
                return newBitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //三.黑白效果
        //原理: 彩色图像处理成黑白效果通常有3种算法；
        //(1).最大值法: 使每个像素点的 R, G, B 值等于原像素点的 RGB(颜色值) 中最大的一个；
        //(2).平均值法: 使用每个像素点的 R, G, B值等于原像素点的RGB值的平均值；
        //(3).加权平均值法: 对每个像素点的 R, G, B值进行加权
        //      ---自认为第三种方法做出来的黑白效果图像最 "真实".
        //效果图:
        //代码实现:
        public static Bitmap huidu(Bitmap bt)
        {
            //以黑白效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap newBitmap = new Bitmap(Width, Height);
                Color pixel;
                for (int x = 0; x < Width; x++)
                    for (int y = 0; y < Height; y++)
                    {
                        pixel = bt.GetPixel(x, y);
                        int r, g, b, Result = 0;
                        r = pixel.R;
                        g = pixel.G;
                        b = pixel.B;
                        //实例程序以加权平均值法产生黑白图像
                        int iType = 2;
                        switch (iType)
                        {
                            case 0://平均值法
                                Result = ((r + g + b) / 3);
                                break;
                            case 1://最大值法
                                Result = r > g ? r : g;
                                Result = Result > b ? Result : b;
                                break;
                            case 2://加权平均值法
                                Result = ((int)(0.7 * r) + (int)(0.2 * g) + (int)(0.1 * b));
                                break;
                        }
                        newBitmap.SetPixel(x, y, Color.FromArgb(Result, Result, Result));
                    }
                return newBitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }



        //四.柔化效果
        //原理: 当前像素点与周围像素点的颜色差距较大时取其平均值.
        //效果图:
        //代码实现:
        public static Bitmap rouhua(Bitmap bt)
        {
            //以柔化效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap bitmap = new Bitmap(Width, Height);
                Bitmap MyBitmap = bt;
                Color pixel;
                //高斯模板
                int[] Gauss = { 1, 2, 1, 2, 4, 2, 1, 2, 1 };
                for (int x = 1; x < Width - 1; x++)
                    for (int y = 1; y < Height - 1; y++)
                    {
                        int r = 0, g = 0, b = 0;
                        int Index = 0;
                        for (int col = -1; col <= 1; col++)
                            for (int row = -1; row <= 1; row++)
                            {
                                pixel = MyBitmap.GetPixel(x + row, y + col);
                                r += pixel.R * Gauss[Index];
                                g += pixel.G * Gauss[Index];
                                b += pixel.B * Gauss[Index];
                                Index++;
                            }
                        r /= 16;
                        g /= 16;
                        b /= 16;
                        //处理颜色值溢出
                        r = r > 255 ? 255 : r;
                        r = r < 0 ? 0 : r;
                        g = g > 255 ? 255 : g;
                        g = g < 0 ? 0 : g;
                        b = b > 255 ? 255 : b;
                        b = b < 0 ? 0 : b;
                        bitmap.SetPixel(x - 1, y - 1, Color.FromArgb(r, g, b));
                    }
                return bitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //五.锐化效果
        //原理:突出显示颜色值大(即形成形体边缘)的像素点.
        //效果图:
        //实现代码:
        public static Bitmap ruihua(Bitmap bt)
        {
            //以锐化效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap newBitmap = new Bitmap(Width, Height);
                Bitmap oldBitmap = bt;
                Color pixel;
                //拉普拉斯模板
                int[] Laplacian = { -1, -1, -1, -1, 9, -1, -1, -1, -1 };
                for (int x = 1; x < Width - 1; x++)
                    for (int y = 1; y < Height - 1; y++)
                    {
                        int r = 0, g = 0, b = 0;
                        int Index = 0;
                        for (int col = -1; col <= 1; col++)
                            for (int row = -1; row <= 1; row++)
                            {
                                pixel = oldBitmap.GetPixel(x + row, y + col); r += pixel.R * Laplacian[Index];
                                g += pixel.G * Laplacian[Index];
                                b += pixel.B * Laplacian[Index];
                                Index++;
                            }
                        //处理颜色值溢出
                        r = r > 255 ? 255 : r;
                        r = r < 0 ? 0 : r;
                        g = g > 255 ? 255 : g;
                        g = g < 0 ? 0 : g;
                        b = b > 255 ? 255 : b;
                        b = b < 0 ? 0 : b;
                        newBitmap.SetPixel(x - 1, y - 1, Color.FromArgb(r, g, b));
                    }
                return newBitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //六.雾化效果
        //原理: 在图像中引入一定的随机值, 打乱图像中的像素值
        //效果图:
        //实现代码:
        public static Bitmap wuhua(Bitmap bt)
        {
            //以雾化效果显示图像
            try
            {
                int Height = bt.Height;
                int Width = bt.Width;
                Bitmap newBitmap = new Bitmap(Width, Height);
                Color pixel;
                for (int x = 1; x < Width - 1; x++)
                    for (int y = 1; y < Height - 1; y++)
                    {
                        System.Random MyRandom = new Random();
                        int k = MyRandom.Next(123456);
                        //像素块大小
                        int dx = x + k % 19;
                        int dy = y + k % 19;
                        if (dx >= Width)
                            dx = Width - 1;
                        if (dy >= Height)
                            dy = Height - 1;
                        pixel = bt.GetPixel(dx, dy);
                        newBitmap.SetPixel(x, y, pixel);
                    }
                return newBitmap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
    //三、对像素的访问
    //我们可以来建立一个GrayBitmapData类来做相关的处理。整个类的程序如下：
    public partial class GrayBitmapData
    {
        public byte[,] Data;//保存像素矩阵
        public int Width;//图像的宽度
        public int Height;//图像的高度

        public GrayBitmapData()
        {
            this.Width = 0;
            this.Height = 0;
            this.Data = null;
        }
        public GrayBitmapData(Bitmap bmp)//不变
        {
            BitmapData bmpData = bmp.LockBits(new Rectangle(0, 0, bmp.Width, bmp.Height), ImageLockMode.ReadOnly, PixelFormat.Format24bppRgb);
            this.Width = bmpData.Width;
            this.Height = bmpData.Height;
            Data = new byte[Height, Width];
            unsafe
            {
                byte* ptr = (byte*)bmpData.Scan0.ToPointer();
                for (int i = 0; i < Height; i++)
                {
                    for (int j = 0; j < Width; j++)
                    {
                        //ptr[0] = ptr[1] = ptr[2] = temp;
                        //ptr += 3;
                        //不变
                        int temp = (int)(*ptr++) + (int)(*ptr++) + (int)(*ptr++);
                        Data[i, j] = (byte)(temp / 3);
                    }
                    ptr += bmpData.Stride - Width * 3;//指针加上填充的空白空间
                }
            }
            bmp.UnlockBits(bmpData);
        }

        public GrayBitmapData(string path)
            : this(new Bitmap(path))
        {
        }

        public Bitmap ToBitmapbubian()
        {
            Bitmap bmp = new Bitmap(Width, Height, PixelFormat.Format24bppRgb);
            BitmapData bmpData = bmp.LockBits(new Rectangle(0, 0, Width, Height), ImageLockMode.WriteOnly, PixelFormat.Format24bppRgb);
            unsafe
            {
                byte* ptr = (byte*)bmpData.Scan0.ToPointer();
                for (int i = 0; i < Height; i++)
                {
                    for (int j = 0; j < Width; j++)
                    {
                        *(ptr++) = Data[i, j];
                        *(ptr++) = Data[i, j];
                        *(ptr++) = Data[i, j];
                    }
                    ptr += bmpData.Stride - Width * 3;
                }
            }
            bmp.UnlockBits(bmpData);
            return bmp;
        }

        public void ShowImage(PictureBox pbx)
        {
            Bitmap b;
            b = this.ToBitmapbubian();
            pbx.Image = b;
            //b.Dispose();
        }

        public void SaveImage(string path)
        {
            Bitmap b;
            b = this.ToBitmapbubian();
            b.Save(path);
            //b.Dispose();
        }
        //均值滤波
        public void AverageFilter(int windowSize)
        {
            if (windowSize % 2 == 0)
            {
                return;
            }

            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    int sum = 0;
                    for (int g = -(windowSize - 1) / 2; g <= (windowSize - 1) / 2; g++)
                    {
                        for (int k = -(windowSize - 1) / 2; k <= (windowSize - 1) / 2; k++)
                        {
                            int a = i + g, b = j + k;
                            if (a < 0) a = 0;
                            if (a > Height - 1) a = Height - 1;
                            if (b < 0) b = 0;
                            if (b > Width - 1) b = Width - 1;
                            sum += Data[a, b];
                        }
                    }
                    Data[i, j] = (byte)(sum / (windowSize * windowSize));
                }
            }
        }
        //中值滤波
        public void MidFilter(int windowSize)
        {
            if (windowSize % 2 == 0)
            {
                return;
            }

            int[] temp = new int[windowSize * windowSize];
            byte[,] newdata = new byte[Height, Width];
            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    int n = 0;
                    for (int g = -(windowSize - 1) / 2; g <= (windowSize - 1) / 2; g++)
                    {
                        for (int k = -(windowSize - 1) / 2; k <= (windowSize - 1) / 2; k++)
                        {
                            int a = i + g, b = j + k;
                            if (a < 0) a = 0;
                            if (a > Height - 1) a = Height - 1;
                            if (b < 0) b = 0;
                            if (b > Width - 1) b = Width - 1;
                            temp[n++] = Data[a, b];
                        }
                    }
                    newdata[i, j] = GetMidValue(temp, windowSize * windowSize);
                }
            }

            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    Data[i, j] = newdata[i, j];
                }
            }
        }
        //获得一个向量的中值
        private byte GetMidValue(int[] t, int length)
        {
            int temp = 0;
            for (int i = 0; i < length - 2; i++)
            {
                for (int j = i + 1; j < length - 1; j++)
                {
                    if (t[i] > t[j])
                    {
                        temp = t[i];
                        t[i] = t[j];
                        t[j] = temp;
                    }
                }
            }

            return (byte)t[(length - 1) / 2];
        }
        public static List<Rectangle> listfengguo = new List<Rectangle>();
        public unsafe void fengguo(int startxp, int startyp, int widthf, int heightf, int lianjiePMinx)
        {
            int[] startY = new int[100];
            int[] endY = new int[100];
            int[] startX = new int[100];
            int[] endX = new int[100];
            GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            IntPtr addr = h.AddrOfPinnedObject();
            byte* p = (byte*)addr;
            int* ysum = stackalloc int[heightf];
            int* xsum = stackalloc int[widthf];
            int* lianjiePMinxP = &lianjiePMinx;
            for (int y = startyp; y < heightf; y++)
            {
                for (int x = startxp; x < widthf; x++)
                {
                    if (*p++ < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
            }
            int startnumy = 1;
            int startnumx = 1;
            bool startboolx = false;
            bool startbooly = false;
            bool childy = false;
            bool childx = false;
            bool jinru = false;
            for (int y = startyp; y < heightf; y++)
            {
                if (ysum[y] > *lianjiePMinxP)
                {
                    if (startbooly == false)
                    {
                        if (startnumy % 2 == 0) startnumy += 1;
                        startY[startnumy] = y;
                        startnumy += 1;
                        startbooly = true;
                        jinru = true;
                    }
                }
                else if (startbooly == true)
                {
                    endY[startnumy] = y;//得到框y- 对
                    startbooly = false;
                    for (int x = startxp; x < widthf; x++)
                    {
                        if (xsum[x] > *lianjiePMinxP)
                        {
                            if (startboolx == false)
                            {
                                if (startnumx % 2 == 0) startnumx += 1;
                                startX[startnumx] = x;
                                startnumx += 1;
                                startboolx = true;
                            }
                        }
                        else if (startboolx == true)
                        {
                            endX[startnumx] = x;
                            startboolx = false;
                            childy = true;
                            fengguo2(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, widthf, heightf);
                        }
                    }
                }
            }
            //xy方向
            startnumy = 1;
            startnumx = 1;
            startboolx = false;
            startbooly = false;
            for (int x = startxp; x < widthf; x++)
            {
                if (xsum[x] > *lianjiePMinxP)
                {
                    if (startboolx == false)
                    {
                        if (startnumx % 2 == 0) startnumx += 1;
                        startX[startnumx] = x;
                        startnumx += 1;
                        startboolx = true;
                        jinru = true;
                    }
                }
                else if (startboolx == true)
                {
                    endX[startnumx] = x;//得到框y- 对
                    startboolx = false;
                    for (int y = startyp; y < heightf; y++)
                    {
                        if (ysum[y] > *lianjiePMinxP)
                        {
                            if (startbooly == false)
                            {
                                if (startnumy % 2 == 0) startnumy += 1;
                                startY[startnumy] = y;
                                startnumy += 1;
                                startbooly = true;
                            }
                        }
                        else if (startbooly == true)
                        {
                            endY[startnumy] = y;
                            startbooly = false;
                            childx = true;
                            fengguo2(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, widthf, heightf);
                        }
                    }
                }
            }
            if (jinru && (childx != true && childy != true)) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
            h.Free();
        }
        public void listfenguozj(Rectangle rects)
        {
            for (int i = 0; i < listfengguo.Count; i++)
            {
                if (listfengguo[i].Equals(rects)) return;
            }
            listfengguo.Add(rects);
        }
        public bool listfenguozjbool(Rectangle rects)
        {
            for (int i = 0; i < listfengguo.Count; i++)
            {
                if (listfengguo[i].Equals(rects)) return true;
            }
            return false;
        }
        public unsafe void fengguo2(int startxp, int startyp, int widthf, int heightf, int lianjiePMinx, int ywidth, int yheight)
        {
            int[] startY = new int[100];
            int[] endY = new int[100];
            int[] startX = new int[100];
            int[] endX = new int[100];
            //GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            //IntPtr addr = h.AddrOfPinnedObject();
            //byte* p = (byte*)addr;
            int* ysum = stackalloc int[yheight];
            int* xsum = stackalloc int[ywidth];
            int* lianjiePMinxP = &lianjiePMinx;
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                for (int x = startxp; x <= startxp + widthf; x++)
                {
                    if (Data[y, x] < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
            }
            int startnumy = 1;
            int startnumx = 1;
            bool startboolx = false;
            bool startbooly = false;
            bool childy = false;
            bool childx = false;
            bool jinru = false;
            //xy方向
            startnumy = 1;
            startnumx = 1;
            startboolx = false;
            startbooly = false;
            for (int x = startxp; x <= startxp + widthf; x++)
            {
                if (xsum[x] > *lianjiePMinxP)
                {
                    if (startboolx == true & x == startxp + widthf)//如果是结束点还没有打对点
                    {
                        endX[startnumx] = x;//得到框y- 对
                        startboolx = false;
                        for (int y = startyp; y <= startyp + heightf; y++)
                        {
                            if (ysum[y] > *lianjiePMinxP)
                            {
                                if (startbooly == false)
                                {
                                    if (startnumy % 2 == 0) startnumy += 1;
                                    startY[startnumy] = y;
                                    startnumy += 1;
                                    startbooly = true;

                                }
                            }
                            else if (startbooly == true)
                            {
                                endY[startnumy] = y;
                                startbooly = false;
                                childx = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo3(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }

                    if (startboolx == false)
                    {
                        if (startnumx % 2 == 0) startnumx += 1;
                        startX[startnumx] = x;
                        startnumx += 1;
                        startboolx = true;
                        jinru = true;
                    }
                }
                else if (startboolx == true)
                {
                endx:
                    endX[startnumx] = x;//得到框y- 对
                    startboolx = false;
                    for (int y = startyp; y <= startyp + heightf; y++)
                    {
                        if (ysum[y] > *lianjiePMinxP)
                        {
                            if (startbooly == false)
                            {
                                if (startnumy % 2 == 0) startnumy += 1;
                                startY[startnumy] = y;
                                startnumy += 1;
                                startbooly = true;

                            }
                        }
                        else if (startbooly == true)
                        {
                            endY[startnumy] = y;
                            startbooly = false;
                            childx = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo3(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                if (ysum[y] > *lianjiePMinxP)
                {
                    if (startbooly == true && y == startyp + heightf)//当y是终点时
                    {
                        endY[startnumy] = y;//得到框y- 对
                        startbooly = false;
                        for (int x = startxp; x <= startxp + widthf; x++)
                        {
                            if (xsum[x] > *lianjiePMinxP)
                            {
                                if (startboolx == false)
                                {
                                    if (startnumx % 2 == 0) startnumx += 1;
                                    startX[startnumx] = x;
                                    startnumx += 1;
                                    startboolx = true;
                                }
                            }
                            else if (startboolx == true)
                            {
                                endX[startnumx] = x;
                                startboolx = false;
                                childy = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo3(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }
                    if (startbooly == false)
                    {
                        if (startnumy % 2 == 0) startnumy += 1;
                        startY[startnumy] = y;
                        startnumy += 1;
                        startbooly = true;
                        jinru = true;
                    }
                }
                else if (startbooly == true)
                {
                    endY[startnumy] = y;//得到框y- 对
                    startbooly = false;
                    for (int x = startxp; x <= startxp + widthf; x++)
                    {
                        if (xsum[x] > *lianjiePMinxP)
                        {
                            if (startboolx == false)
                            {
                                if (startnumx % 2 == 0) startnumx += 1;
                                startX[startnumx] = x;
                                startnumx += 1;
                                startboolx = true;
                            }
                        }
                        else if (startboolx == true)
                        {
                            endX[startnumx] = x;
                            startboolx = false;
                            childy = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo3(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            if (jinru && (childx != true && childy != true)) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
            //h.Free();
        }
        public unsafe void fengguo3(int startxp, int startyp, int widthf, int heightf, int lianjiePMinx, int ywidth, int yheight)
        {
            int[] startY = new int[100];
            int[] endY = new int[100];
            int[] startX = new int[100];
            int[] endX = new int[100];
            //GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            //IntPtr addr = h.AddrOfPinnedObject();
            //byte* p = (byte*)addr;
            int* ysum = stackalloc int[yheight];
            int* xsum = stackalloc int[ywidth];
            int* lianjiePMinxP = &lianjiePMinx;
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                for (int x = startxp; x <= startxp + widthf; x++)
                {
                    if (Data[y, x] < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
            }
            int startnumy = 1;
            int startnumx = 1;
            bool startboolx = false;
            bool startbooly = false;
            bool childy = false;
            bool childx = false;
            bool jinru = false;
            //xy方向
            startnumy = 1;
            startnumx = 1;
            startboolx = false;
            startbooly = false;
            for (int x = startxp; x <= startxp + widthf; x++)
            {
                if (xsum[x] > *lianjiePMinxP)
                {
                    if (startboolx == true & x == startxp + widthf)//如果是结束点还没有打对点
                    {
                        endX[startnumx] = x;//得到框y- 对
                        startboolx = false;
                        for (int y = startyp; y <= startyp + heightf; y++)
                        {
                            if (ysum[y] > *lianjiePMinxP)
                            {
                                if (startbooly == false)
                                {
                                    if (startnumy % 2 == 0) startnumy += 1;
                                    startY[startnumy] = y;
                                    startnumy += 1;
                                    startbooly = true;

                                }
                            }
                            else if (startbooly == true)
                            {
                                endY[startnumy] = y;
                                startbooly = false;
                                childx = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo4(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }

                    if (startboolx == false)
                    {
                        if (startnumx % 2 == 0) startnumx += 1;
                        startX[startnumx] = x;
                        startnumx += 1;
                        startboolx = true;
                        jinru = true;
                    }
                }
                else if (startboolx == true)
                {
                endx:
                    endX[startnumx] = x;//得到框y- 对
                    startboolx = false;
                    for (int y = startyp; y <= startyp + heightf; y++)
                    {
                        if (ysum[y] > *lianjiePMinxP)
                        {
                            if (startbooly == false)
                            {
                                if (startnumy % 2 == 0) startnumy += 1;
                                startY[startnumy] = y;
                                startnumy += 1;
                                startbooly = true;

                            }
                        }
                        else if (startbooly == true)
                        {
                            endY[startnumy] = y;
                            startbooly = false;
                            childx = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo4(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                if (ysum[y] > *lianjiePMinxP)
                {
                    if (startbooly == true && y == startyp + heightf)//当y是终点时
                    {
                        endY[startnumy] = y;//得到框y- 对
                        startbooly = false;
                        for (int x = startxp; x <= startxp + widthf; x++)
                        {
                            if (xsum[x] > *lianjiePMinxP)
                            {
                                if (startboolx == false)
                                {
                                    if (startnumx % 2 == 0) startnumx += 1;
                                    startX[startnumx] = x;
                                    startnumx += 1;
                                    startboolx = true;
                                }
                            }
                            else if (startboolx == true)
                            {
                                endX[startnumx] = x;
                                startboolx = false;
                                childy = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo3(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }
                    if (startbooly == false)
                    {
                        if (startnumy % 2 == 0) startnumy += 1;
                        startY[startnumy] = y;
                        startnumy += 1;
                        startbooly = true;
                        jinru = true;
                    }
                }
                else if (startbooly == true)
                {
                    endY[startnumy] = y;//得到框y- 对
                    startbooly = false;
                    for (int x = startxp; x <= startxp + widthf; x++)
                    {
                        if (xsum[x] > *lianjiePMinxP)
                        {
                            if (startboolx == false)
                            {
                                if (startnumx % 2 == 0) startnumx += 1;
                                startX[startnumx] = x;
                                startnumx += 1;
                                startboolx = true;
                            }
                        }
                        else if (startboolx == true)
                        {
                            endX[startnumx] = x;
                            startboolx = false;
                            childy = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo4(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            if (jinru && (childx != true && childy != true)) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
            //h.Free();
        }
        public unsafe void fengguo4(int startxp, int startyp, int widthf, int heightf, int lianjiePMinx, int ywidth, int yheight)
        {
            int[] startY = new int[100];
            int[] endY = new int[100];
            int[] startX = new int[100];
            int[] endX = new int[100];
            //GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            //IntPtr addr = h.AddrOfPinnedObject();
            //byte* p = (byte*)addr;
            int* ysum = stackalloc int[yheight];
            int* xsum = stackalloc int[ywidth];
            int* lianjiePMinxP = &lianjiePMinx;
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                for (int x = startxp; x <= startxp + widthf; x++)
                {
                    if (Data[y, x] < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
            }
            int startnumy = 1;
            int startnumx = 1;
            bool startboolx = false;
            bool startbooly = false;
            bool childy = false;
            bool childx = false;
            bool jinru = false;
            //xy方向
            startnumy = 1;
            startnumx = 1;
            startboolx = false;
            startbooly = false;
            for (int x = startxp; x <= startxp + widthf; x++)
            {
                if (xsum[x] > *lianjiePMinxP)
                {
                    if (startboolx == true & x == startxp + widthf)//如果是结束点还没有打对点
                    {
                        endX[startnumx] = x;//得到框y- 对
                        startboolx = false;
                        for (int y = startyp; y <= startyp + heightf; y++)
                        {
                            if (ysum[y] > *lianjiePMinxP)
                            {
                                if (startbooly == false)
                                {
                                    if (startnumy % 2 == 0) startnumy += 1;
                                    startY[startnumy] = y;
                                    startnumy += 1;
                                    startbooly = true;

                                }
                            }
                            else if (startbooly == true)
                            {
                                endY[startnumy] = y;
                                startbooly = false;
                                childx = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo5(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }

                    if (startboolx == false)
                    {
                        if (startnumx % 2 == 0) startnumx += 1;
                        startX[startnumx] = x;
                        startnumx += 1;
                        startboolx = true;
                        jinru = true;
                    }
                }
                else if (startboolx == true)
                {
                endx:
                    endX[startnumx] = x;//得到框y- 对
                    startboolx = false;
                    for (int y = startyp; y <= startyp + heightf; y++)
                    {
                        if (ysum[y] > *lianjiePMinxP)
                        {
                            if (startbooly == false)
                            {
                                if (startnumy % 2 == 0) startnumy += 1;
                                startY[startnumy] = y;
                                startnumy += 1;
                                startbooly = true;

                            }
                        }
                        else if (startbooly == true)
                        {
                            endY[startnumy] = y;
                            startbooly = false;
                            childx = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo5(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                if (ysum[y] > *lianjiePMinxP)
                {
                    if (startbooly == true && y == startyp + heightf)//当y是终点时
                    {
                        endY[startnumy] = y;//得到框y- 对
                        startbooly = false;
                        for (int x = startxp; x <= startxp + widthf; x++)
                        {
                            if (xsum[x] > *lianjiePMinxP)
                            {
                                if (startboolx == false)
                                {
                                    if (startnumx % 2 == 0) startnumx += 1;
                                    startX[startnumx] = x;
                                    startnumx += 1;
                                    startboolx = true;
                                }
                            }
                            else if (startboolx == true)
                            {
                                endX[startnumx] = x;
                                startboolx = false;
                                childy = true;
                                if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                    fengguo5(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                                //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //return;
                            }
                        }
                    }
                    if (startbooly == false)
                    {
                        if (startnumy % 2 == 0) startnumy += 1;
                        startY[startnumy] = y;
                        startnumy += 1;
                        startbooly = true;
                        jinru = true;
                    }
                }
                else if (startbooly == true)
                {
                    endY[startnumy] = y;//得到框y- 对
                    startbooly = false;
                    for (int x = startxp; x <= startxp + widthf; x++)
                    {
                        if (xsum[x] > *lianjiePMinxP)
                        {
                            if (startboolx == false)
                            {
                                if (startnumx % 2 == 0) startnumx += 1;
                                startX[startnumx] = x;
                                startnumx += 1;
                                startboolx = true;
                            }
                        }
                        else if (startboolx == true)
                        {
                            endX[startnumx] = x;
                            startboolx = false;
                            childy = true;
                            if (!listfenguozjbool(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1])))
                                fengguo5(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP, ywidth, yheight);
                            //listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //return;
                        }
                    }
                }
            }
            if (jinru && (childx != true && childy != true)) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
            //h.Free();
        }
        public unsafe void fengguo5(int startxp, int startyp, int widthf, int heightf, int lianjiePMinx, int ywidth, int yheight)
        {
            int[] startY = new int[100];
            int[] endY = new int[100];
            int[] startX = new int[100];
            int[] endX = new int[100];
            //GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            //IntPtr addr = h.AddrOfPinnedObject();
            //byte* p = (byte*)addr;
            int* ysum = stackalloc int[yheight];
            int* xsum = stackalloc int[ywidth];
            int* lianjiePMinxP = &lianjiePMinx;
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                for (int x = startxp; x <= startxp + widthf; x++)
                {
                    if (Data[y, x] < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
            }
            int startnumy = 1;
            int startnumx = 1;
            bool startboolx = false;
            bool startbooly = false;
            bool childy = false;
            bool childx = false;
            bool jinru = false;
            for (int y = startyp; y <= startyp + heightf; y++)
            {
                if (ysum[y] > *lianjiePMinxP)
                {
                    if (startboolx == true && y == startyp + heightf)
                    {
                        endY[startnumy] = y;//得到框y- 对
                        startbooly = false;
                        for (int x = startxp; x <= startxp + widthf; x++)
                        {
                            if (xsum[x] > *lianjiePMinxP)
                            {
                                if (startboolx == false)
                                {
                                    if (startnumx % 2 == 0) startnumx += 1;
                                    startX[startnumx] = x;
                                    startnumx += 1;
                                    startboolx = true;
                                }
                            }
                            else if (startboolx == true)
                            {
                                endX[startnumx] = x;
                                startboolx = false;
                                childy = true;
                                //if (startboolx || startbooly) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
                                listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                                //fengguo(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP);
                            }
                        }
                    }
                    if (startbooly == false)
                    {
                        if (startnumy % 2 == 0) startnumy += 1;
                        startY[startnumy] = y;
                        startnumy += 1;
                        startbooly = true;
                        jinru = true;
                    }
                }
                else if (startbooly == true)
                {
                    endY[startnumy] = y;//得到框y- 对
                    startbooly = false;
                    for (int x = startxp; x <= startxp + widthf; x++)
                    {
                        if (xsum[x] > *lianjiePMinxP)
                        {
                            if (startboolx == false)
                            {
                                if (startnumx % 2 == 0) startnumx += 1;
                                startX[startnumx] = x;
                                startnumx += 1;
                                startboolx = true;
                            }
                        }
                        else if (startboolx == true)
                        {
                            endX[startnumx] = x;
                            startboolx = false;
                            childy = true;
                            //if (startboolx || startbooly) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
                            listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            //fengguo(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1], *lianjiePMinxP);
                        }
                    }
                }
            }
            //xy方向
            startnumy = 1;
            startnumx = 1;
            startboolx = false;
            startbooly = false;
            for (int x = startxp; x <= startxp + widthf; x++)
            {
                if (xsum[x] > *lianjiePMinxP)
                {
                    if (startboolx == true && x == startxp + widthf)
                    {
                        endX[startnumx] = x;//得到框y- 对
                        startboolx = false;
                        for (int y = startyp; y <= startyp + heightf; y++)
                        {
                            if (ysum[y] > *lianjiePMinxP)
                            {
                                if (startbooly == false)
                                {
                                    if (startnumy % 2 == 0) startnumy += 1;
                                    startY[startnumy] = y;
                                    startnumy += 1;
                                    startbooly = true;
                                }
                            }
                            else if (startbooly == true)
                            {
                                endY[startnumy] = y;
                                startbooly = false;
                                childx = true;
                                //if (startboolx || startbooly) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
                                listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                            }
                        }
                    }

                    if (startboolx == false)
                    {
                        if (startnumx % 2 == 0) startnumx += 1;
                        startX[startnumx] = x;
                        startnumx += 1;
                        startboolx = true;
                        jinru = true;
                    }
                }
                else if (startboolx == true)
                {
                    endX[startnumx] = x;//得到框y- 对
                    startboolx = false;
                    for (int y = startyp; y <= startyp + heightf; y++)
                    {
                        if (ysum[y] > *lianjiePMinxP)
                        {
                            if (startbooly == false)
                            {
                                if (startnumy % 2 == 0) startnumy += 1;
                                startY[startnumy] = y;
                                startnumy += 1;
                                startbooly = true;
                            }
                        }
                        else if (startbooly == true)
                        {
                            endY[startnumy] = y;
                            startbooly = false;
                            childx = true;
                            //if (startboolx || startbooly) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
                            listfenguozj(new Rectangle(startX[startnumx - 1], startY[startnumy - 1], endX[startnumx] - startX[startnumx - 1], endY[startnumy] - startY[startnumy - 1]));
                        }
                    }
                }
            }
            if (jinru && (childx != true && childy != true)) listfenguozj(new Rectangle(startxp, startyp, widthf, heightf));
            //h.Free();
        }
        public unsafe Rectangle Kuangxuan(int upMin, int upMax, int downMin, int downMax, int leftMin, int leftMax, int rightMin, int rightMax)
        {
            //byte*[] p1=new byte*[Height];
            //object p = new People();
            //GCHandle h = GCHandle.Alloc(p, GCHandleType.Pinned);
            //IntPtr addr = h.AddrOfPinnedObject();
            //Console.WriteLine(addr.ToString());
            //h.Free();
            //byte* p1;
            kuangxuanC kuangxuanget = new kuangxuanC();
            GCHandle h = GCHandle.Alloc(Data, GCHandleType.Pinned);
            IntPtr addr = h.AddrOfPinnedObject();
            byte* p = (byte*)addr;
            int* ysum = stackalloc int[Height];
            int* xsum = stackalloc int[Width];
            int* upMin1 = &upMin;
            int* upMax1 = &upMax;
            int* downMin1 = &downMin;
            int* downMax1 = &downMax;
            int* leftMin1 = &leftMin;
            int* leftMax1 = &leftMax;
            int* rightMin1 = &rightMin;
            int* rightMax1 = &rightMax;
            //int[] ysum = new int[Height]; int[] xsum = new int[Width];
            for (int y = 0; y < Height; y++)
            {
                for (int x = 0; x < Width; x++)
                {
                    if (*p++ < 3)
                    {
                        xsum[x] += 1;
                        ysum[y] += 1;
                    }
                }
                //p1[0] = (byte*)this.Data[y, 0];
            }
            for (int y = 0; y < Height; y++)
            {
                if (ysum[y] >= *upMin1 & ysum[y] <= *upMax1)
                {
                    kuangxuanget.startY = y;
                    break;
                }
            }
            for (int y = Height - 1; y > -1; y--)
            {
                if (ysum[y] >= *downMin1 & ysum[y] <= *downMax1)
                {
                    kuangxuanget.endY = y;
                    break;
                }
            }
            for (int x = 0; x < Width; x++)
            {
                if (xsum[x] >= *leftMin1 & xsum[x] <= *leftMax1)
                {
                    kuangxuanget.startX = x;
                    break;
                }
            }
            for (int x = Width - 1; x > -1; x--)
            {
                if (xsum[x] >= *rightMin1 & xsum[x] <= *rightMax1)
                {
                    kuangxuanget.endX = x;
                    break;
                }
            }
            h.Free();
            return new Rectangle(kuangxuanget.startX, kuangxuanget.startY, kuangxuanget.endX - kuangxuanget.startX, kuangxuanget.endY - kuangxuanget.startY);
        }
        //一种新的滤波方法，是亮的更亮、暗的更暗
        public void NewFilter(int windowSize)
        {
            if (windowSize % 2 == 0)
            {
                return;
            }

            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    int sum = 0;
                    for (int g = -(windowSize - 1) / 2; g <= (windowSize - 1) / 2; g++)
                    {
                        for (int k = -(windowSize - 1) / 2; k <= (windowSize - 1) / 2; k++)
                        {
                            int a = i + g, b = j + k;
                            if (a < 0) a = 0;
                            if (a > Height - 1) a = Height - 1;
                            if (b < 0) b = 0;
                            if (b > Width - 1) b = Width - 1;
                            sum += Data[a, b];
                        }
                    }
                    double avg = (sum + 0.0) / (windowSize * windowSize);
                    if (avg / 255 < 0.5)
                    {
                        Data[i, j] = (byte)(2 * avg / 255 * Data[i, j]);
                    }
                    else
                    {
                        Data[i, j] = (byte)((1 - 2 * (1 - avg / 255.0) * (1 - Data[i, j] / 255.0)) * 255);
                    }
                }
            }
        }
        //直方图均衡
        public void HistEqual()
        {
            double[] num = new double[256];
            for (int i = 0; i < 256; i++) num[i] = 0;

            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    num[Data[i, j]]++;
                }
            }

            double[] newGray = new double[256];
            double n = 0;
            for (int i = 0; i < 256; i++)
            {
                n += num[i];
                newGray[i] = n * 255 / (Height * Width);
            }

            for (int i = 0; i < Height; i++)
            {
                for (int j = 0; j < Width; j++)
                {
                    Data[i, j] = (byte)newGray[Data[i, j]];
                }
            }
        }

        ///   <summary>
        ///   去掉杂点（适合杂点/杂线粗为1）
        ///   </summary>
        ///   <param name="dgGrayValue"> 背前景灰色界限 </param>
        ///   <returns></returns>
        public void ClearNoise(int dgGrayValue, int MaxNearPoints = 3)//max最大8
        {
            int nearDots = 0;
            // 逐点判断
            for (int j = 0; j < Height; j++)
                for (int i = 0; i < Width; i++)
                {
                    if (Data[j, i] < dgGrayValue)
                    {
                        nearDots = 0;
                        // 判断周围8个点是否全为空
                        if (i == 0 || i == Width - 1 || j == 0 || j == Height - 1)   // 边框全去掉
                        {
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                            Data[j, i] = 255;
                        }
                        else
                        {
                            //if (bmpobj.GetPixel(i - 1, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i - 1, j).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i - 1, j + 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i, j + 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j + 1).R < dgGrayValue) nearDots++;
                            if (Data[j - 1, i - 1] < dgGrayValue) nearDots++;
                            if (Data[j - 1, i] < dgGrayValue) nearDots++;
                            if (Data[j - 1, i + 1] < dgGrayValue) nearDots++;
                            if (Data[j, i - 1] < dgGrayValue) nearDots++;
                            if (Data[j, i + 1] < dgGrayValue) nearDots++;
                            if (Data[j + 1, i - 1] < dgGrayValue) nearDots++;
                            if (Data[j + 1, i] < dgGrayValue) nearDots++;
                            if (Data[j + 1, i + 1] < dgGrayValue) nearDots++;
                        }

                        if (nearDots < MaxNearPoints)
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));    // 去掉单点 && 粗细小3邻边点
                            Data[j, i] = 255;
                    }
                    else    // 背景
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                        Data[j, i] = 255;
                }
        }
        ///   <summary>
        ///   去掉杂点（适合杂点/杂线粗为1）
        ///   </summary>
        ///   <param name="dgGrayValue"> 背前景灰色界限 </param>
        ///   <returns></returns>
        public void ClearNoiseold(int dgGrayValue, int MaxNearPoints, Bitmap p)//MaxNearPoints最大8
        {
            if (p == null) return;
            Rectangle rect = new Rectangle(0, 0, p.Width, p.Height);
            //Bitmap bmpSource = new Bitmap(p);
            System.Drawing.Imaging.BitmapData bmpData = p.LockBits(rect, System.Drawing.Imaging.ImageLockMode.ReadWrite, p.PixelFormat);
            IntPtr ptr = bmpData.Scan0;
            int bytes = p.Width * p.Height * 3;
            byte[] rgbValues = new byte[bytes];
            System.Runtime.InteropServices.Marshal.Copy(ptr, rgbValues, 0, bytes);
            int nearDots = 0;
            int rstart = 0;
            // 逐点判断
            for (int i = 0; i < p.Width; i++)
                for (int j = 0; j < p.Height; j++)
                {
                    rstart = p.Width * 3 * j + i * 3;
                    if (rgbValues[rstart] < dgGrayValue)
                    {
                        nearDots = 0;
                        // 判断周围8个点是否全为空
                        if (i == 0 || i == p.Width - 1 || j == 0 || j == p.Height - 1)   // 边框全去掉
                        {
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                            rgbValues[rstart] = rgbValues[rstart + 1] = rgbValues[rstart + 2] = 255;
                        }
                        else
                        {
                            //if (bmpobj.GetPixel(i - 1, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j - 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i - 1, j).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i - 1, j + 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i, j + 1).R < dgGrayValue) nearDots++;
                            //if (bmpobj.GetPixel(i + 1, j + 1).R < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j - 1) + (i - 1) * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j - 1) + i * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j - 1) + (i + 1) * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j) + (i - 1) * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * j + (i + 1) * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j + 1) + (i - 1) * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j + 1) + i * 3] < dgGrayValue) nearDots++;
                            if (rgbValues[p.Width * 3 * (j + 1) + (i + 1) * 3] < dgGrayValue) nearDots++;
                        }

                        if (nearDots < MaxNearPoints)
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));    // 去掉单点 && 粗细小3邻边点
                            rgbValues[rstart] = rgbValues[rstart + 1] = rgbValues[rstart + 2] = 255;
                    }
                    else    // 背景
                            //bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                        rgbValues[rstart] = rgbValues[rstart + 1] = rgbValues[rstart + 2] = 255;
                }
            System.Runtime.InteropServices.Marshal.Copy(rgbValues, 0, ptr, bytes);
            p.UnlockBits(bmpData);
            //return rgbValues;
            //Invalidate();
        }
        ///   <summary>
        ///   去掉杂点（适合杂点/杂线粗为1）
        ///   </summary>
        ///   <param name="dgGrayValue"> 背前景灰色界限 </param>
        ///   <returns></returns>
        public void ClearNoiseorigin(int dgGrayValue, int MaxNearPoints, Bitmap bmpobj)
        {
            Color piexl;
            int nearDots = 0;
            int XSpan, YSpan, tmpX, tmpY;
            // 逐点判断
            for (int i = 0; i < bmpobj.Width; i++)
                for (int j = 0; j < bmpobj.Height; j++)
                {
                    piexl = bmpobj.GetPixel(i, j);
                    if (piexl.R < dgGrayValue)
                    {
                        nearDots = 0;
                        // 判断周围8个点是否全为空
                        if (i == 0 || i == bmpobj.Width - 1 || j == 0 || j == bmpobj.Height - 1)   // 边框全去掉
                        {
                            bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                        }
                        else
                        {
                            if (bmpobj.GetPixel(i - 1, j - 1).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i, j - 1).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i + 1, j - 1).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i - 1, j).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i + 1, j).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i - 1, j + 1).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i, j + 1).R < dgGrayValue) nearDots++;
                            if (bmpobj.GetPixel(i + 1, j + 1).R < dgGrayValue) nearDots++;
                        }

                        if (nearDots < MaxNearPoints)
                            bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));    // 去掉单点 && 粗细小3邻边点
                    }
                    else    // 背景
                        bmpobj.SetPixel(i, j, Color.FromArgb(255, 255, 255));
                }
        }

        ///   <summary>
        ///  3×3中值滤波除杂，yuanbao,2007.10
        ///   </summary>
        ///   <param name="dgGrayValue"></param>
        public void ClearNoise2(int dgGrayValue)
        {
            int x, y;
            byte[] p = new byte[9];  // 最小处理窗口3*3
            byte s;
            // byte[] lpTemp=new BYTE[nByteWidth*nHeight];
            int i, j;

            // --!!!!!!!!!!!!!!下面开始窗口为3×3中值滤波!!!!!!!!!!!!!!!!
            for (y = 1; y < Height - 1; y++)  // --第一行和最后一行无法取窗口
            {
                for (x = 1; x < Width - 1; x++)
                {
                    // 取9个点的值
                    p[0] = Data[x - 1, y - 1];
                    p[1] = Data[x, y - 1];
                    p[2] = Data[x + 1, y - 1];
                    p[3] = Data[x - 1, y];
                    p[4] = Data[x, y];
                    p[5] = Data[x + 1, y];
                    p[6] = Data[x - 1, y + 1];
                    p[7] = Data[x, y + 1];
                    p[8] = Data[x + 1, y + 1];
                    // 计算中值
                    for (j = 0; j < 5; j++)
                    {
                        for (i = j + 1; i < 9; i++)
                        {
                            if (p[j] > p[i])
                            {
                                s = p[j];
                                p[j] = p[i];
                                p[i] = s;
                            }
                        }
                    }
                    //       if (bmpobj.GetPixel(x, y).R < dgGrayValue)
                    Data[x, y] = p[4];     // 给有效值付中值
                }
            }
        }
    }
    //    ///   <summary>
    //    ///  3×3中值滤波除杂，yuanbao,2007.10
    //    ///   </summary>
    //    ///   <param name="dgGrayValue"></param>
    //    public void ClearNoise2(int dgGrayValue, Bitmap bmpobj)
    //            {
    //                int x, y;
    //                byte[] p = new byte[9];  // 最小处理窗口3*3
    //                byte s;
    //                // byte[] lpTemp=new BYTE[nByteWidth*nHeight];
    //                int i, j;

    //                // --!!!!!!!!!!!!!!下面开始窗口为3×3中值滤波!!!!!!!!!!!!!!!!
    //                for (y = 1; y < bmpobj.Height - 1; y++)  // --第一行和最后一行无法取窗口
    //                        {
    //                            for (x = 1; x < bmpobj.Width - 1; x++)
    //                                    {
    //                                        // 取9个点的值
    //                                        p[0] = bmpobj.GetPixel(x - 1, y - 1).R;
    //                                        p[1] = bmpobj.GetPixel(x, y - 1).R;
    //                                        p[2] = bmpobj.GetPixel(x + 1, y - 1).R;
    //                                        p[3] = bmpobj.GetPixel(x - 1, y).R;
    //                                        p[4] = bmpobj.GetPixel(x, y).R;
    //                                        p[5] = bmpobj.GetPixel(x + 1, y).R;
    //                                        p[6] = bmpobj.GetPixel(x - 1, y + 1).R;
    //                                        p[7] = bmpobj.GetPixel(x, y + 1).R;
    //                                        p[8] = bmpobj.GetPixel(x + 1, y + 1).R;
    //                                        // 计算中值
    //                                        for (j = 0; j < 5; j++)
    //                                        {
    //                                            for (i = j + 1; i < 9; i++)
    //                                            {
    //                                                if (p[j] > p[i])
    //                                                {
    //                                                    s = p[j];
    //                                                    p[j] = p[i];
    //                                                    p[i] = s;
    //                                                }
    //                                            }
    //                                        }
    //                                        //       if (bmpobj.GetPixel(x, y).R < dgGrayValue)
    //                                        bmpobj.SetPixel(x, y, Color.FromArgb(p[4], p[4], p[4]));     // 给有效值付中值
    //                                    }
    //                        }
    //            }
    //}
}


//在GrayBitmapData类中，只要我们对一个二维数组Data进行一系列的操作就是对图片的操作处理。在窗口上，我们可以使用
//一个按钮来做各种调用：
////均值滤波
//        private void btnAvgFilter_Click(object sender, EventArgs e)
//{
//    if (bmp == null) return;
//    GrayBitmapData gbmp = new GrayBitmapData(bmp);
//    gbmp.AverageFilter(3);
//    gbmp.ShowImage(pbxShowImage);
//}
////转换为灰度图
//private void btnToGray_Click(object sender, EventArgs e)
//{
//    if (bmp == null) return;
//    GrayBitmapData gbmp = new GrayBitmapData(bmp);
//    gbmp.ShowImage(pbxShowImage);
//}

//四、总结
//在Visual c#中对图像进行处理或访问，需要先建立一个Bitmap对象，然后通过其LockBits方法来获得一个BitmapData类的对象，然后通过获得其像素数据的首地址来对Bitmap对象的像素数据进行操作。当然，一种简单但是速度慢的方法是用Bitmap类的GetPixel和SetPixel方法。其中BitmapData类的Stride属性为每行像素所占的字节。
