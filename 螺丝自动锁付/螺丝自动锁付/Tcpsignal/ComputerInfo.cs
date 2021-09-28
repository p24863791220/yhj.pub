using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.VisualBasic.Devices;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using System.Collections;
using System.ComponentModel;
using System.Management;
using System.Net.Sockets;
using System.Runtime.InteropServices;

namespace SignalCommunication
{
   /// <summary>
   /// 获取硬件信息，网络状态，各种硬件的编号，生成机器码，应用程序运行路径等
   /// </summary>
   public static class ComputerInfo
    {
        /// <summary>
        /// 获取根目录
        /// </summary>
        /// <returns>根目录的路径</returns>
       public static string getContents()
        {
            string AppPath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
            if (AppPath.EndsWith("\\") || AppPath.EndsWith("/"))
            {
                AppPath = AppPath.Substring(0, AppPath.Length - 1) + "\\";
            }
            return AppPath;

        }
        /// <summary>
        /// 获取本机是否联系到网络
        /// </summary>
        /// <returns>是否连接到网络</returns>
       public static bool GetNetworkIsAvailable()
        {
            Computer computer = new Computer();
            return computer.Network.IsAvailable;
        }
        /// <summary>
        /// 获取主板序列号
        /// </summary>
        /// <returns>得到的结果</returns>
       public static string GetMotherBoardSerialNumber()
        {
            ManagementClass mc = new ManagementClass("WIN32_BaseBoard");
            ManagementObjectCollection moc = mc.GetInstances();
            string SerialNumber = "";
            foreach (ManagementObject mo in moc)
            {
                SerialNumber = mo["SerialNumber"].ToString();
                break;
            }
            return SerialNumber;
        }

        /// <summary>
        /// 获取本机的MAC地址
        /// </summary>
        /// <returns>返回MAC地址</returns>
       public static string GetMAC()
        {
            string mac = "";
            //利用DNS组件的GetHostName函数读取机器名   

            //利用ManagementClass类取得MAC地址   
            ManagementClass mc;
            mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc = mc.GetInstances();
            foreach (ManagementObject mo in moc)
            {
                if (mo["IPEnabled"].ToString() == "True")
                    mac = mo["MacAddress"].ToString();
            }
            return mac;
        }
       /// <summary>
       /// 获取IP地址,不包含127.0.0.1
       /// </summary>
       /// <returns></returns>
       public static string GetAddressIP()
       {
           ///获取本地的IP地址
           string AddressIP = string.Empty;
           foreach (IPAddress _IPAddress in Dns.GetHostEntry(Dns.GetHostName()).AddressList)
           {
               if (_IPAddress.AddressFamily.ToString() == "InterNetwork")
               {
                   //if (_IPAddress.ToString() != "" && _IPAddress.ToString() != "0" && _IPAddress.ToString() != "127.0.0.1")
                   if (_IPAddress.ToString() != "" && _IPAddress.ToString() != "0" && _IPAddress.ToString() != "127.0.0.1")
                   {
                       AddressIP = _IPAddress.ToString();
                       break;
                   }
               }
           }
           return AddressIP;
       }
        /// <summary>
        ///根据访问网站获取IP 获取本机的ＩＰ地址
        /// </summary>
        /// <returns>返回本机的ＩＰ地址</returns>
       public static string GetIP()
        {
            string strHostName = Dns.GetHostName();
            //IPAddress strAddress = Dns.Resolve(strHostName).AddressList[0];
            //this.label1.Text = strAddress.ToString();
            string strUrl = "http://www.ip138.com/ip2city.asp"; //获得IP的网址了
            Uri uri = new Uri(strUrl);
            System.Net.WebRequest wr = System.Net.WebRequest.Create(uri);
            System.IO.Stream s = wr.GetResponse().GetResponseStream();
            System.IO.StreamReader sr = new System.IO.StreamReader(s, Encoding.Default);
            string all = sr.ReadToEnd(); //读取网站的数据
            int i = all.IndexOf("[") + 1;
            string tempip = all.Substring(i, 15);
            string ip = tempip.Replace("]", "").Replace(" ", "").Replace("<", "").Trim();//找出i
            return ip;

        }
        /// <summary>
        /// 获取机器的名称
        /// </summary>
        /// <returns>机器的名称</returns>
       public static string GetComputerName()
        {
            Computer computer = new Computer();
            return computer.Name;
        }
        /// <summary>
        /// 播放声音文件
        /// </summary>
        /// <param name="strpath">播放的声音文件位置相对于应用程序的根目录位置</param>
       public static void playsound(string strpath)
        {
            Audio myAudio = new Audio();
            myAudio.Play(getContents() + strpath);
        }
        public static string GetHostName()
        {
            return System.Net.Dns.GetHostName();
        }
        /// <summary>
        /// 获取本机的机器码
        /// </summary>
        /// <returns>得到后的机器码</returns>
        
        public static string GetComputerNO()
        {
            return GetCpuID() + "-" + GetMAC() + "-" + GetCpuID() + "-" + GetMotherBoardSerialNumber().Trim();
        }
        /// <summary>
        /// 取CPU编号 
        /// </summary>
        /// <returns></returns>
        public static String GetCpuID()
        {
            try
            {
                ManagementClass mc = new ManagementClass("Win32_Processor");
                ManagementObjectCollection moc = mc.GetInstances();

                String strCpuID = null;
                foreach (ManagementObject mo in moc)
                {
                    strCpuID = mo.Properties["ProcessorId"].Value.ToString();
                    break;
                }
                return strCpuID;
            }
            catch
            {
                return "";
            }

        }//end method 

        /// <summary>
        /// 取第一块硬盘编号
        /// </summary>
        /// <returns></returns>
        public static String GetHardDiskID()
        {
            try
            {
                ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT * FROM Win32_PhysicalMedia");
                String strHardDiskID = null;
                foreach (ManagementObject mo in searcher.Get())
                {
                    strHardDiskID = mo["SerialNumber"].ToString().Trim();
                    break;
                }
                return strHardDiskID;
            }
            catch
            {
                return "";
            }
        }//end 

        public  enum NCBCONST
        {
            NCBNAMSZ = 16, /**//* absolute length of a net name */
            MAX_LANA = 254, /**//* lana's in range 0 to MAX_LANA inclusive */
            NCBENUM = 0x37, /**//* NCB ENUMERATE LANA NUMBERS */
            NRC_GOODRET = 0x00, /**//* good return */
            NCBRESET = 0x32, /**//* NCB RESET */
            NCBASTAT = 0x33, /**//* NCB ADAPTER STATUS */
            NUM_NAMEBUF = 30, /**//* Number of NAME's BUFFER */
        }

        [StructLayout(LayoutKind.Sequential)]
        public  struct ADAPTER_STATUS
        {
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 6)]
            public byte[] adapter_address;
            public byte rev_major;
            public byte reserved0;
            public byte adapter_type;
            public byte rev_minor;
            public ushort duration;
            public ushort frmr_recv;
            public ushort frmr_xmit;
            public ushort iframe_recv_err;
            public ushort xmit_aborts;
            public uint xmit_success;
            public uint recv_success;
            public ushort iframe_xmit_err;
            public ushort recv_buff_unavail;
            public ushort t1_timeouts;
            public ushort ti_timeouts;
            public uint reserved1;
            public ushort free_ncbs;
            public ushort max_cfg_ncbs;
            public ushort max_ncbs;
            public ushort xmit_buf_unavail;
            public ushort max_dgram_size;
            public ushort pending_sess;
            public ushort max_cfg_sess;
            public ushort max_sess;
            public ushort max_sess_pkt_size;
            public ushort name_count;
        }

        [StructLayout(LayoutKind.Sequential)]
        public  struct NAME_BUFFER
        {
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = (int)NCBCONST.NCBNAMSZ)]
            public byte[] name;
            public byte name_num;
            public byte name_flags;
        }

        [StructLayout(LayoutKind.Sequential)]
        public  struct NCB
        {
            public byte ncb_command;
            public byte ncb_retcode;
            public byte ncb_lsn;
            public byte ncb_num;
            public IntPtr ncb_buffer;
            public ushort ncb_length;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = (int)NCBCONST.NCBNAMSZ)]
            public byte[] ncb_callname;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = (int)NCBCONST.NCBNAMSZ)]
            public byte[] ncb_name;
            public byte ncb_rto;
            public byte ncb_sto;
            public IntPtr ncb_post;
            public byte ncb_lana_num;
            public byte ncb_cmd_cplt;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 10)]
            public byte[] ncb_reserve;
            public IntPtr ncb_event;
        }

        [StructLayout(LayoutKind.Sequential)]
        public  struct LANA_ENUM
        {
            public byte length;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = (int)NCBCONST.MAX_LANA)]
            public byte[] lana;
        }

        [StructLayout(LayoutKind.Auto)]
        public  struct ASTAT
        {
            public ADAPTER_STATUS adapt;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = (int)NCBCONST.NUM_NAMEBUF)]
            public NAME_BUFFER[] NameBuff;
        }
        public  class Win32API
        {
            [DllImport("NETAPI32.DLL")]
            public static extern char Netbios(ref NCB ncb);
        }

        /// <summary>
        /// 取网卡mac
        /// </summary>
        /// <returns></returns>
        public static  string GetMacAddress()
        {
            string addr = "";
            try
            {
                int cb;
                ASTAT adapter;
                NCB Ncb = new NCB();
                char uRetCode;
                LANA_ENUM lenum;

                Ncb.ncb_command = (byte)NCBCONST.NCBENUM;
                cb = Marshal.SizeOf(typeof(LANA_ENUM));
                Ncb.ncb_buffer = Marshal.AllocHGlobal(cb);
                Ncb.ncb_length = (ushort)cb;
                uRetCode = Win32API.Netbios(ref Ncb);
                lenum = (LANA_ENUM)Marshal.PtrToStructure(Ncb.ncb_buffer, typeof(LANA_ENUM));
                Marshal.FreeHGlobal(Ncb.ncb_buffer);
                if (uRetCode != (short)NCBCONST.NRC_GOODRET)
                    return "";

                for (int i = 0; i < lenum.length; i++)
                {
                    Ncb.ncb_command = (byte)NCBCONST.NCBRESET;
                    Ncb.ncb_lana_num = lenum.lana[i];
                    uRetCode = Win32API.Netbios(ref Ncb);
                    if (uRetCode != (short)NCBCONST.NRC_GOODRET)
                        return "";

                    Ncb.ncb_command = (byte)NCBCONST.NCBASTAT;
                    Ncb.ncb_lana_num = lenum.lana[i];
                    Ncb.ncb_callname[0] = (byte)'*';
                    cb = Marshal.SizeOf(typeof(ADAPTER_STATUS)) + Marshal.SizeOf(typeof(NAME_BUFFER)) * (int)NCBCONST.NUM_NAMEBUF;
                    Ncb.ncb_buffer = Marshal.AllocHGlobal(cb);
                    Ncb.ncb_length = (ushort)cb;
                    uRetCode = Win32API.Netbios(ref Ncb);
                    adapter.adapt = (ADAPTER_STATUS)Marshal.PtrToStructure(Ncb.ncb_buffer, typeof(ADAPTER_STATUS));
                    Marshal.FreeHGlobal(Ncb.ncb_buffer);

                    if (uRetCode == (short)NCBCONST.NRC_GOODRET)
                    {
                        if (i > 0)
                            addr += ":";
                        addr = string.Format("{0,2:X}{1,2:X}{2,2:X}{3,2:X}{4,2:X}{5,2:X}",
                        adapter.adapt.adapter_address[0],
                        adapter.adapt.adapter_address[1],
                        adapter.adapt.adapter_address[2],
                        adapter.adapt.adapter_address[3],
                        adapter.adapt.adapter_address[4],
                        adapter.adapt.adapter_address[5]);
                    }
                }
            }
            catch
            {
            }
            return addr.Replace(' ', '0');
        }
    }
}
