namespace IMOS_SDK_DEMO.ptz
{
    partial class PTZPanel
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PTZPanel));
            this.imlOther = new System.Windows.Forms.ImageList(this.components);
            this.imlDirection = new System.Windows.Forms.ImageList(this.components);
            this.imlPTZ = new System.Windows.Forms.ImageList(this.components);
            this.ttpPTZ = new System.Windows.Forms.ToolTip(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.btnJmp = new System.Windows.Forms.Button();
            this.btnZoomIn = new System.Windows.Forms.Button();
            this.btnZoomOut = new System.Windows.Forms.Button();
            this.btnFocusFar = new System.Windows.Forms.Button();
            this.btnFocusNear = new System.Windows.Forms.Button();
            this.btnIrisOpen = new System.Windows.Forms.Button();
            this.btnIrisClose = new System.Windows.Forms.Button();
            this.btnBrushOn = new System.Windows.Forms.Button();
            this.btnBrushOff = new System.Windows.Forms.Button();
            this.btnHeaterOn = new System.Windows.Forms.Button();
            this.btnHeaterOff = new System.Windows.Forms.Button();
            this.btnLightOn = new System.Windows.Forms.Button();
            this.btnLightOff = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnDeletePreset = new System.Windows.Forms.Button();
            this.pnlBottom = new System.Windows.Forms.Panel();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.nudSpeed = new System.Windows.Forms.NumericUpDown();
            this.lblSpeed = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnPresetOperate = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.tbCameraName = new System.Windows.Forms.TextBox();
            this.panel3 = new System.Windows.Forms.Panel();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.panel4 = new System.Windows.Forms.Panel();
            this.pnlDirection = new System.Windows.Forms.TableLayoutPanel();
            this.btnRightUp = new System.Windows.Forms.Button();
            this.btnLeftUp = new System.Windows.Forms.Button();
            this.btnUp = new System.Windows.Forms.Button();
            this.btnLeft = new System.Windows.Forms.Button();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnRight = new System.Windows.Forms.Button();
            this.btnLeftDown = new System.Windows.Forms.Button();
            this.btnDown = new System.Windows.Forms.Button();
            this.btnRightDown = new System.Windows.Forms.Button();
            this.panel5 = new System.Windows.Forms.Panel();
            this.pnlFunction = new System.Windows.Forms.TableLayoutPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.pnlBottom.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudSpeed)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.pnlDirection.SuspendLayout();
            this.panel5.SuspendLayout();
            this.pnlFunction.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // imlOther
            // 
            this.imlOther.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imlOther.ImageStream")));
            this.imlOther.TransparentColor = System.Drawing.Color.Transparent;
            this.imlOther.Images.SetKeyName(0, "ulock_16.png");
            this.imlOther.Images.SetKeyName(1, "lock_16.png");
            this.imlOther.Images.SetKeyName(2, "anchor_16x16.gif");
            this.imlOther.Images.SetKeyName(3, "DomeCamera.png");
            this.imlOther.Images.SetKeyName(4, "emblem-symbolic-link.bmp");
            this.imlOther.Images.SetKeyName(5, "edit_16x16.gif");
            this.imlOther.Images.SetKeyName(6, "edit-cut.bmp");
            this.imlOther.Images.SetKeyName(7, "media-start.bmp");
            this.imlOther.Images.SetKeyName(8, "media-playback-stop.bmp");
            // 
            // imlDirection
            // 
            this.imlDirection.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imlDirection.ImageStream")));
            this.imlDirection.TransparentColor = System.Drawing.Color.Transparent;
            this.imlDirection.Images.SetKeyName(0, "leftup.jpg");
            this.imlDirection.Images.SetKeyName(1, "leftup-cl.JPG");
            this.imlDirection.Images.SetKeyName(2, "up.jpg");
            this.imlDirection.Images.SetKeyName(3, "up-cl.JPG");
            this.imlDirection.Images.SetKeyName(4, "rightup.jpg");
            this.imlDirection.Images.SetKeyName(5, "rightup-cl.JPG");
            this.imlDirection.Images.SetKeyName(6, "right.jpg");
            this.imlDirection.Images.SetKeyName(7, "right-cl.JPG");
            this.imlDirection.Images.SetKeyName(8, "rigthdown.jpg");
            this.imlDirection.Images.SetKeyName(9, "rightdown-cl.JPG");
            this.imlDirection.Images.SetKeyName(10, "down.jpg");
            this.imlDirection.Images.SetKeyName(11, "down-cl.JPG");
            this.imlDirection.Images.SetKeyName(12, "leftdown.jpg");
            this.imlDirection.Images.SetKeyName(13, "leftdown-cl.JPG");
            this.imlDirection.Images.SetKeyName(14, "left.jpg");
            this.imlDirection.Images.SetKeyName(15, "left-cl.JPG");
            this.imlDirection.Images.SetKeyName(16, "stop.jpg");
            this.imlDirection.Images.SetKeyName(17, "stop-cl.JPG");
            // 
            // imlPTZ
            // 
            this.imlPTZ.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imlPTZ.ImageStream")));
            this.imlPTZ.TransparentColor = System.Drawing.Color.White;
            this.imlPTZ.Images.SetKeyName(0, "");
            this.imlPTZ.Images.SetKeyName(1, "");
            this.imlPTZ.Images.SetKeyName(2, "");
            this.imlPTZ.Images.SetKeyName(3, "");
            this.imlPTZ.Images.SetKeyName(4, "");
            this.imlPTZ.Images.SetKeyName(5, "");
            this.imlPTZ.Images.SetKeyName(6, "");
            this.imlPTZ.Images.SetKeyName(7, "");
            this.imlPTZ.Images.SetKeyName(8, "");
            this.imlPTZ.Images.SetKeyName(9, "");
            this.imlPTZ.Images.SetKeyName(10, "");
            this.imlPTZ.Images.SetKeyName(11, "");
            this.imlPTZ.Images.SetKeyName(12, "");
            this.imlPTZ.Images.SetKeyName(13, "");
            this.imlPTZ.Images.SetKeyName(14, "");
            this.imlPTZ.Images.SetKeyName(15, "");
            this.imlPTZ.Images.SetKeyName(16, "");
            this.imlPTZ.Images.SetKeyName(17, "");
            this.imlPTZ.Images.SetKeyName(18, "");
            this.imlPTZ.Images.SetKeyName(19, "");
            this.imlPTZ.Images.SetKeyName(20, "");
            this.imlPTZ.Images.SetKeyName(21, "");
            this.imlPTZ.Images.SetKeyName(22, "rainbrush_close1.png");
            this.imlPTZ.Images.SetKeyName(23, "rainbrush_open5.png");
            this.imlPTZ.Images.SetKeyName(24, "rainbrush_close3.png");
            this.imlPTZ.Images.SetKeyName(25, "infrared.png");
            // 
            // ttpPTZ
            // 
            this.ttpPTZ.IsBalloon = true;
            // 
            // button1
            // 
            resources.ApplyResources(this.button1, "button1");
            this.button1.Name = "button1";
            this.ttpPTZ.SetToolTip(this.button1, resources.GetString("button1.ToolTip"));
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btnJmp
            // 
            this.btnJmp.ImageList = this.imlOther;
            resources.ApplyResources(this.btnJmp, "btnJmp");
            this.btnJmp.Name = "btnJmp";
            this.ttpPTZ.SetToolTip(this.btnJmp, resources.GetString("btnJmp.ToolTip"));
            this.btnJmp.UseVisualStyleBackColor = true;
            this.btnJmp.Click += new System.EventHandler(this.btnJmp_Click);
            // 
            // btnZoomIn
            // 
            this.btnZoomIn.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnZoomIn, "btnZoomIn");
            this.btnZoomIn.FlatAppearance.BorderSize = 0;
            this.btnZoomIn.ImageList = this.imlPTZ;
            this.btnZoomIn.Name = "btnZoomIn";
            this.ttpPTZ.SetToolTip(this.btnZoomIn, resources.GetString("btnZoomIn.ToolTip"));
            this.btnZoomIn.UseCompatibleTextRendering = true;
            this.btnZoomIn.UseVisualStyleBackColor = false;
            this.btnZoomIn.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnZoomIn_MouseDown);
            this.btnZoomIn.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnZoomIn_MouseUp);
            // 
            // btnZoomOut
            // 
            this.btnZoomOut.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnZoomOut, "btnZoomOut");
            this.btnZoomOut.FlatAppearance.BorderSize = 0;
            this.btnZoomOut.ImageList = this.imlPTZ;
            this.btnZoomOut.Name = "btnZoomOut";
            this.ttpPTZ.SetToolTip(this.btnZoomOut, resources.GetString("btnZoomOut.ToolTip"));
            this.btnZoomOut.UseVisualStyleBackColor = false;
            this.btnZoomOut.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnZoomOut_MouseDown);
            this.btnZoomOut.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnZoomOut_MouseUp);
            // 
            // btnFocusFar
            // 
            this.btnFocusFar.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnFocusFar, "btnFocusFar");
            this.btnFocusFar.FlatAppearance.BorderSize = 0;
            this.btnFocusFar.ImageList = this.imlPTZ;
            this.btnFocusFar.Name = "btnFocusFar";
            this.ttpPTZ.SetToolTip(this.btnFocusFar, resources.GetString("btnFocusFar.ToolTip"));
            this.btnFocusFar.UseCompatibleTextRendering = true;
            this.btnFocusFar.UseVisualStyleBackColor = false;
            this.btnFocusFar.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnFocusFar_MouseDown);
            this.btnFocusFar.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnFocusFar_MouseUp);
            // 
            // btnFocusNear
            // 
            this.btnFocusNear.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnFocusNear, "btnFocusNear");
            this.btnFocusNear.FlatAppearance.BorderSize = 0;
            this.btnFocusNear.ImageList = this.imlPTZ;
            this.btnFocusNear.Name = "btnFocusNear";
            this.ttpPTZ.SetToolTip(this.btnFocusNear, resources.GetString("btnFocusNear.ToolTip"));
            this.btnFocusNear.UseVisualStyleBackColor = false;
            this.btnFocusNear.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnFocusNear_MouseDown);
            this.btnFocusNear.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnFocusNear_MouseUp);
            // 
            // btnIrisOpen
            // 
            this.btnIrisOpen.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnIrisOpen, "btnIrisOpen");
            this.btnIrisOpen.FlatAppearance.BorderSize = 0;
            this.btnIrisOpen.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnIrisOpen.Name = "btnIrisOpen";
            this.ttpPTZ.SetToolTip(this.btnIrisOpen, resources.GetString("btnIrisOpen.ToolTip"));
            this.btnIrisOpen.UseCompatibleTextRendering = true;
            this.btnIrisOpen.UseVisualStyleBackColor = false;
            this.btnIrisOpen.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnIrisOpen_MouseDown);
            this.btnIrisOpen.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnIrisOpen_MouseUp);
            // 
            // btnIrisClose
            // 
            this.btnIrisClose.BackColor = System.Drawing.SystemColors.Control;
            resources.ApplyResources(this.btnIrisClose, "btnIrisClose");
            this.btnIrisClose.FlatAppearance.BorderSize = 0;
            this.btnIrisClose.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnIrisClose.Name = "btnIrisClose";
            this.ttpPTZ.SetToolTip(this.btnIrisClose, resources.GetString("btnIrisClose.ToolTip"));
            this.btnIrisClose.UseVisualStyleBackColor = false;
            this.btnIrisClose.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnIrisClose_MouseDown);
            this.btnIrisClose.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnIrisClose_MouseUp);
            // 
            // btnBrushOn
            // 
            resources.ApplyResources(this.btnBrushOn, "btnBrushOn");
            this.btnBrushOn.FlatAppearance.BorderSize = 0;
            this.btnBrushOn.Name = "btnBrushOn";
            this.ttpPTZ.SetToolTip(this.btnBrushOn, resources.GetString("btnBrushOn.ToolTip"));
            this.btnBrushOn.UseCompatibleTextRendering = true;
            this.btnBrushOn.UseVisualStyleBackColor = true;
            this.btnBrushOn.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnBrushOn_MouseDown);
            this.btnBrushOn.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnBrushOn_MouseUp);
            // 
            // btnBrushOff
            // 
            resources.ApplyResources(this.btnBrushOff, "btnBrushOff");
            this.btnBrushOff.FlatAppearance.BorderSize = 0;
            this.btnBrushOff.Name = "btnBrushOff";
            this.ttpPTZ.SetToolTip(this.btnBrushOff, resources.GetString("btnBrushOff.ToolTip"));
            this.btnBrushOff.UseCompatibleTextRendering = true;
            this.btnBrushOff.UseVisualStyleBackColor = true;
            this.btnBrushOff.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnBrushOff_MouseDown);
            this.btnBrushOff.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnBrushOff_MouseUp);
            // 
            // btnHeaterOn
            // 
            resources.ApplyResources(this.btnHeaterOn, "btnHeaterOn");
            this.btnHeaterOn.FlatAppearance.BorderSize = 0;
            this.btnHeaterOn.ImageList = this.imlPTZ;
            this.btnHeaterOn.Name = "btnHeaterOn";
            this.ttpPTZ.SetToolTip(this.btnHeaterOn, resources.GetString("btnHeaterOn.ToolTip"));
            this.btnHeaterOn.UseCompatibleTextRendering = true;
            this.btnHeaterOn.UseVisualStyleBackColor = true;
            this.btnHeaterOn.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnHeaterOn_MouseDown);
            this.btnHeaterOn.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnHeaterOn_MouseUp);
            // 
            // btnHeaterOff
            // 
            resources.ApplyResources(this.btnHeaterOff, "btnHeaterOff");
            this.btnHeaterOff.FlatAppearance.BorderSize = 0;
            this.btnHeaterOff.ImageList = this.imlPTZ;
            this.btnHeaterOff.Name = "btnHeaterOff";
            this.ttpPTZ.SetToolTip(this.btnHeaterOff, resources.GetString("btnHeaterOff.ToolTip"));
            this.btnHeaterOff.UseCompatibleTextRendering = true;
            this.btnHeaterOff.UseVisualStyleBackColor = true;
            this.btnHeaterOff.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnHeaterOff_MouseDown);
            this.btnHeaterOff.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnHeaterOff_MouseUp);
            // 
            // btnLightOn
            // 
            resources.ApplyResources(this.btnLightOn, "btnLightOn");
            this.btnLightOn.FlatAppearance.BorderSize = 0;
            this.btnLightOn.Name = "btnLightOn";
            this.ttpPTZ.SetToolTip(this.btnLightOn, resources.GetString("btnLightOn.ToolTip"));
            this.btnLightOn.UseCompatibleTextRendering = true;
            this.btnLightOn.UseVisualStyleBackColor = true;
            this.btnLightOn.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnLightOn_MouseDown);
            this.btnLightOn.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnLightOn_MouseUp);
            // 
            // btnLightOff
            // 
            resources.ApplyResources(this.btnLightOff, "btnLightOff");
            this.btnLightOff.FlatAppearance.BorderSize = 0;
            this.btnLightOff.Name = "btnLightOff";
            this.ttpPTZ.SetToolTip(this.btnLightOff, resources.GetString("btnLightOff.ToolTip"));
            this.btnLightOff.UseCompatibleTextRendering = true;
            this.btnLightOff.UseVisualStyleBackColor = true;
            this.btnLightOff.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnLightOff_MouseDown);
            this.btnLightOff.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnLightOff_MouseUp);
            // 
            // button2
            // 
            resources.ApplyResources(this.button2, "button2");
            this.button2.ImageList = this.imlPTZ;
            this.button2.Name = "button2";
            this.ttpPTZ.SetToolTip(this.button2, resources.GetString("button2.ToolTip"));
            this.button2.UseVisualStyleBackColor = true;
            // 
            // btnDeletePreset
            // 
            resources.ApplyResources(this.btnDeletePreset, "btnDeletePreset");
            this.btnDeletePreset.ImageList = this.imlOther;
            this.btnDeletePreset.Name = "btnDeletePreset";
            this.ttpPTZ.SetToolTip(this.btnDeletePreset, resources.GetString("btnDeletePreset.ToolTip"));
            this.btnDeletePreset.UseVisualStyleBackColor = true;
            this.btnDeletePreset.Click += new System.EventHandler(this.btnCruise_Click);
            // 
            // pnlBottom
            // 
            this.pnlBottom.Controls.Add(this.tableLayoutPanel2);
            resources.ApplyResources(this.pnlBottom, "pnlBottom");
            this.pnlBottom.Name = "pnlBottom";
            // 
            // tableLayoutPanel2
            // 
            resources.ApplyResources(this.tableLayoutPanel2, "tableLayoutPanel2");
            this.tableLayoutPanel2.Controls.Add(this.nudSpeed, 4, 0);
            this.tableLayoutPanel2.Controls.Add(this.lblSpeed, 3, 0);
            this.tableLayoutPanel2.Controls.Add(this.panel1, 0, 1);
            this.tableLayoutPanel2.Controls.Add(this.panel2, 1, 0);
            this.tableLayoutPanel2.Controls.Add(this.panel3, 2, 1);
            this.tableLayoutPanel2.Controls.Add(this.panel4, 0, 4);
            this.tableLayoutPanel2.Controls.Add(this.panel5, 2, 4);
            this.tableLayoutPanel2.Controls.Add(this.panel6, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.btnJmp, 3, 2);
            this.tableLayoutPanel2.Controls.Add(this.btnDeletePreset, 4, 2);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            // 
            // nudSpeed
            // 
            this.nudSpeed.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            resources.ApplyResources(this.nudSpeed, "nudSpeed");
            this.nudSpeed.Maximum = new decimal(new int[] {
            9,
            0,
            0,
            0});
            this.nudSpeed.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudSpeed.Name = "nudSpeed";
            this.nudSpeed.ReadOnly = true;
            this.nudSpeed.Value = new decimal(new int[] {
            6,
            0,
            0,
            0});
            this.nudSpeed.ValueChanged += new System.EventHandler(this.PTZ_Speed_ValueChanged);
            // 
            // lblSpeed
            // 
            resources.ApplyResources(this.lblSpeed, "lblSpeed");
            this.lblSpeed.Name = "lblSpeed";
            // 
            // panel1
            // 
            this.tableLayoutPanel2.SetColumnSpan(this.panel1, 2);
            this.panel1.Controls.Add(this.btnPresetOperate);
            resources.ApplyResources(this.panel1, "panel1");
            this.panel1.Name = "panel1";
            // 
            // btnPresetOperate
            // 
            resources.ApplyResources(this.btnPresetOperate, "btnPresetOperate");
            this.btnPresetOperate.ImageList = this.imlOther;
            this.btnPresetOperate.Name = "btnPresetOperate";
            this.btnPresetOperate.UseVisualStyleBackColor = true;
            this.btnPresetOperate.Click += new System.EventHandler(this.btnPresetOperate_Click);
            // 
            // panel2
            // 
            this.tableLayoutPanel2.SetColumnSpan(this.panel2, 2);
            this.panel2.Controls.Add(this.tbCameraName);
            resources.ApplyResources(this.panel2, "panel2");
            this.panel2.Name = "panel2";
            // 
            // tbCameraName
            // 
            resources.ApplyResources(this.tbCameraName, "tbCameraName");
            this.tbCameraName.Name = "tbCameraName";
            this.tbCameraName.ReadOnly = true;
            // 
            // panel3
            // 
            this.tableLayoutPanel2.SetColumnSpan(this.panel3, 3);
            this.panel3.Controls.Add(this.comboBox1);
            resources.ApplyResources(this.panel3, "panel3");
            this.panel3.Name = "panel3";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            resources.ApplyResources(this.comboBox1, "comboBox1");
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.DropDown += new System.EventHandler(this.comboBox1_DropDown);
            // 
            // panel4
            // 
            this.tableLayoutPanel2.SetColumnSpan(this.panel4, 2);
            this.panel4.Controls.Add(this.pnlDirection);
            resources.ApplyResources(this.panel4, "panel4");
            this.panel4.Name = "panel4";
            // 
            // pnlDirection
            // 
            resources.ApplyResources(this.pnlDirection, "pnlDirection");
            this.pnlDirection.Controls.Add(this.btnRightUp, 2, 0);
            this.pnlDirection.Controls.Add(this.btnLeftUp, 0, 0);
            this.pnlDirection.Controls.Add(this.btnUp, 1, 0);
            this.pnlDirection.Controls.Add(this.btnLeft, 0, 1);
            this.pnlDirection.Controls.Add(this.btnStop, 1, 1);
            this.pnlDirection.Controls.Add(this.btnRight, 2, 1);
            this.pnlDirection.Controls.Add(this.btnLeftDown, 0, 2);
            this.pnlDirection.Controls.Add(this.btnDown, 1, 2);
            this.pnlDirection.Controls.Add(this.btnRightDown, 2, 2);
            this.pnlDirection.Name = "pnlDirection";
            // 
            // btnRightUp
            // 
            resources.ApplyResources(this.btnRightUp, "btnRightUp");
            this.btnRightUp.FlatAppearance.BorderSize = 0;
            this.btnRightUp.ImageList = this.imlDirection;
            this.btnRightUp.Name = "btnRightUp";
            this.btnRightUp.UseVisualStyleBackColor = false;
            this.btnRightUp.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnRightUp_MouseDown);
            this.btnRightUp.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnRightUp_MouseUp);
            // 
            // btnLeftUp
            // 
            resources.ApplyResources(this.btnLeftUp, "btnLeftUp");
            this.btnLeftUp.FlatAppearance.BorderSize = 0;
            this.btnLeftUp.ImageList = this.imlDirection;
            this.btnLeftUp.Name = "btnLeftUp";
            this.btnLeftUp.UseVisualStyleBackColor = true;
            this.btnLeftUp.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnLeftUp_MouseDown);
            this.btnLeftUp.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnLeftUp_MouseUp);
            // 
            // btnUp
            // 
            resources.ApplyResources(this.btnUp, "btnUp");
            this.btnUp.FlatAppearance.BorderSize = 0;
            this.btnUp.ImageList = this.imlDirection;
            this.btnUp.Name = "btnUp";
            this.btnUp.UseVisualStyleBackColor = true;
            this.btnUp.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnUp_MouseDown);
            this.btnUp.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnUp_MouseUp);
            // 
            // btnLeft
            // 
            resources.ApplyResources(this.btnLeft, "btnLeft");
            this.btnLeft.FlatAppearance.BorderSize = 0;
            this.btnLeft.ImageList = this.imlDirection;
            this.btnLeft.Name = "btnLeft";
            this.btnLeft.UseVisualStyleBackColor = true;
            this.btnLeft.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnLeft_MouseDown);
            this.btnLeft.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnLeft_MouseUp);
            // 
            // btnStop
            // 
            resources.ApplyResources(this.btnStop, "btnStop");
            this.btnStop.FlatAppearance.BorderSize = 0;
            this.btnStop.ImageList = this.imlDirection;
            this.btnStop.Name = "btnStop";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnStop_MouseDown);
            this.btnStop.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnStop_MouseUp);
            // 
            // btnRight
            // 
            resources.ApplyResources(this.btnRight, "btnRight");
            this.btnRight.FlatAppearance.BorderSize = 0;
            this.btnRight.ImageList = this.imlDirection;
            this.btnRight.Name = "btnRight";
            this.btnRight.UseVisualStyleBackColor = true;
            this.btnRight.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnRight_MouseDown);
            this.btnRight.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnRight_MouseUp);
            // 
            // btnLeftDown
            // 
            resources.ApplyResources(this.btnLeftDown, "btnLeftDown");
            this.btnLeftDown.FlatAppearance.BorderSize = 0;
            this.btnLeftDown.ImageList = this.imlDirection;
            this.btnLeftDown.Name = "btnLeftDown";
            this.btnLeftDown.UseVisualStyleBackColor = true;
            this.btnLeftDown.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnLeftDown_MouseDown);
            this.btnLeftDown.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnLeftDown_MouseUp);
            // 
            // btnDown
            // 
            resources.ApplyResources(this.btnDown, "btnDown");
            this.btnDown.FlatAppearance.BorderSize = 0;
            this.btnDown.ImageList = this.imlDirection;
            this.btnDown.Name = "btnDown";
            this.btnDown.UseVisualStyleBackColor = true;
            this.btnDown.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnDown_MouseDown);
            this.btnDown.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnDown_MouseUp);
            // 
            // btnRightDown
            // 
            resources.ApplyResources(this.btnRightDown, "btnRightDown");
            this.btnRightDown.FlatAppearance.BorderSize = 0;
            this.btnRightDown.ImageList = this.imlDirection;
            this.btnRightDown.Name = "btnRightDown";
            this.btnRightDown.UseVisualStyleBackColor = true;
            this.btnRightDown.MouseDown += new System.Windows.Forms.MouseEventHandler(this.btnRightDown_MouseDown);
            this.btnRightDown.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnRightDown_MouseUp);
            // 
            // panel5
            // 
            this.tableLayoutPanel2.SetColumnSpan(this.panel5, 4);
            this.panel5.Controls.Add(this.pnlFunction);
            resources.ApplyResources(this.panel5, "panel5");
            this.panel5.Name = "panel5";
            // 
            // pnlFunction
            // 
            resources.ApplyResources(this.pnlFunction, "pnlFunction");
            this.pnlFunction.Controls.Add(this.btnZoomIn, 0, 3);
            this.pnlFunction.Controls.Add(this.btnZoomOut, 1, 3);
            this.pnlFunction.Controls.Add(this.btnFocusFar, 0, 2);
            this.pnlFunction.Controls.Add(this.btnFocusNear, 1, 2);
            this.pnlFunction.Controls.Add(this.btnIrisOpen, 0, 1);
            this.pnlFunction.Controls.Add(this.btnIrisClose, 1, 1);
            this.pnlFunction.Controls.Add(this.btnBrushOn, 2, 3);
            this.pnlFunction.Controls.Add(this.btnBrushOff, 3, 3);
            this.pnlFunction.Controls.Add(this.btnHeaterOn, 2, 2);
            this.pnlFunction.Controls.Add(this.btnHeaterOff, 3, 2);
            this.pnlFunction.Controls.Add(this.btnLightOn, 2, 1);
            this.pnlFunction.Controls.Add(this.btnLightOff, 3, 1);
            this.pnlFunction.Controls.Add(this.label1, 0, 0);
            this.pnlFunction.Controls.Add(this.label2, 1, 0);
            this.pnlFunction.Controls.Add(this.label3, 2, 0);
            this.pnlFunction.Controls.Add(this.label4, 3, 0);
            this.pnlFunction.Name = "pnlFunction";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // label4
            // 
            resources.ApplyResources(this.label4, "label4");
            this.label4.Name = "label4";
            // 
            // panel6
            // 
            resources.ApplyResources(this.panel6, "panel6");
            this.panel6.Name = "panel6";
            // 
            // tableLayoutPanel1
            // 
            resources.ApplyResources(this.tableLayoutPanel1, "tableLayoutPanel1");
            this.tableLayoutPanel1.Controls.Add(this.button1, 0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            // 
            // PTZPanel
            // 
            this.AllowDrop = true;
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.pnlBottom);
            this.Name = "PTZPanel";
            this.pnlBottom.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.nudSpeed)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.pnlDirection.ResumeLayout(false);
            this.panel5.ResumeLayout(false);
            this.pnlFunction.ResumeLayout(false);
            this.pnlFunction.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnPresetOperate;
        private System.Windows.Forms.TableLayoutPanel pnlDirection;
        private System.Windows.Forms.Button btnLeftUp;
        private System.Windows.Forms.Button btnRightUp;
        private System.Windows.Forms.Button btnLeft;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnRight;
        private System.Windows.Forms.Button btnLeftDown;
        private System.Windows.Forms.Button btnDown;
        private System.Windows.Forms.Button btnRightDown;
        private System.Windows.Forms.TableLayoutPanel pnlFunction;
        private System.Windows.Forms.Button btnIrisClose;
        private System.Windows.Forms.Button btnLightOn;
        private System.Windows.Forms.Button btnLightOff;
        private System.Windows.Forms.Button btnFocusFar;
        private System.Windows.Forms.Button btnFocusNear;
        private System.Windows.Forms.Button btnHeaterOn;
        private System.Windows.Forms.Button btnHeaterOff;
        private System.Windows.Forms.Button btnZoomIn;
        private System.Windows.Forms.Button btnZoomOut;
        private System.Windows.Forms.Button btnBrushOn;
        private System.Windows.Forms.Button btnBrushOff;
        private System.Windows.Forms.NumericUpDown nudSpeed;
        private System.Windows.Forms.TextBox tbCameraName;
        private System.Windows.Forms.ImageList imlPTZ;
        private System.Windows.Forms.ToolTip ttpPTZ;
        private System.Windows.Forms.Panel pnlBottom;
        private System.Windows.Forms.Button btnJmp;
        private System.Windows.Forms.ImageList imlOther;
        private System.Windows.Forms.Button btnIrisOpen;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnUp;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.ImageList imlDirection;
        private System.Windows.Forms.Label lblSpeed;
        private System.Windows.Forms.Button btnDeletePreset;
    }
}
