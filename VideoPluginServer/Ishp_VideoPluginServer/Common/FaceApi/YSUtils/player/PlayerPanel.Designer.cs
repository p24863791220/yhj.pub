namespace IMOS_SDK_DEMO.player
{
    partial class PlayerPanel
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
            this.components = new System.ComponentModel.Container();
            this.pnlPlayerTitle = new System.Windows.Forms.Panel();
            this.tsTitle = new System.Windows.Forms.ToolStrip();
            this.tsButtonClose = new System.Windows.Forms.ToolStripButton();
            this.tsLabelNum = new System.Windows.Forms.ToolStripLabel();
            this.tsButtonFull = new System.Windows.Forms.ToolStripButton();
            this.tsLabelStatus = new System.Windows.Forms.ToolStripLabel();
            this.labelFrame = new System.Windows.Forms.ToolStripLabel();
            this.labelBitrate = new System.Windows.Forms.ToolStripLabel();
            this.labelResolution = new System.Windows.Forms.ToolStripLabel();
            this.PnlPlayerStatus = new System.Windows.Forms.Panel();
            this.tsUnitTools = new System.Windows.Forms.ToolStrip();
            this.tsButtonSnatch = new System.Windows.Forms.ToolStripButton();
            this.tsButtonRecord = new System.Windows.Forms.ToolStripButton();
            this.pnlPlayer = new System.Windows.Forms.Panel();
            this.cmPopup = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmPlayerNum1 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmPlayerNum4 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmPlayerNum9 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmPlayerNum16 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmPlayerNum25 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.tsmCodeStreamOut = new System.Windows.Forms.ToolStripMenuItem();
            this.原始码流ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmSrcStart = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmSrcContinue = new System.Windows.Forms.ToolStripMenuItem();
            this.拼帧后视频ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmpzhspStart = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmpzhspContinue = new System.Windows.Forms.ToolStripMenuItem();
            this.拼帧后音频ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmpzhypStart = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmpzhypContinue = new System.Windows.Forms.ToolStripMenuItem();
            this.解码后视频ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmDecodespStart = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmDecodespContinue = new System.Windows.Forms.ToolStripMenuItem();
            this.解码后音频ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmDecodeypStart = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmDecodeypContinue = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.tsmPlayerMax = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmPlayerClose = new System.Windows.Forms.ToolStripMenuItem();
            this.tsButtonStartTalk = new System.Windows.Forms.ToolStripButton();
            this.tsButtonStopTalk = new System.Windows.Forms.ToolStripButton();
            this.tsButton1Stream = new System.Windows.Forms.ToolStripButton();
            this.tsButton2Stream = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.pnlPlayerTitle.SuspendLayout();
            this.tsTitle.SuspendLayout();
            this.PnlPlayerStatus.SuspendLayout();
            this.tsUnitTools.SuspendLayout();
            this.pnlPlayer.SuspendLayout();
            this.cmPopup.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlPlayerTitle
            // 
            this.pnlPlayerTitle.BackColor = System.Drawing.Color.Lavender;
            this.pnlPlayerTitle.Controls.Add(this.tsTitle);
            this.pnlPlayerTitle.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlPlayerTitle.Location = new System.Drawing.Point(0, 0);
            this.pnlPlayerTitle.Name = "pnlPlayerTitle";
            this.pnlPlayerTitle.Size = new System.Drawing.Size(213, 16);
            this.pnlPlayerTitle.TabIndex = 0;
            this.pnlPlayerTitle.Visible = false;
            // 
            // tsTitle
            // 
            this.tsTitle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tsTitle.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsButtonClose,
            this.tsLabelNum,
            this.tsButtonFull,
            this.tsLabelStatus,
            this.labelFrame,
            this.labelBitrate,
            this.labelResolution});
            this.tsTitle.Location = new System.Drawing.Point(0, 0);
            this.tsTitle.Name = "tsTitle";
            this.tsTitle.Size = new System.Drawing.Size(213, 16);
            this.tsTitle.TabIndex = 1;
            this.tsTitle.Text = "toolStrip2";
            this.tsTitle.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.tsTitle_MouseDoubleClick);
            this.tsTitle.MouseLeave += new System.EventHandler(this.tsTitle_MouseLeave);
            // 
            // tsButtonClose
            // 
            this.tsButtonClose.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.tsButtonClose.AutoSize = false;
            this.tsButtonClose.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonClose.Image = global::IMOS_SDK_DEMO.Properties.Resources.close;
            this.tsButtonClose.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonClose.Name = "tsButtonClose";
            this.tsButtonClose.Size = new System.Drawing.Size(16, 16);
            this.tsButtonClose.Text = "toolStripButton6";
            this.tsButtonClose.ToolTipText = "关闭";
            this.tsButtonClose.Click += new System.EventHandler(this.tsButtonClose_Click);
            // 
            // tsLabelNum
            // 
            this.tsLabelNum.Name = "tsLabelNum";
            this.tsLabelNum.Size = new System.Drawing.Size(29, 13);
            this.tsLabelNum.Text = "111";
            // 
            // tsButtonFull
            // 
            this.tsButtonFull.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.tsButtonFull.AutoSize = false;
            this.tsButtonFull.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonFull.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.max;
            this.tsButtonFull.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonFull.Name = "tsButtonFull";
            this.tsButtonFull.Size = new System.Drawing.Size(16, 16);
            this.tsButtonFull.Text = "toolStripButton6";
            this.tsButtonFull.ToolTipText = "最大化";
            this.tsButtonFull.Click += new System.EventHandler(this.tsButtonFull_Click);
            // 
            // tsLabelStatus
            // 
            this.tsLabelStatus.Name = "tsLabelStatus";
            this.tsLabelStatus.Size = new System.Drawing.Size(0, 13);
            // 
            // labelFrame
            // 
            this.labelFrame.Name = "labelFrame";
            this.labelFrame.Size = new System.Drawing.Size(0, 13);
            // 
            // labelBitrate
            // 
            this.labelBitrate.Name = "labelBitrate";
            this.labelBitrate.Size = new System.Drawing.Size(0, 13);
            // 
            // labelResolution
            // 
            this.labelResolution.Name = "labelResolution";
            this.labelResolution.Size = new System.Drawing.Size(0, 13);
            // 
            // PnlPlayerStatus
            // 
            this.PnlPlayerStatus.Controls.Add(this.tsUnitTools);
            this.PnlPlayerStatus.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.PnlPlayerStatus.Location = new System.Drawing.Point(0, 157);
            this.PnlPlayerStatus.Name = "PnlPlayerStatus";
            this.PnlPlayerStatus.Size = new System.Drawing.Size(213, 16);
            this.PnlPlayerStatus.TabIndex = 1;
            this.PnlPlayerStatus.Visible = false;
            // 
            // tsUnitTools
            // 
            this.tsUnitTools.AutoSize = false;
            this.tsUnitTools.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.tsUnitTools.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tsUnitTools.GripMargin = new System.Windows.Forms.Padding(0);
            this.tsUnitTools.ImageScalingSize = new System.Drawing.Size(18, 18);
            this.tsUnitTools.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsButtonSnatch,
            this.tsButtonRecord,
            this.toolStripSeparator3,
            this.tsButtonStartTalk,
            this.tsButtonStopTalk,
            this.toolStripSeparator4,
            this.tsButton1Stream,
            this.tsButton2Stream,
            this.toolStripSeparator5});
            this.tsUnitTools.Location = new System.Drawing.Point(0, 0);
            this.tsUnitTools.Name = "tsUnitTools";
            this.tsUnitTools.Size = new System.Drawing.Size(213, 16);
            this.tsUnitTools.TabIndex = 0;
            this.tsUnitTools.Text = "toolStrip1";
            this.tsUnitTools.MouseLeave += new System.EventHandler(this.tsUnitTools_MouseLeave);
            // 
            // tsButtonSnatch
            // 
            this.tsButtonSnatch.AutoSize = false;
            this.tsButtonSnatch.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonSnatch.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.SnatchOnce;
            this.tsButtonSnatch.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonSnatch.Name = "tsButtonSnatch";
            this.tsButtonSnatch.Size = new System.Drawing.Size(18, 18);
            this.tsButtonSnatch.Text = "toolStripButton1";
            this.tsButtonSnatch.ToolTipText = "开始抓拍";
            this.tsButtonSnatch.Click += new System.EventHandler(this.tsButtonSnatch_Click);
            // 
            // tsButtonRecord
            // 
            this.tsButtonRecord.AutoSize = false;
            this.tsButtonRecord.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonRecord.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.StorageStart;
            this.tsButtonRecord.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonRecord.Name = "tsButtonRecord";
            this.tsButtonRecord.Size = new System.Drawing.Size(18, 18);
            this.tsButtonRecord.Text = "toolStripButton2";
            this.tsButtonRecord.ToolTipText = "本地录像";
            this.tsButtonRecord.Click += new System.EventHandler(this.tsButtonRecord_Click);
            // 
            // pnlPlayer
            // 
            this.pnlPlayer.AllowDrop = true;
            this.pnlPlayer.BackColor = System.Drawing.Color.Black;
            this.pnlPlayer.Controls.Add(this.PnlPlayerStatus);
            this.pnlPlayer.Controls.Add(this.pnlPlayerTitle);
            this.pnlPlayer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlPlayer.Location = new System.Drawing.Point(0, 0);
            this.pnlPlayer.Name = "pnlPlayer";
            this.pnlPlayer.Size = new System.Drawing.Size(213, 173);
            this.pnlPlayer.TabIndex = 2;
            this.pnlPlayer.MouseLeave += new System.EventHandler(this.pnlPlayer_MouseLeave);
            this.pnlPlayer.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pnlPlayer_MouseDown);
            this.pnlPlayer.MouseHover += new System.EventHandler(this.pnlPlayer_MouseHover);
            // 
            // cmPopup
            // 
            this.cmPopup.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmPlayerNum1,
            this.tsmPlayerNum4,
            this.tsmPlayerNum9,
            this.tsmPlayerNum16,
            this.tsmPlayerNum25,
            this.toolStripSeparator1,
            this.tsmCodeStreamOut,
            this.toolStripSeparator2,
            this.tsmPlayerMax,
            this.tsmPlayerClose});
            this.cmPopup.Name = "cmPopup";
            this.cmPopup.Size = new System.Drawing.Size(137, 192);
            // 
            // tsmPlayerNum1
            // 
            this.tsmPlayerNum1.Name = "tsmPlayerNum1";
            this.tsmPlayerNum1.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerNum1.Text = "一分屏";
            this.tsmPlayerNum1.Click += new System.EventHandler(this.tsmPlayerNum1_Click);
            // 
            // tsmPlayerNum4
            // 
            this.tsmPlayerNum4.Name = "tsmPlayerNum4";
            this.tsmPlayerNum4.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerNum4.Text = "四分屏";
            this.tsmPlayerNum4.Click += new System.EventHandler(this.tsmPlayerNum4_Click);
            // 
            // tsmPlayerNum9
            // 
            this.tsmPlayerNum9.Name = "tsmPlayerNum9";
            this.tsmPlayerNum9.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerNum9.Text = "九分屏";
            this.tsmPlayerNum9.Click += new System.EventHandler(this.tsmPlayerNum9_Click);
            // 
            // tsmPlayerNum16
            // 
            this.tsmPlayerNum16.Name = "tsmPlayerNum16";
            this.tsmPlayerNum16.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerNum16.Text = "十六分屏";
            this.tsmPlayerNum16.Click += new System.EventHandler(this.tsmPlayerNum16_Click);
            // 
            // tsmPlayerNum25
            // 
            this.tsmPlayerNum25.Name = "tsmPlayerNum25";
            this.tsmPlayerNum25.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerNum25.Text = "二十五分屏";
            this.tsmPlayerNum25.Click += new System.EventHandler(this.tsmPlayerNum25_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(133, 6);
            // 
            // tsmCodeStreamOut
            // 
            this.tsmCodeStreamOut.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.原始码流ToolStripMenuItem,
            this.拼帧后视频ToolStripMenuItem,
            this.拼帧后音频ToolStripMenuItem,
            this.解码后视频ToolStripMenuItem,
            this.解码后音频ToolStripMenuItem});
            this.tsmCodeStreamOut.Name = "tsmCodeStreamOut";
            this.tsmCodeStreamOut.Size = new System.Drawing.Size(136, 22);
            this.tsmCodeStreamOut.Text = "码流输出";
            // 
            // 原始码流ToolStripMenuItem
            // 
            this.原始码流ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmSrcStart,
            this.tsmSrcContinue});
            this.原始码流ToolStripMenuItem.Name = "原始码流ToolStripMenuItem";
            this.原始码流ToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.原始码流ToolStripMenuItem.Text = "原始码流";
            // 
            // tsmSrcStart
            // 
            this.tsmSrcStart.Name = "tsmSrcStart";
            this.tsmSrcStart.Size = new System.Drawing.Size(125, 22);
            this.tsmSrcStart.Text = "启动";
            this.tsmSrcStart.CheckedChanged += new System.EventHandler(this.tsmSrcStart_CheckedChanged);
            this.tsmSrcStart.Click += new System.EventHandler(this.tsmSrcStart_Click);
            // 
            // tsmSrcContinue
            // 
            this.tsmSrcContinue.Checked = true;
            this.tsmSrcContinue.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmSrcContinue.Name = "tsmSrcContinue";
            this.tsmSrcContinue.Size = new System.Drawing.Size(125, 22);
            this.tsmSrcContinue.Text = "continue";
            this.tsmSrcContinue.Click += new System.EventHandler(this.tsmSrcContinue_Click);
            // 
            // 拼帧后视频ToolStripMenuItem
            // 
            this.拼帧后视频ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmpzhspStart,
            this.tsmpzhspContinue});
            this.拼帧后视频ToolStripMenuItem.Name = "拼帧后视频ToolStripMenuItem";
            this.拼帧后视频ToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.拼帧后视频ToolStripMenuItem.Text = "拼帧后视频";
            // 
            // tsmpzhspStart
            // 
            this.tsmpzhspStart.Name = "tsmpzhspStart";
            this.tsmpzhspStart.Size = new System.Drawing.Size(125, 22);
            this.tsmpzhspStart.Text = "启动";
            this.tsmpzhspStart.CheckedChanged += new System.EventHandler(this.tsmpzhspStart_CheckedChanged);
            this.tsmpzhspStart.Click += new System.EventHandler(this.tsmpzhspStart_Click);
            // 
            // tsmpzhspContinue
            // 
            this.tsmpzhspContinue.Checked = true;
            this.tsmpzhspContinue.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmpzhspContinue.Name = "tsmpzhspContinue";
            this.tsmpzhspContinue.Size = new System.Drawing.Size(125, 22);
            this.tsmpzhspContinue.Text = "continue";
            this.tsmpzhspContinue.Click += new System.EventHandler(this.tsmpzhspContinue_Click);
            // 
            // 拼帧后音频ToolStripMenuItem
            // 
            this.拼帧后音频ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmpzhypStart,
            this.tsmpzhypContinue});
            this.拼帧后音频ToolStripMenuItem.Name = "拼帧后音频ToolStripMenuItem";
            this.拼帧后音频ToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.拼帧后音频ToolStripMenuItem.Text = "拼帧后音频";
            this.拼帧后音频ToolStripMenuItem.Visible = false;
            // 
            // tsmpzhypStart
            // 
            this.tsmpzhypStart.Name = "tsmpzhypStart";
            this.tsmpzhypStart.Size = new System.Drawing.Size(125, 22);
            this.tsmpzhypStart.Text = "启动";
            this.tsmpzhypStart.CheckedChanged += new System.EventHandler(this.tsmpzhypStart_CheckedChanged);
            this.tsmpzhypStart.Click += new System.EventHandler(this.tsmpzhypStart_Click);
            // 
            // tsmpzhypContinue
            // 
            this.tsmpzhypContinue.Checked = true;
            this.tsmpzhypContinue.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmpzhypContinue.Name = "tsmpzhypContinue";
            this.tsmpzhypContinue.Size = new System.Drawing.Size(125, 22);
            this.tsmpzhypContinue.Text = "continue";
            this.tsmpzhypContinue.Click += new System.EventHandler(this.tsmpzhypContinue_Click);
            // 
            // 解码后视频ToolStripMenuItem
            // 
            this.解码后视频ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmDecodespStart,
            this.tsmDecodespContinue});
            this.解码后视频ToolStripMenuItem.Name = "解码后视频ToolStripMenuItem";
            this.解码后视频ToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.解码后视频ToolStripMenuItem.Text = "解码后视频";
            // 
            // tsmDecodespStart
            // 
            this.tsmDecodespStart.Name = "tsmDecodespStart";
            this.tsmDecodespStart.Size = new System.Drawing.Size(125, 22);
            this.tsmDecodespStart.Text = "启动";
            this.tsmDecodespStart.CheckedChanged += new System.EventHandler(this.tsmDecodespStart_CheckedChanged);
            this.tsmDecodespStart.Click += new System.EventHandler(this.tsmDecodespStart_Click);
            // 
            // tsmDecodespContinue
            // 
            this.tsmDecodespContinue.Checked = true;
            this.tsmDecodespContinue.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmDecodespContinue.Name = "tsmDecodespContinue";
            this.tsmDecodespContinue.Size = new System.Drawing.Size(125, 22);
            this.tsmDecodespContinue.Text = "continue";
            this.tsmDecodespContinue.Click += new System.EventHandler(this.tsmDecodespContinue_Click);
            // 
            // 解码后音频ToolStripMenuItem
            // 
            this.解码后音频ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmDecodeypStart,
            this.tsmDecodeypContinue});
            this.解码后音频ToolStripMenuItem.Name = "解码后音频ToolStripMenuItem";
            this.解码后音频ToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.解码后音频ToolStripMenuItem.Text = "解码后音频";
            this.解码后音频ToolStripMenuItem.Visible = false;
            // 
            // tsmDecodeypStart
            // 
            this.tsmDecodeypStart.Name = "tsmDecodeypStart";
            this.tsmDecodeypStart.Size = new System.Drawing.Size(125, 22);
            this.tsmDecodeypStart.Text = "启动";
            this.tsmDecodeypStart.CheckedChanged += new System.EventHandler(this.tsmDecodeypStart_CheckedChanged);
            this.tsmDecodeypStart.Click += new System.EventHandler(this.tsmDecodeypStart_Click);
            // 
            // tsmDecodeypContinue
            // 
            this.tsmDecodeypContinue.Checked = true;
            this.tsmDecodeypContinue.CheckState = System.Windows.Forms.CheckState.Checked;
            this.tsmDecodeypContinue.Name = "tsmDecodeypContinue";
            this.tsmDecodeypContinue.Size = new System.Drawing.Size(125, 22);
            this.tsmDecodeypContinue.Text = "continue";
            this.tsmDecodeypContinue.Click += new System.EventHandler(this.tsmDecodeypContinue_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(133, 6);
            // 
            // tsmPlayerMax
            // 
            this.tsmPlayerMax.Name = "tsmPlayerMax";
            this.tsmPlayerMax.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerMax.Text = "最大化";
            this.tsmPlayerMax.Click += new System.EventHandler(this.tsmPlayerMax_Click);
            // 
            // tsmPlayerClose
            // 
            this.tsmPlayerClose.Name = "tsmPlayerClose";
            this.tsmPlayerClose.Size = new System.Drawing.Size(136, 22);
            this.tsmPlayerClose.Text = "关闭";
            this.tsmPlayerClose.Click += new System.EventHandler(this.tsmPlayerClose_Click);
            // 
            // tsButtonStartTalk
            // 
            this.tsButtonStartTalk.AutoSize = false;
            this.tsButtonStartTalk.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonStartTalk.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.starttalk;
            this.tsButtonStartTalk.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonStartTalk.Name = "tsButtonStartTalk";
            this.tsButtonStartTalk.Size = new System.Drawing.Size(18, 18);
            this.tsButtonStartTalk.Text = "开启声音";
            this.tsButtonStartTalk.Click += new System.EventHandler(this.tsButtonStartTalk_Click);
            // 
            // tsButtonStopTalk
            // 
            this.tsButtonStopTalk.AutoSize = false;
            this.tsButtonStopTalk.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButtonStopTalk.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.stoptalk;
            this.tsButtonStopTalk.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButtonStopTalk.Name = "tsButtonStopTalk";
            this.tsButtonStopTalk.Size = new System.Drawing.Size(18, 18);
            this.tsButtonStopTalk.Text = "关闭声音";
            this.tsButtonStopTalk.Click += new System.EventHandler(this.tsButtonStopTalk_Click);
            // 
            // tsButton1Stream
            // 
            this.tsButton1Stream.AutoSize = false;
            this.tsButton1Stream.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButton1Stream.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.applications_multimedia;
            this.tsButton1Stream.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButton1Stream.Name = "tsButton1Stream";
            this.tsButton1Stream.Size = new System.Drawing.Size(18, 18);
            this.tsButton1Stream.ToolTipText = "开启主流";
            this.tsButton1Stream.Click += new System.EventHandler(this.tsButton1Stream_Click);
            // 
            // tsButton2Stream
            // 
            this.tsButton2Stream.AutoSize = false;
            this.tsButton2Stream.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tsButton2Stream.Image = null;//global::IMOS_SDK_DEMO.Properties.Resources.bookmark_new;
            this.tsButton2Stream.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.tsButton2Stream.Name = "tsButton2Stream";
            this.tsButton2Stream.Size = new System.Drawing.Size(18, 18);
            this.tsButton2Stream.Text = "toolStripButton3";
            this.tsButton2Stream.ToolTipText = "切换辅流";
            this.tsButton2Stream.Click += new System.EventHandler(this.tsButton2Stream_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 16);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(6, 16);
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(6, 16);
            // 
            // PlayerPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.pnlPlayer);
            this.Name = "PlayerPanel";
            this.Size = new System.Drawing.Size(213, 173);
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.PlayerPanel_Paint);
            this.pnlPlayerTitle.ResumeLayout(false);
            this.pnlPlayerTitle.PerformLayout();
            this.tsTitle.ResumeLayout(false);
            this.tsTitle.PerformLayout();
            this.PnlPlayerStatus.ResumeLayout(false);
            this.tsUnitTools.ResumeLayout(false);
            this.tsUnitTools.PerformLayout();
            this.pnlPlayer.ResumeLayout(false);
            this.cmPopup.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlPlayerTitle;
        private System.Windows.Forms.Panel PnlPlayerStatus;
        private System.Windows.Forms.Panel pnlPlayer;
        private System.Windows.Forms.ToolStrip tsUnitTools;
        private System.Windows.Forms.ToolStripButton tsButtonSnatch;
        private System.Windows.Forms.ToolStripButton tsButtonRecord;
        private System.Windows.Forms.ToolStrip tsTitle;
        private System.Windows.Forms.ToolStripButton tsButtonClose;
        private System.Windows.Forms.ToolStripLabel tsLabelNum;
        private System.Windows.Forms.ToolStripButton tsButtonFull;
        private System.Windows.Forms.ContextMenuStrip cmPopup;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerNum1;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerNum4;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerNum9;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerNum16;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerNum25;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerMax;
        private System.Windows.Forms.ToolStripMenuItem tsmPlayerClose;
        private System.Windows.Forms.ToolStripLabel tsLabelStatus;
        private System.Windows.Forms.ToolStripLabel labelFrame;
        private System.Windows.Forms.ToolStripLabel labelBitrate;
        private System.Windows.Forms.ToolStripLabel labelResolution;
        private System.Windows.Forms.ToolStripMenuItem tsmCodeStreamOut;
        private System.Windows.Forms.ToolStripMenuItem 原始码流ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmSrcStart;
        private System.Windows.Forms.ToolStripMenuItem tsmSrcContinue;
        private System.Windows.Forms.ToolStripMenuItem 拼帧后视频ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmpzhspStart;
        private System.Windows.Forms.ToolStripMenuItem tsmpzhspContinue;
        private System.Windows.Forms.ToolStripMenuItem 拼帧后音频ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmpzhypStart;
        private System.Windows.Forms.ToolStripMenuItem tsmpzhypContinue;
        private System.Windows.Forms.ToolStripMenuItem 解码后视频ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmDecodespStart;
        private System.Windows.Forms.ToolStripMenuItem tsmDecodespContinue;
        private System.Windows.Forms.ToolStripMenuItem 解码后音频ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmDecodeypStart;
        private System.Windows.Forms.ToolStripMenuItem tsmDecodeypContinue;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripButton tsButtonStartTalk;
        private System.Windows.Forms.ToolStripButton tsButtonStopTalk;
        private System.Windows.Forms.ToolStripButton tsButton1Stream;
        private System.Windows.Forms.ToolStripButton tsButton2Stream;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
    }
}
