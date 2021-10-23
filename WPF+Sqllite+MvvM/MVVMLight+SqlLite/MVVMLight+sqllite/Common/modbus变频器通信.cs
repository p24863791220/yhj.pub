using Modbus.Device;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WpfApp1MvvM
{
    public partial class modbus变频器通信 : Form
    {
        public modbus变频器通信()
        {
            InitializeComponent();

            //初始化下拉菜单


            //获取电脑的可用端口号
            string[] ports = SerialPort.GetPortNames();
            cmb_Port.DataSource = ports;
            //绑定波特率
            this.cmb_BaudRate.DataSource = new string[] { "9600", "19200", "38400" };
            //绑定校验位
            this.cmb_parity.DataSource = new string[] { "无校验", "奇校验", "偶校验" };
            //绑定数据位
            this.cmb_Databits.DataSource = new string[] { "8", "7" };
            //绑定停止位
            this.cmb_Stopbits.DataSource = new string[] { "1", "2" };
        }

        ModbusSerialMaster serialMaster = null;
        SerialPort serialPort = null;
        Timer updateTimer = new Timer();
        private void btn_connect_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort = new SerialPort();
                serialPort.PortName = this.cmb_Port.Text;
                serialPort.BaudRate = Convert.ToInt32(this.cmb_BaudRate.Text);
                //校验位
                switch (this.cmb_parity.Text)
                {
                    case "无校验":
                        serialPort.Parity = Parity.None;
                        break;
                    case "奇校验":
                        serialPort.Parity = Parity.Odd;
                        break;
                    case "偶校验":
                        serialPort.Parity = Parity.Even;
                        break;
                    default:
                        serialPort.Parity = Parity.None;
                        break;
                }
                //数据位
                serialPort.DataBits = Convert.ToInt32(this.cmb_Databits);
                //停止位
                switch (this.cmb_Stopbits.Text)
                {
                    case "1":
                        serialPort.StopBits = StopBits.One;
                        break;
                    case "2":
                        serialPort.StopBits = StopBits.Two;
                        break;
                    default:
                        serialPort.StopBits = StopBits.One;
                        break;
                }
                //绑定站地址
                for (int i = 1; i < 10; i++)
                {
                    this.cmb_SlabeId.Items.Add(i.ToString());
                }

                //连接
                serialPort.Open();
                serialMaster = ModbusSerialMaster.CreateRtu(serialPort);
                Debug.WriteLine("连接成功");
                updateTimer.Tick += updateTimer_Tick;
                updateTimer.Interval = 500;
                updateTimer.Start();

            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "连接失败", "提示");
                updateTimer.Stop();
            }
        }
        private void updateTimer_Tick(object sender, EventArgs e)
        {
            //读取一个值，分别频率，转速，电流
            ushort[] result = serialMaster.ReadHoldingRegisters(Convert.ToByte(this.cmb_SlabeId.Text), 23, 3);
            this.lab_frq.Text = (result[0] * 0.01f).ToString();
            this.lab_speed.Text = (result[1]).ToString();
            this.lab_current.Text = (result[2] * 0.01f).ToString();
        }
        private void btn_disconnect_Click(object sender, EventArgs e)
        {
            if (serialPort != null && serialPort.IsOpen)
            {
                serialPort.Close();
                serialMaster = null;
                updateTimer.Stop();
                Debug.WriteLine("断开连接成功");
            }
        }

        private void btn_start_Click(object sender, EventArgs e)
        {
            //往99这个地址写0x047F
            serialMaster.WriteSingleRegister(Convert.ToByte(this.cmb_SlabeId.ToString()), 99, 0x047F);

        }

        private void btn_stop_Click(object sender, EventArgs e)
        {
            //往99这个地址写0x047E
            serialMaster.WriteSingleRegister(Convert.ToByte(this.cmb_SlabeId.ToString()), 99, 0x047E);


        }

        private void num_freset_ValueChanged(object sender, EventArgs e)
        {
            //往100这个地址写值 线性转换
            float scale = 16384.0f / 50.0f;
            float freset = Convert.ToSingle(this.num_FreSet.Value) * scale;
            serialMaster.WriteSingleRegister(Convert.ToByte(this.cmb_SlabeId.ToString()), 100, Convert.ToUInt16(freset));
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }
    }
}