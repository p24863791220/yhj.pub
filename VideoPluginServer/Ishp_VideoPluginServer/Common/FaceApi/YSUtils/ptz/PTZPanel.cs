using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Collections;
using System.Data.Odbc;
using System.Threading;
using IMOS_SDK_DEMO.sdk;
//using log4net;
using System.Runtime.InteropServices;
using IMOS_SDK_DEMO.player;

namespace IMOS_SDK_DEMO.ptz
{
    public partial class PTZPanel : UserControl
    {
 
        private String camCode = "";

        public SdkManager sdkManager {set; get;}
        private DataTable m_dtPreset = new DataTable();

        /// <summary>
        /// 云台控制面板的自定义事件委托
        /// </summary>
        public class PtzEventArgs: EventArgs
        {
            public MW_PTZ_CMD_E ptzCmd;
            public int ulPtzSpeed;
            public string szCameraCode;
        }

        public delegate void PtzHandler(object sender, PtzEventArgs e);

        public event PtzHandler DoPtzEvent;

        protected void OnDoPtzEvent(PtzEventArgs e)
        {
            if ( null != DoPtzEvent)
            {
                PtzEventArgs PtzEventArgs = e;
                e.szCameraCode = this.camCode;
                e.ulPtzSpeed = currentSpeed;
                DoPtzEvent(this, PtzEventArgs);
            }
        }

        public String CamCode
        {
            get { return camCode; }
            set { camCode = value; }
        }

        private int currentSpeed = 6;

        //public MainForm m_mainForm;

        public int CurrentSpeed
        {
            get { return currentSpeed; }
        }

        public PTZPanel()
        {
            InitializeComponent();
            m_dtPreset.Columns.Add("desc");
            m_dtPreset.Columns.Add("value");
        }

        /// <summary>
        /// 用于获得mainform句柄
        /// </summary>
        /// <param name="handle"></param>
        //public void InitMainFormHandle(MainForm handle)
        //{
        //    m_mainForm = handle;

        //}

        private void PTZ_Speed_ValueChanged(object sender, EventArgs e)
        {
            currentSpeed = Convert.ToInt32(nudSpeed.Value);
        }
        
        public void setCamName(String CamName)
        {
            tbCameraName.Text = CamName;
        }
        
       
        public void initSdkManager(SdkManager sdkManager)
        {
            this.sdkManager = sdkManager;
        }

       

        private void btnRight_MouseDown(object sender, MouseEventArgs e)
        {
            btnRight.ImageIndex = 6;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_PANRIGHT;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnRight_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnRight.ImageIndex = 7;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_PANRIGHTSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeftUp_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnLeftUp.ImageIndex = 0;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_LEFTUP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeftUp_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnLeftUp.ImageIndex = 1;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_LEFTUPSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnUp_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnUp.ImageIndex = 2;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_TILTUP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnUp_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnUp.ImageIndex = 3;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_TILTUPSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnRightUp_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnRightUp.ImageIndex = 4;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_RIGHTUP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnRightUp_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnRightUp.ImageIndex = 5;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_RIGHTUPSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeft_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnLeft.ImageIndex = 14;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_PANLEFT;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeft_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnLeft.ImageIndex = 15;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_PANLEFTSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnStop_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnStop.ImageIndex = 16;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ALLSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnStop_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnStop.ImageIndex = 17;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ALLSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeftDown_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnLeftDown.ImageIndex = 12;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_LEFTDOWN;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnLeftDown_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnLeftDown.ImageIndex = 13;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_LEFTDOWNSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnDown_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnDown.ImageIndex = 10;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_TILTDOWN;
            OnDoPtzEvent(ptzArgs); 

        }

        private void btnDown_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnDown.ImageIndex = 11;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_TILTDOWNSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnRightDown_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnRightDown.ImageIndex = 8;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_RIGHTDOWN;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnRightDown_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnRightDown.ImageIndex = 9;
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_RIGHTDOWNSTOP;
            OnDoPtzEvent(ptzArgs); 
        }

        private void btnPresetOperate_Click(object sender, EventArgs e)
        {
            //SubCtrl selectedSubCtrl = m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];
            ////增加预置位
            //AddPresetFrm presetFrm = new AddPresetFrm(selectedSubCtrl.sdkManager, camCode);
            //presetFrm.ShowDialog();
        }

       

        private void btnJmp_Click(object sender, EventArgs e)
        {
            UInt32 ulRet = 0;
            try
            {
                byte[] byCamera = Encoding.UTF8.GetBytes(this.camCode);
                if (comboBox1.Items.Count == 0)
                {                   
                    MessageBox.Show("该摄像机没有预置位！");
                    return;
                }

                if (null == comboBox1.SelectedValue)
                {
                    return;
                }

                uint ulPreset = uint.Parse(comboBox1.SelectedValue.ToString());
                ulRet = PTZControl.UsePreset(ref sdkManager.stLoginInfo.stUserLoginIDInfo, byCamera, ulPreset);
                if(ulRet!=0)
                {
                    MessageBox.Show("预置位跳转失败[IMOS_UsePreset],错误码：" + ulRet);
                }
            }
            catch (Exception err)
            {
                //Log.Write.Error(err.Message, err);
            }
        }

        private void btnCruise_Click(object sender, EventArgs e)
        {
            SubCtrl selectedSubCtrl = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];
            try
            {
                uint ulResult;

                if (null == comboBox1.SelectedValue)
                {
                    return;
                }

                byte[] byCamera = Encoding.UTF8.GetBytes(this.camCode);

                uint ulPreset = uint.Parse(comboBox1.SelectedValue.ToString());

                ulResult = PTZControl.DeletePreset(ref selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, byCamera, ulPreset);

                if (0 != ulResult)
                {
                    MessageBox.Show("删除预置位出错：" + ulResult);
                }
                else
                {
                    GetPreset(null); 
                }
            }
            catch (Exception err)
            {
                //Log.Write.Error(err.Message, err);
            }
        }

        private void btnIrisOpen_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnIrisOpen.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_IRISOPEN;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_IRISOPEN);
        }

        private void btnIrisOpen_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnIrisOpen.Text = "光";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_IRISOPENSTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_IRISOPENSTOP);
        }

        private void btnIrisClose_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnIrisClose.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_IRISCLOSE;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_IRISCLOSE);
        }

        private void btnIrisClose_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnIrisClose.Text = "圈";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_IRISCLOSESTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_IRISCLOSESTOP);
        }

        private void btnFocusFar_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnFocusFar.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_FOCUSNEAR;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_FOCUSNEAR);
        }

        private void btnFocusFar_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnFocusFar.Text = "聚";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_FOCUSNEARSTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_FOCUSNEARSTOP);
        }

        private void btnFocusNear_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnFocusNear.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_FOCUSFAR;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_FOCUSFAR);
        }

        private void btnFocusNear_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnFocusNear.Text = "焦";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_FOCUSFARSTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_FOCUSFARSTOP);
        }

        private void btnZoomIn_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnZoomIn.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ZOOMTELE;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_ZOOMTELE);
        }

        private void btnZoomIn_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnZoomIn.Text = "变";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ZOOMTELESTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_ZOOMTELESTOP);
        }

        private void btnZoomOut_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnZoomOut.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ZOOMWIDE;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_ZOOMWIDE);
        }

        private void btnZoomOut_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnZoomOut.Text = "倍";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_ZOOMWIDESTOP;
            OnDoPtzEvent(ptzArgs);
            //SendMessage(MW_PTZ_CMD_E.MW_PTZ_ZOOMWIDESTOP);
        }
         

        private void comboBox1_DropDown(object sender, EventArgs e)
        {
            GetPreset(null);
        }

        /// <summary>
        /// 得到该摄像机的所有的预置位
        /// </summary>
        private void GetPreset(object obj)
        {
            SubCtrl selectedSubCtrl = null;//m_mainForm.g_userCtrlList[m_mainForm.tabControl1.SelectedIndex];
            try
            {
                if (string.IsNullOrEmpty(camCode))
                {
                    return;
                }

                byte[] byCamera = Encoding.UTF8.GetBytes(camCode);
                List<PRESET_INFO_S> lPreset = PTZControl. QueryPreset(selectedSubCtrl.sdkManager.stLoginInfo.stUserLoginIDInfo, byCamera);
                m_dtPreset.Rows.Clear();

                foreach (PRESET_INFO_S stPreset in lPreset)
                {
                    DataRow dr = m_dtPreset.NewRow();
                    dr["desc"] = Encoding.UTF8.GetString(stPreset.szPresetDesc).TrimEnd('\0') + '[' + stPreset.ulPresetValue + ']';
                    dr["value"] = stPreset.ulPresetValue;

                    m_dtPreset.Rows.Add(dr);
                }


                if (comboBox1.InvokeRequired)
                {
                    this.Invoke((IMOS_SDK_DEMO.sdk.IMOSSDK.MethodInvoke1<DataTable>)delegate(DataTable dtResult)
                    {
                        comboBox1.DataSource = dtResult;
                        comboBox1.DisplayMember = "desc";
                        comboBox1.ValueMember = "value";
                    }, new object[] { m_dtPreset });
                }
                else
                {
                    comboBox1.DataSource = m_dtPreset;
                    comboBox1.DisplayMember = "desc";
                    comboBox1.ValueMember = "value";
                }

            }
            catch (Exception err)
            {
                //Log.Write.Error(err.Message, err);
            }
        }

        

       

        public void changeCameraCode(object sender, IMOS_SDK_DEMO.player.PlayerPanel.cameraCodeEventArgs e)
        {
            this.camCode = e.CameraCode;
            this.setCamName(e.CameraCode);
        }

        private void btnLightOn_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnLightOn.Text = "";

            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_INFRAREDON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnLightOn_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnLightOn.Text = "红";

            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_INFRAREDON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnLightOff_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnLightOff.Text = "";

            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_INFRAREDOFF;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnLightOff_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnLightOff.Text = "外";

            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_INFRAREDOFF;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnHeaterOn_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnHeaterOn.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_HEATON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnHeaterOn_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnHeaterOn.Text = "加";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_HEATON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnHeaterOff_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnHeaterOff.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_HEATOFF;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnHeaterOff_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnHeaterOff.Text = "热";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_HEATOFF;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnBrushOn_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnBrushOn.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_BRUSHON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnBrushOn_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnBrushOn.Text = "雨";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_BRUSHON;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnBrushOff_MouseDown(object sender, MouseEventArgs e)
        {
            this.btnBrushOff.Text = "";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_BRUSHOFF;
            OnDoPtzEvent(ptzArgs);
        }

        private void btnBrushOff_MouseUp(object sender, MouseEventArgs e)
        {
            this.btnBrushOff.Text = "刷";
            PtzEventArgs ptzArgs = new PtzEventArgs();
            ptzArgs.ptzCmd = MW_PTZ_CMD_E.MW_PTZ_BRUSHOFF;
            OnDoPtzEvent(ptzArgs);
        }
         
    }
}
