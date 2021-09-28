namespace IMOS_SDK_DEMO.vod
{
    partial class VODPanel
    {
        /// <summary> 
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region 组件设计器生成的代码

        /// <summary> 
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.pageVOD = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.optSlave = new System.Windows.Forms.RadioButton();
            this.optMain = new System.Windows.Forms.RadioButton();
            this.optCloud = new System.Windows.Forms.RadioButton();
            this.dgvVodInfo = new System.Windows.Forms.DataGridView();
            this.btnEndDownLoad = new System.Windows.Forms.Button();
            this.btnBeginDownLoad = new System.Windows.Forms.Button();
            this.btnPlayOneByOne = new System.Windows.Forms.Button();
            this.btnStopPlay = new System.Windows.Forms.Button();
            this.btnResume = new System.Windows.Forms.Button();
            this.btnPausePlay = new System.Windows.Forms.Button();
            this.btnSlowPlay = new System.Windows.Forms.Button();
            this.btnQuickPlay = new System.Windows.Forms.Button();
            this.lblCamera = new System.Windows.Forms.Label();
            this.btnPlayRecord = new System.Windows.Forms.Button();
            this.pnlTag = new System.Windows.Forms.Panel();
            this.pnlVodTime = new System.Windows.Forms.Panel();
            this.lblEndTime = new System.Windows.Forms.Label();
            this.lblBeginTime = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnQueryRec = new System.Windows.Forms.Button();
            this.dtpEndTime = new System.Windows.Forms.DateTimePicker();
            this.dtpTimeTag = new System.Windows.Forms.DateTimePicker();
            this.dtpBeginTime = new System.Windows.Forms.DateTimePicker();
            this.dtpEndDate = new System.Windows.Forms.DateTimePicker();
            this.dtpBeginDate = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.ctrlVODTable = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.dgvAlarmInfo = new System.Windows.Forms.DataGridView();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.dcPlayer1 = new IMOS_SDK_DEMO.player.DCPlayer();
            this.pageVOD.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvVodInfo)).BeginInit();
            this.ctrlVODTable.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlarmInfo)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // pageVOD
            // 
            this.pageVOD.BackColor = System.Drawing.SystemColors.Control;
            this.pageVOD.Controls.Add(this.panel1);
            this.pageVOD.Location = new System.Drawing.Point(4, 22);
            this.pageVOD.Name = "pageVOD";
            this.pageVOD.Padding = new System.Windows.Forms.Padding(3);
            this.pageVOD.Size = new System.Drawing.Size(1051, 210);
            this.pageVOD.TabIndex = 0;
            this.pageVOD.Text = "录像控制";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Controls.Add(this.dgvVodInfo);
            this.panel1.Controls.Add(this.btnEndDownLoad);
            this.panel1.Controls.Add(this.btnBeginDownLoad);
            this.panel1.Controls.Add(this.btnPlayOneByOne);
            this.panel1.Controls.Add(this.btnStopPlay);
            this.panel1.Controls.Add(this.btnResume);
            this.panel1.Controls.Add(this.btnPausePlay);
            this.panel1.Controls.Add(this.btnSlowPlay);
            this.panel1.Controls.Add(this.btnQuickPlay);
            this.panel1.Controls.Add(this.lblCamera);
            this.panel1.Controls.Add(this.btnPlayRecord);
            this.panel1.Controls.Add(this.pnlTag);
            this.panel1.Controls.Add(this.pnlVodTime);
            this.panel1.Controls.Add(this.lblEndTime);
            this.panel1.Controls.Add(this.lblBeginTime);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.btnQueryRec);
            this.panel1.Controls.Add(this.dtpEndTime);
            this.panel1.Controls.Add(this.dtpTimeTag);
            this.panel1.Controls.Add(this.dtpBeginTime);
            this.panel1.Controls.Add(this.dtpEndDate);
            this.panel1.Controls.Add(this.dtpBeginDate);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1045, 204);
            this.panel1.TabIndex = 0;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.optSlave);
            this.panel2.Controls.Add(this.optMain);
            this.panel2.Controls.Add(this.optCloud);
            this.panel2.Location = new System.Drawing.Point(26, 48);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(438, 17);
            this.panel2.TabIndex = 61;
            // 
            // optSlave
            // 
            this.optSlave.AutoSize = true;
            this.optSlave.Location = new System.Drawing.Point(230, 2);
            this.optSlave.Name = "optSlave";
            this.optSlave.Size = new System.Drawing.Size(83, 16);
            this.optSlave.TabIndex = 0;
            this.optSlave.TabStop = true;
            this.optSlave.Text = "检索当前域";
            this.optSlave.UseVisualStyleBackColor = true;
            // 
            // optMain
            // 
            this.optMain.AutoSize = true;
            this.optMain.Location = new System.Drawing.Point(101, 2);
            this.optMain.Name = "optMain";
            this.optMain.Size = new System.Drawing.Size(83, 16);
            this.optMain.TabIndex = 0;
            this.optMain.TabStop = true;
            this.optMain.Text = "检索注册域";
            this.optMain.UseVisualStyleBackColor = true;
            // 
            // optCloud
            // 
            this.optCloud.AutoSize = true;
            this.optCloud.Checked = true;
            this.optCloud.Location = new System.Drawing.Point(14, 3);
            this.optCloud.Name = "optCloud";
            this.optCloud.Size = new System.Drawing.Size(59, 16);
            this.optCloud.TabIndex = 0;
            this.optCloud.TabStop = true;
            this.optCloud.Text = "云检索";
            this.optCloud.UseVisualStyleBackColor = true;
            // 
            // dgvVodInfo
            // 
            this.dgvVodInfo.AllowUserToAddRows = false;
            this.dgvVodInfo.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvVodInfo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvVodInfo.Location = new System.Drawing.Point(504, 44);
            this.dgvVodInfo.MultiSelect = false;
            this.dgvVodInfo.Name = "dgvVodInfo";
            this.dgvVodInfo.ReadOnly = true;
            this.dgvVodInfo.RowTemplate.Height = 23;
            this.dgvVodInfo.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvVodInfo.Size = new System.Drawing.Size(538, 154);
            this.dgvVodInfo.TabIndex = 58;
            // 
            // btnEndDownLoad
            // 
            this.btnEndDownLoad.Location = new System.Drawing.Point(760, 15);
            this.btnEndDownLoad.Name = "btnEndDownLoad";
            this.btnEndDownLoad.Size = new System.Drawing.Size(75, 23);
            this.btnEndDownLoad.TabIndex = 60;
            this.btnEndDownLoad.Text = "取消下载";
            this.btnEndDownLoad.UseVisualStyleBackColor = true;
            this.btnEndDownLoad.Click += new System.EventHandler(this.btnEndDownLoad_Click);
            // 
            // btnBeginDownLoad
            // 
            this.btnBeginDownLoad.Location = new System.Drawing.Point(679, 15);
            this.btnBeginDownLoad.Name = "btnBeginDownLoad";
            this.btnBeginDownLoad.Size = new System.Drawing.Size(75, 23);
            this.btnBeginDownLoad.TabIndex = 59;
            this.btnBeginDownLoad.Text = "开始下载";
            this.btnBeginDownLoad.UseVisualStyleBackColor = true;
            this.btnBeginDownLoad.Click += new System.EventHandler(this.btnBeginDownLoad_Click);
            // 
            // btnPlayOneByOne
            // 
            this.btnPlayOneByOne.Location = new System.Drawing.Point(246, 146);
            this.btnPlayOneByOne.Name = "btnPlayOneByOne";
            this.btnPlayOneByOne.Size = new System.Drawing.Size(89, 23);
            this.btnPlayOneByOne.TabIndex = 57;
            this.btnPlayOneByOne.Text = "单帧播放";
            this.btnPlayOneByOne.UseVisualStyleBackColor = true;
            this.btnPlayOneByOne.Click += new System.EventHandler(this.btnPlayOneByOne_Click);
            // 
            // btnStopPlay
            // 
            this.btnStopPlay.Location = new System.Drawing.Point(230, 175);
            this.btnStopPlay.Name = "btnStopPlay";
            this.btnStopPlay.Size = new System.Drawing.Size(45, 23);
            this.btnStopPlay.TabIndex = 56;
            this.btnStopPlay.Text = "停止";
            this.btnStopPlay.UseVisualStyleBackColor = true;
            this.btnStopPlay.Click += new System.EventHandler(this.btnStopPlay_Click);
            // 
            // btnResume
            // 
            this.btnResume.Location = new System.Drawing.Point(180, 175);
            this.btnResume.Name = "btnResume";
            this.btnResume.Size = new System.Drawing.Size(45, 23);
            this.btnResume.TabIndex = 55;
            this.btnResume.Text = "恢复";
            this.btnResume.UseVisualStyleBackColor = true;
            this.btnResume.Click += new System.EventHandler(this.btnResume_Click);
            // 
            // btnPausePlay
            // 
            this.btnPausePlay.Location = new System.Drawing.Point(129, 175);
            this.btnPausePlay.Name = "btnPausePlay";
            this.btnPausePlay.Size = new System.Drawing.Size(45, 23);
            this.btnPausePlay.TabIndex = 55;
            this.btnPausePlay.Text = "暂停";
            this.btnPausePlay.UseVisualStyleBackColor = true;
            this.btnPausePlay.Click += new System.EventHandler(this.btnPausePlay_Click);
            // 
            // btnSlowPlay
            // 
            this.btnSlowPlay.Location = new System.Drawing.Point(69, 175);
            this.btnSlowPlay.Name = "btnSlowPlay";
            this.btnSlowPlay.Size = new System.Drawing.Size(55, 23);
            this.btnSlowPlay.TabIndex = 54;
            this.btnSlowPlay.Text = "快退<<";
            this.btnSlowPlay.UseVisualStyleBackColor = true;
            this.btnSlowPlay.Click += new System.EventHandler(this.btnSlowPlay_Click);
            // 
            // btnQuickPlay
            // 
            this.btnQuickPlay.Location = new System.Drawing.Point(279, 175);
            this.btnQuickPlay.Name = "btnQuickPlay";
            this.btnQuickPlay.Size = new System.Drawing.Size(56, 23);
            this.btnQuickPlay.TabIndex = 53;
            this.btnQuickPlay.Text = ">>快进";
            this.btnQuickPlay.UseVisualStyleBackColor = true;
            this.btnQuickPlay.Click += new System.EventHandler(this.btnQuickPlay_Click);
            // 
            // lblCamera
            // 
            this.lblCamera.AutoSize = true;
            this.lblCamera.Location = new System.Drawing.Point(63, 15);
            this.lblCamera.Name = "lblCamera";
            this.lblCamera.Size = new System.Drawing.Size(0, 12);
            this.lblCamera.TabIndex = 52;
            // 
            // btnPlayRecord
            // 
            this.btnPlayRecord.Location = new System.Drawing.Point(151, 146);
            this.btnPlayRecord.Name = "btnPlayRecord";
            this.btnPlayRecord.Size = new System.Drawing.Size(89, 23);
            this.btnPlayRecord.TabIndex = 51;
            this.btnPlayRecord.Text = "播放录像";
            this.btnPlayRecord.UseVisualStyleBackColor = true;
            this.btnPlayRecord.Click += new System.EventHandler(this.btnPlayRecord_Click);
            // 
            // pnlTag
            // 
            this.pnlTag.BackColor = System.Drawing.Color.Lime;
            this.pnlTag.Location = new System.Drawing.Point(9, 61);
            this.pnlTag.Name = "pnlTag";
            this.pnlTag.Size = new System.Drawing.Size(4, 80);
            this.pnlTag.TabIndex = 50;
            this.pnlTag.Click += new System.EventHandler(this.pnlTag_Click);
            this.pnlTag.Move += new System.EventHandler(this.pnlTag_Click);
            // 
            // pnlVodTime
            // 
            this.pnlVodTime.BackColor = System.Drawing.SystemColors.ControlText;
            this.pnlVodTime.Location = new System.Drawing.Point(12, 87);
            this.pnlVodTime.Name = "pnlVodTime";
            this.pnlVodTime.Size = new System.Drawing.Size(452, 56);
            this.pnlVodTime.TabIndex = 49;
            this.pnlVodTime.Click += new System.EventHandler(this.pnlVodTime_Click);
            // 
            // lblEndTime
            // 
            this.lblEndTime.AutoSize = true;
            this.lblEndTime.Location = new System.Drawing.Point(357, 73);
            this.lblEndTime.Name = "lblEndTime";
            this.lblEndTime.Size = new System.Drawing.Size(53, 12);
            this.lblEndTime.TabIndex = 48;
            this.lblEndTime.Text = "结束时间";
            // 
            // lblBeginTime
            // 
            this.lblBeginTime.AutoSize = true;
            this.lblBeginTime.Location = new System.Drawing.Point(10, 73);
            this.lblBeginTime.Name = "lblBeginTime";
            this.lblBeginTime.Size = new System.Drawing.Size(53, 12);
            this.lblBeginTime.TabIndex = 46;
            this.lblBeginTime.Text = "开始时间";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(160, 72);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 12);
            this.label4.TabIndex = 47;
            this.label4.Text = "时间标签";
            // 
            // btnQueryRec
            // 
            this.btnQueryRec.Location = new System.Drawing.Point(69, 146);
            this.btnQueryRec.Name = "btnQueryRec";
            this.btnQueryRec.Size = new System.Drawing.Size(76, 23);
            this.btnQueryRec.TabIndex = 45;
            this.btnQueryRec.Text = "查询录像";
            this.btnQueryRec.UseVisualStyleBackColor = true;
            this.btnQueryRec.Click += new System.EventHandler(this.btnQueryRec_Click);
            // 
            // dtpEndTime
            // 
            this.dtpEndTime.CustomFormat = "";
            this.dtpEndTime.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.dtpEndTime.Location = new System.Drawing.Point(384, 27);
            this.dtpEndTime.Name = "dtpEndTime";
            this.dtpEndTime.ShowUpDown = true;
            this.dtpEndTime.Size = new System.Drawing.Size(80, 21);
            this.dtpEndTime.TabIndex = 42;
            // 
            // dtpTimeTag
            // 
            this.dtpTimeTag.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.dtpTimeTag.Location = new System.Drawing.Point(219, 70);
            this.dtpTimeTag.Name = "dtpTimeTag";
            this.dtpTimeTag.ShowUpDown = true;
            this.dtpTimeTag.Size = new System.Drawing.Size(80, 21);
            this.dtpTimeTag.TabIndex = 43;
            this.dtpTimeTag.ValueChanged += new System.EventHandler(this.dtpTimeTag_ValueChanged);
            // 
            // dtpBeginTime
            // 
            this.dtpBeginTime.Format = System.Windows.Forms.DateTimePickerFormat.Time;
            this.dtpBeginTime.Location = new System.Drawing.Point(154, 27);
            this.dtpBeginTime.Name = "dtpBeginTime";
            this.dtpBeginTime.ShowUpDown = true;
            this.dtpBeginTime.Size = new System.Drawing.Size(80, 21);
            this.dtpBeginTime.TabIndex = 44;
            // 
            // dtpEndDate
            // 
            this.dtpEndDate.CustomFormat = "yyyy-MM-dd";
            this.dtpEndDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpEndDate.Location = new System.Drawing.Point(295, 27);
            this.dtpEndDate.Name = "dtpEndDate";
            this.dtpEndDate.Size = new System.Drawing.Size(88, 21);
            this.dtpEndDate.TabIndex = 40;
            // 
            // dtpBeginDate
            // 
            this.dtpBeginDate.CustomFormat = "yyyy-MM-dd";
            this.dtpBeginDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpBeginDate.Location = new System.Drawing.Point(65, 27);
            this.dtpBeginDate.Name = "dtpBeginDate";
            this.dtpBeginDate.Size = new System.Drawing.Size(88, 21);
            this.dtpBeginDate.TabIndex = 41;
            this.dtpBeginDate.Value = new System.DateTime(2010, 9, 9, 0, 0, 0, 0);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(240, 31);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 12);
            this.label3.TabIndex = 37;
            this.label3.Text = "结束时间";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 38;
            this.label2.Text = "开始时间";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(7, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 39;
            this.label1.Text = "录像检索";
            // 
            // ctrlVODTable
            // 
            this.ctrlVODTable.Controls.Add(this.pageVOD);
            this.ctrlVODTable.Controls.Add(this.tabPage1);
            this.ctrlVODTable.Controls.Add(this.tabPage2);
            this.ctrlVODTable.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ctrlVODTable.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.ctrlVODTable.Location = new System.Drawing.Point(0, 0);
            this.ctrlVODTable.Name = "ctrlVODTable";
            this.ctrlVODTable.RightToLeftLayout = true;
            this.ctrlVODTable.SelectedIndex = 0;
            this.ctrlVODTable.Size = new System.Drawing.Size(1059, 236);
            this.ctrlVODTable.TabIndex = 16;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.dgvAlarmInfo);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1051, 210);
            this.tabPage1.TabIndex = 1;
            this.tabPage1.Text = "告警信息";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // dgvAlarmInfo
            // 
            this.dgvAlarmInfo.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvAlarmInfo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlarmInfo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvAlarmInfo.Location = new System.Drawing.Point(3, 3);
            this.dgvAlarmInfo.Name = "dgvAlarmInfo";
            this.dgvAlarmInfo.ReadOnly = true;
            this.dgvAlarmInfo.RowTemplate.Height = 23;
            this.dgvAlarmInfo.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvAlarmInfo.Size = new System.Drawing.Size(1045, 204);
            this.dgvAlarmInfo.TabIndex = 0;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.dcPlayer1);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1051, 210);
            this.tabPage2.TabIndex = 2;
            this.tabPage2.Text = "实况上墙";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // dcPlayer1
            // 
            this.dcPlayer1.CamCode = null;
            this.dcPlayer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dcPlayer1.Location = new System.Drawing.Point(3, 3);
            this.dcPlayer1.Name = "dcPlayer1";
            this.dcPlayer1.OrgCode = null;
            this.dcPlayer1.Size = new System.Drawing.Size(1045, 204);
            this.dcPlayer1.TabIndex = 0;
            // 
            // VODPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.ctrlVODTable);
            this.Enabled = false;
            this.Name = "VODPanel";
            this.Size = new System.Drawing.Size(1059, 236);
            this.Load += new System.EventHandler(this.VODPanel_Load);
            this.pageVOD.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvVodInfo)).EndInit();
            this.ctrlVODTable.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlarmInfo)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage pageVOD;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dgvVodInfo;
        private System.Windows.Forms.Button btnEndDownLoad;
        private System.Windows.Forms.Button btnBeginDownLoad;
        private System.Windows.Forms.Button btnPlayOneByOne;
        private System.Windows.Forms.Button btnStopPlay;
        private System.Windows.Forms.Button btnPausePlay;
        private System.Windows.Forms.Button btnSlowPlay;
        private System.Windows.Forms.Button btnQuickPlay;
        private System.Windows.Forms.Label lblCamera;
        private System.Windows.Forms.Button btnPlayRecord;
        private System.Windows.Forms.Panel pnlTag;
        private System.Windows.Forms.Panel pnlVodTime;
        private System.Windows.Forms.Label lblEndTime;
        private System.Windows.Forms.Label lblBeginTime;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnQueryRec;
        private System.Windows.Forms.DateTimePicker dtpEndTime;
        private System.Windows.Forms.DateTimePicker dtpTimeTag;
        private System.Windows.Forms.DateTimePicker dtpBeginTime;
        private System.Windows.Forms.DateTimePicker dtpEndDate;
        private System.Windows.Forms.DateTimePicker dtpBeginDate;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.TabControl ctrlVODTable;
        private System.Windows.Forms.TabPage tabPage1;
        public System.Windows.Forms.DataGridView dgvAlarmInfo;
        private System.Windows.Forms.TabPage tabPage2;
        public IMOS_SDK_DEMO.player.DCPlayer dcPlayer1;

        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.RadioButton optSlave;
        private System.Windows.Forms.RadioButton optMain;
        private System.Windows.Forms.RadioButton optCloud;
        private System.Windows.Forms.Button btnResume;

    }
}
