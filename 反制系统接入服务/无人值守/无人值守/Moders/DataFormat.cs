using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
/*帧头 1 0xFB
协议标识 2
标识不同的协议族，
此处使用 0x8001
指令 2 要执行的命令码，同时标识指令数据格式
数据 N 根据指令不同，数据内容不同（N 不大于 16K）
校验域 2
和校验字节在前，异或校验字节在后。
和校验是从协议标识到数据域所有字节求和；
异或校验是从协议标识到数据域所有字节求异或。
帧尾 1 0xFE
*/
namespace 无人值守.Moders
{
   /*设备位置 GPS；设备状态 0-故障，* 1-正常；2
    * 是否允许联动 0-禁止，1-允许；预留 32 字节。*/
//class TargetCommand //0x0000
//    {
//        double dLongitude;
//        double dLatitude;
//        double dAltitude;
//        byte bStatus;
//        byte bRemote;
//        byte[] bReserve=new byte[32];

//    }
    //class TargetInfo //0x0010 目标信息 
    //{
    //    public Double dEquipLat; //设备所处纬度 度Double dEquipLon;//设备所处经度 度
    //    public Double dEquipAlt; //设备所处海拔高度 米
    //    public int nGroup; // 目标批号
    //    public Double dAzimuth; // 目标方位角度
    //    public Double dPitch;
    //    public Double dDist;
    //    public Double dVx;//三个方向速度 m/s
    //    public Double dVy;
    //    public Double dVz;
    //    public Double dFreq; //目标中心频点 MHz
    //    public Double dBandWidth; // 目标信号带宽 MHz
    //    public Char[] szUAVType=new Char[64]; // 目标类型描（以'\0'结尾的字符串）
    //    // 发现目标时间
    //    public long lTgtTime; //毫秒级 ms
    //}
    public class  Equipment_Status
    {
        string  bFrameBeg; //帧头：0xFB
        string  wFrameType; //类型：0x8001
        string wCmdCode; //命令码：0x0000
        double dLongitude; // 设备所处位置经度
        double dLatitude; // 设备所处位置纬度
        double dAltitude; // 设备所处位置海拔高度
        byte bStatus;
        byte bRemote;
        byte[] bReserve=new byte[32];
        ////****校验码****////
        byte bSumCheck; //和校验
        byte bXorCheck; //异或校验
        string  bFrameEnd; //帧尾：0xFE
        Equipment_Status()
            {
                bFrameBeg = @"0xFB";
                wFrameType = @"0x8001";
                wCmdCode = @"0x0000";
                bFrameEnd = @"0xFE";
            }
    }
    //无线电信号目标上报
    public class  RadioTargetFrame
    {
        char  bFrameBeg; //帧头：0xFB
        char  wFrameType; //类型：0x8001
        char  wCmdCode; //命令码：0x0010
                       ////****探测设备相关****////
        double dEquipLat; // 设备所处位置纬度
        double dEquipLon; // 设备所处位置经度
        double dEquipAlt; // 设备所处位置海拔高度
                          ////****目标相关****////int nGroup; // 目标批号
        double dAzimuth; // 目标方位，单位：度（真方位角）
        double dPitch; //无效
        double dDist; //估计值 单位：米
        double dVx; //无效
        double dVy; //无效
        double dVz; //无效
        double dFreq; // 目标信号中心频点，单位：MHz
        double dBandWidth; // 目标信号带宽，单位：MHz
        char[] szUAVType=new char[64]; // 目标类型描述（以'\0'结尾的字符串）
                            // 发现目标时间
        long lTgtTime; //UTC时间，从目标发现当天零点到发现时刻的毫秒数
                       ////****校验码****////
        byte bSumCheck; //和校验
        byte bXorCheck; //异或校验
        char bFrameEnd; // 帧尾0xFE
        RadioTargetFrame()
        {
            bFrameBeg = (char)0xFB;
            wFrameType = (char)0x8001;
            wCmdCode = (char)0x0010;
            bFrameEnd = (char)0xFE;
        }
    }
    /// <summary>
    /// //返回数据
    //名称 类型  是否必须 默认值 备注 其他信息
    //code integer 必须 结果代码 0:失败 1:成功 10:用户token失效 11:系统token失效
    //mock: 1

    //errorcode integer 必须 结果代码 0:无异常  100001:当前记录已存在
    //mock: 0

    //msg string 必须      提示信息
    //mock: 新增发现目标记录成功

    //errormsg    string 必须      详细错误信息
    //mock: 空的字符串

    //data    object 必须      注：（新增时返回主键，更新不反回）	
    //├─ id string 必须      返回主键id
    //mock: 500000111202010101111
    /// </summary>
    public class  findtarget //发现目标
    {
        public string unitid = "string unitid 单位编码";// mock: 500106111
        public string sid = "string sid 所报警记录id";//（所报警记录主键id）  mock: 500106111202010101111
        //public string yxzt = "string yxzt 运行状态";// 必须 运行状态（0：离线  1：在线）	        mock: 1
        public string sbjd = "string sbjd 必须"; //     设备所在经度         mock: 120001
        public string sbwd = "string sbwd 必须";  //   设备所在纬度          mock: 120002
        public string hbgd = "number hbgd 海拔高度（米）";//必须 	                mock: 20.0
        public string mbfw = "number mbfw 必须";// 目标方位（单位：度[真方位角] ） mock: 40.0
        public string mbjl = "number mbjl 目标距离";//   必须 目标距离（估计值 单位：米）	  mock: 30.0
        public string userid = "string userid 用户id";//     用户id           mock: ishp
    }
    
    public class RunState//运行状态
    {
        public string unitid = "sting unitid string 单位编码"; //必须      单位编码        mock: 500106111
        public string sid = "string sid 所无人机基站标识id";// 必须      所无人机基站标识ide        mock: 500106111202010101111
        public string yxzt = "string yxzt 运行状态";// 必须 运行状态（0：离线  1：在线）	        mock: 1
        public string sbjd = "string sbjd 设备所在经度";////必须      设备所在经度        mock: 120001
        public string sbwd = "string sbwd 设备所在纬度"; //必须      设备所在纬度        mock: 120002
        public string hbgd = "number hbgd 海拔高度";//  必须 海拔高度（米）        mock: 20.0
        public string userid ="string userid 用户id";// 必须      用户id       mock: ishp
    }
    /// <summary>
    /// 返回数据运行状态
    ///名称 类型  是否必须 默认值 备注 其他信息
    ////code integer 必须 结果代码 0:失败 1:成功 10:用户token失效 11:系统token失效
    ///mock: 1

    //errorcode integer 必须 结果代码 0:无异常  100001:当前记录已存在
    //mock: 0

    //msg string 必须      提示信息
    //mock: 新增运行状态记录成功

    //errormsg    string 必须      详细错误信息
    //mock: 空的字符串

    //data    object 必须
    //├─ id string 必须      返回主键id
    //mock: 500000111202010101111
    /// <summary>
}
