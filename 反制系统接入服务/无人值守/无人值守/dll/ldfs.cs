using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO; // 对文件的读写需要用到此命名空间
using System.Reflection; // 使用 Assembly 类需用此命名空间
using System.Reflection.Emit; // 使用 ILGenerator 需用此命名空间

namespace WindowsFormsApplication1
{

    class ldfs
    {
        // 记录要导入的程序集
        static Assembly MyAssembly;
        private byte[] LoadDll(string lpFileName)

        {
            Assembly NowAssembly = Assembly.GetEntryAssembly();

            Stream fs = null;

            try

            {// 尝试读取资源中的 DLL

                fs = NowAssembly.GetManifestResourceStream(NowAssembly.GetName().Name + "." + lpFileName);

            }

            finally

            {// 如果资源没有所需的 DLL ，就查看硬盘上有没有，有的话就读取

                if (fs == null && !File.Exists(lpFileName)) throw (new Exception(" 找不到文件 :" + lpFileName));

                else if (fs == null && File.Exists(lpFileName))

                {
                    FileStream Fs = new FileStream(lpFileName, FileMode.Open);

                    fs = (Stream)Fs;

                }

            }

            byte[] buffer = new byte[(int)fs.Length];

            fs.Read(buffer, 0, buffer.Length);

            fs.Close();

            return buffer; // 以 byte[] 返回读到的 DLL
        }
            public object Invoke(string lpFileName, string Namespace, string ClassName, string lpProcName, object[] ObjArray_Parameter)

        {
            try

            {// 判断 MyAssembly 是否为空或 MyAssembly 的命名空间不等于要调用方法的命名空间，如果条件为真，就用 Assembly.Load 加载所需 DLL 作为程序集

                if (MyAssembly == null || MyAssembly.GetName().Name != Namespace)

                    MyAssembly = Assembly.Load(LoadDll(lpFileName));

                Type[] type = MyAssembly.GetTypes();

                foreach (Type t in type)

                {
                    if (t.Namespace == Namespace && t.Name == ClassName)

                    {
                        MethodInfo m = t.GetMethod(lpProcName);

                        if (m != null)

                        {// 调用并返回

                            object o = Activator.CreateInstance(t);

                            return m.Invoke(o, ObjArray_Parameter);

                        }

                        else

                            System.Windows.Forms.MessageBox.Show("装载出错 !");

                    }

                }

            }

            catch (System.NullReferenceException e)

            {
                System.Windows.Forms.MessageBox.Show(e.Message);

            }

            return (object)0;

        }
        public void UnLoadDll()

        {// 使 MyAssembly 指空

            MyAssembly = null;

        }

    }


    }
