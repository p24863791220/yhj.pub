namespace Ishp_PluginServer.View
{
    partial class HwVideoForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(HwVideoForm));
            this.hwocx = new AxFSPLAYEROCXLib.AxFsPlayerOcx();
            this.fileSystemWatcher1 = new System.IO.FileSystemWatcher();
            this.btn_close = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.hwocx)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).BeginInit();
            this.SuspendLayout();
            // 
            // hwocx
            // 
            this.hwocx.Enabled = true;
            this.hwocx.Location = new System.Drawing.Point(0, 0);
            this.hwocx.Name = "hwocx";
            this.hwocx.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("hwocx.OcxState")));
            this.hwocx.Size = new System.Drawing.Size(640, 480);
            this.hwocx.TabIndex = 0;
            // 
            // fileSystemWatcher1
            // 
            this.fileSystemWatcher1.EnableRaisingEvents = true;
            this.fileSystemWatcher1.SynchronizingObject = this;
            // 
            // btn_close
            // 
            this.btn_close.Location = new System.Drawing.Point(217, 485);
            this.btn_close.Name = "btn_close";
            this.btn_close.Size = new System.Drawing.Size(205, 32);
            this.btn_close.TabIndex = 1;
            this.btn_close.Text = "关闭";
            this.btn_close.UseVisualStyleBackColor = true;
            this.btn_close.Click += new System.EventHandler(this.Btn_close_Click);
            // 
            // HwVideoForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.ClientSize = new System.Drawing.Size(640, 520);
            this.Controls.Add(this.btn_close);
            this.Controls.Add(this.hwocx);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "HwVideoForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "HwVideoForm";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.HwVideoForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.hwocx)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private AxFSPLAYEROCXLib.AxFsPlayerOcx hwocx;
        private System.IO.FileSystemWatcher fileSystemWatcher1;
        private System.Windows.Forms.Button btn_close;
    }
}