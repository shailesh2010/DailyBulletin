using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["pwdchanged"] == "pwdchanged")
        {
            Label1.Text = "password changed. Login again to access your account";
            Session.Abandon();
            Session.RemoveAll();
            Session.Clear();
            HttpContext.Current.Session.Abandon();
        }      
    }

      protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select count(*) from admindetails where adminname=@adminlogin and password=@password", con);
                cmd.Parameters.AddWithValue("@adminlogin", txtadminname.Text);
                cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                con.Open();
                int i = (int)cmd.ExecuteScalar();
                if (i > 0)
                {
                    Session["uname"] = txtadminname.Text;
                    Session["usertype"] = "admin";
                    //Session.Timeout = 2;
                    Response.Redirect("~/Admin.aspx");

                }
                else
                {
                    Label1.Text = "invalid username or password";
                }
                con.Close();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/forgetpassword.aspx?status=a");
    }
}
