using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace 无人值守.Controller
{
    public class Datatransfrom
    {
//        1、数字和字节之间互转
//int num = 12345;
//        byte[] bytes = BitConverter.GetBytes(num);//将int32转换为字节数组
//        num=BitConverter.ToInt32(bytes,0);//将字节数组内容再转成int32类型
//2、将字符串转为16进制字符，允许中文
public string StringToHexString(string s, Encoding encode)
        {
            byte[] b = encode.GetBytes(s);//按照指定编码将string编程字节数组
            string result = string.Empty;
            for (int i = 0; i < b.Length; i++)//逐字节变为16进制字符
            {
                result += Convert.ToString(b[i], 16);
            }
            return result;
        }
        //如：
///注意，一个中文转为utf-8占三个字节，英文占一个字节
//System.Console.WriteLine(StringToHexString("中华人民共和国",
//System.Text.Encoding.UTF8));
//或使用
//BitConverter.ToString(Encoding.UTF8.GetBytes("中华人民共和国"))
//返回结果为XX-XX-XX
//然后再去掉"-"
//3、将16进制字符串转为字符串
public string HexStringToString(string hs, Encoding encode)
        {
            string strTemp = "";
            byte[] b = new byte[hs.Length / 2];
            for (int i = 0; i < hs.Length / 2; i++)
            {
                strTemp = hs.Substring(i * 2, 2);
                b[i] = Convert.ToByte(strTemp, 16);
            }
            //按照指定编码将字节数组变为字符串
            return encode.GetString(b);
        }
//string hexstring = StringToHexString("中华人民共和国", System.Text.Encoding.UTF8);
//        string content = HexStringToString(hexstring, System.Text.Encoding.UTF8)
//4、将byte[] 转为16进制字符串
public static string byteToHexStr(byte[] bytes)
        {
            string returnStr = "";
            if (bytes != null)
            {
                for (int i = 0; i < bytes.Length; i++)
                {
                    returnStr += bytes[i].ToString("X2");
                }
            }
            return returnStr;
        }
//5、将16进制的字符串转为byte[]
public static byte[] strToToHexByte(string hexString)
        {
            hexString = hexString.Replace(" ", "");
            if ((hexString.Length % 2) != 0)
                hexString += " ";
            byte[] returnBytes = new byte[hexString.Length / 2];
            for (int i = 0; i < returnBytes.Length; i++)
                returnBytes[i] = Convert.ToByte(hexString.Substring(i * 2, 2), 16);
            return returnBytes;
        }
        //转义结果数据缓存
        //public char[] sdataT=new char[128];
        //预发送数据缓存
        //public  char[] sdata=new char[64];
        //预发送数据长度
        //public int slen = 64;
        /// <summary>
        /// 数据发送转换，数据中报头报尾字符转
        /// </summary>
        /// <param name="sdata"></param>
        /// <param name="sdataT"></param>
        /// <param name="slen"></param>
        public static void transform(string[] sdata, ref string[] sdataT, int slen)
        {
            int j = 0;
            for (int i = 0; i < slen; i++)
            {
                if (0 == i || slen - 1 == i) //帧头和帧尾数据不变
                {
                    sdataT[j++] = sdata[i];
                }
                else if ("FB" == sdata[i] || "FE" == sdata[i] || "FD" == sdata[i]) //数据转义
                {
                    sdataT[j++] = "FD";
                    sdataT[j++] = sdata[i] + "0F";
                    //sdataT[j++] = 0xFD;
                    //sdataT[j++] = (sdata[i] & 0x0F);

                }
                else
                {
                    sdataT[j++] = sdata[i];
                }
            }
        }
        /// <summary>
        /// 数据接收转换，数据中报头报尾字符转
        /// </summary>
        /// <param name="sdata"></param>
        /// <param name="sdataT"></param>
        /// <param name="slen"></param>
        public static string[] transformReverse(string[] rdata, ref string[] rdataT, int rlen)
        {
            //逆转义结果数据缓存
            int j = 0;
            for (int i = 0; i < rlen; i++)
            {
                if ("FD" == rdata[i]) //数据逆转义
                {   
                    if (rdata [i+1]!="")   
                        {
                            //var u = Convert.ToUInt16("0xF0") | (Convert.ToUInt16("0x0F") + Convert.ToUInt16(rdata[i + 1]));
                            //string str=byteToHexStr()
                            //rdataT[j++] = u.ToString();
                            //rdataT[j++] = (0xF0 | (0x0F & rdata[i + 1]));
                            i++;
                         }
                }
                else
                {
                    rdataT[j++] = rdata[i];
                }

            }
            return rdataT;
        }
    }
}
