# yhj.pub
自动锁付（图像定位，偏移量传给机械手，与PLC通信，完全自动螺丝锁付，并保存多机种配方和生产数据）所用硬件（工控主机，海康工业相机，西门子PLC,众为兴机械手等）	编程语言：C# opencv，nuget开源库等
硬件后台服务（MQ,TCP,UDP等方式监听消息，根椐指令控制硬件的状态）			所用硬件（服务器）		编程语言：C# winform tcp/udp MQ,HTTP等	
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
