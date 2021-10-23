using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using WPF_MVVM_Demo1.Model;

namespace WPF_MVVM_Demo1.ViewModel
{
    public class UserViewModel:BaseViewModel
    {
        //数据源
        ObservableCollection<User> _mylist = new ObservableCollection<User>();
        public BaseCommands AddCommand { get; set; }
        public BaseCommands UpdateCommand { get; set; }
        public BaseCommands DeleteCommand { get; set; }

        public BaseCommands SelectCommand { get; set; }

        List<User> mylist = new List<User>();

        public int _id;

        public int ID
        {
            get { return _id; }
            set
            {
                _id = value;
                RaisePropertyChanged("ID");
            }
        }
        public string _name;
        public string Name
        {
            get => _name;
            set
            {
                _name = value;
                RaisePropertyChanged("Name");
            }
        }
        public int _age;
        public int Age 
        { get=>_age;
            set
            {
                _age = value;
                RaisePropertyChanged("Age");
            }
        }
        public string _sex;
        public string Sex { get=> _sex; set 
            {
                _sex = value;
                RaisePropertyChanged("Sex");
            } }
        public string _remark;
        public string Remarks { get=>_remark; set
            {
                _remark = value;
                RaisePropertyChanged("Remarks");
            } }


        public ObservableCollection<User> ShowList
        {
            get { return _mylist; }
            set
            {
                _mylist = value;
                RaisePropertyChanged("mylist");
            }
        }
        //构造函数
        public UserViewModel()
        {
            InitData();
        }
        void InitData() 
        {
            AddCommand = new BaseCommands();
            AddCommand.ExecuteCommand = new Action<object>(addStudent);

            UpdateCommand = new BaseCommands();
            UpdateCommand.ExecuteCommand = new Action<object>(updateStudent);//修改方法

            DeleteCommand = new BaseCommands();
            DeleteCommand.ExecuteCommand = new Action<object>(deleteStudent);//修改方法
            //SelectCommand = new BaseCommands();
            //SelectCommand.ExecuteCommand = new Action<object>(SelectionChangedCommand);

            mylist.Add(new User() { ID = 1, Name = "张三", Age = 20, Sex = "女", Remarks = "无" });
            mylist.Add(new User() { ID = 2, Name = "李四", Age = 21, Sex = "女", Remarks = "无" });
            mylist.Add(new User() { ID = 3, Name = "王五", Age = 22, Sex = "女", Remarks = "无" });
            mylist.Add(new User() { ID = 4, Name = "赵六", Age = 24, Sex = "女", Remarks = "无" });
            Binding();
        }

        private void Binding()
        {
            ShowList.Clear();
            mylist.ToList().ForEach(p => ShowList.Add(p));
        }

        public void addStudent(Object parameter) 
        {
            int id = mylist[mylist.Count() - 1].ID;
            mylist.Add(new User() { ID = id + 1, Name = Name, Age = Age, Sex = Sex, Remarks = Remarks });
            Binding();

        }

        public void updateStudent(object parameter)
        {
            if (ID == 0)
            {
                MessageBox.Show("请选择修改项");
                return;
            }
            foreach (var item in mylist)
            {
                if (item.ID == ID)
                {
                    item.ID = ID;
                    item.Name = Name;
                    item.Sex = Sex;
                    item.Remarks = Remarks;
                    item.Age = Age;
                    break;
                }
            }
            Binding();
        }
        public void deleteStudent(object parameter)
        {
            if (ID == 0)
            {
                MessageBox.Show("请选择删除项");
                return;
            }
            User user1 = mylist.Single(p => p.ID == ID);
            mylist.Remove(user1);
            Binding();
        }

        public ICommand SelectionChangedCommand
        {
            get
            {
                return new BaseCommands<DataGrid>((datagrid) =>BtnClick(datagrid));
            }
        }
        public void BtnClick(object obj) 
        {
            DataGrid datagrid = (DataGrid)obj;
            if (datagrid.SelectedItems.Count > 0)
            {
               var  user = (User)datagrid.SelectedItems[0];
                ID = user.ID;
                Name = user.Name;
                Age = user.Age;
                Sex = user.Sex;
                Remarks = user.Remarks;
            }
        }
    }
}
