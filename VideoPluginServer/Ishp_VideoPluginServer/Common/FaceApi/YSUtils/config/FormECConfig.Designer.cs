namespace IMOS_SDK_DEMO.config
{
    partial class FormECConfig
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
            this.tbHighTemp = new System.Windows.Forms.TextBox();
            this.cbStandard = new System.Windows.Forms.ComboBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.cbAudioIn = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.cbEncodeSet = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.tbLowTemp = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbDevType = new System.Windows.Forms.ComboBox();
            this.rbMultiNo = new System.Windows.Forms.RadioButton();
            this.rbAlarmNo = new System.Windows.Forms.RadioButton();
            this.rbAlarmYes = new System.Windows.Forms.RadioButton();
            this.rbMultiYes = new System.Windows.Forms.RadioButton();
            this.tbConfirm = new System.Windows.Forms.TextBox();
            this.tbDevCode = new System.Windows.Forms.TextBox();
            this.tbPassword = new System.Windows.Forms.TextBox();
            this.tbDevName = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btCancel = new System.Windows.Forms.Button();
            this.btOk = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // tbHighTemp
            // 
            this.tbHighTemp.Location = new System.Drawing.Point(144, 23);
            this.tbHighTemp.Name = "tbHighTemp";
            this.tbHighTemp.Size = new System.Drawing.Size(264, 21);
            this.tbHighTemp.TabIndex = 1;
            this.tbHighTemp.TextChanged += new System.EventHandler(this.tbHighTemp_TextChanged);
            // 
            // cbStandard
            // 
            this.cbStandard.FormattingEnabled = true;
            this.cbStandard.Location = new System.Drawing.Point(144, 32);
            this.cbStandard.Name = "cbStandard";
            this.cbStandard.Size = new System.Drawing.Size(264, 20);
            this.cbStandard.TabIndex = 1;
            this.cbStandard.SelectedIndexChanged += new System.EventHandler(this.cbStandard_SelectedIndexChanged);
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.groupBox4);
            this.panel1.Controls.Add(this.groupBox3);
            this.panel1.Controls.Add(this.groupBox2);
            this.panel1.Controls.Add(this.groupBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(450, 464);
            this.panel1.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.cbAudioIn);
            this.groupBox4.Controls.Add(this.cbStandard);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Location = new System.Drawing.Point(8, 352);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(432, 88);
            this.groupBox4.TabIndex = 1;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "音视频参数";
            // 
            // cbAudioIn
            // 
            this.cbAudioIn.FormattingEnabled = true;
            this.cbAudioIn.Location = new System.Drawing.Point(144, 56);
            this.cbAudioIn.Name = "cbAudioIn";
            this.cbAudioIn.Size = new System.Drawing.Size(264, 20);
            this.cbAudioIn.TabIndex = 1;
            this.cbAudioIn.SelectedIndexChanged += new System.EventHandler(this.cbAudioIn_SelectedIndexChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(24, 56);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(113, 12);
            this.label9.TabIndex = 0;
            this.label9.Text = "语音对讲音频输入源";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(24, 32);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(29, 12);
            this.label7.TabIndex = 0;
            this.label7.Text = "制式";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.cbEncodeSet);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Location = new System.Drawing.Point(8, 280);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(432, 64);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "流套餐设置";
            // 
            // cbEncodeSet
            // 
            this.cbEncodeSet.FormattingEnabled = true;
            this.cbEncodeSet.Location = new System.Drawing.Point(144, 32);
            this.cbEncodeSet.Name = "cbEncodeSet";
            this.cbEncodeSet.Size = new System.Drawing.Size(264, 20);
            this.cbEncodeSet.TabIndex = 1;
            this.cbEncodeSet.SelectedIndexChanged += new System.EventHandler(this.cbEncodeSet_SelectedIndexChanged);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(24, 32);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 12);
            this.label8.TabIndex = 0;
            this.label8.Text = "套餐类型";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.tbLowTemp);
            this.groupBox2.Controls.Add(this.tbHighTemp);
            this.groupBox2.Location = new System.Drawing.Point(8, 192);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(432, 80);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "温度告警参数";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(24, 56);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 12);
            this.label6.TabIndex = 0;
            this.label6.Text = "低温告警(上限)";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(24, 32);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(89, 12);
            this.label5.TabIndex = 0;
            this.label5.Text = "高温告警(下限)";
            // 
            // tbLowTemp
            // 
            this.tbLowTemp.Location = new System.Drawing.Point(144, 47);
            this.tbLowTemp.Name = "tbLowTemp";
            this.tbLowTemp.Size = new System.Drawing.Size(264, 21);
            this.tbLowTemp.TabIndex = 1;
            this.tbLowTemp.TextChanged += new System.EventHandler(this.tbLowTemp_TextChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel4);
            this.groupBox1.Controls.Add(this.panel3);
            this.groupBox1.Controls.Add(this.cbDevType);
            this.groupBox1.Controls.Add(this.tbConfirm);
            this.groupBox1.Controls.Add(this.tbDevCode);
            this.groupBox1.Controls.Add(this.tbPassword);
            this.groupBox1.Controls.Add(this.tbDevName);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(8, 1);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(432, 183);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "基本参数";
            // 
            // cbDevType
            // 
            this.cbDevType.FormattingEnabled = true;
            this.cbDevType.Items.AddRange(new object[] {
            "EC1101-HF",
            "EC1501-HF",
            "EC2004-HF",
            "EC1102-HF",
            "EC1801-HH"});
            this.cbDevType.Location = new System.Drawing.Point(144, 15);
            this.cbDevType.Name = "cbDevType";
            this.cbDevType.Size = new System.Drawing.Size(264, 20);
            this.cbDevType.TabIndex = 1;
            this.cbDevType.SelectedIndexChanged += new System.EventHandler(this.cbDevType_SelectedIndexChanged);
            // 
            // rbMultiNo
            // 
            this.rbMultiNo.AutoSize = true;
            this.rbMultiNo.Checked = true;
            this.rbMultiNo.Location = new System.Drawing.Point(152, 2);
            this.rbMultiNo.Name = "rbMultiNo";
            this.rbMultiNo.Size = new System.Drawing.Size(35, 16);
            this.rbMultiNo.TabIndex = 2;
            this.rbMultiNo.TabStop = true;
            this.rbMultiNo.Text = "否";
            this.rbMultiNo.UseVisualStyleBackColor = true;
            this.rbMultiNo.CheckedChanged += new System.EventHandler(this.rbMultiNo_CheckedChanged);
            // 
            // rbAlarmNo
            // 
            this.rbAlarmNo.AutoSize = true;
            this.rbAlarmNo.Location = new System.Drawing.Point(152, 2);
            this.rbAlarmNo.Name = "rbAlarmNo";
            this.rbAlarmNo.Size = new System.Drawing.Size(35, 16);
            this.rbAlarmNo.TabIndex = 2;
            this.rbAlarmNo.Text = "否";
            this.rbAlarmNo.UseVisualStyleBackColor = true;
            this.rbAlarmNo.CheckedChanged += new System.EventHandler(this.rbAlarmNo_CheckedChanged);
            // 
            // rbAlarmYes
            // 
            this.rbAlarmYes.AutoSize = true;
            this.rbAlarmYes.Location = new System.Drawing.Point(16, 2);
            this.rbAlarmYes.Name = "rbAlarmYes";
            this.rbAlarmYes.Size = new System.Drawing.Size(35, 16);
            this.rbAlarmYes.TabIndex = 2;
            this.rbAlarmYes.Text = "是";
            this.rbAlarmYes.UseVisualStyleBackColor = true;
            this.rbAlarmYes.CheckedChanged += new System.EventHandler(this.rbAlarmYes_CheckedChanged);
            // 
            // rbMultiYes
            // 
            this.rbMultiYes.AutoSize = true;
            this.rbMultiYes.Location = new System.Drawing.Point(16, 2);
            this.rbMultiYes.Name = "rbMultiYes";
            this.rbMultiYes.Size = new System.Drawing.Size(35, 16);
            this.rbMultiYes.TabIndex = 2;
            this.rbMultiYes.Text = "是";
            this.rbMultiYes.UseVisualStyleBackColor = true;
            this.rbMultiYes.CheckedChanged += new System.EventHandler(this.rbMultiYes_CheckedChanged);
            // 
            // tbConfirm
            // 
            this.tbConfirm.Location = new System.Drawing.Point(144, 153);
            this.tbConfirm.Name = "tbConfirm";
            this.tbConfirm.PasswordChar = '*';
            this.tbConfirm.Size = new System.Drawing.Size(264, 21);
            this.tbConfirm.TabIndex = 1;
            // 
            // tbDevCode
            // 
            this.tbDevCode.Location = new System.Drawing.Point(144, 60);
            this.tbDevCode.Name = "tbDevCode";
            this.tbDevCode.Size = new System.Drawing.Size(264, 21);
            this.tbDevCode.TabIndex = 1;
            this.tbDevCode.TextChanged += new System.EventHandler(this.tbDevCode_TextChanged);
            // 
            // tbPassword
            // 
            this.tbPassword.Location = new System.Drawing.Point(144, 130);
            this.tbPassword.Name = "tbPassword";
            this.tbPassword.PasswordChar = '*';
            this.tbPassword.Size = new System.Drawing.Size(264, 21);
            this.tbPassword.TabIndex = 1;
            // 
            // tbDevName
            // 
            this.tbDevName.Location = new System.Drawing.Point(144, 37);
            this.tbDevName.Name = "tbDevName";
            this.tbDevName.Size = new System.Drawing.Size(264, 21);
            this.tbDevName.TabIndex = 1;
            this.tbDevName.TextChanged += new System.EventHandler(this.tbDevName_TextChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(24, 115);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 12);
            this.label4.TabIndex = 0;
            this.label4.Text = "启动告警";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 12);
            this.label3.TabIndex = 0;
            this.label3.Text = "支持组播";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(24, 162);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(77, 12);
            this.label11.TabIndex = 0;
            this.label11.Text = "确认访问密码";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 69);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 0;
            this.label2.Text = "设备编码";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(24, 139);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(77, 12);
            this.label10.TabIndex = 0;
            this.label10.Text = "设备访问密码";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(24, 24);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(53, 12);
            this.label12.TabIndex = 0;
            this.label12.Text = "设备类型";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 46);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "设备名称";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel2.Controls.Add(this.btCancel);
            this.panel2.Controls.Add(this.btOk);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 464);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(450, 38);
            this.panel2.TabIndex = 1;
            // 
            // btCancel
            // 
            this.btCancel.Location = new System.Drawing.Point(256, 8);
            this.btCancel.Name = "btCancel";
            this.btCancel.Size = new System.Drawing.Size(75, 23);
            this.btCancel.TabIndex = 1;
            this.btCancel.Text = "取消";
            this.btCancel.UseVisualStyleBackColor = true;
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            // 
            // btOk
            // 
            this.btOk.Location = new System.Drawing.Point(168, 8);
            this.btOk.Name = "btOk";
            this.btOk.Size = new System.Drawing.Size(75, 23);
            this.btOk.TabIndex = 0;
            this.btOk.Text = "确定";
            this.btOk.UseVisualStyleBackColor = true;
            this.btOk.Click += new System.EventHandler(this.btOk_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.rbMultiNo);
            this.panel3.Controls.Add(this.rbMultiYes);
            this.panel3.Location = new System.Drawing.Point(152, 87);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(192, 20);
            this.panel3.TabIndex = 3;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.rbAlarmYes);
            this.panel4.Controls.Add(this.rbAlarmNo);
            this.panel4.Location = new System.Drawing.Point(152, 109);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(200, 20);
            this.panel4.TabIndex = 4;
            // 
            // FormECConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(450, 502);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "FormECConfig";
            this.Text = "编码器配置";
            this.panel1.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbDevCode;
        private System.Windows.Forms.TextBox tbDevName;
        private System.Windows.Forms.RadioButton rbMultiNo;
        private System.Windows.Forms.RadioButton rbAlarmNo;
        private System.Windows.Forms.RadioButton rbAlarmYes;
        private System.Windows.Forms.RadioButton rbMultiYes;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox tbLowTemp;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.ComboBox cbAudioIn;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.ComboBox cbEncodeSet;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox tbConfirm;
        private System.Windows.Forms.TextBox tbPassword;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Button btCancel;
        private System.Windows.Forms.Button btOk;
        private System.Windows.Forms.TextBox tbHighTemp;
        private System.Windows.Forms.ComboBox cbDevType;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ComboBox cbStandard;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel3;
    }
}