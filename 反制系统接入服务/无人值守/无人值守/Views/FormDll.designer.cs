﻿namespace WindowsFormsApplication1
{
    partial class FormDll
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
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(39, 62);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(256, 38);
            this.button1.TabIndex = 0;
            this.button1.Text = "用Assembly类来动态调用托管DLL";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(39, 1);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(256, 38);
            this.button2.TabIndex = 1;
            this.button2.Text = "MsgBox";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(457, 133);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(118, 33);
            this.button4.TabIndex = 3;
            this.button4.Text = "UnloadDll";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(457, 89);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(118, 38);
            this.button5.TabIndex = 4;
            this.button5.Text = "动态Invoke";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(39, 231);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(108, 34);
            this.button3.TabIndex = 5;
            this.button3.Text = "OutDldLoad";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(177, 231);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(103, 34);
            this.button6.TabIndex = 6;
            this.button6.Text = "Fun";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(315, 231);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(88, 34);
            this.button7.TabIndex = 7;
            this.button7.Text = "OutDldUnload";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // FormDll
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(604, 317);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Name = "FormDll";
            this.Text = "FormDll";
            this.Load += new System.EventHandler(this.FormDll_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
    }
}