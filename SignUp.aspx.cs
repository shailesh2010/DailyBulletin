using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signup_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string a = TextBox1.Text;
                SqlCommand cmd = new SqlCommand("select count(*) from userdetails where username=@uname", con);
                cmd.Parameters.AddWithValue("@uname", TextBox1.Text);
                con.Open();
                Captcha1.ValidateCaptcha(TextBox5.Text.Trim());
                if (Captcha1.UserValidated)
                {
                    Label2.ForeColor = System.Drawing.Color.Green;
                    Label2.Text = "Valid";
                }
                else
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "InValid";
                }
                int i = (int)cmd.ExecuteScalar();
                if (i > 0)
                {
                    Label1.Text = "this username already exists.enter another username ";
                }
                else
                {
                    if (Label2.Text.Equals("Valid"))
                    {
                        submituserdetails();
                        TextBox5.Text = "";
                    }
                    //else
                    //{
                    //    Label4.Text = "Captcha Text not matched.";
                    //}
                }
                con.Close();
            }

        }
    }

    private void submituserdetails()
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd1 = new SqlCommand("insert into userdetails(username,password,question,answer) values(@uname,@pass,'" + DropDownList1.SelectedValue + "',@answer)", con);
            cmd1.Parameters.AddWithValue("@uname", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@pass", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@answer", TextBox4.Text);
            con.Open();
            int j = cmd1.ExecuteNonQuery();
            if (j > 0)
            {
                TextBox1.Text = null;
                Label1.Text = "account created";
                TextBox4.Text = null;
            }
            con.Close();
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}