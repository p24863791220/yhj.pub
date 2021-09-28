using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices; // 用 DllImport 需用此 命名空间
using System.Reflection; // 使用 Assembly 类需用此 命名空间
using System.Reflection.Emit; // 使用 ILGenerator 需用此 命名空间

namespace WindowsFormsApplication1
{

    public partial class FormDll : Form
    {
        [DllImport("user32.dll", EntryPoint = "MessageBoxA")]
        static extern int MsgBox(int hWnd, string msg, string caption, int type);

        // 添加一个 ldfs 实例 tmp
        private ldfs tmp = new ldfs();

        public  object Invoke(string lpFileName, string Namespace, string ClassName, string lpProcName, object[] ObjArray_Parameter)

        {
            try { // 载入程序集

                Assembly MyAssembly = Assembly.LoadFrom(lpFileName);

                Type[] type = MyAssembly.GetTypes();

                foreach (Type t in type)

                {// 查找要调用的命名空间及类

                    if (t.Namespace == Namespace && t.Name == ClassName)

                    {// 查找要调用的方法并进行调用

                        MethodInfo m = t.GetMethod(lpProcName);

                        if (m != null)

                        {
                            object o = Activator.CreateInstance(t);

                            return m.Invoke(o, ObjArray_Parameter);

                        }

                        else MessageBox.Show(" 装载出错 !");

                    }

                }

            }//try

catch (System.NullReferenceException e)

            {
                MessageBox.Show(e.Message);

            }//catch

            return (object)0;

        }// Invoke
        public FormDll()
        {
            InitializeComponent();
        }

        private void FormDll_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(" 这是您第 " + Invoke(@"D:\无人值守\无人值守\无人值守\dll\Dll1.dll", "CsCount", "Class1", "count", new object[] { (int)3 }).ToString() + " 次点击此按钮。 ", " 挑战杯 ");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MsgBox(0, " 这就是用 DllImport 调用 DLL 弹出的提示框哦！ ", " 挑战杯 ", 0x30);
        }
        private void button5_Click(object sender, EventArgs e)
        {
            // 调用 count(0), 并使用期提示框显示其返回值

            MessageBox.Show(" 这是您第 " + tmp.Invoke("CsCount.dll", "CsCount", "Class1", "count", new object[] { (int)0 }).ToString() + " 次点击此按钮。 ", " 挑战杯 ");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // 卸载 DLL

            tmp.UnLoadDll();
        }
        /// <summary>

        /// 创建一个 dld 类对象

        /// </summary>

        private OutDld myfun = new OutDld();
        private void button6_Click(object sender, EventArgs e)
        {
            object[] Parameters = new object[] { (int)0 }; // 实参为 0

            Type[] ParameterTypes = new Type[] { typeof(int) }; // 实参类型为 int

            OutDld.ModePass[] themode = new OutDld.ModePass[] { OutDld.ModePass.ByValue }; // 传送方式为值传

            Type Type_Return = typeof(int); // 返回类型为 int

            // 弹出提示框，显示调用 myfun.Invoke 方法的结果，即调用 count 函数

            MessageBox.Show(" 这是您装载该 Dll 后第 " + myfun.Invoke(Parameters, ParameterTypes, themode, Type_Return).ToString()

            + " 次点击此按钮。 ", " 挑战杯 ");
        }

        private void button7_Click(object sender, EventArgs e)
        {
            myfun.UnLoadDll();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            myfun.LoadDll(@"D:\无人值守\无人值守\无人值守\dll\Dll1.dll"); // 加载 "Count.dll"

            //myfun.LoadFun("_count@4"); // 调入函数 count, "_count@4" 是它的入口，可通过 Depends 查看
        }
    }
}
