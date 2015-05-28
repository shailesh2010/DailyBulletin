using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] != null)
        {
            Label4.Text = "Welcome " + Session["uname"] + " to change password ";
        }
        else
        {
            if ((string)Session["usertype"] == "admin")
            {
                Session.Abandon();
                Session.RemoveAll();
                Session.Clear();
                HttpContext.Current.Session.Abandon();
                Response.Redirect("~/adminlogin.aspx");
            }
            else
            {
                if ((string)Session["usertype"] == "user")
                {
                    Session.Abandon();
                    Session.RemoveAll();
                    Session.Clear();
                    HttpContext.Current.Session.Abandon();
                    Response.Redirect("~/login.aspx");
                }
            }
        }
        if ((string)Session["usertype"] == "admin")
        {
            HyperLink2.NavigateUrl = "~/admin.aspx";
        }
        if ((string)Session["usertype"] == "user")
        {
            HyperLink2.NavigateUrl = "~/user.aspx";
        }

    }

     protected void Button1_Click(object sender, EventArgs e)
     {
        if (Page.IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                if ((string)Session["usertype"] == "user")
                {
                    SqlCommand cmd = new SqlCommand("select password from userdetails where username=@uname", con);
                    cmd.Parameters.AddWithValue("@uname", Session["uname"]);
                    con.Open();
                    string s = (string)cmd.ExecuteScalar();
                    if (s.Equals(TextBox1.Text))
                    {
                        SqlCommand cmd1 = new SqlCommand("update userdetails set password=@password where username=@uname1", con);
                        cmd1.Parameters.AddWithValue("@uname1", Session["uname"]);
                        cmd1.Parameters.AddWithValue("@password", TextBox2.Text);
                        int i = cmd1.ExecuteNonQuery();
                        if (i > 0)
                        {
                            // Response.Write("<script language=javascript runat=server >alert('password changed');</script>");                       
                           // System.Threading.Thread.Sleep(3000);
                            Session.Abandon();
                            // Session["status"] = "password changed";
                            Session.Abandon();
                            Session.RemoveAll();
                            Session.Clear();
                            HttpContext.Current.Session.Abandon();
                            //Session["pwdchanged"] = "pwdchanged";
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err", "alert('password changed successfully');", true);
                           // Response.Redirect("~/default.aspx");
                            HyperLink1.Visible = true;
                            HyperLink2.Visible = false;
                        }
                    }

                    else
                    {
                        Label4.Text = "input correct password";
                        Label4.ForeColor = System.Drawing.Color.Red;                                                
                    }
                }
                else
                {
                    if ((string)Session["usertype"] == "admin")
                    {
                        SqlCommand cmd = new SqlCommand("select password from admindetails where adminname='@adminname", con);
                        cmd.Parameters.AddWithValue("@adminname", Session["uname"]);
                        con.Open();
                        string s = (string)cmd.ExecuteScalar();
                        if (s.Equals(TextBox1.Text))
                        {
                            SqlCommand cmd1 = new SqlCommand("update admindetails set password=@password where adminname=@adminname1", con);
                            cmd1.Parameters.AddWithValue("@adminname1", Session["uname"]);
                            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
                            int i = cmd1.ExecuteNonQuery();
                            if (i > 0)
                            {
                                // Response.Write("<script language=javascript runat=server >alert('password changed');</script>");                       
                                System.Threading.Thread.Sleep(3000);
                                Session.Abandon();
                                // Session["status"] = "password changed";
                                Session.Abandon();
                                Session.RemoveAll();
                                Session.Clear();
                                HttpContext.Current.Session.Abandon();
                                //Session["pwdchanged"] = "pwdchanged";
                                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err", "alert('password changed successfully');", true);
                                //Response.Redirect("~/adminlogin.aspx");     
                                HyperLink1.Visible = true;
                                HyperLink1.NavigateUrl = "~/adminlogin.aspx";
                                HyperLink2.Visible = false;
                            }
                        }

                        else
                        {
                            Label4.Text = "input correct password";
                            Label4.ForeColor = System.Drawing.Color.Red;                          
                        }
                    }
                }

                 con.Close();
                }
            }
        }
   
}