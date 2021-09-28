using System;
using System.Net;
using System.Collections;
using System.Linq;

namespace QueueScreen.Common
{
    class UDPMsgHelper
    {
        /// <summary>
        /// 发送UDP更新包到排队显示器
        /// </summary>
        /// <returns></returns>
        public static void SendUDP(int queuingReceptionID)
        {
            Update_QueuingDisplay(queuingReceptionID);
            Update_FrontClient(queuingReceptionID);
        }
        /// <summary>
        /// 大厅排队显示屏 update_queuingdisplay
        /// </summary>
        /// <param name="QueuingReceptionID"></param>
        public static void Update_QueuingDisplay(int QueuingReceptionID)
        {
            try
            {
                Hashtable par = new Hashtable();
                par.Add("QueuingReceptionID", QueuingReceptionID);
                par.Add("From", (int)IIMPBusinessCommon.BusinessConst.SelfMeetingTerEnum.自助办理终端);

                string sendmsg = Common.Pages.tmpUdpengine.FormatPar("update_queuingdisplay", par);
                foreach (IPEndPoint item in new IIMP.BLL.SelfMeeting_TS_NetConfigBLL().GetIPEndPoint((int)IIMPBusinessCommon.BusinessConst.SelfMeetingTerEnum.大厅排队显示屏))
                {
                    //Common.Pages.tmpUdpengine.SendMsgToPoint(sendmsg, item.Address + "", item.Port);
                    Common.Pages.tmpUdpengine.pushUdpMsgToIP(sendmsg, item.Address + "", item.Port);
                }
            }
            catch (Exception ex)
            {
                GT.Common.Log.SystemLog.WriteErrorLog("通知信息 UDP:" + ex);
            }
        }
        /// <summary>
        /// 前台业务办理 update_frontclient
        /// </summary>
        /// <param name="queuingReceptionID"></param> 
        public static void Update_FrontClient(int queuingReceptionID)
        {
            try
            {
                Hashtable par = new Hashtable();
                par.Add("QueuingReceptionID", queuingReceptionID);
                par.Add("From", (int)IIMPBusinessCommon.BusinessConst.SelfMeetingTerEnum.自助办理终端);
                string sendmsg = Common.Pages.tmpUdpengine.FormatPar("update_frontclient", par);
                foreach (IPEndPoint item in new IIMP.BLL.SelfMeeting_TS_NetConfigBLL().GetIPEndPoint((int)IIMPBusinessCommon.BusinessConst.SelfMeetingTerEnum.前台登记主机))
                {
                    //Common.Pages.tmpUdpengine.SendMsgToPoint(sendmsg, item.Address + "", item.Port);
                    Common.Pages.tmpUdpengine.pushUdpMsgToIP(sendmsg, item.Address + "", item.Port);
                }
            }
            catch (Exception ex)
            {
                GT.Common.Log.SystemLog.WriteErrorLog("通知信息 UDP:" + ex);
            }
        }

        /// <summary>
        /// 发送提押信息到交互终端
        /// </summary>
        /// <param name="rybh">人员编号</param>
        /// <param name="handlersTypeName">会见类型名称</param>
        /// <param name="roomName">会见室名称</param>
        public static void SendMsgToPoint(string rybh, string handlersTypeName, string roomName)
        {
            ////通知交互终端
            ////发送UDP
            ////给监室终端发送提审会见信息
            handlersTypeName = "所内提讯会见";
            roomName = "请提前做好准备！";
            var ryModel = Common.Model.BLLHelper.ryBLL.GetModelList(string.Format("rybh='{0}'", rybh)).FirstOrDefault();
            IIMP.Model.T_Common_Device deviceModel = Common.Model.BLLHelper.deviceBll.GetModelList(string.Format("DeviceTypeCode=1003 And RoomNo='{0}'", ryModel.jsh)).FirstOrDefault();
            string msg = "{\"action\":\"infoNotice\",\"data\":{\"content\":\"" + ryModel.xm + "," + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + ","
                    + handlersTypeName + "," + roomName + "\"}}";
            try
            {
                Common.Pages.tmpUdpengine.pushUdpMsgToIP(msg, deviceModel.IP, deviceModel.Port == null || string.IsNullOrEmpty(deviceModel.Port.ToString()) ? 7000 : int.Parse(deviceModel.Port.ToString()));
            }            catch (Exception ex)

            {
                GT.Common.Log.SystemLog.WriteErrorLog("给终端发送提讯信息:" + ex);
            }
        }
    }
}
