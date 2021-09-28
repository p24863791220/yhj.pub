using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Crypptsy;

namespace ConsoleApplication
{
    public partial class FormCrypt : Form
    {
        public FormCrypt()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string strSource = textBox1.Text;
            string strEnKey = textBox2.Text;
            textBox3.Text = EncodeDecode.Encrypt(strSource, strEnKey);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                string strCipher = textBox3.Text;
                string strEnkey = textBox2.Text;
                textBox4.Text = EncodeDecode.Decrypt(strCipher, strEnkey);
            }
            catch (Exception ex)
            {
                textBox4.Text =ex.Message ;
            }
        }

        private void FormCrypt_Load(object sender, EventArgs e)
        {

        }
    }
}
