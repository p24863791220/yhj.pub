using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 封装公共使用的业务接口
    /// </summary>
    public class CommonFunc
    {
        
        /// <summary>
        /// 用户登陆
        /// </summary>
        /// <param name="strUserName">用户名</param>
        /// <param name="strPWD">密码</param>
        /// <param name="strServerIp">服务器IP</param>
        /// <param name="strClientIp">客户端IP</param>
        /// <param name="logInfo">返回登陆信息</param>
        /// <returns>0表示正常登陆成功，其他值参考错误码表</returns>
        public static UInt32 Login(string strUserName, string strPWD, string strServerIp, string strClientIp,ref LOGIN_INFO_S logInfo)
        {
            UInt32 ulRet = 0;
            UInt32 srvPort = 8800;
            //1.初始化
            ulRet = IMOSSDK.IMOS_Initiate("N/A", srvPort, 1, 1);
            if (0 != ulRet)
            {
                return ulRet;
            }

            //2.加密密码
            IntPtr ptr_MD_Pwd = Marshal.AllocHGlobal(sizeof(char) * IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN);
            ulRet = IMOSSDK.IMOS_Encrypt(strPWD, (UInt32)strPWD.Length, ptr_MD_Pwd);

            if (0 != ulRet)
            {
                return ulRet;
            }

            String MD_PWD = Marshal.PtrToStringAnsi(ptr_MD_Pwd);
            Marshal.FreeHGlobal(ptr_MD_Pwd);

            //3.登录方法
            IntPtr ptrLoginInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(LOGIN_INFO_S)));
            ulRet = IMOSSDK.IMOS_LoginEx(strUserName, MD_PWD, strServerIp, strClientIp, ptrLoginInfo);
            if (0 != ulRet)
            {
                return ulRet;
            }

            logInfo = (LOGIN_INFO_S)Marshal.PtrToStructure(ptrLoginInfo, typeof(LOGIN_INFO_S));
            Marshal.FreeHGlobal(ptrLoginInfo);
            return ulRet;
        }


        /// <summary>
        /// 获取空闲通道
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="strChannelCode">空闲通道</param>
        /// <returns>0表示正常登陆成功，其他值参考错误码表</returns>
        public static UInt32 GetChannelCode(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo,ref string strChannelCode)
        {
            IntPtr channelCode = new IntPtr();
            channelCode = Marshal.AllocHGlobal(25 * Marshal.SizeOf(typeof(PLAY_WND_INFO_S)));
            UInt32 ulRet = IMOSSDK.IMOS_GetChannelCode(ref stUserLoginIDInfo, channelCode);
            if (0 != ulRet)
            {
                Marshal.FreeHGlobal(channelCode);
                return ulRet;
            }
            //将通道号和选中窗格绑定
            // 若调试发现 channelCode为乱码，则在之前没有调用 IMOS_StartPlayer接口
            strChannelCode = Marshal.PtrToStringAnsi(channelCode);
            Marshal.FreeHGlobal(channelCode);
            return ulRet;
        }

        /// <summary>
        /// 启动播放器
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="ulFrameNum">播放窗格数量</param>
        /// <param name="ptrPlayWndInfo">播放窗格句柄</param>
        /// <returns>启动成功返回0</returns>
        public static uint StartPlayer(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,uint ulFrameNum,IntPtr ptrPlayWndInfo)
        {
            return IMOSSDK.IMOS_StartPlayer(ref stUserLoginIDInfo,ulFrameNum,ptrPlayWndInfo);
        }


        /// <summary>
        /// 停止播放器
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <returns>成功返回0</returns>
        public static uint StopPlayer(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo)
        {
            return IMOSSDK.IMOS_StopPlayer(ref stUserLoginIDInfo);
        }

        /// <summary>
        /// 注销用户
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        public static void LoginOut(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo)
        {
            IMOSSDK.IMOS_LogoutEx(ref stUserLoginIDInfo);
        }

        /// <summary>
        /// 清空资源
        /// </summary>
        /// <param name="stUserLoginIDInfo">当前登陆用户信息</param>
        /// <returns>成功返回0</returns>
        public static uint CleanUp(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo)
        {
            return IMOSSDK.IMOS_CleanUp(ref stUserLoginIDInfo);
        }

        /// <summary>
        /// 情况资源 传入null表示清空所有资源
        /// </summary>
        /// <param name="strUserInfo">用户登陆信息</param>
        /// <returns>成功返回0</returns>
        public static uint CleanUp(string strUserInfo)
        {
            return IMOSSDK.IMOS_CleanUp(strUserInfo);
        }

        /// <summary>
        /// 单次抓拍
        /// </summary>
        /// <param name="stUserLoginIDInfo">登录信息</param>
        /// <param name="bytChannelCode">通道编码</param>
        /// <param name="bytFileName">文件名称</param>
        /// <param name="ulFormat">文件格式</param>
        /// <returns>正常抓拍返回0</returns>
        public static UInt32 SnatchOnce(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,byte[] bytChannelCode,byte[] bytFileName,UInt32 ulFormat)
        {
            return IMOSSDK.IMOS_SnatchOnce(ref stUserLoginIDInfo,bytChannelCode,bytFileName,ulFormat);
        }

       
        /// <summary>
        /// 获取帧率
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <param name="ulFrameRate">帧率</param>
        /// <returns>成功返回0</returns>
        public static UInt32 GetFrameRate(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode,ref uint ulFrameRate)
        {
            return IMOSSDK.IMOS_GetFrameRate(ref stUserLoginIDInfo, bytChannelCode, ref ulFrameRate);
        }

        /// <summary>
        /// 获取码率
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="bytChannelCode">通道编码</param>
        /// <param name="ulBitRate">码率</param>
        /// <returns>成功返回0</returns>
        public static UInt32 GetBitRate(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode, ref uint ulBitRate)
        {
            return IMOSSDK.IMOS_GetBitRate(ref stUserLoginIDInfo, bytChannelCode, ref ulBitRate);
        }


        /// <summary>
        /// 获取编码类型
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="bytChannelCode">通道编码</param>
        /// <param name="ulEncodeType">编码类型</param>
        /// <returns>成功返回0</returns>
        public static UInt32 GetEncodeType(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode, ref uint ulEncodeType)
        {
            return IMOSSDK.IMOS_GetVideoEncodeType(ref stUserLoginIDInfo, bytChannelCode, ref ulEncodeType);
        }

        /// <summary>
        /// 播放声音
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="bytChannelCode">通道编码</param>
        public static UInt32 PlaySound(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_PlaySound(ref stUserLoginIDInfo, bytChannelCode);
        }


        /// <summary>
        /// 停止播放声音
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登陆信息</param>
        /// <param name="bytChannelCode">通道编码</param>
        /// <returns>成功返回0</returns>
        public static UInt32 StopSound(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_StopSound(ref stUserLoginIDInfo, bytChannelCode);
        }
        
    }
}
