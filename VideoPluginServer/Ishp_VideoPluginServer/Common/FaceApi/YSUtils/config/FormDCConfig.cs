using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using IMOS_SDK_DEMO.sdk;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.config
{
    public partial class FormDCConfig : Form
    {
        public FormDCConfig()
        {
            InitializeComponent();
        }

        public FormDCConfig(string OrgCode)
        {
            InitializeComponent();
            this.Text = "添加解码器";
            IsAdd = true;
            InitDCInfo(OrgCode);
        }

        DC_INFO_S stDCInfo = new DC_INFO_S();

        private bool IsPasswordChange = false;

        private bool IsAdd = false;

        private UInt32 OldEncodeSet = 0;

        public FormDCConfig(string OrgCode, string DCCode)
        {
            InitializeComponent();
            this.Text = "解码器配置";
            IsAdd = false;
            InitDCInfo(OrgCode, DCCode);
        }

        private void InitDCInfo(string OrgCode)
        {
            stDCInfo.ulDCType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1001_FF;
            cbDevType.SelectedIndex = 0;

            cbEncodeSet.Items.Clear();
            cbEncodeSet.Items.Add("H.264");
            cbEncodeSet.Items.Add("MPEG4[主]");
            cbEncodeSet.Items.Add("MPEG2[主]");
            stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
            cbEncodeSet.SelectedIndex = 0;

            cbStandard.Items.Clear();
            cbStandard.Items.Add("PAL");
            cbStandard.Items.Add("NTSC");
            stDCInfo.ulStandard = 0;
            cbStandard.SelectedIndex = 0;

            rbAlarmYes.Checked = true;
            rbAlarmNo.Checked = false;
            stDCInfo.ulEnableAlarm = 1;

            rbMultiYes.Checked = true;
            rbMultiNo.Checked = false;
            stDCInfo.ulIsMulticast = 1;

            tbHighTemp.Text = "50";
            stDCInfo.lTemperatureMax = 50;
            tbLowTemp.Text = "0";
            stDCInfo.lTemperatureMin = 0;

            stDCInfo.szOrgCode = Encoding.Default.GetBytes(OrgCode);
            stDCInfo.szDevPasswd = Encoding.Default.GetBytes(""); ;
            stDCInfo.ulChannum = 1;
            stDCInfo.ulTimeSyncMode = 1;
            stDCInfo.ulLanguage = 0;
            stDCInfo.lTimeZone = 0;
            stDCInfo.szDCCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            stDCInfo.szDCName = new byte[IMOSSDK.IMOS_NAME_LEN];
            stDCInfo.szDCIPAddr = new byte[IMOSSDK.IMOS_IPADDR_LEN];
            stDCInfo.szReserve = new byte[96];
            stDCInfo.szDevPasswd = new byte[IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN];
            stDCInfo.szDevDesc = new byte[IMOSSDK.IMOS_DESC_LEN];

            IsPasswordChange = true;

        }

        private void InitDCInfo(string OrgCode, string DCCode)
        {
            UInt32 ulRet = 0;

            IntPtr ptrDCInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(DC_INFO_S)));

            ulRet = IMOSSDK.IMOS_QueryDcInfo(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(DCCode), ptrDCInfo);
            if (0 != ulRet)
            {
                return;
            }

            stDCInfo = (DC_INFO_S)Marshal.PtrToStructure(ptrDCInfo, typeof(DC_INFO_S));
            OldEncodeSet = stDCInfo.ulEncodeSet;
            switch (stDCInfo.ulDCType)
            {
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1001_FF:
                    cbDevType.SelectedIndex = 0;

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stDCInfo.ulStandard;
                    break;
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC2004_FF:
                    cbDevType.SelectedIndex = 1;

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]"); ;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("720P@60");
                    cbStandard.Items.Add("1080I@50");
                    cbStandard.Items.Add("1080I@60");
                    cbStandard.Items.Add("1080P@25");
                    cbStandard.Items.Add("1080P@30");
                    cbStandard.SelectedIndex = (Int32)stDCInfo.ulStandard;
                    break;
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1801_FH:
                    cbDevType.SelectedIndex = 2;

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]"); ;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("720P@60");
                    cbStandard.Items.Add("1080I@50");
                    cbStandard.Items.Add("1080I@60");
                    cbStandard.Items.Add("1080P@25");
                    cbStandard.Items.Add("1080P@30");
                    switch (stDCInfo.ulStandard)
                    {
                        case (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_720P60HZ:
                            cbStandard.SelectedIndex = 0;
                            break;
                        case (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080I50HZ:
                            cbStandard.SelectedIndex = 1;
                            break;
                        case (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080I60HZ:
                            cbStandard.SelectedIndex = 2;
                            break;
                        case (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P25HZ:
                            cbStandard.SelectedIndex = 3;
                            break;
                        case (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P30HZ:
                            cbStandard.SelectedIndex = 4;
                            break;
                        default:
                            cbStandard.SelectedIndex = 5;
                            break;
                    }
                    break;
                
                default:
                    cbDevType.SelectedIndex = 0;

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stDCInfo.ulStandard;
                    break;
            }

            switch (stDCInfo.ulEncodeSet)
            {
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE:
                    cbDevType.SelectedIndex = 0;
                    break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_SHARE:
                    cbDevType.SelectedIndex = 1;
                    break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_SHARE:
                    cbDevType.SelectedIndex = 2;
                    break;
                default:
                    cbDevType.SelectedIndex = 0;
                    break;
            }

            tbDevName.Text = IMOSSDK.UTF8ToUnicode(stDCInfo.szDCName);
            tbDevCode.Text = IMOSSDK.UTF8ToUnicode(stDCInfo.szDCCode);
            if (1 == stDCInfo.ulEnableAlarm)
            {
                rbAlarmYes.Checked = true;
                rbAlarmNo.Checked = false;
            }
            else
            {
                rbAlarmYes.Checked = false;
                rbAlarmNo.Checked = true;
            }

            if (1 == stDCInfo.ulIsMulticast)
            {
                rbMultiYes.Checked = true;
                rbMultiNo.Checked = false;
            }
            else
            {
                rbMultiYes.Checked = false;
                rbMultiNo.Checked = true;
            }

            tbPassword.Text = IMOSSDK.UTF8ToUnicode(stDCInfo.szDevPasswd);
            tbConfirm.Text = IMOSSDK.UTF8ToUnicode(stDCInfo.szDevPasswd);
            tbHighTemp.Text = stDCInfo.lTemperatureMax.ToString();
            tbLowTemp.Text = stDCInfo.lTemperatureMin.ToString();
        }

        private void cbDevType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cbDevType.SelectedIndex)
            {
                case 0:

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 0;
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_PAL;

                    stDCInfo.ulDCType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1001_FF;
                    stDCInfo.ulChannum = 1;
                    break;
                case 1:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 0;
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_PAL;

                    stDCInfo.ulDCType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC2004_FF;
                    stDCInfo.ulChannum = 4;
                    break;
                case 2:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 0;
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("720P@60");
                    cbStandard.Items.Add("1080I@50");
                    cbStandard.Items.Add("1080I@60");
                    cbStandard.Items.Add("1080P@25");
                    cbStandard.Items.Add("1080P@30");
                    cbStandard.SelectedIndex = 3;
                    stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P25HZ;

                    stDCInfo.ulDCType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1801_FH;
                    stDCInfo.ulChannum = 1;

                    break;
                default:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("H.264");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 0;
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_PAL;

                    stDCInfo.ulDCType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1001_FF;
                    stDCInfo.ulChannum = 1;
                    break;
            }
        }

        private void cbEncodeSet_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cbEncodeSet.SelectedIndex)
            {
                case 0:
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
                    break;
                case 1:
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_SHARE;
                    break;
                case 2:
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_SHARE;
                    break;
                default:
                    stDCInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
                    break;
            }
        }

        private void cbStandard_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_DC1801_FH == stDCInfo.ulDCType)
            {
                switch (cbStandard.SelectedIndex)
                {
                    case 0:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_720P60HZ;
                        break;
                    case 1:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080I50HZ;
                        break;
                    case 2:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080I60HZ;
                        break;
                    case 3:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P25HZ;
                        break;
                    case 4:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P30HZ;
                        break;
                    default:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_1080P25HZ;
                        break;
                }
            }
            else
            {
                switch (cbStandard.SelectedIndex)
                {
                    case 0:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_PAL;
                        break;
                    case 1:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_NTSC;
                        break;
                    default:
                        stDCInfo.ulStandard = (UInt32)IMOS_PICTURE_FORMAT_E.IMOS_PF_PAL;
                        break;
                }
            }
        }

        private void btOk_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;

            if (0 == tbDevCode.TextLength || 0 == tbDevName.TextLength)
            {
                return;
            }

            if (tbPassword.Text != tbConfirm.Text)
            {
                return;
            }

            if (IsPasswordChange)
            {
                IntPtr ptr_MD_Pwd = Marshal.AllocHGlobal(sizeof(char) * IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN);

                ulRet = IMOSSDK.IMOS_Encrypt(tbPassword.Text, (UInt32)tbPassword.TextLength, ptr_MD_Pwd);
                if (0 != ulRet)
                {
                    MessageBox.Show("IMOS_Encrypt" + ulRet.ToString());
                    Application.Exit();
                    return;

                }

                String MD_PWD = Marshal.PtrToStringAnsi(ptr_MD_Pwd);
                Marshal.FreeHGlobal(ptr_MD_Pwd);

                Encoding.Default.GetBytes(MD_PWD, 0, MD_PWD.Length, stDCInfo.szDevPasswd, 0);
            }

           
            if (IsAdd)
            {
                ulRet = IMOSSDK.IMOS_AddDc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stDCInfo);
                if (0 != ulRet)
                {
                    return;
                }
            }
            else
            {
                UInt32 IsEncodeChange = 0;
                if (OldEncodeSet == stDCInfo.ulEncodeSet)
                {
                    IsEncodeChange = 0;
                }
                else
                {
                    IsEncodeChange = 1;
                }
                ulRet = IMOSSDK.IMOS_ModifyDc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stDCInfo, IsEncodeChange);
                if (0 == ulRet)
                {
                    return;
                }
            }
            this.Close();
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tbDevName_TextChanged(object sender, EventArgs e)
        {
            string strDevName = Encoding.UTF8.GetString(IMOSSDK.UnicodeToUTF8(tbDevName.Text));
            Encoding.UTF8.GetBytes(strDevName, 0, strDevName.Length, stDCInfo.szDCName, 0);
        }

        private void tbDevCode_TextChanged(object sender, EventArgs e)
        {
            Encoding.Default.GetBytes(tbDevCode.Text, 0, tbDevCode.TextLength, stDCInfo.szDCCode, 0);
        }

        private void tbHighTemp_TextChanged(object sender, EventArgs e)
        {
            Int32.TryParse(tbHighTemp.Text, out stDCInfo.lTemperatureMax);
        }

        private void tbLowTemp_TextChanged(object sender, EventArgs e)
        {
            Int32.TryParse(tbLowTemp.Text, out stDCInfo.lTemperatureMin);
        }

        private void tbPassword_TextChanged(object sender, EventArgs e)
        {
            IsPasswordChange = true;
        }

        private void tbConfirm_TextChanged(object sender, EventArgs e)
        {
            IsPasswordChange = true;
        }

        private void rbMultiYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMultiYes.Checked == true)
            {
                rbMultiNo.Checked = false;
                stDCInfo.ulIsMulticast = 1;
            }
        }

        private void rbMultiNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMultiNo.Checked == true)
            {
                rbMultiYes.Checked = false;
                stDCInfo.ulIsMulticast = 0;
            }
        }

        private void rbAlarmYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbAlarmYes.Checked == true)
            {
                rbAlarmNo.Checked = false;
                stDCInfo.ulEnableAlarm = 1;
            }
        }

        private void rbAlarmNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rbAlarmNo.Checked == true)
            {
                rbAlarmYes.Checked = false;
                stDCInfo.ulEnableAlarm = 0;
            }
        }



    }
}
