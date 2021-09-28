namespace IMOS_SDK_DEMO.config
{
    partial class ConfigPanel
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
            this.tabConfig = new System.Windows.Forms.TabControl();
            this.tabPageEC = new System.Windows.Forms.TabPage();
            this.splitter1 = new System.Windows.Forms.Splitter();
            this.pnlECChanel = new System.Windows.Forms.Panel();
            this.listECChanel = new System.Windows.Forms.ListView();
            this.chECChanelIndex = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chCameraName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chCameraType = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chPTZType = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chPTZPort = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chMCIPAddr = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chMCPort = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnRefECChanel = new System.Windows.Forms.Button();
            this.btnDelECChanel = new System.Windows.Forms.Button();
            this.btnAddECChanel = new System.Windows.Forms.Button();
            this.btnEditECChanel = new System.Windows.Forms.Button();
            this.pnlEC = new System.Windows.Forms.Panel();
            this.listEC = new System.Windows.Forms.ListView();
            this.chECName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chECCode = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chECIP = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chECType = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chECStatus = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnRefEC = new System.Windows.Forms.Button();
            this.btnDelEC = new System.Windows.Forms.Button();
            this.btnEditEC = new System.Windows.Forms.Button();
            this.btnAddEC = new System.Windows.Forms.Button();
            this.tabPageDC = new System.Windows.Forms.TabPage();
            this.splitter2 = new System.Windows.Forms.Splitter();
            this.pnlDCChanel = new System.Windows.Forms.Panel();
            this.listDCChanel = new System.Windows.Forms.ListView();
            this.chDCChanelIndex = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chMonitorName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel4 = new System.Windows.Forms.Panel();
            this.btnRefDCChanel = new System.Windows.Forms.Button();
            this.btnDelDCChanel = new System.Windows.Forms.Button();
            this.btnEditDCChanel = new System.Windows.Forms.Button();
            this.btAddDCChanel = new System.Windows.Forms.Button();
            this.pnlDC = new System.Windows.Forms.Panel();
            this.listDC = new System.Windows.Forms.ListView();
            this.chDCName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chDCCode = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chDCIP = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chDCType = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.chDCStatus = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel3 = new System.Windows.Forms.Panel();
            this.btnRefDC = new System.Windows.Forms.Button();
            this.btnDelDC = new System.Windows.Forms.Button();
            this.btnEditDC = new System.Windows.Forms.Button();
            this.btnAddDC = new System.Windows.Forms.Button();
            this.tabConfig.SuspendLayout();
            this.tabPageEC.SuspendLayout();
            this.pnlECChanel.SuspendLayout();
            this.panel2.SuspendLayout();
            this.pnlEC.SuspendLayout();
            this.panel1.SuspendLayout();
            this.tabPageDC.SuspendLayout();
            this.pnlDCChanel.SuspendLayout();
            this.panel4.SuspendLayout();
            this.pnlDC.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabConfig
            // 
            this.tabConfig.Controls.Add(this.tabPageEC);
            this.tabConfig.Controls.Add(this.tabPageDC);
            this.tabConfig.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabConfig.Location = new System.Drawing.Point(0, 0);
            this.tabConfig.Name = "tabConfig";
            this.tabConfig.SelectedIndex = 0;
            this.tabConfig.Size = new System.Drawing.Size(559, 504);
            this.tabConfig.TabIndex = 0;
            // 
            // tabPageEC
            // 
            this.tabPageEC.Controls.Add(this.splitter1);
            this.tabPageEC.Controls.Add(this.pnlECChanel);
            this.tabPageEC.Controls.Add(this.pnlEC);
            this.tabPageEC.Location = new System.Drawing.Point(4, 22);
            this.tabPageEC.Name = "tabPageEC";
            this.tabPageEC.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageEC.Size = new System.Drawing.Size(551, 478);
            this.tabPageEC.TabIndex = 0;
            this.tabPageEC.Text = "编码器配置";
            this.tabPageEC.UseVisualStyleBackColor = true;
            // 
            // splitter1
            // 
            this.splitter1.Dock = System.Windows.Forms.DockStyle.Top;
            this.splitter1.Location = new System.Drawing.Point(3, 312);
            this.splitter1.Name = "splitter1";
            this.splitter1.Size = new System.Drawing.Size(545, 3);
            this.splitter1.TabIndex = 2;
            this.splitter1.TabStop = false;
            // 
            // pnlECChanel
            // 
            this.pnlECChanel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlECChanel.Controls.Add(this.listECChanel);
            this.pnlECChanel.Controls.Add(this.panel2);
            this.pnlECChanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlECChanel.Location = new System.Drawing.Point(3, 312);
            this.pnlECChanel.Name = "pnlECChanel";
            this.pnlECChanel.Size = new System.Drawing.Size(545, 163);
            this.pnlECChanel.TabIndex = 1;
            // 
            // listECChanel
            // 
            this.listECChanel.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.chECChanelIndex,
            this.chCameraName,
            this.chCameraType,
            this.chPTZType,
            this.chPTZPort,
            this.chMCIPAddr,
            this.chMCPort});
            this.listECChanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listECChanel.FullRowSelect = true;
            this.listECChanel.GridLines = true;
            this.listECChanel.HideSelection = false;
            this.listECChanel.Location = new System.Drawing.Point(0, 24);
            this.listECChanel.Name = "listECChanel";
            this.listECChanel.Size = new System.Drawing.Size(541, 135);
            this.listECChanel.TabIndex = 1;
            this.listECChanel.UseCompatibleStateImageBehavior = false;
            this.listECChanel.View = System.Windows.Forms.View.Details;
            // 
            // chECChanelIndex
            // 
            this.chECChanelIndex.Text = "通道号";
            this.chECChanelIndex.Width = 54;
            // 
            // chCameraName
            // 
            this.chCameraName.Text = "摄像机名称";
            this.chCameraName.Width = 127;
            // 
            // chCameraType
            // 
            this.chCameraType.Text = "摄像机类型";
            this.chCameraType.Width = 89;
            // 
            // chPTZType
            // 
            this.chPTZType.Text = "云台协议";
            this.chPTZType.Width = 91;
            // 
            // chPTZPort
            // 
            this.chPTZPort.Text = "云台地址码";
            this.chPTZPort.Width = 78;
            // 
            // chMCIPAddr
            // 
            this.chMCIPAddr.Text = "组播IP地址";
            this.chMCIPAddr.Width = 124;
            // 
            // chMCPort
            // 
            this.chMCPort.Text = "组播端口";
            this.chMCPort.Width = 70;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnRefECChanel);
            this.panel2.Controls.Add(this.btnDelECChanel);
            this.panel2.Controls.Add(this.btnAddECChanel);
            this.panel2.Controls.Add(this.btnEditECChanel);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(541, 24);
            this.panel2.TabIndex = 0;
            // 
            // btnRefECChanel
            // 
            this.btnRefECChanel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefECChanel.Location = new System.Drawing.Point(485, 1);
            this.btnRefECChanel.Name = "btnRefECChanel";
            this.btnRefECChanel.Size = new System.Drawing.Size(56, 21);
            this.btnRefECChanel.TabIndex = 0;
            this.btnRefECChanel.Text = "刷新";
            this.btnRefECChanel.UseVisualStyleBackColor = true;
            this.btnRefECChanel.Click += new System.EventHandler(this.btnRefECChanel_Click);
            // 
            // btnDelECChanel
            // 
            this.btnDelECChanel.Enabled = false;
            this.btnDelECChanel.Location = new System.Drawing.Point(112, 1);
            this.btnDelECChanel.Name = "btnDelECChanel";
            this.btnDelECChanel.Size = new System.Drawing.Size(56, 21);
            this.btnDelECChanel.TabIndex = 0;
            this.btnDelECChanel.Text = "删除";
            this.btnDelECChanel.UseVisualStyleBackColor = true;
            // 
            // btnAddECChanel
            // 
            this.btnAddECChanel.Enabled = false;
            this.btnAddECChanel.Location = new System.Drawing.Point(0, 1);
            this.btnAddECChanel.Name = "btnAddECChanel";
            this.btnAddECChanel.Size = new System.Drawing.Size(56, 21);
            this.btnAddECChanel.TabIndex = 0;
            this.btnAddECChanel.Text = "添加";
            this.btnAddECChanel.UseVisualStyleBackColor = true;
            // 
            // btnEditECChanel
            // 
            this.btnEditECChanel.Location = new System.Drawing.Point(56, 1);
            this.btnEditECChanel.Name = "btnEditECChanel";
            this.btnEditECChanel.Size = new System.Drawing.Size(56, 21);
            this.btnEditECChanel.TabIndex = 0;
            this.btnEditECChanel.Text = "编辑";
            this.btnEditECChanel.UseVisualStyleBackColor = true;
            this.btnEditECChanel.Click += new System.EventHandler(this.btnEditECChanel_Click);
            // 
            // pnlEC
            // 
            this.pnlEC.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.pnlEC.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlEC.Controls.Add(this.listEC);
            this.pnlEC.Controls.Add(this.panel1);
            this.pnlEC.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlEC.Location = new System.Drawing.Point(3, 3);
            this.pnlEC.Name = "pnlEC";
            this.pnlEC.Size = new System.Drawing.Size(545, 309);
            this.pnlEC.TabIndex = 0;
            // 
            // listEC
            // 
            this.listEC.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.listEC.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.chECName,
            this.chECCode,
            this.chECIP,
            this.chECType,
            this.chECStatus});
            this.listEC.FullRowSelect = true;
            this.listEC.GridLines = true;
            this.listEC.HideSelection = false;
            this.listEC.Location = new System.Drawing.Point(0, 24);
            this.listEC.Name = "listEC";
            this.listEC.Size = new System.Drawing.Size(541, 281);
            this.listEC.TabIndex = 2;
            this.listEC.UseCompatibleStateImageBehavior = false;
            this.listEC.View = System.Windows.Forms.View.Details;
            this.listEC.SelectedIndexChanged += new System.EventHandler(this.listEC_SelectedIndexChanged);
            // 
            // chECName
            // 
            this.chECName.Text = "编码器名称";
            this.chECName.Width = 116;
            // 
            // chECCode
            // 
            this.chECCode.Text = "设备编码";
            this.chECCode.Width = 120;
            // 
            // chECIP
            // 
            this.chECIP.Text = "设备IP";
            this.chECIP.Width = 99;
            // 
            // chECType
            // 
            this.chECType.Text = "设备类型";
            this.chECType.Width = 126;
            // 
            // chECStatus
            // 
            this.chECStatus.Text = "在线状态";
            this.chECStatus.Width = 122;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnRefEC);
            this.panel1.Controls.Add(this.btnDelEC);
            this.panel1.Controls.Add(this.btnEditEC);
            this.panel1.Controls.Add(this.btnAddEC);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(541, 24);
            this.panel1.TabIndex = 1;
            // 
            // btnRefEC
            // 
            this.btnRefEC.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefEC.Location = new System.Drawing.Point(485, 1);
            this.btnRefEC.Name = "btnRefEC";
            this.btnRefEC.Size = new System.Drawing.Size(56, 21);
            this.btnRefEC.TabIndex = 0;
            this.btnRefEC.Text = "刷新";
            this.btnRefEC.UseVisualStyleBackColor = true;
            this.btnRefEC.Click += new System.EventHandler(this.btnRefEC_Click);
            // 
            // btnDelEC
            // 
            this.btnDelEC.Location = new System.Drawing.Point(112, 1);
            this.btnDelEC.Name = "btnDelEC";
            this.btnDelEC.Size = new System.Drawing.Size(56, 21);
            this.btnDelEC.TabIndex = 0;
            this.btnDelEC.Text = "删除";
            this.btnDelEC.UseVisualStyleBackColor = true;
            this.btnDelEC.Click += new System.EventHandler(this.btnDelEC_Click);
            // 
            // btnEditEC
            // 
            this.btnEditEC.Location = new System.Drawing.Point(56, 1);
            this.btnEditEC.Name = "btnEditEC";
            this.btnEditEC.Size = new System.Drawing.Size(56, 21);
            this.btnEditEC.TabIndex = 0;
            this.btnEditEC.Text = "编辑";
            this.btnEditEC.UseVisualStyleBackColor = true;
            this.btnEditEC.Click += new System.EventHandler(this.btnEditEC_Click);
            // 
            // btnAddEC
            // 
            this.btnAddEC.Location = new System.Drawing.Point(0, 1);
            this.btnAddEC.Name = "btnAddEC";
            this.btnAddEC.Size = new System.Drawing.Size(56, 21);
            this.btnAddEC.TabIndex = 0;
            this.btnAddEC.Text = "添加";
            this.btnAddEC.UseVisualStyleBackColor = true;
            this.btnAddEC.Click += new System.EventHandler(this.btnAddEC_Click);
            // 
            // tabPageDC
            // 
            this.tabPageDC.Controls.Add(this.splitter2);
            this.tabPageDC.Controls.Add(this.pnlDCChanel);
            this.tabPageDC.Controls.Add(this.pnlDC);
            this.tabPageDC.Location = new System.Drawing.Point(4, 22);
            this.tabPageDC.Name = "tabPageDC";
            this.tabPageDC.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageDC.Size = new System.Drawing.Size(551, 478);
            this.tabPageDC.TabIndex = 1;
            this.tabPageDC.Text = "解码器配置";
            this.tabPageDC.UseVisualStyleBackColor = true;
            // 
            // splitter2
            // 
            this.splitter2.Dock = System.Windows.Forms.DockStyle.Top;
            this.splitter2.Location = new System.Drawing.Point(3, 312);
            this.splitter2.Name = "splitter2";
            this.splitter2.Size = new System.Drawing.Size(545, 3);
            this.splitter2.TabIndex = 2;
            this.splitter2.TabStop = false;
            // 
            // pnlDCChanel
            // 
            this.pnlDCChanel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlDCChanel.Controls.Add(this.listDCChanel);
            this.pnlDCChanel.Controls.Add(this.panel4);
            this.pnlDCChanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlDCChanel.Location = new System.Drawing.Point(3, 312);
            this.pnlDCChanel.Name = "pnlDCChanel";
            this.pnlDCChanel.Size = new System.Drawing.Size(545, 164);
            this.pnlDCChanel.TabIndex = 1;
            // 
            // listDCChanel
            // 
            this.listDCChanel.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.chDCChanelIndex,
            this.chMonitorName});
            this.listDCChanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listDCChanel.FullRowSelect = true;
            this.listDCChanel.GridLines = true;
            this.listDCChanel.HideSelection = false;
            this.listDCChanel.Location = new System.Drawing.Point(0, 24);
            this.listDCChanel.Name = "listDCChanel";
            this.listDCChanel.Size = new System.Drawing.Size(541, 136);
            this.listDCChanel.TabIndex = 1;
            this.listDCChanel.UseCompatibleStateImageBehavior = false;
            this.listDCChanel.View = System.Windows.Forms.View.Details;
            // 
            // chDCChanelIndex
            // 
            this.chDCChanelIndex.Text = "通道号";
            this.chDCChanelIndex.Width = 67;
            // 
            // chMonitorName
            // 
            this.chMonitorName.Text = "监视器名称";
            this.chMonitorName.Width = 173;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.btnRefDCChanel);
            this.panel4.Controls.Add(this.btnDelDCChanel);
            this.panel4.Controls.Add(this.btnEditDCChanel);
            this.panel4.Controls.Add(this.btAddDCChanel);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel4.Location = new System.Drawing.Point(0, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(541, 24);
            this.panel4.TabIndex = 0;
            // 
            // btnRefDCChanel
            // 
            this.btnRefDCChanel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefDCChanel.Location = new System.Drawing.Point(485, 2);
            this.btnRefDCChanel.Name = "btnRefDCChanel";
            this.btnRefDCChanel.Size = new System.Drawing.Size(56, 21);
            this.btnRefDCChanel.TabIndex = 3;
            this.btnRefDCChanel.Text = "刷新";
            this.btnRefDCChanel.UseVisualStyleBackColor = true;
            this.btnRefDCChanel.Click += new System.EventHandler(this.btnRefDCChanel_Click);
            // 
            // btnDelDCChanel
            // 
            this.btnDelDCChanel.Enabled = false;
            this.btnDelDCChanel.Location = new System.Drawing.Point(112, 2);
            this.btnDelDCChanel.Name = "btnDelDCChanel";
            this.btnDelDCChanel.Size = new System.Drawing.Size(56, 21);
            this.btnDelDCChanel.TabIndex = 3;
            this.btnDelDCChanel.Text = "删除";
            this.btnDelDCChanel.UseVisualStyleBackColor = true;
            // 
            // btnEditDCChanel
            // 
            this.btnEditDCChanel.Enabled = false;
            this.btnEditDCChanel.Location = new System.Drawing.Point(56, 2);
            this.btnEditDCChanel.Name = "btnEditDCChanel";
            this.btnEditDCChanel.Size = new System.Drawing.Size(56, 21);
            this.btnEditDCChanel.TabIndex = 2;
            this.btnEditDCChanel.Text = "编辑";
            this.btnEditDCChanel.UseVisualStyleBackColor = true;
            // 
            // btAddDCChanel
            // 
            this.btAddDCChanel.Enabled = false;
            this.btAddDCChanel.Location = new System.Drawing.Point(0, 2);
            this.btAddDCChanel.Name = "btAddDCChanel";
            this.btAddDCChanel.Size = new System.Drawing.Size(56, 21);
            this.btAddDCChanel.TabIndex = 1;
            this.btAddDCChanel.Text = "添加";
            this.btAddDCChanel.UseVisualStyleBackColor = true;
            // 
            // pnlDC
            // 
            this.pnlDC.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlDC.Controls.Add(this.listDC);
            this.pnlDC.Controls.Add(this.panel3);
            this.pnlDC.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlDC.Location = new System.Drawing.Point(3, 3);
            this.pnlDC.Name = "pnlDC";
            this.pnlDC.Size = new System.Drawing.Size(545, 309);
            this.pnlDC.TabIndex = 0;
            // 
            // listDC
            // 
            this.listDC.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.chDCName,
            this.chDCCode,
            this.chDCIP,
            this.chDCType,
            this.chDCStatus});
            this.listDC.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listDC.FullRowSelect = true;
            this.listDC.GridLines = true;
            this.listDC.HideSelection = false;
            this.listDC.Location = new System.Drawing.Point(0, 24);
            this.listDC.Name = "listDC";
            this.listDC.Size = new System.Drawing.Size(541, 281);
            this.listDC.TabIndex = 1;
            this.listDC.UseCompatibleStateImageBehavior = false;
            this.listDC.View = System.Windows.Forms.View.Details;
            this.listDC.SelectedIndexChanged += new System.EventHandler(this.listDC_SelectedIndexChanged);
            // 
            // chDCName
            // 
            this.chDCName.Text = "解码器名称";
            this.chDCName.Width = 147;
            // 
            // chDCCode
            // 
            this.chDCCode.Text = "设备编码";
            this.chDCCode.Width = 137;
            // 
            // chDCIP
            // 
            this.chDCIP.Text = "设备IP";
            this.chDCIP.Width = 136;
            // 
            // chDCType
            // 
            this.chDCType.Text = "设备类型";
            this.chDCType.Width = 102;
            // 
            // chDCStatus
            // 
            this.chDCStatus.Text = "在线状态";
            this.chDCStatus.Width = 79;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btnRefDC);
            this.panel3.Controls.Add(this.btnDelDC);
            this.panel3.Controls.Add(this.btnEditDC);
            this.panel3.Controls.Add(this.btnAddDC);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel3.Location = new System.Drawing.Point(0, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(541, 24);
            this.panel3.TabIndex = 0;
            // 
            // btnRefDC
            // 
            this.btnRefDC.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.btnRefDC.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefDC.Location = new System.Drawing.Point(485, 2);
            this.btnRefDC.Name = "btnRefDC";
            this.btnRefDC.Size = new System.Drawing.Size(56, 21);
            this.btnRefDC.TabIndex = 3;
            this.btnRefDC.Text = "刷新";
            this.btnRefDC.UseVisualStyleBackColor = true;
            this.btnRefDC.Click += new System.EventHandler(this.btnRefDC_Click);
            // 
            // btnDelDC
            // 
            this.btnDelDC.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.btnDelDC.Location = new System.Drawing.Point(112, 2);
            this.btnDelDC.Name = "btnDelDC";
            this.btnDelDC.Size = new System.Drawing.Size(56, 21);
            this.btnDelDC.TabIndex = 3;
            this.btnDelDC.Text = "删除";
            this.btnDelDC.UseVisualStyleBackColor = true;
            this.btnDelDC.Click += new System.EventHandler(this.btnDelDC_Click);
            // 
            // btnEditDC
            // 
            this.btnEditDC.Location = new System.Drawing.Point(56, 2);
            this.btnEditDC.Name = "btnEditDC";
            this.btnEditDC.Size = new System.Drawing.Size(56, 21);
            this.btnEditDC.TabIndex = 2;
            this.btnEditDC.Text = "编辑";
            this.btnEditDC.UseVisualStyleBackColor = true;
            this.btnEditDC.Click += new System.EventHandler(this.btnEditDC_Click);
            // 
            // btnAddDC
            // 
            this.btnAddDC.Location = new System.Drawing.Point(0, 2);
            this.btnAddDC.Name = "btnAddDC";
            this.btnAddDC.Size = new System.Drawing.Size(56, 21);
            this.btnAddDC.TabIndex = 1;
            this.btnAddDC.Text = "添加";
            this.btnAddDC.UseVisualStyleBackColor = true;
            this.btnAddDC.Click += new System.EventHandler(this.btnAddDC_Click);
            // 
            // ConfigPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tabConfig);
            this.Name = "ConfigPanel";
            this.Size = new System.Drawing.Size(559, 504);
            this.tabConfig.ResumeLayout(false);
            this.tabPageEC.ResumeLayout(false);
            this.pnlECChanel.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.pnlEC.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.tabPageDC.ResumeLayout(false);
            this.pnlDCChanel.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.pnlDC.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabConfig;
        private System.Windows.Forms.TabPage tabPageEC;
        private System.Windows.Forms.TabPage tabPageDC;
        private System.Windows.Forms.Panel pnlECChanel;
        private System.Windows.Forms.Panel pnlEC;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ListView listEC;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ListView listECChanel;
        private System.Windows.Forms.ColumnHeader chECName;
        private System.Windows.Forms.ColumnHeader chECCode;
        private System.Windows.Forms.ColumnHeader chECIP;
        private System.Windows.Forms.ColumnHeader chECType;
        private System.Windows.Forms.ColumnHeader chECStatus;
        private System.Windows.Forms.Panel pnlDCChanel;
        private System.Windows.Forms.ListView listDCChanel;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel pnlDC;
        private System.Windows.Forms.ListView listDC;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ColumnHeader chECChanelIndex;
        private System.Windows.Forms.ColumnHeader chCameraName;
        private System.Windows.Forms.ColumnHeader chCameraType;
        private System.Windows.Forms.ColumnHeader chPTZType;
        private System.Windows.Forms.ColumnHeader chPTZPort;
        private System.Windows.Forms.ColumnHeader chMCIPAddr;
        private System.Windows.Forms.ColumnHeader chMCPort;
        private System.Windows.Forms.ColumnHeader chDCName;
        private System.Windows.Forms.ColumnHeader chDCCode;
        private System.Windows.Forms.ColumnHeader chDCIP;
        private System.Windows.Forms.ColumnHeader chDCType;
        private System.Windows.Forms.ColumnHeader chDCStatus;
        private System.Windows.Forms.ColumnHeader chDCChanelIndex;
        private System.Windows.Forms.ColumnHeader chMonitorName;
        private System.Windows.Forms.Button btnAddEC;
        private System.Windows.Forms.Button btnDelEC;
        private System.Windows.Forms.Button btnEditEC;
        private System.Windows.Forms.Button btnDelECChanel;
        private System.Windows.Forms.Button btnAddECChanel;
        private System.Windows.Forms.Button btnEditECChanel;
        private System.Windows.Forms.Button btnDelDCChanel;
        private System.Windows.Forms.Button btnEditDCChanel;
        private System.Windows.Forms.Button btAddDCChanel;
        private System.Windows.Forms.Button btnDelDC;
        private System.Windows.Forms.Button btnEditDC;
        private System.Windows.Forms.Button btnAddDC;
        private System.Windows.Forms.Button btnRefECChanel;
        private System.Windows.Forms.Button btnRefEC;
        private System.Windows.Forms.Button btnRefDCChanel;
        private System.Windows.Forms.Button btnRefDC;
        private System.Windows.Forms.Splitter splitter1;
        private System.Windows.Forms.Splitter splitter2;
    }
}
