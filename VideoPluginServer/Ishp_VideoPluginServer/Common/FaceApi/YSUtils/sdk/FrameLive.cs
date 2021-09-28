using System;
using System.Collections.Generic;
using System.Text;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 实时播放视频
    /// </summary>
    public class FrameLive
    {

        /// <summary>
        /// 启动实况
        /// </summary>
        /// <param name="stUserLoginIDInfo"></param>
        /// <param name="bytCameraCode"></param>
        /// <param name="channel"></param>
        /// <param name="ptrHwnd"></param>
        /// <returns></returns>
        public static UInt32 StartMonitor(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytCameraCode, byte[] channel, IntPtr ptrHwnd)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_SetPlayWnd(ref stUserLoginIDInfo, channel, ptrHwnd);
            if (ulRet != 0)
            { 
                return ulRet;
            }

            ulRet = IMOSSDK.IMOS_StartMonitor(ref stUserLoginIDInfo, bytCameraCode, channel, 1, 0);
            return ulRet;

        }

        public static UInt32 StopMonitor(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_StopMonitor(ref stUserLoginIDInfo, bytChannelCode, 0);
            if (ulRet != 0)
            {
                return ulRet;
            }

            IMOSSDK.IMOS_FreeChannelCode(ref stUserLoginIDInfo, bytChannelCode);
            return ulRet; 
        }
    }
}
