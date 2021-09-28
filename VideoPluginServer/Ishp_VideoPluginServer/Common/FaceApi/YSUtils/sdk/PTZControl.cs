using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.sdk
{
    public class PTZControl
    {
        /// <summary>
        /// 设置预置位信息
        /// </summary>
        /// <param name="stUserLogIDInfo">登入用户id标识</param>
        /// <param name="byCameraCode">摄像机编码</param>
        /// <param name="stPresetInfo">预置位信息</param>
        /// <returns></returns>
        public static uint SetPreset(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] byCameraCode, PRESET_INFO_S stPresetInfo)
        {
           return IMOSSDK.IMOS_SetPreset(ref stUserLogIDInfo, byCameraCode, ref stPresetInfo);  
        }

        /// <summary>
        /// 删除预置位信息
        /// </summary>
        /// <param name="stUserLogIDInfo">登入用户id标识</param>
        /// <param name="szCamCode">摄像机编码</param>
        /// <param name="ulPresetValue">预置位值</param>
        /// <returns></returns>
        public static uint DeletePreset(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] byCameraCode, uint ulPresetValue)
        {
            return IMOSSDK.IMOS_DelPreset(ref stUserLogIDInfo, byCameraCode, ulPresetValue); 
        }

        public static uint ReleasePTZ(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] bytCameraID, uint IsRelease)
        {
            return IMOSSDK.IMOS_ReleasePtzCtrl(ref stUserLogIDInfo, bytCameraID, IsRelease);
        }

        public static uint PtzCtrlCommand(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, byte[] bytCameraCode, ref PTZ_CTRL_COMMAND_S stPTZCommand)
        {
            return IMOSSDK.IMOS_PtzCtrlCommand(ref stUserLoginIDInfo, bytCameraCode, ref stPTZCommand);
        }

        /// <summary>
        /// 设置预置位
        /// </summary>
        /// <param name="szCamCode"></param>
        /// <param name="preset"></param>
        /// <returns></returns>
        public static UInt32 SetPresetLoc(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] szCamCode, PRESET_INFO_S preset)
        {
            return IMOSSDK.IMOS_SetPreset(ref stUserLogIDInfo, szCamCode, ref preset);
        }

        /// <summary>
        /// 使用预置位
        /// </summary>
        /// <param name="szCamCode"></param>
        /// <param name="ulPresetNum"></param>
        /// <returns></returns>
        public static UInt32 UsePreset(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] szCamCode, uint ulPresetNum)
        {
            return IMOSSDK.IMOS_UsePreset(ref stUserLogIDInfo, szCamCode, ulPresetNum);
        }

        /// <summary>
        /// 查询预置位信息
        /// </summary>
        /// <param name="stUserLogIDInfo">登入用户id标识</param>
        /// <param name="byCameraCode">摄像机编码</param>
        /// <returns>所有预置位信息</returns>
        public static List<PRESET_INFO_S> QueryPreset(USER_LOGIN_ID_INFO_S stUserLogIDInfo, byte[] byCameraCode)
        {
            List<PRESET_INFO_S> lPresetInfo = new List<PRESET_INFO_S>();

            int iSize = Marshal.SizeOf(typeof(PRESET_INFO_S));
            uint ulResult = 0;

            IntPtr ptrQueryItems = IntPtr.Zero;

            try
            {
                //查询页面的结构信息
                QUERY_PAGE_INFO_S stQueryPage = new QUERY_PAGE_INFO_S();
                stQueryPage.ulPageFirstRowNumber = 0;
                stQueryPage.ulPageRowNum = IMOSSDK.QUERY_ITEM_MAX;

                //查询返回页面结构体信息
                RSP_PAGE_INFO_S stResPageInfo = new RSP_PAGE_INFO_S();

                ptrQueryItems = Marshal.AllocHGlobal(iSize * IMOSSDK.QUERY_ITEM_MAX);

                //循环查询
                do
                {
                    stResPageInfo.ulRowNum = 0;
                    ulResult = IMOSSDK.IMOS_QueryPresetList(ref stUserLogIDInfo, byCameraCode, ref stQueryPage, ref stResPageInfo, ptrQueryItems);

                    if (ulResult != 0)
                    { 
                        return lPresetInfo;
                    }

                    for (int i = 0; i < stResPageInfo.ulRowNum; i++)
                    {
                        IntPtr ptrResItem = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrResItem = (IntPtr)(ptrQueryItems.ToInt64() + iSize * i);
                        }
                        else
                        {
                            ptrResItem = (IntPtr)(ptrQueryItems.ToInt32() + iSize * i);
                        }

                        PRESET_INFO_S stResItem = new PRESET_INFO_S();

                        stResItem = (PRESET_INFO_S)Marshal.PtrToStructure(ptrResItem, typeof(PRESET_INFO_S));

                        lPresetInfo.Add(stResItem);
                    }

                    stQueryPage.ulPageFirstRowNumber = stQueryPage.ulPageFirstRowNumber + stResPageInfo.ulRowNum;
                }
                while (stResPageInfo.ulRowNum == stQueryPage.ulPageRowNum);
            }
            catch (Exception err)
            {
                //Log.Write.Error("QueryPreset exception", err);
            }
            finally
            {
                Marshal.FreeHGlobal(ptrQueryItems);
            }

            return lPresetInfo;
        }
    }
}
