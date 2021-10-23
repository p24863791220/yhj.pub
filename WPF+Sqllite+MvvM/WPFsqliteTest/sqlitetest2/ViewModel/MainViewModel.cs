using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SQLite;
using System.IO;
using System.Text;
using System.Windows.Documents;

namespace sqlitetest2.ViewModel
{
    /// <summary>
    /// This class contains properties that the main View can data bind to.
    /// <para>
    /// Use the <strong>mvvminpc</strong> snippet to add bindable properties to this ViewModel.
    /// </para>
    /// <para>
    /// You can also use Blend to data bind with the tool's support.
    /// </para>
    /// <para>
    /// See http://www.galasoft.ch/mvvm
    /// </para>
    /// </summary>
    public class MainViewModel : ViewModelBase
    {
        List<Userlist> usersList;
        public MainViewModel()
        {
            usersList = new List<Userlist>();
            this.Query();
            AddCommand = new RelayCommand(() =>
             {
                 this.AddCommandExcute();
             });
            DecCommand = new RelayCommand(() =>
            {
                this.DecCommandExcute();
            });
        }

        public RelayCommand AddCommand { get; set; }
        public RelayCommand DecCommand { get; set; }
        private void DecCommandExcute()
        {

            StringBuilder sql = new StringBuilder();
            sql.Append(string.Format(" delete from userlist where id= (Select id from userlist order by id limit 1) "));
            try
            {
                using (SQLiteConnection conn = new SQLiteConnection(getConnStr()))
                {
                    int i = SQLiteHelper.ExecuteNonQuery(conn, sql.ToString());
                    if (1 > 0)
                    {
                        this.Query();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void AddCommandExcute()
        {
            StringBuilder sql = new StringBuilder();
            try
            {
                sql.Append(string.Format("insert into  {0}(", "userlist"));
                sql.Append("userName,Pwd,Ct )");
                sql.Append(" values (");
                sql.Append("@userName,@Pwd,@Ct )");
                object[] parameters = new object[3];
                string guid = Guid.NewGuid().ToString().Replace("-", "");
                Random rd = new Random();
                int xx = rd.Next(100, 999);
                parameters[0] = guid;
                parameters[1] = xx;
                parameters[2] = DateTime.Now.ToUniversalTime().AddHours(8).ToString("s");


                using (SQLiteConnection conn = new SQLiteConnection(getConnStr()))
                {
                    int i = SQLiteHelper.ExecuteNonQuery(conn, sql.ToString(), parameters);
                    if (1 > 0)
                    {
                        this.Query();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void Query()
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(string.Format("select * from userlist"));
            try
            {
                string ss = sql.ToString();
                using (SQLiteConnection conn = new SQLiteConnection(getConnStr()))
                {
                    using (SQLiteDataAdapter ap = new SQLiteDataAdapter(sql.ToString(), conn))
                    {
                        DataSet ds = new DataSet();
                        ap.Fill(ds);

                        DataTable dt = ds.Tables[0];
                        StringBuilder html = new StringBuilder();
                        usersList = new List<Userlist>();
                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                Userlist entity = new Userlist();
                                entity.userName = dt.Rows[i]["userName"].ToString();
                                entity.Pwd = dt.Rows[i]["Pwd"].ToString();
                                entity.Ct = Convert.ToDateTime(dt.Rows[i]["Ct"]);
                                usersList.Add(entity);
                            }
                        }
                    }
                }
                UserBind.Clear();
                if (usersList.Count > 0)
                {
                    usersList.ForEach(arg =>
                    {
                        UserBind.Add(arg);
                    });
                }
            }
            catch (Exception ex)
            {
            }
        }


        public string getConnStr()
        {
            string result = "";
            try
            {
                string dbfilePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"DB\Uc3.db");

                string connStr = @"Data Source=" + dbfilePath + @";Initial Catalog=sqlite;Integrated Security=True;Max Pool Size=10";
                result = connStr;
            }
            catch (Exception ex)
            {
                result = "";
            }
            return result;
        }
        private ObservableCollection<Userlist> _userBind = new ObservableCollection<Userlist>();

        public ObservableCollection<Userlist> UserBind
        {
            get
            {
                return this._userBind;
            }
            set
            {
                this._userBind = value;
                RaisePropertyChanged();
            }
        }

        public class Userlist
        {
            public string userName { get; set; }
            public string Pwd { get; set; }
            public DateTime Ct { get; set; }
        }
    }
}