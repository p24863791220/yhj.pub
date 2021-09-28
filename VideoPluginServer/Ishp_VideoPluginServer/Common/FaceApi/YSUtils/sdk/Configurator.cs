using System;
using System.Collections.Generic;
using System.Text;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 配置文件临时类
    /// </summary>
    public class Config
    { 
        //抓拍格式,0为BMP格式，1为JPG格式
        public uint picFormat = 0;
        //录像回放传输协议
        public XP_PROTOCOL_E vodProtocol = XP_PROTOCOL_E.XP_PROTOCOL_TCP;
        //录像下载速度
        public XP_DOWN_MEDIA_SPEED_E downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_FOUR;
        //录像下载格式,0为TS,1为FLV
        public uint downloadFormat = 0;
        //场模式，单场为0,双场为1
        public int fieldMode = 0;
        //启动UDP乱序整理模式
        public Boolean pktSeq = false;
        //渲染模式,0为D3D，1为DDRAW
        public uint renderMode = 0;
        //实时性还是流畅性优先,0为实时性优先，1为流畅性优先
        public uint fluency = 0;
        //视频输出格式，0为YUV,1为RGB32
        public uint pixelFormat = 0;
        //xp流配置
        public XP_STREAM_INFO_S streamInfo;
    }

    /// <summary>
    /// 配置器
    /// </summary>
    public class Configurator
    {
        /// <summary>
        /// 设置本地配置
        /// </summary>
        /// <param name="stUserLoginIDInfo">当前登录对象</param>
        /// <param name="config">配置对象</param>
        /// <returns>正常返回0 </returns>
        public static int SetLocalConfig(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,  Config config)
        {
            if (config == null)
            {
                return -1;
            }

            UInt32 ulRet = 0;
            /**改变配置**/
            //开启关闭乱序整理
            ulRet = IMOSSDK.IMOS_AdjustPktSeq(config.pktSeq); 

            //渲染模式调整
            ulRet = IMOSSDK.IMOS_SetRenderMode(config.renderMode);

            //实时性还是流畅性优先调整
            ulRet = IMOSSDK.IMOS_SetRealtimeFluency(config.fluency);

            //视频输出格式改变
            ulRet = IMOSSDK.IMOS_SetPixelFormat(config.pixelFormat);

            //xp流设置 
            ulRet = IMOSSDK.IMOS_ConfigXpStreamInfo(ref stUserLoginIDInfo, ref config.streamInfo);

            return (int)ulRet;
        }


        public static UInt32 SetFieldMode(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,byte[] bytChannelCode,uint ulFileMode)
        {
            //场模式设置
            return IMOSSDK.IMOS_SetFieldMode(ref stUserLoginIDInfo, bytChannelCode, ulFileMode);
        }
    }
}
