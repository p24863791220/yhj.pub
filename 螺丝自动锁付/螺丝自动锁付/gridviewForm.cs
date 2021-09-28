using System;
using System.ComponentModel;
using System.Windows.Forms;

namespace threeYears
{
    public partial class gridviewForm : Form
    {
        public gridviewForm()
        {
            InitializeComponent();
        }
        //public gridviewForm(BindingList <zhicolor> bs)
        //{
        //    InitializeComponent();
        //    dataGridView1.DataSource = bs ;
        //}
        public void setdata(BindingList<zhicolor> bs)
        {
            try
            {
                this.dataGridView1.DataSource = bs;
            }
            catch
            {
                dataGridView1.Refresh();
            }
        }
        public void setdatachild(BindingList<children> bs)
        {
            try
            {
                this.dataGridView1.DataSource = bs;
            }
            catch
            {
                dataGridView1.Refresh();
            }
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private const int CP_NOCLOSE_BUTTON = 0x200;
        protected override CreateParams CreateParams
        {
            get
            {
                CreateParams myCp = base.CreateParams;
                myCp.ClassStyle = myCp.ClassStyle | CP_NOCLOSE_BUTTON;
                return myCp;
            }
        }
        private void gridviewForm_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            return;
        }

        private void gridviewForm_Activated(object sender, EventArgs e)
        {
            dataGridView1.Refresh();
        }
    }
}
