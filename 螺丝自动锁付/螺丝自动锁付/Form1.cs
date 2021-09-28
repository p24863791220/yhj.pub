using BasicDemo;
using Emgu.CV;
using Emgu.CV.Structure;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HslCommunicationDemo;

namespace 螺丝自动锁付
{

    public partial class Form1 : Form
    {
        
        [DllImport("User32.dll ", EntryPoint = "SetParent")]
        private static extern IntPtr SetParent(IntPtr hWndChild, IntPtr hWndNewParent);

        [DllImport("user32.dll ", EntryPoint = "ShowWindow")]
        public static extern int ShowWindow(IntPtr hwnd, int nCmdShow);
        public Form1()
        {
            InitializeComponent();
        }

        private void 退出ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
            Environment.Exit(0);
        }
        public static hkmvsbasic hkc = new hkmvsbasic();
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                hkc.Show();
            }
            catch (Exception ex)
            {
                for (int i=0;i<20; i++)
                {
                    Application.DoEvents();
                    System.Threading.Thread.Sleep(100);
                }
                
                hkmvsbasic hkc = new hkmvsbasic();
                hkc.Show();
            }
           
          
            //Process p = new Process();
            //p.StartInfo.FileName = @"C:\Program Files\VisionMaster3.4.0\Applications\VisionMaster";
            //    p.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Normal;//设置程序样式
            //    p.Start();
            //    SetParent(p.MainWindowHandle, this.haikang.Handle); //改变p的父窗口句柄为本程序句柄
            //ShowWindow(p.MainWindowHandle, 3);//第一个参数窗口句柄,第二个参数 指定窗口如何显示 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            points_camera = new PointF[9];
            points_camera[0].X = 1372.36f;
            points_camera[0].Y = 869.00f;
            points_camera[1].X = 1758.86f;
            points_camera[1].Y = 979.09f;
            points_camera[2].X = 2145.75f;
            points_camera[2].Y = 1090.03f;
            points_camera[3].X = 2040.02f;
            points_camera[3].Y = 1461.64f;
            points_camera[4].X = 1935.01f;
            points_camera[4].Y = 1833.96f;
            points_camera[5].X = 1546.79f;
            points_camera[5].Y = 1724.21f;
            points_camera[6].X = 1158.53f;
            points_camera[6].Y = 1613.17f;
            points_camera[7].X = 1265.07f;
            points_camera[7].Y = 1240.49f;
            points_camera[8].X = 1652.6f;
            points_camera[8].Y = 1351.27f;

            points_robot = new PointF[9];
            points_robot[0].X = 98.844f;
            points_robot[0].Y = 320.881f;
            points_robot[1].X = 109.81f;
            points_robot[1].Y = 322.27f;
            points_robot[2].X = 120.62f;
            points_robot[2].Y = 323.659f;
            points_robot[3].X = 121.88f;
            points_robot[3].Y = 313.154f;
            points_robot[4].X = 123.111f;
            points_robot[4].Y = 302.671f;
            points_robot[5].X = 112.23f;
            points_robot[5].Y = 301.107f;
            points_robot[6].X = 101.626f;
            points_robot[6].Y = 299.816f;
            points_robot[7].X = 100.343f;
            points_robot[7].Y = 310.477f;
            points_robot[8].X = 111.083f;
            points_robot[8].Y = 311.655f;

            CalRobot();
        }
          double A, B, C, D, E, F;

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void 打开ToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void openautocheck_Click(object sender, EventArgs e)
        {
            AutoCheck ac = new AutoCheck();
            ac.Show();
        }

        public static FormSiemensFW sf = new FormSiemensFW();
        public static FormS7Server s7s = new FormS7Server();
        private void siemensFW_Click(object sender, EventArgs e)
        {
            try
            {
                if (sf != null)
                    sf.Show();
                else
                {
                    FormSiemensFW sf = new FormSiemensFW();
                    sf.Show();
                }
            }
            catch (Exception ex)
            {
                FormSiemensFW sf = new FormSiemensFW();
                sf.Show();
            }
        }

        private void s7server_Click(object sender, EventArgs e)
        {
            try
            {
                    s7s.Show();
            }
            catch (Exception ex)
            {
                FormS7Server s7s = new FormS7Server();
                s7s.Show();
            }
        }

        private void hkcatchpic_Click(object sender, EventArgs e)
        {
            button1_Click(null, null);
            if (hkc.bnOpen.Enabled==true)
            {
                hkc.bnOpen_Click(null, null);
            }
            if (hkc.bnStartGrab.Enabled == true)
            {
                hkc.bnStartGrab_Click(null, null);
            }
            if (hkc.bnSaveJpg.Enabled == true)
            {
                hkc.bnSaveJpg_Click(null, null);
            }
            if (hkc.bnSaveJpg.BackColor ==Color.Green)
            {

            }
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void machinepoint_Click(object sender, EventArgs e)
        {
            PointF CCDPos = new PointF();
            CCDPos.X = 10;
            CCDPos.Y = 100;
            PointF RobotPos = TransformPoint(CCDPos);
        }

        PointF[] points_camera, points_robot;
            private void CalRobot()
            {
                Mat warpMat = new Mat() ;
            warpMat = CvInvoke.EstimateAffine2D(points_camera, points_robot);
            var k = warpMat.ToImage<Gray, float>();
            Matrix<double> matrix = new Matrix<double>(2, 3, warpMat.DataPointer).Transpose();
            //warpMat = CvInvoke.EstimateRigidTransform(points_camera, points_robot, true);//原
            Image<Gray, float> img = warpMat.ToImage<Gray, float>();
                A = img.Data[0, 0, 0];
                B = img.Data[0, 1, 0];
                C = img.Data[0, 2, 0];
                D = img.Data[1, 0, 0];
                E = img.Data[1, 1, 0];
                F = img.Data[1, 2, 0];
            }
            public PointF TransformPoint(PointF pPoint)
            {
                //********************************************            
                // x = x'k*cost-y'k* sint+x0,
                // y = x'k*sint+y'k* cost+y0.
                //A = k*cost,B =-k* sint,C
                //D = k*sint,E = k* cost,F
                //********************************************* 
                PointF tPoint = new PointF();
                tPoint.X = Convert.ToSingle(A * pPoint.X + B * pPoint.Y + C);
                tPoint.Y = Convert.ToSingle(D * pPoint.X + E * pPoint.Y + F);
                return tPoint;
            }
    }
}
