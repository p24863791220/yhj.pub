namespace BasicDemo
{
    partial class hkmvsbasic
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        public System.ComponentModel.IContainer components = null;

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
        public void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(hkmvsbasic));
            this.cbDeviceList = new System.Windows.Forms.ComboBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.bnClose = new System.Windows.Forms.Button();
            this.bnOpen = new System.Windows.Forms.Button();
            this.bnEnum = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.bnTriggerExec = new System.Windows.Forms.Button();
            this.cbSoftTrigger = new System.Windows.Forms.CheckBox();
            this.bnStopGrab = new System.Windows.Forms.Button();
            this.bnStartGrab = new System.Windows.Forms.Button();
            this.bnTriggerMode = new System.Windows.Forms.RadioButton();
            this.bnContinuesMode = new System.Windows.Forms.RadioButton();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.frameH = new System.Windows.Forms.TextBox();
            this.frameW = new System.Windows.Forms.TextBox();
            this.bnSavePng = new System.Windows.Forms.Button();
            this.bnSaveTiff = new System.Windows.Forms.Button();
            this.bnSaveJpg = new System.Windows.Forms.Button();
            this.bnSaveBmp = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.bnSetParam = new System.Windows.Forms.Button();
            this.bnGetParam = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tbFrameRate = new System.Windows.Forms.TextBox();
            this.tbGain = new System.Windows.Forms.TextBox();
            this.tbExposure = new System.Windows.Forms.TextBox();
            this.loadset1 = new System.Windows.Forms.Button();
            this.dis_reconnect = new System.Windows.Forms.Button();
            this.ipforce = new System.Windows.Forms.Button();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel2 = new System.Windows.Forms.ToolStripStatusLabel();
            this.loadset2 = new System.Windows.Forms.Button();
            this.setdefault1 = new System.Windows.Forms.Button();
            this.saveset = new System.Windows.Forms.Button();
            this.exitbutton = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbDeviceList
            // 
            resources.ApplyResources(this.cbDeviceList, "cbDeviceList");
            this.cbDeviceList.FormattingEnabled = true;
            this.cbDeviceList.Name = "cbDeviceList";
            // 
            // pictureBox1
            // 
            resources.ApplyResources(this.pictureBox1, "pictureBox1");
            this.pictureBox1.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.TabStop = false;
            // 
            // groupBox1
            // 
            resources.ApplyResources(this.groupBox1, "groupBox1");
            this.groupBox1.Controls.Add(this.bnClose);
            this.groupBox1.Controls.Add(this.bnOpen);
            this.groupBox1.Controls.Add(this.bnEnum);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.TabStop = false;
            // 
            // bnClose
            // 
            resources.ApplyResources(this.bnClose, "bnClose");
            this.bnClose.Name = "bnClose";
            this.bnClose.UseVisualStyleBackColor = true;
            this.bnClose.Click += new System.EventHandler(this.bnClose_Click);
            // 
            // bnOpen
            // 
            resources.ApplyResources(this.bnOpen, "bnOpen");
            this.bnOpen.Name = "bnOpen";
            this.bnOpen.UseVisualStyleBackColor = true;
            this.bnOpen.Click += new System.EventHandler(this.bnOpen_Click);
            // 
            // bnEnum
            // 
            resources.ApplyResources(this.bnEnum, "bnEnum");
            this.bnEnum.Name = "bnEnum";
            this.bnEnum.UseVisualStyleBackColor = true;
            this.bnEnum.Click += new System.EventHandler(this.bnEnum_Click);
            // 
            // groupBox2
            // 
            resources.ApplyResources(this.groupBox2, "groupBox2");
            this.groupBox2.Controls.Add(this.bnTriggerExec);
            this.groupBox2.Controls.Add(this.cbSoftTrigger);
            this.groupBox2.Controls.Add(this.bnStopGrab);
            this.groupBox2.Controls.Add(this.bnStartGrab);
            this.groupBox2.Controls.Add(this.bnTriggerMode);
            this.groupBox2.Controls.Add(this.bnContinuesMode);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.TabStop = false;
            // 
            // bnTriggerExec
            // 
            resources.ApplyResources(this.bnTriggerExec, "bnTriggerExec");
            this.bnTriggerExec.Name = "bnTriggerExec";
            this.bnTriggerExec.UseVisualStyleBackColor = true;
            this.bnTriggerExec.Click += new System.EventHandler(this.bnTriggerExec_Click);
            // 
            // cbSoftTrigger
            // 
            resources.ApplyResources(this.cbSoftTrigger, "cbSoftTrigger");
            this.cbSoftTrigger.Name = "cbSoftTrigger";
            this.cbSoftTrigger.UseVisualStyleBackColor = true;
            this.cbSoftTrigger.CheckedChanged += new System.EventHandler(this.cbSoftTrigger_CheckedChanged);
            // 
            // bnStopGrab
            // 
            resources.ApplyResources(this.bnStopGrab, "bnStopGrab");
            this.bnStopGrab.Name = "bnStopGrab";
            this.bnStopGrab.UseVisualStyleBackColor = true;
            this.bnStopGrab.Click += new System.EventHandler(this.bnStopGrab_Click);
            // 
            // bnStartGrab
            // 
            resources.ApplyResources(this.bnStartGrab, "bnStartGrab");
            this.bnStartGrab.Name = "bnStartGrab";
            this.bnStartGrab.UseVisualStyleBackColor = true;
            this.bnStartGrab.Click += new System.EventHandler(this.bnStartGrab_Click);
            // 
            // bnTriggerMode
            // 
            resources.ApplyResources(this.bnTriggerMode, "bnTriggerMode");
            this.bnTriggerMode.Name = "bnTriggerMode";
            this.bnTriggerMode.TabStop = true;
            this.bnTriggerMode.UseMnemonic = false;
            this.bnTriggerMode.UseVisualStyleBackColor = true;
            this.bnTriggerMode.CheckedChanged += new System.EventHandler(this.bnTriggerMode_CheckedChanged);
            // 
            // bnContinuesMode
            // 
            resources.ApplyResources(this.bnContinuesMode, "bnContinuesMode");
            this.bnContinuesMode.Name = "bnContinuesMode";
            this.bnContinuesMode.TabStop = true;
            this.bnContinuesMode.UseVisualStyleBackColor = true;
            this.bnContinuesMode.CheckedChanged += new System.EventHandler(this.bnContinuesMode_CheckedChanged);
            // 
            // groupBox3
            // 
            resources.ApplyResources(this.groupBox3, "groupBox3");
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.frameH);
            this.groupBox3.Controls.Add(this.frameW);
            this.groupBox3.Controls.Add(this.bnSavePng);
            this.groupBox3.Controls.Add(this.bnSaveTiff);
            this.groupBox3.Controls.Add(this.bnSaveJpg);
            this.groupBox3.Controls.Add(this.bnSaveBmp);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.TabStop = false;
            // 
            // label5
            // 
            resources.ApplyResources(this.label5, "label5");
            this.label5.Name = "label5";
            // 
            // label4
            // 
            resources.ApplyResources(this.label4, "label4");
            this.label4.Name = "label4";
            // 
            // frameH
            // 
            resources.ApplyResources(this.frameH, "frameH");
            this.frameH.Name = "frameH";
            // 
            // frameW
            // 
            resources.ApplyResources(this.frameW, "frameW");
            this.frameW.Name = "frameW";
            // 
            // bnSavePng
            // 
            resources.ApplyResources(this.bnSavePng, "bnSavePng");
            this.bnSavePng.Name = "bnSavePng";
            this.bnSavePng.UseVisualStyleBackColor = true;
            this.bnSavePng.Click += new System.EventHandler(this.bnSavePng_Click);
            // 
            // bnSaveTiff
            // 
            resources.ApplyResources(this.bnSaveTiff, "bnSaveTiff");
            this.bnSaveTiff.Name = "bnSaveTiff";
            this.bnSaveTiff.UseVisualStyleBackColor = true;
            this.bnSaveTiff.Click += new System.EventHandler(this.bnSaveTiff_Click);
            // 
            // bnSaveJpg
            // 
            resources.ApplyResources(this.bnSaveJpg, "bnSaveJpg");
            this.bnSaveJpg.Name = "bnSaveJpg";
            this.bnSaveJpg.UseVisualStyleBackColor = true;
            this.bnSaveJpg.Click += new System.EventHandler(this.bnSaveJpg_Click);
            // 
            // bnSaveBmp
            // 
            resources.ApplyResources(this.bnSaveBmp, "bnSaveBmp");
            this.bnSaveBmp.Name = "bnSaveBmp";
            this.bnSaveBmp.UseVisualStyleBackColor = true;
            this.bnSaveBmp.Click += new System.EventHandler(this.bnSaveBmp_Click);
            // 
            // groupBox4
            // 
            resources.ApplyResources(this.groupBox4, "groupBox4");
            this.groupBox4.Controls.Add(this.bnSetParam);
            this.groupBox4.Controls.Add(this.bnGetParam);
            this.groupBox4.Controls.Add(this.label3);
            this.groupBox4.Controls.Add(this.label2);
            this.groupBox4.Controls.Add(this.label1);
            this.groupBox4.Controls.Add(this.tbFrameRate);
            this.groupBox4.Controls.Add(this.tbGain);
            this.groupBox4.Controls.Add(this.tbExposure);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.TabStop = false;
            // 
            // bnSetParam
            // 
            resources.ApplyResources(this.bnSetParam, "bnSetParam");
            this.bnSetParam.Name = "bnSetParam";
            this.bnSetParam.UseVisualStyleBackColor = true;
            this.bnSetParam.Click += new System.EventHandler(this.bnSetParam_Click);
            // 
            // bnGetParam
            // 
            resources.ApplyResources(this.bnGetParam, "bnGetParam");
            this.bnGetParam.Name = "bnGetParam";
            this.bnGetParam.UseVisualStyleBackColor = true;
            this.bnGetParam.Click += new System.EventHandler(this.bnGetParam_Click);
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            // 
            // tbFrameRate
            // 
            resources.ApplyResources(this.tbFrameRate, "tbFrameRate");
            this.tbFrameRate.Name = "tbFrameRate";
            // 
            // tbGain
            // 
            resources.ApplyResources(this.tbGain, "tbGain");
            this.tbGain.Name = "tbGain";
            // 
            // tbExposure
            // 
            resources.ApplyResources(this.tbExposure, "tbExposure");
            this.tbExposure.Name = "tbExposure";
            // 
            // loadset1
            // 
            resources.ApplyResources(this.loadset1, "loadset1");
            this.loadset1.Name = "loadset1";
            this.loadset1.UseVisualStyleBackColor = true;
            this.loadset1.Click += new System.EventHandler(this.loadset1_Click);
            // 
            // dis_reconnect
            // 
            resources.ApplyResources(this.dis_reconnect, "dis_reconnect");
            this.dis_reconnect.Name = "dis_reconnect";
            this.dis_reconnect.UseVisualStyleBackColor = true;
            this.dis_reconnect.Click += new System.EventHandler(this.dis_reconnect_Click);
            // 
            // ipforce
            // 
            resources.ApplyResources(this.ipforce, "ipforce");
            this.ipforce.Name = "ipforce";
            this.ipforce.UseVisualStyleBackColor = true;
            this.ipforce.Click += new System.EventHandler(this.ipforce_Click);
            // 
            // statusStrip1
            // 
            resources.ApplyResources(this.statusStrip1, "statusStrip1");
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.toolStripStatusLabel2});
            this.statusStrip1.Name = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            resources.ApplyResources(this.toolStripStatusLabel1, "toolStripStatusLabel1");
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            // 
            // toolStripStatusLabel2
            // 
            resources.ApplyResources(this.toolStripStatusLabel2, "toolStripStatusLabel2");
            this.toolStripStatusLabel2.Name = "toolStripStatusLabel2";
            // 
            // loadset2
            // 
            resources.ApplyResources(this.loadset2, "loadset2");
            this.loadset2.Name = "loadset2";
            this.loadset2.UseVisualStyleBackColor = true;
            this.loadset2.Click += new System.EventHandler(this.loadset2_Click);
            // 
            // setdefault1
            // 
            resources.ApplyResources(this.setdefault1, "setdefault1");
            this.setdefault1.Name = "setdefault1";
            this.setdefault1.UseVisualStyleBackColor = true;
            this.setdefault1.Click += new System.EventHandler(this.setdefault1_Click);
            // 
            // saveset
            // 
            resources.ApplyResources(this.saveset, "saveset");
            this.saveset.Name = "saveset";
            this.saveset.UseVisualStyleBackColor = true;
            this.saveset.Click += new System.EventHandler(this.saveset_Click);
            // 
            // exitbutton
            // 
            resources.ApplyResources(this.exitbutton, "exitbutton");
            this.exitbutton.Name = "exitbutton";
            this.exitbutton.UseVisualStyleBackColor = true;
            this.exitbutton.Click += new System.EventHandler(this.exitbutton_Click);
            // 
            // label6
            // 
            resources.ApplyResources(this.label6, "label6");
            this.label6.Name = "label6";
            // 
            // hkmvsbasic
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label6);
            this.Controls.Add(this.exitbutton);
            this.Controls.Add(this.saveset);
            this.Controls.Add(this.setdefault1);
            this.Controls.Add(this.loadset2);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.ipforce);
            this.Controls.Add(this.dis_reconnect);
            this.Controls.Add(this.loadset1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.cbDeviceList);
            this.MaximizeBox = false;
            this.Name = "hkmvsbasic";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.hkmvsbasic_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox cbDeviceList;
        public System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.GroupBox groupBox1;
        public System.Windows.Forms.Button bnClose;
        public System.Windows.Forms.Button bnOpen;
        public System.Windows.Forms.Button bnEnum;
        public System.Windows.Forms.GroupBox groupBox2;
        public System.Windows.Forms.RadioButton bnTriggerMode;
        public System.Windows.Forms.RadioButton bnContinuesMode;
        public System.Windows.Forms.CheckBox cbSoftTrigger;
        public System.Windows.Forms.Button bnStopGrab;
        public System.Windows.Forms.Button bnStartGrab;
        public System.Windows.Forms.Button bnTriggerExec;
        public System.Windows.Forms.GroupBox groupBox3;
        public System.Windows.Forms.Button bnSaveJpg;
        public System.Windows.Forms.Button bnSaveBmp;
        public System.Windows.Forms.GroupBox groupBox4;
        public System.Windows.Forms.TextBox tbFrameRate;
        public System.Windows.Forms.TextBox tbGain;
        public System.Windows.Forms.TextBox tbExposure;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.Button bnSetParam;
        public System.Windows.Forms.Button bnGetParam;
        public System.Windows.Forms.Button bnSavePng;
        public System.Windows.Forms.Button bnSaveTiff;
        public System.Windows.Forms.Button loadset1;
        public System.Windows.Forms.Button dis_reconnect;
        public System.Windows.Forms.Button ipforce;
        public System.Windows.Forms.StatusStrip statusStrip1;
        public System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        public System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel2;
        public System.Windows.Forms.Button loadset2;
        public System.Windows.Forms.Button setdefault1;
        public System.Windows.Forms.Button saveset;
        public System.Windows.Forms.Label label5;
        public System.Windows.Forms.Label label4;
        public System.Windows.Forms.TextBox frameH;
        public System.Windows.Forms.TextBox frameW;
        public System.Windows.Forms.Button exitbutton;
        public System.Windows.Forms.Label label6;
    }
}

