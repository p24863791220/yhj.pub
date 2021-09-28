using System;
using System.Threading;

namespace SignalCommunication
{
    /// <summary>
    /// 线程对象实体
    /// </summary>
   internal class ThreadInfo
    {
       /// <summary>
       /// 线程的名称即GUID
       /// </summary>
       internal string ThreadName { get; set; }
       /// <summary>
       /// 线程对象
       /// </summary>
       internal Thread Threading { get; set; }
       /// <summary>
       /// 线程是否执行完成，True为执行完成，false没有执行完成,默认为没有执行完成
       /// </summary>
       internal bool ISExecOK { get; set; }

       internal ThreadInfo()
       {
           ISExecOK = false;
       }

     
    }
}
