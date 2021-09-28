using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.sdk
{
    /// <summary>
    /// 查询类业务接口封装
    /// </summary>
    public class QueryResource
    {
        /// <summary>
        /// 查询云检索录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="strBegin">开始时间</param>
        /// <param name="strEnd">结束时间</param>
        /// <param name="m_cameraCode">相机编码</param>
        /// <returns>录像信息集合</returns>
        public static List<UNITED_REC_FILE_INFO_S> QueryCloud(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, string strBegin, string strEnd, string m_cameraCode)
        {
            List<UNITED_REC_FILE_INFO_S> RecFileList = new List<UNITED_REC_FILE_INFO_S>();
            UInt32 ulRe = 0;
            UInt32 ulBeginNum = 0;
            UInt32 ulTotalNum = 0;
            //分页请求信息
            QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();
            //分页响应信息
            //RSP_PAGE_INFO_S stPRspPageInfo;
            REC_RSP_ROW_INFO_S stPRspPageInfo = new REC_RSP_ROW_INFO_S();

            REC_QUERY_INFO_S stReQueryInfo = new REC_QUERY_INFO_S();
            stReQueryInfo.szReserve = new byte[20];
            stReQueryInfo.szCamCode = Encoding.UTF8.GetBytes(m_cameraCode);
            stReQueryInfo.stQueryTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.UTF8.GetBytes(strBegin, 0, Encoding.UTF8.GetByteCount(strBegin), stReQueryInfo.stQueryTimeSlice.szBeginTime, 0);
            stReQueryInfo.stQueryTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.UTF8.GetBytes(strEnd, 0, Encoding.UTF8.GetByteCount(strEnd), stReQueryInfo.stQueryTimeSlice.szEndTime, 0);

            int size = Marshal.SizeOf(typeof(UNITED_REC_FILE_INFO_S));
            IntPtr ptrRecFileList = Marshal.AllocHGlobal(size * 30);
            try
            {
                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    ulRe = IMOSSDK.IMOS_UnitedRecordRetrieval(ref stUserLoginIDInfo, ref stReQueryInfo, stPageInfo.ulPageRowNum, ref stPRspPageInfo, ptrRecFileList);
                    if (ulRe != 0)
                    {
                        return RecFileList;
                    }
                    for (int i = 0; i < stPRspPageInfo.ulRowNum; i++)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrRecFileList.ToInt64() + size * i);
                        }
                        else
                        {

                            ptrTemp = new IntPtr(ptrRecFileList.ToInt32() + size * i);
                        }

                        UNITED_REC_FILE_INFO_S fileInfo = (UNITED_REC_FILE_INFO_S)Marshal.PtrToStructure(ptrTemp, typeof(UNITED_REC_FILE_INFO_S));
                        RecFileList.Add(fileInfo);
                    }
                    ulBeginNum += stPRspPageInfo.ulRowNum;

                }
                while (ulTotalNum > ulBeginNum);
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                Marshal.FreeHGlobal(ptrRecFileList);
            }
            return RecFileList;
        }


        /// <summary>
        /// 查询录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="strBegin">开始时间</param>
        /// <param name="strEnd">结束时间</param>
        /// <param name="m_cameraCode">相机编码</param>
        /// <returns>录像信息集合</returns>
        public static List<RECORD_FILE_INFO_S> QueryRecord(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, string strBegin, string strEnd, String m_cameraCode)
        {
            List<RECORD_FILE_INFO_S> RecFileList = new List<RECORD_FILE_INFO_S>();
            UInt32 ulRet = 0;
            UInt32 ulBeginNum = 0;
            UInt32 ulTotalNum = 0;
            QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();
            RSP_PAGE_INFO_S stRspPageInfo;


            REC_QUERY_INFO_S stRecQueryInfo = new REC_QUERY_INFO_S();
            stRecQueryInfo.szReserve = new byte[20];
            //stRecQueryInfo.stQueryTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            stRecQueryInfo.szCamCode = Encoding.Default.GetBytes(m_cameraCode);
            stRecQueryInfo.stQueryTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.Default.GetBytes(strBegin, 0, Encoding.Default.GetByteCount(strBegin), stRecQueryInfo.stQueryTimeSlice.szBeginTime, 0);
            stRecQueryInfo.stQueryTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.Default.GetBytes(strEnd, 0, Encoding.Default.GetByteCount(strEnd), stRecQueryInfo.stQueryTimeSlice.szEndTime, 0);
            stRecQueryInfo.uiIndistinctQuery = 3;

            IntPtr ptrRecFileList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * 30);
            IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
            try
            {
                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    ulRet = IMOSSDK.IMOS_RecordRetrieval(ref stUserLoginIDInfo, ref stRecQueryInfo, ref stPageInfo, ptrRspPage, ptrRecFileList);
                    if (0 != ulRet)
                    {
                        return RecFileList;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    RECORD_FILE_INFO_S stRecFileItem;

                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrRecFileList.ToInt64() + Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrRecFileList.ToInt32() + Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * i);
                        }
                        stRecFileItem = (RECORD_FILE_INFO_S)Marshal.PtrToStructure(ptrTemp, typeof(RECORD_FILE_INFO_S));
                        RecFileList.Add(stRecFileItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return RecFileList;
            }
            catch (System.Exception ex)
            {
                return RecFileList;
            }
            finally
            {
                Marshal.FreeHGlobal(ptrRecFileList);
                Marshal.FreeHGlobal(ptrRspPage);
            }
        }

        /// <summary>
        /// 查询备份录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="strBegin">开始时间</param>
        /// <param name="strEnd">结束时间</param>
        /// <param name="m_cameraCode">相机编码</param>
        /// <returns>录像信息集合</returns>
        public static List<CAM_BAK_FILE_QUERY_ITEM_S> QueryBakRecord(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, string strBegin, string strEnd, String m_cameraCode)
        {
            COMMON_QUERY_CONDITION_S stQueryCondition = new COMMON_QUERY_CONDITION_S();
            uint queryItems = 0;
            stQueryCondition.astQueryConditionList = new QUERY_CONDITION_ITEM_S[16];
            //查询项:相机编码
            QUERY_CONDITION_ITEM_S stQueryCamCode = new QUERY_CONDITION_ITEM_S()
            {
                ulQueryType = (uint)QUERY_TYPE_E.CODE_TYPE,
                ulLogicFlag = (uint)LOGIC_FLAG_E.EQUAL_FLAG,
                szQueryData = Encoding.UTF8.GetBytes(m_cameraCode.PadRight(IMOSSDK.IMOS_QUERY_DATA_MAX_LEN, '\0'))
            };
            stQueryCondition.astQueryConditionList[queryItems++] = stQueryCamCode;

            //查询项:开始时间
            QUERY_CONDITION_ITEM_S stQueryBeginTime = new QUERY_CONDITION_ITEM_S
            {
                ulQueryType = (uint)QUERY_TYPE_E.BAK_START_TIME,
                ulLogicFlag = (uint)LOGIC_FLAG_E.GEQUAL_FLAG,
                szQueryData = Encoding.UTF8.GetBytes(strBegin.ToString().PadRight(IMOSSDK.IMOS_QUERY_DATA_MAX_LEN, '\0'))
            };
            stQueryCondition.astQueryConditionList[queryItems++] = stQueryBeginTime;

            //查询项:结束时间
            QUERY_CONDITION_ITEM_S stQueryEndTime = new QUERY_CONDITION_ITEM_S()
            {
                ulQueryType = (uint)QUERY_TYPE_E.BAK_END_TIME,
                ulLogicFlag = (uint)LOGIC_FLAG_E.LEQUAL_FLAG,
                szQueryData = Encoding.UTF8.GetBytes(strEnd.ToString().PadRight(IMOSSDK.IMOS_QUERY_DATA_MAX_LEN, '\0'))
            };
            stQueryCondition.astQueryConditionList[queryItems++] = stQueryEndTime;
 
            stQueryCondition.ulItemNum = queryItems;

            UInt32 ulBeginNum = 0;
            UInt32 ulTotalNum = 0;
            RSP_PAGE_INFO_S stRspPageInfo = new RSP_PAGE_INFO_S();

            List<CAM_BAK_FILE_QUERY_ITEM_S> stBakRecordList = new List<CAM_BAK_FILE_QUERY_ITEM_S>();
            int iSize = System.Runtime.InteropServices.Marshal.SizeOf(typeof(CAM_BAK_FILE_QUERY_ITEM_S));
            IntPtr ptrQueryItems = IntPtr.Zero;
            ptrQueryItems = System.Runtime.InteropServices.Marshal.AllocHGlobal(iSize * IMOSSDK.QUERY_ITEM_MAX);

            stRspPageInfo.ulRowNum = 0;
            try
            {
                do
                {
                    //查询页面的结构信息
                    QUERY_PAGE_INFO_S stQueryPageInfo = new QUERY_PAGE_INFO_S
                    {
                        bQueryCount = 1,
                        ulPageFirstRowNumber = ulBeginNum,
                        ulPageRowNum = 10
                    };
                    uint result = IMOSSDK.IMOS_BakRecordRetrieval(ref stUserLoginIDInfo, ref stQueryCondition, ref stQueryPageInfo, ref stRspPageInfo, ptrQueryItems);
                    if (result != 0)
                    {
                        return stBakRecordList;
                    }
                    for (int i = 0; i < stRspPageInfo.ulRowNum; i++)
                    {
                        CAM_BAK_FILE_QUERY_ITEM_S stDcItem = new CAM_BAK_FILE_QUERY_ITEM_S();
                        IntPtr ptrDcItem = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrDcItem = (IntPtr)(ptrQueryItems.ToInt64() + iSize * i);
                        }
                        else
                        {
                            ptrDcItem = (IntPtr)(ptrQueryItems.ToInt32() + iSize * i);
                        }
                        stDcItem = (CAM_BAK_FILE_QUERY_ITEM_S)System.Runtime.InteropServices.Marshal.PtrToStructure(ptrDcItem, typeof(CAM_BAK_FILE_QUERY_ITEM_S));
                        stBakRecordList.Add(stDcItem);
                    }
                    stQueryPageInfo.ulPageFirstRowNumber = stQueryPageInfo.ulPageFirstRowNumber + stRspPageInfo.ulRowNum;
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;
                    ulBeginNum += stRspPageInfo.ulRowNum;
                }
                while (ulTotalNum > ulBeginNum);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                System.Runtime.InteropServices.Marshal.FreeHGlobal(ptrQueryItems);
            }

            return stBakRecordList;
        }


        /// <summary>
        /// 查询备用录像
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="strBegin">开始时间</param>
        /// <param name="strEnd">结束时间</param>
        /// <param name="m_cameraCode">相机编码</param>
        /// <returns>录像信息集合</returns>
        public static List<RECORD_FILE_INFO_S> QuerySlaveRecord(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, string strBegin, string strEnd, String m_cameraCode)
        {
            List<RECORD_FILE_INFO_S> RecFileList = new List<RECORD_FILE_INFO_S>();
            UInt32 ulRet = 0;
            UInt32 ulBeginNum = 0;
            UInt32 ulTotalNum = 0;
            QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();
            RSP_PAGE_INFO_S stRspPageInfo = new RSP_PAGE_INFO_S();

            REC_QUERY_INFO_S stRecQueryInfo = new REC_QUERY_INFO_S();
            stRecQueryInfo.szReserve = new byte[20];
            //stRecQueryInfo.stQueryTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            stRecQueryInfo.szCamCode = Encoding.Default.GetBytes(m_cameraCode);
            stRecQueryInfo.stQueryTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.Default.GetBytes(strBegin, 0, Encoding.Default.GetByteCount(strBegin), stRecQueryInfo.stQueryTimeSlice.szBeginTime, 0);
            stRecQueryInfo.stQueryTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            Encoding.Default.GetBytes(strEnd, 0, Encoding.Default.GetByteCount(strEnd), stRecQueryInfo.stQueryTimeSlice.szEndTime, 0);
            stRecQueryInfo.uiIndistinctQuery = 3;
             
            IntPtr ptrRecFileList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * 30);
            try
            {
                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    ulRet = IMOSSDK.IMOS_SlaveRecordRetrieval(ref stUserLoginIDInfo, 1, ref stRecQueryInfo, ref stPageInfo, ref stRspPageInfo, ptrRecFileList);
                    if (0 != ulRet)
                    {
                        return RecFileList;
                    }


                    RECORD_FILE_INFO_S stRecFileItem;

                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrRecFileList.ToInt64() + Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrRecFileList.ToInt32() + Marshal.SizeOf(typeof(RECORD_FILE_INFO_S)) * i);
                        }
                        stRecFileItem = (RECORD_FILE_INFO_S)Marshal.PtrToStructure(ptrTemp, typeof(RECORD_FILE_INFO_S));

                        string strFile = Encoding.UTF8.GetString(stRecFileItem.szFileName);

                        RecFileList.Add(stRecFileItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return RecFileList;
            }
            catch (System.Exception ex)
            {
                return RecFileList;
            }
            finally
            {
                Marshal.FreeHGlobal(ptrRecFileList);
            }
        }


        /// <summary>
        /// 获取指定节点下的域数据列表。
        /// </summary>
        /// <param name="USER_LOGIN_ID_INFO_S"></param>
        /// <param name="ORG_RES_QUERY_ITEM_S"></param>
        /// <returns></returns>
        public static List<ORG_RES_QUERY_ITEM_S> GetDomain(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,ORG_RES_QUERY_ITEM_S st)
        {
            IntPtr ptrResList = IntPtr.Zero;
            IntPtr ptrRspPage = IntPtr.Zero;
            List<ORG_RES_QUERY_ITEM_S> list = new List<ORG_RES_QUERY_ITEM_S>();
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0; 

                ptrResList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * 30);
                ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));

                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();
                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 1;

                    ulRet = IMOSSDK.IMOS_QueryResourceList(ref stUserLoginIDInfo, st.szResCode, (UInt32)IMOS_TYPE_E.IMOS_TYPE_ORG, 0, ref stPageInfo, ptrRspPage, ptrResList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    ORG_RES_QUERY_ITEM_S stOrgResItem;
                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrResList.ToInt64() + Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrResList.ToInt32() + Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * i);
                        }
                        stOrgResItem = (ORG_RES_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(ORG_RES_QUERY_ITEM_S));
                        list.Add(stOrgResItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);


            }
            catch (Exception ex)
            {
            }
            finally
            {
                Marshal.FreeHGlobal(ptrResList);
                Marshal.FreeHGlobal(ptrRspPage);
            }
            return list;
        }

        /// <summary>
        /// 获取指定节点下的摄像机数据列表。
        /// </summary>
        /// <param name="treeNode"></param>
        /// <returns></returns>
        public static List<ORG_RES_QUERY_ITEM_S> GetCamera(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,ORG_RES_QUERY_ITEM_S st)
        {

            List<ORG_RES_QUERY_ITEM_S> list = new List<ORG_RES_QUERY_ITEM_S>();

            IntPtr ptrResList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * 30);
            IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0; 


                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();
                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 1;
                    ulRet = IMOSSDK.IMOS_QueryResourceList(ref stUserLoginIDInfo, st.szResCode, (UInt32)IMOS_TYPE_E.IMOS_TYPE_CAMERA, 0, ref stPageInfo, ptrRspPage, ptrResList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;
                    ORG_RES_QUERY_ITEM_S stOrgResItem;

                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrResList.ToInt64() + Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrResList.ToInt32() + Marshal.SizeOf(typeof(ORG_RES_QUERY_ITEM_S)) * i);
                        }
                        stOrgResItem = (ORG_RES_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(ORG_RES_QUERY_ITEM_S));
                        list.Add(stOrgResItem);
                    }

                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);


            }
            catch (Exception ex)
            {  
            }
            finally
            {
                Marshal.FreeHGlobal(ptrResList);
                Marshal.FreeHGlobal(ptrRspPage);
            }

            return list;
        }


        /// <summary>
        /// 获取云检索录像URL
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="recordInfo">录像信息</param>
        /// <param name="cameraCode">相机编码</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <param name="urlInfo">URL信息</param>
        /// <returns>成功返回0</returns>
        public static uint QueryUnitedRecordURL(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo,UNITED_REC_FILE_INFO_S recordInfo, string cameraCode,
            byte[] beginTime, byte[] endTime, ref URL_INFO_S urlInfo)
        { 
            GET_URL_INFO_S getURLInfo = new GET_URL_INFO_S();
            getURLInfo.szCamCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            Encoding.UTF8.GetBytes(cameraCode).CopyTo(getURLInfo.szCamCode, 0);

            getURLInfo.szClientIp = stUserLoginIDInfo.szUserIpAddress;
            getURLInfo.szFileName = recordInfo.szFileName;

            getURLInfo.stRecTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            getURLInfo.stRecTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];

            UNITED_GET_URL_INFO_S stGetUrlInfo = new UNITED_GET_URL_INFO_S();
            stGetUrlInfo.stRecTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            stGetUrlInfo.stRecTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            stGetUrlInfo.szFileName = new byte[IMOSSDK.IMOS_FILE_NAME_LEN_V2];
            beginTime.CopyTo(stGetUrlInfo.stRecTimeSlice.szBeginTime, 0);
            endTime.CopyTo(stGetUrlInfo.stRecTimeSlice.szEndTime, 0);
            recordInfo.szFileName.CopyTo(stGetUrlInfo.szFileName, 0);

            stGetUrlInfo.szCamCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            Encoding.UTF8.GetBytes(cameraCode).CopyTo(stGetUrlInfo.szCamCode, 0);

            stGetUrlInfo.szClientIp = stUserLoginIDInfo.szUserIpAddress;
            stGetUrlInfo.ulPlaybackAutofit = 1;
            stGetUrlInfo.ulDomainLevel = 0;
            stGetUrlInfo.ulBakSrvType = (uint)BAK_TASK_SERVICE_TYPE_E.BAK_TASK_SERVICE_TYPE_GENERAL;
 
            return IMOSSDK.IMOS_UnitedGetRecordFileURL(ref stUserLoginIDInfo, ref stGetUrlInfo, ref urlInfo); 
        }


        /// <summary>
        /// 查询录像URL
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="recordInfo">录像信息</param>
        /// <param name="cameraCode">相机编码</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <param name="urlInfo">URL信息</param>
        /// <returns>成功返回0</returns>
        public static uint QueryRecordURL(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, RECORD_FILE_INFO_S recordInfo, string strCameraCode,
            byte[] beginTime, byte[] endTime, ref URL_INFO_S urlInfo)
        {
            GET_URL_INFO_S getUrlInfo = new GET_URL_INFO_S();
            TIME_SLICE_S timeSlice = new TIME_SLICE_S();


            timeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            beginTime.CopyTo(timeSlice.szBeginTime, 0);
            timeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            endTime.CopyTo(timeSlice.szEndTime, 0);

            getUrlInfo.szCamCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            Encoding.UTF8.GetBytes(strCameraCode).CopyTo(getUrlInfo.szCamCode, 0);

            getUrlInfo.szFileName = recordInfo.szFileName;
            getUrlInfo.stRecTimeSlice = timeSlice;
            getUrlInfo.szClientIp = stUserLoginIDInfo.szUserIpAddress;

            return IMOSSDK.IMOS_GetRecordFileURL(ref stUserLoginIDInfo, ref getUrlInfo, ref urlInfo); 
        }

        /// <summary>
        /// 查询备用录像URL
        /// </summary>
        /// <param name="stUserLoginIDInfo">登陆信息</param>
        /// <param name="recordInfo">录像信息</param>
        /// <param name="cameraCode">相机编码</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <param name="urlInfo">URL信息</param>
        /// <returns>成功返回0</returns>
        public static uint QuerySlaveRecordUrl(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, RECORD_FILE_INFO_S recordInfo,
            string strCameraCode, byte[] beginTime, byte[] endTime, ref URL_INFO_S urlInfo)
        {

            GET_URL_INFO_S GetURLInfo = new GET_URL_INFO_S();
            GetURLInfo.szCamCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            Encoding.UTF8.GetBytes(strCameraCode).CopyTo(GetURLInfo.szCamCode, 0);
            
            GetURLInfo.szClientIp = stUserLoginIDInfo.szUserIpAddress;
            //此处需要传入文件名称，非全路径，需要做一步处理，截取文件名称即可


            GET_URL_INFO_S stGetUrlInfo1 = GET_URL_INFO_S.GetInstance();

            beginTime.CopyTo(stGetUrlInfo1.stRecTimeSlice.szBeginTime, 0);
            endTime.CopyTo(stGetUrlInfo1.stRecTimeSlice.szEndTime, 0);
            recordInfo.szFileName.CopyTo(stGetUrlInfo1.szFileName, 0);


            stGetUrlInfo1.szCamCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            Encoding.UTF8.GetBytes(strCameraCode).CopyTo(stGetUrlInfo1.szCamCode, 0);
            stGetUrlInfo1.szClientIp = stUserLoginIDInfo.szUserIpAddress;

            return IMOSSDK.IMOS_GetSlaveRecordFileURL(ref stUserLoginIDInfo, 1, ref stGetUrlInfo1, ref urlInfo);

        }

        public static  List<EC_QUERY_ITEM_S> GetECList(string OrgCode)
        {
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0;

                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();

                IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
                IntPtr ptrECList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(EC_QUERY_ITEM_S)) * 30);

                List<EC_QUERY_ITEM_S> list = new List<EC_QUERY_ITEM_S>();
                IntPtr ptrQueryCondition = new IntPtr(0);

                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 0;

                    ulRet = IMOSSDK.IMOS_QueryEcList(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(OrgCode), ptrQueryCondition, ref stPageInfo, ptrRspPage, ptrECList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    EC_QUERY_ITEM_S stECItem;
                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrECList.ToInt64() + Marshal.SizeOf(typeof(EC_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrECList.ToInt32() + Marshal.SizeOf(typeof(EC_QUERY_ITEM_S)) * i);
                        }
                        stECItem = (EC_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(EC_QUERY_ITEM_S));
                        list.Add(stECItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return list;
            }
            catch (Exception ex)
            { 
                return null;
            }
        }


        public static List<DC_QUERY_ITEM_S> GetDCList(string OrgCode)
        {
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0;

                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();

                IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
                IntPtr ptrDCList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(DC_QUERY_ITEM_S)) * 30);

                List<DC_QUERY_ITEM_S> list = new List<DC_QUERY_ITEM_S>();
                IntPtr ptrQueryCondition = new IntPtr(0);

                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 0;

                    ulRet = IMOSSDK.IMOS_QueryDcList(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(OrgCode), ptrQueryCondition, ref stPageInfo, ptrRspPage, ptrDCList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    DC_QUERY_ITEM_S stDCItem;
                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrDCList.ToInt64() + Marshal.SizeOf(typeof(DC_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrDCList.ToInt32() + Marshal.SizeOf(typeof(DC_QUERY_ITEM_S)) * i);
                        }
                        stDCItem = (DC_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(DC_QUERY_ITEM_S));
                        list.Add(stDCItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return list;
            }
            catch (Exception ex)
            { 
                return null;
            }
        }


        public static List<CAM_AND_CHANNEL_QUERY_ITEM_S> GetECChanelList(string ECCode)
        {
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0;

                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();

                IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
                IntPtr ptrECChanelList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(CAM_AND_CHANNEL_QUERY_ITEM_S)) * 30);

                List<CAM_AND_CHANNEL_QUERY_ITEM_S> list = new List<CAM_AND_CHANNEL_QUERY_ITEM_S>();
                IntPtr ptrQueryCondition = new IntPtr(0);

                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 0;

                    ulRet = IMOSSDK.IMOS_QueryCameraAndChannelList(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(ECCode), ptrQueryCondition, ref stPageInfo, ptrRspPage, ptrECChanelList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    CAM_AND_CHANNEL_QUERY_ITEM_S stECChanelItem;
                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrECChanelList.ToInt64() + Marshal.SizeOf(typeof(CAM_AND_CHANNEL_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrECChanelList.ToInt32() + Marshal.SizeOf(typeof(CAM_AND_CHANNEL_QUERY_ITEM_S)) * i);
                        }
                        stECChanelItem = (CAM_AND_CHANNEL_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(CAM_AND_CHANNEL_QUERY_ITEM_S));
                        list.Add(stECChanelItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return list;
            }
            catch (System.Exception ex)
            { 
                return null;
            }
        }

        public static List<SCR_AND_CHANNEL_QUERY_ITEM_S> GetDCChanelList(string DCCode)
        {
            try
            {
                UInt32 ulRet = 0;
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0;

                RSP_PAGE_INFO_S stRspPageInfo;
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();

                IntPtr ptrRspPage = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RSP_PAGE_INFO_S)));
                IntPtr ptrDCChanelList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(SCR_AND_CHANNEL_QUERY_ITEM_S)) * 30);

                List<SCR_AND_CHANNEL_QUERY_ITEM_S> list = new List<SCR_AND_CHANNEL_QUERY_ITEM_S>();
                IntPtr ptrQueryCondition = new IntPtr(0);

                do
                {
                    stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                    stPageInfo.ulPageRowNum = 30;
                    stPageInfo.bQueryCount = 0;

                    ulRet = IMOSSDK.IMOS_QueryScreenAndChannelList(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(DCCode), ptrQueryCondition, ref stPageInfo, ptrRspPage, ptrDCChanelList);
                    if (0 != ulRet)
                    {
                        return null;
                    }

                    stRspPageInfo = (RSP_PAGE_INFO_S)Marshal.PtrToStructure(ptrRspPage, typeof(RSP_PAGE_INFO_S));
                    ulTotalNum = stRspPageInfo.ulTotalRowNum;

                    SCR_AND_CHANNEL_QUERY_ITEM_S stDCChanelItem;
                    for (int i = 0; i < stRspPageInfo.ulRowNum; ++i)
                    {
                        IntPtr ptrTemp = IntPtr.Zero;
                        if (SdkManager.Is64Bit)
                        {
                            ptrTemp = new IntPtr(ptrDCChanelList.ToInt64() + Marshal.SizeOf(typeof(SCR_AND_CHANNEL_QUERY_ITEM_S)) * i);
                        }
                        else
                        {
                            ptrTemp = new IntPtr(ptrDCChanelList.ToInt32() + Marshal.SizeOf(typeof(SCR_AND_CHANNEL_QUERY_ITEM_S)) * i);
                        }
                        stDCChanelItem = (SCR_AND_CHANNEL_QUERY_ITEM_S)Marshal.PtrToStructure(ptrTemp, typeof(SCR_AND_CHANNEL_QUERY_ITEM_S));
                        list.Add(stDCChanelItem);
                    }
                    ulBeginNum += stRspPageInfo.ulRowNum;

                } while (ulTotalNum > ulBeginNum);

                return list;
            }
            catch (System.Exception ex)
            {
                //log.Info(ex.StackTrace);
                return null;
            }
        }

        public static void DeleteEC(byte[] ECCode)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_DelEc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ECCode);
            if (0 != ulRet)
            {
                return;
            }
        }

        public static void DeleteDC(byte[] DCCode)
        {
            UInt32 ulRet = 0;
            ulRet = IMOSSDK.IMOS_DelDc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, DCCode);
            if (0 != ulRet)
            {
                return;
            } 
        }
    }
}
