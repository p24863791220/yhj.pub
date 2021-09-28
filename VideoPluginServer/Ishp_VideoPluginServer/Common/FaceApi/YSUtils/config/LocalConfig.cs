using System;
using System.Collections.Generic;
using System.Text;
using IMOS_SDK_DEMO.sdk;

namespace IMOS_SDK_DEMO
{
    /// <summary>
    /// 本地配置文件
    /// </summary>
    class LocalConfig
    {
        //码流输出地址
        public static string codeOutputLoc = ".\\output\\";
        //回放下载地址
        public static string vodDownloadLoc = ".\\Download\\";
        //截图保存地址
        public static string picSnatchLoc = ".\\Snatch\\";
        //抓拍格式,0为BMP格式，1为JPG格式
        public static uint picFormat = 0;
        //录像回放传输协议
        public static XP_PROTOCOL_E vodProtocol = XP_PROTOCOL_E.XP_PROTOCOL_TCP;
        //录像下载速度
        public static XP_DOWN_MEDIA_SPEED_E downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_FOUR;
        //录像下载格式,0为TS,1为FLV
        public static uint downloadFormat = 0;
        //场模式，单场为0,双场为1
        public static int fieldMode = 0;
        //启动UDP乱序整理模式
        public static Boolean pktSeq = false;
        //渲染模式,0为D3D，1为DDRAW
        public static uint renderMode = 0;
        //实时性还是流畅性优先,0为实时性优先，1为流畅性优先
        public static uint fluency = 0;
        //视频输出格式，0为YUV,1为RGB32
        public static uint pixelFormat = 0;
        //xp流配置
        public static XP_STREAM_INFO_S streamInfo;
    }
}
