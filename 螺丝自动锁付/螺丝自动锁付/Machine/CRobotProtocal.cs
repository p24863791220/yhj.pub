using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SmtTest
{
    class CRobotProtocal
    {
        TcpDemo tcpd  = new TcpDemo();
        /// <summary>
        /// 运动到指定点位，回复0000-操作成功
        /// </summary>
        /// <param name="pointID"></param>
        public static void MoveToPointID(int pointID)
        {
           //tcpd.ServerSendMsg1(pointID);
            
        }
    }
}
