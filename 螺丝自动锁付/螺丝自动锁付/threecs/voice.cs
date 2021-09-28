using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;

namespace 螺丝自动锁付
{
    public static class SystemMultimediaController
    {
        /*
         * 弹出系统音量控制器
         * */
        public static void PopupController()
        {
            ProcessStartInfo Info = new ProcessStartInfo();
            Info.FileName = "Sndvol32";
            Process.Start(Info);
        }

        /*
         * 获得音量范围和获取/设置当前音量
        * */
        public static int MaxValue
        {
            get { return int.Parse(iMaxValue.ToString()); }
        }
        public static int MinValue
        {
            get { return int.Parse(iMinValue.ToString()); }
        }
        public static int CurrentValue
        {
            get
            {
                GetVolume();
                return iCurrentValue;
            }
            set
            {
                SetValue(MaxValue, MinValue, value);
            }
        }


        #region Private Static Data Members
        private const UInt32 iMaxValue = 0xFFFF;
        private const UInt32 iMinValue = 0x0000;
        private static int iCurrentValue = 0;
        #endregion
        #region Private Static Method
        /*
          * 得到当前音量
           **/
        public static void GetVolume()
        {
            UInt32 d, v;
            d = 0;
            long i = waveOutGetVolume(d, out v);
            UInt32 vleft = v & 0xFFFF;
            UInt32 vright = (v & 0xFFFF0000) >> 16;
            UInt32 all = vleft | vright;
            UInt32 value = (all * UInt32.Parse((MaxValue - MinValue).ToString()) / ((UInt32)iMaxValue));
            iCurrentValue = int.Parse(value.ToString());
        }

        /*
          * 修改音量值
         * */
        public static void SetValue(int aMaxValue, int aMinValue, int aValue)
        {
            //先把trackbar的value值映射到0x0000～0xFFFF范围  
            UInt32 Value = (UInt32)((double)0xffff * (double)aValue / (double)(aMaxValue - aMinValue));
            //限制value的取值范围  
            if (Value < 0) Value = 0;
            if (Value > 0xffff) Value = 0xffff;
            UInt32 left = (UInt32)Value;//左声道音量  
            UInt32 right = (UInt32)Value;//右  
            waveOutSetVolume(0, left << 16 | right); //"<<"左移，“|”逻辑或运算  
        }
        #endregion
        /*
         * 在winmm.dll中   
          *第一个参数可以为0，表示首选设备   
          *第二个参数为音量:0xFFFF为最大，0x0000为最小，
         *其中高位（前两位）表示右声道音量，低位（后两位）表示左 声道音量 。
        */
        #region Windows Media API
        [DllImport("winmm.dll")]
        private static extern long waveOutSetVolume(UInt32 deviceID, UInt32 Volume);
        [DllImport("winmm.dll")]
        private static extern long waveOutGetVolume(UInt32 deviceID, out UInt32 Volume);
        #endregion
    }
    class voice
    {
        /// <summary>
        /// 开始启动
        /// </summary>
        /// <param name="VoiceText"></param>
        public static void StartVoice(string VoiceText)
        {
            /*启用新的线程播放语音提示*/
            try
            {
                Thread thread_Voice = new Thread(new ParameterizedThreadStart(GT.Common.Speech.TTSHelper.SpeeckVoice));

                char[] vt = VoiceText.ToCharArray();
                VoiceText = "";
                for (int i = 0; i < vt.Length; i++)
                {
                    int n = -1;
                    if (int.TryParse(vt[i].ToString(), out n))
                    {
                        VoiceText += GetChinese(int.Parse(vt[i] + ""));
                    }
                    else
                    {
                        VoiceText += vt[i];
                    }
                }
                if (!string.IsNullOrEmpty(VoiceText))
                {
                    thread_Voice.Start(VoiceText);
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
            }
        }
        /// <summary>
        /// 开始启动：添加循环播放次数设置
        /// </summary>
        /// <param name="VoiceText"></param>
        public static void StartVoice2(string VoiceText, int loopTime = 1)
        {
            /*启用新的线程播放语音提示*/
            try
            {
                Thread thread_Voice = new Thread(new ParameterizedThreadStart(GT.Common.Speech.TTSHelper.SpeeckVoice));

                char[] vt = VoiceText.ToCharArray();
                VoiceText = "";
                for (int i = 0; i < vt.Length; i++)
                {
                    int n = -1;
                    if (int.TryParse(vt[i].ToString(), out n))
                    {
                        VoiceText += vt[i]; //GetChinese(int.Parse(vt[i] + ""));
                    }
                    else
                    {
                        VoiceText += vt[i];
                    }
                }
                if (!string.IsNullOrEmpty(VoiceText))
                {
                    for (int j = 0; j < loopTime; j++)
                    {
                        thread_Voice.Start(VoiceText);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
            }
        }
        /// <summary>
        /// 开始启动
        /// </summary>
        /// <param name="VoiceText"></param>
        public  static void StartVoice3(string VoiceText, int loopTime = 1, double volume = 100, double rate = 0)
        {
            /*启用新的线程播放语音提示*/
            try
            {
                //int maxdis = VoiceText.Length * AutoCheck.listRectangle [0].distime;
                //if (AutoCheck.voicedistime != 10000)
                //{
                //    if (AutoCheck.voicedistime < maxdis )//加大间隔
                //    {
                //        AutoCheck.voicedistime += 1;
                //        return;
                //    }
                //}
                //AutoCheck.voicedistime = 0;
                Thread thread_Voice = new Thread(new ParameterizedThreadStart(GT.Common.Speech.TTSHelper.SpeeckVoice2));
                string[] parameter = new string[3];
                parameter[0] = VoiceText;
                parameter[1] = volume.ToString();
                parameter[2] = rate.ToString();

                char[] vt = VoiceText.ToCharArray();
                VoiceText = "";
                for (int i = 0; i < vt.Length; i++)
                {
                    int n = -1;
                    if (int.TryParse(vt[i].ToString(), out n))
                    {
                        VoiceText += GetChinese(int.Parse(vt[i] + ""));
                    }
                    else
                    {
                        VoiceText += vt[i];
                    }
                }
                if (!string.IsNullOrEmpty(VoiceText))
                {
                    for (int j = 0; j < loopTime; j++)
                    {
                        thread_Voice.Start(parameter);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
            }
        }
        public static string GetChinese(int number)
        {
            char[] cs = number.ToString().ToCharArray();
            string s = "";
            for (int i = 0; i < cs.Length; i++)
            {
                int c = int.Parse(cs[i] + "");
                switch (c)
                {
                    case 0:
                        s = s + "零";
                        break;
                    case 1:
                        s = s + "腰";
                        break;
                    case 2:
                        s = s + "二";
                        break;
                    case 3:
                        s = s + "三";
                        break;
                    case 4:
                        s = s + "四";
                        break;
                    case 5:
                        s = s + "五";
                        break;
                    case 6:
                        s = s + "六";
                        break;
                    case 7:
                        s = s + "七";
                        break;
                    case 8:
                        s = s + "八";
                        break;
                    case 9:
                        s = s + "九";
                        break;
                    default:
                        break;
                }
            }
            return s;
        }
    }
}

