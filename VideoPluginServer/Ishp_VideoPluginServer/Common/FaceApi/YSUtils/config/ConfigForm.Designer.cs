namespace IMOS_SDK_DEMO
{
    partial class ConfigForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label23 = new System.Windows.Forms.Label();
            this.cbFluency = new System.Windows.Forms.ComboBox();
            this.label22 = new System.Windows.Forms.Label();
            this.btnRecordPath = new System.Windows.Forms.Button();
            this.tbRecordPath = new System.Windows.Forms.TextBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.cbSeq = new System.Windows.Forms.CheckBox();
            this.cbServerMode = new System.Windows.Forms.ComboBox();
            this.label13 = new System.Windows.Forms.Label();
            this.cbTranType = new System.Windows.Forms.ComboBox();
            this.label12 = new System.Windows.Forms.Label();
            this.rbStreamTypeNo = new System.Windows.Forms.RadioButton();
            this.rbStreamTypeYes = new System.Windows.Forms.RadioButton();
            this.label11 = new System.Windows.Forms.Label();
            this.cbSyncServerTime = new System.Windows.Forms.CheckBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.label16 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.cbDownRecProtocol = new System.Windows.Forms.ComboBox();
            this.cbDownLoadSpeed = new System.Windows.Forms.ComboBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.label14 = new System.Windows.Forms.Label();
            this.cbRecordType = new System.Windows.Forms.ComboBox();
            this.cbDownLoadSound = new System.Windows.Forms.CheckBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnSelectPath = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.tbSnatchPath = new System.Windows.Forms.TextBox();
            this.cbPicType = new System.Windows.Forms.ComboBox();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbPixelFormat = new System.Windows.Forms.ComboBox();
            this.label27 = new System.Windows.Forms.Label();
            this.cbFiledMode = new System.Windows.Forms.ComboBox();
            this.label25 = new System.Windows.Forms.Label();
            this.cbRenderMode = new System.Windows.Forms.ComboBox();
            this.label24 = new System.Windows.Forms.Label();
            this.fbdSnatchPath = new System.Windows.Forms.FolderBrowserDialog();
            this.groupBox5.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Location = new System.Drawing.Point(27, 63);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(53, 12);
            this.label23.TabIndex = 46;
            this.label23.Text = "乱序整理";
            // 
            // cbFluency
            // 
            this.cbFluency.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbFluency.FormattingEnabled = true;
            this.cbFluency.Items.AddRange(new object[] {
            "实时性优先",
            "流畅性优先"});
            this.cbFluency.Location = new System.Drawing.Point(117, 183);
            this.cbFluency.Name = "cbFluency";
            this.cbFluency.Size = new System.Drawing.Size(145, 20);
            this.cbFluency.TabIndex = 45;
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(56, 187);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(53, 12);
            this.label22.TabIndex = 44;
            this.label22.Text = "处理模式";
            // 
            // btnRecordPath
            // 
            this.btnRecordPath.Location = new System.Drawing.Point(195, 14);
            this.btnRecordPath.Name = "btnRecordPath";
            this.btnRecordPath.Size = new System.Drawing.Size(75, 23);
            this.btnRecordPath.TabIndex = 34;
            this.btnRecordPath.Text = "选择路径";
            this.btnRecordPath.UseVisualStyleBackColor = true;
            this.btnRecordPath.Click += new System.EventHandler(this.btnRecordPath_Click);
            // 
            // tbRecordPath
            // 
            this.tbRecordPath.Location = new System.Drawing.Point(6, 40);
            this.tbRecordPath.Name = "tbRecordPath";
            this.tbRecordPath.ReadOnly = true;
            this.tbRecordPath.Size = new System.Drawing.Size(264, 21);
            this.tbRecordPath.TabIndex = 32;
            this.tbRecordPath.Text = ".\\Download";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.cbSeq);
            this.groupBox5.Controls.Add(this.label23);
            this.groupBox5.Controls.Add(this.cbFluency);
            this.groupBox5.Controls.Add(this.label22);
            this.groupBox5.Controls.Add(this.cbServerMode);
            this.groupBox5.Controls.Add(this.label13);
            this.groupBox5.Controls.Add(this.cbTranType);
            this.groupBox5.Controls.Add(this.label12);
            this.groupBox5.Controls.Add(this.rbStreamTypeNo);
            this.groupBox5.Controls.Add(this.rbStreamTypeYes);
            this.groupBox5.Controls.Add(this.label11);
            this.groupBox5.Controls.Add(this.cbSyncServerTime);
            this.groupBox5.Location = new System.Drawing.Point(308, 161);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(298, 245);
            this.groupBox5.TabIndex = 36;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "系统设置";
            // 
            // cbSeq
            // 
            this.cbSeq.AutoSize = true;
            this.cbSeq.Location = new System.Drawing.Point(7, 61);
            this.cbSeq.Name = "cbSeq";
            this.cbSeq.Size = new System.Drawing.Size(15, 14);
            this.cbSeq.TabIndex = 47;
            this.cbSeq.UseVisualStyleBackColor = true;
            // 
            // cbServerMode
            // 
            this.cbServerMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbServerMode.FormattingEnabled = true;
            this.cbServerMode.Items.AddRange(new object[] {
            "自适应",
            "直连优先"});
            this.cbServerMode.Location = new System.Drawing.Point(117, 154);
            this.cbServerMode.Name = "cbServerMode";
            this.cbServerMode.Size = new System.Drawing.Size(145, 20);
            this.cbServerMode.TabIndex = 33;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(8, 158);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(101, 12);
            this.label13.TabIndex = 32;
            this.label13.Text = "媒体服务选择策略";
            // 
            // cbTranType
            // 
            this.cbTranType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTranType.FormattingEnabled = true;
            this.cbTranType.Items.AddRange(new object[] {
            "自适应",
            "TCP"});
            this.cbTranType.Location = new System.Drawing.Point(117, 123);
            this.cbTranType.Name = "cbTranType";
            this.cbTranType.Size = new System.Drawing.Size(145, 20);
            this.cbTranType.TabIndex = 31;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(8, 127);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(89, 12);
            this.label12.TabIndex = 30;
            this.label12.Text = "媒体流传输协议";
            // 
            // rbStreamTypeNo
            // 
            this.rbStreamTypeNo.AutoSize = true;
            this.rbStreamTypeNo.Location = new System.Drawing.Point(133, 99);
            this.rbStreamTypeNo.Name = "rbStreamTypeNo";
            this.rbStreamTypeNo.Size = new System.Drawing.Size(35, 16);
            this.rbStreamTypeNo.TabIndex = 29;
            this.rbStreamTypeNo.TabStop = true;
            this.rbStreamTypeNo.Text = "否";
            this.rbStreamTypeNo.UseVisualStyleBackColor = true;
            // 
            // rbStreamTypeYes
            // 
            this.rbStreamTypeYes.AutoSize = true;
            this.rbStreamTypeYes.Location = new System.Drawing.Point(92, 99);
            this.rbStreamTypeYes.Name = "rbStreamTypeYes";
            this.rbStreamTypeYes.Size = new System.Drawing.Size(35, 16);
            this.rbStreamTypeYes.TabIndex = 28;
            this.rbStreamTypeYes.TabStop = true;
            this.rbStreamTypeYes.Text = "是";
            this.rbStreamTypeYes.UseVisualStyleBackColor = true;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(8, 101);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(77, 12);
            this.label11.TabIndex = 27;
            this.label11.Text = "是否支持组播";
            // 
            // cbSyncServerTime
            // 
            this.cbSyncServerTime.AutoSize = true;
            this.cbSyncServerTime.Location = new System.Drawing.Point(8, 39);
            this.cbSyncServerTime.Name = "cbSyncServerTime";
            this.cbSyncServerTime.Size = new System.Drawing.Size(108, 16);
            this.cbSyncServerTime.TabIndex = 13;
            this.cbSyncServerTime.Text = "同步服务器时间";
            this.cbSyncServerTime.UseVisualStyleBackColor = true;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label16);
            this.groupBox4.Controls.Add(this.label15);
            this.groupBox4.Controls.Add(this.cbDownRecProtocol);
            this.groupBox4.Controls.Add(this.cbDownLoadSpeed);
            this.groupBox4.Controls.Add(this.groupBox6);
            this.groupBox4.Controls.Add(this.label14);
            this.groupBox4.Controls.Add(this.cbRecordType);
            this.groupBox4.Controls.Add(this.cbDownLoadSound);
            this.groupBox4.Location = new System.Drawing.Point(12, 12);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(290, 262);
            this.groupBox4.TabIndex = 35;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "录像配置";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(7, 195);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(89, 12);
            this.label16.TabIndex = 36;
            this.label16.Text = "录像下载速度：";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(7, 222);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(89, 12);
            this.label15.TabIndex = 34;
            this.label15.Text = "录像下载协议：";
            this.label15.Visible = false;
            // 
            // cbDownRecProtocol
            // 
            this.cbDownRecProtocol.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbDownRecProtocol.FormattingEnabled = true;
            this.cbDownRecProtocol.Items.AddRange(new object[] {
            "UDP协议",
            "TCP协议"});
            this.cbDownRecProtocol.Location = new System.Drawing.Point(126, 219);
            this.cbDownRecProtocol.Name = "cbDownRecProtocol";
            this.cbDownRecProtocol.Size = new System.Drawing.Size(96, 20);
            this.cbDownRecProtocol.TabIndex = 33;
            // 
            // cbDownLoadSpeed
            // 
            this.cbDownLoadSpeed.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbDownLoadSpeed.FormattingEnabled = true;
            this.cbDownLoadSpeed.Items.AddRange(new object[] {
            "一倍速",
            "二倍速",
            "四倍速",
            "八倍速"});
            this.cbDownLoadSpeed.Location = new System.Drawing.Point(126, 192);
            this.cbDownLoadSpeed.Name = "cbDownLoadSpeed";
            this.cbDownLoadSpeed.Size = new System.Drawing.Size(96, 20);
            this.cbDownLoadSpeed.TabIndex = 35;
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnRecordPath);
            this.groupBox6.Controls.Add(this.tbRecordPath);
            this.groupBox6.Location = new System.Drawing.Point(6, 76);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(276, 67);
            this.groupBox6.TabIndex = 32;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "录像下载保存路径设置";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(7, 169);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(113, 12);
            this.label14.TabIndex = 31;
            this.label14.Text = "录像下载文件类型：";
            // 
            // cbRecordType
            // 
            this.cbRecordType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbRecordType.FormattingEnabled = true;
            this.cbRecordType.Items.AddRange(new object[] {
            "TS文件",
            "FLV文件"});
            this.cbRecordType.Location = new System.Drawing.Point(126, 166);
            this.cbRecordType.Name = "cbRecordType";
            this.cbRecordType.Size = new System.Drawing.Size(96, 20);
            this.cbRecordType.TabIndex = 30;
            // 
            // cbDownLoadSound
            // 
            this.cbDownLoadSound.AutoSize = true;
            this.cbDownLoadSound.Location = new System.Drawing.Point(6, 49);
            this.cbDownLoadSound.Name = "cbDownLoadSound";
            this.cbDownLoadSound.Size = new System.Drawing.Size(120, 16);
            this.cbDownLoadSound.TabIndex = 27;
            this.cbDownLoadSound.Text = "录像下载完成提示";
            this.cbDownLoadSound.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.btnSelectPath);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.tbSnatchPath);
            this.groupBox3.Controls.Add(this.cbPicType);
            this.groupBox3.Location = new System.Drawing.Point(308, 12);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(298, 143);
            this.groupBox3.TabIndex = 34;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "抓拍设置";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 25);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 12);
            this.label4.TabIndex = 4;
            this.label4.Text = "图片类型";
            // 
            // btnSelectPath
            // 
            this.btnSelectPath.Location = new System.Drawing.Point(187, 61);
            this.btnSelectPath.Name = "btnSelectPath";
            this.btnSelectPath.Size = new System.Drawing.Size(75, 23);
            this.btnSelectPath.TabIndex = 3;
            this.btnSelectPath.Text = "选择路径";
            this.btnSelectPath.UseVisualStyleBackColor = true;
            this.btnSelectPath.Click += new System.EventHandler(this.btnSelectPath_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 12);
            this.label3.TabIndex = 2;
            this.label3.Text = "图片路径";
            // 
            // tbSnatchPath
            // 
            this.tbSnatchPath.Location = new System.Drawing.Point(6, 90);
            this.tbSnatchPath.Name = "tbSnatchPath";
            this.tbSnatchPath.ReadOnly = true;
            this.tbSnatchPath.Size = new System.Drawing.Size(283, 21);
            this.tbSnatchPath.TabIndex = 1;
            this.tbSnatchPath.Text = ".\\Snatch\\";
            // 
            // cbPicType
            // 
            this.cbPicType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPicType.FormattingEnabled = true;
            this.cbPicType.Items.AddRange(new object[] {
            "bmp格式",
            "jpg格式"});
            this.cbPicType.Location = new System.Drawing.Point(78, 20);
            this.cbPicType.Name = "cbPicType";
            this.cbPicType.Size = new System.Drawing.Size(184, 20);
            this.cbPicType.TabIndex = 0;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // btnOK
            // 
            this.btnOK.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnOK.Location = new System.Drawing.Point(441, 417);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 37;
            this.btnOK.Text = "确定";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancel.Location = new System.Drawing.Point(523, 417);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 38;
            this.btnCancel.Text = "取消(ESC)";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbPixelFormat);
            this.groupBox1.Controls.Add(this.label27);
            this.groupBox1.Controls.Add(this.cbFiledMode);
            this.groupBox1.Controls.Add(this.label25);
            this.groupBox1.Controls.Add(this.cbRenderMode);
            this.groupBox1.Controls.Add(this.label24);
            this.groupBox1.Location = new System.Drawing.Point(12, 288);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(290, 118);
            this.groupBox1.TabIndex = 39;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "图像处理";
            // 
            // cbPixelFormat
            // 
            this.cbPixelFormat.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPixelFormat.FormattingEnabled = true;
            this.cbPixelFormat.Items.AddRange(new object[] {
            "YUV420",
            "RGB32"});
            this.cbPixelFormat.Location = new System.Drawing.Point(88, 74);
            this.cbPixelFormat.Name = "cbPixelFormat";
            this.cbPixelFormat.Size = new System.Drawing.Size(96, 20);
            this.cbPixelFormat.TabIndex = 40;
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.Location = new System.Drawing.Point(22, 77);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(53, 12);
            this.label27.TabIndex = 39;
            this.label27.Text = "视频输出";
            // 
            // cbFiledMode
            // 
            this.cbFiledMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbFiledMode.FormattingEnabled = true;
            this.cbFiledMode.Items.AddRange(new object[] {
            "单场",
            "双场"});
            this.cbFiledMode.Location = new System.Drawing.Point(88, 43);
            this.cbFiledMode.Name = "cbFiledMode";
            this.cbFiledMode.Size = new System.Drawing.Size(96, 20);
            this.cbFiledMode.TabIndex = 37;
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Location = new System.Drawing.Point(22, 46);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(41, 12);
            this.label25.TabIndex = 35;
            this.label25.Text = "场模式";
            // 
            // cbRenderMode
            // 
            this.cbRenderMode.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbRenderMode.FormattingEnabled = true;
            this.cbRenderMode.Items.AddRange(new object[] {
            "D3D",
            "DDRAW"});
            this.cbRenderMode.Location = new System.Drawing.Point(88, 18);
            this.cbRenderMode.Name = "cbRenderMode";
            this.cbRenderMode.Size = new System.Drawing.Size(96, 20);
            this.cbRenderMode.TabIndex = 34;
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Location = new System.Drawing.Point(22, 21);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(53, 12);
            this.label24.TabIndex = 0;
            this.label24.Text = "渲染模式";
            // 
            // ConfigForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(637, 508);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ConfigForm";
            this.Text = "系统配置";
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.ComboBox cbFluency;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Button btnRecordPath;
        private System.Windows.Forms.TextBox tbRecordPath;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.ComboBox cbServerMode;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.ComboBox cbTranType;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.RadioButton rbStreamTypeNo;
        private System.Windows.Forms.RadioButton rbStreamTypeYes;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.CheckBox cbSyncServerTime;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.ComboBox cbDownRecProtocol;
        private System.Windows.Forms.ComboBox cbDownLoadSpeed;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.ComboBox cbRecordType;
        private System.Windows.Forms.CheckBox cbDownLoadSound;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnSelectPath;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbSnatchPath;
        private System.Windows.Forms.ComboBox cbPicType;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbPixelFormat;
        private System.Windows.Forms.Label label27;
        private System.Windows.Forms.ComboBox cbFiledMode;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.ComboBox cbRenderMode;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.FolderBrowserDialog fbdSnatchPath;
        private System.Windows.Forms.CheckBox cbSeq;

    }
}