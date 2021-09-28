using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.player;
using IMOS_SDK_DEMO.sdk;

namespace IMOS_SDK_DEMO
{
    public partial class ConfigForm : Form
    {
        SdkManager sdkManager = new SdkManager();

        private Player imosPlayer;


        public ConfigForm(SdkManager sdkManager, Player imosPlayer)
        {
            InitializeComponent();
            this.sdkManager = sdkManager;
            this.imosPlayer = imosPlayer;
            init();
        }

        public void init()
        {
            this.tbSnatchPath.Text = ".\\Snatch";
            cbTranType.SelectedIndex = 0;
            cbServerMode.SelectedIndex = 0;
            rbStreamTypeNo.Checked = true;
            cbRenderMode.SelectedIndex = 0;
            cbDownLoadSpeed.SelectedIndex = 2;
            cbFiledMode.SelectedIndex = 0;
            cbFluency.SelectedIndex = 0;
            cbPicType.SelectedIndex = 0;
            cbDownRecProtocol.SelectedIndex = 0;
            cbPixelFormat.SelectedIndex = 0;
            cbRenderMode.SelectedIndex = 0;
            cbRecordType.SelectedIndex = 0;
        }
        private void btnSelectPath_Click(object sender, EventArgs e)
        {
            if (DialogResult.OK == fbdSnatchPath.ShowDialog())
            {
                tbSnatchPath.Text = fbdSnatchPath.SelectedPath;
            }
        }

        private void btnRecordPath_Click(object sender, EventArgs e)
        {
            if (DialogResult.OK == fbdSnatchPath.ShowDialog())
            {
                tbRecordPath.Text = fbdSnatchPath.SelectedPath;
            }
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            //读取配置 
            LocalConfig.fieldMode = this.cbFiledMode.SelectedIndex;
            LocalConfig.pktSeq = this.cbSeq.Checked;
            LocalConfig.renderMode = (uint)this.cbRenderMode.SelectedIndex;
            LocalConfig.fluency = (uint)this.cbFluency.SelectedIndex;
            LocalConfig.pixelFormat = (uint)this.cbPixelFormat.SelectedIndex;
            LocalConfig.picFormat = (uint)this.cbPicType.SelectedIndex;
            LocalConfig.picSnatchLoc = this.tbSnatchPath.Text;
            LocalConfig.vodDownloadLoc = this.tbRecordPath.Text + "\\";
            LocalConfig.downloadFormat = (uint)this.cbRecordType.SelectedIndex;
            LocalConfig.streamInfo.ulStreamServerMode = (uint)this.cbServerMode.SelectedIndex;
            LocalConfig.streamInfo.ulStreamTransProtocol = (uint)this.cbTranType.SelectedIndex;
            if (true == rbStreamTypeYes.Checked)
            {
                LocalConfig.streamInfo.ulStreamType = (uint)1;
            }else
            {
                LocalConfig.streamInfo.ulStreamType = (uint)0;
            }

            if (0 == this.cbDownRecProtocol.SelectedIndex)
            {
                LocalConfig.vodProtocol = XP_PROTOCOL_E.XP_PROTOCOL_UDP;
            }
            else
            {
                LocalConfig.vodProtocol = XP_PROTOCOL_E.XP_PROTOCOL_TCP;
            }

            if(0 == this.cbDownLoadSpeed.SelectedIndex)
            {
                LocalConfig.downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_ONE;
            }
            else if (1 == this.cbDownLoadSpeed.SelectedIndex)
            {
                LocalConfig.downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_TWO;
            }
            else if (2 == this.cbDownLoadSpeed.SelectedIndex)
            {
                LocalConfig.downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_FOUR;
            }
            else if (3 == this.cbDownLoadSpeed.SelectedIndex)
            {
                LocalConfig.downloadSpd = XP_DOWN_MEDIA_SPEED_E.XP_DOWN_MEDIA_SPEED_EIGHT;
            }


            int intRe = Configurator.SetLocalConfig(ref sdkManager.stLoginInfo.stUserLoginIDInfo, new Config()
            {
                pktSeq = LocalConfig.pktSeq,
                renderMode = LocalConfig.renderMode,
                fluency = LocalConfig.fluency,
                pixelFormat = LocalConfig.pixelFormat,
                streamInfo = LocalConfig.streamInfo
            });

            if (0 != intRe)
            {
                MessageBox.Show("SetLocalConfig fail ,ret = " + intRe);
            }
            

            for(int index=0; index<25; index++)
            {
                //将所有窗格的配置按照用户需求改变
                if (!string.IsNullOrEmpty(imosPlayer.m_playerUnit[index].channelCode) && null != sdkManager.stLoginInfo.stUserLoginIDInfo.szUserCode)
                {
                    //场模式设置
                    Configurator.SetFieldMode(ref sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(imosPlayer.m_playerUnit[index].channelCode), (uint)LocalConfig.fieldMode);

                }
            }

            this.Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
