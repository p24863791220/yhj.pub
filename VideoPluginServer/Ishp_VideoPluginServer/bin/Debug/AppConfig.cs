using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace XSPDFR.Common
{
    public class AppConfig
    {
        public string AppName { get; set; }
        public string CompanyName { get; set; }
        public string AuthCode { get; set; }

        public List<PassageWay> PassageWays = new List<PassageWay>();

        public FaceSDKSetting FaceSetting { get; set; }



        public class PassageWay
        {
            public window window { get; set; }
            public cap cap { get; set; }
        }

        public class window
        {
            public string title { get; set; }
            public int left { get; set; }
            public int top { get; set; }
            public int width { get; set; }
            public int height { get; set; }
            public bool showAppLogo { get; set; }
            public bool showAppName { get; set; }
            public bool showCompanyName { get; set; }

        }

        public class cap
        {
            public int left { get; set; }
            public int top { get; set; }
            public int width { get; set; }
            public int height { get; set; }

            public int type { get; set; }
            public int usbidx { get; set; }
            public string url { get; set; }

        }

        public class FaceSDKSetting
        {
            public int    max_face_len { get; set; }
            public bool   check_quality { get; set; }
            public float  illum_thr { get; set; }
            public float  blur_thr { get; set; }
            public float  occlu_thr { get; set; }
            public int    eulur_angle_pitch_thr { get; set; }
            public int    eulur_angle_yaw_thr { get; set; }
            public int    eulur_angle_roll_thr { get; set; }
            public float  not_face_thr { get; set; }
            public int    min_face_size { get; set; }
            public int    track_by_detection_interval { get; set; }
            public int    detect_in_video_interval { get; set; }

        }
    }
}
