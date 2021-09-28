using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace IMOS_SDK_DEMO.sdk
{
        
     
    public enum IMOS_PICTURE_FORMAT_E
    {
        IMOS_PF_PAL = 0,                            /* PAL ��ʽ */
        IMOS_PF_NTSC,                               /* NTSC ��ʽ */
        IMOS_PF_720P24HZ,
        IMOS_PF_720P25HZ,
        IMOS_PF_720P30HZ,
        IMOS_PF_720P50HZ,
        IMOS_PF_720P60HZ,    
        IMOS_PF_1080I48HZ,
        IMOS_PF_1080I50HZ,     
        IMOS_PF_1080I60HZ,          
        IMOS_PF_1080P24HZ,
        IMOS_PF_1080P25HZ,
        IMOS_PF_1080P30HZ,  
        IMOS_PF_1080P50HZ,
        IMOS_PF_1080P60HZ,          
        IMOS_PF_AUTO,                               
        IMOS_PF_INVALID    
    };
    
    /* ǰ���豸���� */
    public enum IMOS_DEVICE_TYPE_E
    {
        IMOS_DT_EC1001_HF = 0,
        IMOS_DT_EC1002_HD,                          /* ���ͺ� �� EC1004_HC ���ö��ɣ���Ӧ EC1004-HC[2CH] */
        IMOS_DT_EC1004_HC,
        IMOS_DT_EC2004_HF,
        IMOS_DT_ER3304_HF,
        IMOS_DT_ER3308_HD = 5,
        IMOS_DT_ER3316_HC,
        IMOS_DT_DC1001_FF = 7,
        IMOS_DT_EC3016_HF,
        IMOS_DT_ISC3100_ER,
        IMOS_DT_EC1001_EF = 10,
        IMOS_DT_EC3004_HF_ER,
        IMOS_DT_EC3008_HD_ER,

        /* ö��ֵ 200 -- 500 */
        IMOS_DT_EC2016_HC = 200,
        IMOS_DT_EC2016_HC_8CH,
        IMOS_DT_EC2016_HC_4CH,
        IMOS_DT_EC1501_HF,                          /* 6437��˫�� */
        IMOS_DT_EC1004_MF,                          /* ��·EC */
        IMOS_DT_ECR2216_HC,                         /* ECRԤ�У�1U */
        IMOS_DT_EC1304_HC,                          /* ��PCMCIA */

        /* ö��ֵ 500 -- 800 */
        IMOS_DT_DC3016_FC = 500,                    /* ĿǰV1R5��2U����ISC3000-M������� */
        IMOS_DT_DC2016_FC,                          /* DC3016-FC���ɱ� */
        IMOS_DT_DC1016_MF,                          /* ��·DC */
        IMOS_DT_DC2004_FF,                          /* �����־���Ķ�·DC */

        IMOS_DT_EC1001 = 1000,                      /* R1 ����壬Ϊ�˷�����չ����1000��ʼ���� */
        IMOS_DT_DC1001 = 1001,                      /* R1 ����� */
        IMOS_DT_EC1101_HF = 1002,                   
        IMOS_DT_EC1102_HF = 1003,   
        IMOS_DT_EC1801_HH = 1004,
        IMOS_DT_DC1801_FH = 1005,          
        
        /* OEM��Ʒ�ͺ� */
        IMOS_DT_VR2004 = 10003,
        IMOS_DT_R1000  = 10203,
        IMOS_DT_VL2004 = 10503,
        IMOS_DT_VR1102 = 11003,
        /* IPC��Ʒ�ͺ� */
        IMOS_DT_HIC5201 = 12001,
        IMOS_DT_HIC5221 = 12002,
        IMOS_DT_BUTT    
    };

    /**
* @enum tagMediaFileFormat
* @brief ý���ļ���ʽö�ٶ���
* @attention ��
*/
   public enum XP_MEDIA_FILE_FORMAT_E
    {
        XP_MEDIA_FILE_TS  = 0,              /**< TS��ʽ��ý���ļ� */
        XP_MEDIA_FILE_FLV = 1               /**< FLV��ʽ��ý���ļ� */
    };

    public enum IMOS_STREAM_RELATION_SET_E
    {    
        IMOS_SR_MPEG4_MPEG4 = 0,                    /* MPEG4[������] + MPEG4[������] */
        IMOS_SR_H264_SHARE = 1,                     /* H.264[������] */
        IMOS_SR_MPEG2_MPEG4 = 2,                    /* MPEG2[������] + MPEG4[������] */
        IMOS_SR_H264_MJPEG = 3,                     /* H.264[������] + MJPEG[������] */
        IMOS_SR_MPEG4_SHARE = 4,                    /* MPEG4[������] */
        IMOS_SR_MPEG2_SHARE = 5,                    /* MPEG2[������] */
        IMOS_SR_STREAM_MPEG4_8D1 = 8,          /* MPEG4[������_D1] 8D1 �ײ�*/
        IMOS_SR_MPEG2_MPEG2 = 9,                    /* MPEG2[������] + MPEG2[������] */
        IMOS_SR_H264_H264 = 11,                     /* H.264[������] + H.264[������] */

        IMOS_SR_BUTT
    };


    /**
 * @enum tagIMOSFavoriteStream
 * @brief  �����ò�������
 * @attention ��
 */
    public enum IMOS_FAVORITE_STREAM_E
    {
        IMOS_FAVORITE_STREAM_ANY        = 0,        /**< ��ָ�� */
        IMOS_FAVORITE_STREAM_PRIMARY    = 1,        /**< ָ������ */
        IMOS_FAVORITE_STREAM_SECONDERY  = 2,        /**< ָ������ */
        IMOS_FAVORITE_STREAM_THIRD      = 3,        /**< ָ������ */
        IMOS_FAVORITE_STREAM_FOURTH     = 4,        /**< ָ������ */
        IMOS_FAVORITE_STREAM_FIFTH      = 5,        /**< ָ������ */
        IMOS_FAVORITE_STREAM_BI_AUDIO   = 6,        /**< ָ�������Խ� */
        IMOS_FAVORITE_STREAM_VOICE_BR   = 7,        /**< ָ�������㲥 */
        IMOS_FAVORITE_STREAM_BUTT,
        IMOS_FAVORITE_STREAM_INVALID    = 0xFFFF    /**< ��Чֵ */
    }

    public enum XP_PROTOCOL_E
    {
        XP_PROTOCOL_UDP = 0,                   /**< UDPЭ�� */
        XP_PROTOCOL_TCP = 1,                   /**< TCPЭ��Client��*/
        XP_PROTOCOL_TCP_SERVER = 2             /**< TCPЭ��Server��*/
    }
    /// <summary>
    /// ��ѯ������
    /// @attention 300~500 ��Ѷʹ��
    /// </summary>
    public enum QUERY_TYPE_E
    {
        CODE_TYPE = 0,    /**< ��������(���û�����֮��) */
        NAME_TYPE = 1,    /**< ��������(���û�����֮��) */
        USER_CODE_TYPE = 2,    /**< �û��������� */
        USER_NAME_TYPE = 3,    /**< �û��������� */
        TIME_TYPE = 4,    /**< ʱ������ */

        EVENT_TYPE = 5,    /**< �澯�¼�����,ȡֵΪ#AlARM_TYPE_E */
        EVENT_SECURITY = 6,    /**< �澯�¼�����,ȡֵΪ#ALARM_SEVERITY_LEVEL_E */
        EVENT_STATUS_TYPE = 7,  /**< �澯״̬,ȡֵΪ#ALARM_STATUS_E */
        EVENT_TIME = 8,    /**< �澯ʱ�� */

        DEV_SUB_TYPE = 9,    /**< �豸������ */

        INDEX_TYPE = 10,   /**< ��������(����Ƶ����ͨ������,��Ƶ���ͨ������,��������,����������) */

        RES_SUB_TYPE = 11,   /**< ��Դ������ */

        /* Begin: Add by x06948 for VVD38087, 20100115 */
        SRV_TYPE = 12,       /**< ҵ������ */
        MONITOR_TYPE = 13,       /**< ���������� */
        MONITOR_NAME = 14,       /**< ���������� */
        MONITOR_DOMAIN = 15,       /**< ������������ */
        CAMERA_NAME = 16,       /**< ��������� */
        USER_LOGIN_IP = 17,       /**< �û���¼IP */
        MON_SRV_STATUS = 18,       /**< ʵ��״̬ */
        VOCBRD_SRV_STATUS = 19,       /**< �㲥״̬ */
        /* End: Add by x06948 for VVD38087, 20100115 */
        //RES_TYPE            = 20,       /**< ��Դ���� */

        CASE_DESC = 20,       /**< �������� */
        TASK_STATUS = 21,       /**< ����״̬ */
        TASK_SUB_TIME = 22,       /**< �����ύʱ�� */
        TASK_END_TIME = 23,       /**< �������ʱ�� */
        BAK_START_TIME = 24,       /**< ���ݿ�ʼʱ�� */
        BAK_END_TIME = 25,       /**< ���ݽ���ʱ�� */
        FILE_CREATE_TIME = 26,       /**< �ļ�����ʱ�� */
        FILE_CAPACITY = 27,       /**< �ļ����� */
        FILE_TYPE = 28,       /**< �ļ����� */
        FILE_LOCK_FLAG = 29,       /**< �ļ�������ʶ */
        LAYOUT_TYPE = 30,       /**< �������ͣ�ȡֵΪ#LAYOUT_TYPE_E */

        PHY_DEV_IP = 31,

        ASSET_TYPE = 32,       /**< �ʲ����ͣ�ȡֵΪ#ASSET_TYPE_E */
        ASSET_MODEL = 33,       /**< �ʲ��ͺ� */
        ASSET_MANUFACTURE = 34,       /**< �ʲ����� */
        ASSET_STATUS = 35,       /**< �ʲ�״̬��ȡֵΪ#ASSET_STATUS_E */
        ASSET_PURCHASE_TIME = 36,       /**< �ʲ��ɹ�ʱ�� */
        ASSET_WARRANT_TIME = 37,       /**< �ʲ�����ʱ�� */
        ASSET_INSTALL_TIME = 38,       /**< �ʲ���װʱ�� */
        ASSET_INSTALL_LOCATION = 39,       /**< �ʲ���װ�ص� */
        ASSET_PRODEALER = 40,       /**< �ʲ������� */
        FAULT_STAT_TIME = 41,       /**< ����ͳ��ʱ�� */
        FAULT_TYPE = 42,       /**< �������� */
        FAULT_RECO_TIME = 43,       /**< ���ϻָ�ʱ�� */
        FAULT_INTERVAL = 44,       /**< ����ʱ�� */
        FAULT_COUNT = 45,       /**< ���ϴ��� */

        PLATE_CODE = 46,       /**< ���ƺ��� */
        STUFF_TYPE = 47,       /**< �永��Ʒ���� */
        STUFF_PROPERTY = 48,       /**< �永��Ʒ���� */
        SERIESCASE_TYPE = 49,       /**< ���������� */
        CASEINSE_CODE = 50,       /**< �������а������ */
        CASESHARE_TYPE = 51,       /**< ������������ */
        CASE_PROPERTY = 52,       /**< �������� */
        CASE_TYPE = 53,       /**< �������� */
        CASE_STATUS = 54,       /**< ����״̬ */
        POLICE_INTSRC = 55,       /**< ����������Դ */
        CASE_BEGIN_TIME = 56,       /**< ������ʼʱ�� */
        CASE_END_TIME = 57,       /**< ��������ʱ�� */
        STAT_START_TIME = 58,       /**< ͳ�ƿ�ʼʱ�� */
        STAT_END_TIME = 59,       /**< ͳ�ƽ���ʱ�� */
        EBULLETIN_EXPIRE_FLAG = 60,       /**< ���ӹ�����ڱ�־ */
        CASE_DATA_TYPE = 61,       /**< ������������ */
        CASE_SOLVED_TIME = 63,       /**< �����ư�ʱ�� */
        CASE_CLOSED_TIME = 64,       /**< �����᰸ʱ�� */
        CASE_UPLOAD_TIME = 65,       /**< ���������ϴ�ʱ�� */
        CASE_CREATE_TIME = 66,       /**< ��������ʱ�� */
        DEPT_CODE = 67,       /**< ���ű��� */

        MSGSTATUS = 69,/**< ��Ϣ������� */

        DOMAIN_TYPE = 100,       /**< ������,��ֻ֧�ֱ����� */

        EXT_DOMAIN_TPYE = 200,      /**< ��������:��/��/ƽ���� */
        EXT_DOMAIN_IP = 201,      /**< ����IP */
        EXT_DOMAIN_PORT = 202,      /**< ����PORT */
        EXT_DOMAIN_TRUNK_NUM = 203,      /**< ����������� */
        EXT_DOMAIN_MULTICAST = 204,      /**< ����鲥���� */
        EXT_DOMAIN_SESSION = 205,      /**< ����������־ */
        EXT_DOMAIN_SUBTYPE = 206,      /**< ���������� */

        JOB_STATUS = 210,          /**< ��������״̬ */
        JOB_CREATOR = 211,          /**< �������񴴽��� */
        JOB_EXEC_TIME = 212,          /**< �����������ʱ�� */
        JOB_ESTB_TIME = 213,          /**< ���������ƶ�ʱ�� */
        JOB_END_TIME = 214,          /**< �����������ʱ�� */
        JOB_RESULT = 215,          /**< ������� */

        OPER_TIME = 220,      /**< ����ʱ�� */
        OPER_IP = 221,      /**< ������IP��ַ */
        OPER_TYPE = 222,      /**< �������� */
        OPER_RESULT = 223,      /**< ������� */
        OPER_SERVICE_TYPE = 224,      /**< ������ҵ������ */
        OPER_OBJ = 225,      /**< �������� */

        LABEL_TIME = 230,          /**< ��ǩʱ��� */
        REC_START_TIME = 231,          /**< ��ǩ¼��ʼʱ�䣬��ʽΪ"hh:mm:ss" */
        REC_END_TIME = 232,          /**< ��ǩ¼�����ʱ�䣬��ʽΪ"hh:mm:ss" */

        USER_FULL_NAME = 240,      /**< �û�ȫ�� */
        USER_TEL_PHONE = 241,      /**< �û������绰 */
        USER_MOBILE_PHONE = 242,      /**< �û��ƶ��绰 */
        USER_EMAIL = 243,      /**< �û������ʼ� */
        USER_IS_LOCKED = 244,      /**< �û��Ƿ����� */

        USER_DESC = 245,      /**< �û����� */

        ROLE_PRIORITY = 250,           /**< ��ɫ���ȼ� */

        DEV_TYPE = 255,          /**< �豸���� */
        RES_TYPE = 256,          /**< ��Դ���� */
        IS_QUERY_SUB = 257,          /**< �Ƿ���¼�(��Ҫ��AS_CON_Parse���н���) */
        RES_ID = 258,          /**< ��ԴID */
        SUPPORT_LINK = 259,          /**< �Ƿ�֧������ */
        SUPPORT_GUARD = 260,          /**< �Ƿ�֧�ֲ��� */
        RES_ATTRIBUTE = 261,          /**< ��Դ���� */
        IS_QUERY_ENCODESET = 262,          /**< �Ƿ��ѯ��������߼����������豸�����ײͣ���ӦszQueryDataΪ0-����ѯ��1-��ѯ */

        TYPE_ACTION_PLAN = 263,          /**< Ԥ������ */
        IS_PLAN_ALARM = 264,          /**< �Ƿ�Ԥ���澯 */
        IS_ONCE_PLAN_ALARM = 265,          /**< �Ƿ�������Ԥ�� */
        IS_MISINFORM = 266,          /**< �Ƿ��� */
        CHK_USER_NAME_TYPE = 267,          /**< �˾��û��� */
        TRIGGER_ID = 268,          /**< ������ID */

        IS_HIDE_EMPTY_ORG = 269,          /**< �Ƿ����ؿ���֯ */
        IS_QUERY_SHARED = 270,          /**< �ǲ�ѯ�ѹ�����Դ=1���ǲ�δ������Դ=0 */

        IS_LEACH_SHARED_BELONG = 271,      /**< �Ƿ���˵���Ϊ��Դ��������������Դ�������ɵĻ����¼(��Ҫ��AS_CON_Parse���н���) */
        RESULT_CODE = 272,      /**< ����� */
        RES_ORDER_NUMBER = 273,      /**< ��Դ������� */

        AUTOID = 273,      /**< ���� */

        EVENT_TYPE_NAME = 273,      /**< �¼��������� */

        IS_QUERY_SYSTEM_EVENT_TYPE = 274,   /**< 0-��ѯȫ��;1-��ѯϵͳԤ����;2-��ѯ�û��Զ��� */

        IS_SUPPORT_BISTORE_CAM = 275,   /**< �Ƿ�����֧��˫ֱ�������������������� */

        RES_STATUS_CONDITON = 276,      /**< ��Դ״̬��ѯ���� */

        CONF_START_TIME = 300,      /**< ���鿪ʼʱ�䣬1970������������ */
        CONF_END_TIME = 301,      /**< �������ʱ�䣬1970������������ */

        STORE_DEV_NAME = 302,          /**< �洢�豸���� */
        DM_NAME = 303,          /**< ���ݹ������������ */
        RES_BELONGIN = 304,          /**< ��Դ����,0����ԭʼ����#MM_RESOURCE_BELONGIN_ORIGINAL��1���������#MM_RESOURCE_BELONGIN_TRANSFER */
        IS_CASE_SERVER = 310,      /**< �Ƿ񰸼����ݹ�������� */
        BAK_SERVICE_TYPE = 311,      /**< ����ҵ������ */
        BAK_RES_SERVICE_TYPE = 312,      /**< ������Դҵ������ */
        DOMAIN_CODE = 350,      /**< ����� */
        TOLLGATE_CODE = 351,      /**< ���ڱ�� */
        TOLLGATE_NAME = 352,      /**< �������� */
        TOLLGATE_CAMERA_CODE = 353,      /**< ����������� */
        LANE_NUMBER = 354,      /**< ������� */
        LANE_DIRECTION = 355,      /**< ���������� */
        PASS_TIME = 356,      /**< ͨ��ʱ�� */
        VEHICLE_LICENSE_PLATE = 357,      /**< ���ƺ��� */
        VEHICLE_LICENSE_PLATE_TYPE = 358,      /**< �������� */
        VEHICLE_LICENSE_PLATE_COLOR = 359,      /**< ������ɫ */
        SPEED_TYPE = 360,      /**< �ٶ� */
        LIMIT_SPEED = 361,      /**< ���� */
        VEHICLE_LOGO = 362,      /**< ����Ʒ�� */
        VEHICLE_TYPE = 363,      /**< �������� */
        VEHICLE_COLOR_DEPTH = 364,      /**< ������ɫ��ǳ */
        VEHICLE_COLOR = 365,      /**< ������ɫ */
        VEHICLE_IDENTIFY_STATUS = 366,      /**< ʶ��״̬ */
        VEHICLE_STATUS = 367,      /**< ��ʻ״̬ */
        VEHICLE_DEAL_STATUS = 368,      /**< ���������� */
        DISPOSITION_CODE = 369,      /**< ���ر�� */
        DISPOSITION_TYPE = 370,      /**< ������� */
        DISPOSITION_DEPT = 371,      /**< ���ص�λ */
        DISPOSITION_USER = 372,      /**< ������Ա */
        DISPOSITION_STATUS = 373,      /**< ����״̬ */
        DISPOSITION_UNDO_DEPT = 374,      /**< ���ص�λ */
        DISPOSITION_UNDO_USER = 375,      /**< ������Ա */
        PRIORITY_TYPE = 376,      /**< ���ȼ� */
        ALARM_TYPE = 377,      /**< �澯���� */
        PLATE_ANALYSE_STATUS = 378,      /**< ���Ʒ���״̬ */
        SECTION_CODE = 379,      /**< ���������� */
        SECTION_NAME = 380,      /**< ������������ */
        TOLLGATE_CODE_IN = 381,      /**< ʻ�뿨�� */
        TOLLGATE_CODE_OUT = 382,      /**< ʻ������ */
        VEHICLE_DATA_TYPE = 383,      /**< ������������ */
        PASS_TIME2 = 384,      /**< ͨ��ʱ��2 */
        DISPOSITION_RESULT = 385,      /**< ���ش����� */
        EXT_DOMAIN_PROTOCOL_TYPE = 386,      /**< ���ͨѶЭ������ */
        DISTANCE_RANGE = 387,      /**< ���뷶Χ */
        DEFAULT_WEBGIS_MAP = 388,      /**< Ĭ��WebGis��ͼ */
        DEFAULT_WEBGIS_POINT = 389,      /**< Ĭ��WebGis��ͼ��ע�� */
        STAT_TIME = 390,      /**< ͳ��ʱ�� */

        PLACE_CODE = 501,      /**< Υ�µص���� */
        EQUIPMENT_TYPE = 502,      /**< �ɼ����� */
        ABNORMAL_ANALYSE_STATUS = 503,      /**< �쳣��Ϊ����״̬ */
        COUNT_TYPE = 504,      /**< ���� */
        RESTRICT_TYPE = 505,      /**< ���з�ʽ */
        VEHICLE_DATA_CODE = 506,      /**< ������Ϣ��� */
        COMBINE_FLAG = 507,      /**< ͼƬ�ϳɱ�ʶ */

        VEHICLE_NEW_LOGO = 519,  /**< ���� */
        VEHICLE_LINE = 517,  /**< ��ϵ */
        VEHICLE_YEAR = 518,  /**< ��� */

        DRIVER_SUN_VISOR_STATUS = 570,  /**<����ʻ������>*/
        CODRIVER_SUN_VISOR_STATUS = 571, /**<����ʻ������>*/
        DRIVER_SEAT_BELT_STATUS = 572, /**<����ʻ��ȫ��>*/
        CODRIVER_SEAT_BELT_STATUS = 573, /**<����ʻ��ȫ��>*/
        DRIVER_MOBIL_STATUS = 574, /**<����ʻ������绰>*/

        DEVICE_CODE = 580,    /**<�豸����(rfid����)>*/
        MAC_ADDR = 581,    /**<MAC��ַ>*/
        DISPOSITION_MACRFID_TYPE = 582,    /**<MAC&RFID��������>*/
        DISPOSITION_MACRFID_STATUS = 583,    /**<MAC&RFID����״̬>*/
        MAC_DISPOSE_REASON = 584,    /**<MAC����ԭ��>*/
        RFID_DISPOSE_REASON = 585,    /**<RFID����ԭ��>*/
        START_TIME = 586,             /**< ��ʼʱ�� */
        END_TIME = 587,             /**< ����ʱ�� */
        IDENTIFY_INFO = 579,   /**<�����Ϣ>*/


        MAC_PLACE_CODE = 600,
        MAC_PLACE_NAME = 601,
        MAC_BOSS_NAME = 602,
        MAC_PLACE_FULL_NAME = 603,

        MAC_MANU_NAME = 604,
        MAC_MANU_ORG_CODE = 605,
        MAC_CONTACT_PEOPLE = 606,

        QUERY_IOT_TYPE = 607,

        QUERY_DANGEROUS_GOODS = 608,   /**<Σ��Ʒ>*/
        QUERY_YELLOW_CAR = 609,        /**<�Ʊ공>*/
        QEURY_ANNUAL_SURVEY = 610,     /**<�����>*/
        QUERY_PENDENT = 611,           /**<��׹>*/
        IS_DISTINCT = 612,           /**<ȥ��>*/

        NAPKIN_BOX_STATUS = 634,    /**<ֽ���>*/

        QUERY_TYPE_MAX          /**< ��Чֵ */
    }

    /// <summary>
    /// ��ѯ�߼�����
    /// </summary>
    public enum LOGIC_FLAG_E
    {
        EQUAL_FLAG,     //����  
        GREAT_FLAG,     //����  
        LITTLE_FLAG,    //С��  
        GEQUAL_FLAG,    //���ڵ���  
        LEQUAL_FLAG,    //С�ڵ���  
        LIKE_FLAG,      //ģ����ѯ  
        ASCEND_FLAG,    //����  
        DESCEND_FLAG,   //����  

        /* added by kangshunli for MPPD17836 */
        /// <summary>
        /// /*������ */
        /// </summary>
        NEQUAL_FLAG = 8,
        /// <summary>
        /// /*NOT LIKE */
        /// </summary>
        NLIKE_FLAG = 13,
        /// <summary>
        /// in 99
        /// </summary>
        IN_FLAG = 99,
        /* added by kangshunli for MPPD17836 */
        LOGIC_FLAG_MAX  //��Чֵ  
    }
        /**
    * @enum tagDownMediaSpeed
    * @brief ý�����������ٶȵ�ö�ٶ���
    * @attention ��
    */
    public enum XP_DOWN_MEDIA_SPEED_E
    {
        XP_DOWN_MEDIA_SPEED_ONE = 0,            /**< һ��������ý���ļ� */
        XP_DOWN_MEDIA_SPEED_TWO = 1,            /**< ����������ý���ļ� */
        XP_DOWN_MEDIA_SPEED_FOUR = 2,           /**< �ı�������ý���ļ� */
        XP_DOWN_MEDIA_SPEED_EIGHT = 3           /**< �˱�������ý���ļ� */
    }


    /// <summary>
    /// ͨ�õ���̨����ö��ֵ
    /// </summary>
    public enum PTZ_CMD_E
    {
        PTZ_UP,
        PTZ_UP_STOP,
        PTZ_DOWN,
        PTZ_DOWN_STOP,
        PTZ_LEFT,
        PTZ_LEFT_STOP,
        PTZ_RIGHT,
        PTZ_RIGHT_STOP,
        PTZ_LEFT_UP,
        PTZ_LEFT_UP_STOP,
        PTZ_LEFT_DOWN,
        PTZ_LEFT_DOWN_STOP,
        PTZ_RIGHT_UP,
        PTZ_RIGHT_UP_STOP,
        PTZ_RIGHT_DOWN,
        PTZ_RIGHT_DOWN_STOP,

        PTZ_ALL_STOP,           /**< ȫͣ */

        PTZ_IRIS_OPEN,          /**< ��Ȧ�� */
        PTZ_IRIS_OPEN_STOP,
        PTZ_IRIS_CLOSE,         /**< ��Ȧ�� */
        PTZ_IRIS_CLOSE_STOP,

        PTZ_FOCUS_FAR,          /**< �۽�Զ */
        PTZ_FOCUS_FAR_STOP,
        PTZ_FOCUS_NEAR,         /**< �۽��� */
        PTZ_FOCUS_NEAR_STOP,

        PTZ_ZOOM_TELE,          /**< �Ŵ� */
        PTZ_ZOOM_TELE_STOP,
        PTZ_ZOOM_WIDE,          /**< ��С */
        PTZ_ZOOM_WIDE_STOP,

        PTZ_PRE_SAVE,           /**< ����Ԥ��λ */
        PTZ_PRE_CALL,           /**< ����Ԥ��λ */
        PTZ_PRE_DELETE,         /**< ɾ��Ԥ��λ */

        PTZ_BRUSH_ON,           /**< ��ˢ�� */
        PTZ_BRUSH_OFF,
        PTZ_LIGHT_ON,           /**< �ƹ⿪ */
        PTZ_LIGHT_OFF,
        PTZ_HEAT_ON,            /**< ���ȿ� */
        PTZ_HEAT_OFF,

        PTZ_CRUISE_START,       /**< ����Ѳ�� */
        PTZ_CRUISE_STOP,        /**< ֹͣѲ�� */
    }

    /// <summary>
    /// �澯��������
    /// </summary>
    public enum SUBSCRIBE_PUSH_TYPE_E
    {
        SUBSCRIBE_PUSH_TYPE_ALL,         //���ܸ澯���ͺ��豸״̬����  
        SUBSCRIBE_PUSH_TYPE_ALARM,       //ֻ���ո澯����  
        SUBSCRIBE_PUSH_TYPE_ALARM_STATUS,//ֻ�����豸״̬����  
        SUBSCRIBE_PUSH_TYPE_MAX,         //   
        SUBSCRIBE_PUSH_TYPE_INVALID
    }

    /** �ص�����������Ϣ���� */
    public enum CALL_BACK_PROC_TYPE_E : uint
    {
        PROC_TYPE_DEV_STATUS = 0,            /**< �豸״̬����Ӧ�ṹ : AS_STAPUSH_UI_S */
        PROC_TYPE_ALARM = 1,            /**< �澯����Ӧ�ṹ : AS_ALARMPUSH_UI_S */
        PROC_TYPE_DEV_CAM_SHEAR = 2,            /**< �������������Ӧ�ṹ : AS_DEVPUSH_UI_S */
        PROC_TYPE_MONITOR_BE_REAVED = 3,            /**< ʵ������ռ����Ӧ�ṹ : CS_MONITOR_REAVE_NOTIFY_S */
        PROC_TYPE_SWITCH_BE_REAVED = 4,            /**< ���б���ռ����Ӧ�ṹ : CS_SWITCH_REAVE_NOTIFY_S */
        PROC_TYPE_MONITOR_BE_STOPPED = 5,            /**< ʵ����ֹͣ����Ӧ�ṹ : CS_MONITOR_REAVE_NOTIFY_S */
        PROC_TYPE_SWITCH_BE_STOPPED = 6,            /**< ���б�ֹͣ����Ӧ�ṹ : CS_SWITCH_REAVE_NOTIFY_S */
        PROC_TYPE_VOCSRV_BE_REAVED = 7,            /**< ��������ռ����Ӧ�ṹ : CS_VOCSRV_REAVE_NOTIFY_S */
        PROC_TYPE_PTZ_EVENT = 8,            /**< ��̨�¼�֪ͨ����Ӧ�ṹ : CS_PTZ_REAVE_NOTIFY_S */
        PROC_TYPE_TRB_PROC = 9,            /**< ���ϴ���֪ͨ����Ӧ�ṹ : CS_NOTIFY_UI_TRB_EVENT_PROC_S */
        PROC_TYPE_SRV_SETUP = 10,           /**< ���ϻָ�ҵ����֪ͨ����Ӧ�ṹ : CS_NOTIFY_UI_SRV_SETUP_S */
        PROC_TYPE_XP_ALARM_SETUP = 11,           /**< �澯������XP����֪ͨ����Ӧ�ṹ : CS_NOTIFY_UI_SRV_SETUP_S */

        PROC_TYPE_LOGOUT = 12,           /**< �˳���½����Ӧ�ṹ :�� */

        PROC_TYPE_MEDIA_PARAM_CHANGE = 13,           /**< ý������ı䣬��Ӧ�ṹ : CS_NOTIFY_UI_MEDIA_PARAM_CHANGE_PROC_S */

        PROC_TYPE_EXDOMAIN_STATUS = 14,           /**< ����״̬����Ӧ�ṹ : AS_EXDOMAIN_STAPUSH_UI_S */

        PROC_TYPE_BACKUP_DATA_FINISH = 15,           /**< ��Ϣ�������֪ͨ, ��Ӧ�ṹ : CS_BACKUP_FINISH_INFO_S */

        PROC_TYPE_TL_EVENT = 16,           /**< ͸��ͨ���¼�֪ͨ����Ӧ�ṹ : CS_TL_REAVE_NOTIFY_S */

        PROC_TYPE_SALVO_UNIT_EVENT = 17,           /**< ����ʾ��Ԫ�¼�֪ͨ, ��Ӧ�ṹ : CS_NOTIFY_SALVO_UNIT_EVENT_S */
        PROC_TYPE_SALVO_EVENT = 18,           /**< ����ҵ���¼�֪ͨ, ��Ӧ�ṹ : CS_NOTIFY_UI_SALVO_EVENT_S */
        PROC_TYPE_START_XP_SALVO = 19,           /**< ֪ͨUI��������Ѳ������ʾ, ��Ӧ�ṹ: CS_NOTIFY_START_XP_SALVO_S */

        PROC_TYPE_VODWALL_BE_REAVED = 20,           /**< ֪ͨ�ط���ǽ����ռ����Ӧ�ṹ��CS_VODWALL_REAVE_NOTIFY_S */
        PROC_TYPE_VODWALL_BE_STOPPED = 21,           /**< ֪ͨ�ط���ǽ��ֹͣ����Ӧ�ṹ��CS_VODWALL_REAVE_NOTIFY_S */

        PROC_TYPE_VOD_BE_REAVED = 22,           /**< �طű���ռ����Ӧ�ṹ : CS_VOD_REAVE_NOTIFY_S */

        PROC_TYPE_DOMAIN_SYN_RESULT = 23,           /**< ���ͬ���Ľ������Ӧ�ṹ : AS_DOMAIN_SYN_PUSHUI_S */

        PROC_TYPE_VOC_REQ = 24,           /**< �ͻ����������󣬶�Ӧ�ṹ : CS_VOC_REQ_NOTIFY_S */
        PROC_TYPE_VOC_STATE_NOTIFY = 25,           /**< ����ҵ��״̬֪ͨ����Ӧ�ṹ : CS_VOC_STATE_NOTIFY_S */

        /*******************************************************************************
        SS�������� �����ص�����
        *******************************************************************************/
        PROC_TYPE_ACCEPT_SPEAK_YESORNO = 100,           /**< �������룬 ��Ӧ�ṹ ��CONF_SITE_INFO_EX_S */
        PROC_TYPE_CONF_STATUS_CHANGE = 101,           /**< ����״̬�ı䣬 ��Ӧ�ṹ ��CONF_STATUS_INFO_EX_S ��������ڻ����ҷ����һ�����ڣ��ϱ�����δ��ʼ/�����ϱ������Ѿ����� */
        PROC_TYPE_DEVICE_CODE_CHANGE = 102,           /**< �豸����ı䣬 ��Ӧ�ṹ ��DEVICE_CODE_CHANGE_INFO_EX_S */
        PROC_TYPE_DEVICE_CHANGE = 103,           /**< �ն��豸������Ϣ�� �������豸������ɾ��ʱ�� �ϱ�������Ϣ�� ��Ӧ�Ľṹ ��DEVICE_CHANGE_INFO_EX_S */
        PROC_TYPE_MODIFY_TERM = 104,           /**< �޸��ն���Ϣ�� ��Ӧ�Ľṹ ��MODIFY_TERM_REP_EX_S */
        PROC_TYPE_CHAIR_CHANGE = 105,           /**< ��ǰ��ϯ�����ı䣬 ��ϯ�᳡�ͷ���᳡����Ϊ�ա���Ӧ�Ľṹ ��CONF_SITE_INFO_EX_S */
        PROC_TYPE_SPEAKER_CHANGE = 106,           /**< ��ǰ�����˷����ı䣬 ��Ӧ�Ľṹ ��CONF_SITE_INFO_EX_S */
        PROC_TYPE_TERM_STATUS_CHANGE = 107,           /**< �᳡�ն�״̬�ı䣬 ��Ӧ�Ľṹ ��TERM_STATUS_CHANGE_EX_S */
        PROC_TYPE_DELAY_CONF = 108,           /**< �ӳٻ��飬 ��Ӧ�ṹ ��DELAY_CONF_INFO_EX_S */
        PROC_TYPE_SYNCHRONIZE_WITH_WEB = 109,           /**< �ϱ��㲥�᳡�� ��ϯ�������ۿ��᳡ ��Ӧ�Ľṹ �� MC_SYNCHRONIZE_WITH_WEB_EX_S  */
        PROC_TYPE_MCU_BACKUP_CHANGE_TO_MASTER = 110,    /**< MCU����֪ͨ�� ��Ӧ�ṹ ��BACKUP_MCU_REPORT_S  */
        PROC_TYPE_SEND_ROLE_SITE_CHANGE = 111,           /**< ��ǰ���������߱仯֪ͨ�� ��Ӧ�ṹ ��CONF_SEND_ROLE_SITE_CHANGE_S  */
        PROC_TYPE_AUTOMULTIPIC_CHANGE = 112,           /**< �໭���Զ��л�ֵ�ı�֪ͨ�� ��Ӧ�ṹ ��CONF_AUTOMULTIPIC_CHANGE_S  */
        PROC_TYPE_SET_TURN_BROADCAST_CHANGE = 113,       /**< ���û�����ѯģʽ�ı�֪ͨ�� ��Ӧ�ṹ ��CONF_SET_TURN_BROADCAST_CHANGE_S */
        PROC_TYPE_SET_PIC_MODE_CHANGE = 114,           /**< ���û���ģʽ�ı�֪ͨ�� ��Ӧ�ṹ ��CONF_SET_PIC_MODE_CHANGE_S */
        PROC_TYPE_MCU_SYNC_STATUS_CHANGE = 115,          /**< MCUͬ��״̬�ı�֪ͨ�� ��Ӧ�ṹ ��MCU_SYNC_STATUS_CHANGE_S */
        PROC_TYPE_CUR_BROADCAST_CHANGE = 116,          /**< ��ǰʵ�ʹ㲥�᳡�ı�֪ͨ����Ӧ�ṹ��CUR_BROADCAST_INFO_EX_S */
        PROC_TYPE_CUR_CHAIR_BROWSE_CHANGE = 117,     /**< ��ǰ��ϯ������ʵ�ʹۿ��Ļ᳡�ı�֪ͨ����Ӧ�ṹ��CUR_CHAIR_BROWSE_INFO_EX_S */
        PROC_TYPE_CONF_FECC_CHANGE = 118,          /**< ��ǰFECC�����߻򱻿��߱仯֪ͨ����Ӧ�ṹ��CONF_FECC_CHANGE_S */
        PROC_TYPE_CONF_MCU_BACKUP_CHANGE = 119,     /**< ��ǰ������MCU���ݱ仯֪ͨ����Ӧ�ṹ��CONF_MCU_BACKUP_CHANGE_S */
        PROC_TYPE_CALL_SITE_RESULT = 120,          /**< ���л᳡���֪ͨ����Ӧ�ṹ��CALL_SITE_INFO_EX_S */
        PROC_TYPE_GK_REG_STATE = 121,          /**< GKע����֪ͨ����Ӧ�ṹ��GK_REG_STATE_INFO_EX_S */
        PROC_TYPE_MG_SESSION_STATUS_CHANGE = 122,     /**< �ն˻Ự״̬����Ӧ�ṹ��MG_SESSION_STATUS_EX_S */
        PROC_TYPE_MAX,                                   /**< �ص�����������Ϣ�������ֵ */
        PROC_TYPE_INVALID = 0xFFFFFFFE    /**< ��Чֵ */
    }




        /**
    * @enum tagRunInfoType
    * @brief �ϱ���Ϣ���͵�ö�ٶ���
    * @attention ��
    */
    public enum XP_RUN_INFO_TYPE_E
    {
        XP_RUN_INFO_SERIES_SNATCH = 0,        /**< ����ץ�Ĺ������ϱ�������Ϣ */
        XP_RUN_INFO_RECORD_VIDEO = 1,         /**< ����¼��������ϱ�������Ϣ */
        XP_RUN_INFO_MEDIA_PROCESS = 2,        /**< ��Ƶý�崦������е��ϱ�������Ϣ */
        XP_RUN_INFO_DOWN_MEDIA_PROCESS = 3,   /**< ý�������ع������ϱ�������Ϣ */
        XP_RUN_INFO_VOICE_MEDIA_PROCESS = 4,  /**< ����ý�崦������е��ϱ�������Ϣ */
        XP_RUN_INFO_RTSP_PROTOCOL = 5,        /**< RTSPЭ��������еĴ�����Ϣ */
        XP_RUN_INFO_DOWN_RTSP_PROTOCOL = 6,   /**< ����¼�������RTSPЭ��Ĵ�����Ϣ */
        XP_RUN_INFO_SIP_LIVE_TIMEOUT = 7,     /**< SIPע�ᱣ�ʱ */
        XP_RUN_INFO_PASSIVE_MONITOR = 8,      /**< ����ʵ��ֹͣ������Ϣ */
        XP_RUN_INFO_PASSIVE_START_MONITOR = 9,/**< ����ʵ������������Ϣ */
        XP_RUN_INFO_MEDIA_NOT_IDENTIFY = 10,  /**< �����޷�ʶ�� */
        XP_RUN_INFO_RECV_PACKET_NUM = 11,     /**< �����ڽ��յ��İ��� */
        XP_RUN_INFO_RECV_BYTE_NUM = 12,       /**< �����ڽ��յ����ֽ��� */
        XP_RUN_INFO_VIDEO_FRAME_NUM = 13,     /**< �����ڽ�������Ƶ֡�� */
        XP_RUN_INFO_AUDIO_FRAME_NUM = 14,     /**< �����ڽ�������Ƶ֡�� */
        XP_RUN_INFO_LOST_PACKET_RATIO = 15,   /**< �����ڶ�����ͳ����Ϣ����λΪ0.01%�� */
        XP_RUN_INFO_MEDIA_PLAY_PROGRESS = 16, /**< ý����Я���Ľ�����Ϣ */
        XP_RUN_INFO_MEDIA_PLAY_END = 17,      /**< ý����Я���Ĳ��Ž��� */
        XP_RUN_INFO_MEDIA_ABNORMAL = 18,       /**< ý�崦���쳣 */
        XP_RUN_INFO_DECODE_STATE = 19         /**< �ϱ�����״̬*/
    }

    public enum MW_PTZ_CMD_E
    {
        MW_PTZ_IRISCLOSESTOP = 0x0101, /**< ��Ȧ��ֹͣ */
        MW_PTZ_IRISCLOSE = 0x0102,         /**< ��Ȧ�� */
        MW_PTZ_IRISOPENSTOP = 0x0103,   /**< ��Ȧ��ֹͣ */
        MW_PTZ_IRISOPEN = 0x0104,   /**< ��Ȧ�� */

        MW_PTZ_FOCUSNEARSTOP = 0x0201, /**< ���ۼ�ֹͣ */
        MW_PTZ_FOCUSNEAR = 0x0202,    /**< ���ۼ� */
        MW_PTZ_FOCUSFARSTOP = 0x0203,/**< Զ�ۼ� ֹͣ*/
        MW_PTZ_FOCUSFAR = 0x0204,        /**< Զ�ۼ� */

        MW_PTZ_ZOOMTELESTOP = 0x0301,/**< �Ŵ�ֹͣ */
        MW_PTZ_ZOOMTELE = 0x0302,/**< �Ŵ� */
        MW_PTZ_ZOOMWIDESTOP = 0x0303,/**< ��Сֹͣ */
        MW_PTZ_ZOOMWIDE = 0x0304,/**< ��С */

        MW_PTZ_TILTUPSTOP = 0x0401,/**< ����ֹͣ */
        MW_PTZ_TILTUP = 0x0402,/**< ���� */
        MW_PTZ_TILTDOWNSTOP = 0x0403,/**< ����ֹͣ */
        MW_PTZ_TILTDOWN = 0x0404,/**< ���� */

        MW_PTZ_PANRIGHTSTOP = 0x0501,/**< ����ֹͣ */
        MW_PTZ_PANRIGHT = 0x0502,/**< ���� */
        MW_PTZ_PANLEFTSTOP = 0x0503,/**< ����ֹͣ */
        MW_PTZ_PANLEFT = 0x0504,/**< ���� */

        MW_PTZ_PRESAVE = 0x0601,/**< Ԥ��λ���� */
        MW_PTZ_PRECALL = 0x0602,/**< Ԥ��λ���� */
        MW_PTZ_PREDEL = 0x0603,/**< Ԥ��λɾ�� */

        MW_PTZ_LEFTUPSTOP = 0x0701,/**< ����ֹͣ */
        MW_PTZ_LEFTUP = 0x0702,/**< ���� */
        MW_PTZ_LEFTDOWNSTOP = 0x0703,/**< ����ֹͣ */
        MW_PTZ_LEFTDOWN = 0x0704,/**< ���� */

        MW_PTZ_RIGHTUPSTOP = 0x0801,/**< ����ֹͣ */
        MW_PTZ_RIGHTUP = 0x0802,/**< ���� */
        MW_PTZ_RIGHTDOWNSTOP = 0x0803,/**< ����ֹͣ */
        MW_PTZ_RIGHTDOWN = 0x0804,/**< ���� */

        MW_PTZ_ALLSTOP = 0x0901,/**< ȫͣ������ */

        MW_PTZ_BRUSHON = 0x0A01,/**< ��ˢ�� */
        MW_PTZ_BRUSHOFF = 0x0A02,/**< ��ˢ�� */

        MW_PTZ_LIGHTON = 0x0B01,/**< �ƿ� */
        MW_PTZ_LIGHTOFF = 0x0B02,/**< �ƹ� */

        MW_PTZ_HEATON = 0x0C01,/**< ���ȿ� */
        MW_PTZ_HEATOFF = 0x0C02,/**< ���ȹ� */

        MW_PTZ_INFRAREDON = 0x0D01,/**< ���⿪ */
        MW_PTZ_INFRAREDOFF = 0x0D02,/**< ����� */

        MW_PTZ_SCANCRUISE = 0x0E01,/**< ��̨����ɨè */
        MW_PTZ_SCANCRUISESTOP = 0x0E02,/**< ��̨����ɨè */

        MW_PTZ_TRACKCRUISE = 0x0F01,/**<  ��̨�켣Ѳ�� */
        MW_PTZ_TRACKCRUISESTOP = 0x0F02,/**<  ��̨�켣Ѳ�� */

        MW_PTZ_PRESETCRUISE = 0x1001,/**<  ��̨��Ԥ��λѲ�� ���������ֲ�����̨ģ������ */
        MW_PTZ_PRESETCRUISESTOP = 0x1002,/**<  ��̨��Ԥ��λѲ�� ֹͣ���������ֲ�����̨ģ������ */

        PTZ_RELEASE,            /**< �ͷ���̨ */
        PTZ_LOCK,               /**< ������̨ */
        PTZ_UNLOCK,             /**< ������̨ */
        MW_PTZ_CMD_BUTT

    }


    public enum IMOS_TYPE_E
    {
        IMOS_TYPE_ORG = 1,                     /**< ��֯�� */
        IMOS_TYPE_OUTER_DOMAIN = 2,            /**< ���� */
        IMOS_TYPE_LOCAL_DOMAIN = 3,            /**< ���� */

        IMOS_TYPE_DM = 11,                     /**< DM */
        IMOS_TYPE_MS = 12,                     /**< MS */
        IMOS_TYPE_VX500 = 13,                  /**< VX500 */
        IMOS_TYPE_MONITOR = 14,                /**< ������ */

        IMOS_TYPE_EC = 15,                     /**< EC */
        IMOS_TYPE_DC = 16,                     /**< DC */

        IMOS_TYPE_GENERAL = 17,                /**< ͨ���豸 */

        IMOS_TYPE_MCU = 201,                   /**< MCU */
        IMOS_TYPE_MG = 202,                    /**< MG */

        IMOS_TYPE_CAMERA = 1001,               /**< ����� */
        IMOS_TYPE_ALARM_SOURCE = 1003,         /**< �澯Դ */

        IMOS_TYPE_STORAGE_DEV = 1004,          /**< �洢�豸 */
        IMOS_TYPE_TRANS_CHANNEL = 1005,        /**< ͸��ͨ�� */

        IMOS_TYPE_ALARM_OUTPUT = 1200,         /**< �澯��� */

        IMOS_TYPE_GUARD_TOUR_RESOURCE = 2001,  /**< ������Դ */
        IMOS_TYPE_GUARD_TOUR_PLAN = 2002,      /**< ���мƻ� */
        IMOS_TYPE_MAP = 2003,                  /**< ��ͼ */

        IMOS_TYPE_XP = 2005,                   /**< XP */
        IMOS_TYPE_XP_WIN = 2006,               /**< XP���� */
        IMOS_TYPE_GUARD_PLAN = 2007,           /**< �����ƻ� */

        IMOS_TYPE_DEV_ALL = 2008,              /**< ���е��豸����(EC/DC/MS/DM/VX500/����ͷ/������) */
        IMOS_TYPE_TV_WALL = 3001,              /**< ����ǽ */

        IMOS_TYPE_CONFERENCE = 4001,           /**< ������Դ */

        IMOS_TYPE_MAX
    }


    /**
      * @struct tagUserLoginIDInfo
      * @brief �û���¼ID��Ϣ�ṹ
      * @attention
      */
    [StructLayout(LayoutKind.Sequential)]
    public struct USER_LOGIN_ID_INFO_S
    {
        /** �û����� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_USER_CODE_LEN)]
        public byte[] szUserCode;

        /** �û���¼ID�����û���¼�����������ģ����Ǳ��һ���û���¼��Ψһ��ʶ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szUserLoginCode;

        /** �û���¼�Ŀͻ���IP��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szUserIpAddress;
    }

    /// <summary>
    /// ��ȡ��¼��URL������ṹ
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct UNITED_GET_URL_INFO_S
    {
        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_CODE_LEN)]
        public byte[] szCamCode;

        /** ¼���ļ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_FILE_NAME_LEN_V2)]
        public byte[] szFileName;

        /** ¼�����ʼ/����ʱ��, ���е�ʱ���ʽΪ"YYYY-MM-DD hh:mm:ss" */
        public TIME_SLICE_S stRecTimeSlice;

        /** �ͻ���IP��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szClientIp;

        /** �ط��м̲���#IMOS_VOD_STREAM_SERVER_MODE_E */
        public uint ulPlaybackAutofit;

        /** �򼶱����: 0xFFFFΪ��Ч���򼶱���� */
        public uint ulDomainLevel;

        /** ����ҵ�����ͣ�ȡֵ#BAK_TASK_SERVICE_TYPE_E */
        public uint ulBakSrvType;

        /** ����¼����룬����ҵ������Ϊ��������ʱ��Ч */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_CODE_LEN)]
        public byte[] szCaseRecCode;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 76)]
        public byte[] szReserve;

        public static UNITED_GET_URL_INFO_S GetInstance()
        {
            UNITED_GET_URL_INFO_S tmp = new UNITED_GET_URL_INFO_S();
            tmp.szCamCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            tmp.szFileName = new byte[IMOSSDK.IMOS_FILE_NAME_LEN_V2];
            tmp.stRecTimeSlice = TIME_SLICE_S.GetInstance();

            tmp.szClientIp = new byte[IMOSSDK.IMOS_IPADDR_LEN];
            tmp.szCaseRecCode = new byte[IMOSSDK.IMOS_CODE_LEN];
            tmp.szReserve = new byte[76];

            return tmp;
        }
    }

    /**
    * @struct tagLoginInfo
    * @brief �û���¼��Ϣ�ṹ��
    * @attention ��
    */
    [StructLayout(LayoutKind.Sequential)]
    public struct LOGIN_INFO_S
    {
        /** �û���¼ID��Ϣ */
        public USER_LOGIN_ID_INFO_S stUserLoginIDInfo;

        /** �û�������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** �û����������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szDomainName;

        /** �û�����������, ȡֵΪ#MM_DOMAIN_SUBTYPE_LOCAL_PHYSICAL��#MM_DOMAIN_SUBTYPE_LOCAL_VIRTUAL */
        public UInt32 ulDomainType;
    }

    /**
    * @struct tagXpInfo
    * @brief XP��Ϣ�ṹ��
    * @attention ��
    */
    [StructLayout(LayoutKind.Sequential)]
    public struct XP_INFO_S
    {
        /** XP���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szXpCode;

        /** ���� */
        public UInt32 ulScreenIndex;

        /** XP��һ������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szXpFirstWndCode;

        /** �����Խ����� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szVoiceTalkCode;

        /** �����㲥���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szVoiceBroadcastCode;

        /** SIPͨ�ŵ�ַ���ͣ�#IMOS_IPADDR_TYPE_IPV4ΪIPv4����; #IMOS_IPADDR_TYPE_IPV6ΪIPv6���� */
        public UInt32 ulSipAddrType;

        /** SIP������ͨ��IP��ַ������ʹ��XP��ʱ����Ч */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szSipIpAddress;

        /** SIP������ͨ�Ŷ˿ں� */
        public UInt32 ulSipPort;

        /** ������������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szServerCode;

    }

    /**
     * @struct tagQueryConditionItem
     * @brief ��ѯ������
     * @attention
     */
    [StructLayout(LayoutKind.Sequential)]
    public struct QUERY_CONDITION_ITEM_S
    {
        /** ��ѯ��������: #QUERY_TYPE_E */
        public UInt32 ulQueryType;

        /** ��ѯ�����߼���ϵ����: #LOGIC_FLAG_E */
        public UInt32 ulLogicFlag;

        /** ��ѯ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_QUERY_DATA_MAX_LEN)]
        public byte[] szQueryData;
    }


    /**
     * @struct tagCommonQueryCondition
     * @brief ͨ�ò�ѯ����
     * @attention
    */
    [StructLayout(LayoutKind.Sequential)]
    public struct COMMON_QUERY_CONDITION_S
    {
        /** ��ѯ���������в�ѯ������ʵ�ʸ���, ���ȡֵΪ#IMOS_QUERY_ITEM_MAX_NUM */
        public UInt32 ulItemNum;

        /** ��ѯ�������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_QUERY_ITEM_MAX_NUM)]
        public QUERY_CONDITION_ITEM_S[] astQueryConditionList;
    }

    /**
     * @struct tagQueryPageInfo
     * @brief ��ҳ������Ϣ
     * @brief ����ѯ���ݵ�ÿ���������Ӧһ����š���Ŵ�1��ʼ���������ӡ�
     * - ��ѯ���Ľ����ҳ����ʽ���أ�ÿ�β�ѯֻ�ܷ���һҳ��ҳ������������ulPageRowNum�趨����ΧΪ1~200��
     * - ÿ�β�ѯ�������ôӴ���ѯ�������ض���ţ�ulPageFirstRowNumber����ʼ
     * @attention
     */
    [StructLayout(LayoutKind.Sequential)]
    public struct QUERY_PAGE_INFO_S
    {
        /** ��ҳ��ѯ��ÿҳ�������Ŀ��, ����Ϊ0, Ҳ���ܴ���#IMOS_PAGE_QUERY_ROW_MAX_NUM */
        public UInt32 ulPageRowNum;

        /** ��ҳ��ѯ�е�һ�����ݵ����(����ѯ�ӵ�ulPageFirstRowNumber�����ݿ�ʼ�ķ�������������), ȡֵ����ULONG���͵ķ�Χ���� */
        public UInt32 ulPageFirstRowNumber;

        /** �Ƿ��ѯ��Ŀ����, BOOL_TRUEʱ��ѯ; BOOL_FALSEʱ����ѯ */
        public UInt32 bQueryCount;
    }

    /**
     * @struct tagRspPageInfo
     * @brief ��ҳ��Ӧ��Ϣ
     * @attention
     */
    [StructLayout(LayoutKind.Sequential)]
    public struct RSP_PAGE_INFO_S
    {
        /** ʵ�ʷ��ص���Ŀ�� */
        public UInt32 ulRowNum;

        /** ��������������Ŀ�� */
        public UInt32 ulTotalRowNum;
    }

    /**
     * @struct tagOrgResQueryItem
     * @brief ��֯�ڵ�����Դ��Ϣ��(��ѯ��Դ�б�ʱ����)
     * @attention
     */
    [StructLayout(LayoutKind.Sequential)]
    public struct ORG_RES_QUERY_ITEM_S
    {
        /** ��Դ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szResCode;

        /** ��Դ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szResName;

        /** ��Դ���ͣ�ȡֵ��ΧΪ#IMOS_TYPE_E */
        public UInt32 ulResType;

        /** ��Դ������,Ŀǰ��Դ������ֻ�����������֯��Ч�������������Ϊ��̨/����̨;
            ����֯����Ϊ:1-��������2-�����������3-�����������. 4-�ϼ���������.
            5-�¼���������.6-ƽ����������. */
        public UInt32 ulResSubType;

        /** ��Դ״̬��Ŀǰֻ��������豸�����򣬶�������˵, ���ֶδ������ע��״̬��ȡֵΪ
            #IMOS_DEV_STATUS_ONLINE��#IMOS_DEV_STATUS_OFFLINE */
        public UInt32 ulResStatus;

        /** ��Դ����״̬���������豸��˵��ö��Ϊ#DEV_EXT_STATUS_E; ��������˵, ���ֶδ�������ע��״̬:
            ȡֵΪ#IMOS_DEV_STATUS_ONLINE��#IMOS_DEV_STATUS_OFFLINE */
        public UInt32 ulResExtStatus;

        /** ����Դ�Ƿ��Ǳ��������Դ, 1Ϊ���������Դ; 0Ϊ�ǻ������Դ */
        public UInt32 ulResIsBeShare;

        /** ��Դ������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** ֧�ֵ�����Ŀ��������Դ����Ϊ�����ʱ��Ч��0:��Чֵ��1:������2:˫�� */
        public UInt32 ulStreamNum;

        /** �Ƿ�Ϊ������Դ��1Ϊ������Դ; 0Ϊ��������Դ */
        public UInt32 ulResIsForeign;

    }

    public struct PRESET_INFO_S
    {
        /** Ԥ��λֵ, ȡֵ��ΧΪ#PTZ_PRESET_MINVALUE~�����������ļ������õ�Ԥ��λ���ֵ */
        public UInt32 ulPresetValue;

        /** Ԥ��λ����, ��Ҫ��д */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szPresetDesc;
     }

    /**
     * @struct tagPTZCtrlCommand
     * @brief ��̨����ָ��
     * @attention
     */
    [StructLayout(LayoutKind.Sequential)]
    public struct PTZ_CTRL_COMMAND_S
    {
        /** ��̨������������, ȡֵΪ#MW_PTZ_CMD_E */
        public UInt32 ulPTZCmdID;

        /** ��̨����ת�� */
        public UInt32 ulPTZCmdPara1;

        /** ��̨������� */
        public UInt32 ulPTZCmdPara2;

        /** ��������Ĳ���ֵ,�����ֶ� */
        public UInt32 ulPTZCmdPara3;

    }

    [StructLayout(LayoutKind.Sequential)]
    public struct PLAY_WND_INFO_S
    {
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szPlayWndCode;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct TIME_SLICE_S
    {
        /** ��ʼʱ�� ��ʽΪ"hh:mm:ss"��"YYYY-MM-DD hh:mm:ss", ��ʹ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szBeginTime;

        /** ����ʱ�� ��ʽΪ"hh:mm:ss"��"YYYY-MM-DD hh:mm:ss", ��ʹ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szEndTime;

        public static TIME_SLICE_S GetInstance()
        {
            TIME_SLICE_S stTimeSlice = new TIME_SLICE_S();
            stTimeSlice.szBeginTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            stTimeSlice.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];

            return stTimeSlice;
        }
    }

    /// ��������ҵ������
    /// </summary>
    public enum BAK_TASK_SERVICE_TYPE_E
    {
        BAK_TASK_SERVICE_TYPE_GENERAL = 0,    /**< һ��ҵ�� */
        BAK_TASK_SERVICE_TYPE_CASE = 1,    /**< ��������ҵ�� */

        BAK_TASK_SERVICE_TYPE_MAX
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct REC_QUERY_INFO_S
    {
        /** ����ͷ����*/
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szCamCode;

        /** ��������ʼ/����ʱ�� */
        public TIME_SLICE_S stQueryTimeSlice;
		
		/* ¼����򼶱����: ���ڹ���Э�����ط� */
        public UInt32 uiDomainLevel;

        /* Begin add by zhengyibing(01306), 2014-04-19 for �¹����޶�*/
        /* ����ģ����ѯ����  #INDISTINCT_QUERY_TYPE_E */
        public UInt32 uiIndistinctQuery;

        /* ����¼���������  #RECORD_QUERY_TYPE_E */
        public UInt32 uiType;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 20)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct RECORD_FILE_INFO_S
    {
        /** �ļ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_FILE_NAME_LEN)]
        public byte[] szFileName;

        /** �ļ���ʼʱ��, ����"%Y-%m-%d %H:%M:%S"��ʽ, �����޶�Ϊ24�ַ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szStartTime;

        /** �ļ�����ʱ��, ����"%Y-%m-%d %H:%M:%S"��ʽ, �����޶�Ϊ24�ַ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szEndTime;

        /** �ļ���С, Ŀǰ�ݲ�ʹ�� */
        public UInt32 ulSize;

        /** ������Ϣ, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szSpec;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct GET_URL_INFO_S
    {
        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szCamCode;

        /** ¼���ļ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_FILE_NAME_LEN)]
        public byte[] szFileName;

        /** ¼�����ʼ/����ʱ��, ���е�ʱ���ʽΪ"YYYY-MM-DD hh:mm:ss" */
        public TIME_SLICE_S    stRecTimeSlice;

        /** �ͻ���IP��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szClientIp;

        public static GET_URL_INFO_S GetInstance()
        {
            GET_URL_INFO_S tmp = new GET_URL_INFO_S();
            tmp.stRecTimeSlice = TIME_SLICE_S.GetInstance();
            tmp.szCamCode = new byte[IMOSSDK.IMOS_RES_CODE_LEN];
            tmp.szClientIp = new byte[IMOSSDK.IMOS_IPADDR_LEN];
            tmp.szFileName = new byte[IMOSSDK.IMOS_FILE_NAME_LEN];
            return tmp;
        }
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VOD_SEVER_IPADDR_S 
    {
        /** RTSP������IP��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szServerIp;

        /** RTSP�������˿� */
        public UInt16  usServerPort;

        /** ����λ, �����ֽڶ���, ��ʵ�ʺ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 2)]
        public byte[] acReserved;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct URL_INFO_S 
    {
        /** URL��ַ*/
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IE_URL_LEN)]
        public byte[] szURL;

        /** �㲥��������IP��ַ�Ͷ˿� */
        public VOD_SEVER_IPADDR_S      stVodSeverIP;

        /** ���������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 64)]
        public byte[] szDecoderTag;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct EC_INFO_S
    {
        /** EC����, EC��Ψһ��ʶ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szECCode;

        /** EC���� */
       [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szECName;

        /** EC���ͣ�ȡֵΪ#IMOS_DEVICE_TYPE_E, �Ϸ�ȡֵ�μ�#ulChannum������˵�� */
        public UInt32 ulECType;

        /** ECͨ������:
            ���ֳ���EC���Ͷ�Ӧ��ͨ����������:
            EC1101(#IMOS_DT_EC1101_HF)/EC1001(#IMOS_DT_EC1001)/EC1001-HF(#IMOS_DT_EC1001_HF): 1
            EC1501(#IMOS_DT_EC1501_HF)/R1000 (#IMOS_DT_R1000) : 1
            EC2004(#IMOS_DT_EC2004_HF)/VR2004(#IMOS_DT_VR2004): 4
            EC1102(#IMOS_DT_EC1102_HF)/VR1102(#IMOS_DT_VR1102): 2
            EC1801(#IMOS_DT_EC1801_HH): 1
            EC2016(#IMOS_DT_EC2016_HC): 16
            EC2016[8CH](#IMOS_DT_EC2016_HC_8CH): 8
            EC2016[4CH](#IMOS_DT_EC2016_HC_4CH): 4
            HIC5201-H(#IMOS_DT_HIC5201)/HIC5221-H(#IMOS_DT_HIC5221): 1
        */
        public UInt32 ulChannum;

        /** �Ƿ�֧���鲥, 1Ϊ֧��; 0Ϊ��֧�� */
        public UInt32 ulIsMulticast;

        /** ���¸澯�¶�����, ȡֵΪ-100~49 */
        public Int32 lTemperatureMax;

        /** ���¸澯�¶�����, ȡֵΪ50~100 */
        public Int32 lTemperatureMin;

        /** �澯ʹ��, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnableAlarm;

        /** EC������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** ʱ��ͬ����ʽ��Ĭ��Ϊ1����ʾʹ��H3C��˽��ͬ����ʽ��2��ʾNTP��ͬ����ʽ */
        public UInt32 ulTimeSyncMode;

        /** ʱ��, ȡֵΪ-12~12 */
        public Int32 lTimeZone;

        /** �������ã������ķ����������ã�ȡֵΪ:#TD_LANGUAGE_E */
        public UInt32 ulLanguage;

        /** �Ƿ����ñ��ػ��棬1��ʾ����; 0��ʾ��������Ĭ��ֵΪ0 */
        public UInt32 ulEnableLocalCache;

        /** ���ײ�, ȡֵΪ:#IMOS_STREAM_RELATION_SET_E
            0��MPEG4+MPEG4(#IMOS_SR_MPEG4_MPEG4)
            1��H264������(#IMOS_SR_H264_SHARE)
            2��MPEG2+MPEG4(#IMOS_SR_MPEG2_MPEG4)
            3��H264+MJPEG(#IMOS_SR_H264_MJPEG)
            4��MPEG4������(#IMOS_SR_MPEG4_SHARE)
            5��MPEG2������(#IMOS_SR_MPEG2_SHARE)
            8: MPEG4������_D1(#IMOS_SR_STREAM_MPEG4_8D1)
            9��MPEG2+MPEG2(#IMOS_SR_MPEG2_MPEG2)
            11��H264+H264(#IMOS_SR_H264_H264)
        */
        public UInt32 ulEncodeSet;

        /** ��ʽ, ȡֵΪ#IMOS_PICTURE_FORMAT_E */
        public UInt32 ulStandard;

        /** ��Ƶ����Դ��ȡֵΪ#IMOS_AUDIO_INPUT_SOURCE_E */
        public UInt32 ulAudioinSource;

        /** �����Խ���Դ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szAudioCommCode;

        /** �����㲥��Դ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szAudioBroadcastCode;

        /** �豸�������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN)]
        public byte[] szDevPasswd;

        /** �豸����, Ŀǰ���ֶ�δʹ�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szDevDesc;

        /** EC��IP��ַ, ��Ӽ��޸�EC������д�ò���, ��ѯEC��Ϣʱ���ظ��ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szECIPAddr;

        /** EC������״̬,��Ӽ��޸�EC������д�ò���, ��ѯEC��Ϣʱ���ظ��ֶ�, 1Ϊ����; 0Ϊ���� */
        public UInt32 ulIsECOnline;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 96)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct EC_QUERY_ITEM_S
    {
        /** EC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szECCode;

        /** EC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szECName;

        /** EC���ͣ�ȡֵΪ#IMOS_DEVICE_TYPE_E */
        public UInt32 ulECType;

        /** �豸��ַ���ͣ�1-IPv4 2-IPv6 */
        public UInt32 ulDevaddrtype;

        /** �豸��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szDevAddr;

        /** ������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** �豸�Ƿ�����ȡֵΪ#IMOS_DEV_STATUS_ONLINE��#IMOS_DEV_STATUS_OFFLINE����imos_def.h�ж��� */
        public UInt32 ulIsOnline;

        /** �豸��չ״̬��ȡֵΪ#DEV_EXT_STATUS_E */
        public UInt32 ulDevExtStatus;

        /** �Ƿ�֧���鲥, 1Ϊ֧���鲥; 0Ϊ��֧���鲥 */
        public UInt32 ulIsMulticast;

        /** �澯ʹ��, 1Ϊʹ�ܸ澯; 0Ϊ��ʹ�ܸ澯 */
        public UInt32 ulEnableAlarm;

        /** ���ײ����ͣ�ȡֵΪ#IMOS_STREAM_RELATION_SET_E */
        public UInt32 ulEncodeType;

        /** ��ʽ��ȡֵΪ#IMOS_PICTURE_FORMAT_E */
        public UInt32 ulStandard;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct DC_INFO_S
    {
        /** DC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szDCCode;

        /** DC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szDCName;

        /** DC����, ȡֵΪ#IMOS_DEVICE_TYPE_E, �Ϸ�ȡֵ�μ�#ulChannum������˵�� */
        public UInt32 ulDCType;

        /** DCͨ������:
            ���ֳ���DC���Ͷ�Ӧ��ͨ����������:
            DC1001(#IMOS_DT_DC1001): 1
            DC2004(#IMOS_DT_DC2004_FF)/VL2004(#IMOS_DT_VL2004): 4
            DC1801(#IMOS_DT_DC1801_FH): 1
        */
        public UInt32 ulChannum;

        /** �Ƿ�֧���鲥, 1Ϊ֧���鲥; 0Ϊ��֧���鲥 */
        public UInt32 ulIsMulticast;

        /** ���¸澯�¶�����, ȡֵΪ-100~49 */
        public Int32 lTemperatureMax;

        /** ���¸澯�¶�����, ȡֵΪ50~100 */
        public Int32 lTemperatureMin;

        /** �澯ʹ��, 1Ϊʹ�ܸ澯; 0Ϊ��ʹ�ܸ澯 */
        public UInt32 ulEnableAlarm;

        /** ������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** ʱ��ͬ����ʽ��Ĭ��Ϊ1����ʾʹ��H3C��˽��ͬ����ʽ��2��ʾNTP��ͬ����ʽ */
        public UInt32 ulTimeSyncMode;

        /** ʱ��, ȡֵΪ-12~12 */
        public Int32 lTimeZone;

        /** �������ã������ķ����������ã�ȡֵΪ:#TD_LANGUAGE_E */
        public UInt32 ulLanguage;

        /** ��ʽ, ȡֵΪ#IMOS_PICTURE_FORMAT_E */
        public UInt32 ulStandard;

        /** ���ײͣ�ȡֵΪ#IMOS_STREAM_RELATION_SET_E
            ����Ϊ���������ײ�ֵ��
            1��H264(#IMOS_SR_H264_SHARE)
            3: MJPEG(#IMOS_SR_H264_MJPEG)
            4��MEPG4(#IMOS_SR_MPEG4_SHARE)
            5��MEPG2(#IMOS_SR_MPEG2_SHARE)
        */
        public UInt32 ulEncodeSet;

        /** �豸�������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_PASSWD_ENCRYPT_LEN)]
        public byte[] szDevPasswd;

        /** �豸����, Ŀǰ���ֶ�δʹ�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szDevDesc;

        /** DC��IP��ַ,��Ӽ��޸�DC������д�ò���,��ѯDC��Ϣʱ�᷵�ظ��ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szDCIPAddr;

        /** EC������״̬,��Ӽ��޸�EC������д�ò���, ��ѯEC��Ϣʱ���ظ��ֶ�, 1Ϊ����; 0Ϊ���� */
        public UInt32 ulIsDCOnline;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 96)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct DC_QUERY_ITEM_S
    {
        /** DC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szDCCode;

        /** DC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szDCName;

        /** DC���ͣ�ȡֵΪ#IMOS_DEVICE_TYPE_E */
        public UInt32 ulDCType;

        /** DC�豸��ַ���ͣ�1-IPv4 2-IPv6 */
        public UInt32 ulDevaddrtype;

        /** DC�豸��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szDevAddr;

        /** DC������֯���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DOMAIN_CODE_LEN)]
        public byte[] szOrgCode;

        /** �豸�Ƿ�����, ȡֵΪ#IMOS_DEV_STATUS_ONLINE��#IMOS_DEV_STATUS_OFFLINE����imos_def.h�ж��� */
        public UInt32 ulIsOnline;

        /** �豸��չ״̬��ö��ֵΪ#DEV_EXT_STATUS_E */
        public UInt32 ulDevExtStatus;

        /** �Ƿ�֧���鲥, 1Ϊ֧���鲥; 0Ϊ��֧���鲥 */
        public UInt32 ulIsMulticast;

        /** �澯ʹ��, 1Ϊʹ�ܸ澯; 0Ϊ��ʹ�ܸ澯 */
        public UInt32 ulEnableAlarm;

        /** ���ײ����ͣ�ȡֵΪ#IMOS_STREAM_RELATION_SET_E */
        public UInt32 ulEncodeType;

        /** ��ʽ, ȡֵΪ#IMOS_PICTURE_FORMAT_E */
        public UInt32 ulStandard;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CAMERA_INFO_S
    {
        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szCameraCode;

        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szCameraName;

        /** ���������, ȡֵΪ#CAMERA_TYPE_E */
        public UInt32 ulCameraType;

        /** ���������, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szCameraDesc;

        /** ��̨����Э��, Ŀǰ֧�ֵİ���:PELCO-D, PELCO-P, ALEC, VISCA, ALEC_PELCO-D, ALEC_PELCO-P, MINKING_PELCO-D, MINKING_PELCO-P */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szPtzProtocol;

        /** ��̨��ַ��, ȡֵΪ0~255, ����ȡֵ����̨�������ʵ�ʵ�ַ����� */
        public UInt32 ulPtzAddrCode;

        /** ��̨Э�鷭��ģʽ,Ŀǰֻ����дΪ#PTZ_TRANSLATE_EP(�ն˷���ģʽ) */
        public UInt32 ulPtzTranslateMode;

        /** ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szLongitude;

        /** γ�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szLatitude;

        /** ����λ�����趨��Ԥ��λ�ı�����Ӧ */
        public UInt32 ulGuardPosition;

        /** �Զ�����ʱ��, ��λΪ��, ��󲻳���3600��, 0��ʾ������ */
        public UInt32 ulAutoGuard;

        /** �豸����, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szDevDesc;

        /** EC���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szECCode;

        /** EC��IP��ַ,�ڰ󶨼��޸�Cameraʱ,������д,��ѯCamera��Ϣʱ�᷵�ظ��ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szECIPAddr;

        /** ����ECͨ��������, �Ӿ���������� */
        public UInt32 ulChannelIndex;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

        /**
 * @struct tagXpStreamInfo
 * @brief XPʵʱ�������Ϣ�ṹ
 * @attention
 */
    [StructLayout(LayoutKind.Sequential)]
    public struct XP_STREAM_INFO_S
    {
        /** ֧�ֵĵ��鲥���ͣ�0Ϊ��֧�ֵ�����1Ϊ��֧�ֵ���Ҳ֧���鲥 */
        public UInt32 ulStreamType;

        /** ֧�ֵ�������Э�� �μ�#IMOS_TRANS_TYPE_E��ĿǰXPֻ֧������Ӧ��TCP */
        public UInt32 ulStreamTransProtocol;

        /** ֧�ֵ������䷽ʽ �μ�#IMOS_STREAM_SERVER_MODE_E��ĿǰXPֻ֧������Ӧ��ֱ������ */
        public UInt32 ulStreamServerMode;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;       
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VIN_CHANNEL_S
    {
        /** ��Ƶ����ͨ������ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szVinChannelDesc;

        /** �鲥��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szMulticastAddr;

        /** �鲥�˿�,��ΧΪ��10002-65534���ұ���Ϊż�� */
        public UInt32 ulMulticastPort;

        /** MSѡ�����Ӧ����, 1Ϊ����Ӧ; 0Ϊ������Ӧ */
        public UInt32 ulIsAutofit;

        /** ʹ��MS��Ŀ, ��ʵ���������, ����Ӧ����#ulIsAutofitΪ����Ӧ, ��ֵΪ0;
            ����Ӧ����#ulIsAutofitΪ������Ӧ(��ָ��), ��ֵΪ1 */
        public UInt32 ulUseMSNum;

        /** MS�����б� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = (IMOSSDK.IMOS_MS_MAX_NUM_PER_CHANNEL * IMOSSDK.IMOS_DEVICE_CODE_LEN))]
        public byte[,] aszMSCode;

        /** �Ƿ�����ͼ���ڵ����澯, 1Ϊ����; 0Ϊ������ */
        public UInt32 ulEnableKeepout;

        /** �Ƿ������˶����澯, 1Ϊ�����˶����澯; 0Ϊ�������˶����澯 */
        public UInt32 ulEnableMotionDetect;

        /** �Ƿ�������Ƶ��ʧ�澯, 1Ϊ������Ƶ��ʧ�澯; 0Ϊ��������Ƶ��ʧ�澯 */
        public UInt32 ulEnableVideoLost;

        /** �󶨵Ĵ��ڱ�ţ���������д0 */
        public UInt32 ulSerialIndex;

        /** ���ȣ�ȡֵΪ��0~255�� */
        public UInt32 ulBrightness;

        /** �Աȶȣ�ȡֵΪ��0~255�� */
        public UInt32 ulContrast;

        /** ���Ͷȣ�ȡֵΪ��0~255�� */
        public UInt32 ulSaturation;

        /** ɫ����ȡֵΪ��0~255�� */
        public UInt32 ulTone;

        /** �Ƿ���������, 1Ϊ��������; 0Ϊ���������� */
        public UInt32 ulAudioEnabled;

        /** ��Ƶ����, ȡֵΪ#IMOS_AUDIO_FORMAT_E */
        public UInt32 ulAudioCoding;

        /** ��Ƶ����, ȡֵΪ#IMOS_AUDIO_CHANNEL_TYPE_E */
        public UInt32 ulAudioTrack;

        /** ��Ƶ������, ȡֵΪ#IMOS_AUDIO_SAMPLING_E */
        public UInt32 ulSamplingRate;

        /** ��Ƶ����, �������� */
        public UInt32 ulAudioCodeRate;

        /** ��Ƶ����ֵ��ȡֵΪ��0~255�� */
        public UInt32 ulIncrement;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VIDEO_STREAM_S
    {
        /** ��������, ȡֵΪ#IMOS_STREAM_TYPE_E, Ŀǰ��֧��#IMOS_ST_TS */
        public UInt32 ulStreamType;

        /** ��������1Ϊ������2Ϊ���� */
        public UInt32 ulStreamIndex;

        /** ��ʹ�ܱ�ʶ, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnabledFlag;

        /** �����䷽ʽ, ȡֵΪ#IMOS_TRANS_TYPE_E */
        public UInt32 ulTranType;

        /** �����ʽ, ȡ���ھ�������ײ�ֵ, ȡֵΪ#IMOS_VIDEO_FORMAT_E */
        public UInt32 ulEncodeFormat;

        /** �ֱ���, ȡֵΪ#IMOS_PICTURE_SIZE_E */
        public UInt32 ulResolution;

        /** ���� */
        public UInt32 ulBitRate;

        /** ֡��,��ȡ��ֵ��1, 3, 5, 8, 10, 15, 20, 25, 30 */
        public UInt32 ulFrameRate;

        /** GOPģʽ, ȡֵΪ#IMOS_GOP_TYPE_E */
        public UInt32 ulGopMode;

        /** I֡���, ȡ����GOPģʽֵ, ��GOPģʽΪ#IMOS_GT_Iʱ, I֡���Ϊ1; ��GOPģʽΪ#IMOS_GT_IPʱ, I֡���Ϊ10~50 */
        public UInt32 ulIFrameInterval;

        /** ͼ������, ȡֵΪ#IMOS_VIDEO_QUALITY_E */
        public UInt32 ulImageQuality;

        /** ������ģʽ, ȡֵΪ#IMOS_ENC_MODE_E */
        public UInt32 ulEncodeMode;

        /** ���ȼ�, ���ڱ���ģʽΪ#IMOS_EM_CBRʱ�����ø�ֵ, ȡֵΪ#IMOS_CBR_ENC_MODE_E */
        public UInt32 ulPriority;

        /** ����ƽ����ȡֵΪ#IMOS_STREAM_SMOOTH_E */
        public UInt32 ulSmoothValue;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct AREA_SCOPE_S
    {
        /** ���Ͻ�x����, ȡֵΪ0~100 */
        public UInt32 ulTopLeftX;

        /** ���Ͻ�y����, ȡֵΪ0~100 */
        public UInt32 ulTopLeftY;

        /** ���½�x����, ȡֵΪ0~100 */
        public UInt32 ulBottomRightX;

        /** ���½�y����, ȡֵΪ0~100 */
        public UInt32 ulBottomRightY;

    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VIDEO_AREA_S
    {
        /** ��������, ȡֵΪ1~4 */
        public UInt32 ulAreaIndex;

        /** �Ƿ�ʹ��, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnabledFlag;

        /** ������, 1��5����1����������ߡ���ֵ�����˶����������Ч */
        public UInt32 ulSensitivity;

        /** �������� */
        public AREA_SCOPE_S stAreaScope;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct DETECT_AREA_S
    {
        /** �ڵ�������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DETECT_AREA_MAXNUM)]
        public VIDEO_AREA_S[] astCoverDetecArea;

        /** �˶�������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DETECT_AREA_MAXNUM)]
        public VIDEO_AREA_S[] astMotionDetecArea;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct DEV_CHANNEL_INDEX_S
    {
        /** �豸���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szDevCode;

        /** �豸���ͣ����豸Ϊ������ʱ, ȡֵΪ#IMOS_TYPE_EC; ���豸Ϊ������ʱ, ȡֵΪ#IMOS_TYPE_DC */
        public UInt32 ulDevType;

        /** ͨ�������ţ���Ϊ:��Ƶ��Ƶͨ��������ͨ����������ͨ��(����/���), ȡֵ�Ӿ�������� */
        public UInt32 ulChannelIndex;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct SCREEN_INFO_S
    {
        /** ���������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szScreenCode;

        /** ���������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szScreenName;

        /** ����������, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szDevDesc;

        /**  DC��IP��ַ, �ڰ󶨼��޸�Screenʱ, ������д; ��ѯScreen��Ϣʱ�᷵�ظ��ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szDCIPAddr;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VOUT_CHANNEL_S
    {
        /** �߼����ͨ������, ȡֵΪ1~#IMOS_DC_LOGIC_CHANNEL_MAXNUM */
        public UInt32 ulVoutChannelindex;

        /** �߼����ͨ������, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szVoutChannelDesc;

        /** �Ƿ�ʹ��, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnable;

        /** ��������, ȡֵΪ#IMOS_STREAM_TYPE_E, Ŀǰ��֧��#IMOS_ST_TS */
        public UInt32 ulStreamType;

        /** ������ģʽ, ȡֵΪ#IMOS_TRANS_TYPE_E */
        public UInt32 ulTranType;

        /** �Ƿ�����������, 1Ϊ����; 0Ϊ������ */
        public UInt32 ulEnableJitterBuff;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct OSD_TIME_S
    {
        /** ʱ��OSD����, �̶�Ϊ1 */
        public UInt32 ulOsdTimeIndex;

        /** ʱ��OSDʹ��, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnableFlag;

        /** ʱ��OSDʱ���ʽ */
        public UInt32 ulOsdTimeFormat;

        /** ʱ��OSD���ڸ�ʽ */
        public UInt32 ulOsdDateFormat;

        /** ʱ��OSD��ɫ, ȡֵΪ#IMOS_OSD_COLOR_E */
        public UInt32 ulOsdColor;

        /** ʱ��OSD͸����, ȡֵΪ#IMOS_OSD_ALPHA_E */
        public UInt32 ulTransparence;

        /** ʱ��OSD�������� */
        public AREA_SCOPE_S stAreaScope;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct OSD_NAME_S
    {
        /** �Ƿ�ʹ�ܳ���OSD, 1Ϊʹ��; 0Ϊ��ʹ�� */
        public UInt32 ulEnabledFlag;

        /** ����OSD����, �̶�Ϊ1 */
        public UInt32 ulOsdNameIndex;

        /** ����OSD��ɫ, ȡֵΪ#IMOS_OSD_COLOR_E */
        public UInt32 ulOsdColor;

        /** ����OSD͸����, ȡֵΪ#IMOS_OSD_ALPHA_E */
        public UInt32 ulTransparence;

        /** ����OSD�������� */
        public AREA_SCOPE_S stAreaScope;

        /** ��һ��(��)����OSD����, ȡֵΪ#IMOS_INFO_OSD_TYPE_E */
        public UInt32 ulOsdType1;

        /** ��һ��(��)����OSD���ݣ������֣���ֵΪ�ַ������Ϊ20�ַ�����ͼƬ����ֵΪOSDͼƬ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szOsdString1;

        /** �ڶ���(��)����OSD����, ȡֵΪ#IMOS_INFO_OSD_TYPE_E */
        public UInt32 ulOsdType2;

        /** �ڶ���(��)����OSD���ݣ������֣���ֵΪ�ַ������Ϊ20�ַ�����ͼƬ����ֵΪOSDͼƬ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szOsdString2;

        /** (��һ���͵ڶ���)����OSD֮����л�ʱ��, ��λΪ��, ȡֵΪ0~300��ȡֵΪ0, ��ʾֻ��ʾ��һ��(��)OSD */
        public UInt32 ulSwitchIntval;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 16)]
        public byte[] szReserve;
    }

    /// <summary>
    /// �澯����Ϣ�ṹ��
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct AS_ALARMPUSH_UI_S
    {
        /// <summary>
        /// �澯�¼�����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] byAlarmEventCode;

        /// <summary>
        /// �澯Դ����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] byAlarmSrcCode;

        /// <summary>
        /// �澯Դ����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] byAlarmSrcName;

        /// <summary>
        /// ʹ�ܺ�����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] byActiveName;

        /// <summary>
        /// �澯���� AlARM_TYPE_E ��sdk_def.h�ж���
        /// </summary>
        public UInt32 ulAlarmType;

        /// <summary>
        /// �澯���� ALARM_SEVERITY_LEVEL_E ��sdk_def.h�ж���
        /// </summary>
        public UInt32 ulAlarmLevel;

        /// <summary>
        /// �澯����ʱ��
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] byAlarmTime;

        /// <summary>
        /// �澯������Ϣ
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] byAlarmDesc;

    }
    [StructLayout(LayoutKind.Sequential)]
    public struct OSD_MASK_AREA_S
    {
        /** �ڸ����� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_MASK_AREA_MAXNUM)]
        public VIDEO_AREA_S[] astMaskArea;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct OSD_INFO_S
    {
        /** ʱ��OSD */
        public OSD_TIME_S stOSDTime;

        /** ����OSD */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_OSD_NAME_MAXNUM)]
        public OSD_NAME_S[] astOSDName;

        /** �ڸ����� */
        public OSD_MASK_AREA_S stOSDMaskArea;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct PHYOUT_CHANNEL_S
    {
        /** ����ģʽ��ȡֵΪ1��4������BNC�ڵķ����� */
        public UInt32 ulPhyoutMode;

        /** ��Ƶ�����ʽ��ȡֵΪ#IMOS_VIDEO_FORMAT_E */
        public UInt32 ulDecodeFormat;

        /** ��Ƶ��ʽ��ȡֵΪ#IMOS_AUDIO_FORMAT_E */
        public UInt32 ulAudioFormat;

        /** �������ã�ȡֵΪ#IMOS_AUDIO_CHANNEL_TYPE_E */
        public UInt32 ulAudioTrack;

        /** �Ƿ�������������, 1Ϊ����; 0Ϊ������ */
        public UInt32 ulAudioEnabled;

        /** �������, ȡֵΪ1~7 */
        public UInt32 ulVolume;

        /** ��Ƶ���ѡ��, �ӹ���ģʽ����#ulPhyoutMode�������������ģʽȡֵΪ1, ���ֵΪ1; �������ģʽȡֵΪ4, ���ֵȡֵΪ1~4 */
        public UInt32 ulOutputIndex;

        /** ������������, ��ʾ������ͨ�����ɰ󶨵ļ���������, Ŀǰ�̶�Ϊ1 */
        public UInt32 ulMaxScreenNum;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct VINCHNL_BIND_CAMERA_S
    {
         /** �豸ͨ��������Ϣ */
        public DEV_CHANNEL_INDEX_S stECChannelIndex;

        /** �������Ϣ */
        public CAMERA_INFO_S stCameraInfo;

        /** ��Ƶ����ͨ����Ϣ */
        public VIN_CHANNEL_S stVinChannel;

        /** OSD��Ϣ */
        public OSD_INFO_S stOSDInfo;

        /** ��Ƶ����������Ƶ����ʵ����Ŀ, ���ȡֵΪ#IMOS_STREAM_MAXNUM, �Ӿ������ײ�ֵ���� */
        public UInt32 ulVideoStreamNum;

        /** ��Ƶ����Ϣ���� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_STREAM_MAXNUM)]
        public VIDEO_STREAM_S[] astVideoStream;

        /** ������򣬰����˶�����Լ��ڵ�������� */
        public DETECT_AREA_S stDetectArea;
    }


    [StructLayout(LayoutKind.Sequential)]
    public struct VOUTCHNL_BIND_SCREEN_S
    {
        /** �豸ͨ��������Ϣ */
        public DEV_CHANNEL_INDEX_S stDCChannelIndex;

        /** ��������Ϣ */
        public SCREEN_INFO_S stScreenInfo;

        /** �߼����ͨ����Ϣ */
        public VOUT_CHANNEL_S stVoutChannel;

        /** OSD��Ϣ */
        public OSD_INFO_S stOSDInfo;

        /** �������ͨ����Ϣ */
        public PHYOUT_CHANNEL_S stPhyoutChannel;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct XP_RUN_INFO_EX_S
    {
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public Byte[] szPortCode;     /**< ͨ����Դ���� */
       
        public UInt32 ulErrCode;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct CAM_AND_CHANNEL_QUERY_ITEM_S 
    {
        /** �豸ͨ��������Ϣ */
        public DEV_CHANNEL_INDEX_S stECChannelIndex;

        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szCamCode;

        /** ��������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szCamName;

        /** ���������, ȡֵΪ#CAMERA_TYPE_E */
        public UInt32 ulCamType;

        /** ��̨����Э�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szPtzProtocol;

        /** ��̨��ַ��, ȡֵΪ0~255, ����ȡֵ����̨�������ʵ�ʵ�ַ����� */
        public UInt32 ulPtzAddrCode;

        /** �鲥��ַ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_IPADDR_LEN)]
        public byte[] szMulticastAddr;

        /** �鲥�˿�, ��ΧΪ��10002-65534 */
        public UInt32 ulMulticastPort;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct SCR_AND_CHANNEL_QUERY_ITEM_S
    {
        /** �豸ͨ��������Ϣ */
        public DEV_CHANNEL_INDEX_S stDCChannelIndex;

        /** ���������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szScrCode;

        /** ���������� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szScrName;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct SPLIT_SCR_INFO_S
    {
        /** ����ģʽ,ȡֵΪ#SPLIT_SCR_MODE_E */
        public UInt32 ulSplitScrMode;

        /** ��������(ȫ��ʱ��Ч) */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_CODE_LEN)]
        public byte[] szSplitScrCode;

        /** �Ƿ�"�Զ��л�������"(#BOOL_TRUE ��,#BOOL_FALSE ��)  */
        public UInt32 bSwitchStream;

        /** Ԥ���ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 128)]
        public byte[] szReserve;
    }
    /// <summary>
    ///  ¼�����Ϣ�ṹ
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct UNITED_REC_FILE_INFO_S
    {
        /** �ļ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_FILE_NAME_LEN_V2)]
        public byte[] szFileName;

        /** �ļ���ʼʱ��*/
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szStartTime;

        /** �ļ�����ʱ�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szEndTime;

        /** �ļ���С, Ŀǰ�ݲ�ʹ�� */
        public uint ulSize;

        /** �򼶱����������¼��Ϊ0���ͼ���¼��������ۼ� */
        public uint ulDomainLevel;

        /** ������Ϣ, �ɲ��� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DESC_LEN)]
        public byte[] szSpec;

        /* Ԥ���ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 128)]
        public byte[] szReserved;

        public static UNITED_REC_FILE_INFO_S GetInstance()
        {
            UNITED_REC_FILE_INFO_S instance = new UNITED_REC_FILE_INFO_S();

            instance.szFileName = new byte[IMOSSDK.IMOS_FILE_NAME_LEN_V2];
            instance.szStartTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            instance.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            instance.ulSize = 0;
            instance.ulDomainLevel = 0;
            instance.szSpec = new byte[IMOSSDK.IMOS_DESC_LEN];
            instance.szReserved = new byte[128];

            return instance;
        }
    }


    /// <summary>
    /// �����ļ�����Ϣ��(��ѯ����������ļ�ʱ����)
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct CAM_BAK_FILE_QUERY_ITEM_S
    {
        /// <summary>
        /// �����ļ�����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_RES_CODE_LEN)]
        public byte[] szBakFileCode;

        /// <summary>
        ///  BM����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szBMCode;

        /// <summary>
        /// BM����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szBMName;

        /// <summary>
        /// ���������
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_DEVICE_CODE_LEN)]
        public byte[] szCamCode;

        /// <summary>
        /// ���������
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szCamName;

        /// <summary>
        /// ���������, ȡֵΪ#CameraType
        /// </summary>
        public UInt32 ulCameraType;

        /// <summary>
        /// �����ļ��洢·��
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_FILE_PATH_LEN)]
        public byte[] szBakFilePath;

        /// <summary>
        /// �ļ�����ʱ��
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szFileCreateTime;

        /// <summary>
        /// ����ʱ��:��ʼ������
        /// </summary>
        public TIME_SLICE_S stBakTime;

        /// <summary>
        /// �ļ���������MBΪ��λ
        /// </summary>
        public UInt32 ulFileCapacity;

        /// <summary>
        /// ������Դ����
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_CODE_LEN)]
        public byte[] szBakResCode;

        /// <summary>
        /// �ļ�����#BAK_TYPE_E
        /// </summary>
        public UInt32 ulFileType;

        /// <summary>
        /// �ļ������ʽ��0-TS��1-h3crd
        /// </summary>
        public UInt32 ulFileFormat;

        /// <summary>
        /// �����ļ�״̬��ʶ��0-�����ļ���1-�����ļ�
        /// </summary>
        public UInt32 ulFileStatus;

        /// <summary>
        /// �Ƿ�������ʶ��0-δ������1-����
        /// </summary>
        public UInt32 ulLockFlag;

        /// <summary>
        /// ��������
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_BAK_CASE_LEN)]
        public byte[] szCaseDesc;
    }

    /// <summary>
    ///  ͳһ¼�������Ӧ��Ϣ
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct REC_RSP_ROW_INFO_S
    {
        /** ʵ�ʷ��ص�¼�����Ŀ */
        public uint ulRowNum;

        /** �Ƿ������� */
        public uint bHasMoreRow;

        /** ����¼����ܽ���ʱ�� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_TIME_LEN)]
        public byte[] szEndTime;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 32)]
        public byte[] szReserve;

        public static REC_RSP_ROW_INFO_S GetInstance()
        {
            REC_RSP_ROW_INFO_S instance = new REC_RSP_ROW_INFO_S();
            instance.ulRowNum = 0;
            instance.bHasMoreRow = 0;
            instance.szEndTime = new byte[IMOSSDK.IMOS_TIME_LEN];
            instance.szReserve = new byte[32];
            return instance;
        }
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct RES_ITEM_V2_S
    {
        /** V1��Դ��Ϣ�� */
        public ORG_RES_QUERY_ITEM_S stResItemV1;

        /** ��Դ������֯������ */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = IMOSSDK.IMOS_NAME_LEN)]
        public byte[] szOrgName;

        /** ��Դ������Ϣ��������Դ�����������ʱ��ȡֵΪ#CAMERA_ATTRIBUTE_E��������Դ���͸��ֶ���δʹ�� */
        public UInt32 ulResAttribute;

        /** �����ECR HFϵ�е���������߼��������ڵ��豸�����ײͣ�
            ������Դ����,����ͨ�ò�ѯ����IS_QUERY_ENCODESETû����д, ��������"����ѯ", ���ֶξ�Ϊ��Чֵ#IMOS_SR_INVALID
            ȡֵΪ#IMOS_STREAM_RELATION_SET_E */
        public UInt32 ulDevEncodeSet;

        /** �����ֶ� */
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 184)]
        public byte[] szReserve;

        public static RES_ITEM_V2_S GetInstance(ORG_RES_QUERY_ITEM_S stRes)
        {
            RES_ITEM_V2_S stRes_V2 = new RES_ITEM_V2_S();
            stRes_V2.stResItemV1 = stRes;
            stRes_V2.szOrgName = new byte[IMOSSDK.IMOS_NAME_LEN];
            stRes_V2.szReserve = new byte[184];
            stRes_V2.ulDevEncodeSet = 0;
            stRes_V2.ulResAttribute = 0;
            return stRes_V2;
        }
    }

    public class IMOSSDK
    {

        public const int IMOS_NAME_LEN = 64;

        public const int IMOS_CODE_LEN = 48;

        public const int IMOS_IPADDR_LEN = 64;

        /*@brief ��Դ������Ϣ�ַ�������*/
        public const int IMOS_RES_CODE_LEN = IMOS_CODE_LEN;

        /*@brief �豸������Ϣ�ַ�������*/
        public const int IMOS_DEVICE_CODE_LEN = IMOS_CODE_LEN;

        /*@brief �û�������Ϣ�ַ�������*/
        public const int IMOS_USER_CODE_LEN = IMOS_CODE_LEN;

        /*@brief �������Ϣ�ַ�������*/
        public const int IMOS_DOMAIN_CODE_LEN = IMOS_CODE_LEN;

        /*@brief ��������Ϣ�ַ������� */
        public const int IMOS_DOMAIN_NAME_LEN = IMOS_NAME_LEN;

        /*@brief Ȩ�ޱ�����Ϣ�ַ�������*/
        public const int IMOS_AUTH_CODE_LEN = IMOS_CODE_LEN;

        //ÿ�β�ѯʱ���ص������������Ľ���ĸ���
        public const int QUERY_ITEM_MAX = 200;

        /*@brief imos_time ʱ����Ϣ�ַ������� "2008-10-02 09:25:33.001 GMT" */
        public const int IMOS_TIME_LEN = 32;

        /// <summary>
        /// �ļ�����·��(·��+�ļ���)����
        /// </summary>
        public const int IMOS_FILE_PATH_LEN = 256;
        /// <summary>
        /// ����¼��������
        /// </summary>
        public const int IMOS_BAK_CASE_LEN = 128;
        /// <summary>
        /// �ļ�������(V2)
        /// </summary>
        public const int IMOS_FILE_NAME_LEN_V2 = 256;

        /*@brief �ļ������� */
        public const int IMOS_FILE_NAME_LEN = 64;

        public const uint ERR_XP_FAIL_TO_SETUP_PROTOCOL = 0x0007B0;      /**< ��������Э��ʧ�� */
        public const uint ERR_XP_FAIL_TO_PLAY_PROTOCOL = 0x0007B1;      /**< ����Э�̲���ʧ�� */
        public const uint ERR_XP_FAIL_TO_PAUSE_PROTOCOL = 0x0007B2;      /**< ����Э����ͣʧ�� */
        public const uint ERR_XP_FAIL_TO_STOP_PROTOCOL = 0x0007B3;      /**< ֹͣ����Э��ʧ�� */
        public const uint ERR_XP_RTSP_COMPLETE = 0x0007B4;      /**< RTSP���Ż�������� */
        public const uint ERR_XP_RTSP_ABNORMAL_TEATDOWN = 0x0007B5;      /**< RTSP�쳣���ߣ���������ȡ�ļ���������ݱ���д */
        public const uint ERR_XP_RTSP_KEEP_LIVE_TIME_OUT = 0x0007B6;      /**< RTSP����ʧ�� */
        public const uint ERR_XP_RTSP_ENCODE_CHANGE = 0x0007B7;      /**< RTSP��������ʽ�л� */
        public const uint ERR_XP_RTSP_DISCONNECT = 0x0007B8;      /**< RTSP���ӶϿ����㲥�طŻ��������Զ���ֹ���������� */

        public const uint ERR_XP_DISK_CAPACITY_WARN = 0x00079B;      /**< Ӳ��ʣ��ռ������ֵ */
        public const uint ERR_XP_DISK_CAPACITY_NOT_ENOUGH = 0x00079C;     /**< Ӳ��ʣ��ռ䲻�㣬�޷�����ҵ�� */
        public const uint ERR_XP_FAIL_TO_WRITE_FILE = 0x000723;     /**< д�ļ�����ʧ�� */
        public const uint ERR_XP_FAIL_TO_PROCESS_MEDIA_DATA = 0x0007A9;   /**< ý�����ݴ���ʧ�� */
        public const uint ERR_XP_NOT_SUPPORT_MEDIA_ENCODE_TYPE = 0x000735;/**< ����ͨ����ý������ʽ��֧�ִ˲��� */
        public const uint ERR_XP_MEDIA_RESOLUTION_CHANGE = 0x000736;      /**< ����ͨ����ý�����ֱ��ʷ����仯 */

        /*@brief imos_description ������Ϣ�ַ������� */
        public const int IMOS_DESC_LEN = (128 * 3);

        public const int IMOS_IE_URL_LEN = 512;

        public const int IMOS_PASSWD_ENCRYPT_LEN = 64;

        public const int IMOS_QUERY_ITEM_MAX_NUM = 16;

        public const int IMOS_QUERY_DATA_MAX_LEN = 64;

        public const int IMOS_DEV_STATUS_ONLINE = 1;

        public const int IMOS_DEV_STATUS_OFFLINE = 2;

        public const int IMOS_STREAM_MAXNUM = 2;

        public const int IMOS_MS_MAX_NUM_PER_CHANNEL = 1;

        public const int IMOS_DETECT_AREA_MAXNUM = 4;

        public const int IMOS_MASK_AREA_MAXNUM = 4;

        public const int IMOS_OSD_NAME_MAXNUM = 1;

        

        public static LOGIN_INFO_S stLoginInfo;
        public static XP_INFO_S stXpInfo;
        public static PLAY_WND_INFO_S[] astPlayWndInfo = new PLAY_WND_INFO_S[25];

        
        public static System.Timers.Timer timerKeepalive;

        public delegate void MethodInvoke1<T>(T Param);

        public static string UTF8ToUnicode(byte[] bufferIn)
        {

            byte[] buffer = Encoding.Convert(Encoding.UTF8, Encoding.Default, bufferIn, 0, bufferIn.Length);
            return Encoding.Default.GetString(buffer, 0, buffer.Length);
        }

        public static byte[] UnicodeToUTF8(string buffIn)
        {
            byte[] buffer = Encoding.Default.GetBytes(buffIn);
            return Encoding.Convert(Encoding.Default, Encoding.UTF8, buffer, 0, buffer.Length);
        }

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_Initiate(String strServerIP, UInt32 ulServerPort, UInt32 bUIFlag, UInt32 bXPFlag);

        /// <summary>
        /// xp��Ϣ�ص�����Ҫ���ڽ���һЩXP�����Ϣ
        /// </summary>
        /// <param name="stUserLoginIDInfo"></param>
        /// <param name="ulRunInfoType"></param>
        /// <param name="ptrInfo"></param>
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_RUN_INFO_CALLBACK_EX_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, UInt32 ulRunInfoType, IntPtr pParam);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_Encrypt(String strInput, UInt32 ulInLen, IntPtr ptrOutput);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_Login(String strUserLoginName, String strPassword, String strIpAddr, IntPtr ptrSDKLoginInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_LoginEx(String strUserLoginName, String strPassword, String srvIpAddr, String cltIpAddr, IntPtr ptrSDKLoginInfo);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_PlaySound(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_CleanUp(IntPtr  pstUserLogIDInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UserKeepAlive(ref USER_LOGIN_ID_INFO_S stUserLoginInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartMonitor(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCameraCode, byte[] szMonitorCode, UInt32 ulStreamType, UInt32 ulOperateCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopMonitor(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szMonitorCode, UInt32 ulOperateCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryResourceList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szOrgCode, UInt32 ulResType, UInt32 ptrQueryCondition, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrResList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryResourceListV2(ref USER_LOGIN_ID_INFO_S pstUserLogIDInfo, byte[] szOrgCode, ref COMMON_QUERY_CONDITION_S pstQueryCondition, ref QUERY_PAGE_INFO_S pstQueryPageInfo, ref RSP_PAGE_INFO_S pstRspPageInfo, IntPtr pstResList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_Logout(ref USER_LOGIN_ID_INFO_S stUserLoginInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void IMOS_LogoutEx(ref USER_LOGIN_ID_INFO_S stUserLoginInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_CleanUp(ref USER_LOGIN_ID_INFO_S stUserLoginInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_CleanUp(string strLoginInfo);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetChannelCode(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, IntPtr pcChannelCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartPtzCtrl(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ReleasePtzCtrl(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode, UInt32 bReleaseSelf);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryPresetList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode, ref QUERY_PAGE_INFO_S stQueryPageInfo, ref RSP_PAGE_INFO_S ptrRspPage, IntPtr pstPresetList);
       
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPreset(ref USER_LOGIN_ID_INFO_S pstUserLogIDInfo, byte[] szCamCode, ref PRESET_INFO_S pstPreset);

        /// <summary>
        /// ɾ��Ԥ��λ
        /// </summary>
        /// <param name="pstUserLogIDInfo">�û���¼ID��Ϣ��ʶ</param>
        /// <param name="szCamCode">���������</param>
        /// <param name="ulPresetValue">Ԥ��λֵ</param>
        /// <returns></returns>
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_DelPreset(ref USER_LOGIN_ID_INFO_S pstUserLogIDInfo, byte[] szCamCode, UInt32 ulPresetValue);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UsePreset(ref USER_LOGIN_ID_INFO_S pstUserLogIDInfo, byte[] szCamCode, UInt32 ulPresetNum);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_PtzCtrlCommand(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode, ref PTZ_CTRL_COMMAND_S stPTZCommand);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartPlayer(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, UInt32 ulPlayWndNum, IntPtr ptrPlayWndInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopPlayer(ref USER_LOGIN_ID_INFO_S stUserLoginInfo);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPlayWnd(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, IntPtr hWnd);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_RecordRetrieval(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref REC_QUERY_INFO_S stSDKRecQueryInfo, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrSDKRecordFileInfo);

        /// <summary>
        /// ע��ص�����
        /// </summary>
        /// <param name="pstUserLoginIDInfo">������Ϣ</param>
        /// <param name="ptrCallBack">�ص�����</param>
        /// <returns></returns>
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_RegCallBackPrcFunc(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, IntPtr pfnCallBackProc);

        /// <summary>
        /// �澯�ص�����
        /// </summary>
        /// <param name="ulProcType">�澯����</param>
        /// <param name="ptrParam">���ص�����ָ��</param>
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void CALL_BACK_PROC_PF(UInt32 ulProcType, IntPtr ptrParam);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetRecordFileURL(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref GET_URL_INFO_S stSDKGetUrlInfo, ref URL_INFO_S stUrlInfo);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern void IMOS_FreeChannelCode(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, Byte[] pcChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_OpenVodStream(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, byte[] szVodUrl, byte[] szServerIP, UInt16 usServerPort, UInt32 ulProtl);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartPlay(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_PausePlay(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ResumePlay(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopPlay(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPlaySpeed(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, UInt32 ulPlaySpeed);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetRunMsgCB(IntPtr ptrRunInfoFunc);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetDownloadTime(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, String pcDownloadID, byte[]pszTime);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_OneByOne(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPlayedTime(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, byte[] szTime);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPlayedTimeEx(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, UInt32 ulTime);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetPlayedTime(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, IntPtr ptrTime);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetPlayedTimeEx(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, IntPtr ptrTime);
        
        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopDownload(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcDownloadID);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SnatchOnce(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode,  byte[] szFileName, UInt32 ulPicFormat);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SnatchOnceEx(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode,  byte[] szFileName, UInt32 ulPicFormat);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartSnatchSeries(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode,  byte[] szFileName, UInt32 ulPicFormat, UInt32 ulInterval);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopSnatchSeries(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartRecord(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode,  byte[] szFileName, UInt32 ulFileFormat);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartRecordEx(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode,  byte[] szFileName, UInt32 ulFileFormat, IntPtr ptrFilePostfix);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopRecord(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetVideoEncodeType(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, ref UInt32 ptrVideoEncodeType);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetLostPacketRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, IntPtr ptrRecvPktNum, IntPtr ptrLostPktNum);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ResetLostPacketRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetLostFrameRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, IntPtr ptrAllFrameNum, IntPtr ptrLostFrameNum);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ResetLostFrameRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_OpenDownload(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcDownUrl, byte[] pcServerIP, ushort usServerPort, UInt32 ulProtl, UInt32 ulDownMediaSpeed, byte[] pcFileName, UInt32 ulFileFormat, byte[] pcChannelCode);

      
        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StartDownload(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode);



        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetDecoderTag(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, byte[] pcDecorderTag);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetFrameRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, ref UInt32 ptrFrameRate);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetBitRate(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, ref UInt32 ptrBitRate);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_StopSound(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetVolume(UInt32 ulVolume);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetVolume(IntPtr ptrVolume);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetFieldMode(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szChannelCode, UInt32 ulFieldMode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_AdjustAllWaveAudio(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, UInt32 ulCoefficient);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_AdjustPktSeq(Boolean bAdjust);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetRenderMode(UInt32 ulRenderMode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetRealtimeFluency(UInt32 ulFluency);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_XP_SetDeinterlaceMode(UInt32 ulPort, UInt32 ulDeinterlaceMode);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetPixelFormat(UInt32 ulPixelFormat);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigXpStreamInfo(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref XP_STREAM_INFO_S pstXpStreamInfo); 

 

        //EC Camera ���ýӿ�

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_AddEc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref EC_INFO_S stEcInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ModifyEc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref EC_INFO_S stEcInfo, UInt32 IsEncodeChange);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_DelEc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szEcCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryEcList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szOrgCode, IntPtr ptrQueryCondition, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrEcList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryEcInfo(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szEcCode, IntPtr ptrEcInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_BindCameraToVideoInChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref VINCHNL_BIND_CAMERA_S stVinChnlAndCamInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryCameraAndChannelList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szDevCode, IntPtr stQueryCondition, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrCamAndChannelList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ModifyCamera(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref CAMERA_INFO_S stCamInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UnBindCamera(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryCamera(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szCamCode, IntPtr ptrCameraInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigVideoInChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, ref VIN_CHANNEL_S stVideoInChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryECVideoInChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrVideoInChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigECVideoStream(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, ref VIDEO_STREAM_S stVideoStreamInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryECVideoStream(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrStreamNum, IntPtr ptrVideoStreamInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigECMaskAreaOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, UInt32 ulMaskAreaNum, ref VIDEO_AREA_S stMaskArea);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryECMaskAreaOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrMaskAreaNum, IntPtr ptrMaskArea);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigECMotionDetectArea(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, UInt32 ulMotionDetectAreaNum, ref VIDEO_AREA_S stMotionDetectArea);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryECMotionDetectArea(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrMotionDetectAreaNum, IntPtr ptrMotionDetectArea);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigDeviceTimeOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, ref OSD_TIME_S stTimeOSD);

        /// <summary>
        /// ��ɶ������͹���
        /// </summary>
        /// <param name="stUserLoginIDInfo">������Ϣ</param>
        /// <param name="ulSubscribePushType">��������</param>
        /// <returns></returns>
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SubscribePushInfo(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, UInt32 ulSubscribePushType);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDeviceTimeOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrTimeOSD);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigDeviceNameOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, UInt32 ulNameOSDNum, ref OSD_NAME_S stNameOSD);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDeviceNameOSD(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrNameOSDNum, IntPtr ptrNameOSD);

        

        //DC Screen ���ýӿ�
        
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_AddDc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DC_INFO_S stDcInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ModifyDc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DC_INFO_S stDcInfo, UInt32 IsEncodeChange);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_DelDc(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szDcCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDcList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szOrgCode, IntPtr ptrQueryCondition, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrDcList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDcInfo(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szDcCode, IntPtr ptrDcInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_BindScreenToVideoOutChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref VOUTCHNL_BIND_SCREEN_S stVOUTChnlAndScrInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryScreenAndChannelList(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szDevCode, IntPtr ptrQueryCondition, ref QUERY_PAGE_INFO_S stQueryPageInfo, IntPtr ptrRspPage, IntPtr ptrVOUTChnlAndScrList);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ModifyScreen(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref SCREEN_INFO_S stScrInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UnBindScreen(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szScrCode);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryScreen(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szScrCode, IntPtr ptrScreenInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigDCVideoOutChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, UInt32 ulVideoOutNum, ref VOUT_CHANNEL_S stVideoOutChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDCVideoOutChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrVideoOutNum, IntPtr ptrVideoOutChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_ConfigDCPhyOutChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, ref PHYOUT_CHANNEL_S stPhyoutChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QueryDCVideoOutChannel(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, ref DEV_CHANNEL_INDEX_S stChannelIndex, IntPtr ptrPhyoutChannelInfo);

        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_QuerySplitScrInfo(ref USER_LOGIN_ID_INFO_S stUserLoginInfo, byte[] szScrCode, ref SPLIT_SCR_INFO_S ptrSplitInfo);


        /**
        * ƴ֡ǰý�������ݻص�������ָ�����͡�\n
        * @param [IN] pstUserLoginIDInfo    �û���¼ID��Ϣ��ʶ��
        * @param [IN] pcChannelCode         ����ͨ�����롣
        * @param [IN] pBuffer               ���ƴ֡ǰý�������ݻ�����ָ�롣
        * @param [IN] ulBufSize             ��������С��
        * @param [IN] ulMediaDataType       ý�����������ͣ���Ӧ#XP_MEDIA_DATA_FORMAT_Eö���е�ֵ��
        * @param [IN] lUserParam            �û����ò������û��ڵ���IMOS_SetSourceMediaDataCB����ʱָ�����û�������
        * @param [IN] lReserved             ���ƴ֡ǰý������չ��Ϣ������ָ�룬�û���Ҫת��Ϊ#XP_SOURCE_DATA_EX_INFO_S
        *                                   �ṹ��ָ�����ͣ��ں���������ǩ��DecoderTag�������û�ʹ�ò��ſ�������ʾ�ص�
        *                                   ��ý����ʱ���ɸ��ݽ�������ǩָ����������
        * @return �ޡ�
        * @note
        * -     �û�Ӧ��ʱ���������ý�������ݣ�ȷ���������췵�أ������Ӱ�첥�����ڵ�ý��������
        */
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_SOURCE_MEDIA_DATA_CALLBACK_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pBuffer, UInt32 ulBufSize, UInt32 ulMediaDataType, long lUserParam, long lReserved);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetSourceMediaDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam);




        /**
        * ����ƴ֡����Ƶ���ݻص�������\n
        * @param [IN] pstUserLoginIDInfo      �û���¼ID��Ϣ��ʶ��
        * @param [IN] pcChannelCode           ����ͨ�����롣
        * @param [IN] pfnParseVideoDataCBFun  ƴ֡����Ƶ���ݻص�������ָ�롣
        * @param [IN] bContinue               �Ƿ����������Ƶ����Ͳ��Ų�����
        * @param [IN] lUserParam              �û����ò�����
        * @return �������´����룺
        * -         #ERR_COMMON_SUCCEED                      �ɹ�
        * -         #ERR_COMMON_INVALID_PARAM                ��������Ƿ�
        * -         #ERR_XP_PORT_NOT_REGISTER                ����ͨ��û��ע��
        * -         #ERR_XP_FAIL_TO_GET_PORT_RES             ��ò���ͨ����Դʧ��
        * -         #ERR_XP_FAIL_TO_SET_PROCESS_DATA_CB      ����ý�������ݻص�����ʧ��
        * @note
        * - 1��ʵʱ����ʱ���ú�����#IMOS_StartMonitor֮ǰ����֮����ã���#IMOS_StopMonitorʱ�Զ�ʧЧ���´ε���
        *      #IMOS_StartMonitor֮ǰ����֮����Ҫ�������ã��㲥�ط�ʱ���ú�������#IMOS_OpenVodStream֮ǰ���ã�Ҳ��
        *      ��#IMOS_OpenVodStream��#IMOS_StartPlay֮����ã���������#IMOS_StartPlay֮����ã���#IMOS_StopPlayʱ��
        *      ��ʧЧ���´������㲥�ط�ʱ��Ҫ����ͬλ���������ã�
        * - 2���ص�����Ҫ���췵�أ����Ҫֹͣ�ص������԰ѻص�����ָ��#XP_PARSE_VIDEO_DATA_CALLBACK_PF��ΪNULL��
        * - 3���ýӿں���֧��Windows��Linux��
        */
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_PARSE_VIDEO_DATA_CALLBACK_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pstParseVideoData, long lUserParam, long lReserved);


        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetParseVideoDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam);

        /**
        * ƴ֡����Ƶ�����ݻص�������ָ�����͡�\n
        * @param [IN] pstUserLoginIDInfo    �û���¼ID��Ϣ��ʶ��
        * @param [IN] pcChannelCode         ����ͨ�����롣
        * @param [IN] pstParseAudioData     ���ƴ֡����Ƶ��������Ϣ������ָ��
        * @param [IN] lUserParam            �û����ò������û��ڵ���#IMOS_SetParseAudioDataCB����ʱָ�����û�����
        * @param [IN] lReserved             ��������
        * @return �ޡ�
        * @note
        * -     �û�Ӧ��ʱ������������ݣ�ȷ���������췵�أ������Ӱ�첥�����ڵ�ý��������
        */
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_PARSE_AUDIO_DATA_CALLBACK_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pstParseVideoData, long lUserParam, long lReserved);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetParseAudioDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam);

        /**
        * �������Ƶ�����ݻص�������ָ�����͡�\n
        * @param [IN] pstUserLoginIDInfo   �û���¼ID��Ϣ��ʶ��
        * @param [IN] pcChannelCode        ����ͨ�����롣
        * @param [IN] pstPictureData       ��Ž������Ƶ��������Ϣ������ָ�롣
        * @param [IN] lUserParam           �û����ò������û��ڵ���#IMOS_SetDecodeVideoDataCB����ʱָ�����û�������
        * @param [IN] lReserved            ����������
        * @return �ޡ�
        * @note
        * -     1���û�Ӧ��ʱ�����������Ƶ�����ݣ�ȷ���������췵�أ������Ӱ�첥�����ڵ�ý��������
        * -     2����Ƶ������yv12��ʽ������˳��Y0-Y1-......������U0-U1-......������V0-V1-......����
        */
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_DECODE_VIDEO_DATA_CALLBACK_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, IntPtr pstParseVideoData, long lUserParam, long lReserved);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetDecodeVideoDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam);

        /**
        * ����ǰ�������ݻص�������ָ�����͡�\n
        * @param [IN] pstUserLoginIDInfo    �û���¼ID��Ϣ��ʶ��
        * @param [IN] pucVoiceDataBuffer    ��Ž���ǰ����������Ϣ������ָ��
        * @param [IN] ulBufSize             ��Ƶ���ݴ�С
        * @param [IN] ulAudioFlag           ��Ƶ��������,���#XP_AUDIO_FLAG_Eö����ȡֵ
        * @param [IN] pUserParam            �û����ò���
        * @return �ޡ�
        * @note
        * -     �û�Ӧ��ʱ�����������Ƶ�����ݣ�ȷ���������췵�أ������Ӱ�첥�����ڵ�ý��������
        */
        [UnmanagedFunctionPointer(CallingConvention.StdCall, CharSet = CharSet.Ansi)]
        public delegate void XP_DECODE_AUDIO_DATA_CALLBACK_PF(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, string pcChannelCode, XP_WAVE_DATA_S pstWaveData, long lUserParam, long lReserved);

        [DllImport("xp_frame.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SetDecodeAudioDataCB(ref USER_LOGIN_ID_INFO_S pstUserLoginIDInfo, byte[] pcChannelCode, IntPtr ptrSplitInfo, bool bContinue, long lUserParam);

        /**
          * ͳһ¼����� \n
          * @param [IN]   pstUserLogIDInfo            �û���¼ID��Ϣ��ʶ
          * @param [IN]   pstRecQueryInfo             �طż�����Ϣ���ݽṹ
          * @param [IN]   ulRowNum                    ����ļ�¼��
          * @param [OUT]  pstRecRspRowInfo            ���ؼ�¼��Ϣ
          * @param [OUT]  pstUnitedRecFileInfoList    ¼���ļ���Ϣ���ݽṹ��
          * @return �������½����
          * - �ɹ���
          * - ʧ�ܣ�
          * -     ���ز�������룬���������ļ�
          * @note 1����ѯʱ���Ȳ��ܴ���24Сʱ������¼�����������ʱ���ʽΪ��"%Y-%m-%d %H:%M:%S"��ʽ ����Ϣ�����޶�Ϊ24�ַ�.
          *       2���ļ����ַ���������󳤶�ΪIMOS_FILE_NAME_LEN_V2
          */
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UnitedRecordRetrieval(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, ref REC_QUERY_INFO_S stSDKRecQueryInfo,
            uint ulRowNum, ref REC_RSP_ROW_INFO_S stRecRspRowInfo, IntPtr pstSDKRecordFileInfo);

        /**
          * ����¼����� \n
          * @param [IN]   pstUserLogIDInfo        �û���¼ID��Ϣ��ʶ
          * @param [IN]   pstQueryCondition       ͨ�ò�ѯ����
          * @param [IN]   pstQueryPageInfo        �����ҳ��Ϣ
          * @param [OUT]  pstRspPageInfo          ��Ӧ��ҳ��Ϣ
          * @param [OUT]  pstSDKRecordFileInfo    �����ļ���Ϣ���ݽṹ��
          * @return �������½����
          * - �ɹ���
          * - ʧ�ܣ�
          * -     ���ز�������룺��������ļ�sdk_err.h
          * @note
          * - 1��ͨ�ò�ѯ����֧��:���������[#CODE_TYPE]�����������[#NAME_TYPE]���ļ�����ʱ��[#FILE_CREATE_TIME]��
          * -    ���ݿ�ʼʱ��[#BAK_START_TIME]�����ݽ���ʱ��[#BAK_END_TIME]���ļ�����[#FILE_CAPACITY]���ļ�����[#FILE_TYPE]��
          * -    �ļ�������ʶ[#FILE_LOCK_FLAG]����������[#CASE_DESC]�Ĳ�ѯ������;
          * - 2��ͨ�ò�ѯ����ΪNULL,������������ʱ,Ĭ�ϰ�"���ݿ�ʼʱ������"����;
          * - 3��ͨ�ò�ѯ��������ӵı��ݿ�ʼʱ�������ʱ��֮���ʱ���Ȳ��ܿ��죬��ʱ���ʽΪ��"%Y-%m-%d %H:%M:%S"��ʽ ����Ϣ�����޶�Ϊ24�ַ�
          */
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_BakRecordRetrieval(ref USER_LOGIN_ID_INFO_S stUserLoginIDInfo, ref COMMON_QUERY_CONDITION_S stQueryCondition,
                                                                                           ref QUERY_PAGE_INFO_S pageInfo, ref RSP_PAGE_INFO_S stRspPageInfo, IntPtr pstRecordFileInfo);


        /**
      * ������ı��ô洢¼����� \n
      * @param [IN]   pstUserLogIDInfo        �û���¼ID��Ϣ��ʶ
      * @param [IN]   bExtDomainDev           �Ƿ����������͵������
      * @param [IN]   pstSDKRecQueryInfo      �طż�����Ϣ���ݽṹ�����������������szCamCodeΪ������������
      * @param [IN]   pstQueryPageInfo        �����ҳ��Ϣ
      * @param [OUT]  pstRspPageInfo          ���ط�ҳ��Ϣ
      * @param [OUT]  pstSDKRecordFileInfo    ¼���ļ���Ϣ���ݽṹ��
      * @return �������½����
      * - �ɹ���
      * - ʧ�ܣ�
      * -     ���ز�������룬���������ļ�
      * @note ��ѯʱ���Ȳ��ܴ���24Сʱ������¼�����������ʱ���ʽΪ��"%Y-%m-%d %H:%M:%S"��ʽ ����Ϣ�����޶�Ϊ24�ַ�
      */
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_SlaveRecordRetrieval(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, int bExtDomainDev,
            ref REC_QUERY_INFO_S stSDKRecQueryInfo, ref QUERY_PAGE_INFO_S stQueryPageInfo,
            ref RSP_PAGE_INFO_S pstRspPageInfo, IntPtr pstSDKRecordFileInfo);


        /**
       * ��ȡ¼���ļ���URL��Ϣ \n
       * @param[IN]    pstUserLogIDInfo            �û���¼ID��Ϣ��ʶ
       * @param[IN]    pstUnitedGetUrlInfo         ��ȡ��¼��URL������ṹ
       * @param[OUT]   pstSDKURLInfo               URL��Ϣ
       * @return �������½����
       * - �ɹ���
       * - ʧ�ܣ�
       * -     ���ز�������룬���������ļ�
       */
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_UnitedGetRecordFileURL(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo,
            ref UNITED_GET_URL_INFO_S stUnitedGetUrlInfo, ref URL_INFO_S stSDKURLInfo);


        /**
      * ��ȡ������ı��ô洢¼���URL��Ϣ \n
      * @param[IN]    pstUserLogIDInfo            �û���¼ID��Ϣ��ʶ
      * @param [IN]   bExtDomainDev               �Ƿ����������͵������
      * @param[IN]    pstSDKGetUrlInfo            ��ȡURL������Ϣ���ݽṹ�����������������szCamCodeΪ������������
      * @param[OUT]    pstSDKURLInfo               URL��Ϣ
      * @return �������½����
      * - �ɹ���
      * - ʧ�ܣ�
      * -     ���ز�������룬���������ļ�
      */
        [DllImport("imos_sdk.dll", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]
        public static extern UInt32 IMOS_GetSlaveRecordFileURL(ref USER_LOGIN_ID_INFO_S stUserLogIDInfo, int bExtDomainDev,
            ref GET_URL_INFO_S stSDKGetUrlInfo, ref URL_INFO_S stSDKURLInfo);
    }



    /// <summary>
    /// ���ƴ֡����Ƶ���ݵ�ָ��ͳ��ȵ���Ϣ�Ľṹ�嶨��
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct XP_PARSE_VIDEO_DATA_S
    {
        /// <summary>
        /// ��Ƶ����ָ�� UCHAR* pucData;
        /// </summary>
        public IntPtr pucData; 

        /// <summary>
        /// ��Ƶ���ݳ���
        /// </summary>
   
        public UInt32 ulDataLen;  
        /// <summary>
        /// ��Ƶ֡���ͣ���#XP_VIDEO_FRAME_TYPE_E��ȡֵ
        /// </summary>
        public UInt32 ulVideoFrameType;     

        /// <summary>
        /// ��Ƶ�����ʽ����#XP_VIDEO_ENCODE_TYPE_E��ȡֵ
        /// </summary>
        public UInt32 ulVideoCodeFormat;    
        /// <summary>
        /// ��Ƶͼ��߶�
        /// </summary>
        public UInt32 ulHeight;            

        /// <summary>
        /// ��Ƶͼ����
        /// </summary>
        public UInt32 ulWidth;             

        /// <summary>
        /// ʱ��������룩
        /// </summary>
        public long dlTimeStamp;          

        /// <summary>
        /// ��������
        /// </summary>
        public UInt32 ulReserved1;         

        /// <summary>
        /// ��������
        /// </summary>
        public UInt32 ulReserved2;          
    }

    /// <summary>
    /// ���ƴ֡����Ƶ���ݵ�ָ��ͳ��ȵ���Ϣ�Ľṹ�嶨��
    /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct XP_PARSE_AUDIO_DATA_S
    {
        /// <summary>
        /// ��Ƶ����ָ��
        /// </summary>
        public IntPtr pucData;         
        /// <summary>
        /// ��Ƶ���ݳ���
        /// </summary>
        public UInt32 ulDataLen;    
        /// <summary>
        /// ��Ƶ�����ʽ����#XP_AUDIO_ENCODE_TYPE_E��ȡֵ
        /// </summary>
        public UInt32 ulAudioCodeFormat;    
        /// <summary>
        /// ��Ƶ���ݽ������Ƶ��ʽ����Ӧ#XP_WAVE_FORMAT_INFO_Eö���е�ֵ
        /// </summary>
        public UInt32 ulWaveFormat;         
        /// <summary>
        /// ʱ��������룩
        /// </summary>
        public long dlTimeStamp;          
        /// <summary>
        /// ��������
        /// </summary>
        public UInt32 ulReserved1;         
        /// <summary>
        /// ��������
        /// </summary>
        public UInt32 ulReserved2;          
    }

    /// <summary>
   /// ��Ž����ͼ�����ݵ�ָ��ͳ��ȵ���Ϣ�Ľṹ�嶨��
   /// </summary>
    [StructLayout(LayoutKind.Sequential)]
    public struct XP_PICTURE_DATA_S
    {
        /// <summary>
        /// pucData[0]:Y ƽ��ָ��,pucData[1]:U ƽ��ָ��,pucData[2]:V ƽ��ָ��
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 4)]
        public IntPtr[] pucData;                          
        /// <summary>
        /// ulLineSize[0]:Yƽ��ÿ�п��, ulLineSize[1]:Uƽ��ÿ�п��, ulLineSize[2]:Vƽ��ÿ�п��
        /// </summary>
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 4)]
        public UInt32[] ulLineSize;                        
        /// <summary>
        /// ͼƬ�߶�
        /// </summary>
        public UInt32 ulPicHeight;                         
        /// <summary>
        /// ͼƬ���
        /// </summary>
        public UInt32 ulPicWidth;                           
        /// <summary>
        /// ������Ⱦ��ʱ���������ͣ���ӦtagRenderTimeTypeö���е�ֵ
        /// </summary>
        public UInt32 ulRenderTimeType;                    
        /// <summary>
        /// ������Ⱦ��ʱ������
        /// </summary>
        public long dlRenderTime;                        
    }

    /// <summary>
    /// ��Ž������Ƶ���ݵ�ָ��ͳ��ȵ���Ϣ�Ľṹ�嶨��
    /// </summary>
    public struct XP_WAVE_DATA_S
    {
        /// <summary>
        /// ��Ƶ����ָ��
        /// </summary>
        public IntPtr pcData;                               
        /// <summary>
        /// ��Ƶ���ݳ���
        /// </summary>
        public UInt32 ulDataLen;                            
        /// <summary>
        /// �������Ƶ��ʽ����ӦtagWaveFormatInfoö���е�ֵ
        /// </summary>
        public UInt32 ulWaveFormat;                         
    }

}
