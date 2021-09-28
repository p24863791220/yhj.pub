using System;
using System.Runtime.InteropServices;
using Ishp_PluginServer.Common;

namespace Ishp_PluginServer.Common.FaceApi
{
    // 人脸设置(通过修改setting类里的对应参数，来达到调整人脸检测策略的目的)
    // 算法检测顺序是 人脸完整度->光照强度->遮挡->模糊程度  如果前边的参数，
    // 人脸图片不符合要求 后边参数对人脸不做判断
    class FaceSetting
    {
        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_is_check_quality", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_is_check_quality(bool flag = false);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_illum_thr", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_illum_thr(float thr = 40);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_blur_thr", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_blur_thr(float thr = 0.7f);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_occlu_thr", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_occlu_thr(float thr);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_eulur_angle_thr", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_eulur_angle_thr(int pitch_thr = 15, int yaw_thr = 15, int roll_thr = 15);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_not_face_thr", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_not_face_thr(float thr = 0.5f);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_min_face_size", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_min_face_size(int size = 30);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_track_by_detection_interval", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_track_by_detection_interval(int interval_in_ms = 300);

        [DllImport("BaiduFaceApi.dll", EntryPoint = "set_detect_in_video_interval", CharSet = CharSet.Ansi
          , CallingConvention = CallingConvention.Cdecl)]
        private static extern void set_detect_in_video_interval(int interval_in_ms = 300);


        public AppConfig appcfg=AppConfig.GetInstance();  // 配置文件


        // 设置是否执行质量检测，默认为false
        public void setCheckQuality()
        {
            bool flag;
            try
            {
                flag = appcfg.FaceSetting.check_quality;
            }
            catch
            {
                flag = false;
            }
            set_is_check_quality(flag);
        }

        // 设置光照阈值，取值范围0~255，默认40，越大代表脸部越亮
        public void setIllum_Thr()
        {
            float thr;
            try
            {
                thr = appcfg.FaceSetting.illum_thr;
            }
            catch
            {
                thr = 40;
            }
            set_illum_thr(thr);
        }

        // 模糊阈值，取值范围0~1，默认0.7，越小代表图像越清晰
        // 当设置为0时，模糊检测不进行且结果不通过；当设置为1时，模糊检测不进行且结果通过
        public void setBlur_Thr()
        {
            float thr;
            try
            {
                thr = appcfg.FaceSetting.blur_thr;
            }
            catch
            {
                thr = 0.7f;
            }
            set_blur_thr(thr);
        }

        // 右眼、左眼、鼻子、嘴巴、左脸颊、右脸颊、下巴的遮挡阈值，取值范围0~1，默认0.5，值越小代表遮挡程序越小
        // 当设置为1时，遮挡检测不进行且结果不通过；当设置为0时，遮挡检测不进行且结果通过
        public void setOcclu_Thr()
        {
            float thr;
            try
            {
                thr = appcfg.FaceSetting.occlu_thr;
            }
            catch
            {
                thr = 0.5f;
            }
            set_occlu_thr(thr);
        }

        // 设置欧拉角 pitch、yaw、roll等角度的阈值，默认都为15&deg;，越大代表可采集的人脸角度越大，但是角度越大识别效果会越差
        public void setEulurAngle_Thr()
        {
            int pitch_thr = 15;
            int yaw_thr = 15;
            int roll_thr = 15;
            try
            {
                pitch_thr = appcfg.FaceSetting.eulur_angle_pitch_thr;
                yaw_thr = appcfg.FaceSetting.eulur_angle_yaw_thr;
                roll_thr = appcfg.FaceSetting.eulur_angle_roll_thr;
            }
            catch
            {
            }
            set_eulur_angle_thr(pitch_thr, yaw_thr, roll_thr);
        }

        // 非人脸的置信度阈值，取值范围0~1，取0则认为所有检测出来的结果都是人脸，默认0.5
        public void setNotFace_Thr()
        {
            float thr;
            try
            {
                thr = appcfg.FaceSetting.not_face_thr;
            }
            catch
            {
                thr = 0.5f;
            }
            set_not_face_thr(thr);
        }

        // 最小人脸尺寸：需要检测到的最小人脸尺寸，比如需要检测到30*30的人脸则设置为30，
        // 该尺寸占图像比例越小则检测速度越慢，具体请参考性能指标章节。默认值100
        public void setMinFaceSize()
        {
            int size;
            try
            {
                size = appcfg.FaceSetting.min_face_size;
            }
            catch
            {
                size = 100;
            }
            set_min_face_size(size);
        }

        // 跟踪到目标后执行检测的时间间隔，单位毫秒，默认300，值越小越会更快发现新目标，
        // 但是cpu占用率会提高、处理速度变慢
        public void setTrackByDetectionInterval()
        {
            int interval_in_ms;
            try
            {
                interval_in_ms = appcfg.FaceSetting.track_by_detection_interval;
            }
            catch
            {
                interval_in_ms = 300;
            }
            set_track_by_detection_interval(interval_in_ms);
        }

        // 未跟踪到目标时的检测间隔，单位毫秒，默认300，值越小越快发现新目标，
        // 但是cpu占用率会提高、处理速度变慢
        public void setDetectInVideoInterval()
        {
            int interval_in_ms;
            try
            {
                interval_in_ms = appcfg.FaceSetting.detect_in_video_interval;
            }
            catch
            {
                interval_in_ms = 300;
            }
            set_detect_in_video_interval(interval_in_ms);
        }

        /// <summary>
        ///  人脸识别参数设置
        /// </summary>
        public void setFaceSetting()
        {
            this.appcfg = AppConfig.GetInstance();
            // 是否执行质量检测
            setCheckQuality();
            // 设置光照阈值
            setIllum_Thr();
            // 设置模糊阈值
            setBlur_Thr();
            // 设置遮挡阈值
            setOcclu_Thr();
            // 设置pitch、yaw、roll等角度的阈值
            setEulurAngle_Thr();
            // 设置非人脸的置信度阈值
            setNotFace_Thr();
            // 设置检测的最小人脸大小
            setMinFaceSize();
            // 设置跟踪到目标后执行检测的时间间隔
            setTrackByDetectionInterval();
            // 设置未跟踪到目标时的检测间隔
            setDetectInVideoInterval();

        }

    }
}
