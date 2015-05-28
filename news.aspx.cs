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

public partial class news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.SelectedDate = DateTime.Now;
        }
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select newsid,newsheader,newstext from news where newsdate='" + Calendar1.SelectedDate.ToShortDateString() + " ' and newstype='International'", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            int count = 0;
            while (rdr.Read())
            {
                count++;
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
                l1.Text = rdr.GetString(1);
                Label l2 = new Label();
                l2.Text = rdr.GetString(2);

                Panel1.Controls.Add(l1);
                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));

                Panel1.Controls.Add(l2);
                Panel1.Controls.Add(new LiteralControl("<br>"));

                LinkButton lb = new LinkButton();
                lb.Text = "read more";
                lb.ID = "lb" + rdr.GetInt32(0);
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
            con.Close();
            if (count == 0)
            {
                Label1.Text = "No news found for this date and this category";
            }
        }

        //else
        //{            
        //}
    }

    protected void lbtn1_LinkClicked(object sender, EventArgs e)
    {
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
            }
            rdr.Close();
            con.Close();
        }
        ASPxPopupControl1.ContentUrl = "~/realnews.aspx";

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}