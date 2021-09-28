using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk;
using System.Runtime.InteropServices;
//using log4net;

namespace IMOS_SDK_DEMO.player
{
    public partial class DCPlayer : UserControl
    {
        /// <summary>
        /// 日志记录
        /// </summary>
        //private ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        //public MainForm m_mainForm;

        private string m_orgCode;
        public string OrgCode
        {
            get { return m_orgCode; }
            set { m_orgCode = value; }
        }

        private string m_camCode;
        public string CamCode
        {
            get { return m_camCode; }
            set { m_camCode = value; }
        }

        private List<ORG_RES_QUERY_ITEM_S> ListUserDC = new List<ORG_RES_QUERY_ITEM_S>();
        
        public DCPlayer()
        {
            InitializeComponent();
        }

        //public void InitMainFormHandle(MainForm handle)
        //{
        //    m_mainForm = handle;

        //}
        private List<ORG_RES_QUERY_ITEM_S> GetDCList()
        {

            SubCtrl subCtrl1 = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];

            UInt32 ulRet = 0;
            try
            {
                UInt32 ulBeginNum = 0;
                UInt32 ulTotalNum = 0;

                IntPtr ptrResList = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(RES_ITEM_V2_S)) * 30);
                
                List<ORG_RES_QUERY_ITEM_S> list = new List<ORG_RES_QUERY_ITEM_S>();
                QUERY_PAGE_INFO_S stPageInfo = new QUERY_PAGE_INFO_S();

                //查询条件
                //查询摄像机
                uint uType = (uint)IMOS_TYPE_E.IMOS_TYPE_MONITOR; //摄像机类型
                COMMON_QUERY_CONDITION_S stCondition = new COMMON_QUERY_CONDITION_S();
                stCondition.astQueryConditionList = new QUERY_CONDITION_ITEM_S[16];

                QUERY_CONDITION_ITEM_S conditionItem0 = new QUERY_CONDITION_ITEM_S();
                conditionItem0.ulQueryType = (uint)256; //资源类型
                conditionItem0.ulLogicFlag = (uint)0;   //等于
                conditionItem0.szQueryData = new byte[64];
                Encoding.UTF8.GetBytes(uType.ToString()).CopyTo(conditionItem0.szQueryData, 0);

                //查询下级组织
                uint uFlag = 1;
                QUERY_CONDITION_ITEM_S conditionItem1 = new QUERY_CONDITION_ITEM_S();
                conditionItem1.ulQueryType = (uint)257; //是否查询下级组织
                conditionItem1.ulLogicFlag = (uint)0;
                conditionItem1.szQueryData = new byte[64];
                Encoding.UTF8.GetBytes(uFlag.ToString()).CopyTo(conditionItem1.szQueryData, 0);

                stCondition.ulItemNum = 2;
                stCondition.astQueryConditionList[0] = conditionItem0;
                stCondition.astQueryConditionList[1] = conditionItem1;

                //查询页面的结构信息
                QUERY_PAGE_INFO_S stQueryPage = new QUERY_PAGE_INFO_S();
                stQueryPage.ulPageFirstRowNumber = 0;
                stQueryPage.ulPageRowNum = 1;
                stQueryPage.bQueryCount = 1;

                //查询返回页面结构体信息
                RSP_PAGE_INFO_S stResPageInfo = new RSP_PAGE_INFO_S();
                
                //循环查询
                ulRet = IMOSSDK.IMOS_QueryResourceListV2(ref subCtrl1.sdkManager.stLoginInfo.stUserLoginIDInfo, subCtrl1.sdkManager.stLoginInfo.szOrgCode, ref stCondition, ref stQueryPage, ref stResPageInfo, ptrResList);
                if (0 != ulRet)
                {
                    return null;
                }

                try
                {
                    do
                    {
                        stPageInfo.ulPageFirstRowNumber = ulBeginNum;
                        stPageInfo.ulPageRowNum = 30;
                        stPageInfo.bQueryCount = 0;

                        ulRet = IMOSSDK.IMOS_QueryResourceListV2(ref subCtrl1.sdkManager.stLoginInfo.stUserLoginIDInfo, subCtrl1.sdkManager.stLoginInfo.szOrgCode, ref stCondition, ref stPageInfo, ref stResPageInfo, ptrResList);
                        if (0 != ulRet)
                        {
                            return null;
                        }

                        ulTotalNum = stResPageInfo.ulTotalRowNum;

                        RES_ITEM_V2_S stOrgResItem;
                        for (int i = 0; i < stResPageInfo.ulRowNum; ++i)
                        {
                            IntPtr ptrTemp = IntPtr.Zero;
                            if (SdkManager.Is64Bit)
                            {
                                ptrTemp = new IntPtr(ptrResList.ToInt64() + Marshal.SizeOf(typeof(RES_ITEM_V2_S)) * i);
                            }
                            else
                            {
                                ptrTemp = new IntPtr(ptrResList.ToInt32() + Marshal.SizeOf(typeof(RES_ITEM_V2_S)) * i);
                            }
                            stOrgResItem = (RES_ITEM_V2_S)Marshal.PtrToStructure(ptrTemp, typeof(RES_ITEM_V2_S));

                            list.Add(stOrgResItem.stResItemV1);
                        }                 
                        ulBeginNum += stResPageInfo.ulRowNum;

                    } while (ulTotalNum > ulBeginNum);
                }
                finally
                {
                    Marshal.FreeHGlobal(ptrResList);
                }


                return list;

            }
            catch (Exception ex)
            {
                //log.Info(ex.StackTrace);
                return null;
            }

        }

        public void RefreshDClist()
        {
            List<ORG_RES_QUERY_ITEM_S> list = GetDCList();
            if (null == list)
            {
                return;
            }

            listDC.Items.Clear();

            SubCtrl subCtrl1 = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];

            foreach (ORG_RES_QUERY_ITEM_S DCItem in list)
            {
                SPLIT_SCR_INFO_S stSplitInfo;
                stSplitInfo = new SPLIT_SCR_INFO_S();

                UInt32 ulRet = 0;
                ulRet = IMOSSDK.IMOS_QuerySplitScrInfo(ref subCtrl1.sdkManager.stLoginInfo.stUserLoginIDInfo, DCItem.szResCode, ref stSplitInfo);
                if (0 != ulRet)
                {
                    continue;
                }
                if (1 == stSplitInfo.ulSplitScrMode)
                {
                    int imageIndex;
                    if (1 == DCItem.ulResStatus)
                    {
                        imageIndex = 0;
                    }
                    else
                    {
                        imageIndex = 1;
                    }
                    ListViewItem listItem = listDC.Items.Add(Encoding.UTF8.GetString(DCItem.szResCode), imageIndex);
                    listItem.Tag = DCItem;
                }
                else
                {
                    for (int i = 1; i <= stSplitInfo.ulSplitScrMode; ++i)
                    {
                        int imageIndex;
                        if (1 == DCItem.ulResStatus)
                        {
                            imageIndex = 0;
                        }
                        else
                        {
                            imageIndex = 1;
                        }

                        ORG_RES_QUERY_ITEM_S dcTmp = new ORG_RES_QUERY_ITEM_S();
                        dcTmp.szResCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];

                        string strTmp = Encoding.UTF8.GetString(DCItem.szResCode);
                        strTmp = strTmp.TrimEnd('\0') + "!" + i.ToString();
                        ListViewItem listItem = listDC.Items.Add(strTmp, imageIndex);
                        Encoding.UTF8.GetBytes(strTmp).CopyTo(dcTmp.szResCode, 0);
                        listItem.Tag = dcTmp;
                    }
                }


            }
            
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            RefreshDClist();
        }

        private void btnPlay_Click(object sender, EventArgs e)
        {
            SubCtrl subCtrl1 = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];

            UInt32 ulRet = 0;
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }

            if (null == m_camCode)
            {
                return;
            }

            ORG_RES_QUERY_ITEM_S DCItem = (ORG_RES_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            string strTmp = Encoding.UTF8.GetString(DCItem.szResCode); 
            ulRet = IMOSSDK.IMOS_StartMonitor(ref subCtrl1.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(m_camCode), DCItem.szResCode, 0, 0);
            if (0 != ulRet)
            {
                //log.Info("开始实况失败，错误码为：" + ulRet.ToString());
                MessageBox.Show("开始实况失败，错误码为：" + ulRet.ToString());
                return;
            }
            else
            {
                MessageBox.Show("启动上墙成功！");
            }
            ListUserDC.Add(DCItem);
        }

        private void btnClose_Click(object sender, EventArgs e)
        {

            UInt32 ulRet = 0;
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }

            SubCtrl subCtrl1 = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];

            ORG_RES_QUERY_ITEM_S DCItem = (ORG_RES_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            ulRet = IMOSSDK.IMOS_StopMonitor(ref subCtrl1.sdkManager.stLoginInfo.stUserLoginIDInfo, DCItem.szResCode, 0);
            if (0 != ulRet)
            {
                //log.Info("停止实况失败，错误码为：" + ulRet.ToString());
                MessageBox.Show("停止实况失败，错误码为：" + ulRet.ToString());
            }
            ListUserDC.Remove(DCItem);
        }

        private void listDC_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
        {           
            if (listDC.SelectedItems.Count == 0)
            {
                lblDCStatus.Text = "";
                return;
            }

            ORG_RES_QUERY_ITEM_S DCItem = (ORG_RES_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            if (DCItem.ulResStatus == 2)
            {
                lblDCStatus.Text = "离线";
                return;
            }
        }
    }
}
