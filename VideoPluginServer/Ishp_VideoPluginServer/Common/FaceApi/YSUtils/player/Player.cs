using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using IMOS_SDK_DEMO.player;
using IMOS_SDK_DEMO.sdk;
using IMOS_SDK_DEMO.ptz;

namespace IMOS_SDK_DEMO.player
{
    public partial class Player : UserControl
    {
        public Player()
        {
            InitializeComponent();
            init();
        }

        private SubCtrl subCtrl;
        public  PlayerPanel[] m_playerUnit = new PlayerPanel[25];

        public SdkManager sdkManager {set; get;}
        //public MainForm m_mainForm {set; get;}

        private const int m_unitInterval = 2;

        public class CameraCodeMsgEventArgs : EventArgs
        {
            private String cameraCode;
            public String CameraCode
            {
                get
                {
                    return cameraCode;
                }
                set
                {
                    CameraCode = cameraCode;
                }
            }
        }
     
        public int m_unitNumber = 4;
        public int UnitNumber
        {
            get { return m_unitNumber; }
            set { m_unitNumber = value; }
        }
    
        //public byte[] CurrentXPCode
        //{
        //    get { return Encoding.Default.GetBytes(m_playerUnit[PlayerPanel.SelectedIndex].strChannelCode); }
        //}

        public void init()
        {
            for (int i = 0; i < 25;i++ )
            {
                m_playerUnit[i] = new PlayerPanel();
                m_playerUnit[i].AllowDrop = true;
                m_playerUnit[i].AutoScroll = true;
                m_playerUnit[i].Parent = pnlPlayerBG;
                m_playerUnit[i].m_player = this;
                m_playerUnit[i].Visible = false;
                m_playerUnit[i].Index = i;
            }
            PlayerPanel.SelectPlayer = m_playerUnit[0];
        }

        //public void InitMainFormHandle(MainForm handle)
        //{
        //    m_mainForm = handle;

        //}

        public void initSdkManager(SdkManager sdkManager)
        {
            this.sdkManager = sdkManager;
        }


        public void RedrawBorder(int unitNumber)
        {
			/*begin add by guwuqiang 在部分环境下会产生异常，加保护*/
            if (m_playerUnit[25-1] == null)
            {
                return;
            }
			/*end add by guwuqiang 在部分环境下会产生异常，加保护*/
            for (int i = 0; i < 25; i++)
            {
                m_playerUnit[i].Visible = false;
            }
            
            if (PlayerPanel.SelectPlayer.Max)
            {
                int UnitWidth = (int)((pnlPlayerBG.Size.Width - 2 * m_unitInterval));
                int UnitHeight = (int)((pnlPlayerBG.Size.Height - 2 * m_unitInterval));
                int posX = pnlPlayerBG.Location.X + m_unitInterval;
                int posY = pnlPlayerBG.Location.Y + m_unitInterval;
                PlayerPanel.SelectPlayer.Location = new Point(posX, posY);
                PlayerPanel.SelectPlayer.Size = new Size(UnitWidth, UnitHeight);
                PlayerPanel.SelectPlayer.Visible = true;
            }
            else
            {
                int RowNum = (int)Math.Sqrt(unitNumber);
                int UnitWidth = (int)((pnlPlayerBG.Size.Width - (RowNum + 1) * m_unitInterval) / RowNum);
                int UnitHeight = (int)((pnlPlayerBG.Size.Height - (RowNum + 1) * m_unitInterval) / RowNum);

                for (int i = 0; i < unitNumber; i++)
                {
                    int posX = pnlPlayerBG.Location.X + (i % RowNum) * UnitWidth + (i % RowNum + 1) * m_unitInterval;
                    int posY = pnlPlayerBG.Location.Y + (i / RowNum) * UnitHeight + (i / RowNum + 1) * m_unitInterval;
                    m_playerUnit[i].Location = new Point(posX, posY);
                    m_playerUnit[i].Size = new Size(UnitWidth, UnitHeight);
                    m_playerUnit[i].Init(i);
                    m_playerUnit[i].Show();
                    //m_playerUnit[i].Visible = true;
                }
            }
        
        }

        public void GetHwnd(int index, ref IntPtr handle)
        {
            m_playerUnit[index].GetHwnd(ref handle);
           
        }

        //public void SetXPCode(int index, byte[] xpCode)
        //{
        //    m_playerUnit[index].strChannelCode = Encoding.Default.GetString(xpCode);
        //}

        public UInt32 PlayLive(byte[] CameraCode)
        {
            return m_playerUnit[PlayerPanel.SelectedIndex].StartLive(CameraCode);
        }

        public UInt32 StopLive()
        { 
            return m_playerUnit[PlayerPanel.SelectedIndex].Stoplive();
        }

        public UInt32 StopAll()
        {
            UInt32 ulRet = 0;
            int index = 0;
            //遍历全部窗体，释放业务
            foreach (PlayerPanel panel in m_playerUnit)
            {
                index++;
                PlayerPanel.SelectedIndex = panel.Index; 
                switch (panel.PlayType)
                { 
                    case PlayerPanel.PLAY_TYPE_E.PLAY_TYPE_LIVE:
                        ulRet = this.StopLive(); 
                        break;
                    case PlayerPanel.PLAY_TYPE_E.PLAY_TYPE_SWITCH:
                        break;
                    case PlayerPanel.PLAY_TYPE_E.PLAY_TYPE_VOD:
                        ulRet = this.StopVod(); 
                        break;
                    case PlayerPanel.PLAY_TYPE_E.PLAY_TYPE_LOCAL:
                        break;
                    default:
                        break;
                }
            }
            return ulRet;
        }

        public void FreeAllChannel()
        {
            foreach (PlayerPanel panel in m_playerUnit)
            {
                panel.channelCode = null;
            }
        }

        

        public UInt32 StartVod(URL_INFO_S stURLInfo)
        {
            return m_playerUnit[PlayerPanel.SelectedIndex].StartVod(stURLInfo);
        }

        public UInt32 StopVod()
        {
            return m_playerUnit[PlayerPanel.SelectedIndex].StopVod();
        }

        private void Player_Load(object sender, EventArgs e)
        {
            RedrawBorder(m_unitNumber);
        }

        public void DrawBorder(Graphics dc)
        {
            if (!this.Visible)
            {
                return;
            }

            Pen myPen;

            for (int i = 0; i < m_unitNumber; i++)
            {
                if (m_playerUnit[i].Index == PlayerPanel.SelectedIndex)
                {
                    myPen = new Pen(Color.FromArgb(0, 0, 255), 2);
                    m_playerUnit[i].SetTitleColor(Color.SkyBlue);
                }
                else
                {
                    myPen = new Pen(Color.FromArgb(125, 125, 116), 2);
                    m_playerUnit[i].SetTitleColor(Color.Gray);
                }

                Rectangle rect = m_playerUnit[i].RectangleToScreen(m_playerUnit[i].ClientRectangle);
                dc.DrawRectangle(myPen, this.RectangleToClient(rect));


            }
        }

        private void pnlPlayerBG_Paint(object sender, PaintEventArgs e)
        {
            DrawBorder(e.Graphics);
        }

        private void pnlPlayerBG_Resize(object sender, EventArgs e)
        {
            RedrawBorder(m_unitNumber);
            this.pnlPlayerBG.Refresh();
        }

       
    }
}
