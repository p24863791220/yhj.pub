using System;
using System.Runtime.InteropServices;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Collections.Concurrent;
//using System.Drawing;
//using System.Windows.Media.Imaging;

namespace Ishp_PluginServer.Common.FaceApi
{
    class FaceInit
    {
        // SDK回调
        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        delegate void FaceCallback(IntPtr bytes, int size, String res);
        // sdk初始化
        [DllImport("BaiduFaceApi.dll", EntryPoint = "sdk_init", CharSet = CharSet.Ansi
             , CallingConvention = CallingConvention.Cdecl)]
        private static extern int sdk_init(bool id_card);
        // 是否授权
        [DllImport("BaiduFaceApi.dll", EntryPoint = "is_auth", CharSet = CharSet.Ansi
                , CallingConvention = CallingConvention.Cdecl)]
        private static extern bool is_auth();
        // 获取设备指纹
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_device_id", CharSet = CharSet.Ansi
                 , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_device_id();
        // sdk销毁
        [DllImport("BaiduFaceApi.dll", EntryPoint = "sdk_destroy", CharSet = CharSet.Ansi
             , CallingConvention = CallingConvention.Cdecl)]
        private static extern void sdk_destroy();

        /// <summary>
        /// 初始化SDK
        /// </summary>
        /// <param name="id_card"></param>
        /// <returns></returns>
        public static int initSDK(bool id_card)
        {
            return sdk_init(id_card);
        }

        /// <summary>
        /// 获取授权状态
        /// </summary>
        /// <returns>true:授权成功  false:授权失败</returns>
        public static bool getIsAuth()
        {
            Log.Info("初始化人脸识别SDK...");
            bool ret = is_auth();
            Log.Info(string.Format("人脸识别SDK初始化结果=[{0}]", ret));
            return ret;
            
        }


        /// <summary>
        /// 获取设备指纹device_id
        /// </summary>
        public static void getDeviceID()
        {
            IntPtr ptr = get_device_id();
            string buf = Marshal.PtrToStringAnsi(ptr);
            Log.Info(string.Format("当前设备指纹为[{0}]", buf));
        }


    }
}
