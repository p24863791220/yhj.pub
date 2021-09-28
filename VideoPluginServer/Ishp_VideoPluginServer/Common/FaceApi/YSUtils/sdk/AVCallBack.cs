using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 音视频码流回调
    /// </summary>
    public class AVCallBack
    {

        /// <summary>
        /// 订阅推送，回调注册。
        /// </summary>
        /// <param name="stLoginInfo">用户登陆信息</param>
        /// <returns>执行成功返回0</returns>
        public static uint RegCallBackFunc(ref USER_LOGIN_ID_INFO_S stLoginInfo, IntPtr ptrCB)
        {
            uint ulResult = 0;
            //先订阅推送
            ulResult = IMOSSDK.IMOS_SubscribePushInfo(ref stLoginInfo, (uint)SUBSCRIBE_PUSH_TYPE_E.SUBSCRIBE_PUSH_TYPE_ALL);
            if (0 != ulResult)
            { 
                return ulResult;
            }
           
            //注册回调
            ulResult = IMOSSDK.IMOS_RegCallBackPrcFunc(ref stLoginInfo, ptrCB);
            if (0 != ulResult)
            { 
                return ulResult;
            }
            return ulResult;
        }

        /// <summary>
        /// 设置XP运行回调
        /// </summary>
        /// <param name="ptrCallBC">回调函数指针</param>
        /// <returns>成功返回0</returns>
        public static uint SetRunMsgCB(IntPtr ptrCallBC)
        {
            return IMOSSDK.IMOS_SetRunMsgCB(ptrCallBC);
        }

        /// <summary>
        /// 设置原始码流回调函数
        /// </summary>
        /// <param name="pstUserLoginIDInfo">登陆信息</param>
        /// <param name="pcChannelCode">通道编码</param>
        /// <param name="ptrSplitInfo">拼帧前媒体流数据回调函数的指针</param>
        /// <param name="bContinue">是否继续进行后面的拼帧、解码和显示操作</param>
        /// <param name="lUserParam">用户自定义参数传入</param>
        /// <returns>0表示设置成功</returns>
        public static UInt32 SetSourceMediaDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam)
        {
            return IMOSSDK.IMOS_SetSourceMediaDataCB(ref pstUserLoginIDInfo, pcChannelCode, ptrSplitInfo, bContinue, lUserParam);
        }


        /// <summary>
        /// 设置拼帧后视频码流回调
        /// </summary>
        /// <param name="pstUserLoginIDInfo">登陆信息</param>
        /// <param name="pcChannelCode">通道编码</param>
        /// <param name="ptrSplitInfo">拼帧后媒体流数据回调函数的指针</param>
        /// <param name="bContinue">是否继续进行后面的拼帧、解码和显示操作</param>
        /// <param name="lUserParam">用户自定义参数传入</param>
        /// <returns>0表示设置成功</returns>
        public static UInt32 SetParseVideoDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam)
        {
            return IMOSSDK.IMOS_SetParseVideoDataCB(ref pstUserLoginIDInfo, pcChannelCode, ptrSplitInfo, bContinue, lUserParam);
        }


        /// <summary>
        /// 设置拼帧后音频码流回调
        /// </summary>
        /// <param name="pstUserLoginIDInfo">登陆信息</param>
        /// <param name="pcChannelCode">通道编码</param>
        /// <param name="ptrSplitInfo">拼帧后媒体流数据回调函数的指针</param>
        /// <param name="bContinue">是否继续进行后面的拼帧、解码和显示操作</param>
        /// <param name="lUserParam">用户自定义参数传入</param>
        /// <returns>0表示设置成功</returns>
        public static UInt32 SetParseAudioDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam)
        {
            return IMOSSDK.IMOS_SetParseAudioDataCB(ref pstUserLoginIDInfo, pcChannelCode, ptrSplitInfo, bContinue, lUserParam);
        }


        /// <summary>
        /// 设置解码后视频码流回调
        /// </summary>
        /// <param name="pstUserLoginIDInfo">登陆信息</param>
        /// <param name="pcChannelCode">通道编码</param>
        /// <param name="ptrSplitInfo">解码后媒体流数据回调函数的指针</param>
        /// <param name="bContinue">是否继续进行后面的拼帧、解码和显示操作</param>
        /// <param name="lUserParam">用户自定义参数传入</param>
        /// <returns>0表示设置成功</returns>
        public static UInt32 SetDecodeVideoDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam)
        {
            return IMOSSDK.IMOS_SetDecodeVideoDataCB(ref pstUserLoginIDInfo, pcChannelCode, ptrSplitInfo, bContinue, lUserParam);
        }


        /// <summary>
        /// 设置解码后音频码流回调
        /// </summary>
        /// <param name="pstUserLoginIDInfo">登陆信息</param>
        /// <param name="pcChannelCode">通道编码</param>
        /// <param name="ptrSplitInfo">解码后媒体流数据回调函数的指针</param>
        /// <param name="bContinue">是否继续进行后面的拼帧、解码和显示操作</param>
        /// <param name="lUserParam">用户自定义参数传入</param>
        /// <returns>0表示设置成功</returns>
        public static UInt32 SetDecodeAudioDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam)
        {
            return IMOSSDK.IMOS_SetDecodeAudioDataCB(ref pstUserLoginIDInfo, pcChannelCode, ptrSplitInfo, bContinue, lUserParam);
        }
    }
}
