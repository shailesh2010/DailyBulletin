using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class mainpage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if((string)Session["pwdchanged"] == "pwdchanged")
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
                SqlCommand cmd = new SqlCommand("select count(*) from userdetails where username='"+txtusername.Text+"' and password='"+txtpassword.Text+"'" , con);
                con.Open();
                int i = (int)cmd.ExecuteScalar();
                if (i > 0)
                {
                    Session["uname"] = txtusername.Text;
                    Session["usertype"] = "user";
                    Session.Timeout = 2;
                    Response.Redirect("~/user.aspx");
                  
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
        Response.Redirect("~/forgetpassword.aspx?status=u");
    }
}
    

