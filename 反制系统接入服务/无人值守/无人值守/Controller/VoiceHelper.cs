using System;
using System.Threading;
using System.Runtime.InteropServices;

namespace QueueScreen.Common
{
    /// <summary>
    /// 语音帮助类
    /// </summary>
    public class VoiceHelper
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
                GT.Common.Log.SystemLog.WriteErrorLog("Error: GTIIMPCS.Common.VoiceHelp.StartVoice ( " + ex + ")");
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
                GT.Common.Log.SystemLog.WriteErrorLog("Error: GTIIMPCS.Common.VoiceHelp.StartVoice ( " + ex + ")");
            }
            finally
            {
            }
        }
        /// <summary>
        /// 开始启动
        /// </summary>
        /// <param name="VoiceText"></param>
        public static void StartVoice3(string VoiceText, int loopTime = 1, double volume = 100, double rate = 0)
        {
            /*启用新的线程播放语音提示*/
            try
            {
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
                GT.Common.Log.SystemLog.WriteErrorLog("Error: GTIIMPCS.Common.VoiceHelp.StartVoice ( " + ex + ")");
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
