螺丝自动锁付	功能:图像定位，偏移检测传给机械手，PLC，完全自动螺丝锁付，保存多机种配方和生产数据	
VideoPluginServer	功能:MQ,TP,UDP等方式监听消息，根椐指令控制硬件的状态
EBOOK无线功能测试	 功能:电木制作的针板治具，工控主机，频普分析仪, 示波器,USB接口的GPIB卡等
FF试作用ICX-0412主板功能测	功能:针板加排线夹治具，电压表，音频分析仪，示波器,PCI IO板卡，GPIB 488.2等
反制系统接入服务	功能:定时接收探测信号，解码16进制数据通过HTTP API接口发送到服务器保存

螺丝自动锁付	编程语言：C# opencv，nuget开源库等
VideoPluginServer	编程语言：C# winform tcp/udp MQ,HTTP等
EBOOK无线功能测试	编程语言：Visual basic
FF试作用ICX-0412主板功能测	编程语言：Visual basic
反制系统接入服务	编程语言：C# winform tcp/udp ,HTTP等

螺丝自动锁付	年份：2021
VideoPluginServer	年份：2019
EBOOK无线功能测试	年份：2012
FF试作用ICX-0412主板功能测	年份：2011
反制系统接入服务	年份：2020



部分代码：	
       /// <summary>
        /// 解析无线电侦测上报的数据
        /// </summary>
        /// <param name="data1">数据缓存</param>
        /// <param name="len">数据有效长度</param>
        /// <param name="equipment">设备编号</param>
        public static bool ParseData(byte[] data1, int length, int equipment)
        {
            if (data1[0] != 0xFB || data1[length - 1] != 0xFE)
                return false;
            //逆转义数据体
            int len = 0;
            byte[] data = Commands.DisTranslate(data1, length, out len);
            //检查校验码
            if (Commands.SumCheck(data, len) != data[len - 3] || Commands.XorCheck(data, len) != data[len - 2])
            {
                Debug.WriteLine("ParseData410 sumCheck or xorCheck fail!");
                return false;
            }
            //检查协议类型是否正确
            ushort protocol = (ushort)(data[1] | data[2] << 8);
            if (PROTOCOL_410 != protocol)//0x8001
            {
                Debug.WriteLine("ParseData410 protocol check fail!");
                return false;
            }
            int command = data[3] | data[4] << 8;
            if (0x0000 == command)//设备状态
            {
                //解析数据
                double lon = BitConverter.ToDouble(data, 5);
                double lat = BitConverter.ToDouble(data, 13);
                double hgt = BitConverter.ToDouble(data, 21);
                byte relation = data[30];

                EquipmentData eqs = Globals.EquipmentSet.GetEquipment(equipment);
                if (eqs != null)
                {
                    eqs.LastTime = DateTime.Now;
                    eqs.Longitude = lon;
                    eqs.Latitude = lat;
                    eqs.Altitude = hgt;
                    eqs.IsRemote = (relation == 1);
                    Globals.EquipmentSet.SetEquipment(equipment, eqs);
                }
            }
            else if (0x0010 == command)//无线电目标
            {
                //解析数据
                double equipLat = BitConverter.ToDouble(data, 5);  
