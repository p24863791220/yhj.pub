using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.config
{
    public partial class FormECChannelConfig : Form
    {
        private bool m_isAdd = false;
        
        private VINCHNL_BIND_CAMERA_S m_stVinChnlBindCamera = new VINCHNL_BIND_CAMERA_S();
        private DEV_CHANNEL_INDEX_S m_stChannelIndex = new DEV_CHANNEL_INDEX_S();

        
        public FormECChannelConfig()
        {
            InitializeComponent();
        }

        public FormECChannelConfig(ref DEV_CHANNEL_INDEX_S stChannelIndex)
        {
            InitializeComponent();
            m_isAdd = true;
        }

        public FormECChannelConfig(ref DEV_CHANNEL_INDEX_S stChannelIndex, string cameraCode)
        {
            InitializeComponent();

            UInt32 ulRet = 0;
            m_isAdd = false;
            m_stChannelIndex = stChannelIndex;
            m_stVinChnlBindCamera.astVideoStream = new VIDEO_STREAM_S[2];
            m_stVinChnlBindCamera.stOSDInfo.astOSDName = new OSD_NAME_S[1];
            m_stVinChnlBindCamera.stOSDInfo.stOSDMaskArea.astMaskArea = new VIDEO_AREA_S[4];
            m_stVinChnlBindCamera.stDetectArea.astCoverDetecArea = new VIDEO_AREA_S[4];
            m_stVinChnlBindCamera.stDetectArea.astMotionDetecArea = new VIDEO_AREA_S[4];

            IntPtr ptrCameraInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(CAMERA_INFO_S)));
            ulRet = IMOSSDK.IMOS_QueryCamera(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(cameraCode), ptrCameraInfo);
            if (0 != ulRet)
            {
                return;
            }
            m_stVinChnlBindCamera.stCameraInfo = (CAMERA_INFO_S)Marshal.PtrToStructure(ptrCameraInfo, typeof(CAMERA_INFO_S));
            Marshal.FreeHGlobal(ptrCameraInfo);

            IntPtr ptrVideoInChannelInfo = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(VIN_CHANNEL_S)));
            ulRet = IMOSSDK.IMOS_QueryECVideoInChannel(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrVideoInChannelInfo);
            if (0 != ulRet)
            {
                return;
            }
            m_stVinChnlBindCamera.stVinChannel = (VIN_CHANNEL_S)Marshal.PtrToStructure(ptrVideoInChannelInfo, typeof(VIN_CHANNEL_S));
            Marshal.FreeHGlobal(ptrVideoInChannelInfo);

            Int32 ulStreamNum = 2;
            IntPtr ptrVideoStreamInfo = Marshal.AllocHGlobal((Marshal.SizeOf(typeof(VIDEO_STREAM_S))) * ulStreamNum);
            IntPtr ptrStreamNum = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(UInt32)));
            Marshal.WriteInt32(ptrStreamNum, ulStreamNum);
            ulRet = IMOSSDK.IMOS_QueryECVideoStream(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrStreamNum, ptrVideoStreamInfo);
            if (0 != ulRet)
            {
                return;
            }
            ulStreamNum = Marshal.ReadInt32(ptrStreamNum);
            for (int i = 0; i < ulStreamNum; ++i)
            {
                IntPtr ptrTemp = IntPtr.Zero;
                if (SdkManager.Is64Bit)
                {
                    ptrTemp = new IntPtr(ptrVideoStreamInfo.ToInt64() + i * Marshal.SizeOf(typeof(VIDEO_STREAM_S)));
                }
                else
                {
                    ptrTemp = new IntPtr(ptrVideoStreamInfo.ToInt32() + i * Marshal.SizeOf(typeof(VIDEO_STREAM_S)));
                }

                m_stVinChnlBindCamera.astVideoStream[i] = (VIDEO_STREAM_S)Marshal.PtrToStructure(ptrTemp, typeof(VIDEO_STREAM_S));
            }

            IntPtr ptrOSDTime = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(OSD_TIME_S)));
            ulRet = IMOSSDK.IMOS_QueryDeviceTimeOSD(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrOSDTime);
            if (0 != ulRet)
            {
                return;
            }
            m_stVinChnlBindCamera.stOSDInfo.stOSDTime = (OSD_TIME_S)Marshal.PtrToStructure(ptrOSDTime, typeof(OSD_TIME_S));

            Int32 ulNameOSDNum = 1;
            IntPtr ptrNameOSDNum = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(UInt32)));
            Marshal.WriteInt32(ptrNameOSDNum, ulNameOSDNum);
            IntPtr ptrOSDName = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(OSD_NAME_S)));
            ulRet = IMOSSDK.IMOS_QueryDeviceNameOSD(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrNameOSDNum, ptrOSDName);
            if (0 != ulRet)
            {
                return;
            }
            m_stVinChnlBindCamera.stOSDInfo.astOSDName[0] = (OSD_NAME_S)Marshal.PtrToStructure(ptrOSDName, typeof(OSD_NAME_S));

            Int32 ulMaskAreaNum = 4;
            IntPtr ptrMaskArea = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(VIDEO_AREA_S)) * ulMaskAreaNum);
            IntPtr ptrMaskAreaNum = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(UInt32)));
            Marshal.WriteInt32(ptrMaskAreaNum, ulMaskAreaNum);
            ulRet = IMOSSDK.IMOS_QueryECMaskAreaOSD(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrMaskAreaNum, ptrMaskArea);
            if (0 != ulRet)
            {
                return;
            }
            for (int i = 0; i < ulMaskAreaNum; ++i)
            {
                IntPtr ptrTemp = IntPtr.Zero;
                if (SdkManager.Is64Bit)
                {
                    ptrTemp = new IntPtr(ptrMaskArea.ToInt64() + i * Marshal.SizeOf(typeof(VIDEO_AREA_S)));
                }
                else
                {
                    ptrTemp = new IntPtr(ptrMaskArea.ToInt32() + i * Marshal.SizeOf(typeof(VIDEO_AREA_S)));
                }
                m_stVinChnlBindCamera.stOSDInfo.stOSDMaskArea.astMaskArea[i] = (VIDEO_AREA_S)Marshal.PtrToStructure(ptrTemp, typeof(VIDEO_AREA_S));
            }

            Int32 ulMotionAreaNum = 4;
            IntPtr ptrMotionArea = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(VIDEO_AREA_S)) * ulMotionAreaNum);
            IntPtr ptrMotionAreaNum = Marshal.AllocHGlobal(Marshal.SizeOf(typeof(UInt32)));
            Marshal.WriteInt32(ptrMotionAreaNum, ulMotionAreaNum);
            ulRet = IMOSSDK.IMOS_QueryECMotionDetectArea(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref stChannelIndex, ptrMotionAreaNum, ptrMotionArea);
            if (0 != ulRet)
            {
                return;
            }

            for (int i = 0; i < ulMotionAreaNum; ++i)
            {
                IntPtr ptrTemp = IntPtr.Zero;
                if (SdkManager.Is64Bit)
                {
                    ptrTemp = new IntPtr(ptrMotionArea.ToInt64() + i * Marshal.SizeOf(typeof(VIDEO_AREA_S)));
                }
                else
                {
                    ptrTemp = new IntPtr(ptrMotionArea.ToInt32() + i * Marshal.SizeOf(typeof(VIDEO_AREA_S)));
                }
                m_stVinChnlBindCamera.stDetectArea.astMotionDetecArea[i] = (VIDEO_AREA_S)Marshal.PtrToStructure(ptrTemp, typeof(VIDEO_AREA_S));
            }

            //基本信息
            tbCameraName.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stCameraInfo.szCameraName);
            tbCameraCode.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stCameraInfo.szCameraCode);
            cbCameraType.SelectedIndex = (Int32)m_stVinChnlBindCamera.stCameraInfo.ulCameraType - 1;
            tbLongitude.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stCameraInfo.szLongitude);
            tbLatitude.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stCameraInfo.szLatitude);
            Int32 ptzIndex;
            Int32.TryParse(IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stCameraInfo.szPtzProtocol), out ptzIndex);
            cbPTZProtocol.SelectedIndex = ptzIndex;
            tbPTZAddrCode.Text = m_stVinChnlBindCamera.stCameraInfo.ulPtzAddrCode.ToString();
            cbPTZProtocol.Text = m_stVinChnlBindCamera.stCameraInfo.ulPtzTranslateMode.ToString();

            tbMCIP.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stVinChannel.szMulticastAddr);
            tbMCPort.Text = m_stVinChnlBindCamera.stVinChannel.ulMulticastPort.ToString();

            if (0 == m_stVinChnlBindCamera.stVinChannel.ulAudioEnabled)
            {
                rbMuteYes.Checked = true;
                rbMuteNo.Checked = false;
            }
            else
            {
                rbMuteYes.Checked = false;
                rbMuteNo.Checked = true;
            }
            cbAudoTrack.SelectedIndex = (Int32)m_stVinChnlBindCamera.stVinChannel.ulAudioTrack;
            cbAudioEncode.SelectedIndex = (Int32)m_stVinChnlBindCamera.stVinChannel.ulAudioCoding;
            cbAudioBiteRate.Text = m_stVinChnlBindCamera.stVinChannel.ulAudioCodeRate.ToString();
            cbAudioSampling.SelectedIndex = (Int32)m_stVinChnlBindCamera.stVinChannel.ulSamplingRate;
            tbAudioIncrement.Text = m_stVinChnlBindCamera.stVinChannel.ulIncrement.ToString();

            if (0 == m_stVinChnlBindCamera.stVinChannel.ulEnableMotionDetect)
            {
                rbMotionYes.Checked = false;
                rbMotionNo.Checked = true;
            }
            else
            {
                rbMotionYes.Checked = true;
                rbMotionNo.Checked = false;
            }
            tbBrightness.Text = m_stVinChnlBindCamera.stVinChannel.ulBrightness.ToString();
            tbContrast.Text = m_stVinChnlBindCamera.stVinChannel.ulContrast.ToString();
            tbSaturation.Text = m_stVinChnlBindCamera.stVinChannel.ulSaturation.ToString();
            tbTone.Text = m_stVinChnlBindCamera.stVinChannel.ulTone.ToString();

            //码流配置
            VIDEO_STREAM_S stMasterStream = new VIDEO_STREAM_S();
            VIDEO_STREAM_S stSecondStream = new VIDEO_STREAM_S();
            if (1 == m_stVinChnlBindCamera.astVideoStream[0].ulStreamIndex)
            {
                stMasterStream = m_stVinChnlBindCamera.astVideoStream[0];
            }
            else if (2 == m_stVinChnlBindCamera.astVideoStream[0].ulStreamIndex)
            {
                stSecondStream = m_stVinChnlBindCamera.astVideoStream[0];
            }

            if (1 == m_stVinChnlBindCamera.astVideoStream[1].ulStreamIndex)
            {
                stMasterStream = m_stVinChnlBindCamera.astVideoStream[1];
            }
            else if (2 == m_stVinChnlBindCamera.astVideoStream[1].ulStreamIndex)
            {
                stSecondStream = m_stVinChnlBindCamera.astVideoStream[1];
            }

            //主码流
            if (0 == stMasterStream.ulEnabledFlag)
            {
                rbEncodeYes.Checked = false;
                rbEncodeNo.Checked = true;
            }
            else
            {
                rbEncodeYes.Checked = true;
                rbEncodeNo.Checked = false;
            }
            cbEncodeFormat.SelectedIndex = (Int32)stMasterStream.ulEncodeFormat;
            cbStreamType.SelectedIndex = (Int32)stMasterStream.ulStreamType;
            cbEncodeMode.SelectedIndex = (Int32)stMasterStream.ulEncodeMode;
            cbTranType.SelectedIndex = (Int32)stMasterStream.ulTranType;
            cbFrameRate.Text = stMasterStream.ulFrameRate.ToString();
            cbPriority.SelectedIndex = (Int32)stMasterStream.ulPriority;
            cbResolution.SelectedIndex = (Int32)stMasterStream.ulResolution;
            tbBitRate.Text = stMasterStream.ulBitRate.ToString();
            cbImageQuality.SelectedIndex = (Int32)stMasterStream.ulImageQuality;
            tbIFrameInterval.Text = stMasterStream.ulIFrameInterval.ToString();
            cbGopMode.SelectedIndex = (Int32)stMasterStream.ulGopMode;

            //辅码流
            if (0 == stSecondStream.ulEnabledFlag)
            {
                rbEncodeYesS.Checked = false;
                rbEncodeNoS.Checked = true;
            }
            else
            {
                rbEncodeYesS.Checked = true;
                rbEncodeNoS.Checked = false;
            }
            cbEncodeFormatS.SelectedIndex = (Int32)stSecondStream.ulEncodeFormat;
            cbStreamTypeS.SelectedIndex = (Int32)stSecondStream.ulStreamType;
            cbEncodeModeS.SelectedIndex = (Int32)stSecondStream.ulEncodeMode;
            cbTranTypeS.SelectedIndex = (Int32)stSecondStream.ulTranType;
            cbFrameRateS.Text = stSecondStream.ulFrameRate.ToString();
            cbPriorityS.SelectedIndex = (Int32)stSecondStream.ulPriority;
            cbResolutionS.SelectedIndex = (Int32)stSecondStream.ulResolution;
            tbBitRateS.Text = stSecondStream.ulBitRate.ToString();
            cbImageQualityS.SelectedIndex = (Int32)stSecondStream.ulImageQuality;
            tbIFrameIntervalS.Text = stSecondStream.ulIFrameInterval.ToString();
            cbGopModeS.SelectedIndex = (Int32)stSecondStream.ulGopMode;

            //OSD
            if (0 == m_stVinChnlBindCamera.stOSDInfo.stOSDTime.ulEnableFlag)
            {
                rbTimeOSDYes.Checked = false;
                rbTimeOSDNo.Checked = true;
            }
            else
            {
                rbTimeOSDYes.Checked = true;
                rbTimeOSDNo.Checked = false;
            }
            tbTimeOSDX.Text = m_stVinChnlBindCamera.stOSDInfo.stOSDTime.stAreaScope.ulTopLeftX.ToString();
            tbTimeOSDY.Text = m_stVinChnlBindCamera.stOSDInfo.stOSDTime.stAreaScope.ulTopLeftY.ToString();
            if (0 == m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].ulEnabledFlag)
            {
                rbNameOSDYes.Checked = false;
                rbNameOSDNo.Checked = true;
            }
            else
            {
                rbNameOSDYes.Checked = true;
                rbNameOSDNo.Checked = false;
            }
            tbNameOSDX.Text = m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].stAreaScope.ulTopLeftX.ToString();
            tbNameOSDY.Text = m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].stAreaScope.ulTopLeftY.ToString();
            tbNameOSD1.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].szOsdString1);
            tbNameOSD2.Text = IMOSSDK.UTF8ToUnicode(m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].szOsdString2);
            tbSwitchTime.Text = m_stVinChnlBindCamera.stOSDInfo.astOSDName[0].ulSwitchIntval.ToString();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (tbCameraCode.Text == "" || tbCameraName.Text == "")
            {
                return;
            }

            UInt32 ulRet = 0;
            if (true == m_isAdd)
            {
                ulRet = IMOSSDK.IMOS_BindCameraToVideoInChannel(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stVinChnlBindCamera);
                if (0 != ulRet)
                {
                    return;
                }
            }
            else
            {
                ulRet = IMOSSDK.IMOS_ModifyCamera(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stVinChnlBindCamera.stCameraInfo);
                if (0 != ulRet)
                {
                    return;
                }

                ulRet = IMOSSDK.IMOS_ConfigVideoInChannel(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stChannelIndex, ref m_stVinChnlBindCamera.stVinChannel);
                if (0 != ulRet)
                {
                    return;
                }

                ulRet = IMOSSDK.IMOS_ConfigECVideoStream(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stChannelIndex, ref m_stVinChnlBindCamera.astVideoStream[0]);
                if (0 != ulRet)
                {
                    return;
                }

                ulRet = IMOSSDK.IMOS_ConfigDeviceTimeOSD(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stChannelIndex, ref m_stVinChnlBindCamera.stOSDInfo.stOSDTime);
                if (0 != ulRet)
                {
                    return;
                }

                ulRet = IMOSSDK.IMOS_ConfigDeviceNameOSD(ref IMOSSDK.stLoginInfo.stUserLoginIDInfo, ref m_stChannelIndex, 1, ref m_stVinChnlBindCamera.stOSDInfo.astOSDName[0]);
                if (0 != ulRet)
                {
                    return;
                }

            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }



    }
}
