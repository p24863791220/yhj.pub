﻿using System;
using System.Threading;

namespace SignalCommunication.TCP
{
    public delegate void DoHandler();

    /// <summary>
    /// 阻塞器
    /// </summary>
    public class Timeout:IDisposable
    {
        private ManualResetEvent mTimeoutObject;
        //标记变量  
        private bool mBoTimeout;

        public DoHandler Do;

        internal Timeout()
        {
            //  初始状态为 停止  
            this.mTimeoutObject = new ManualResetEvent(true);
        }
        ///<summary>  
        /// 指定超时时间 异步执行某个方法  
        ///</summary>  
        ///<returns>执行 是否超时</returns>  
        internal bool DoWithTimeout(TimeSpan timeSpan)
        {
            if (this.Do == null)
            {
                return false;
            }
            this.mTimeoutObject.Reset();
            this.mBoTimeout = true; //标记  
            this.Do.BeginInvoke(DoAsyncCallBack, null);
            // 等待 信号Set  
            if (!this.mTimeoutObject.WaitOne(timeSpan, false))
            {
                this.mBoTimeout = true;
            }
            return this.mBoTimeout;
        }
        ///<summary>  
        /// 异步委托 回调函数  
        ///</summary>  
        ///<param name="result"></param>  
        private void DoAsyncCallBack(IAsyncResult result)
        {
            try
            {
                this.Do.EndInvoke(result);
                // 指示方法的执行未超时  
                this.mBoTimeout = false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                this.mBoTimeout = true;
            }
            finally
            {
                this.mTimeoutObject.Set();
            }
        }

        public void Dispose()
        {
            if (mTimeoutObject != null)
            {
                mTimeoutObject.Close();
                mTimeoutObject.Dispose();
            }
            throw new NotImplementedException();
        }
    }
}