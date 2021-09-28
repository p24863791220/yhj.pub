using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ishp_PluginServer.Common
{
    class LockDX
    {
        private static LockDX uniqueInstance;
        //定义一个标识确保线程同步 （保持人脸API单进程调用）
        public readonly object lockerFaceAPI = new object();
        private static readonly object locker = new object();

        public static LockDX GetInstance()
        {
            // 注意：这里不负责创建实例,只返回当前实例对象或Null
            if (uniqueInstance == null)
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回Null
                    if (uniqueInstance == null)
                    {
                        uniqueInstance = new LockDX();
                    }
                }
            }
            return uniqueInstance;
        }
    }
}
