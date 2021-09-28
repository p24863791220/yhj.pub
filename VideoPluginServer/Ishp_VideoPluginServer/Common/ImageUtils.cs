using Ishp_PluginServer.Common;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace Ishp_VideoPluginServer.Common
{
    public static class ImageUtils
    {
        //图片转二进制
        public static byte[] Bitmap2Byte(Bitmap bitmap)
        {
            try
            {
                using (MemoryStream stream = new MemoryStream())
                {
                    bitmap.Save(stream, ImageFormat.Jpeg);
                    byte[] data = new byte[stream.Length];
                    stream.Seek(0, SeekOrigin.Begin);
                    stream.Read(data, 0, Convert.ToInt32(stream.Length));
                    return data;
                }
            }catch(Exception ex)
            {
                Log.Error(" Bitmap转byte失败:" + ex.Message);
                return new byte[512];
            }
        }

        //图片转为base64编码的文本   
        public static string ToBase64(Bitmap bmp)
        {
            try
            {
                MemoryStream ms = new MemoryStream();
                bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                byte[] arr = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(arr, 0, (int)ms.Length);
                ms.Close();
                String strbaser64 = Convert.ToBase64String(arr);
                return strbaser64;
            }
            catch (Exception ex)
            {
                Console.WriteLine("ImgToBase64String 转换失败 Exception:" + ex.Message);
                return "";
            }
        }


        //base64编码的文本转为图片  
        public static Bitmap Base64StringToImage(string inputStr)
        {
            try
            {
                byte[] arr = Convert.FromBase64String(inputStr);
                MemoryStream ms = new MemoryStream(arr);
                Bitmap bmp = new Bitmap(ms);
                ms.Close();
                return bmp;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Base64StringToImage 转换失败/nException：" + ex.Message);
                return null;
            }
        }

        // 图片文件转bytes
        public static byte[] img2byte(System.Drawing.Image img)
        {
            //将Image转换成流数据，并保存为byte[]
            MemoryStream mstream = new MemoryStream();
            img.Save(mstream, System.Drawing.Imaging.ImageFormat.Jpeg);
            byte[] byData = new Byte[mstream.Length];
            mstream.Position = 0;
            mstream.Read(byData, 0, byData.Length);
            mstream.Close();
            return byData;
        }
        // bytes转图片文件
        public static void byte2img(byte[] b, int len, string file_name)
        {
            MemoryStream ms = new MemoryStream(b);
            ms.Position = 0;
            System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
            img.Save(file_name);
            ms.Close();
        }


        /// <summary>
        /// 根据base64字符串返回一个封装好的GDI+位图。
        /// </summary>
        /// <param name="base64string">可转换成位图的base64字符串。</param>
        /// <returns>Bitmap对象。</returns>
        public static Bitmap GetImageFromBase64(string base64string)
        {
            byte[] b = Convert.FromBase64String(base64string);
            MemoryStream ms = new MemoryStream(b);
            Bitmap bitmap = new Bitmap(ms);
            return bitmap;
        }



    }
}
