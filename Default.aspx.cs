using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.Web.ASPxPopupControl;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {    
        //if ((string)Session["pwdchanged"] == "pwdchanged")
        //{
        //    Label1.Text = "password changed. Login again to access your account";
        //Session.Abandon();
        //Session.RemoveAll();
        //Session.Clear();
        //HttpContext.Current.Session.Abandon();
        //}
        if (!IsPostBack)
        {
            Calendar1.SelectedDate =DateTime.Now;            
        }
      
        Label2.Text ="";
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        SqlCommand cmd;
        using (SqlConnection con = new SqlConnection(cs))
        {
            if (Request.QueryString["type"] == null)
            {
                cmd = new SqlCommand("select newsid,newsheader,newstext from news where newsdate='" + Calendar1.SelectedDate.ToShortDateString() + "'and approvenews=1 order by newsid desc ", con);
                Label4.Text = "All News";
            }
            else
            {
                cmd = new SqlCommand("select newsid,newsheader,newstext from news where newsdate='" + Calendar1.SelectedDate.ToShortDateString() + "' and newstype=@newstype and approvenews=1 order by newsid desc  ", con);
                cmd.Parameters.AddWithValue("@newstype", Request.QueryString["type"]);
                Label4.Text = ""+Request.QueryString["type"];
            }
                con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            int count = 0;
            while (rdr.Read())
            {
                count = count + 1;
                //TableRow row1 = new TableRow();
                //TableRow row2 = new TableRow();
                //TableRow row3 = new TableRow();
                //TableCell cell1 = new TableCell();
                //TableCell cell2 = new TableCell();
                //TableCell cell3 = new TableCell();
                //cell2.Height = 10;
                //cell1.Text = rdr.GetString(1);
                //cell2.Text = rdr.GetString(2);
                Label l1 = new Label();
                l1.Text = "<b>"+rdr.GetString(1)+"</b>";
                l1.CssClass = "main-headline";
                l1.Width = 500;
                

                Label l2 = new Label();
                l2.Text = rdr.GetString(2).Substring(1,100)+"......";
                l2.Width = 500;
                
                
                Panel1.Controls.Add(l1);
                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));

                Panel1.Controls.Add(l2);
                Panel1.Controls.Add(new LiteralControl("<br>"));

                LinkButton lb = new LinkButton();
                lb.Text = "read more";
                lb.ForeColor = System.Drawing.ColorTranslator.FromHtml("#dc0000");
                lb.ID = "lb" + rdr.GetInt32(0);
                lb.CausesValidation = false;
                lb.Click += new EventHandler(lbtn1_LinkClicked);
                Panel1.Controls.Add(lb);
                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));

                //HyperLink h1 = new HyperLink();
                //h1.Text = "read more";
                //h1.NavigateUrl = "~/realnews.aspx";
                // cell3.Controls.Add(h1);
                //cell3.Controls.Add(lb);
                //row1.Controls.Add(cell1);
                //row2.Controls.Add(cell2);
                //row3.Controls.Add(cell3);
                //Table1.Controls.Add(row1);
                //Table1.Controls.Add(row2);
                //Table1.Controls.Add(row3);
                
            }
            if (count == 0)
            {
                Label2.Text = "No news found for this date and this category";
            }
            Label2.ForeColor = System.Drawing.Color.Red;
            con.Close();
            
        }
        
        //else
        //{            
        //}

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select count(*) from userdetails where username=@uname and password=@upass", con);
                cmd.Parameters.AddWithValue("uname", txtusername.Text);
                cmd.Parameters.AddWithValue("upass", txtpassword.Text);
                con.Open();
                int i = (int)cmd.ExecuteScalar();
                if (i > 0)
                {
                    Session["uname"] = txtusername.Text;
                    Session["usertype"] = "user";
                    //Session.Timeout = 2;
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


    protected void lbtn1_LinkClicked(object sender, EventArgs e)
    {
        //Label3.Text = "Button clicked";
        LinkButton lnkbtn = (LinkButton)sender;
        ASPxPopupControl1.PopupElementID = lnkbtn.ID;
        //Response.Write("Text="+lnkbtn.ID.Substring(2));
        //ASPxPopupControl1.HeaderText=(string)Session["newsheader"];
        int i = Convert.ToInt32(lnkbtn.ID.Substring(2));
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select newsheader,newstext,image1path,image2path from news where newsid=" + i + "", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                //string s ="<h1><b>"+ rdr.GetString(0)+"</b></h1>";

                ASPxPopupControl1.HeaderText = "";
                Session["newsheader"] = rdr.GetString(0);
                Session["newstext"] = rdr.GetString(1);
                Session["image1path"] = rdr.GetString(2);
                Session["image2path"] = rdr.GetString(3);
                Session["newsid"] = i;
            }
            rdr.Close();
            con.Close();
        }
        ASPxPopupControl1.ContentUrl = "~/realnews.aspx";

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date > DateTime.Now)
        {
            e.Day.IsSelectable = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }
    }
   
}