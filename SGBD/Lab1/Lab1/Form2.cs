using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Lab1
{
    public partial class Form2 : Form
    {
        public static string cs = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        public static string server = ConfigurationManager.AppSettings["server"];
        public static string database = ConfigurationManager.AppSettings["database"];
        public static string parentTable = ConfigurationManager.AppSettings["parentTable"];
        public static string childTable = ConfigurationManager.AppSettings["childTable"];
        public static string parentPrimaryKey = ConfigurationManager.AppSettings["parentPrimaryKey"];
        public static string childForeignKey = ConfigurationManager.AppSettings["childForeignKey"];
        public static string childPrimaryKey = ConfigurationManager.AppSettings["childPrimaryKey"];

        public static string SelectQueryParent = ConfigurationManager.AppSettings["SelectQueryParent"];
        public static string SelectQueryChild = ConfigurationManager.AppSettings["SelectQueryChild"];

        DataSet dataSetParent = new DataSet();
        SqlDataAdapter parentDataAdapter = new SqlDataAdapter();
        BindingSource parentBindingSource = new BindingSource();

        DataSet dataSetChild = new DataSet();
        SqlDataAdapter childDataAdapter = new SqlDataAdapter();
        BindingSource childBindingSource = new BindingSource();

        List<string> childColumnNames = new List<string>();
        int pFKid, id;

        public Form2()
        {
            InitializeComponent();

            try
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {

                    conn.Open();
                    
                    parentDataAdapter.SelectCommand = new SqlCommand(SelectQueryParent, conn);
                    dataSetParent.Clear();
                    parentDataAdapter.Fill(dataSetParent);
                    dataGridViewParent.DataSource = dataSetParent.Tables[0];
                    parentBindingSource.DataSource = dataSetParent.Tables[0];
                    


                    pFKid = int.Parse(dataGridViewParent.Rows[0].Cells[0].Value.ToString());
                    SqlCommand selectCommandChild = new SqlCommand(SelectQueryChild, conn);
                    selectCommandChild.Parameters.AddWithValue("@childForeignKey", pFKid);

                    childDataAdapter.SelectCommand = selectCommandChild;
                    dataSetChild.Clear();
                    childDataAdapter.Fill(dataSetChild);
                    dataGridViewChild.DataSource = dataSetChild.Tables[0];
                    childBindingSource.DataSource = dataSetChild.Tables[0];


                    foreach (DataColumn column in dataSetChild.Tables[0].Columns)
                    {
                        if (column.ColumnName != parentPrimaryKey && column.ColumnName != childPrimaryKey)
                            childColumnNames.Add(column.ColumnName);
                    }

                    int pointX = 30;
                    int pointY = 30;
                    int numberOfColumns = childColumnNames.Count;
                    panel1.Controls.Clear();

                    foreach (string column in childColumnNames)
                    {
                        System.Windows.Forms.TextBox a = new System.Windows.Forms.TextBox();
                        a.Text = column;
                        a.Name = column;
                        a.Location = new Point(pointX, pointY);
                        a.Visible = true;
                        a.Parent = panel1;
                        panel1.Show();
                        pointY += 30;

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void dataGridChildViewUpdate()
        {
            SqlConnection conn = new SqlConnection(cs);

            pFKid = int.Parse(dataGridViewParent.SelectedRows[0].Cells[0].Value.ToString());
            SqlCommand selectCommandChild = new SqlCommand(SelectQueryChild, conn);
            selectCommandChild.Parameters.AddWithValue("@childForeignKey", pFKid);

            childDataAdapter.SelectCommand = selectCommandChild;
            dataSetChild.Clear();
            childDataAdapter.Fill(dataSetChild);
            dataGridViewChild.DataSource = dataSetChild.Tables[0];
            childBindingSource.DataSource = dataSetChild.Tables[0];


            int pointX = 30;
            int pointY = 30;
            foreach (string column in childColumnNames)
            {
                System.Windows.Forms.TextBox a = new System.Windows.Forms.TextBox();
                a.Text = column;
                a.Name = column;
                a.Location = new Point(pointX, pointY);
                a.Visible = true;
                a.Parent = panel1;
                panel1.Show();
                pointY += 30;

            }
        }

        private void dataGridViewParent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
        
            if (e.RowIndex != parentBindingSource.Count - 1)
            {
                dataGridViewParent.ClearSelection();
                parentBindingSource.Position = e.RowIndex;
                dataGridViewParent.Rows[e.RowIndex].Selected = true;
                dataGridChildViewUpdate();

            }
        }

        private void dataGridViewChild_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            childBindingSource.Position = e.RowIndex;
            dataGridViewChild.ClearSelection();
            dataGridViewChild.Rows[e.RowIndex].Selected = true;

            foreach (string column in childColumnNames)
            {
                System.Windows.Forms.TextBox textBox = (System.Windows.Forms.TextBox)panel1.Controls[column];
                textBox.Text = dataGridViewChild.Rows[e.RowIndex].Cells[column].Value.ToString();
            }
            if (dataGridViewChild.SelectedRows.Count == 0)
                return;
            id = int.Parse(dataGridViewChild.CurrentRow.Cells[0].Value.ToString());
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {

                    string InsertQuery = ConfigurationManager.AppSettings["InsertQuery"];
                    SqlCommand cmd = new SqlCommand(InsertQuery, conn);
                    cmd.Parameters.AddWithValue("childForeignKey", pFKid);
                    cmd.Parameters.AddWithValue("childPrimaryKey", id);
                    foreach (string column in childColumnNames)
                    {
                        System.Windows.Forms.TextBox textBox = (System.Windows.Forms.TextBox)panel1.Controls[column];
                        cmd.Parameters.AddWithValue("@" + column, textBox.Text);
                    }
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    dataSetChild.Clear();

                    childDataAdapter.Fill(dataSetChild);

                    dataGridViewChild.DataSource = dataSetChild.Tables[0];
                    conn.Close();
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                using(SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open();
                    string DeleteQuery = ConfigurationManager.AppSettings["DeleteQuery"];
                    SqlCommand cmd = new SqlCommand(DeleteQuery, conn);
                    cmd.Parameters.AddWithValue("childPrimaryKey", id);
                    cmd.ExecuteNonQuery();
                    dataSetChild.Clear();
                    childDataAdapter.Fill(dataSetChild);
                    dataGridViewChild.DataSource = dataSetChild.Tables[0];
                    conn.Close();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    
                    string UpdateQuery = ConfigurationManager.AppSettings["UpdateQuery"];
                    SqlCommand cmd = new SqlCommand(UpdateQuery, conn);
                    cmd.Parameters.AddWithValue("childForeignKey", pFKid);
                    cmd.Parameters.AddWithValue("childPrimaryKey", id);
                    foreach (string column in childColumnNames)
                    {
                        System.Windows.Forms.TextBox textBox = (System.Windows.Forms.TextBox)panel1.Controls[column];
                        cmd.Parameters.AddWithValue("@" + column, textBox.Text);
                    }
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    dataSetChild.Clear();
              
                    childDataAdapter.Fill(dataSetChild);

                    dataGridViewChild.DataSource = dataSetChild.Tables[0];
                    conn.Close();
                    

                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        


    }
}

