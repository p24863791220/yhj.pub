using System;
using System.Windows.Forms;

namespace SignalCommunication
{
    /// <summary>
    /// 加载GIF动画
    /// </summary>
    public class LoadingHelper : IDisposable
    {
      
        private  MyOpaqueLayer m_OpaqueLayer = null;//半透明蒙板层 
       
        /// <summary>
        /// 创建本控件的窗体
        /// </summary>
        private Form CreatthisForm;

         public LoadingHelper(Form form)
         {
             CreatthisForm = form;
         }
        /// <summary>
        /// 显示遮罩层
        /// </summary>
        /// <param name="control">控件</param>
        /// <param name="alpha">透明度</param>
        /// <param name="isShowLoadingImage">是否显示图标</param>
        public  void ShowOpaqueLayer(Control control, int alpha, bool isShowLoadingImage)
        {
            try
            {
                if (this.m_OpaqueLayer == null)
                {
                    this.m_OpaqueLayer = new MyOpaqueLayer(alpha, isShowLoadingImage);
                    control.Controls.Add(this.m_OpaqueLayer);
                    this.m_OpaqueLayer.Dock = DockStyle.Fill;
                    this.m_OpaqueLayer.BringToFront();
                }
                SetControlVisibleandEnabled(this.m_OpaqueLayer,true);
              
            }
            catch (Exception ex)
            {
                UnhandledExceptionEventArgs unhan = new UnhandledExceptionEventArgs(ex, false);
              ErrorHelper.CurrentDomain_UnhandledException(this, unhan);
            }
        }

        /// <summary>
        /// 隐藏遮罩层
        /// </summary>
        public void HideOpaqueLayer()
        {
            try
            {
              
                if (this.m_OpaqueLayer != null)
                {
                    SetControlVisibleandEnabled(this.m_OpaqueLayer, false);
                }
            }
            catch (Exception ex)
            {
                UnhandledExceptionEventArgs unhan = new UnhandledExceptionEventArgs(ex, false);
                ErrorHelper.CurrentDomain_UnhandledException(this, unhan);
            }
        }
      
        /// <summary>
        /// 使用线程操作本对象
        /// </summary>
        /// <param name="cn">操作的对象</param>
        /// <param name="bl">true为显示，false为不显示</param>
        private void SetControlVisibleandEnabled(Control cn, bool bl)
        {
            if (CreatthisForm.InvokeRequired)
            {
                CreatthisForm.Invoke(new Action(() =>
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

        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            
            //throw new NotImplementedException();
        }
    }
}
