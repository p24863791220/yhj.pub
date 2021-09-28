using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

namespace 无人值守.Moders
{
    #region 和校验、异或校验、转义、逆转义、数据打包、数据解包[FB...FE]
    public class dataTransform
    {
        public static ushort PROTOCOL_410 = 0x8001;
        public static EquipmentData ed=new EquipmentData ();
        /// <summary>
        /// 解析无线电侦测上报的数据
        /// </summary>
        /// <param name="data1">数据缓存</param>
        /// <param name="len">数据有效长度</param>
        /// <param name="equipment">设备编号</param>
        public static bool ParseData(byte[] data1, int length )
        {
            ed.comandtype = 2;//设2为非探测数据标志
            if (data1[0] != 0xFB || data1[length - 1] != 0xFE)
                return false;
            //逆转义数据体
            int len = 0;
            byte[] data = DisTranslate(data1, length, out len);
            //检查校验码
            if (SumCheck(data, len) != data[len - 3] || XorCheck(data, len) != data[len - 2])
            {
                Debug.WriteLine("ParseData410 sumCheck or xorCheck fail!");
                return false;
            }
            //检查协议类型是否正确
            ushort protocol = (ushort)(data[1] | data[2] << 8);
            if (PROTOCOL_410 != protocol)//0x8001
            {
                Debug.WriteLine("ParseData410 protocol check fail!");
                return false;
            }
            int command = data[3] | data[4] << 8;
                    ////提出所有数据存储分析
                    //DirectoryInfo di = new DirectoryInfo(string.Format(@"{0}..\", Application.StartupPath));
                    //DateTime dt = DateTime.Now;
                    //string filepathstr = di.FullName + "分析原始数据.txt";
                    //FileStream fs = new FileStream(filepathstr, FileMode.OpenOrCreate);
                    //StreamWriter sw = new StreamWriter(fs);
                    //double[] getdata = new Double[len];
                    //for (int i = 5; i < len - 1; i++)
                    //{
                    //    getdata[i] = BitConverter.ToDouble(data, i);

                    //    sw.Write(getdata[i].ToString() + "\n");
                    //}
                    ////清空缓冲区
                    //sw.Flush();
                    ////关闭流
                    //sw.Close();
                    //fs.Close();
            if (0x0000 == command)//设备状态
            {
                ed.comandtype = 0;
                //解析数据
                ed.sid = BitConverter.ToInt16(data, 29).ToString();//id
                ed.lon = BitConverter.ToDouble(data, 5).ToString();//经度
                ed.weidu = BitConverter.ToDouble(data, 13).ToString();//纬度
                ed.hgt = BitConverter.ToDouble(data, 21).ToString();//海拨高度
                ed.yxzt = BitConverter.ToDouble(data, 22).ToString();
                if (ed.yxzt.Substring(0, 2).IndexOf("1.8") > 0 || ed.yxzt.IndexOf("307") > 0 || ed.yxzt.Substring(0, 2).IndexOf("1.9") > 0 || ed.yxzt.Substring(0, 2).IndexOf("2.0") > 0)
                    ed.yxzt = "1";
                else
                {
                    if (ed.yxzt.Substring(0, 3).IndexOf(".2") > 0)
                        ed.yxzt = "0";
                    else
                        ed.yxzt = "1";
                }
            }
            else if (0x0010 == command)//无线电目标
            {
                ed.comandtype = 1;
                //解析数据
                ed.weidu = BitConverter.ToDouble(data, 5).ToString ();//纬度
                ed.lon = BitConverter.ToDouble(data, 13).ToString();//经度
                ed.hgt = BitConverter.ToDouble(data, 21).ToString();//海拨高度
                ed.sid  =BitConverter.ToInt16 (data, 29).ToString();//id
                ed.fw = BitConverter.ToDouble(data, 33).ToString();//方位
                ed.distance = BitConverter.ToDouble(data, 49).ToString();//距离
                ed.pinglu = BitConverter.ToDouble(data, 81).ToString();//频率
                ed.daikuan = BitConverter.ToDouble(data, 89).ToString();//带宽
            }
            return true;
        }

        public class EquipmentData
        {
            public byte comandtype;//命令形式 0状态，1，发现目票，2，不要的数据
            public DateTime LastTime;//收到时间
            public string yxzt;//运行状态
            public string  lon;////经度
            public string weidu ;//纬度
            public string hgt;//海拨高度
            public string fw;////方位
            public string distance ;//距离
            public string pinglu ;//频率
            public string daikuan ;//带宽
            public string sid;//编号

        }

        /// <summary>
        /// 和校验
        /// </summary>
        /// <param name="cmd">需要计算校验值的数据</param>
        /// <param name="len">数据有效长度（按字节算）</param>
        /// <returns>返回校验值计算结果（截位8）</returns>
        public static byte SumCheck(byte[] cmd, int len)
        {
            byte ret = 0;
            for (int i = 1; i < len - 3; i++)
                ret += cmd[i];

            return ret;
        }

        /// <summary>
        /// 异或校验
        /// </summary>
        /// <param name="cmd">需要计算校验值的数据</param>
        /// <param name="len">数据有效长度（按字节算）</param>
        /// <returns>返回校验值计算结果（截位8）</returns>
        public static byte XorCheck(byte[] cmd, int len)
        {
            byte ret = 0;
            for (int i = 1; i < len - 3; i++)
                ret ^= cmd[i];
            return ret;
        }

        /// <summary>
        /// 转义
        /// </summary>
        /// <param name="cmd">需要转义的命令数据</param>
        /// <param name="len">命令数据有效长度</param>
        /// <param name="tlen">返回转义后命令数据的有效长度</param>
        /// <returns>返回转义后命令数据</returns>
        public static byte[] Translate(byte[] cmd, int len, out int tlen)
        {
            byte[] tcmd = new byte[len * 2];
            int nLen = 0;
            for (int i = 0; i < len; i++)
            {
                if (0 == i || len - 1 == i)
                {
                    tcmd[nLen] = cmd[i];
                    nLen++;
                }
                else if (0xFB == cmd[i] || 0xFE == cmd[i] || 0xFD == cmd[i])
                {
                    tcmd[nLen] = 0xFD;
                    nLen++;
                    tcmd[nLen] = (byte)(cmd[i] & 0x0F);
                    nLen++;
                }
                else
                {
                    tcmd[nLen] = cmd[i];
                    nLen++;
                }
            }
            tlen = nLen;
            return tcmd;
        }

        /// <summary>
        /// 逆转义
        /// </summary>
        /// <param name="cmd">需要转义的命令数据</param>
        /// <param name="len">命令数据有效长度</param>
        /// <param name="tlen">返回逆转义后命令数据的有效长度</param>
        /// <returns>返回转义后命令数据</returns>
        public static byte[] DisTranslate(byte[] cmd, int len, out int tlen)
        {
            byte[] tcmd = new byte[len * 2];
            int nLen = 0;
            for (int i = 0; i < len; i++)
            {
                if (0 == i || len - 1 == i)
                {
                    tcmd[nLen] = cmd[i];
                    nLen++;
                }
                else if (0xFD ==cmd[i])//0xfd 251
                {
                    i++;
                    byte dat = (byte)(cmd[i] & 0x0F);
                    tcmd[nLen] = (byte)(0xF0 | dat);
                    nLen++;
                }
                else
                {
                    tcmd[nLen] = cmd[i];
                    nLen++;
                }
            }       
            tlen = nLen;
            return tcmd;
        }
    }
    #endregion
}

