namespace IMOS_SDK_DEMO
{
    partial class SubCtrl
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SubCtrl));
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.splitContainer_Player = new System.Windows.Forms.SplitContainer();
            this.splitContainer_Ptz = new System.Windows.Forms.SplitContainer();
            this.treeView = new System.Windows.Forms.TreeView();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.pl_MediaPlayer = new System.Windows.Forms.Panel();
            this.pnlVOD = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnCancelLogin = new System.Windows.Forms.Button();
            this.btnLogin = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.tbSrvIp = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tbUsrPsw = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tbusrName = new System.Windows.Forms.TextBox();
            this.ptzPanel1 = new IMOS_SDK_DEMO.ptz.PTZPanel();
            this.imosPlayer = new IMOS_SDK_DEMO.player.Player();
            this.vodPanel = new IMOS_SDK_DEMO.vod.VODPanel();
            this.dcPlayer = new IMOS_SDK_DEMO.player.DCPlayer();
            this.splitContainer_Player.Panel1.SuspendLayout();
            this.splitContainer_Player.Panel2.SuspendLayout();
            this.splitContainer_Player.SuspendLayout();
            this.splitContainer_Ptz.Panel1.SuspendLayout();
            this.splitContainer_Ptz.Panel2.SuspendLayout();
            this.splitContainer_Ptz.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.pl_MediaPlayer.SuspendLayout();
            this.pnlVOD.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // imageList1
            // 
            this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList1.Images.SetKeyName(0, "Hotspot.png");
            this.imageList1.Images.SetKeyName(1, "DomeCamera.png");
            this.imageList1.Images.SetKeyName(2, "DomeCamera_Offline.png");
            this.imageList1.Images.SetKeyName(3, "DomeCamera_Stop.png");
            this.imageList1.Images.SetKeyName(4, "Camera.bmp");
            this.imageList1.Images.SetKeyName(5, "Camera_Offline.bmp");
            // 
            // splitContainer_Player
            // 
            this.splitContainer_Player.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitContainer_Player.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer_Player.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer_Player.Location = new System.Drawing.Point(0, 0);
            this.splitContainer_Player.Name = "splitContainer_Player";
            // 
            // splitContainer_Player.Panel1
            // 
            this.splitContainer_Player.Panel1.Controls.Add(this.splitContainer_Ptz);
            this.splitContainer_Player.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.splitContainer_Player.Panel1MinSize = 280;
            // 
            // splitContainer_Player.Panel2
            // 
            this.splitContainer_Player.Panel2.Controls.Add(this.splitContainer1);
            this.splitContainer_Player.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.splitContainer_Player.Size = new System.Drawing.Size(1083, 595);
            this.splitContainer_Player.SplitterDistance = 305;
            this.splitContainer_Player.TabIndex = 2;
            // 
            // splitContainer_Ptz
            // 
            this.splitContainer_Ptz.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitContainer_Ptz.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer_Ptz.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer_Ptz.Location = new System.Drawing.Point(0, 0);
            this.splitContainer_Ptz.Name = "splitContainer_Ptz";
            this.splitContainer_Ptz.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer_Ptz.Panel1
            // 
            this.splitContainer_Ptz.Panel1.AllowDrop = true;
            this.splitContainer_Ptz.Panel1.Controls.Add(this.treeView);
            this.splitContainer_Ptz.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.splitContainer_Ptz.Panel1MinSize = 0;
            // 
            // splitContainer_Ptz.Panel2
            // 
            this.splitContainer_Ptz.Panel2.Controls.Add(this.ptzPanel1);
            this.splitContainer_Ptz.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.splitContainer_Ptz.Panel2MinSize = 0;
            this.splitContainer_Ptz.Size = new System.Drawing.Size(305, 595);
            this.splitContainer_Ptz.SplitterDistance = 420;
            this.splitContainer_Ptz.TabIndex = 0;
            // 
            // treeView
            // 
            this.treeView.AllowDrop = true;
            this.treeView.Cursor = System.Windows.Forms.Cursors.Default;
            this.treeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView.ImageIndex = 0;
            this.treeView.ImageList = this.imageList1;
            this.treeView.LineColor = System.Drawing.Color.Firebrick;
            this.treeView.Location = new System.Drawing.Point(0, 0);
            this.treeView.Name = "treeView";
            this.treeView.SelectedImageIndex = 0;
            this.treeView.ShowRootLines = false;
            this.treeView.Size = new System.Drawing.Size(301, 416);
            this.treeView.TabIndex = 0;
            this.treeView.NodeMouseDoubleClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.treeView_NodeMouseDoubleClick);
            this.treeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView_AfterSelect);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.pl_MediaPlayer);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.pnlVOD);
            this.splitContainer1.Size = new System.Drawing.Size(770, 591);
            this.splitContainer1.SplitterDistance = 357;
            this.splitContainer1.TabIndex = 3;
            // 
            // pl_MediaPlayer
            // 
            this.pl_MediaPlayer.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pl_MediaPlayer.Controls.Add(this.imosPlayer);
            this.pl_MediaPlayer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pl_MediaPlayer.Location = new System.Drawing.Point(0, 0);
            this.pl_MediaPlayer.Name = "pl_MediaPlayer";
            this.pl_MediaPlayer.Size = new System.Drawing.Size(770, 357);
            this.pl_MediaPlayer.TabIndex = 2;
            // 
            // pnlVOD
            // 
            this.pnlVOD.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pnlVOD.Controls.Add(this.vodPanel);
            this.pnlVOD.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlVOD.Location = new System.Drawing.Point(0, 0);
            this.pnlVOD.Name = "pnlVOD";
            this.pnlVOD.Size = new System.Drawing.Size(770, 230);
            this.pnlVOD.TabIndex = 1;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.Controls.Add(this.splitContainer_Player);
            this.panel1.Location = new System.Drawing.Point(3, 35);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1083, 595);
            this.panel1.TabIndex = 10;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnCancelLogin);
            this.panel2.Controls.Add(this.btnLogin);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.tbSrvIp);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.tbUsrPsw);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.tbusrName);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1089, 33);
            this.panel2.TabIndex = 11;
            // 
            // btnCancelLogin
            // 
            this.btnCancelLogin.Location = new System.Drawing.Point(775, 6);
            this.btnCancelLogin.Name = "btnCancelLogin";
            this.btnCancelLogin.Size = new System.Drawing.Size(75, 23);
            this.btnCancelLogin.TabIndex = 44;
            this.btnCancelLogin.Text = "注销";
            this.btnCancelLogin.UseVisualStyleBackColor = true;
            this.btnCancelLogin.Click += new System.EventHandler(this.btnCancelLogin_Click);
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(677, 6);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(75, 23);
            this.btnLogin.TabIndex = 43;
            this.btnLogin.Text = "登录";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(441, 10);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 40;
            this.label3.Text = "服务器IP：";
            // 
            // tbSrvIp
            // 
            this.tbSrvIp.Location = new System.Drawing.Point(512, 7);
            this.tbSrvIp.Name = "tbSrvIp";
            this.tbSrvIp.Size = new System.Drawing.Size(125, 21);
            this.tbSrvIp.TabIndex = 39;
            this.tbSrvIp.Text = "192.169.15.61";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(272, 10);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(41, 12);
            this.label2.TabIndex = 38;
            this.label2.Text = "密码：";
            // 
            // tbUsrPsw
            // 
            this.tbUsrPsw.Location = new System.Drawing.Point(319, 7);
            this.tbUsrPsw.Name = "tbUsrPsw";
            this.tbUsrPsw.Size = new System.Drawing.Size(125, 21);
            this.tbUsrPsw.TabIndex = 37;
            this.tbUsrPsw.Text = "admin_123";
            this.tbUsrPsw.UseSystemPasswordChar = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(82, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 36;
            this.label1.Text = "用户名：";
            // 
            // tbusrName
            // 
            this.tbusrName.Location = new System.Drawing.Point(141, 7);
            this.tbusrName.Name = "tbusrName";
            this.tbusrName.Size = new System.Drawing.Size(125, 21);
            this.tbusrName.TabIndex = 35;
            this.tbusrName.Text = "loadmin";
            // 
            // ptzPanel1
            // 
            this.ptzPanel1.AllowDrop = true;
            this.ptzPanel1.AutoScroll = true;
            this.ptzPanel1.CamCode = "";
            this.ptzPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ptzPanel1.Enabled = false;
            this.ptzPanel1.Location = new System.Drawing.Point(0, 0);
            this.ptzPanel1.Name = "ptzPanel1";
            this.ptzPanel1.sdkManager = null;
            this.ptzPanel1.Size = new System.Drawing.Size(301, 167);
            this.ptzPanel1.TabIndex = 0;
            this.ptzPanel1.DoPtzEvent += new IMOS_SDK_DEMO.ptz.PTZPanel.PtzHandler(this.ptzPanel1_DoPtzEvent);
            // 
            // imosPlayer
            // 
            this.imosPlayer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.imosPlayer.Location = new System.Drawing.Point(0, 0);
            
            this.imosPlayer.Name = "imosPlayer";
            this.imosPlayer.sdkManager = null;
            this.imosPlayer.Size = new System.Drawing.Size(766, 353);
            this.imosPlayer.TabIndex = 0;
            this.imosPlayer.UnitNumber = 4;
            this.imosPlayer.DragDrop += new System.Windows.Forms.DragEventHandler(this.imosPlayer_DragDrop);
            // 
            // vodPanel
            // 
            this.vodPanel.CameraCode = "";
            this.vodPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.vodPanel.Enabled = false;
            this.vodPanel.Location = new System.Drawing.Point(0, 0);
            this.vodPanel.Name = "vodPanel";
            this.vodPanel.sdkManager = null;
            this.vodPanel.Size = new System.Drawing.Size(766, 226);
            this.vodPanel.TabIndex = 0;
            this.vodPanel.XpRunMsg += new IMOS_SDK_DEMO.XPRunMsgHandler(this.vodPanel_XpRunMsg);
            // 
            // dcPlayer
            // 
            this.dcPlayer.CamCode = null;
            this.dcPlayer.Location = new System.Drawing.Point(0, 0);
            this.dcPlayer.Name = "dcPlayer";
            this.dcPlayer.OrgCode = null;
            this.dcPlayer.Size = new System.Drawing.Size(439, 319);
            this.dcPlayer.TabIndex = 0;
            // 
            // SubCtrl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "SubCtrl";
            this.Size = new System.Drawing.Size(1089, 633);
            this.splitContainer_Player.Panel1.ResumeLayout(false);
            this.splitContainer_Player.Panel2.ResumeLayout(false);
            this.splitContainer_Player.ResumeLayout(false);
            this.splitContainer_Ptz.Panel1.ResumeLayout(false);
            this.splitContainer_Ptz.Panel2.ResumeLayout(false);
            this.splitContainer_Ptz.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.pl_MediaPlayer.ResumeLayout(false);
            this.pnlVOD.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }


        #endregion

        private config.ConfigPanel configPanel;
        private player.DCPlayer dcPlayer;
        private System.Windows.Forms.ImageList imageList1;
        private System.Windows.Forms.SplitContainer splitContainer_Player;
        private System.Windows.Forms.SplitContainer splitContainer_Ptz;
        public System.Windows.Forms.TreeView treeView;
        public player.Player imosPlayer;
        
        private System.Windows.Forms.Panel pl_MediaPlayer;
        public ptz.PTZPanel ptzPanel1;
        private System.Windows.Forms.Panel pnlVOD;
        private System.Windows.Forms.Panel panel1;
        public vod.VODPanel vodPanel;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Panel panel2;
        public System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox tbSrvIp;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox tbUsrPsw;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.Button btnCancelLogin;
        public System.Windows.Forms.TextBox tbusrName;


    }
}
