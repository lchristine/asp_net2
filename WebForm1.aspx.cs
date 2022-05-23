using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.IO;

namespace ApalaktikiErgasia2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private OleDbConnection connection;
        private OleDbConnectionStringBuilder strb;

        protected void Page_Load(object sender, EventArgs e)
        {
            RD();
            if (!IsPostBack)
            {
                TextBox3.Attributes.Add("maxlength", "10");
            }
        }
        //gridview
        private void FTD(String sql)
        {
            DataSet dataSet = new DataSet();

            DataTable tb = new DataTable();
            using (OleDbDataAdapter adapt = new OleDbDataAdapter(sql, connection))
            {
                adapt.Fill(dataSet);
                GridView1.DataSource = dataSet;
                GridView1.DataBind();
            }
        }
        
        private void RD()
        {
            strb = new OleDbConnectionStringBuilder();
            strb.Provider = "Microsoft.Jet.OLEDB.4.0";
            strb.DataSource = @"Ergasia2.mdb";
            connection = new OleDbConnection(strb.ConnectionString);
            FTD("SELECT * FROM Ergasia2"); //gridview
        }

        //add
        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = TextBox1.Text;
            string lname = TextBox2.Text;
            string phone = TextBox3.Text;
            string email = TextBox4.Text;
            string address = TextBox5.Text;
            string birthday = TextBox6.Text;
            string filePath, fileName;
            if (FileUpload1.PostedFile != null)
            {
                //filePath = FileUpload1.PostedFile.FileName; // file name with path.
                fileName = FileUpload1.FileName;// Only file name.

                //string imgpath = fileName;

                TextBox1.Text = null;
                TextBox2.Text = null;
                TextBox3.Text = null;
                TextBox4.Text = null;
                TextBox5.Text = null;
                TextBox6.Text = null;
                Literal1.Text = null;

                connection.Open();
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = "INSERT INTO Ergasia2 (FirstName,LastName,Phone,Email,Address,Birthday,ImagePath) VALUES ('" + fname + "','" + lname + "','" + phone + "','" + email + "','" + address + "', '" + birthday + "', '" + fileName + "')";
                command.ExecuteNonQuery();
                //messagebox
                string script = "alert(\"Contact added successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);

                connection.Close();
                RD();
            }
        }
       //update
        protected void Button2_Click(object sender, EventArgs e)
        {
            string filePath, fileName;
            if (FileUpload1.PostedFile != null)
            {
                filePath = FileUpload1.PostedFile.FileName; // file name with path.
                fileName = FileUpload1.FileName;// Only file name.
                string fname = TextBox1.Text;
                string lname = TextBox2.Text;
                long phone = long.Parse(TextBox3.Text);
                string email = TextBox4.Text;
                string address = TextBox5.Text;
                string birthday = TextBox6.Text;

                TextBox1.Text = null;
                TextBox2.Text = null;
                TextBox3.Text = null;
                TextBox4.Text = null;
                TextBox5.Text = null;
                TextBox6.Text = null;

                connection.Open();
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                string query = "update Ergasia2 set FirstName='" + fname + "',LastName='" + lname + "',Phone='" + phone.ToString() + "',Email='" + email + "',Address='" + address + "',Birthday='" + birthday + "',ImagePath='" + fileName + "' where FirstName = '" + fname + "'";
                command.CommandText = query;
                command.ExecuteNonQuery();
                string script = "alert(\"Contact changed succssefully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                connection.Close();
                RD();
            }
        }
        //delete
        protected void Button3_Click(object sender, EventArgs e)
        {
            string fname = TextBox1.Text;

            TextBox1.Text = null;
            TextBox2.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;

            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            string query = "delete from Ergasia2 where FirstName='" + fname + "'";
            command.CommandText = query;
            command.ExecuteNonQuery();
            string script = "alert(\"Contact deleteded succssefully\");";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            connection.Close();
            RD();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        // search firstname 
        protected void Button4_Click(object sender, EventArgs e)
        {
            string fname = TextBox7.Text;
            TextBox1.Text = "";
            TextBox2.Text="";
            TextBox3.Text="";
            TextBox4.Text="";
            TextBox5.Text="";
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            string query = "select * from Ergasia2 where FirstName='" + fname + "'";
            command.CommandText = query;
            OleDbDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Label11.Text = "Contact Found";
                TextBox1.Text = reader["FirstName"].ToString();
                TextBox2.Text = reader["LastName"].ToString();
                TextBox3.Text = reader["Phone"].ToString();
                TextBox4.Text = reader["Email"].ToString();
                TextBox5.Text = reader["Address"].ToString();
                TextBox6.Text = reader["Birthday"].ToString();
                TextBox7.Text = null;
            }
            connection.Close();
        }
        //search lastname
        protected void Button5_Click(object sender, EventArgs e)
        {
            string lname = TextBox8.Text;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            string query = "select * from Ergasia2 where LastName='" + lname + "'";
            command.CommandText = query;
            OleDbDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Label11.Text = "Contact Found";
                TextBox1.Text = reader["FirstName"].ToString();
                TextBox2.Text = reader["LastName"].ToString();
                TextBox3.Text = reader["Phone"].ToString();
                TextBox4.Text = reader["Email"].ToString();
                TextBox5.Text = reader["Address"].ToString();
                TextBox6.Text = reader["Birthday"].ToString();
                TextBox8.Text = null;
            }
            connection.Close();
        }
        //search phone
        protected void Button6_Click(object sender, EventArgs e)
        {
            string phone = TextBox9.Text;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            string query = "select * from Ergasia2 where Phone='" + phone + "'";
            command.CommandText = query;
            OleDbDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Label11.Text = "Contact Found";
                TextBox1.Text = reader["FirstName"].ToString();
                TextBox2.Text = reader["LastName"].ToString();
                TextBox3.Text = reader["Phone"].ToString();
                TextBox4.Text = reader["Email"].ToString();
                TextBox5.Text = reader["Address"].ToString();
                TextBox6.Text = reader["Birthday"].ToString();
                TextBox9.Text = null;
            }
            connection.Close();
        }
    }
}