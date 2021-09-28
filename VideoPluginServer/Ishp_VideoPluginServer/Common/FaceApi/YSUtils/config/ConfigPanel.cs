using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Runtime.InteropServices;
using IMOS_SDK_DEMO.sdk;
using System.Windows.Forms;
//using log4net;

namespace IMOS_SDK_DEMO.config
{
    public partial class ConfigPanel : UserControl
    {
        /// <summary>
        /// 日志记录
        /// </summary>
        //private ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        
        public ConfigPanel()
        {
            InitializeComponent();
        }

        private string m_OrgCode;

        private string GetDevType(UInt32 ulDevType)
        {
            switch (ulDevType)
            {
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1101_HF:
                    return "EC1101_HF";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1501_HF:
		            return "EC1501_HF";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1102_HF:	
		            return "EC1102_HF";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1801_HH:
		            return "EC1801_HH";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC2004_HF:
		            return "EC2004_HF";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1001_FF:
		            return "DC1001_HF";
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC2004_FF:
		            return "DC2004_FF";
	            default:
		            return "未知";
            }
        }

        private string GetOnlineStatus(UInt32 ulStatus)
        {
            switch (ulStatus)
            {
                case (UInt32)IMOSSDK.IMOS_DEV_STATUS_ONLINE:
		            return "在线";
                case (UInt32)IMOSSDK.IMOS_DEV_STATUS_OFFLINE:
		            return "离线";
	            default:
		            return "未知";
            }
        }

        private string GetCameraType(UInt32 ulCameraType)
        {
            switch (ulCameraType)
            {
                case 1:
                    return "固定摄像机";
                case 2:
                    return "云台摄像机";
                default:
                    return "未知";
            }
        }

        private string GetPTZProtocol(Int32 index)
        {
            switch (index)
            {
                case 0:
                    return "PELCO-D";
                case 1:
                    return "PELCO-P";
                case 2:
                    return "ALEC";
                case 3:
                    return "VISCA";
                case 4:
                    return "ALEC_PELCO-D";
                case 5:
                    return "ALEC_PELCO-P";
                case 6:
                    return "MINKING_PELCO-D";
                case 7:
                    return "MINKING_PELCO-P";
                default:
                    return "未知";
            }
        }

       

        public void RefreshEClist(string OrgCode)
        {
            listEC.Items.Clear();
            m_OrgCode = OrgCode;

            List<EC_QUERY_ITEM_S> list = QueryResource. GetECList(OrgCode);
            if (null == list)
            {
                return;
            }

            foreach (EC_QUERY_ITEM_S ECItem in list)
            {
                ListViewItem listItem = listEC.Items.Add(IMOSSDK.UTF8ToUnicode(ECItem.szECName));
                listItem.Tag = ECItem;
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(ECItem.szECCode));
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(ECItem.szDevAddr));
                listItem.SubItems.Add(GetDevType(ECItem.ulECType));
                listItem.SubItems.Add(GetOnlineStatus(ECItem.ulIsOnline));
            }
        }

       

        public void RefreshDClist(string OrgCode)
        {
            listDC.Items.Clear();
            m_OrgCode = OrgCode;

            List<DC_QUERY_ITEM_S> list = QueryResource.GetDCList(OrgCode);
            if (null == list)
            {
                return;
            }

            foreach (DC_QUERY_ITEM_S DCItem in list)
            {
                ListViewItem listItem = listDC.Items.Add(IMOSSDK.UTF8ToUnicode(DCItem.szDCName));
                listItem.Tag = DCItem;
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(DCItem.szDCCode));
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(DCItem.szDevAddr));
                listItem.SubItems.Add(GetDevType(DCItem.ulDCType));
                listItem.SubItems.Add(GetOnlineStatus(DCItem.ulIsOnline));
            }
        }

       

        public void RefreshECChanelList(string ECCode)
        {
            listECChanel.Items.Clear();

            List<CAM_AND_CHANNEL_QUERY_ITEM_S> list = QueryResource.GetECChanelList(ECCode);

            if (null == list)
            {
                return;
            }

            foreach (CAM_AND_CHANNEL_QUERY_ITEM_S ChanelItem in list)
            {
                ListViewItem listItem = listECChanel.Items.Add(ChanelItem.stECChannelIndex.ulChannelIndex.ToString());
                listItem.Tag = ChanelItem;
                Int32 ptzIndex;
                Int32.TryParse(IMOSSDK.UTF8ToUnicode(ChanelItem.szPtzProtocol), out ptzIndex);
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(ChanelItem.szCamName));
                listItem.SubItems.Add(GetCameraType(ChanelItem.ulCamType));
                listItem.SubItems.Add(GetPTZProtocol(ptzIndex));
                listItem.SubItems.Add(ChanelItem.ulPtzAddrCode.ToString());
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(ChanelItem.szMulticastAddr));
                listItem.SubItems.Add(ChanelItem.ulMulticastPort.ToString());
            }

        }

      

        public void RefreshDCChanelList(string DCCode)
        {
            listDCChanel.Items.Clear();

            List<SCR_AND_CHANNEL_QUERY_ITEM_S> list = QueryResource.GetDCChanelList(DCCode);

            if (null == list)
            {
                return;
            }

            foreach (SCR_AND_CHANNEL_QUERY_ITEM_S ChanelItem in list)
            {
                ListViewItem listItem = listDCChanel.Items.Add(ChanelItem.stDCChannelIndex.ulChannelIndex.ToString());
                listItem.Tag = ChanelItem;
                listItem.SubItems.Add(IMOSSDK.UTF8ToUnicode(ChanelItem.szScrName));
            }
        }

     

      


        private void btnRefEC_Click(object sender, EventArgs e)
        {
            RefreshEClist(m_OrgCode);
        }

        private void listEC_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (0 == listEC.SelectedItems.Count)
            {
                return;
            }
            EC_QUERY_ITEM_S ECItem = (EC_QUERY_ITEM_S)listEC.SelectedItems[0].Tag;
            RefreshECChanelList(Encoding.Default.GetString(ECItem.szECCode));
        }

        private void listDC_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }
            DC_QUERY_ITEM_S DCItem = (DC_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            RefreshDCChanelList(Encoding.Default.GetString(DCItem.szDCCode));
        }

        private void btnRefDC_Click(object sender, EventArgs e)
        {
            RefreshDClist(m_OrgCode);
        }

        private void btnRefDCChanel_Click(object sender, EventArgs e)
        {
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }
            DC_QUERY_ITEM_S DCItem = (DC_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            RefreshDCChanelList(Encoding.Default.GetString(DCItem.szDCCode));
        }

        private void btnRefECChanel_Click(object sender, EventArgs e)
        {
            if (0 == listEC.SelectedItems.Count)
            {
                return;
            }
            EC_QUERY_ITEM_S ECItem = (EC_QUERY_ITEM_S)listEC.SelectedItems[0].Tag;
            RefreshECChanelList(Encoding.Default.GetString(ECItem.szECCode));
        }

        private void btnAddEC_Click(object sender, EventArgs e)
        {
            if (null == m_OrgCode)
            {
                return;
            }
            FormECConfig frmECConfig = new FormECConfig(m_OrgCode);
            frmECConfig.ShowDialog();
            RefreshEClist(m_OrgCode);
        }

        private void btnEditEC_Click(object sender, EventArgs e)
        {
            if (0 == listEC.SelectedItems.Count)
            {
                return;
            }
            EC_QUERY_ITEM_S ECItem = (EC_QUERY_ITEM_S)listEC.SelectedItems[0].Tag;

            FormECConfig frmECConfig = new FormECConfig(m_OrgCode, Encoding.Default.GetString(ECItem.szECCode));
            frmECConfig.ShowDialog();
        }

        private void btnAddDC_Click(object sender, EventArgs e)
        {
            if (null == m_OrgCode)
            {
                return;
            }
            FormDCConfig frmDCConfig = new FormDCConfig(m_OrgCode);
            frmDCConfig.ShowDialog();
            RefreshDClist(m_OrgCode);
        }

        private void btnEditDC_Click(object sender, EventArgs e)
        {
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }
            DC_QUERY_ITEM_S DCItem = (DC_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;

            FormDCConfig frmDCConfig = new FormDCConfig(m_OrgCode,Encoding.Default.GetString(DCItem.szDCCode));
            frmDCConfig.ShowDialog();
        }

        private void btnDelEC_Click(object sender, EventArgs e)
        {
            if (0 == listEC.SelectedItems.Count)
            {
                return;
            }
            EC_QUERY_ITEM_S ECItem = (EC_QUERY_ITEM_S)listEC.SelectedItems[0].Tag;
            QueryResource.DeleteEC(ECItem.szECCode);
            RefreshEClist(m_OrgCode);
        }

        private void btnDelDC_Click(object sender, EventArgs e)
        {
            if (0 == listDC.SelectedItems.Count)
            {
                return;
            }
            DC_QUERY_ITEM_S DCItem = (DC_QUERY_ITEM_S)listDC.SelectedItems[0].Tag;
            QueryResource.DeleteDC(DCItem.szDCCode);
            RefreshDClist(m_OrgCode);
        }

        private void btnEditECChanel_Click(object sender, EventArgs e)
        {
            if (0 == listECChanel.SelectedItems.Count)
            {
                return;
            }
            CAM_AND_CHANNEL_QUERY_ITEM_S ECChannelItem = (CAM_AND_CHANNEL_QUERY_ITEM_S)listECChanel.SelectedItems[0].Tag;
            if (ECChannelItem.szCamCode[0] == 0)
            {
                return;
            }
            FormECChannelConfig frmECChannelConfig = new FormECChannelConfig(ref ECChannelItem.stECChannelIndex, Encoding.Default.GetString(ECChannelItem.szCamCode));
            frmECChannelConfig.ShowDialog();
        }
    }
}
