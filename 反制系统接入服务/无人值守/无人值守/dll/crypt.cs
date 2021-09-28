using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Security.Cryptography;
using System.IO;
using System.Management;
using System.Net;
using System.Runtime.InteropServices;

namespace Crypptsy{
    
    [Serializable]
    public class GetHostInfor
    {
        public struct drvinfo
        {
            public string name;
            public string panfu;
        }
         public drvinfo[] drv1=new drvinfo[20];
         public IPAddress ipdns;
         public string mac;
         public string biosnumber;
         public string hardnumber;
         public string videonumber;
         public  string soundnumber;
       public  GetHostInfor ()
        {
            string hostname = Dns.GetHostName();
          IPAddress []  macdnsa= Dns.GetHostAddresses(hostname);
           ipdns = macdnsa[0];
            DriveInfo[] drvinfo = DriveInfo.GetDrives() ;
            int i = 0;
            try
            {
                foreach (DriveInfo drv in drvinfo)
                {
                    if (drv.Name != null) drv1[i].name = drv.Name;
                    if (drv.VolumeLabel != null) drv1[i].panfu = drv.VolumeLabel;
                    i++;
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
    public class EncodeDecode
    {
        ///<summary>使用给定密匙加密</summary>
        /// < param name="original">原始文字</param>
        /// < param name="key">密匙</param>
        public static string Encrypt(string original, string key)
        {
            byte[] buff = System.Text.Encoding.UTF8.GetBytes(original);
            byte[] kb = System.Text.Encoding.UTF8.GetBytes(key);
            return Convert.ToBase64String(Encrypt(buff, kb));
        }
        public static String Decrypt(string encrypted, string key)
        {
            byte[] buff = Convert.FromBase64String(encrypted);
            byte[] kb = System.Text.Encoding.UTF8.GetBytes(key);
            return Encoding.UTF8.GetString(Decrypt(buff, kb));
        }
        public static byte[] MakeMD5(byte[] original)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            byte[] keyhash = hashmd5.ComputeHash(original);
            hashmd5 = null;
            return keyhash;
        }
        public static byte[] Encrypt(byte[] original, byte[] key)
        {
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = MakeMD5(key);
            des.Mode = CipherMode.ECB;
            return des.CreateEncryptor().TransformFinalBlock(original, 0, original.Length);
        }
        public static byte[] Decrypt(byte[] encrypted, byte[] key)
        {
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = MakeMD5(key);
            des.Mode = CipherMode.ECB;
            return des.CreateDecryptor().TransformFinalBlock(encrypted, 0, encrypted.Length);
        }
        private static byte[] keys = { 0x17, 0x34, 0x59, 0x78, 0x90, 0xAB, 0xCD, 0x17 };
        public static string SymmetryEncrypt(string encryptString, string encryptKey)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(encryptKey.Substring(0, 8));
                byte[] rgbIV = keys;
                byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
                DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cSteam = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                cSteam.Write(inputByteArray, 0, inputByteArray.Length);
                cSteam.FlushFinalBlock();
                return Convert.ToBase64String(mStream.ToArray());
            }
            catch
            {
                return encryptString;
            }
        }
        public static string SymmetryDecrypt(string decryptString, string decryptKey)
        {
            try
            {
                byte[] rgbKey = Encoding.UTF8.GetBytes(decryptKey);
                byte[] rgbIV = keys;
                byte[] inputByteArray = Convert.FromBase64String(decryptString);
                DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Encoding.UTF8.GetString(mStream.ToArray());
            }
            catch
            {
                return decryptString;
            }
        }
    }
}
