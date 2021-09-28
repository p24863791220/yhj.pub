using System;
using System.Windows;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Emgu.CV.CvEnum;
using Emgu.CV;
using Emgu.CV.Structure;
using Emgu.CV.Stitching;
using Emgu.CV.Util;
using System.IO;

namespace 螺丝自动锁付
{
   public static class stitcher
    {

        public static Mat  stitchs(List<Mat> listmat)
        {     
                Stitcher stitcher = new Stitcher();
                Mat outimg = new Mat();
                stitcher.Stitch(new VectorOfMat(listmat.ToArray()), outimg);
            return outimg;
        }

        public static byte[] GetByteImage(Image img)
        {
            byte[] bt = null;
            if (!img.Equals(null))
            {
                using (MemoryStream mostream = new MemoryStream())
                {
                    Bitmap bmp = new Bitmap(img);
                    bmp.Save(mostream, System.Drawing.Imaging.ImageFormat.Bmp);//将图像以指定的格式存入缓存内存流
                    bt = new byte[mostream.Length];
                    mostream.Position = 0;//设置留的初始位置
                    mostream.Read(bt, 0, Convert.ToInt32(bt.Length));
                }
            }
            return bt;
        }

        public static byte[] GetFileData(string fileUrl)
        {
            FileStream fs = new FileStream(fileUrl, FileMode.Open, FileAccess.Read);
            try
            {
                byte[] buffur = new byte[fs.Length];
                fs.Read(buffur, 0, (int)fs.Length);

                return buffur;
            }
            catch (Exception ex)
            {
                //MessageBoxHelper.ShowPrompt(ex.Message);
                return null;
            }
            finally
            {
                if (fs != null)
                {

                    //关闭资源
                    fs.Close();
                }
            }
        }

        public static bool writeFile(byte[] pReadByte, string fileName)

        {
            FileStream pFileStream = null;
            try

                {
                    pFileStream = new FileStream(fileName, FileMode.OpenOrCreate);
                    pFileStream.Write(pReadByte, 0, pReadByte.Length);
                }

            catch

                {

                    return false;

                }

            finally

                {

                    if (pFileStream != null)

                        pFileStream.Close();

                }

            return true;

        }
    }
}

