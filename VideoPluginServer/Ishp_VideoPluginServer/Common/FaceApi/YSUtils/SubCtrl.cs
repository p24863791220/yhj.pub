using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.sdk;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Net;
using IMOS_SDK_DEMO.player;

namespace IMOS_SDK_DEMO
{
    public partial class SubCtrl : UserControl
    {
        public event PostMessageHandler PostMessage;
        //public MainForm m_mainForm {get; set;}

        public SdkManager sdkManager {get; set;}

        public SubCtrl subCtrl {get; set;}
        private uint EX_SUCCESS = 0; 

        delegate void displayAlarmInfoDelegate();
        delegate void LoginoutTryLoginDelegate();

        private int pageIndex = 1;

        public int PageIndex
        {
            get { return pageIndex; }
            set { pageIndex = value; }
        }

        private int seq = 0;
        //用户登录参数
        public String strSrvIpAddr {get; set;}
        public String strUsrLoginName {get; set;}
        public String strUsrLoginPsw {get; set;}

        public PLAY_WND_INFO_S[] astPlayWndInfo = new PLAY_WND_INFO_S[25];
        public IMOS_SDK_DEMO.sdk.IMOSSDK.CALL_BACK_PROC_PF CallBackFunc;
        
        //登录成功返回信息
        public LOGIN_INFO_S stLoginInfo;

        //登录成功判断
        private bool loginSuccess = false;

        public bool LoginSuccess
        {
            get { return loginSuccess; }
            set { loginSuccess = value; }
        }

        public SubCtrl()
        {
            InitializeComponent();
            //ptzPanel1.DoPtzEvent += new ptz.PTZPanel.PtzHandler(ptzPanel1_DoPtzEvent);

            initSubCtrl();
        }

        //public void Init(MainForm handle)
        //{
        //    m_mainForm = handle;
        //    subCtrl = this;
            
        //}

        public void initSubCtrl()
        {
            ////为25个播放窗格绑定事件
            for (int index = 0; index < 25; index++)
            {
                imosPlayer.m_playerUnit[index].playerSelectIndexChanged += new IMOS_SDK_DEMO.player.PlayerPanel.selectIndexChangedEventHandler(ptzPanel1.changeCameraCode);
                imosPlayer.m_playerUnit[index].playerSelectIndexChanged += new IMOS_SDK_DEMO.player.PlayerPanel.selectIndexChangedEventHandler(vodPanel.changeCameraCode);
                //imosPlayer.m_playerUnit[index].PostMessage += VodPanel_PostMessageForMain;
            }

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            //登录后TextBox不可编辑，登录按钮隐藏
            uint ulRet = 0;

            this.strUsrLoginName = this.tbusrName.Text.Trim();
            this.strUsrLoginPsw = this.tbUsrPsw.Text.Trim();
            this.strSrvIpAddr = this.tbSrvIp.Text.Trim();
            sdkManager = new SdkManager();
            int count =  0;//m_mainForm.g_userCtrlList.Count;
            stLoginInfo = sdkManager.LoginMethod(strUsrLoginName, strUsrLoginPsw, strSrvIpAddr, "N/A");
            this.sdkManager.stLoginInfo = stLoginInfo;
            if (0 != ulRet)
            {
                MessageBox.Show("登录失败！" + ulRet.ToString());
            }
            else
            {
                this.PostMessageForMain("登录成功！");
                //登录成功后显示相关控件
                loginSuccess = true;
                splitContainer_Player.Enabled = true;
                vodPanel.Enabled = true;

                ptzPanel1.Enabled = true;

                initCtrlSdkManager();
                sdkManager.getMainFormHandle(this);
                sdkManager.getLoginInfo(strUsrLoginName, strUsrLoginPsw, strSrvIpAddr, "N/A");

                //TextBox不可编辑，登录按钮隐藏
                this.tbusrName.ReadOnly = true;
                this.tbusrName.Enabled = false;

                this.tbUsrPsw.ReadOnly = true;
                this.tbUsrPsw.Enabled = false;
                this.tbSrvIp.ReadOnly = true;
                this.tbSrvIp.Enabled = false;

                //Point p = new Point(80,134);
                this.btnLogin.Enabled = false;
                CallBackFunc = ProcessCallBack;
                IntPtr ptrCB = Marshal.GetFunctionPointerForDelegate(CallBackFunc);
                //注册回调函数
                ulRet = AVCallBack.RegCallBackFunc(ref stLoginInfo.stUserLoginIDInfo, ptrCB);
                if (0 != ulRet)
                {
                    MessageBox.Show("回调注册失败：ret=" + ulRet);
                    return;
                }
                //初始化sdkManager类
                initWindow();
                sdkManager.SetTreeRoot(treeView);

                try
                {
                    if (null != LocalConfig.codeOutputLoc)
                    {
                        ConfigClass.OptionSetting.RecordPath = LocalConfig.codeOutputLoc;
                    }
                    //如果路径不存在，那么创建路径
                    if (false == System.IO.Directory.Exists(LocalConfig.codeOutputLoc))
                    {
                        System.IO.Directory.CreateDirectory(LocalConfig.codeOutputLoc);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
  
        /// <summary>
        /// 初始化各个面板SdkManager
        /// </summary>
        /// <param name="sdkManager"></param>
        private void initCtrlSdkManager()
        {
            //this.imosPlayer.initSdkManager(sdkManager);
            //this.ptzPanel1.InitMainFormHandle(m_mainForm);
            //this.imosPlayer.InitMainFormHandle(m_mainForm);
            //this.vodPanel.initSdkManager(sdkManager);
            //this.vodPanel.getMainForm(m_mainForm,imosPlayer);
            //this.dcPlayer.InitMainFormHandle(m_mainForm);

            this.ptzPanel1.initSdkManager(sdkManager);
        }

        private void btnCancelLogin_Click(object sender, EventArgs e)
        { 
            SetStatus();
            //退出登录
            LogoutMethod();
            //界面清理
            this.treeView.Nodes.Clear();
            //关闭所有播放窗口
            splitContainer_Player.Enabled = false;
            vodPanel.Enabled = false;
            ptzPanel1.Enabled = false;
        }
        /// <summary>
        /// 注销方法
        /// </summary>
        /// <returns></returns>
        private uint LogoutMethod()
        {
            uint ulRet = 0;

            if (!this.loginSuccess)
            {
                return ulRet;
            }
          
            //注销登录
            if (null != stLoginInfo.stUserLoginIDInfo.szUserLoginCode)
            {
                //如果有视频播放，将所有窗格关闭
                //this.sdkManager.StopVideo(imosPlayer, ptzPanel1); 
                imosPlayer.FreeAllChannel();
                ulRet = CommonFunc.StopPlayer(ref stLoginInfo.stUserLoginIDInfo);
                if(ulRet!=0)
                {
                    MessageBox.Show("IMOS_StopPlayer fail ,ret = " + ulRet);
                    return ulRet;
                }
                CommonFunc.LoginOut(ref stLoginInfo.stUserLoginIDInfo);
            }
            else
            {
                MessageBox.Show("你还没有登录!"); 
            }
            
            //注销完毕还原登录界面初始状态 
            this.loginSuccess = false;
            this.PostMessageForMain("登出成功！");
            
            return EX_SUCCESS;
        }

        private void SetStatus()
        {
            if (true == this.loginSuccess)
            {
                if (false == this.tbusrName.Enabled)
                {
                    this.tbusrName.Enabled = true;
                    this.tbusrName.ReadOnly = false;
                }
                if (false == this.tbUsrPsw.Enabled)
                {
                    this.tbUsrPsw.Enabled = true;
                    this.tbUsrPsw.ReadOnly = false;
                }
                if (false == this.tbSrvIp.Enabled)
                {
                    this.tbSrvIp.Enabled = true;
                    this.tbSrvIp.ReadOnly = false;
                }
                this.btnLogin.Enabled = true; 
            }
            subCtrl.Refresh();
        }
         

        /// <summary>
        /// 判断是不是IP地址
        /// </summary>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static bool IpCheck(string ip)
        {
            bool ret = false;
            try
            {
                ret = Regex.IsMatch(ip, @"(\d+)\.(\d+)\.(\d+)\.(\d+)");
            }
            catch (Exception ex)
            {
                ret = false;                
            }
            return ret;
        }

        private void initWindow()
        {
            UInt32 ulRet = 0;
            
            IntPtr ptrPlayWndInfo = Marshal.AllocHGlobal(25 * Marshal.SizeOf(typeof(PLAY_WND_INFO_S)));

            ulRet =CommonFunc.StartPlayer(ref stLoginInfo.stUserLoginIDInfo, 25, ptrPlayWndInfo);
            if (0 != ulRet)
            {
                MessageBox.Show("StartPlayer" + ulRet.ToString()); 
                return;
            }

            for (int i = 0; i < 25; i++)
            {
                IntPtr ptrTemp = IntPtr.Zero;
                if (SdkManager.Is64Bit)
                {
                    ptrTemp = new IntPtr(ptrPlayWndInfo.ToInt64() + i * Marshal.SizeOf(typeof(PLAY_WND_INFO_S)));
                }
                else
                {
                    ptrTemp = new IntPtr(ptrPlayWndInfo.ToInt32() + i * Marshal.SizeOf(typeof(PLAY_WND_INFO_S)));
                }
                astPlayWndInfo[i] = (PLAY_WND_INFO_S)Marshal.PtrToStructure(ptrTemp, typeof(PLAY_WND_INFO_S)); 
            }
        }

        /// <summary>
        /// 获取播放窗体句柄
        /// </summary>
        /// <param name="handle"></param>
        public void GetHandle(int index, ref IntPtr handle)
        {
            this.imosPlayer.GetHwnd(index, ref handle);
        }
 

        private void addUsrBtn_Click_1(object sender, EventArgs e)
        {
            //增加用户和TabPage页
           // this.tabPage1.Text = "用户1";
            TabPage tabPage = new TabPage();
            tabPage.Controls.Add(this);
            String str = String.Format("用户{0}", (++pageIndex).ToString());
            tabPage.Text = str; 
        }

        private void treeView_AfterCollapse(object sender, TreeViewEventArgs e)
        {
            treeView.SelectedNode.Nodes.Clear();
        }

        private void treeView_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            TreeNode treeNode = treeView.SelectedNode;

            sdkManager.OrganizeChildrenNodes(treeNode, treeView);

            sdkManager.PlayVideo(treeNode, this.imosPlayer, this.ptzPanel1);
        }


        private void treeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            TreeNode treeNode = treeView.SelectedNode;
            if (null == treeNode)
            {
                return;
            }
            ORG_RES_QUERY_ITEM_S stOrgQueryItem = (ORG_RES_QUERY_ITEM_S)treeNode.Tag;
            if (stOrgQueryItem.ulResType == (UInt32)IMOS_TYPE_E.IMOS_TYPE_CAMERA)
            {
                vodPanel.CameraCode = Encoding.Default.GetString(stOrgQueryItem.szResCode);
                vodPanel.SetCameraName(IMOSSDK.UTF8ToUnicode(stOrgQueryItem.szResName));
                ptzPanel1.CamCode = Encoding.Default.GetString(stOrgQueryItem.szResCode);
                ptzPanel1.setCamName(IMOSSDK.UTF8ToUnicode(stOrgQueryItem.szResName));

            }
            
        }

        //回调处理函数
        public void ProcessCallBack(UInt32 ulProcType, IntPtr ptrParam)
        {
            try
            {
                this.PostMessageForMain("回调上报信息：" + ulProcType);
                switch (ulProcType)
                {
                    case (uint)CALL_BACK_PROC_TYPE_E.PROC_TYPE_LOGOUT:
                        {
                            this.PostMessageForMain("退出登录，将尝试重新登录！");
                            //LoginAgain();
                            LoginoutTryLoginDelegate logout = new LoginoutTryLoginDelegate(LoginAgain);
                            logout.Invoke();
                        }
                        break;
                    case  (uint)CALL_BACK_PROC_TYPE_E.PROC_TYPE_ALARM:
                        AS_ALARMPUSH_UI_S stAlarmInfo = new AS_ALARMPUSH_UI_S();
                        stAlarmInfo = (AS_ALARMPUSH_UI_S)Marshal.PtrToStructure(ptrParam, typeof(AS_ALARMPUSH_UI_S));

                        string strAlarmDesc = Encoding.Default.GetString(stAlarmInfo.byAlarmDesc);
                        strAlarmDesc = strAlarmDesc.Split('\0')[0];
                        string strAlarmEventCode = Encoding.Default.GetString(stAlarmInfo.byAlarmEventCode);
                        strAlarmEventCode = strAlarmEventCode.Split('\0')[0];
                        string strAlarmSrcCode = Encoding.Default.GetString(stAlarmInfo.byAlarmSrcCode);
                        strAlarmSrcCode = strAlarmSrcCode.Split('\0')[0];
                        string strAlarmSrcName = Encoding.Default.GetString(stAlarmInfo.byAlarmSrcName);
                        strAlarmSrcName = strAlarmSrcName.Split('\0')[0];
                        string strAlarmTIme = Encoding.Default.GetString(stAlarmInfo.byAlarmTime);
                        strAlarmTIme = strAlarmTIme.Split('\0')[0];

                        DataRow dr = vodPanel.dtAlarmInfo.NewRow();
                        dr[SdkManager.ALARMSEQ] = ++seq;
                        dr[SdkManager.ALARMEVENTCODE] = strAlarmEventCode;
                        dr[SdkManager.ALARMSRCCODE] = strAlarmSrcCode;
                        dr[SdkManager.ALRAMSRCNAME] = strAlarmSrcName;
                        dr[SdkManager.ALARMTIME] = strAlarmTIme;
                        dr[SdkManager.ALARMTYPE] = stAlarmInfo.ulAlarmType;
                        dr[SdkManager.ALARMLEVEL] = stAlarmInfo.ulAlarmLevel;
                        dr[SdkManager.ALARMDESC] = strAlarmDesc;
                        vodPanel.dtAlarmInfo.Rows.Add(dr);

                        this.vodPanel.dgvAlarmInfo.DataSource = vodPanel.dtAlarmInfo;
                        if (true == this.vodPanel.dgvAlarmInfo.InvokeRequired)
                        {
                            displayAlarmInfoDelegate daid = new displayAlarmInfoDelegate(dgvAlaramRefresh);
                            this.vodPanel.dgvAlarmInfo.Invoke(daid);
                        }
                        break;
                    default:
                        break;
                }
            }
            catch(SystemException ex)
            {
                MessageBox.Show(ex.Message);
            }

        }


        public void LoginAgain()
        {
            try
            { 
                CommonFunc.LoginOut(ref stLoginInfo.stUserLoginIDInfo);
                //断线重连
                stLoginInfo = sdkManager.LoginMethod(strUsrLoginName, strUsrLoginPsw, strSrvIpAddr, "N/A");
            }
            catch (Exception ex)
            {

            }
        }

        private void ptzPanel1_DoPtzEvent(object sender, ptz.PTZPanel.PtzEventArgs e)
        {
            UInt32 ulret = 0;
            try
            {
                PTZ_CTRL_COMMAND_S stPTZCommand = new PTZ_CTRL_COMMAND_S();
                stPTZCommand.ulPTZCmdID = (UInt32)e.ptzCmd;
                stPTZCommand.ulPTZCmdPara1 = (UInt32)e.ulPtzSpeed;
                stPTZCommand.ulPTZCmdPara2 = (UInt32)e.ulPtzSpeed;
                if (null == PlayerPanel.SelectPlayer.CameraCode)
                {
                    MessageBox.Show("选中窗格没有云台摄像机！");
                    return;
                }
                ulret = PTZControl.PtzCtrlCommand(ref sdkManager.stLoginInfo.stUserLoginIDInfo, PlayerPanel.SelectPlayer.CameraCode, ref stPTZCommand);
                if (0 != ulret)
                {
                    MessageBox.Show("云台操作失败！" + ulret);
                }
            }
            catch (Exception ex)
            {
                //log.Info(ex.Message);
            }
            
        }

        private void treeView_DragDrop(object sender, DragEventArgs e)
        {
            TreeNode treeNode = treeView.SelectedNode;

            sdkManager.OrganizeChildrenNodes(treeNode, treeView);

            sdkManager.PlayVideo(treeNode, this.imosPlayer, this.ptzPanel1);
        }

        private void imosPlayer_DragDrop(object sender, DragEventArgs e)
        {
            TreeNode treeNode = treeView.SelectedNode;

            sdkManager.OrganizeChildrenNodes(treeNode, treeView);

            sdkManager.PlayVideo(treeNode, this.imosPlayer, this.ptzPanel1);
        }

        private void dgvAlaramRefresh()
        {
            this.vodPanel.dgvAlarmInfo.Invalidate();
        }

        private void vodPanel_XpRunMsg(object sender, RunMsgEventArgs e)
        { 
            MessageBox.Show(e.Describe);
            this.PostMessageForMain("XP上报消息：" + e.Type.ToString());
            switch ((XP_RUN_INFO_TYPE_E)e.Type)
            {
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_SIP_LIVE_TIMEOUT:
                    {
                        //可以断线重连
                        PostMessageForMain("保活失败，请重新登录系统！");
                    }
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_AUDIO_FRAME_NUM:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_DOWN_MEDIA_PROCESS:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_DOWN_RTSP_PROTOCOL:
                    break;
                case XP_RUN_INFO_TYPE_E.XP_RUN_INFO_LOST_PACKET_RATIO:
                    break;
                default:
                    break;
            }
        }

        private void VodPanel_PostMessageForMain(object sender, PostMessageEventArgs e)
        {
            this.PostMessageForMain(e.Message);
        }
        private void PostMessageForMain(string strMessage)
        {
            if (PostMessage != null)
            {
                PostMessage(this, new PostMessageEventArgs()
                {
                    Message = strMessage
                }); 
            }
        }
    } 
}
