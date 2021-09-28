using System;
using System.IO;
using System.Text;

namespace SignalCommunication
{
    public static class ErrorHelper
    {
        /// <summary>
        /// UI线程处理日志
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            string str = GetExceptionMsg(e.Exception, e.ToString());
            Log(str);
        }
        /// <summary>
        /// 非UI线程处理日志
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            string str = GetExceptionMsg(e.ExceptionObject as Exception, e.ToString());
            Log(str);
        }
        /// <summary>  
        /// 生成自定义异常消息  
        /// </summary>  
        /// <param name="ex">异常对象</param>  
        /// <param name="backStr">备用异常消息：当ex为null时有效</param>  
        /// <returns>异常字符串文本</returns>  
        private static string GetExceptionMsg(Exception ex, string backStr)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("\r\n\r\n");
            sb.AppendLine("****************************" + ex.Message + "****************************");
            sb.AppendLine("【出现时间】：" + DateTime.Now.ToString());
            if (ex != null)
            {
                sb.AppendLine("【程序名称】：" + ex.Source);
                sb.AppendLine("【异常类型】：" + ex.GetType().Name);
                sb.AppendLine("【异常信息】：" + ex.Message);
                sb.AppendLine("【堆栈调用】：" + ex.StackTrace);
                sb.AppendLine("【错误函数】：" + ex.TargetSite);
            }
            else
            {
                sb.AppendLine("【未处理异常】：" + backStr);
            }
            sb.AppendLine("***************************************************************");
            return sb.ToString();
        }

        /// <summary>
        /// 写日志
        /// </summary>
        /// <param name="strTxet"></param>
        private static void Log(string strTxet)
        {
            try
            {
                lock (new object())
                {
                    string strYear = DateTime.Now.Year.ToString();
                    string strmonth = DateTime.Now.Month.ToString();
                    string strLogPath = AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth + @"\ErrorLog_" + DateTime.Now.ToString("yyyy-MM-dd") + ".log";
                    if (Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth + @"\") == false)
                    {
                        Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth);
                    }
                    FileStream fs = new FileStream(strLogPath, FileMode.Append);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine(strTxet);
                    sw.Close();
                    fs.Close();
                }
            }
            catch
            { }
        }
        /// <summary>
        /// 写日志
        /// </summary>
        /// <param name="strTxet"></param>
        public static void WriteLog(string strTxet)
        {
            try
            {
                lock (new object())
                {
                    string strYear = DateTime.Now.Year.ToString();
                    string strmonth = DateTime.Now.Month.ToString();
                    string strLogPath = AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth + @"\Log_" + DateTime.Now.ToString("yyyy-MM-dd") + ".log";
                    if (Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth + @"\") == false)
                    {
                        Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + @"\log\" + strYear + @"\" + strmonth);
                    }
                    FileStream fs = new FileStream(strLogPath, FileMode.Append);
                    StreamWriter sw = new StreamWriter(fs);
                    sw.WriteLine(strTxet);
                    sw.Close();
                    fs.Close();
                }
            }
            catch
            { }
        }
    }
}
