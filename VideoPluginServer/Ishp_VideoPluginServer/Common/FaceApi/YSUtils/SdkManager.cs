using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk;
using System.Runtime.InteropServices;
using IMOS_SDK_DEMO.player;
using System.Globalization;
using IMOS_SDK_DEMO.ptz;

namespace IMOS_SDK_DEMO
{
    public class RunMsgEventArgs : EventArgs
    {
        public int Type { get; set; }
        public string Describe { get; set; }
    }
    
    public class PostMessageEventArgs : EventArgs
    {
        public string Message { get; set; }
    } 

    public delegate void XPRunMsgHandler(object sender, RunMsgEventArgs e);
    public delegate void PostMessageHandler(object sender, PostMessageEventArgs e);

    public class SdkManager
    {
        public static bool Is64Bit = (IntPtr.Size == 8);

        public const uint EX_SUCCESS = 0;
        public const uint EX_FAILED = 0;
        public const string ALARMSEQ = "告警序号";
        public const string ALARMEVENTCODE = "告警事件编码";
        public const string ALARMSRCCODE = "告警源编码";
        public const string ALRAMSRCNAME = "告警源名称";
        public const string ACTIVENAME = "使能后名称";
        public const string ALARMTYPE = "告警类型";
        public const string ALARMLEVEL = "告警级别";
        public const string ALARMTIME = "告警触发时间";
        public const string ALARMDESC = "告警描述";

        private string m_strDateFormat = "yyyy-MM-dd HH:mm:ss";

        //登录成功返回信息
        public LOGIN_INFO_S stLoginInfo;

        private SubCtrl subCtrl;
        public void getMainFormHandle(SubCtrl subCtrl)
        {
            this.subCtrl = subCtrl;
        }
        //用户登录参数
        public String srvIpAddr { get; set; }
        public String usrLoginName { get; set; }
        public String usrLoginPsw { get; set; }

        ////回调函数指针
        //public IMOS_SDK_DEMO.sdk.IMOSSDK.CALL_BACK_PROC_PF CallBackFunc;

        public void getLoginInfo(String srvIpAddr, String usrLoginName, String usrLoginPsw, String cltIpAddr)
        {
            this.srvIpAddr = srvIpAddr;
            this.usrLoginName = usrLoginName;
            this.usrLoginPsw = usrLoginPsw;
        }
       

       
        /// <summary>
        /// 构造树
        /// </summary>
        /// <param name="treeNode"></param>
        private void BuildTree(TreeNode treeNode,TreeView treeView)
        {
            try
            {
                treeView.BeginUpdate();
                //获取域数据
                List<ORG_RES_QUERY_ITEM_S> list = QueryResource.GetDomain(ref this.stLoginInfo.stUserLoginIDInfo, (ORG_RES_QUERY_ITEM_S)treeNode.Tag);

                //List<ORG_RES_QUERY_ITEM_S> list = getTestDomain();

                if (null != list)
                {
                    foreach (ORG_RES_QUERY_ITEM_S org in list)
                    {
                        TreeNode domainNode = new TreeNode();
                        domainNode.Text = IMOSSDK.UTF8ToUnicode(org.szResName);
                        domainNode.Tag = org;
                        domainNode.ImageIndex = 0;
                        domainNode.SelectedImageIndex = 0;
                        treeNode.Nodes.Add(domainNode);
                    }
                }
                treeNode.ExpandAll();
                //获取摄像机数据
                List<ORG_RES_QUERY_ITEM_S> cameraList = QueryResource.GetCamera(ref stLoginInfo.stUserLoginIDInfo, (ORG_RES_QUERY_ITEM_S)treeNode.Tag);
                //List<ORG_RES_QUERY_ITEM_S> cameraList = getTestCamera();
                if (null == cameraList)
                {
                    return;
                }

                foreach (ORG_RES_QUERY_ITEM_S camera in cameraList)
                {
                    TreeNode cameraNode = new TreeNode();
                    cameraNode.Text = IMOSSDK.UTF8ToUnicode(camera.szResName);
                    cameraNode.Tag = camera;

                    if (2 == camera.ulResSubType || 4 == camera.ulResSubType)
                    {
                        //云台摄像机
                        switch (camera.ulResStatus)
                        {
                            case IMOSSDK.IMOS_DEV_STATUS_ONLINE:
                                cameraNode.ImageIndex = 1;
                                cameraNode.SelectedImageIndex = 1;
                                break;
                            case IMOSSDK.IMOS_DEV_STATUS_OFFLINE:
                                cameraNode.ImageIndex = 2;
                                cameraNode.SelectedImageIndex = 2;
                                break;
                            default:
                                cameraNode.ImageIndex = 2;
                                cameraNode.SelectedImageIndex = 2;
                                break;
                        }
                    }
                    else
                    {
                        switch (camera.ulResStatus)
                        {
                            case IMOSSDK.IMOS_DEV_STATUS_ONLINE:
                                cameraNode.ImageIndex = 4;
                                cameraNode.SelectedImageIndex = 4;
                                break;
                            case IMOSSDK.IMOS_DEV_STATUS_OFFLINE:
                                cameraNode.ImageIndex = 5;
                                cameraNode.SelectedImageIndex = 5;
                                break;
                            default:
                                cameraNode.ImageIndex = 4;
                                cameraNode.SelectedImageIndex = 4;
                                break;
                        }
                    }
 
                    treeNode.Nodes.Add(cameraNode);
                }
            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
            }
            finally
            {
                treeView.EndUpdate();
            }
        }

        /// <summary>
        /// 设置根节点
        /// </summary>
        public void SetTreeRoot(TreeView treeView)
        {
            try
            {
                TreeNode treeNode = new TreeNode();
                treeNode.Text = IMOSSDK.UTF8ToUnicode(stLoginInfo.szDomainName);
                ORG_RES_QUERY_ITEM_S stOrgQueryItem = new ORG_RES_QUERY_ITEM_S();
                stOrgQueryItem.szOrgCode = stLoginInfo.szOrgCode;
                stOrgQueryItem.szResName = stLoginInfo.szDomainName;
                stOrgQueryItem.szResCode = stLoginInfo.szOrgCode;
                stOrgQueryItem.ulResType = (UInt32)IMOS_TYPE_E.IMOS_TYPE_ORG;
                treeNode.Tag = stOrgQueryItem;
                treeView.Nodes.Add(treeNode);
                treeView.ExpandAll();
    
            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
            }
        }

        /// <summary>
        /// 根据当前节点，显示该节点下的子节点。
        /// </summary>
        /// <param name="parentNode"></param>
        public void OrganizeChildrenNodes(TreeNode parentNode, TreeView treeView)
        {
            if (null == parentNode)
            {
                return;
            }
            try
            {
                ORG_RES_QUERY_ITEM_S stOrgQueryItem = (ORG_RES_QUERY_ITEM_S)parentNode.Tag; 

                if (stOrgQueryItem.ulResType == (UInt32)IMOS_TYPE_E.IMOS_TYPE_ORG)
                {
                    parentNode.Nodes.Clear();
                    BuildTree(parentNode, treeView);
                }
            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
                MessageBox.Show("获取子节点失败，详情请查询日志信息。");
            }

        }

        /// <summary>
        /// 登录方法
        /// </summary>
        /// <returns></returns>
        public LOGIN_INFO_S LoginMethod(String usrLoginName, String usrLoginPsw, String srvIpAddr, String cltIpAddr)
        {
            stLoginInfo = new LOGIN_INFO_S();

            CommonFunc.Login(usrLoginName, usrLoginPsw, srvIpAddr, cltIpAddr, ref stLoginInfo);
            //4.保活
            return stLoginInfo;
        }


        /// <summary>
        /// 根据节点信息，进行视频播放，并连接该节点摄像机的云台。
        /// </summary>
        /// <param name="treeNode"></param>
        public void PlayVideo(TreeNode treeNode, Player imosPlayer, PTZPanel ptzPanel)
        {
            if (null == treeNode)
            {
                return;
            }

            try
            {
                ORG_RES_QUERY_ITEM_S stOrgQueryItem = (ORG_RES_QUERY_ITEM_S)treeNode.Tag;

                if (stOrgQueryItem.ulResType == (UInt32)IMOS_TYPE_E.IMOS_TYPE_CAMERA)
                {
                    UInt32 ulRet = 0;

                    ulRet = imosPlayer.PlayLive(stOrgQueryItem.szResCode);
                     
                    if (0 != ulRet)
                    {
                        //log.Info("播放视频失败，错误码为：" + ulRet.ToString());
                        MessageBox.Show("播放视频失败，错误码为：" + ulRet.ToString());
                        return;
                    }

                    if (stOrgQueryItem.ulResSubType == 4 || stOrgQueryItem.ulResSubType == 2)
                    {
                        //连接云台
                        PlayerPanel.SelectPlayer.IsPtz = true;
                        //ulRet = imosPlayer.Ptz_Connect(Encoding.Default.GetString(stOrgQueryItem.szResCode), stLoginInfo);
                    }

                    if (0 != ulRet)
                    {
                        //log.Info("连接云台失败，错误码为：" + ulRet.ToString());
                        MessageBox.Show("连接云台失败，错误码为：" + ulRet.ToString());
                        return;
                    }else
                    {
                        ptzPanel.setCamName(Encoding.UTF8.GetString(stOrgQueryItem.szResCode));
                    }
                }

            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
                MessageBox.Show("播放视频失败，详情请查阅日志信息。");
            }
        }

        
        
        /// <summary>
        /// 停止视频，并释放该视频源连接的云台。
        /// </summary>
        public void StopVideo(Player player, PTZPanel ptzPanel)
        {
            try
            {
                UInt32 ulRet = 0;
                ulRet = player.StopAll(); 
                PTZControl.ReleasePTZ(ref stLoginInfo.stUserLoginIDInfo,Encoding.Default.GetBytes(ptzPanel.CamCode), 0);
            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
            }
            finally
            {
                //pl_MediaPlayer.Refresh();
            }
        }

        /// <summary>
        /// 播放云录像方法
        /// </summary>
        /// <param name="RecFileList">录像列表</param>
        /// <param name="beginTime">开始时间</param>
        /// <param name="endTime">结束时间</param>
        /// <param name="m_cameraCode">摄像机编码</param>
        public UInt32 PlayCloudRecord(List<UNITED_REC_FILE_INFO_S> RecFileList, byte[] beginTime, byte[] endTime, String m_cameraCode)
        {
            if (RecFileList == null || RecFileList.Count <= 0)
            {
                return 0;
            }
            URL_INFO_S urlInfo = new URL_INFO_S();
            UInt32 ulRet = QueryResource.QueryUnitedRecordURL(ref stLoginInfo.stUserLoginIDInfo, RecFileList[0], m_cameraCode,
                beginTime, endTime, ref urlInfo);
            if (0 != ulRet)
            {
                return ulRet;
            } 
            return PlayerPanel.SelectPlayer.StartVod(urlInfo);
        }

        public UInt32 PlayRecord(List<RECORD_FILE_INFO_S> RecFileList, byte[] beginTime, byte[] endTime, String m_cameraCode)
        {
            if (RecFileList == null || RecFileList.Count <= 0)
            {
                return 0;
            }

            URL_INFO_S urlInfo = new URL_INFO_S();

            UInt32 ulRet = QueryResource.QueryRecordURL(ref stLoginInfo.stUserLoginIDInfo, RecFileList[0], m_cameraCode, beginTime, endTime, ref urlInfo);

            if (0 != ulRet)
            {
                return ulRet;
            }
            return PlayerPanel.SelectPlayer.StartVod(urlInfo);

        }

        //备用
        public UInt32 PlayBakRecord(List<RECORD_FILE_INFO_S> RecFileList, byte[] beginTime, byte[] endTime, String m_cameraCode)
        {
            if (RecFileList == null || RecFileList.Count <= 0)
            {
                return 0;
            }

            URL_INFO_S urlInfo = new URL_INFO_S();

            UInt32 ulRet = QueryResource.QuerySlaveRecordUrl(ref stLoginInfo.stUserLoginIDInfo, RecFileList[0], m_cameraCode, beginTime, endTime, ref urlInfo);
            
            if (0 != ulRet)
            {
                return ulRet;
            }

            return PlayerPanel.SelectPlayer.StartVod(urlInfo);
        }  
    }
}
