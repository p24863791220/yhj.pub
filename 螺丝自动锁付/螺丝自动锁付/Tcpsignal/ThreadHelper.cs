using System;
using System.Threading;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Drawing;

namespace SignalCommunication
{
    /// <summary>
    /// 线程操作类
    /// </summary>
    public  class ThreadHelper:IDisposable
    {
        #region 初始化全局参数
        /// <summary>
        /// 当前Form对象
        /// </summary>
        private  Form ThisForm;

        /// <summary>
        /// 当前程序地根目录
        /// </summary>
        private  string strBaseDirectory = AppDomain.CurrentDomain.BaseDirectory;

        /// <summary>
        /// 线程数组对象
        /// </summary>
        List<ThreadInfo> listThread = new List<ThreadInfo>();
        /// <summary>
        /// 当前点击的
        /// </summary>
        private string ShowBtnName = "";
        /// <summary>
        /// 定时检测并执行
        /// </summary>
        private System.Timers.Timer ExecTime = new System.Timers.Timer();

        #endregion 结束初始化全局参数

        #region 初始化方法
        /// <summary>
       /// 初始化方法
       /// </summary>
       /// <param name="form">窗体对象</param>
       public ThreadHelper(Form form)
       {
           ThisForm = form;

           ///设置内部订时器
           ExecTime.Enabled = true;
           ExecTime.Interval = 2000;
           ExecTime.AutoReset = true;
           ExecTime.Elapsed += new System.Timers.ElapsedEventHandler(ExecTime_Tick);
           ExecTime.Start();
       }
        #endregion 结束初始化方法

       #region 订时器检测线程执行情况

       /// <summary>
        /// 给线程对象添加一个线程，返回一个Guid,本ID用于结束线程
        /// </summary>
        /// <param name="thread">线程对象</param>
        /// <returns>Guid</returns>
        private string AddThread(Thread thread)
       {
           string strGuid = "";
          
               strGuid = Guid.NewGuid().ToString();
               ThreadInfo threadInfo = new ThreadInfo();
               threadInfo.Threading = thread;
               threadInfo.ThreadName = strGuid;
               listThread.Add(threadInfo);
              
          
           return strGuid;
       }
     
        /// <summary>
        /// 开始执行一个线程
        /// </summary>
        /// <param name="thread">开始的线程对象</param>
        public void StartThread(Thread thread)
        {
                string strGuid = AddThread(thread);
                for (int i = 0; i < listThread.Count; i++)
                {
                    if (listThread[i].ThreadName == strGuid)
                    {
                        listThread[i].Threading.Start(strGuid);
                    }
                }
        }
        /// <summary>
        /// 结束一个线程
        /// </summary>
        /// <param name="strGuid">添加该线程对象时的返回的Guid</param>
        public void StopThred(object strGuid)
        {
            for (int i = 0; i < listThread.Count; i++)
            {
                if (listThread[i].ThreadName == strGuid.ToString())
                {
                    listThread[i].ISExecOK = true;
                }
            }
        }
       /// <summary>
       /// 定时检测,并且执行
       /// </summary>
       /// <param name="source"></param>
       /// <param name="e"></param>
       private void ExecTime_Tick(object source, System.Timers.ElapsedEventArgs e)
       {
           try
           {
               for (int i = 0; i < listThread.Count; i++)
               {
                   if (listThread[i].ISExecOK)
                   {
                       listThread[i].Threading.Abort();
                       listThread.Remove(listThread[i]);
                   }
               }
           }
           catch(Exception ex)
           {
               UnhandledExceptionEventArgs unhan = new UnhandledExceptionEventArgs(ex, false);
               ErrorHelper.CurrentDomain_UnhandledException(null,unhan);
           }
           
       }
       #endregion 结束订时器检测线程执行情况

       #region 线程委托设置
        /// <summary>
        /// 给下拉对象添加项
        /// </summary>
        /// <param name="comboBox"></param>
        /// <param name="straddText"></param>
        public void SetComboBoxAddItem(ComboBox comboBox,string straddText)
       {
           if (ThisForm != null)
           {
               if (ThisForm.IsDisposed == false)
               {
                   if (ThisForm.InvokeRequired)
                   {
                       ThisForm.Invoke(new Action(() =>
                       {

                           comboBox.Items.Add(straddText);
                       }));
                   }
                   else
                   {
                       comboBox.Items.Add(straddText);
                   }
               }
           }
       }
        /// <summary>
        /// 设置下拉的选择项
        /// </summary>
        /// <param name="comboBox"></param>
        /// <param name="intSelectIndex"></param>
       public void SetComboBoxSelectIndex(ComboBox comboBox, int intSelectIndex)
       {
           if (ThisForm != null)
           {
               if (ThisForm.IsDisposed == false)
               {
                   if (ThisForm.InvokeRequired)
                   {
                       ThisForm.Invoke(new Action(() =>
                       {

                           comboBox.SelectedIndex = intSelectIndex;
                       }));
                   }
                   else
                   {
                       comboBox.SelectedIndex = intSelectIndex;
                   }
               }
           }
       }
       /// <summary>
        ///设置label的文本内容
        /// </summary>
        /// <param name="label">label对象</param>
        /// <param name="strText">文本内容</param>
        public void SetLabelText(Label label, string strText)
        {

            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            if (ThisForm.IsDisposed == false)
                            {
                                label.Text = strText;
                            }
                        }));
                    }
                    else
                    {
                        if (ThisForm.IsDisposed == false)
                        {
                            label.Text = strText;
                        }
                    }
                }
            }
        }
        /// <summary>
        /// 设置chenkBox对象的chenk值
        /// </summary>
        /// <param name="checkBox">chenk对象</param>
        /// <param name="chenkValue">值</param>
        public void SetChenkBoxChenk(CheckBox checkBox, bool chenkValue)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {

                            checkBox.Checked = chenkValue;
                        }));
                    }
                    else
                    {
                        checkBox.Checked = chenkValue;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的大小
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="size">设置的大小</param>
        public void SetControlSize(Control control, Size size)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Size = size;
                        }));
                    }
                    else
                    {
                        control.Size = size;
                    }
                }
            }
        }
        /// <summary>
        /// 设置二个控件中的可视空间
        /// </summary>
        /// <param name="control"></param>
        /// <param name="padding"></param>
        public void SetControlMargin(Control control, System.Windows.Forms.Padding padding)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Margin = padding;
                        }));
                    }
                    else
                    {
                        control.Margin = padding;
                    }
                }
            }
        }
        /// <summary>
        /// 设置控件的背景
        /// </summary>
        /// <param name="control">控件对象</param>
        /// <param name="color">颜色值</param>
        public void SetControlBackColor(Control control, Color color)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.BackColor = color;
                        }));
                    }
                    else
                    {
                        control.BackColor = color;
                    }
                }
            }
        }
        /// <summary>
        /// 给对象添加一个对象
        /// </summary>
        /// <param name="control">需要添加的对象</param>
        /// <param name="con">待添加的对象</param>
        public void AddControlObject(Control control, Control con)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Controls.Add(con);
                        }));
                    }
                    else
                    {
                        control.Controls.Add(con);
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的字体
        /// </summary>
        /// <param name="control"></param>
        /// <param name="font"></param>
        public void SetControlFont(Control control, System.Drawing.Font font)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Font = font;
                        }));
                    }
                    else
                    {
                        control.Font = font;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的前景色
        /// </summary>
        /// <param name="control"></param>
        /// <param name="color"></param>
        public void SetControlForeColor(Control control, Color color)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.ForeColor = color;
                        }));
                    }
                    else
                    {
                        control.ForeColor = color;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的位置
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="point">位置坐标集合</param>
        public void SetControlPoint(Control control, Point point)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Location = point;
                        }));
                    }
                    else
                    {
                        control.Location = point;
                    }
                }
            }
        }
        /// <summary>
        /// 设置控件的名称
        /// </summary>
        /// <param name="control"></param>
        /// <param name="strName"></param>
        public void SetControlName(Control control, string strName)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Name = strName;
                        }));
                    }
                    else
                    {
                        control.Name = strName;
                    }
                }
            }
        }
        /// <summary>
        /// 显示窗体对象
        /// </summary>
        /// <param name="form"></param>
        public void SetFormShow(Form form)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            form.Show();
                        }));
                    }
                    else
                    {
                        form.Show();
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的高度
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="intHeight">高度值</param>
        public void SetControlHeight(Control control, int intHeight)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Height = intHeight;
                        }));
                    }
                    else
                    {
                        control.Height = intHeight;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的宽度
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="intWidth">宽度值</param>
        public void SetControlWidth(Control control, int intWidth)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Width = intWidth;
                        }));
                    }
                    else
                    {
                        control.Width = intWidth;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象Left
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="intleft">Left值</param>
        public void SetControlLeft(Control control, int intleft)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Left = intleft;
                        }));
                    }
                    else
                    {
                        control.Left = intleft;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的TOP
        /// </summary>
        /// <param name="control">要设置的对象</param>
        /// <param name="intTOP">TOP值</param>
        public void SetControlTOP(Control control, int intTOP)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Top = intTOP;
                        }));
                    }
                    else
                    {
                        control.Top = intTOP;
                    }
                }
            }
        }
        /// <summary>
        /// 使用线程操作本对象
        /// </summary>
        /// <param name="cn">操作的对象</param>
        /// <param name="bl">true为显示，false为不显示</param>
        public void SetControlVisibleandEnabled(Control cn, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            cn.Visible = bl;
                            cn.Enabled = bl;
                        }));
                    }
                    else
                    {
                        cn.Visible = bl;
                        cn.Enabled = bl;
                    }
                }
            }
        }
        /// <summary>
        /// 设置label的可见性
        /// </summary>
        /// <param name="label">label对象</param>
        /// <param name="bl">可见性</param>
        public void SetLabelVisible(Label label, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            label.Visible = bl;
                        }));
                    }
                    else
                    {
                        label.Visible = bl;
                    }
                }
            }
        }
        /// <summary>
        /// 当控件的当前位置滚动至当前位置
        /// </summary>
        /// <param name="textbox">文本框对象</param>
        public void SetTextBoxScrollToCaret(RichTextBox textbox)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            textbox.ScrollToCaret();
                        }));
                    }
                    else
                    {
                        textbox.ScrollToCaret();
                    }
                }
            }
        }
        /// <summary>
        /// 设置TextBox的文本内容
        /// </summary>
        /// <param name="textbox">TextBox对象</param>
        /// <param name="strText">文本内容</param>
        public void SetTextBoxText(TextBox textbox, string strText)
        {
          
                if (ThisForm != null)
                {
                    if (ThisForm.IsDisposed == false)
                    {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            textbox.Text = strText;
                        }));
                    }
                    else
                    {
                        textbox.Text = strText;
                    }
                }
            }
        }
        /// <summary>
        /// 设置资源的释放
        /// </summary>
        /// <param name="control">要释放的对象</param>
        public void SetControlDispose(Control control)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Dispose();
                        }));
                    }
                    else
                    {
                        control.Dispose();
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的文本
        /// </summary>
        /// <param name="control">需要设置的对象</param>
        /// <param name="strText">要设置的文本</param>
        public void SetControlText(Control control, string strText)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Text = strText;
                        }));
                    }
                    else
                    {
                        control.Text = strText;
                    }
                }
            }
        }
        /// <summary>
        /// 给多行文本框添加一行数据
        /// </summary>
        /// <param name="control"></param>
        /// <param name="strText"></param>
        public void SetRichTextBoxADD(RichTextBox control, string strText)
        {
           
                if (ThisForm != null)
                {
                    if (ThisForm.IsDisposed == false)
                    {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.AppendText(strText);
                        }));
                    }
                    else
                    {
                        control.AppendText(strText);
                    }
                }
            }
        }
        /// <summary>
        /// 设置TextBox的可用性
        /// </summary>
        /// <param name="textbox">TextBox对象</param>
        /// <param name="bl">结果</param>
        public void SetTextBoxEnabled(TextBox textbox, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            textbox.Enabled = bl;
                        }));
                    }
                    else
                    {
                        textbox.Enabled = bl;
                    }
                }
            }
        }
       
       
        /// <summary>
        /// 设置面板的可见性
        /// </summary>
        /// <param name="panel">面板对象</param>
        /// <param name="bl">状态</param>
        public void SetPanelVisible(Panel panel, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            panel.Visible = bl;
                        }));
                    }
                    else
                    {
                        panel.Visible = bl;
                    }
                }
            }
        }
        /// <summary>
        /// 设置按钮的可见性
        /// </summary>
        /// <param name="btn">按钮对象</param>
        /// <param name="bl">状态</param>
        public void SetButtonVisible(Button btn, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            btn.Visible = bl;
                        }));
                    }
                    else
                    {
                        btn.Visible = bl;
                    }
                }
            }
        }
        /// <summary>
        /// 设置对象的可用性
        /// </summary>
        /// <param name="control"></param>
        /// <param name="bl"></param>
        public void SetControlEnabled(Control control, bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            control.Enabled = bl;
                        }));
                    }
                    else
                    {
                        control.Enabled = bl;
                    }
                }
            }
        }
        /// <summary>
        /// 设置按钮的可用性
        /// </summary>
        /// <param name="btn">按钮对象</param>
        /// <param name="bl">状态</param>
        public void SetButtonEnabled(Button btn,bool bl)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            btn.Enabled = bl;
                        }));
                    }
                    else
                    {
                        btn.Enabled = bl;
                    }
                }
            }
        }
       /// <summary>
       /// 设置按扭的背景图像
       /// </summary>
       /// <param name="btn">按钮对象</param>
       /// <param name="strImages">图像名称：在根目录Images文件夹下的图片名称，需要带扩展名</param>
        public  void SetButtonImage(Button btn, string strImages)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            btn.Image = System.Drawing.Image.FromFile(strBaseDirectory + @"Images\" + strImages);
                        }));
                    }
                    else
                    {
                        btn.Image = System.Drawing.Image.FromFile(strBaseDirectory + @"Images\" + strImages);
                    }
                }
            }
        }
        public void SetPictureBoxImage(PictureBox picturBox, string strImages)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            picturBox.Image = System.Drawing.Image.FromFile(strBaseDirectory + @"Images\" + strImages);
                        }));
                    }
                    else
                    {
                        picturBox.Image = System.Drawing.Image.FromFile(strBaseDirectory + @"Images\" + strImages);
                    }
                }
            }
        }
        /// <summary>
        /// 设置窗体的边框样式
        /// </summary>
        /// <param name="form">窗体对象</param>
        /// <param name="formBorderStyle">边框样式对象</param>
        public void SetFormBorderStyle(Form form, System.Windows.Forms.FormBorderStyle formBorderStyle)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            form.FormBorderStyle = formBorderStyle;
                        }));
                    }
                    else
                    {
                        form.FormBorderStyle = formBorderStyle;
                    }
                }
            }
        }
        /// <summary>
        /// 关闭窗体
        /// </summary>
        /// <param name="form">要关闭的窗体对象</param>
        public void SetFormClose(Form form)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            form.Close();
                            form.Dispose();
                        }));
                    }
                    else
                    {
                        form.Close();
                        form.Dispose();
                    }
                }
            }
        }
        /// <summary>
        /// 设置窗体的父窗体对象
        /// </summary>
        /// <param name="form">加载的窗体</param>
        /// <param name="thisform">父窗体对象</param>
        public void SetFormMdiParent(Form form, Form  thisform)
        {
            if (ThisForm != null)
            {
                if (ThisForm.IsDisposed == false)
                {
                    if (ThisForm.InvokeRequired)
                    {
                        ThisForm.Invoke(new Action(() =>
                        {
                            form.MdiParent = thisform;
                        }));
                    }
                    else
                    {
                        form.MdiParent = thisform;
                    }
                }
            }
        }
        #region 按钮背景色方法
        /// <summary>
        /// 设置窗体的铵钮名称
        /// </summary>
        /// <param name="strShowBtnName"></param>
        public void SetShowBtnName(string strShowBtnName)
        {
            ShowBtnName = strShowBtnName;
        }
        /// <summary>
        /// 给点击的Button给背景
        /// </summary>
        /// <param name="btn">铵钮对象</param>MdiParent
        /// <param name="blShow"></param>
        public void SetGpsArddess(Button btn, bool blShow)
        {
            if (ThisForm != null)
            {
                if (ThisForm.InvokeRequired)
                {
                    ThisForm.Invoke(new Action(() =>
                    {
                        if (blShow)
                        {
                            setBtnBorder(btn, "1");
                        }
                        else
                        {
                            setBtnBorder(btn, "0");
                        }

                    }));
                }
                else
                {
                    if (blShow)
                    {
                        setBtnBorder(btn, "1");
                    }
                    else
                    {
                        setBtnBorder(btn, "0");
                    }
                }
            }
        }
        /// <summary>
        /// 设置按钮的背景颜色
        /// </summary>
        /// <param name="btn">按钮对象</param>
        /// <param name="sType">名称</param>
        public void setBtnBorder(Button btn, string sType)
        {
            if (ThisForm != null)
            {
                if (btn.Name != ShowBtnName)
                {
                    if (sType == "0")
                    {
                        if (btn.Tag.ToString() != "1")
                        {
                            btn.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
                            btn.FlatAppearance.BorderSize = 0;
                        }
                        else
                        {
                            btn.BackColor = System.Drawing.Color.LightGray;
                            btn.FlatAppearance.BorderSize = 1;
                        }
                    }
                    else
                    {
                        btn.BackColor = System.Drawing.Color.LightGray;
                        btn.FlatAppearance.BorderSize = 1;
                    }
                }
            }
        }
        #endregion 结束按钮背景色方法

        #endregion 结束线程委托设置

        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            for (int i = 0; i < listThread.Count; i++)
            {
                listThread[i].Threading.Abort();
                listThread[i].Threading.DisableComObjectEagerCleanup();
                listThread.Remove(listThread[i]);
            }
            //throw new NotImplementedException();
        }
    }
}
