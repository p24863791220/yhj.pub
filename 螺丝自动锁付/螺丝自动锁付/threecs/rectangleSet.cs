using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;
//using System.Web.Script.Serialization;
using System.Windows.Forms;

namespace 螺丝自动锁付
{
    public class kuangxuanC
    {
        public int startX { get; set; }//四方形坐标
        public int startY { get; set; }
        public int endX { get; set; }
        public int endY { get; set; }
    }
    public class children
    {
        public int groupNo { get; set; } = 0;//组号
        public int startX { get; set; }//四方形坐标
        public int startY { get; set; }
        public int endX { get; set; }
        public int endY { get; set; }
        public int xihuaTime { get; set; } = 1;
        public int penhuaTime { get; set; } = 3;
        public int mainMax { get; set; } = 3;
        public int roundMax { get; set; } = 10;
        public string sampleName { get; set; }
        public string zhigroupColor { get; set; } = Color.Red.Name.ToString();
    }
    public class zhicolor// 多个颜色组
    {
        public int groupNo { get; set; } = -1;//组号
        public int rUp { get; set; }//颜色提取设定
        public int rDown { get; set; }
        public int gUp { get; set; }
        public int gDown { get; set; }
        public int bUp { get; set; }
        public int bDown { get; set; }
        public int hUp { get; set; }
        public int hDown { get; set; }
        public int twoUp { get; set; }
        public int twoDown { get; set; }
    }
    public enum enumchecktype
    {
        印刷 = 0,
        有 = 1,
        无 = 2,
        数字 = 3,
        字母 = 4,
        汉字 = 5,
        条形码 = 6,
        二维码 = 7,
        人脸识别 = 8,
        搜索边框 = 9,
        跳过=10,
        识别类型 = 11,
        位置偏移=12,
        车型判断=13,
    }

    public class rectangleSet
    {
        public int groupNo { get; set; } = 0;//组号
        public System.ComponentModel.BindingList<zhicolor> dtcolor { get; set; }
        public System.ComponentModel.BindingList<children> dtchildren { get; set; }
        public int kuangxuanNo { get; set; } = 0;
        public string sampleName { get; set; }//样板图片名称
        public enumchecktype checktype { get; set; } = 0;
        public int startX { get; set; }//四方形坐标
        public int startY { get; set; }
        public int endX { get; set; }
        public int endY { get; set; }

        public int lineUpMin { get; set; }//上下线连接点设定
        public int lineUpMax { get; set; }
        public int lineDownMin { get; set; }
        public int lineDownMax { get; set; }

        public int lineLeftMin { get; set; } = 1;//左右连接点设定
        public int lineLeftMax { get; set; }
        public int lineRightMin { get; set; }
        public int lineRightMax { get; set; }
        public int lianjiePMin { get; set; } = 1;//连接点数


        public int lineMax { get; set; }//核心点断线检测
        public int TotalMax { get; set; }//周围残缺检测
        public int xihuaTime { get; set; }//xihua次数
        public int penhuaTime { get; set; }//penhua次数

        public int rUp { get; set; }//颜色提取设定
        public int rDown { get; set; }
        public int gUp { get; set; }
        public int gDown { get; set; }
        public int bUp { get; set; }
        public int bDown { get; set; }
        public int hUp { get; set; }
        public int hDown { get; set; }

        public double hhUp { get; set; }//颜色提取设定
        public double hhDown { get; set; }
        public double ssUp { get; set; }
        public double ssDown { get; set; }
        public double vvUp { get; set; }
        public double vvDown { get; set; }

        public int rCurrent { get; set; }//记录当前值
        public int gCurrent { get; set; }
        public int bCurrent { get; set; }
        public int hCurrent { get; set; }

        public int twoCurrent { get; set; }//二值化处理
        public int twoUp { get; set; }
        public int twoDown { get; set; }
        public int twoAverage { get; set; }

        public bool fudon { get; set; }//是否搜寻
        public int fudonstartX { get; set; }//四方形坐标
        public int fudonstartY { get; set; }//浮动检测范围
        public int fudonendX { get; set; }
        public int fudonendY { get; set; }

        public double basex { get; set; } = 10000;//上下偏差
        public double basey { get; set; } = 10000;
        public double basew { get; set; } = 10000;
        public double baseh { get; set; } = 10000;
        public double basecenterX { get; set; } = 10000;
        public double basecenterY { get; set; } = 10000;
        public double basewhpersent { get; set; } = 10000;
        public double basetotalblack { get; set; } = 10000;

        public double setupcha { get; set; } = 10000;//上下偏差
        public double setdowncha { get; set; } = 10000;
        public double setleftcha { get; set; } = 10000;
        public double setrightcha { get; set; } = 10000;
        public double setcentercha { get; set; } = 10000;
        public double setwcha { get; set; } = 15;
        public double sethcha { get; set; } = 15;
        public double setwhpersent { get; set; } = 10000;
        public double settotalblack { get; set; } = 10000;
        public string setcartype { get; set; } = "箱体车";

        public double getupcha { get; set; } = 10000;//上下偏差
        public double getdowncha { get; set; } = 10000;
        public double getleftcha { get; set; } = 10000;
        public double getrightcha { get; set; } = 10000;
        public double getcentercha { get; set; } = 10000;
        public double getwhpersent { get; set; } = 10000;
        public double gettotalblack { get; set; } = 10000;

        public double pixelmm { get; set; }//一像素的距离
        public int lvbotime { get; set; } = 1;//滤波次数
        public int penghuatime { get; set; } = 0;//膨化次数

        public bool visualbool { get; set; } = false;//膨化次数
        public string twotype { get; set; } = "groupfast";//two type
        public bool angelcheck{get;set;}=false;//角度检测
        public bool checky1 { get; set; } = true;// 检测
        public bool checky2 { get; set; } = true;// 检测
        public int distime { get; set; } = 8;//问隔
        public bool opencontrol { get; set; } = true;//开关控制
        public int ngoutgettime { get; set; } = 0;//开关控制
        public int ngoutsettime { get; set; } = 1;//开关控制

        public string okTipVoice { get; set; } = "";//提示音


        //[DefaultValue("发现异常")]
        public string ngTipVoice { get; set; } = "注意注意";
        public string alarmTipVoice { get; set; } = "超限超限";
        public string Result { get; set; } = "-1";
    }

    public static class setinglogClass
    {
        public static string powerpub = "";
        public static double onePixelmm = 0;//一相素代表多少mm；
        public static string checkType = "定位";
        public static string textcnnpath = Application.StartupPath.ToString() + @"\textcnn\";
        public static string tessertpath = Application.StartupPath.ToString() + @"\terssert\tessdata\";
        public static string savefilePath = Application.StartupPath.ToString() + @"\Rectangle\threeyearsSet.txt";
        public static string savefilePathcolor = Application.StartupPath.ToString() + @"\Rectangle\threeyearsSetColor.txt";
        public static string savefilePathchildren = Application.StartupPath.ToString() + @"\Rectangle\threeyearsSetChildren.txt";
        public static string savefilePath2 = Application.StartupPath.ToString() + @"\Rectangle\";
        public static string logfilePath = Application.StartupPath.ToString() + @"\Log\threeyearsLog.txt";
        public static string savepicPath = Application.StartupPath.ToString() + @"\Rectangle\samplepic\";//样板图片
        public static string checkpicfolder = Application.StartupPath.ToString() + @"\Rectangle\checkpic\";//样板图片
        public static string annfilePath = Application.StartupPath.ToString() + @"\ann\";
        public static string xihua = "";
        public static bool savepic(PictureBox pt)
        {
            try
            {
                //Bitmap bt = (Bitmap )pt.Image;
                pt.Image.Save(savepicPath + AutoCheck.currentSelect + pt.Name + xihua + ".jpg");
                return true;
            }
            catch (Exception ex)
            {
                writeLog("savepic", ex.ToString());
                return false;
            }
        }
        public static bool zhic(int i)
        {
            try
            {
                if (AutoCheck.zhicolorlist[i].Count > 0) return true;
                else return false;
            }
            catch
            {
                return false;
            }
        }
        public static bool childrenbool(int i)
        {
            try
            {
                if (AutoCheck.childrenlist[i].Count > 0) return true;
                else return false;
            }
            catch
            {
                return false;
            }
        }
        public static void saveSetting()
        {
            FileStream fs = new FileStream(savefilePath, FileMode.Create, FileAccess.Write);
            FileStream fscolor = new FileStream(savefilePathcolor, FileMode.Create, FileAccess.Write);
            FileStream fschildren = new FileStream(savefilePathchildren, FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            StreamWriter swcolor = new StreamWriter(fscolor);
            StreamWriter swchildren = new StreamWriter(fschildren);
            JavaScriptSerializer json = new JavaScriptSerializer();
            StringBuilder sb = new StringBuilder();
            try
            {
                //开始写入
                for (int i = 0; i < AutoCheck.listRectangle.Count; i++)
                {
                    if (AutoCheck.listRectangle.ElementAt(i).groupNo != i && AutoCheck.listRectangle.ElementAt(i).groupNo != -1)
                    {
                        for (int j = 0; j < AutoCheck.zhicolorlist[AutoCheck.listRectangle.ElementAt(i).groupNo].Count; j++)//变动颜色号
                            AutoCheck.zhicolorlist[AutoCheck.listRectangle.ElementAt(i).groupNo].ElementAt(j).groupNo = i;
                        AutoCheck.zhicolorlist[i] = AutoCheck.zhicolorlist[AutoCheck.listRectangle.ElementAt(i).groupNo];
                        AutoCheck.zhicolorlist[AutoCheck.listRectangle.ElementAt(i).groupNo].Clear();
                        for (int j = 0; j < AutoCheck.childrenlist[AutoCheck.listRectangle.ElementAt(i).groupNo].Count; j++)//变动字组号
                            AutoCheck.childrenlist[AutoCheck.listRectangle.ElementAt(i).groupNo].ElementAt(j).groupNo = i;
                        AutoCheck.childrenlist[i] = AutoCheck.childrenlist[AutoCheck.listRectangle.ElementAt(i).groupNo];
                        AutoCheck.childrenlist[AutoCheck.listRectangle.ElementAt(i).groupNo].Clear();
                    }
                    AutoCheck.listRectangle.ElementAt(i).groupNo = i;
                    sb.Append(AutoCheck.listRectangle.ElementAt(i).sampleName + ".bmp,");
                    string jsonpara = json.Serialize(AutoCheck.listRectangle.ElementAt(i));
                    sw.WriteLine(jsonpara);

                    if (zhic(i))
                    {
                        //HashSet<zhicolor> hscolor = new HashSet<zhicolor>(AutoCheck.zhicolorlist[i].Distinct().ToList());
                        //AutoCheck.zhicolorlist[i] = AutoCheck.zhicolorlist[i].Distinct().ToList();
                        for (int w = 0; w < AutoCheck.zhicolorlist[i].Count; w++)  //外循环是循环的次数
                        {
                            for (int n = AutoCheck.zhicolorlist[i].Count - 1; n > w; n--)  //内循环是 外循环一次比较的次数
                            {

                                if (AutoCheck.zhicolorlist[i].ElementAt(w).rUp == AutoCheck.zhicolorlist[i].ElementAt(n).rUp &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).rDown == AutoCheck.zhicolorlist[i].ElementAt(n).rDown &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).gUp == AutoCheck.zhicolorlist[i].ElementAt(n).gUp &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).gDown == AutoCheck.zhicolorlist[i].ElementAt(n).gDown &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).bUp == AutoCheck.zhicolorlist[i].ElementAt(n).bUp &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).bDown == AutoCheck.zhicolorlist[i].ElementAt(n).bDown &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).hUp == AutoCheck.zhicolorlist[i].ElementAt(n).hUp &&
                                   AutoCheck.zhicolorlist[i].ElementAt(w).hDown == AutoCheck.zhicolorlist[i].ElementAt(n).hDown)
                                    AutoCheck.zhicolorlist[i].RemoveAt(n);

                            }
                        }
                        for (int j = 0; j < AutoCheck.zhicolorlist[i].Count; j++)
                        {
                            jsonpara = json.Serialize(AutoCheck.zhicolorlist[i].ElementAt(j));
                            swcolor.WriteLine(jsonpara);
                        }
                    }
                    if (childrenbool(i))
                    {
                        for (int j = 0; j < AutoCheck.childrenlist[i].Count; j++)
                        {
                            sb.Append(AutoCheck.childrenlist[i].ElementAt(j).sampleName + ".bmp,");
                            jsonpara = json.Serialize(AutoCheck.childrenlist[i].ElementAt(j));
                            swchildren.WriteLine(jsonpara);
                        }
                    }
                }
                sw.WriteLine(onePixelmm);
                sw.WriteLine(checkType);
                //清空缓冲区
                sw.Flush();
                swcolor.Flush();
                swchildren.Flush();
                //关闭流
                sw.Close();
                swcolor.Close();
                swchildren.Close();
                fs.Close();
                fscolor.Close();
                fschildren.Close();
                sb.Append("threeyearsSet.txt,");
                sb.Append("threeyearsSetColor.txt,");
                sb.Append("threeyearsSetChildren.txt,");
                sb.Append("bigSample.bmp");
                sb.Append("bigSample.jpg");
                sb.Append("positonset.txt");
                DeleteDir(savefilePath2, sb.ToString());//删除不需要的文件

            }
            catch (Exception ex)
            {
                writeLog("saveSetting", ex.ToString());
                //清空缓冲区
                sw.Flush();
                swcolor.Flush();
                swchildren.Flush();
                //关闭流
                sw.Close();
                swcolor.Close();
                swchildren.Close();
                fs.Close();
                fscolor.Close();
                fschildren.Close();
                sb.Clear();
                sb = null;
            }
        }
        public static void changezhigroupno()
        {

        }
        #region 直接删除指定目录下的不需要的图片等

        public static void DeleteDir(string file, string baoliuFile)
        {
            try
            {                
                //去除文件夹和子文件的只读属性
                //去除文件夹的只读属性
                System.IO.DirectoryInfo fileInfo = new DirectoryInfo(file);
                fileInfo.Attributes = FileAttributes.Normal & FileAttributes.Directory;

                //去除文件的只读属性
                System.IO.File.SetAttributes(file, System.IO.FileAttributes.Normal);

                //判断文件夹是否还存在
                if (Directory.Exists(file))
                {
                    foreach (string f in Directory.GetFiles(file))
                    {
                        if (File.Exists(f))
                        {
                            int i = f.LastIndexOf("\\");
                            string s = f.Substring(i + 1, f.Length - i - 1);
                            //如果有子文件删除文件
                            if (baoliuFile.IndexOf(s) < 0)
                                File.Delete(f);
                        }
                        //else
                        //{
                        //    //循环递归删除子文件夹
                        //    DeleteDir(f);
                        //}
                    }

                    //删除空文件夹
                    //Directory.Delete(file);
                }

            }
            catch (Exception ex) // 异常处理
            {
                writeLog("DeleteDir", ex.ToString());
            }
        }

        #endregion
        public static void loadSetting()
        {
            try
            {
                AutoCheck.listRectangle.Clear();
                JavaScriptSerializer json = new JavaScriptSerializer();
                string[] line = File.ReadAllLines(savefilePath);
                //开始写入
                for (int i = 0; i < line.Length - 2; i++)
                {
                    AutoCheck.listRectangle.Add(json.Deserialize<rectangleSet>(line[i]));
                    if (i < 100) AutoCheck.zhicolorlist[i].Clear();
                    if (i < 100) AutoCheck.childrenlist[i].Clear();
                }
                onePixelmm = Convert.ToInt16(line[line.Length - 2]);
                checkType = line[line.Length - 1];
            }
            catch (Exception ex)
            {
                writeLog("loadSetting", ex.ToString());
            }
            loadcolorSetting();
            loadchildrenSetting();
        }
        public static void loadchildrenSetting()
        {
            try
            {
                JavaScriptSerializer json = new JavaScriptSerializer();
                string[] line = File.ReadAllLines(savefilePathchildren);
                //开始写入
                for (int i = 0; i < line.Length; i++)
                {
                    children cld = json.Deserialize<children>(line[i]);
                    AutoCheck.childrenlist[cld.groupNo].Add(cld);

                }
            }
            catch (Exception ex)
            {
                writeLog("loadchildrenSetting", ex.ToString());
            }
        }
        public static void loadcolorSetting()
        {
            try
            {
                JavaScriptSerializer json = new JavaScriptSerializer();
                string[] line = File.ReadAllLines(savefilePathcolor);
                //开始写入
                for (int i = 0; i < line.Length; i++)
                {
                    zhicolor zc = json.Deserialize<zhicolor>(line[i]);
                    AutoCheck.zhicolorlist[zc.groupNo].Add(zc);
                }
            }
            catch (Exception ex)
            {
                writeLog("loadcolorSetting", ex.ToString());
            }
        }
        public static void writeLog(string subName, string ex)
        {
            try
            {
                string[] str = new String[3];
                str[0] = subName;
                str[1] = ex;
                str[2] = DateTime.Now.ToString();
                File.AppendAllLines(logfilePath, str);
            }
            catch (Exception e)
            {

            }

        }
    }

}
