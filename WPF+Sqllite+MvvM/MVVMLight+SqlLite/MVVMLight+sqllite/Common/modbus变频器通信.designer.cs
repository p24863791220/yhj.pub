
namespace WpfApp1MvvM
{
    partial class modbus变频器通信
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btn_disconnect = new System.Windows.Forms.Button();
            this.btn_connect = new System.Windows.Forms.Button();
            this.cmb_Stopbits = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cmb_Databits = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmb_parity = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmb_BaudRate = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cmb_Port = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.num_FreSet = new System.Windows.Forms.NumericUpDown();
            this.label12 = new System.Windows.Forms.Label();
            this.lab_frq = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.lab_speed = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.lab_current = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btn_stop = new System.Windows.Forms.Button();
            this.btn_start = new System.Windows.Forms.Button();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.label7 = new System.Windows.Forms.Label();
            this.cmb_SlabeId = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.num_FreSet)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btn_disconnect);
            this.groupBox1.Controls.Add(this.btn_connect);
            this.groupBox1.Controls.Add(this.cmb_SlabeId);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.cmb_Stopbits);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.cmb_Databits);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.cmb_parity);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cmb_BaudRate);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cmb_Port);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(49, 37);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(586, 213);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "通信参数";
            // 
            // btn_disconnect
            // 
            this.btn_disconnect.Location = new System.Drawing.Point(371, 168);
            this.btn_disconnect.Name = "btn_disconnect";
            this.btn_disconnect.Size = new System.Drawing.Size(77, 26);
            this.btn_disconnect.TabIndex = 11;
            this.btn_disconnect.Text = "断开连接";
            this.btn_disconnect.UseVisualStyleBackColor = true;
            this.btn_disconnect.Click += new System.EventHandler(this.btn_disconnect_Click);
            // 
            // btn_connect
            // 
            this.btn_connect.Location = new System.Drawing.Point(150, 168);
            this.btn_connect.Name = "btn_connect";
            this.btn_connect.Size = new System.Drawing.Size(77, 26);
            this.btn_connect.TabIndex = 10;
            this.btn_connect.Text = "建位连接";
            this.btn_connect.UseVisualStyleBackColor = true;
            this.btn_connect.Click += new System.EventHandler(this.btn_connect_Click);
            // 
            // cmb_Stopbits
            // 
            this.cmb_Stopbits.FormattingEnabled = true;
            this.cmb_Stopbits.Location = new System.Drawing.Point(150, 125);
            this.cmb_Stopbits.Name = "cmb_Stopbits";
            this.cmb_Stopbits.Size = new System.Drawing.Size(96, 20);
            this.cmb_Stopbits.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(91, 128);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 12);
            this.label5.TabIndex = 8;
            this.label5.Text = "停止位：";
            // 
            // cmb_Databits
            // 
            this.cmb_Databits.FormattingEnabled = true;
            this.cmb_Databits.Location = new System.Drawing.Point(387, 81);
            this.cmb_Databits.Name = "cmb_Databits";
            this.cmb_Databits.Size = new System.Drawing.Size(96, 20);
            this.cmb_Databits.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(328, 84);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 12);
            this.label4.TabIndex = 6;
            this.label4.Text = "数据位：";
            // 
            // cmb_parity
            // 
            this.cmb_parity.FormattingEnabled = true;
            this.cmb_parity.Location = new System.Drawing.Point(150, 81);
            this.cmb_parity.Name = "cmb_parity";
            this.cmb_parity.Size = new System.Drawing.Size(96, 20);
            this.cmb_parity.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(91, 84);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(41, 12);
            this.label3.TabIndex = 4;
            this.label3.Text = "校验位";
            // 
            // cmb_BaudRate
            // 
            this.cmb_BaudRate.FormattingEnabled = true;
            this.cmb_BaudRate.Location = new System.Drawing.Point(387, 35);
            this.cmb_BaudRate.Name = "cmb_BaudRate";
            this.cmb_BaudRate.Size = new System.Drawing.Size(96, 20);
            this.cmb_BaudRate.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(328, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "波特率：";
            // 
            // cmb_Port
            // 
            this.cmb_Port.FormattingEnabled = true;
            this.cmb_Port.Location = new System.Drawing.Point(150, 32);
            this.cmb_Port.Name = "cmb_Port";
            this.cmb_Port.Size = new System.Drawing.Size(96, 20);
            this.cmb_Port.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(91, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "端口号：";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.num_FreSet);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.lab_frq);
            this.groupBox2.Controls.Add(this.label14);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.lab_speed);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.lab_current);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.btn_stop);
            this.groupBox2.Controls.Add(this.btn_start);
            this.groupBox2.Location = new System.Drawing.Point(49, 324);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(586, 300);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "设备操作";
            // 
            // num_FreSet
            // 
            this.num_FreSet.Location = new System.Drawing.Point(383, 67);
            this.num_FreSet.Maximum = new decimal(new int[] {
            50,
            0,
            0,
            0});
            this.num_FreSet.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.num_FreSet.Name = "num_FreSet";
            this.num_FreSet.Size = new System.Drawing.Size(94, 21);
            this.num_FreSet.TabIndex = 24;
            this.num_FreSet.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.num_FreSet.ValueChanged += new System.EventHandler(this.num_freset_ValueChanged);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(442, 145);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(17, 12);
            this.label12.TabIndex = 23;
            this.label12.Text = "Hz";
            // 
            // lab_frq
            // 
            this.lab_frq.AutoSize = true;
            this.lab_frq.Location = new System.Drawing.Point(377, 145);
            this.lab_frq.Name = "lab_frq";
            this.lab_frq.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.lab_frq.Size = new System.Drawing.Size(11, 12);
            this.lab_frq.TabIndex = 22;
            this.lab_frq.Text = "0";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(284, 145);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(65, 12);
            this.label14.TabIndex = 21;
            this.label14.Text = "实际频率：";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(442, 211);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(35, 12);
            this.label9.TabIndex = 20;
            this.label9.Text = "r/min";
            // 
            // lab_speed
            // 
            this.lab_speed.AutoSize = true;
            this.lab_speed.Location = new System.Drawing.Point(377, 211);
            this.lab_speed.Name = "lab_speed";
            this.lab_speed.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.lab_speed.Size = new System.Drawing.Size(11, 12);
            this.lab_speed.TabIndex = 19;
            this.lab_speed.Text = "0";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(284, 211);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(65, 12);
            this.label11.TabIndex = 18;
            this.label11.Text = "实际转速：";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(224, 211);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(11, 12);
            this.label8.TabIndex = 17;
            this.label8.Text = "A";
            // 
            // lab_current
            // 
            this.lab_current.AutoSize = true;
            this.lab_current.Location = new System.Drawing.Point(184, 211);
            this.lab_current.Name = "lab_current";
            this.lab_current.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.lab_current.Size = new System.Drawing.Size(11, 12);
            this.lab_current.TabIndex = 16;
            this.lab_current.Text = "0";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(91, 211);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(65, 12);
            this.label6.TabIndex = 15;
            this.label6.Text = "实际电流：";
            // 
            // btn_stop
            // 
            this.btn_stop.Location = new System.Drawing.Point(114, 145);
            this.btn_stop.Name = "btn_stop";
            this.btn_stop.Size = new System.Drawing.Size(77, 26);
            this.btn_stop.TabIndex = 13;
            this.btn_stop.Text = "停止";
            this.btn_stop.UseVisualStyleBackColor = true;
            this.btn_stop.Click += new System.EventHandler(this.btn_stop_Click);
            // 
            // btn_start
            // 
            this.btn_start.Location = new System.Drawing.Point(114, 67);
            this.btn_start.Name = "btn_start";
            this.btn_start.Size = new System.Drawing.Size(77, 26);
            this.btn_start.TabIndex = 11;
            this.btn_start.Text = "启动";
            this.btn_start.UseVisualStyleBackColor = true;
            this.btn_start.Click += new System.EventHandler(this.btn_start_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(328, 128);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(53, 12);
            this.label7.TabIndex = 8;
            this.label7.Text = "站地址：";
            // 
            // cmb_SlabeId
            // 
            this.cmb_SlabeId.FormattingEnabled = true;
            this.cmb_SlabeId.Location = new System.Drawing.Point(387, 125);
            this.cmb_SlabeId.Name = "cmb_SlabeId";
            this.cmb_SlabeId.Size = new System.Drawing.Size(96, 20);
            this.cmb_SlabeId.TabIndex = 9;
            this.cmb_SlabeId.Text = "1";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(284, 67);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(65, 12);
            this.label10.TabIndex = 25;
            this.label10.Text = "频率给定：";
            // 
            // modbus变频器通信
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(749, 636);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.MaximizeBox = false;
            this.Name = "modbus变频器通信";
            this.Text = "modbus变频器通信";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.num_FreSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btn_disconnect;
        private System.Windows.Forms.Button btn_connect;
        private System.Windows.Forms.ComboBox cmb_Stopbits;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cmb_Databits;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmb_parity;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmb_BaudRate;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmb_Port;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label lab_frq;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label lab_speed;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label lab_current;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btn_stop;
        private System.Windows.Forms.Button btn_start;
        private System.Windows.Forms.NumericUpDown num_FreSet;
        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.ComboBox cmb_SlabeId;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label10;
    }
}