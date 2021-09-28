using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Globalization;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk;
using System.Runtime.InteropServices; 
using IMOS_SDK_DEMO.player;
using System.Threading;
using System.IO;


namespace IMOS_SDK_DEMO.vod
{
    public partial class VODPanel : UserControl
    { 
        private uint quickPlay = 0;
        private uint slowPlay = 1;
        /// <summary>
        /// 获取sdkManager
        /// </summary>
        public SdkManager sdkManager { set; get; }

        public event XPRunMsgHandler XpRunMsg;

        private bool m_blnIsResume = false;

        /// <summary>
        /// 时钟用来显示录像下载进度
        /// </summary>
        public System.Windows.Forms.Timer m_timer {set; get;}

        //private MainForm mainForm;
        private Player player;
        private static string m_cameraCode = ""; 
        /// <summary>
        /// 回放信息格式
        /// </summary>
        private string m_strDateFormat = "yyyy-MM-dd HH:mm:ss";

        private DataTable dt = new DataTable();

        public DataTable dtAlarmInfo {set; get;}

        private DateTimeFormatInfo dtFormat = new DateTimeFormatInfo();

        private DateTime dtBegin;

        private DateTime dtEnd;

        /// <summary>
        /// 用来控制下载面板行数增减
        /// </summary>
        public int downloadIndex = -1;

        private static readonly object synRoot = new object();
        //下载信息
        private String downloadBeginTime;
        private String downloadEndTime;
        private Byte[] downloadID;

        //下载成功在datagridview中的索引
        private List<Int32> removeIndex = new List<Int32>();
        private List<RECORD_FILE_INFO_S> RecFileList = new List<RECORD_FILE_INFO_S>();

        //下载录像列表
        //private List<DownloadFileInfo> downloadList = new List<DownloadFileInfo>();

        public string CameraCode
        {
            get { return m_cameraCode; }
            set { dcPlayer1.CamCode = value; m_cameraCode = value; }
        }

        public VODPanel()
        {
            InitializeComponent();
            dtAlarmInfo = new DataTable();
            //定义一个定时器用来更新下载进度
            m_timer = new System.Windows.Forms.Timer();
            m_timer.Interval = 2000;        //每1.5秒更新下数据
            m_timer.Tick += new EventHandler(m_timer_Tick);

            m_timer.Enabled = true;
            m_timer.Start();

            btnResume.Enabled = false;
        }

        /// <summary>
        /// 设置录像面板摄像机
        /// </summary>
        /// <param name="cameraName"></param>
        public void SetCameraName(string cameraName)
        {
            lblCamera.Text = cameraName;
        }

        //public void getMainForm(MainForm mainForm, Player imosPlayer)
        //{
        //    this.mainForm = mainForm;
        //    this.player = imosPlayer;

        //    dcPlayer1.m_mainForm = mainForm;

        //    //为25个播放窗格绑定事件
        //    for (int index = 0; index < 25; index++)
        //    {
        //        player.m_playerUnit[index].playerSelectIndexChanged += new IMOS_SDK_DEMO.player.PlayerPanel.selectIndexChangedEventHandler(changeCameraCode);
        //    }
        //}


        public void initSdkManager(SdkManager sdkManager)
        {
            this.sdkManager = sdkManager;
        }

        /// <summary>
        /// 界面时钟，每隔1.5秒查看下当前进度
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void m_timer_Tick(object sender, EventArgs e)
        {
            try
            {
                lock(synRoot)
                {
                    DataGridViewRowCollection viewRowCollection = dgvVodInfo.Rows;
                  
                    foreach (DataGridViewRow dgvr in viewRowCollection)
                    {
                        //DownloadFileInfo downLoadFileInfo = (DownloadFileInfo)dgvr.Tag;
                        //if (null != downLoadFileInfo)
                        //{
                        //    //如果判断不为空就更新进度
                        //    //先减去日期时间
                        //    DateTime currTime = new DateTime();
                        //    UInt32 ulRet = Download.GetCurrDownLoadTime(ref this.sdkManager.stLoginInfo.stUserLoginIDInfo, downLoadFileInfo.downloadID, out currTime);
                        //    if (0 != ulRet)
                        //    {
                        //        continue;
                        //    }
                        //    //byte[] str = Encoding.UTF8.GetBytes(downloadFileInfo.startTime);
                        //    DateTime szStartTime = downLoadFileInfo.startTime;
                        //    DateTime szEndTime = downLoadFileInfo.endTime;
                        //    TimeSpan currTimeSpan = currTime - szStartTime;
                        //    TimeSpan totalTimeSpan = szEndTime - szStartTime;

                        //    //录像文件下载进度 
                        //    if (currTime > szStartTime && currTime < szEndTime)
                        //    {
                        //        downLoadFileInfo.downloadPercet = (int)(((currTimeSpan.TotalSeconds) / (totalTimeSpan.TotalSeconds)) * 100.0);
                        //        dgvr.Cells["下载进度"].Value = downLoadFileInfo.downloadPercet;
                        //    }
                        //}
                    }

                }

            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message.ToString());
            }
        }

        private void btnQueryRec_Click(object sender, EventArgs e)
        {
            RecFileList.Clear();
            pnlVodTime.Refresh();
            dgvVodInfo.Tag = null;
            dtBegin = dtpBeginDate.Value.Date + dtpBeginTime.Value.TimeOfDay;
            dtEnd = dtpEndDate.Value.Date + dtpEndTime.Value.TimeOfDay;

            downloadBeginTime = dtBegin.ToString(m_strDateFormat);
            downloadEndTime = dtEnd.ToString(m_strDateFormat);

            if (string.IsNullOrEmpty(m_cameraCode))
            {
                MessageBox.Show("请先选择一个摄像机！");
                return;
            }

            try
            {

                if (optCloud.Checked)
                {
                    //云检索
                    QueryCloudFile();
                    return;
                }
                //else if (optBak.Checked)
                //{
                //    //备份录像
                //    QueryBakFile();
                //    return;
                //}
                else if (optMain.Checked)
                {
                    //主用录像
                    RecFileList = QueryResource.QueryRecord(ref sdkManager.stLoginInfo.stUserLoginIDInfo, downloadBeginTime, downloadEndTime, m_cameraCode);
                }
                else
                {
                    //备用录像
                    RecFileList = QueryResource.QuerySlaveRecord(ref sdkManager.stLoginInfo.stUserLoginIDInfo, downloadBeginTime, downloadEndTime, m_cameraCode);
                }

                if (0 == RecFileList.Count)
                {
                    MessageBox.Show("该摄像机下无回放信息！");
                    return;
                }
                DrawRecordRect();
                ////将查询出的录像显示在录像下载面板中 
                this.dgvVodInfo.Tag = RecFileList;
                //默认下载显示时间为第一个录像开始结束时间
                String strTemp = Encoding.UTF8.GetString(RecFileList[0].szStartTime);
                dtpBeginDate.Value = Convert.ToDateTime(strTemp, dtFormat);
                dtpBeginTime.Value = Convert.ToDateTime(strTemp, dtFormat);

                String strTemp2 = Encoding.UTF8.GetString(RecFileList[0].szEndTime);
                dtpEndDate.Value = Convert.ToDateTime(strTemp2, dtFormat);
                dtpEndTime.Value = Convert.ToDateTime(strTemp2, dtFormat);

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //private void QueryBakFile()
        //{
        //    List<CAM_BAK_FILE_QUERY_ITEM_S> lstBak = QueryResource.QueryBakRecord(ref sdkManager.stLoginInfo.stUserLoginIDInfo, downloadBeginTime, downloadEndTime, m_cameraCode);
        //    if (null == lstBak || lstBak.Count <= 0)
        //    {
        //        return;
        //    }

        //    this.optBak.Tag = lstBak;
        //    //this.dgvVodInfo.Tag = lstBak;
        //    string strBegin = dtBegin.ToString(m_strDateFormat);
        //    string strEnd = dtEnd.ToString(m_strDateFormat);

        //    lblBeginTime.Text = strBegin;
        //    lblEndTime.Text = strEnd;

        //    UInt32 ulTotalSecond = (UInt32)((dtEnd - dtBegin).TotalSeconds);
        //    UInt32 ulTotalWidth = (UInt32)pnlVodTime.Width;
        //    UInt32 ulSubRectWidth;
        //    UInt32 ulSubRectPos;

        //    foreach (CAM_BAK_FILE_QUERY_ITEM_S RecFile in lstBak)
        //    {

        //        string strSubBegin = Encoding.Default.GetString(RecFile.stBakTime.szBeginTime, 0, 19);
        //        string strSubEnd = Encoding.Default.GetString(RecFile.stBakTime.szEndTime, 0, 19);
        //        IFormatProvider culture = new CultureInfo("zh-CN");
        //        DateTime subBegin = DateTime.ParseExact(strSubBegin, m_strDateFormat, culture);
        //        DateTime subEnd = DateTime.ParseExact(strSubEnd, m_strDateFormat, culture);

        //        UInt32 ulSubSecond = (UInt32)((subEnd - subBegin).TotalSeconds);
        //        ulSubRectWidth = (UInt32)(ulSubSecond * ulTotalWidth / ulTotalSecond);
        //        ulSubRectPos = ((UInt32)(subBegin - dtBegin).TotalSeconds) * ulTotalWidth / ulTotalSecond;
        //        Graphics dc = pnlVodTime.CreateGraphics();
        //        using (Brush myBrush = new SolidBrush(Color.Yellow))
        //        {
        //            dc.FillRectangle(myBrush, ulSubRectPos, 13, ulSubRectWidth, 30);
        //        }
        //    }
        
        //}

        private void QueryCloudFile()
        {
            var fileList = QueryResource.QueryCloud(ref sdkManager.stLoginInfo.stUserLoginIDInfo, downloadBeginTime, downloadEndTime, m_cameraCode);
            //显示回放记录
            if (null == fileList || fileList.Count <= 0)
            {
                return;
            }

            //将回放记录绑定到对应控件tag中(List<UNITED_REC_FILE_INFO_S>)
            //this.dgvVodInfo.Tag = fileList;
            this.optCloud.Tag = fileList;
            string strBegin = dtBegin.ToString(m_strDateFormat);
            string strEnd = dtEnd.ToString(m_strDateFormat);

            lblBeginTime.Text = strBegin;
            lblEndTime.Text = strEnd;

            UInt32 ulTotalSecond = (UInt32)((dtEnd - dtBegin).TotalSeconds);
            UInt32 ulTotalWidth = (UInt32)pnlVodTime.Width;
            UInt32 ulSubRectWidth;
            UInt32 ulSubRectPos;

            foreach (UNITED_REC_FILE_INFO_S RecFile in fileList)
            {

                string strSubBegin = Encoding.Default.GetString(RecFile.szStartTime, 0, 19);
                string strSubEnd = Encoding.Default.GetString(RecFile.szEndTime, 0, 19);
                IFormatProvider culture = new CultureInfo("zh-CN");
                DateTime subBegin = DateTime.ParseExact(strSubBegin, m_strDateFormat, culture);
                DateTime subEnd = DateTime.ParseExact(strSubEnd, m_strDateFormat, culture);

                UInt32 ulSubSecond = (UInt32)((subEnd - subBegin).TotalSeconds);
                ulSubRectWidth = (UInt32)(ulSubSecond * ulTotalWidth / ulTotalSecond);
                ulSubRectPos = ((UInt32)(subBegin - dtBegin).TotalSeconds) * ulTotalWidth / ulTotalSecond;
                Graphics dc = pnlVodTime.CreateGraphics();
                using (Brush myBrush = new SolidBrush(Color.Yellow))
                {
                    dc.FillRectangle(myBrush, ulSubRectPos, 13, ulSubRectWidth, 30);
                }
            }
        }

        
        private void InsertVod(DateTime begin, DateTime end, RECORD_FILE_INFO_S recFile, int index)
        {
            dtFormat.ShortTimePattern = m_strDateFormat;
            //更新下载信息列表
             //this.Enabled = true;
            //DownloadFileInfo info = new DownloadFileInfo();

            string strBegin = dtBegin.ToString(m_strDateFormat);
            string strEnd = dtEnd.ToString(m_strDateFormat);

            //info.startTime = Convert.ToDateTime(strBegin, dtFormat);
            //info.endTime = Convert.ToDateTime(strEnd, dtFormat);
            //info.vodName = Encoding.UTF8.GetString(recFile.szFileName);

            //DataRow dr = dt.NewRow();
            //dr["开始时间"] = info.startTime;
            //dr["结束时间"] = info.endTime;
            //dr["下载进度"] = "0";
            //info.isDownloading = false;
            //info.downloadID = null;
            //downloadList.Add(info);

            //dt.Rows.Add(dr);

            //dgvVodInfo.Rows[index].Tag = info;
            
            //DownloadFileInfo fileInfo = (DownloadFileInfo)dgvVodInfo.Rows[index].Tag;
            this.dgvVodInfo.Tag = RecFileList;

        }
        private void DrawRecordRect()
        {
            if (null == RecFileList)
            {
                return;
            }

            if (RecFileList.Count == 0)
            {
                return;
            }

            string strBegin = dtBegin.ToString(m_strDateFormat);
            string strEnd = dtEnd.ToString(m_strDateFormat);

            lblBeginTime.Text = strBegin;
            lblEndTime.Text = strEnd;

            UInt32 ulTotalSecond = (UInt32)((dtEnd - dtBegin).TotalSeconds);
            UInt32 ulTotalWidth = (UInt32)pnlVodTime.Width;
            UInt32 ulSubRectWidth;
            UInt32 ulSubRectPos;

            foreach (RECORD_FILE_INFO_S RecFile in RecFileList)
            {

                string strSubBegin = Encoding.Default.GetString(RecFile.szStartTime, 0, 19);
                string strSubEnd = Encoding.Default.GetString(RecFile.szEndTime, 0, 19);
                IFormatProvider culture = new CultureInfo("zh-CN");
                DateTime subBegin = DateTime.ParseExact(strSubBegin, m_strDateFormat, culture);
                DateTime subEnd = DateTime.ParseExact(strSubEnd, m_strDateFormat, culture);

                UInt32 ulSubSecond = (UInt32)((subEnd - subBegin).TotalSeconds);
                ulSubRectWidth = (UInt32)(ulSubSecond * ulTotalWidth / ulTotalSecond);
                ulSubRectPos = ((UInt32)(subBegin - dtBegin).TotalSeconds) * ulTotalWidth / ulTotalSecond;
                Graphics dc = pnlVodTime.CreateGraphics();
                using (Brush myBrush = new SolidBrush(Color.Yellow))
                {
                    dc.FillRectangle(myBrush, ulSubRectPos, 13, ulSubRectWidth, 30);
                }
            }

        }

        private void pnlVodTime_Paint(object sender, PaintEventArgs e)
        {
            DrawRecordRect();
        }

        private void pnlVodTime_Click(object sender, EventArgs e)
        {
            if (RecFileList.Count == 0)
            {
                return;
            }

            Point curPos = PointToClient(Cursor.Position);
            pnlTag.Location = new Point(curPos.X, pnlTag.Location.Y);
            long aaa = (long)(((curPos.X - pnlVodTime.Location.X) * (dtEnd - dtBegin).TotalSeconds * 10000000 / pnlVodTime.Width));
            TimeSpan ts = new TimeSpan(aaa);
            DateTime curDateTime = dtBegin + ts;
            dtpTimeTag.Value = curDateTime;
        }

        private void dtpTimeTag_ValueChanged(object sender, EventArgs e)
        {
            if (RecFileList.Count == 0)
            {
                return;
            }

            TimeSpan ts = new TimeSpan(24, 0, 0);

            if (dtpTimeTag.Value < dtBegin)
            {
                if ((dtpTimeTag.Value + ts) > dtEnd)
                {
                    return;
                }
                else
                {
                    dtpTimeTag.Value += ts;
                }

            }

            if (dtpTimeTag.Value > dtEnd)
            {
                if ((dtpTimeTag.Value - ts) < dtBegin)
                {
                    return;
                }
                else
                {
                    dtpTimeTag.Value -= ts;
                }
            }

            int curPos = (int)((dtpTimeTag.Value - dtBegin).TotalSeconds * pnlVodTime.Width / (dtEnd - dtBegin).TotalSeconds);
            pnlTag.Location = new Point(pnlVodTime.Location.X + curPos, pnlTag.Location.Y);
        }



        private void btnPlayRecord_Click(object sender, EventArgs e)
        {
            uint ulRet = 0;
            dtBegin = dtpBeginDate.Value.Date + dtpBeginTime.Value.TimeOfDay;
            dtEnd = dtpEndDate.Value.Date + dtpEndTime.Value.TimeOfDay;

            downloadBeginTime = dtBegin.ToString(m_strDateFormat);
            downloadEndTime = dtEnd.ToString(m_strDateFormat);

            if(dtBegin < dtEnd)
            {
                if (optMain.Checked)
                {
                    ulRet = sdkManager.PlayRecord(RecFileList, Encoding.UTF8.GetBytes(downloadBeginTime), Encoding.UTF8.GetBytes(downloadEndTime), m_cameraCode); 
                }
                //else if (optBak.Checked)
                //{
                //    //暂无实现
                //}
                else if (optCloud.Checked && optCloud.Tag != null)
                {
                    List<UNITED_REC_FILE_INFO_S> lstCloudFile = optCloud.Tag as List<UNITED_REC_FILE_INFO_S>;
                    if (lstCloudFile == null)
                    {
                        return;
                    }
                    ulRet = sdkManager.PlayCloudRecord(lstCloudFile, Encoding.UTF8.GetBytes(downloadBeginTime), Encoding.UTF8.GetBytes(downloadEndTime), m_cameraCode);
                }
                else if (optSlave.Checked)
                {
                    ulRet = sdkManager.PlayBakRecord(RecFileList, Encoding.UTF8.GetBytes(downloadBeginTime), Encoding.UTF8.GetBytes(downloadEndTime), m_cameraCode);
                }
                if (ulRet != 0)
                { 
                    MessageBox.Show("录像回放失败，错误码：" + ulRet);
                }
            }
            
        }

        private void pnlTag_Click(object sender, EventArgs e)
        {
            uint ulRet = 0;
            DateTime selectedTime = dtpTimeTag.Value;
            downloadBeginTime = selectedTime.ToString(m_strDateFormat);
            downloadEndTime = dtEnd.ToString(m_strDateFormat);
            if (dtBegin < dtEnd)
            {
                ulRet = sdkManager.PlayRecord(RecFileList, Encoding.UTF8.GetBytes(downloadBeginTime), Encoding.UTF8.GetBytes(downloadEndTime), m_cameraCode);
                if (ulRet != 0)
                { 
                    MessageBox.Show("启动回放失败，错误码：" + ulRet);
                }
            }
        }

        private void VODPanel_Load(object sender, EventArgs e)
        { 
            dt.Columns.Add("开始时间", typeof(string));
            dt.Columns.Add("结束时间", typeof(string));
            dt.Columns.Add("下载进度", typeof(int));
            dgvVodInfo.DataSource = dt;

            dtAlarmInfo.Columns.Add(SdkManager.ALARMSEQ, typeof(int));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMEVENTCODE, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMSRCCODE, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALRAMSRCNAME, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMTYPE, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMLEVEL, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMTIME, typeof(string));
            dtAlarmInfo.Columns.Add(SdkManager.ALARMDESC, typeof(string));

            dgvAlarmInfo.DataSource = dtAlarmInfo;
            dtpBeginDate.Value = DateTime.Now;
            dtpBeginTime.Value = DateTime.Today;
            dtpEndDate.Value = DateTime.Now;
            dtpEndTime.Value = DateTime.Now;
        }

        /// <summary>
        /// 录像暂停播放
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPausePlay_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;
            ulRet = PlayerPanel.SelectPlayer.PauseVod();

            if (ulRet != 0)
            {
                MessageBox.Show("录像暂停失败，错误码：" + ulRet);
            }
            else
            {
                btnResume.Enabled = true;
                btnPausePlay.Enabled = false;
            }
        }


        private void btnResume_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;
            ulRet = PlayerPanel.SelectPlayer.ResumeVod();
            
            if (ulRet != 0)
            {
                MessageBox.Show("恢复播放失败，错误码：" + ulRet);
            }
            else
            {
                btnResume.Enabled = false;
                btnPausePlay.Enabled = true;
            }
        } 

        /// <summary>
        /// 录像关闭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnStopPlay_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;
            ulRet = PlayerPanel.SelectPlayer.StopVod();
            if (ulRet != 0)
            {
                MessageBox.Show("录像播放关闭失败，错误码：" + ulRet);
            }
            else 
            {
                btnPausePlay.Enabled = true;
                btnResume.Enabled = false; 
            }
        }

        /// <summary>
        /// 以4倍速快进播放录像
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnQuickPlay_Click(object sender, EventArgs e)
        {
            uint ulRet = 0;
            ulRet = PlayerPanel.SelectPlayer.PlayOnSpeed(quickPlay);
            if (ulRet != 0)
            { 
                MessageBox.Show("录像以4倍速快放失败，错误码：" + ulRet);
            }
        }

        /// <summary>
        /// 以4倍速快退播放录像
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSlowPlay_Click(object sender, EventArgs e)
        {
            uint ulRet = PlayerPanel.SelectPlayer.PlayOnSpeed(slowPlay);
            if (ulRet != 0)
            { 
                MessageBox.Show("录像以4倍速快退失败，错误码：" + ulRet);
            }
        }

        private void btnPlayOneByOne_Click(object sender, EventArgs e)
        {
            //单帧播放
            uint ulRet = PlayerPanel.SelectPlayer.PlayByOneFrame();
            if (ulRet != 0)
            { 
                MessageBox.Show("录像单帧播放失败，错误码：" + ulRet);
            }
        }
         

        private void btnBeginDownLoad_Click(object sender, EventArgs e)
        {
            try
            {
                //DownloadFileInfo downLoadFile = new DownloadFileInfo(); 
                List<RECORD_FILE_INFO_S> recFileList = (List<RECORD_FILE_INFO_S>)dgvVodInfo.Tag;
                dtBegin = dtpBeginDate.Value.Date + dtpBeginTime.Value.TimeOfDay;
                dtEnd = dtpEndDate.Value.Date + dtpEndTime.Value.TimeOfDay;
                string strBegin = dtBegin.ToString(m_strDateFormat);
                string strEnd = dtEnd.ToString(m_strDateFormat);
                //批量下载


                if (dtBegin < dtEnd)
                {
                    //如果路径不存在，那么创建路径
                    if (false == Directory.Exists(LocalConfig.vodDownloadLoc))
                    {
                        Directory.CreateDirectory(LocalConfig.vodDownloadLoc);
                    }

                    //byte[] firstCode = Encoding.UTF8.GetBytes(LocalConfig.vodDownloadLoc);
                    if (optCloud.Checked)
                    {
                        if (optCloud.Tag == null)
                        {
                            MessageBox.Show("没有录像信息");
                            return;
                        }
                        List<UNITED_REC_FILE_INFO_S> lstFile = optCloud.Tag as List<UNITED_REC_FILE_INFO_S>;
                        if (lstFile == null)
                        {
                            return;
                        }
                        downloadID = Download.CloudDownLoad(ref this.sdkManager.stLoginInfo.stUserLoginIDInfo, lstFile[0], Encoding.UTF8.GetBytes(CameraCode), LocalConfig.vodProtocol, LocalConfig.vodDownloadLoc,
                            LocalConfig.downloadSpd, LocalConfig.downloadFormat, dtBegin, dtEnd);
                    }
                    //else if (optBak.Checked)
                    //{
                        
                    //}
                    else if (optSlave.Checked)
                    {
                        if (null != recFileList)
                        {
                            downloadID = Download.SlaveDownLoad(ref this.sdkManager.stLoginInfo.stUserLoginIDInfo, recFileList[0], Encoding.UTF8.GetBytes(CameraCode), LocalConfig.vodProtocol, LocalConfig.vodDownloadLoc,
                                    LocalConfig.downloadSpd, LocalConfig.downloadFormat, dtBegin, dtEnd);
                        }
                    }
                    else
                    {
                        if (null != recFileList)
                        {
                            downloadID = Download.StartDownLoad(ref this.sdkManager.stLoginInfo.stUserLoginIDInfo, recFileList[0], Encoding.UTF8.GetBytes(CameraCode), LocalConfig.vodProtocol, LocalConfig.vodDownloadLoc,
                                LocalConfig.downloadSpd, LocalConfig.downloadFormat, dtBegin, dtEnd);
                        }
                    }
                    //存储此次下载的信息
                    //downLoadFile.downloadID = downloadID;
                    //downLoadFile.downloadPercet = 0;
                    //downLoadFile.startTime = dtBegin;
                    //downLoadFile.endTime = dtEnd;
                }
                else
                {
                    MessageBox.Show("下载时间选择错误！请重新选择！");
                }

                if (null == downloadID)
                {
                    MessageBox.Show("下载失败!");
                }
                else
                {
                    lock (synRoot)
                    {
                        //将欲下载的文件加入下载面板
                        DataRow dr = dt.NewRow();
                        dr["开始时间"] = strBegin;
                        dr["结束时间"] = strEnd;
                        dr["下载进度"] = "0";
                        dt.Rows.Add(dr);
                        downloadIndex++;
                        //dgvVodInfo.Rows[downloadIndex].Tag = downLoadFile;
                    }


                }

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        /// <summary>
        /// XP回调处理函数
        /// </summary>
        /// <param name="stUserLoginIDInfo"></param>
        /// <param name="ulRunInfoType"></param>
        /// <param name="ptrInfo"></param>
        public void XpInfoRush(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, uint ulRunInfoType, IntPtr ptrInfo)
        {
            //this.PostMessage("XP上报消息：" + ulRunInfoType.ToString());
            switch ((XP_RUN_INFO_TYPE_E)ulRunInfoType)
            {
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_SERIES_SNATCH:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_RECORD_VIDEO:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_MEDIA_PROCESS:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_DOWN_MEDIA_PROCESS:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_VOICE_MEDIA_PROCESS:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_RTSP_PROTOCOL:
                    {
                        XP_RUN_INFO_EX_S stDownLoadInfo = (XP_RUN_INFO_EX_S)Marshal.PtrToStructure(ptrInfo, typeof(XP_RUN_INFO_EX_S));
                        MessageBox.Show("RTSP协议组件运行的错误信息");
                    }
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_DOWN_RTSP_PROTOCOL:
                    {
                        //下载rtsp消息
                        DownLoadComplete(ptrInfo);
                    }
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_SIP_LIVE_TIMEOUT:
                    {
                        //if (XpRunMsg != null)
                        //{
                        //    XpRunMsg(null, new RunMsgEventArgs()
                        //    {
                        //        Type = (int)ulRunInfoType,
                        //        Describe = "保活超时" 
                        //    });
                        //}
                    }
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_PASSIVE_MONITOR:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_PASSIVE_START_MONITOR:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_MEDIA_NOT_IDENTIFY:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_RECV_PACKET_NUM:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_RECV_BYTE_NUM:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_VIDEO_FRAME_NUM:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_AUDIO_FRAME_NUM:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_LOST_PACKET_RATIO:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_MEDIA_PLAY_PROGRESS:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_MEDIA_PLAY_END:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_MEDIA_ABNORMAL:
                    break;
                default:
                    break;
            }
        }

        /// <summary>
        /// 下载完成
        /// </summary>
        /// <param name="ptrInfo"></param>
        private void DownLoadComplete(IntPtr ptrInfo)
        {
            try
            {
                XP_RUN_INFO_EX_S stDownLoadInfo = (XP_RUN_INFO_EX_S)Marshal.PtrToStructure(ptrInfo, typeof(XP_RUN_INFO_EX_S));

                //string szDownLoadId = Encoding.UTF8.GetString(stDownLoadInfo.szDownID);
                string szErrorInfo = string.Empty;

                //因为除了ERR_XP_DISK_CAPACITY_WARN之外其他都会自动关闭下载
                if (stDownLoadInfo.ulErrCode != IMOSSDK.ERR_XP_DISK_CAPACITY_WARN)
                {
                    if (stDownLoadInfo.ulErrCode != IMOSSDK.ERR_XP_RTSP_COMPLETE)
                    {
                        MessageBox.Show("下载异常关闭！");
                        //Log.Write.Error("下载通道[" + szDownLoadId.TrimEnd('\0') + "]异常关闭,errcode:" + stDownLoadInfo.ulErrCode + " " + szErrorInfo);
                    }
                    //下载完成后将进度更新为100,再从datagridview中移除此列
                    lock (synRoot)
                    {
                        DataGridViewRowCollection viewRowCollection = dgvVodInfo.Rows;
                        foreach (DataGridViewRow dgvr in viewRowCollection)
                        {
                            //DownloadFileInfo downLoadFileInfo = (DownloadFileInfo)dgvr.Tag;
                            //if (Encoding.UTF8.GetString(downLoadFileInfo.downloadID) == Encoding.UTF8.GetString(stDownLoadInfo.szPortCode))
                            //{                               
                            //    dgvr.Cells["下载进度"].Value = 100; 
                            //    removeIndex.Add(dgvr.Index);
                            //    continue;
                            //}
                        }
                    }
                     
                    //遍历删除下载成功的记录
                     lock (synRoot) 
                     {
                         foreach (int index in removeIndex)
                         {
                             dgvVodInfo.Rows.RemoveAt(index);
                             downloadIndex--;                      
                         }
                         //刷新datagridview
                         dgvVodInfo.Invalidate();
                         removeIndex.Clear();
                     }
                }
            }
            catch (Exception err)
            {
                //Log.Write.Error("DownLoadComplete Exception", err);
            }
        }

        public void changeCameraCode(object sender,IMOS_SDK_DEMO.player.PlayerPanel.cameraCodeEventArgs e )
        {
            this.CameraCode = e.CameraCode;

            SetCameraName(e.CameraCode);
        }

        private void btnEndDownLoad_Click(object sender, EventArgs e)
        {
            //取消下载功能
            uint ulRet = 0;
            DataGridViewRow selectedRow = new DataGridViewRow();
            if(null != dgvVodInfo.CurrentRow)
            {
                selectedRow = dgvVodInfo.Rows[dgvVodInfo.CurrentRow.Index];
            }
            
            if(null != selectedRow && selectedRow.Index >= 0)
            {
                //DownloadFileInfo fileInfo = (DownloadFileInfo)selectedRow.Tag;
                //Byte[] downloadID = fileInfo.downloadID;
                //ulRet = Download. StopDownload(ref sdkManager.stLoginInfo.stUserLoginIDInfo, downloadID);
                ////取消下载同时datagridview去除该列
                //lock(synRoot)
                //{
                //    dgvVodInfo.Rows.RemoveAt(dgvVodInfo.CurrentRow.Index);
                //    downloadIndex--;    
                //    dgvVodInfo.Invalidate();
                //}


                if (0 != ulRet)
                {
                    MessageBox.Show("下载录像出错！" + ulRet);
                } 
            }

        }

        
    } 
}
