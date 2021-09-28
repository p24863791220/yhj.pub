namespace WindowsFormsApplication1
{
    partial class FormAuto
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

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label2 = new System.Windows.Forms.Label();
            this.ipcomboBox = new System.Windows.Forms.ComboBox();
            this.portcomboBox = new System.Windows.Forms.ComboBox();
            this.saveButton = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel2 = new System.Windows.Forms.ToolStripStatusLabel();
            this.cportcomboBox = new System.Windows.Forms.ComboBox();
            this.cipcomboBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.findtargetListview = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader14 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader15 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader16 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.runstateListview = new System.Windows.Forms.ListView();
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader12 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader13 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader17 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label5 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.buttonBroadcast = new System.Windows.Forms.Button();
            this.timerSecond = new System.Windows.Forms.Timer(this.components);
            this.buttonEdit = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.unitidTextbox = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.statepisTextbox = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.useridTextbox = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Enabled = false;
            this.button1.Location = new System.Drawing.Point(1056, 68);
            this.button1.Margin = new System.Windows.Forms.Padding(4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(112, 53);
            this.button1.TabIndex = 0;
            this.button1.Text = "向服务器IP发送测试数据";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(747, 91);
            this.textBox1.Margin = new System.Windows.Forms.Padding(4);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(301, 25);
            this.textBox1.TabIndex = 1;
            this.textBox1.Text = "FB 0B 00 01 02 B4 39 03 FD 0E 86 FE ";
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged_1);
            this.textBox1.DoubleClick += new System.EventHandler(this.textBox1_DoubleClick);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 15;
            this.listBox1.Location = new System.Drawing.Point(13, 133);
            this.listBox1.Margin = new System.Windows.Forms.Padding(4);
            this.listBox1.Name = "listBox1";
            this.listBox1.ScrollAlwaysVisible = true;
            this.listBox1.Size = new System.Drawing.Size(485, 544);
            this.listBox1.TabIndex = 2;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 114);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(150, 15);
            this.label1.TabIndex = 3;
            this.label1.Text = "本机收到的原始数据:";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 5;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(44, 34);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(61, 15);
            this.label2.TabIndex = 4;
            this.label2.Text = "本机IP:";
            // 
            // ipcomboBox
            // 
            this.ipcomboBox.Enabled = false;
            this.ipcomboBox.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.ipcomboBox.FormattingEnabled = true;
            this.ipcomboBox.Location = new System.Drawing.Point(113, 32);
            this.ipcomboBox.Name = "ipcomboBox";
            this.ipcomboBox.Size = new System.Drawing.Size(184, 28);
            this.ipcomboBox.TabIndex = 5;
            this.ipcomboBox.SelectedIndexChanged += new System.EventHandler(this.ipcomboBox_SelectedIndexChanged);
            this.ipcomboBox.TextChanged += new System.EventHandler(this.ipcomboBox_TextChanged);
            // 
            // portcomboBox
            // 
            this.portcomboBox.Enabled = false;
            this.portcomboBox.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.portcomboBox.FormattingEnabled = true;
            this.portcomboBox.Location = new System.Drawing.Point(352, 31);
            this.portcomboBox.Name = "portcomboBox";
            this.portcomboBox.Size = new System.Drawing.Size(92, 28);
            this.portcomboBox.TabIndex = 6;
            this.portcomboBox.SelectedIndexChanged += new System.EventHandler(this.portcomboBox_SelectedIndexChanged);
            this.portcomboBox.TextChanged += new System.EventHandler(this.portcomboBox_TextChanged);
            // 
            // saveButton
            // 
            this.saveButton.Enabled = false;
            this.saveButton.Font = new System.Drawing.Font("宋体", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.saveButton.Location = new System.Drawing.Point(466, 31);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(166, 30);
            this.saveButton.TabIndex = 7;
            this.saveButton.Text = "SaveSetting";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.button2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(514, 133);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(105, 15);
            this.label3.TabIndex = 9;
            this.label3.Text = "目标信息数据:";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.toolStripStatusLabel2});
            this.statusStrip1.Location = new System.Drawing.Point(0, 687);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(1621, 32);
            this.statusStrip1.TabIndex = 10;
            this.statusStrip1.Text = "信息提示";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(194, 27);
            this.toolStripStatusLabel1.Text = "UDP侦听信息提示：";
            // 
            // toolStripStatusLabel2
            // 
            this.toolStripStatusLabel2.Name = "toolStripStatusLabel2";
            this.toolStripStatusLabel2.Size = new System.Drawing.Size(137, 27);
            this.toolStripStatusLabel2.Text = "运行信息提示:";
            // 
            // cportcomboBox
            // 
            this.cportcomboBox.Enabled = false;
            this.cportcomboBox.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cportcomboBox.FormattingEnabled = true;
            this.cportcomboBox.Location = new System.Drawing.Point(1056, 33);
            this.cportcomboBox.Name = "cportcomboBox";
            this.cportcomboBox.Size = new System.Drawing.Size(112, 28);
            this.cportcomboBox.TabIndex = 13;
            this.cportcomboBox.Text = "18082";
            // 
            // cipcomboBox
            // 
            this.cipcomboBox.Enabled = false;
            this.cipcomboBox.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.cipcomboBox.FormattingEnabled = true;
            this.cipcomboBox.Location = new System.Drawing.Point(838, 34);
            this.cipcomboBox.Name = "cipcomboBox";
            this.cipcomboBox.Size = new System.Drawing.Size(210, 28);
            this.cipcomboBox.TabIndex = 12;
            this.cipcomboBox.Text = "192.168.1.5";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(709, 34);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(123, 15);
            this.label4.TabIndex = 11;
            this.label4.Text = "服务器IP和PORT:";
            // 
            // findtargetListview
            // 
            this.findtargetListview.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader7,
            this.columnHeader8,
            this.columnHeader9,
            this.columnHeader14,
            this.columnHeader15,
            this.columnHeader16});
            this.findtargetListview.Font = new System.Drawing.Font("新宋体", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.findtargetListview.GridLines = true;
            this.findtargetListview.Location = new System.Drawing.Point(517, 151);
            this.findtargetListview.Name = "findtargetListview";
            this.findtargetListview.Size = new System.Drawing.Size(1034, 231);
            this.findtargetListview.TabIndex = 14;
            this.findtargetListview.UseCompatibleStateImageBehavior = false;
            this.findtargetListview.View = System.Windows.Forms.View.Details;
            this.findtargetListview.SelectedIndexChanged += new System.EventHandler(this.findtargetListview_SelectedIndexChanged);
            this.findtargetListview.DoubleClick += new System.EventHandler(this.findtargetListview_DoubleClick);
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "";
            this.columnHeader1.Width = 20;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "unitid";
            this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader2.Width = 80;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "sid";
            this.columnHeader3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader3.Width = 180;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "sbjd";
            this.columnHeader7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader7.Width = 116;
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "sbwd";
            this.columnHeader8.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader8.Width = 115;
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "hbgd";
            this.columnHeader9.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader9.Width = 91;
            // 
            // columnHeader14
            // 
            this.columnHeader14.Text = "mbfw";
            this.columnHeader14.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader14.Width = 80;
            // 
            // columnHeader15
            // 
            this.columnHeader15.Text = "mbjl";
            this.columnHeader15.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader15.Width = 80;
            // 
            // columnHeader16
            // 
            this.columnHeader16.Text = "userid";
            this.columnHeader16.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader16.Width = 118;
            // 
            // runstateListview
            // 
            this.runstateListview.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader4,
            this.columnHeader5,
            this.columnHeader6,
            this.columnHeader10,
            this.columnHeader11,
            this.columnHeader12,
            this.columnHeader13,
            this.columnHeader17});
            this.runstateListview.Font = new System.Drawing.Font("新宋体", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.runstateListview.GridLines = true;
            this.runstateListview.Location = new System.Drawing.Point(517, 422);
            this.runstateListview.Name = "runstateListview";
            this.runstateListview.Size = new System.Drawing.Size(1034, 255);
            this.runstateListview.TabIndex = 16;
            this.runstateListview.UseCompatibleStateImageBehavior = false;
            this.runstateListview.View = System.Windows.Forms.View.Details;
            this.runstateListview.SelectedIndexChanged += new System.EventHandler(this.runstateListview_SelectedIndexChanged);
            this.runstateListview.DoubleClick += new System.EventHandler(this.runstateListview_DoubleClick);
            this.runstateListview.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.runstateListview_MouseDoubleClick);
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "";
            this.columnHeader4.Width = 20;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "unitid";
            this.columnHeader5.Width = 80;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "sid";
            this.columnHeader6.Width = 180;
            // 
            // columnHeader10
            // 
            this.columnHeader10.Text = "yxzt";
            this.columnHeader10.Width = 92;
            // 
            // columnHeader11
            // 
            this.columnHeader11.Text = "sbjd";
            this.columnHeader11.Width = 101;
            // 
            // columnHeader12
            // 
            this.columnHeader12.Text = "sbwd";
            this.columnHeader12.Width = 98;
            // 
            // columnHeader13
            // 
            this.columnHeader13.Text = "hbgd";
            this.columnHeader13.Width = 80;
            // 
            // columnHeader17
            // 
            this.columnHeader17.Text = "userid";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(514, 404);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(105, 15);
            this.label5.TabIndex = 15;
            this.label5.Text = "设备状态数据:";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(1247, 94);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(304, 25);
            this.textBox2.TabIndex = 17;
            // 
            // buttonBroadcast
            // 
            this.buttonBroadcast.Enabled = false;
            this.buttonBroadcast.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonBroadcast.Location = new System.Drawing.Point(1247, 33);
            this.buttonBroadcast.Name = "buttonBroadcast";
            this.buttonBroadcast.Size = new System.Drawing.Size(304, 29);
            this.buttonBroadcast.TabIndex = 18;
            this.buttonBroadcast.Text = "局域网广播测试数据";
            this.buttonBroadcast.UseVisualStyleBackColor = true;
            this.buttonBroadcast.Click += new System.EventHandler(this.buttonBroadcast_Click);
            // 
            // timerSecond
            // 
            this.timerSecond.Enabled = true;
            this.timerSecond.Interval = 1500;
            this.timerSecond.Tick += new System.EventHandler(this.timerSecond_Tick);
            // 
            // buttonEdit
            // 
            this.buttonEdit.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.buttonEdit.Location = new System.Drawing.Point(466, 82);
            this.buttonEdit.Name = "buttonEdit";
            this.buttonEdit.Size = new System.Drawing.Size(166, 33);
            this.buttonEdit.TabIndex = 19;
            this.buttonEdit.Text = "编辑IP和数据";
            this.buttonEdit.UseVisualStyleBackColor = true;
            this.buttonEdit.Click += new System.EventHandler(this.buttonEdit_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(664, 94);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(82, 15);
            this.label6.TabIndex = 20;
            this.label6.Text = "测试数据：";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(1167, 100);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(82, 15);
            this.label7.TabIndex = 21;
            this.label7.Text = "转义数据：";
            // 
            // unitidTextbox
            // 
            this.unitidTextbox.Enabled = false;
            this.unitidTextbox.Location = new System.Drawing.Point(113, 68);
            this.unitidTextbox.Name = "unitidTextbox";
            this.unitidTextbox.Size = new System.Drawing.Size(117, 25);
            this.unitidTextbox.TabIndex = 22;
            this.unitidTextbox.Text = "500106111";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(44, 71);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(63, 15);
            this.label8.TabIndex = 23;
            this.label8.Text = "unitid:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(241, 106);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(105, 15);
            this.label9.TabIndex = 25;
            this.label9.Text = "状态发送间隔:";
            // 
            // statepisTextbox
            // 
            this.statepisTextbox.Enabled = false;
            this.statepisTextbox.Location = new System.Drawing.Point(352, 102);
            this.statepisTextbox.Name = "statepisTextbox";
            this.statepisTextbox.Size = new System.Drawing.Size(92, 25);
            this.statepisTextbox.TabIndex = 24;
            this.statepisTextbox.Text = "60秒";
            this.statepisTextbox.TextChanged += new System.EventHandler(this.statepisTextbox_TextChanged);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(283, 71);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(63, 15);
            this.label10.TabIndex = 27;
            this.label10.Text = "userid:";
            this.label10.Click += new System.EventHandler(this.label10_Click);
            // 
            // useridTextbox
            // 
            this.useridTextbox.Enabled = false;
            this.useridTextbox.Location = new System.Drawing.Point(352, 71);
            this.useridTextbox.Name = "useridTextbox";
            this.useridTextbox.Size = new System.Drawing.Size(92, 25);
            this.useridTextbox.TabIndex = 26;
            this.useridTextbox.Text = "ishp";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(303, 32);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(47, 15);
            this.label11.TabIndex = 28;
            this.label11.Text = "PORT:";
            // 
            // FormAuto
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.ClientSize = new System.Drawing.Size(1621, 719);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.useridTextbox);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.statepisTextbox);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.unitidTextbox);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.buttonEdit);
            this.Controls.Add(this.buttonBroadcast);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.runstateListview);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.findtargetListview);
            this.Controls.Add(this.cportcomboBox);
            this.Controls.Add(this.cipcomboBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.saveButton);
            this.Controls.Add(this.portcomboBox);
            this.Controls.Add(this.ipcomboBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "FormAuto";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "无人机反制系统接入服务 Ver1.0.0   CopyRight 重庆新速科技有限公司";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormAuto_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox ipcomboBox;
        private System.Windows.Forms.ComboBox portcomboBox;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ComboBox cportcomboBox;
        private System.Windows.Forms.ComboBox cipcomboBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ListView findtargetListview;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ListView runstateListview;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.ColumnHeader columnHeader12;
        private System.Windows.Forms.ColumnHeader columnHeader13;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader14;
        private System.Windows.Forms.ColumnHeader columnHeader15;
        private System.Windows.Forms.ColumnHeader columnHeader16;
        private System.Windows.Forms.ColumnHeader columnHeader17;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel2;
        private System.Windows.Forms.Button buttonBroadcast;
        private System.Windows.Forms.Timer timerSecond;
        private System.Windows.Forms.Button buttonEdit;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox unitidTextbox;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox statepisTextbox;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox useridTextbox;
        private System.Windows.Forms.Label label11;
    }
}

