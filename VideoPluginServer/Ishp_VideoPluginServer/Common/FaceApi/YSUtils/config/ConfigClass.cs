using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Collections;
using System.Drawing;

namespace IMOS_SDK_DEMO
{
    class ConfigClass
    {
        private static Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);

        private static OptionSection optionSetting;
        public static OptionSection OptionSetting
        {
            get
            {
                if (optionSetting == null)
                {
                    optionSetting = (OptionSection)config.Sections["OptionSetting"];
                    if (optionSetting == null)
                    {
                        optionSetting = new OptionSection();
                    }
                }
                return optionSetting;
            }
        }

        public static bool LoadConfig()
        {
            try
            {
                //读取配置文件
                if (config == null)
                {
                    config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                }

                if (config == null || !config.HasFile)
                {
                    return false;
                }

                return true;
            }
            catch
            {
                //Resources.MessageBoxError("LoadConfig :: ErrMessage - " + Ex.Message);
                return false;
            }
        }

        public static bool SaveConfig()
        {
            try
            {
                if (config.Sections["OptionSetting"] == null)
                {
                    config.Sections.Add("OptionSetting", OptionSetting);
                }
                config.Save(ConfigurationSaveMode.Full);
                return true;
            }
            catch
            {
                //Resources.MessageBoxError("SaveConfig :: ErrMessage - " + Ex.Message);
                return false;
            }
        }

    }

    public sealed class OptionSection : ConfigurationSection
    {
        public OptionSection()
        {

        }

        [ConfigurationProperty("Password", DefaultValue = "")]
        public string Password
        {
            get
            {
                return (string)this["Password"];

            }
            set
            {
                this["Password"] = value;
            }
        }

        [ConfigurationProperty("UserName", DefaultValue = "")]
        public string UserName
        {
            get
            {
                return (string)this["UserName"];

            }
            set
            {
                this["UserName"] = value;
            }
        }

        [ConfigurationProperty("IP", DefaultValue = "")]
        public string IP
        {
            get
            {
                return (string)this["IP"];

            }
            set
            {
                this["IP"] = value;
            }
        }


        [ConfigurationProperty("Tools", DefaultValue = "")]
        public string Tools
        {
            get
            {
                return (string)this["Tools"];

            }
            set
            {
                this["Tools"] = value;
            }
        }

        [ConfigurationProperty("Color", DefaultValue = 	-1250856)]
        public int UIColor
        {
            get
            {
                return (int)this["Color"];
                
            }
            set
            {
                this["Color"] = value;
            }
        }

        [ConfigurationProperty("ResPath", DefaultValue = "default")]
        public string ResPath
        {
            get
            {
                return (string)this["ResPath"];
            }
            set
            {
                this["ResPath"] = value;
            }
        }

        [ConfigurationProperty("HasMonitor", DefaultValue = false)]
        public bool HasMonitor
        {
            get
            {
                return (bool)this["HasMonitor"];
            }
            set
            {
                this["HasMonitor"] = value;
            }
        }

        [ConfigurationProperty("HasPlayer", DefaultValue = true)]
        public bool HasPlayer
        {
            get
            {
                return (bool)this["HasPlayer"];
            }
            set
            {
                this["HasPlayer"] = value;
            }
        }

        [ConfigurationProperty("HasVOD", DefaultValue = false)]
        public bool HasVOD
        {
            get
            {
                return (bool)this["HasVOD"];
            }
            set
            {
                this["HasVOD"] = value;
            }
        }


        [ConfigurationProperty("HasPTZ", DefaultValue = false)]
        public bool HasPTZ
        {
            get
            {
                return (bool)this["HasPTZ"];
            }
            set
            {
                this["HasPTZ"] = value;
            }
        }


        [ConfigurationProperty("HasDevConfig", DefaultValue = false)]
        public bool HasDevConfig
        {
            get
            {
                return (bool)this["HasDevConfig"];
            }
            set
            {
                this["HasDevConfig"] = value;
            }
        }

        [ConfigurationProperty("UIStyle", DefaultValue = false)]
        public bool UIStyle
        {
            get
            {
                return (bool)this["UIStyle"];
            }
            set
            {
                this["UIStyle"] = value;
            }
        }

        [ConfigurationProperty("HasUser", DefaultValue = false)]
        public bool HasUser
        {
            get
            {
                return (bool)this["HasUser"];
            }
            set
            {
                this["HasUser"] = value;
            }
        }

        [ConfigurationProperty("SnatchPath", DefaultValue = ".\\snatch\\")]
        public string SnatchPath
        {
            get
            {
                return (string)this["SnatchPath"];
            }
            set
            {
                this["SnatchPath"] = value;
            }
        }

        [ConfigurationProperty("RecordPath", DefaultValue = ".\\record\\")]
        public string RecordPath
        {
            get
            {
                return (string)this["RecordPath"];
            }
            set
            {
                this["RecordPath"] = value;
            }
        }

        
    }
}
