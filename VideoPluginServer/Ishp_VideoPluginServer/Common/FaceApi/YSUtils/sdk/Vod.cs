using System;
using System.Collections.Generic;
using System.Text;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 回放业务类， 回放业务封装
    /// </summary>
    public class Vod
    {

        /// <summary>
        /// 开始回放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="stURLInfo">文件URL信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <param name="ptrHwnd">绑定窗格句柄</param>
        /// <returns>正常返回0</returns>
        public static UInt32 StartVod(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, URL_INFO_S stURLInfo, byte[] bytChannelCode, IntPtr ptrHwnd)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_OpenVodStream(ref stUserLoginIDInfo, bytChannelCode, stURLInfo.szURL, stURLInfo.stVodSeverIP.szServerIp, stURLInfo.stVodSeverIP.usServerPort, 1);
            if (0 != ulRet)
            {
                return ulRet;
            }

            ulRet = IMOSSDK.IMOS_SetDecoderTag(ref stUserLoginIDInfo, bytChannelCode, stURLInfo.szDecoderTag);
            if (ulRet != 0)
            {
                return ulRet;
            }

            ulRet = IMOSSDK.IMOS_SetPlayWnd(ref stUserLoginIDInfo, bytChannelCode, ptrHwnd);
            if (ulRet != 0)
            {
                return ulRet;
            }
            ulRet = IMOSSDK.IMOS_StartPlay(ref stUserLoginIDInfo, bytChannelCode);
            return ulRet;
        }


        /// <summary>
        /// 停止回放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <returns>正常停止返回0</returns>
        public static UInt32 StopVod(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_StopPlay(ref stUserLoginIDInfo, bytChannelCode);

            IMOSSDK.IMOS_FreeChannelCode(ref stUserLoginIDInfo, bytChannelCode);
            return ulRet;
        }


        /// <summary>
        /// 暂停回放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <returns>正常停止返回0</returns>
        public static UInt32 PausePlay(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_PausePlay(ref stUserLoginIDInfo, bytChannelCode);
        }

        /// <summary>
        /// 恢复回放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <returns>正常停止返回0</returns>
        public static UInt32 ResumePlay(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_ResumePlay(ref stUserLoginIDInfo, bytChannelCode);
        }


        /// <summary>
        /// 设置倍速播放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <param name="ulSpeed">播放速度</param>
        /// <returns>正常返回值0</returns>
        public static UInt32 PlaySpeed(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode, uint ulSpeed)
        {
            return IMOSSDK.IMOS_SetPlaySpeed(ref stUserLoginIDInfo, bytChannelCode, ulSpeed);
        }


        /// <summary>
        /// 单帧播放
        /// </summary>
        /// <param name="stUserLoginIDInfo">用户登录信息</param>
        /// <param name="bytChannelCode">播放通道编码</param>
        /// <returns>正常播放返回0</returns>
        public static UInt32 PlayOneByOne(ref  USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_OneByOne(ref stUserLoginIDInfo, bytChannelCode);
        }

        /// <summary>
        /// 播放本地文件
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="bytChannelCode">播放通道</param>
        /// <param name="bytFileName">文件名称</param>
        /// <param name="ullFormat">文件类型</param>
        /// <returns>正常播放返回0</returns>
        public static UInt32 StartRecord(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode, byte[] bytFileName, uint ullFormat)
        {
            return IMOSSDK.IMOS_StartRecord(ref stUserLoginIDInfo, bytChannelCode, bytFileName, ullFormat);
        }

        /// <summary>
        /// 停止播放本地文件
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="bytChannelCode">播放通道</param>
        /// <returns>正常停止返回0</returns>
        public static UInt32 StopRecord(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytChannelCode)
        {
            return IMOSSDK.IMOS_StopRecord(ref stUserLoginIDInfo, bytChannelCode);
        }
    }
}
