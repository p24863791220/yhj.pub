using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 下载业务接口封装
    /// </summary>
    public class Download
    {
        /// <summary>
        /// 回放下载
        /// </summary>
        /// <param name="recFile">录像信息</param>
        /// <param name="camCode">摄像机编码</param>
        /// <param name="downloadLoc">用户下载存储位置</param>
        /// <returns></returns>
        public static byte[] StartDownLoad(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, RECORD_FILE_INFO_S fileInfo, byte[] camCode, XP_PROTOCOL_E vodProtocol, String downloadLoc, XP_DOWN_MEDIA_SPEED_E speed, uint downloadFormat, DateTime beginTime, DateTime endTime)
        {
            UInt32 ulRet = 0;

            try
            {
                GET_URL_INFO_S getUrlInfo = new GET_URL_INFO_S();
                TIME_SLICE_S timeSlice = new TIME_SLICE_S();
                URL_INFO_S urlInfo = new URL_INFO_S();

                byte[] begin = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strBeginTime = beginTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strBeginTime).CopyTo(begin, 0);
                byte[] end = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strEndTime = endTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strEndTime).CopyTo(end, 0);

                timeSlice.szBeginTime = begin;
                timeSlice.szEndTime = end;

                getUrlInfo.szCamCode = camCode;
                getUrlInfo.szFileName = fileInfo.szFileName;
                getUrlInfo.stRecTimeSlice = timeSlice;
                getUrlInfo.szClientIp = stUserLoginIDInfo.szUserIpAddress;

                //ptrSDKURLInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(URL_INFO_S)));
                //这个下载通道号，是录像下载的唯一标志，以后查询录像都要用到这个通道号
                byte[] byPcChannel = new byte[IMOSSDK.IMOS_RES_CODE_LEN];

                ulRet = IMOSSDK.IMOS_GetRecordFileURL(ref stUserLoginIDInfo, ref getUrlInfo, ref urlInfo);
 
                return DownloadFile(ref stUserLoginIDInfo, vodProtocol, downloadLoc, speed, downloadFormat, ref ulRet, ref urlInfo, byPcChannel);
            }
            catch (System.Exception ex)
            { 
                return null;
            }
        }

        /// <summary>
        /// 下载云存储录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="fileInfo">文件信息</param>
        /// <param name="camCode">相机编码</param>
        /// <param name="vodProtocol">传输协议</param>
        /// <param name="downloadLoc">本地路径</param>
        /// <param name="speed">下载速率</param>
        /// <param name="downloadFormat">下载格式</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <returns>成功返回非空值</returns>
        public static  byte[] CloudDownLoad(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, UNITED_REC_FILE_INFO_S fileInfo, byte[] camCode, XP_PROTOCOL_E vodProtocol, String downloadLoc, XP_DOWN_MEDIA_SPEED_E speed, uint downloadFormat, DateTime beginTime, DateTime endTime)
        {
            UInt32 ulRet = 0; 
            try
            {
                URL_INFO_S urlInfo = new URL_INFO_S();

                byte[] begin = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strBeginTime = beginTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strBeginTime).CopyTo(begin, 0);
                byte[] end = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strEndTime = endTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strEndTime).CopyTo(end, 0);

                //ptrSDKURLInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(URL_INFO_S)));
                //这个下载通道号，是录像下载的唯一标志，以后查询录像都要用到这个通道号
                byte[] byPcChannel = new byte[IMOSSDK.IMOS_RES_CODE_LEN]; 

                ulRet = QueryResource.QueryUnitedRecordURL(ref stUserLoginIDInfo, fileInfo, Encoding.Default.GetString(camCode).TrimEnd('\0'),
                    begin, end, ref urlInfo);
                if (0 != ulRet)
                {
                    return null;
                }
                return DownloadFile(ref stUserLoginIDInfo, vodProtocol, downloadLoc, speed, downloadFormat, ref ulRet, ref urlInfo, byPcChannel);
            }
            catch (System.Exception ex)
            { 
                return null;
            } 
        }


        /// <summary>
        /// 下载备用录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="fileInfo">文件信息</param>
        /// <param name="camCode">相机编码</param>
        /// <param name="vodProtocol">传输协议</param>
        /// <param name="downloadLoc">本地路径</param>
        /// <param name="speed">下载速率</param>
        /// <param name="downloadFormat">下载格式</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <returns>成功返回非空值</returns>
        public static  byte[] SlaveDownLoad(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,RECORD_FILE_INFO_S fileInfo, byte[] camCode, XP_PROTOCOL_E vodProtocol, String downloadLoc, XP_DOWN_MEDIA_SPEED_E speed, uint downloadFormat, DateTime beginTime, DateTime endTime)
        {
            UInt32 ulRet = 0; 
            try
            {
                URL_INFO_S urlInfo = new URL_INFO_S();

                byte[] begin = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strBeginTime = beginTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strBeginTime).CopyTo(begin, 0);
                byte[] end = new byte[IMOSSDK.IMOS_TIME_LEN];
                String strEndTime = endTime.ToString("yyyy-MM-dd HH:mm:ss");
                Encoding.UTF8.GetBytes(strEndTime).CopyTo(end, 0);
 
                //这个下载通道号，是录像下载的唯一标志，以后查询录像都要用到这个通道号
                byte[] byPcChannel = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
                
                ulRet = QueryResource.QueryRecordURL(ref stUserLoginIDInfo, fileInfo, Encoding.Default.GetString(camCode).TrimEnd('\0'),
                    begin, end, ref urlInfo);
                if (0 != ulRet)
                {
                    return null;
                }
                return DownloadFile(ref stUserLoginIDInfo, vodProtocol, downloadLoc, speed, downloadFormat, ref ulRet, ref urlInfo, byPcChannel);
            }
            catch (System.Exception ex)
            { 
                return null;
            } 
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="stUserLoginIDInfo"></param>
        /// <param name="vodProtocol"></param>
        /// <param name="downloadLoc"></param>
        /// <param name="speed"></param>
        /// <param name="downloadFormat"></param>
        /// <param name="ulRet"></param>
        /// <param name="urlInfo"></param>
        /// <param name="byPcChannel"></param>
        /// <returns></returns>
        private static byte[] DownloadFile(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,  XP_PROTOCOL_E vodProtocol, String downloadLoc, XP_DOWN_MEDIA_SPEED_E speed, uint downloadFormat, ref UInt32 ulRet, ref URL_INFO_S urlInfo, byte[] byPcChannel)
        {
            ulRet = IMOSSDK.IMOS_OpenDownload(ref stUserLoginIDInfo,
                urlInfo.szURL, urlInfo.stVodSeverIP.szServerIp, urlInfo.stVodSeverIP.usServerPort,
                (uint)vodProtocol, (uint)speed,
                Encoding.Default.GetBytes(downloadLoc), downloadFormat, byPcChannel);

            ulRet = IMOSSDK.IMOS_SetDecoderTag(ref stUserLoginIDInfo, byPcChannel, urlInfo.szDecoderTag);

            ulRet = IMOSSDK.IMOS_StartDownload(ref stUserLoginIDInfo, byPcChannel);

            return byPcChannel;
        }

        /// <summary>
        /// 获取当前下载时间
        /// </summary>
        /// <param name="channelCode">下载通道号</param>
        /// <returns></returns>
        public static uint GetCurrDownLoadTime(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] channelCode, out DateTime time)
        {
            DateTimeFormatInfo dtFormat = new DateTimeFormatInfo();
            dtFormat.ShortTimePattern = "yyyy-MM-dd HH:mm:ss";
            DateTime dt = new DateTime();
            UInt32 ulRet = 0;
            try
            {
                byte[] currTime = new byte[IMOSSDK.IMOS_TIME_LEN];   //当前下载时间;
                ulRet = IMOSSDK.IMOS_GetDownloadTime(ref stUserLoginIDInfo, Encoding.UTF8.GetString(channelCode), currTime);
                //curr = getTotalTime(currTime);

                String strTime = Encoding.UTF8.GetString(currTime);

                if (!String.IsNullOrEmpty(strTime.TrimEnd('\0')))
                {
                    dt = Convert.ToDateTime(strTime, dtFormat);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message.ToString());
            }

            
            time = dt;
            return ulRet;
        }

        /// <summary>
        /// 停止下载
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="bytDownloadID">下载编码</param>
        /// <returns>成功返回0</returns>
        public static uint StopDownload(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytDownloadID)
        {
            return IMOSSDK.IMOS_StopDownload(ref stUserLoginIDInfo, bytDownloadID);
        }

    }
}
