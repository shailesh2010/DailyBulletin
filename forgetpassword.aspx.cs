using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class forgetpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //if (Page.IsValid)
        //{
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            if (Request.QueryString["status"] == "a")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select password from admindetails where adminname=@adminname and question='" + DropDownList1.SelectedItem.Text + "' and answer=@answer", con);
                    cmd.Parameters.AddWithValue("@adminname", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@answer", TextBox2.Text);

                    //SqlCommand cmd = new SqlCommand("select count(*) from admindetails where adminname='" + TextBox1.Text + "' and question='"+DropDownList1.SelectedItem.Text+"' and answer='" + TextBox2.Text + "'", con);
                    con.Open();
                    //string s = (string)cmd.ExecuteScalar();
                    
                    //if (s == null)
                    //{
                    //    Label1.Text = "enter correct details";
                    //}
                    //else
                    //{
                    //    Label1.Text = "your password=" + s;
                    //}
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        Label1.Text = rdr.GetString(0);
                    }
                    else
                    {
                        Label1.Text = "enter correct details";
                    }
                    //int i = (int)cmd.ExecuteScalar();
                    //Response.Write("" + i);
                    //string s = "";
                    //if (i > 0)
                    //{
                    //    SqlCommand cmd1 = new SqlCommand("select password from admindetails where adminname='" + TextBox1.Text + "'", con);
                    //    SqlDataReader rdr = cmd.ExecuteReader();
                    //    if (rdr.Read())
                    //    {
                    //        s = rdr.GetString(0);
                    //        Response.Write(s);
                    //    }
                    //    rdr.Close();
                    //}
                    con.Close();


                    //else
                    //{
                    //    Response.Write("put correct entries");
                    //}
                }
            }


            if (Request.QueryString["status"] == "u")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    //SqlCommand cmd2 = new SqlCommand("select count(*) from userdetails where username='" + TextBox1.Text + "' and question='" +Convert.ToString(DropDownList1.SelectedValue) + "' and answer='" + TextBox2.Text + "'", con);
                    SqlCommand cmd2 = new SqlCommand("select password from userdetails where username=@uname and question='" + Convert.ToString(DropDownList1.SelectedValue) + "' and answer=@pass", con);
                    cmd2.Parameters.AddWithValue("@uname", TextBox1.Text);
                    cmd2.Parameters.AddWithValue("@pass", TextBox2.Text);
                    con.Open();
                    //int j = (int)cmd2.ExecuteScalar();
                    string s = (string)cmd2.ExecuteScalar();
                    if (s == null)
                    {
                        Label1.Text = "enter correct details";
                    }
                    else
                    {
                        Label1.Text = "your password=" + s;
                    }

                    //if (j > 0)
                    //{
                    //    SqlCommand cmd1 = new SqlCommand("select password from userdetails where username='" + TextBox1.Text + "'", con);
                    //    SqlDataReader rdr = cmd2.ExecuteReader();
                    //    string s = "";
                    //    if (rdr.Read())
                    //    {
                    //        s = rdr.GetString(0);
                    //        Response.Write(s);
                    //    }
                    //    rdr.Close();
                    con.Close();
                    //}
                    //else
                    //{
                    //    Response.Write("put correct entries");
                    //}
                }
            }

        }

    //}
}
