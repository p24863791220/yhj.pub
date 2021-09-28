using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk; 
using System.Runtime.InteropServices;
using IMOS_SDK_DEMO.ptz;
using IMOS_SDK_DEMO.vod;
using System.IO;

namespace IMOS_SDK_DEMO.player
{
    public partial class PlayerPanel : UserControl
    { 
        
        //回调函数指针
        IMOSSDK.XP_SOURCE_MEDIA_DATA_CALLBACK_PF _srcCallBackFunc = null;
        IMOSSDK.XP_PARSE_VIDEO_DATA_CALLBACK_PF _parseVideoCallBackFunc = null;
        IMOSSDK.XP_PARSE_AUDIO_DATA_CALLBACK_PF _parseAudioCallBackFunc = null;
        IMOSSDK.XP_DECODE_VIDEO_DATA_CALLBACK_PF _decodeVideoCallBackFunc = null;
        IMOSSDK.XP_DECODE_AUDIO_DATA_CALLBACK_PF _decodeAudioCallBackFunc = null;
        

        string _strFileSourceName = string.Empty;
        string _strFileParseName = string.Empty;
        string _strFileDecordName = string.Empty;

        private static readonly Object _syncCallBackObject = new object();
        public enum PLAY_TYPE_E
        {
            PLAY_TYPE_BLANK = 0,
            PLAY_TYPE_LIVE,
            PLAY_TYPE_SWITCH,
            PLAY_TYPE_VOD,
	        PLAY_TYPE_LOCAL,
            
        }

        public enum XP_PLAY_STATUS_E
        {
            XP_PLAY_STATUS_16_BACKWARD = 0,     /**< 16倍速后退播放 */
            XP_PLAY_STATUS_8_BACKWARD = 1,      /**< 8倍速后退播放 */
            XP_PLAY_STATUS_4_BACKWARD = 2,      /**< 4倍速后退播放 */
            XP_PLAY_STATUS_2_BACKWARD = 3,      /**< 2倍速后退播放 */
            XP_PLAY_STATUS_1_BACKWARD = 4,      /**< 正常速度后退播放 */
            XP_PLAY_STATUS_HALF_BACKWARD = 5,   /**< 1/2倍速后退播放 */
            XP_PLAY_STATUS_QUARTER_BACKWARD = 6,/**< 1/4倍速后退播放 */
            XP_PLAY_STATUS_QUARTER_FORWARD = 7, /**< 1/4倍速播放 */
            XP_PLAY_STATUS_HALF_FORWARD = 8,    /**< 1/2倍速播放 */
            XP_PLAY_STATUS_1_FORWARD = 9,       /**< 正常速度前进播放 */
            XP_PLAY_STATUS_2_FORWARD = 10,      /**< 2倍速前进播放 */
            XP_PLAY_STATUS_4_FORWARD = 11,      /**< 4倍速前进播放 */
            XP_PLAY_STATUS_8_FORWARD = 12,      /**< 8倍速前进播放 */
            XP_PLAY_STATUS_16_FORWARD = 13      /**< 16倍速前进播放 */
        }

        public enum setPlayStatus
        {
            Quick_Play,
            Slow_Play
        }

        private int m_index = 0;
        public class cameraCodeEventArgs : EventArgs
        {
            public String CameraCode;
            public bool isPtz;
        }

        public System.Timers.Timer timersTimer {set; get;}
        public delegate void selectIndexChangedEventHandler(object sender, cameraCodeEventArgs e);
        public event selectIndexChangedEventHandler playerSelectIndexChanged;

        public byte[] CameraCode;
        public Player m_player;
        PlayerPanel selectedPanel;
        /// <summary>
        /// 开启实况回放用的通道号
        /// </summary>
        public string channelCode;

        SubCtrl selectedSubCtrl;
        public int Index
        {
            get { return m_index; }
            set { m_index = value; }
        }

        private bool m_isMax = false;
        public bool Max
        {
            get { return m_isMax; }
            set { m_isMax = value; }
        }

        private PLAY_TYPE_E m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_BLANK;

        public PLAY_TYPE_E PlayType
        {
            get { return m_ePlayType; }
            set { m_ePlayType = value; }
        }

        private bool m_bIsRecord = false;
        
        delegate void SetLabelText();
 
        public bool IsRecord
        {
            get { return m_bIsRecord; }
            set { m_bIsRecord = value; }
        }

        private bool m_bIsPause = false;

        public bool IsPause
        {
            get { return m_bIsPause; }
            set { m_bIsPause = value; }
        }

        private bool m_bIsMute = false;

        public bool IsMute
        {
            get { return m_bIsMute; }
            set { m_bIsMute = value; }
        }

        public bool IsPtz = false;

        public PlayerPanel()
        {
            InitializeComponent();
            
        }

       
        public static int SelectedIndex = 0;

        public static PlayerPanel SelectPlayer;

        public static int HighlightIndex = 0;
        
        public SubCtrl subCtrl;
        public void Init(int i)
        {
            m_index = i;
            tsLabelNum.Text = "窗格" + i.ToString();
        }

        public UInt32 StartLive(byte[] CameraCode)
        {

            UInt32 ulRet = 0;
            //此处用于拿到不同用户信息
            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];

            this.CameraCode = CameraCode;
            String str1 = Encoding.UTF8.GetString(CameraCode);
            //若已经获取ChannelCode则不重新获取
            if (null == selectedPanel.channelCode)
            {
                //将通道号和选中窗格绑定
                // 若调试发现 channelCode为乱码，则在之前没有调用 IMOS_StartPlayer接口
                string strChannelCode = string.Empty;
                ulRet = CommonFunc.GetChannelCode(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, ref strChannelCode);
                if (0 != ulRet)
                {
                    return ulRet;
                }
                selectedPanel.channelCode = strChannelCode;
            }

            //此处绑定每个不同用户的窗口句柄
            IntPtr ptrHwnd = new IntPtr();
            selectedSubCtrl.imosPlayer.GetHwnd(PlayerPanel.SelectedIndex, ref ptrHwnd);

            ulRet = FrameLive.StartMonitor(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, CameraCode, Encoding.Default.GetBytes(selectedPanel.channelCode), ptrHwnd);
            if (0 == ulRet)
            { 
                selectedPanel.m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_LIVE;
                tsLabelStatus.Text = "实况";
                selectedPanel.CameraCode = CameraCode;

                //开启实况后定时器开始执行
                timersTimer = new System.Timers.Timer();
                timersTimer.Interval = 3000;
                timersTimer.Elapsed += new System.Timers.ElapsedEventHandler(timersTimer_Elapsed);
                timersTimer.Enabled = true;
            }
            return ulRet;
        }

        string s = string.Empty;

        
        public UInt32 Stoplive()
        {
            UInt32 ulRet = 0;

            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            string tempChannelCode = selectedPanel.channelCode; 
            if(string.IsNullOrEmpty(tempChannelCode))
            {
                return 0;
            }
            Console.WriteLine(tempChannelCode);
            byte[] bytChannelCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            Encoding.Default.GetBytes(tempChannelCode).CopyTo(bytChannelCode, 0);
            
            ulRet = FrameLive.StopMonitor(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, bytChannelCode);
            if (ulRet != 0)
            {
                MessageBox.Show("关闭实况失败，错误码：" + ulRet);
                return ulRet;
            }
            selectedPanel.Refresh();
            //将播放窗格的通道号赋值为空
            selectedPanel.channelCode = null;
            if (0 == ulRet)
            {
                //OnPostMessage("停止实况成功！");
                selectedPanel.m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_BLANK;
                tsLabelStatus.Text = "空闲";
                selectedPanel.CameraCode = null;
                labelFrame.Text = "";
                labelBitrate.Text = "";
                labelResolution.Text = "";
            } 
            return ulRet;         
        }



        //public UInt32 Ptz_Connect(String cameraCode, USER_LOGIN_ID_INFO_S loginID)
        //{
        //    UInt32 ulRet = 0;
        //    ulRet = IMOSSDK.IMOS_StartPtzCtrl(ref loginID, Encoding.Default.GetBytes(cameraCode));
        //    return ulRet;
        //}

        public UInt32 StartVod(URL_INFO_S stURLInfo)
        {
            UInt32 ulRet = 0;
            StopAll();

            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            string strChannelCode = string.Empty;
            ulRet = CommonFunc.GetChannelCode(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, ref strChannelCode);
            if (0 != ulRet)
            {
                MessageBox.Show("GetFreeChannelCode fail.");
                return ulRet;
            }
            selectedPanel.channelCode = strChannelCode;

            IntPtr ptrHwnd = new IntPtr();
            m_player.GetHwnd(SelectedIndex, ref ptrHwnd);

            ulRet = Vod.StartVod(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, stURLInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), ptrHwnd);
            if (0 == ulRet)
            {
                selectedPanel.m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_VOD;
                tsLabelStatus.Text = "回放"; 

                selectedPanel.CameraCode = CameraCode;
                timersTimer = new System.Timers.Timer();

                timersTimer.Interval = 3000;
                timersTimer.Elapsed += new System.Timers.ElapsedEventHandler(timersTimer_Elapsed);
                timersTimer.Enabled = true;
            }
            return ulRet;
        }

        public UInt32 StopVod()
        {
            UInt32 ulRet = 0; 
            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            if (null != selectedPanel.channelCode)
            {
                ulRet = Vod.StopVod(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
                selectedPanel.Refresh();
            }

            if (0 == ulRet)
            {
                //OnPostMessage("停止回放成功！");
                selectedPanel.m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_BLANK;
                tsLabelStatus.Text = "空闲";
                labelFrame.Text = "";
                labelBitrate.Text = "";
                labelResolution.Text = "";
                selectedPanel.CameraCode = null;
            }
            return ulRet;
        }

        /// <summary>
        /// 暂停回放
        /// </summary>
        /// <returns></returns>
        public UInt32 PauseVod()
        {
            UInt32 ulRet = 0; 
            if(null != selectedSubCtrl)
            {
                selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            }

            if (null != selectedPanel.channelCode)
            {
                ulRet = Vod.PausePlay(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
            }
            
            return ulRet;
        }

        /// <summary>
        /// 恢复回放
        /// </summary>
        /// <returns></returns>
        public UInt32 ResumeVod()
        {
            UInt32 ulRet = 0;
            if (null != selectedSubCtrl)
            {
                selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            }
            if (null != selectedPanel.channelCode)
            {
                ulRet = Vod.ResumePlay (ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
            }
            return ulRet;
        }

        public void StopAll()
        {
            switch (m_ePlayType)
            {
                case PLAY_TYPE_E.PLAY_TYPE_LIVE:
                    Stoplive();
                    break;
                case PLAY_TYPE_E.PLAY_TYPE_VOD:
                    StopVod();
                    break;
                default:
                    break;
            }
            m_ePlayType = PLAY_TYPE_E.PLAY_TYPE_BLANK;
            m_bIsRecord = false;
        }

        public UInt32 PlayOnSpeed(uint playSpeed)
        {
            UInt32 ulRet = 0;
            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            if (null != selectedPanel.channelCode)
            {
                if (null != selectedSubCtrl.sdkManager)
                {
                    if (playSpeed == (uint)setPlayStatus.Quick_Play)
                    { 
                        ulRet = Vod.PlaySpeed(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), 
                            (uint)XP_PLAY_STATUS_E.XP_PLAY_STATUS_4_FORWARD);
                    }
                    else
                    { 
                        ulRet = Vod.PlaySpeed(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), 
                            (uint)XP_PLAY_STATUS_E.XP_PLAY_STATUS_4_BACKWARD);
                    }
                }
            }
            return ulRet;
        }

        /// <summary>
        /// 单帧播放
        /// </summary>
        public uint PlayByOneFrame()
        {
            //SubCtrl selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            UInt32 ulRet = 0;
            if (null != selectedPanel.channelCode)
            {
                ulRet = Vod.PlayOneByOne(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
            }

            return ulRet;
        }

        public void SetTitleColor(Color color)
        {
            pnlPlayerTitle.BackColor = color;
        }

        public void GetHwnd(ref IntPtr handle)
        {
            SubCtrl selectedSubCtrl = null;//m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            //每个用户的播放窗口句柄不能相同
            handle = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex].pnlPlayer.Handle;
        }

        private void PlayerPanel_Paint(object sender, PaintEventArgs e)
        {
        }

        private void pnlPlayer_MouseDown(object sender, MouseEventArgs e)
        {
            //if (null != m_player.m_mainForm)
            //{
            //    selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            //    PlayerPanel selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            //    //若选中窗格改变
            //    if (SelectedIndex != m_index && null != this.CameraCode)
            //    {
            //        //SelectPlayer = this;
            //        selectedPanel = this;
            //        cameraCodeEventArgs eArgs = new cameraCodeEventArgs();
            //        eArgs.CameraCode = Encoding.UTF8.GetString(selectedPanel.CameraCode);
            //        eArgs.isPtz = selectedPanel.IsPtz;
            //        if (null != playerSelectIndexChanged)
            //        {
            //            playerSelectIndexChanged(this, eArgs);
            //        } 
            //    }
            //}
            SelectPlayer = this;
            SelectedIndex = m_index;
            this.Parent.Refresh();
            //m_player.RedrawBorder(m_player.m_unitNumber);
            if (MouseButtons.Right == e.Button)
            {
                cmPopup.Show(this.PointToScreen(e.Location));
            } 
        }

        private void tsButtonClose_Click(object sender, EventArgs e)
        {
            StopAll();
        }

        private void pnlPlayer_MouseHover(object sender, EventArgs e)
        {
            pnlPlayerTitle.Visible = true;
            PnlPlayerStatus.Visible = true;
        }

        private void pnlPlayer_MouseLeave(object sender, EventArgs e)
        {
            
            Rectangle rect = this.RectangleToScreen(pnlPlayer.ClientRectangle);
            if (Cursor.Position.X < rect.Left || Cursor.Position.X > rect.Right
                ||Cursor.Position.Y < rect.Top || Cursor.Position.Y > rect.Bottom)
            {
                pnlPlayerTitle.Visible = false;
                PnlPlayerStatus.Visible = false;
            }
        }

        private void tsTitle_MouseLeave(object sender, EventArgs e)
        {
            Rectangle rect = this.RectangleToScreen(pnlPlayer.ClientRectangle);
            if (Cursor.Position.X < rect.Left || Cursor.Position.X > rect.Right
                || Cursor.Position.Y < rect.Top || Cursor.Position.Y > rect.Bottom)
            {
                pnlPlayerTitle.Visible = false;
                PnlPlayerStatus.Visible = false;
            }
        }

        private void tsUnitTools_MouseLeave(object sender, EventArgs e)
        {
            Rectangle rect = this.RectangleToScreen(pnlPlayer.ClientRectangle);
            if (Cursor.Position.X < rect.Left || Cursor.Position.X > rect.Right
                || Cursor.Position.Y < rect.Top || Cursor.Position.Y > rect.Bottom)
            {
                pnlPlayerTitle.Visible = false;
                PnlPlayerStatus.Visible = false;
            }
        }

        private void PlayerMax()
        {
            SelectPlayer = this;
            SelectedIndex = m_index;
            m_isMax = !m_isMax;
            if (m_isMax)
            {
                tsButtonFull.ToolTipText = "还原";
                tsmPlayerMax.Text = "还原";
            }
            else
            {
                tsButtonFull.ToolTipText = "最大化";
                tsmPlayerMax.Text = "最大化";
            }
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }

        private void tsButtonFull_Click(object sender, EventArgs e)
        {
            PlayerMax();
        }

        private void tsTitle_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            PlayerMax();
        }

        private void tsButtonSnatch_Click(object sender, EventArgs e)
        {
            //if (null == m_player.m_mainForm)
            //{
            //    MessageBox.Show("请先登录！");
            //    return;
            //}
            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            //if(null != selectedSubCtrl)
            //{
            //    selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            //}
            

            //检查图片保存地址，默认为snatch
            UInt32 ulRet = 0;
            String picPath = LocalConfig.picSnatchLoc;
            if (false == Directory.Exists(LocalConfig.picSnatchLoc))
            {
                Directory.CreateDirectory(LocalConfig.picSnatchLoc);
            }

            if(false ==LocalConfig.picSnatchLoc.EndsWith("\\"))
            {
                //这里要给路径后添加"\"
                picPath = LocalConfig.picSnatchLoc.Insert(LocalConfig.picSnatchLoc.Length, "\\");
            }

            if(null != selectedPanel.channelCode)
            {
                ulRet = CommonFunc.SnatchOnce(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), Encoding.Default.GetBytes(picPath), LocalConfig.picFormat);
            }
            
            if (0 != ulRet)
            {
                //log.Info("抓图失败，错误码为：" + ulRet.ToString());
                MessageBox.Show("抓图失败，错误码为：" + ulRet.ToString());
            }else
            {
                MessageBox.Show("抓图成功！图片保存在" + LocalConfig.picSnatchLoc);
            }
        }

        private void tsButtonRecord_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;
            //if(null == m_player.m_mainForm)
            //{
            //    MessageBox.Show("请先登录！");
            //    return;
            //}
            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            PlayerPanel selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];

            if (false == m_bIsRecord)
            {
                if (null != LocalConfig.vodDownloadLoc)
                {
                    ConfigClass.OptionSetting.RecordPath = LocalConfig.vodDownloadLoc;
                }
                if(null != selectedPanel.channelCode)
                {
                    //ulRet = IMOSSDK.IMOS_StartRecord(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), Encoding.Default.GetBytes(ConfigClass.OptionSetting.RecordPath), 0);
                    ulRet = Vod.StartRecord(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), Encoding.Default.GetBytes(ConfigClass.OptionSetting.RecordPath), 0);
                }
                
                if (0 != ulRet)
                {
                    //log.Info("本地录像失败，错误码为：" + ulRet.ToString());
                    MessageBox.Show("本地录像失败，错误码为：" + ulRet.ToString());
                }
                else
                {
                    m_bIsRecord = true;
                    tsButtonRecord.ToolTipText = "停止本地录像";
                }
            }

            else
            {
                if(null != selectedPanel.channelCode)
                {
                    //ulRet = IMOSSDK.IMOS_StopRecord(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
                    ulRet = Vod.StopRecord(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode));
                }
                
                if (0 != ulRet)
                {
                    //log.Info("停止本地录像失败，错误码为：" + ulRet.ToString());
                    MessageBox.Show("停止本地录像失败，错误码为：" + ulRet.ToString());
                }
                else
                {
                    m_bIsRecord = false;
                    tsButtonRecord.ToolTipText = "本地录像";
                    MessageBox.Show("本地录像保存成功！录像保存在" + ConfigClass.OptionSetting.RecordPath);
                }
            }
           
        }

        private void tsmPlayerNum1_Click(object sender, EventArgs e)
        {
            m_player.UnitNumber = 1;
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }

        private void tsmPlayerNum4_Click(object sender, EventArgs e)
        {
            m_player.UnitNumber = 4;
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }

        private void tsmPlayerNum9_Click(object sender, EventArgs e)
        {
            m_player.UnitNumber = 9;
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }

        private void tsmPlayerNum16_Click(object sender, EventArgs e)
        {
            m_player.UnitNumber = 16;
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }

        private void tsmPlayerNum25_Click(object sender, EventArgs e)
        {
            m_player.UnitNumber = 25;
            m_player.RedrawBorder(m_player.UnitNumber);
            m_player.Refresh();
        }


        private void tsmPlayerClose_Click(object sender, EventArgs e)
        {
            StopAll();
        }

        private void tsmPlayerMax_Click(object sender, EventArgs e)
        {
            PlayerMax();
        }

        private void timersTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            try
            {
                SetLabelText setLabelTextDelegate = new SetLabelText(SetText);
                this.Invoke(setLabelTextDelegate);
            }
            catch(Exception ex)
            {
                ///
            }
        }

        private void SetText()
        {
            //selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            PlayerPanel selectedPanel = selectedSubCtrl.imosPlayer.m_playerUnit[PlayerPanel.SelectedIndex];
            //帧率
            UInt32 frame = 0;
            //码率
            UInt32 bitRate = 0;
            //视频编码格式
            UInt32 videoType = 0;
            if(null != selectedPanel.channelCode)
            {
                CommonFunc.GetFrameRate(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), ref frame);
                CommonFunc.GetBitRate(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), ref bitRate);
                CommonFunc.GetEncodeType(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, Encoding.Default.GetBytes(selectedPanel.channelCode), ref videoType);
            }

            selectedPanel.labelFrame.Text = "帧率：" + Convert.ToString(frame);
            selectedPanel.labelBitrate.Text = "码率：" + Convert.ToString(bitRate/1024) + "bps";
            if (0 == videoType)
            {
                selectedPanel.labelResolution.Text = "";
                //labelResolution.Text = "视频编码格式：MPEG-2";
            }
            else if (1 == videoType)
            {
                selectedPanel.labelResolution.Text = "视频编码格式：MPEG-4";
            }
            else if (2 == videoType)
            {
                selectedPanel.labelResolution.Text = "视频编码格式：H.264";
            }
            else if (3 == videoType)
            {
                selectedPanel.labelResolution.Text = "视频编码格式：MJPEG";
            }
        }


        public void PlayPanel_usrSelectChanged(object sender, EventArgs e)
        {
            //选择用户改变
            //if (null != m_player.m_mainForm)
            //{
            //    this.selectedSubCtrl = m_player.m_mainForm.g_userCtrlList[m_player.m_mainForm.tabControl1.SelectedIndex];
            //} 
        }



        private void tsmSrcStart_Click(object sender, EventArgs e)
        {
            tsmSrcStart.Checked = !tsmSrcStart.Checked;
        }
        /// <summary>
        /// 原始码流
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmSrcStart_CheckedChanged(object sender, EventArgs e)
        {
            if (selectedPanel == null || string.IsNullOrEmpty(channelCode))
            {
                return;
            }
            bool isContinue = tsmSrcContinue.Checked;
            IntPtr ptrCB = IntPtr.Zero;
            if (tsmSrcStart.Checked)
            {
                _srcCallBackFunc = SrcProcessCallBack;
                ptrCB = Marshal.GetFunctionPointerForDelegate(_srcCallBackFunc);
                var ulRet = AVCallBack.SetSourceMediaDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
                if(ulRet!=0)
                {
                    MessageBox.Show("设置原始码流回调失败，错误码：" + ulRet);
                }
            }
            else
            {
                var ulRet = AVCallBack.SetSourceMediaDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
                if(ulRet!=0)
                {
                    MessageBox.Show("取消原始码流回到失败，错误码：" + ulRet);
                }
            }
        }
        public void SrcProcessCallBack(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pBuffer, UInt32 ulBufSize, UInt32 ulMediaDataType, long lUserParam, long lReserved)
        {
            try
            { 
                if(string.IsNullOrEmpty(_strFileSourceName))
                {
                    _strFileSourceName = "SourceMediaData" + DateTime.Now.ToString("-yyyyMMddHHmmssfffff") + ".ts";
                }
                var path = Path.Combine(LocalConfig.codeOutputLoc, _strFileSourceName);
                byte[] bytess = new byte[ulBufSize];
                Marshal.Copy(pBuffer, bytess, 0, (int)ulBufSize);
                using (FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                {
                    using (BinaryWriter bw = new BinaryWriter(fs, Encoding.Default))
                    {
                        bw.Write(bytess, 0, (int)ulBufSize);
                        fs.Flush();
                    }
                }
                //fs.Write(bytess, 0, (int)ulBufSize);
            }
            catch (SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tsmpzhspStart_Click(object sender, EventArgs e)
        {
            tsmpzhspStart.Checked = !tsmpzhspStart.Checked;
        }
        /// <summary>
        /// 拼帧后视频
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmpzhspStart_CheckedChanged(object sender, EventArgs e)
        {
            if (selectedPanel == null || string.IsNullOrEmpty(channelCode))
            {
                return;
            }
            bool isContinue = tsmpzhspContinue.Checked;
            IntPtr ptrCB = IntPtr.Zero;
            if (tsmpzhspStart.Checked)
            {
                _parseVideoCallBackFunc = ParseVideoProcessCallBack;
                ptrCB = Marshal.GetFunctionPointerForDelegate(_parseVideoCallBackFunc);
                var ulRet = AVCallBack.SetParseVideoDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, (long)this.Handle);
                if (ulRet != 0)
                {
                    MessageBox.Show("设置拼帧后码流回调失败，错误码：" + ulRet);
                }
            }
            else
            {
                var ulRet = AVCallBack.SetParseVideoDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, (long)this.Handle);
                if (ulRet != 0)
                {
                    MessageBox.Show("取消拼帧后码流回调失败，错误码：" + ulRet);
                }
            }
        }
        public void ParseVideoProcessCallBack(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr  pstParseVideoData1, long lUserParam, long lReserved)
        {
            try
            {
                lock (_syncCallBackObject)
                {
                    if(String.IsNullOrEmpty(_strFileParseName))
                    {
                        _strFileParseName = "ParseVideo" + DateTime.Now.ToString("-yyyyMMddHHmmssfff") + ".ts";
                    }
                    XP_PARSE_VIDEO_DATA_S pstParseVideoData = (XP_PARSE_VIDEO_DATA_S)Marshal.PtrToStructure(pstParseVideoData1, typeof(XP_PARSE_VIDEO_DATA_S));

                    var path = Path.Combine(LocalConfig.codeOutputLoc, _strFileParseName);
                    byte[] bytess = new byte[pstParseVideoData.ulDataLen];
                    Marshal.Copy(pstParseVideoData.pucData, bytess, 0, (int)pstParseVideoData.ulDataLen);

                    using (FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                    {
                        using (BinaryWriter bw = new BinaryWriter(fs, Encoding.Default))
                        {
                            bw.Write(bytess, 0, (int)pstParseVideoData.ulDataLen);
                            fs.Flush();
                        }
                    }
                }
            }
            catch (SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tsmpzhypStart_Click(object sender, EventArgs e)
        {
            tsmpzhypStart.Checked = !tsmpzhypStart.Checked;
        }
        /// <summary>
        /// 拼帧后音频
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmpzhypStart_CheckedChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(IMOSSDK.UTF8ToUnicode(selectedPanel.CameraCode)) || string.IsNullOrEmpty(channelCode))
            {
                return;
            }
            bool isContinue = tsmpzhypContinue.Checked;
            IntPtr ptrCB = IntPtr.Zero;
            if (tsmpzhypStart.Checked)
            {
                _parseAudioCallBackFunc = ParseAudioProcessCallBack;
                ptrCB = Marshal.GetFunctionPointerForDelegate(_parseAudioCallBackFunc);
                var ulRet = AVCallBack.SetParseAudioDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
            }
            else
            {
                var ulRet = AVCallBack.SetParseAudioDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
            }
        }
        public void ParseAudioProcessCallBack(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pstParseAudioData1, long lUserParam, long lReserved)
        {
            try
            {
                if (string.IsNullOrEmpty(IMOSSDK.UTF8ToUnicode(selectedPanel.CameraCode)) || string.IsNullOrEmpty(channelCode))
                {
                    return;
                }
                lock (_syncCallBackObject)
                {
                    XP_PARSE_AUDIO_DATA_S pstParseAudioData = (XP_PARSE_AUDIO_DATA_S)Marshal.PtrToStructure(pstParseAudioData1, typeof(XP_PARSE_AUDIO_DATA_S));

                    var path = Path.Combine(LocalConfig.codeOutputLoc, "ParseAudio.ts");
                    byte[] bytess = new byte[pstParseAudioData.ulDataLen];
                    Marshal.Copy(pstParseAudioData.pucData, bytess, 0, (int)pstParseAudioData.ulDataLen);
                    using (FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                    {
                        using (BinaryWriter bw = new BinaryWriter(fs, Encoding.Default))
                        {
                            bw.Write(bytess, 0, (int)pstParseAudioData.ulDataLen);
                            fs.Flush();
                        }
                    }
                }
            }
            catch (SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tsmDecodespStart_Click(object sender, EventArgs e)
        {
            tsmDecodespStart.Checked = !tsmDecodespStart.Checked;
        }
        /// <summary>
        /// 解码后视频
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void tsmDecodespStart_CheckedChanged(object sender, EventArgs e)
        {
            if (selectedPanel ==null|| string.IsNullOrEmpty(channelCode))
            {
                return;
            }
            bool isContinue = tsmDecodespContinue.Checked;
            IntPtr ptrCB = IntPtr.Zero;
            if (tsmDecodespStart.Checked)
            {
                _decodeVideoCallBackFunc = DecodeVideoProcessCallBack;
                ptrCB = Marshal.GetFunctionPointerForDelegate(_decodeVideoCallBackFunc);
                var ulRet = AVCallBack.SetDecodeVideoDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
                if (ulRet != 0)
                {
                    MessageBox.Show("设置解码后码流回调失败，错误码：" + ulRet);
                }
            }
            else
            {
                var ulRet = AVCallBack.SetDecodeVideoDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
                if (ulRet != 0)
                {
                    MessageBox.Show("取消解码后码流回调失败，错误码：" + ulRet);
                }
            }
        }
        public void DecodeVideoProcessCallBack(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pstDecodeVideoData1, long lUserParam, long lReserved)
        {
            try
            {
                lock (_syncCallBackObject)
                {
                    if(string.IsNullOrEmpty(_strFileDecordName))
                    {
                        _strFileDecordName = "DecodeVideo-" + DateTime.Now.ToString("yyyyMMddHHmmssffff") + ".ts";
                    }
                    XP_PICTURE_DATA_S pstDecodeVideoData = (XP_PICTURE_DATA_S)Marshal.PtrToStructure(pstDecodeVideoData1, typeof(XP_PICTURE_DATA_S));
                    var path = Path.Combine(LocalConfig.codeOutputLoc, _strFileDecordName);
                    for (int i = 0; i < 3; i++)
                    {
                        byte[] bytess = new byte[pstDecodeVideoData.ulLineSize[i]];
                        Marshal.Copy(pstDecodeVideoData.pucData[i], bytess, 0, (int)pstDecodeVideoData.ulLineSize[i]);

                        using (FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                        {
                            using (BinaryWriter bw = new BinaryWriter(fs, Encoding.Default))
                            {
                                bw.Write(bytess, 0, (int)pstDecodeVideoData.ulLineSize[i]);
                                fs.Flush();
                            }
                        }
                    }
                }
            }
            catch (SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tsmDecodeypStart_Click(object sender, EventArgs e)
        {
            tsmDecodeypStart.Checked = !tsmDecodeypStart.Checked;
        }

        private void tsmDecodeypStart_CheckedChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(IMOSSDK.UTF8ToUnicode(selectedPanel.CameraCode)) || string.IsNullOrEmpty(channelCode))
            {
                return;
            }
            bool isContinue = tsmDecodeypContinue.Checked;
            IntPtr ptrCB = IntPtr.Zero;
            if (tsmDecodeypStart.Checked)
            {
                _decodeAudioCallBackFunc = DecodeAudioProcessCallBack;
                ptrCB = Marshal.GetFunctionPointerForDelegate(_decodeAudioCallBackFunc);
                var ulRet = AVCallBack.SetDecodeAudioDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
            }
            else
            {
                var ulRet = AVCallBack.SetDecodeAudioDataCB(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, IMOSSDK.UnicodeToUTF8(channelCode), ptrCB, isContinue, 0);
            }
        }

        public void DecodeAudioProcessCallBack(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, XP_WAVE_DATA_S pstWaveData, long lUserParam, long lReserved)
        {
            try
            {
                var path = Path.Combine(LocalConfig.codeOutputLoc, "DecodeAudio.ts");
                byte[] bytess = new byte[pstWaveData.ulDataLen];
                Marshal.Copy(pstWaveData.pcData, bytess, 0, (int)pstWaveData.ulDataLen);
                FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite);
                fs.Write(bytess, 0, (int)pstWaveData.ulDataLen);
            }
            catch (SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tsmSrcContinue_Click(object sender, EventArgs e)
        {
            tsmSrcContinue.Checked = !tsmSrcContinue.Checked;
            if (tsmSrcStart.Checked)
            {
                tsmSrcStart_CheckedChanged(null, null);
            }
        }

        private void tsmpzhspContinue_Click(object sender, EventArgs e)
        {
            tsmpzhspContinue.Checked = !tsmpzhspContinue.Checked;
            if (tsmpzhspStart.Checked)
            {
                tsmpzhspStart_CheckedChanged(null, null);
            }
        }

        private void tsmpzhypContinue_Click(object sender, EventArgs e)
        {
            tsmpzhypContinue.Checked = !tsmpzhypContinue.Checked;
            if (tsmpzhypStart.Checked)
            {
                tsmpzhypStart_CheckedChanged(null, null);
            }
        }

        private void tsmDecodeypContinue_Click(object sender, EventArgs e)
        {
            tsmDecodeypContinue.Checked = !tsmDecodeypContinue.Checked;
            if (tsmDecodeypStart.Checked)
            {
                tsmDecodeypStart_CheckedChanged(null, null);
            }
        }

        private void tsmDecodespContinue_Click(object sender, EventArgs e)
        {
            tsmDecodespContinue.Checked = !tsmDecodespContinue.Checked;
            if (tsmDecodespStart.Checked)
            {
                tsmDecodespStart_CheckedChanged(null, null);
            }
        }

        private void tsButtonStartTalk_Click(object sender, EventArgs e)
        {
            
            uint ulRet = 0;

            if (null == this.channelCode)
            {
                return;
            }
            byte[] xpCodeBytes = Encoding.UTF8.GetBytes(this.channelCode);
            ulRet = CommonFunc.PlaySound(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, xpCodeBytes);
            if (0 != ulRet)
            {
                MessageBox.Show("错误代码" + ulRet);
            }
        }

        private void tsButtonStopTalk_Click(object sender, EventArgs e)
        { 
            uint ulRet = 0; 
            if (null == this.channelCode)
            {
                return;
            }
            byte[] xpCodeBytes = Encoding.UTF8.GetBytes(this.channelCode);
            ulRet = CommonFunc.StopSound(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, xpCodeBytes);
            if (0 != ulRet)
            {
                MessageBox.Show("错误代码" + ulRet);
            }
        }

        private void tsButton1Stream_Click(object sender, EventArgs e)
        {
            try
            {
                uint ulRet = 0;

                if (this.CameraCode==null || string.IsNullOrEmpty(this.channelCode)||
                    PlayType!=PLAY_TYPE_E.PLAY_TYPE_LIVE)
                {
                    return;
                } 
                byte[] monitorCode = Encoding.UTF8.GetBytes(this.channelCode);
                ulRet = IMOSSDK.IMOS_StartMonitor(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, CameraCode, monitorCode, (uint)IMOS_FAVORITE_STREAM_E.IMOS_FAVORITE_STREAM_PRIMARY, 0);
                if (0 == ulRet)
                {
                    MessageBox.Show("视频已切换至主流");
                }
                else
                {
                    MessageBox.Show("错误代码" + ulRet);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void tsButton2Stream_Click(object sender, EventArgs e)
        {
            uint ulRet = 0; 
            if (this.CameraCode == null || string.IsNullOrEmpty(this.channelCode) || 
                PlayType!=PLAY_TYPE_E.PLAY_TYPE_LIVE)
            {
                return;
            } 
            byte[] monitorCode = Encoding.UTF8.GetBytes(this.channelCode);
            ulRet = IMOSSDK.IMOS_StartMonitor(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, this.CameraCode, monitorCode, (uint)IMOS_FAVORITE_STREAM_E.IMOS_FAVORITE_STREAM_SECONDERY, 0);
            if (0 == ulRet)
            {
                MessageBox.Show("视频已切换至辅流");
            }
            else
            {
                MessageBox.Show("请确认是否已配置支持双码流！错误代码" + ulRet);
                //开启辅流失败则再开启主流
                ulRet = IMOSSDK.IMOS_StartMonitor(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, this.CameraCode, monitorCode, (uint)IMOS_FAVORITE_STREAM_E.IMOS_FAVORITE_STREAM_PRIMARY, 0);
            }
        }
         
    }
}
