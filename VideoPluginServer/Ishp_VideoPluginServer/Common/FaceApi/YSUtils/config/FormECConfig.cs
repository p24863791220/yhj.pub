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
    public partial class FormECConfig : Form
    {
        public FormECConfig()
        {
            InitializeComponent();
        }

        public FormECConfig(string OrgCode)
        {
            InitializeComponent();
            this.Text = "添加编码器";
            IsAdd = true;
            InitECInfo(OrgCode);
        }

        public FormECConfig(string OrgCode, string ECCode)
        {
            InitializeComponent();
            this.Text = "编码器配置";
            IsAdd = false;
            InitECInfo(OrgCode, ECCode);     
        }

        EC_INFO_S stECInfo = new EC_INFO_S();

        private bool IsPasswordChange = false;

        private bool IsAdd = false;

        private UInt32 OldEncodeSet = 0;


        private void InitECInfo(string OrgCode)
        {
            stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1101_HF;
            cbDevType.SelectedIndex = 0;

            cbEncodeSet.Items.Clear();
            cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
            cbEncodeSet.Items.Add("H.264[主]");
            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
            cbEncodeSet.Items.Add("MPEG4[主]");
            cbEncodeSet.Items.Add("MPEG2[主]");
            stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
            cbEncodeSet.SelectedIndex = 1;

            cbStandard.Items.Clear();
            cbStandard.Items.Add("PAL");
            cbStandard.Items.Add("NTSC");
            stECInfo.ulStandard = 0;
            cbStandard.SelectedIndex = 0;

            cbAudioIn.Items.Clear();
            cbAudioIn.Items.Add("凤凰头L/R输入");
            cbAudioIn.Items.Add("MIC输入");
            stECInfo.ulAudioinSource = 1;
            cbAudioIn.SelectedIndex = 1;

            rbAlarmYes.Checked = true;
            rbAlarmNo.Checked = false;
            stECInfo.ulEnableAlarm = 1;

            rbMultiYes.Checked = true;
            rbMultiNo.Checked = false;
            stECInfo.ulIsMulticast = 1;

            tbHighTemp.Text = "50";
            stECInfo.lTemperatureMax = 50;
            tbLowTemp.Text = "0";
            stECInfo.lTemperatureMin = 0;

            stECInfo.szDevPasswd = Encoding.Default.GetBytes("");

            stECInfo.szOrgCode = Encoding.Default.GetBytes(OrgCode);
            stECInfo.ulChannum = 1;
            stECInfo.ulTimeSyncMode = 1;
            stECInfo.ulLanguage = 0;
            stECInfo.lTimeZone = 0;
            stECInfo.szECCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            stECInfo.szECName = new byte[IMOSSDK.IMOS_NAME_LEN];
            stECInfo.szECIPAddr = new byte[IMOSSDK.IMOS_IPADDR_LEN];
            stECInfo.szReserve = new byte[96];
            stECInfo.szDevPasswd = new byte[IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN];
            stECInfo.szDevDesc = new byte[IMOSSDK.IMOS_DESC_LEN];
            stECInfo.szAudioCommCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            stECInfo.szAudioBroadcastCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];

            IsPasswordChange = true;
        }

        private void InitECInfo(string OrgCode, string ECCode)
        {
            UInt32 ulRet = 0;

            IntPtr ptrECInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(EC_INFO_S)));

            ulRet = IMOSSDK.IMOS_QueryEcInfo(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(ECCode), ptrECInfo);
            if (0 != ulRet)
            {
                return;
            }

            stECInfo = (EC_INFO_S)Marshal.PtrToStructure(ptrECInfo, typeof(EC_INFO_S));
            OldEncodeSet = stECInfo.ulEncodeSet;
            switch (stECInfo.ulECType)
            {
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1101_HF:
                    cbDevType.SelectedIndex = 0;

                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
		            cbEncodeSet.Items.Add("MPEG4[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]");

                    cbStandard.Items.Clear();
		            cbStandard.Items.Add("PAL");
		            cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stECInfo.ulStandard;
            		
		            cbAudioIn.Items.Clear();
		            cbAudioIn.Items.Add("凤凰头L/R输入");
		            cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = (Int32)stECInfo.ulAudioinSource;
            	    break;
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1501_HF:
		            cbDevType.SelectedIndex = 1;
            		
		            cbEncodeSet.Items.Clear();
		            cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
		            cbEncodeSet.Items.Add("MPEG4[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]");
		            cbEncodeSet.Items.Add("H.264[主]+H.264[辅]");
            		
		            cbStandard.Items.Clear();
		            cbStandard.Items.Add("PAL");
		            cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stECInfo.ulStandard;
            		
		            cbAudioIn.Items.Clear();
		            cbAudioIn.Items.Add("凤凰头L/R输入");
		            cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = (Int32)stECInfo.ulAudioinSource;
		            break;
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC2004_HF:
		            cbDevType.SelectedIndex = 2;
            		
		            cbEncodeSet.Items.Clear();
		            cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
		            cbEncodeSet.Items.Add("MPEG4[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]");
            		
		            cbStandard.Items.Clear();
		            cbStandard.Items.Add("PAL");
		            cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stECInfo.ulStandard;
            		
		            cbAudioIn.Items.Clear();
		            cbAudioIn.Items.Add("凤凰头L/R输入");
		            cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = (Int32)stECInfo.ulAudioinSource;
		            break;
                case (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1102_HF:
		            cbDevType.SelectedIndex = 2;
            		
		            cbEncodeSet.Items.Clear();
		            cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
		            cbEncodeSet.Items.Add("MPEG4[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]");
		            cbEncodeSet.Items.Add("H.264[主]+H.264[辅]");
            		
		            cbStandard.Items.Clear();
		            cbStandard.Items.Add("PAL");
		            cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stECInfo.ulStandard;
            		
		            cbAudioIn.Items.Clear();
		            cbAudioIn.Items.Add("凤凰头L/R输入");
		            cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = (Int32)stECInfo.ulAudioinSource;
		            cbAudioIn.Enabled = false;
		            break;
                default:
		            cbDevType.SelectedIndex = 1;
            		
		            cbEncodeSet.Items.Clear();
		            cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
		            cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
		            cbEncodeSet.Items.Add("MPEG4[主]");
		            cbEncodeSet.Items.Add("MPEG2[主]");
            		
		            cbStandard.Items.Clear();
		            cbStandard.Items.Add("PAL");
		            cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = (Int32)stECInfo.ulStandard;
            		
		            cbAudioIn.Items.Clear();
		            cbAudioIn.Items.Add("凤凰头L/R输入");
		            cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = (Int32)stECInfo.ulAudioinSource;
		            break;
            }

            switch (stECInfo.ulEncodeSet)
	        {
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_MPEG4:
		            cbDevType.SelectedIndex = 0;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE:
		            cbDevType.SelectedIndex = 1;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_MPEG4:
		            cbDevType.SelectedIndex = 2;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_MJPEG:
		            cbDevType.SelectedIndex = 3;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_SHARE:
		            cbDevType.SelectedIndex = 4;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_SHARE:
		            cbDevType.SelectedIndex = 5;
		            break;
                case (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_H264:
		            cbDevType.SelectedIndex = 6;
		            break;
	            default:
		            cbDevType.SelectedIndex = 1;
		            break;
	        }

            tbDevName.Text = IMOSSDK.UTF8ToUnicode(stECInfo.szECName);
            tbDevCode.Text = IMOSSDK.UTF8ToUnicode(stECInfo.szECCode);
            if (1 == stECInfo.ulEnableAlarm)
            {
                rbAlarmYes.Checked = true;
                rbAlarmNo.Checked = false;
            }
            else
            {
                rbAlarmYes.Checked = false;
                rbAlarmNo.Checked = true;
            }

            if (1 == stECInfo.ulIsMulticast)
            {
                rbMultiYes.Checked = true;
                rbMultiNo.Checked = false;
            }
            else
            {
                rbMultiYes.Checked = false;
                rbMultiNo.Checked = true;
            }

            tbPassword.Text = IMOSSDK.UTF8ToUnicode(stECInfo.szDevPasswd);
            tbConfirm.Text = IMOSSDK.UTF8ToUnicode(stECInfo.szDevPasswd);
            tbHighTemp.Text = stECInfo.lTemperatureMax.ToString();
            tbLowTemp.Text = stECInfo.lTemperatureMin.ToString();
        }

        private void cbDevType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cbDevType.SelectedIndex)
            {
                case 0:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 1;
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stECInfo.ulStandard = 0;

                    cbAudioIn.Items.Clear();
                    cbAudioIn.Items.Add("凤凰头L/R输入");
                    cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = 0;
                    stECInfo.ulAudioinSource = 0;
                    cbAudioIn.Enabled = true;
                    stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1101_HF;
                    stECInfo.ulChannum = 1;
                    break;
                case 1:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.Items.Add("H.264[主]+H.264[辅]");
                    cbEncodeSet.SelectedIndex = 1;
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stECInfo.ulStandard = 0;

                    cbAudioIn.Items.Clear();
                    cbAudioIn.Items.Add("凤凰头L/R输入");
                    cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = 0;
                    stECInfo.ulAudioinSource = 0;
                    cbAudioIn.Enabled = true;
                    stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1501_HF;
                    stECInfo.ulChannum = 1;
                    break;
                case 2:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 1;
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stECInfo.ulStandard = 0;

                    cbAudioIn.Items.Clear();
                    cbAudioIn.Items.Add("凤凰头L/R输入");
                    cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = 0;
                    stECInfo.ulAudioinSource = 0;
                    cbAudioIn.Enabled = true;
                    stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC2004_HF;
                    stECInfo.ulChannum = 4;
                    break;
                case 3:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.Items.Add("H.264[主]+H.264[辅]");
                    cbEncodeSet.SelectedIndex = 1;
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stECInfo.ulStandard = 0;

                    cbAudioIn.Items.Clear();
                    cbAudioIn.Items.Add("凤凰头L/R输入");
                    cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = 0;
                    stECInfo.ulAudioinSource = 0;
                    cbAudioIn.Enabled = false;
                    stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1102_HF;
                    stECInfo.ulChannum = 2;
                    break;
                default:
                    cbEncodeSet.Items.Clear();
                    cbEncodeSet.Items.Add("MPEG4[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]+MPEG4[辅]");
                    cbEncodeSet.Items.Add("H.264[主]+MJPEG[辅]");
                    cbEncodeSet.Items.Add("MPEG4[主]");
                    cbEncodeSet.Items.Add("MPEG2[主]");
                    cbEncodeSet.SelectedIndex = 1;
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;

                    cbStandard.Items.Clear();
                    cbStandard.Items.Add("PAL");
                    cbStandard.Items.Add("NTSC");
                    cbStandard.SelectedIndex = 0;
                    stECInfo.ulStandard = 0;

                    cbAudioIn.Items.Clear();
                    cbAudioIn.Items.Add("凤凰头L/R输入");
                    cbAudioIn.Items.Add("MIC输入");
                    cbAudioIn.SelectedIndex = 0;
                    stECInfo.ulAudioinSource = 0;
                    cbAudioIn.Enabled = true;
                    stECInfo.ulECType = (UInt32)IMOS_DEVICE_TYPE_E.IMOS_DT_EC1101_HF;
                    stECInfo.ulChannum = 1;
                    break;
            }
        }

        private void cbEncodeSet_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cbEncodeSet.SelectedIndex)
            {
                case 0:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_MPEG4;
                    break;
                case 1:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
                    break;
                case 2:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_MPEG4;
                    break;
                case 3:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_MJPEG;
                    break;
                case 4:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG4_SHARE;
                    break;
                case 5:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_MPEG2_SHARE;
                    break;
                case 6:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_H264;
                    break;
                default:
                    stECInfo.ulEncodeSet = (UInt32)IMOS_STREAM_RELATION_SET_E.IMOS_SR_H264_SHARE;
                    break;
            }
        }

        private void cbStandard_SelectedIndexChanged(object sender, EventArgs e)
        {
            stECInfo.ulStandard = (UInt32)cbStandard.SelectedIndex;
        }

        private void cbAudioIn_SelectedIndexChanged(object sender, EventArgs e)
        {
            stECInfo.ulAudioinSource = (UInt32)cbAudioIn.SelectedIndex;
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

                Encoding.Default.GetBytes(MD_PWD, 0, MD_PWD.Length, stECInfo.szDevPasswd, 0);
            }

            
            if (IsAdd)
            {
                ulRet = IMOSSDK.IMOS_AddEc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stECInfo);
                if (0 != ulRet)
                {
                    return;
                }
            }
            else
            {   
                UInt32 IsEncodeChange = 0;
                if (OldEncodeSet == stECInfo.ulEncodeSet)
                {
                    IsEncodeChange = 0;
                }
                else
                {
                    IsEncodeChange = 1;
                }
                ulRet = IMOSSDK.IMOS_ModifyEc(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stECInfo, IsEncodeChange);
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
            Encoding.UTF8.GetBytes(strDevName, 0, strDevName.Length, stECInfo.szECName, 0);
        }

        private void tbDevCode_TextChanged(object sender, EventArgs e)
        {
            Encoding.Default.GetBytes(tbDevCode.Text, 0, tbDevCode.TextLength, stECInfo.szECCode, 0);
        }

        private void tbHighTemp_TextChanged(object sender, EventArgs e)
        {
            Int32.TryParse(tbHighTemp.Text, out stECInfo.lTemperatureMax);        
        }

        private void tbLowTemp_TextChanged(object sender, EventArgs e)
        {
            Int32.TryParse(tbLowTemp.Text, out stECInfo.lTemperatureMin);
        }

        private void rbMultiYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMultiYes.Checked == true)
            {
                rbMultiNo.Checked = false;
                stECInfo.ulIsMulticast = 1;
            }
        }

        private void rbMultiNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMultiNo.Checked == true)
            {
                rbMultiYes.Checked = false;
                stECInfo.ulIsMulticast = 0;
            }
        }

        private void rbAlarmYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbAlarmYes.Checked == true)
            {
                rbAlarmNo.Checked = false;
                stECInfo.ulEnableAlarm = 1;
            }
        }

        private void rbAlarmNo_CheckedChanged(object sender, EventArgs e)
        {
            if (rbAlarmNo.Checked == true)
            {
                rbAlarmYes.Checked = false;
                stECInfo.ulEnableAlarm = 0;
            }
        }

    }
}
