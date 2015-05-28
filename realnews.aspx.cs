using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class realnews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPxImageSlider1.Items.Add(Session["image1path"].ToString());
        ASPxImageSlider1.Items.Add(Session["image2path"].ToString());
        Label1.Text = (string)Session["newstext"] ;
        Label2.Text = "<h1><b>" + (string)Session["newsheader"] + "</b></h1>";

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd1 = new SqlCommand("select count(*) from comments where commentid=@cid", con);
            int a = (int)Session["newsid"];
            cmd1.Parameters.AddWithValue("@cid", a);         

            con.Open();
            int b=(int)cmd1.ExecuteScalar();
            Label5.Text ="No. of comments= "+b;
            con.Close();
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd1 = new SqlCommand("select commenttext from comments where commentid=@cid", con);
            int j = (int)Session["newsid"];
            cmd1.Parameters.AddWithValue("@cid", j); 
            con.Open();
            int count = 1;
            SqlDataReader rdr = cmd1.ExecuteReader();
            while (rdr.Read())
            {
                Label lb = new Label();
                lb.ID = "lb" + count;
                lb.Text = rdr.GetString(0);
                lb.Width = 600;
                lb.BackColor = System.Drawing.Color.AntiqueWhite;
                Panel2.Controls.Add(lb);
                Panel2.Controls.Add(new LiteralControl("<br>"));
                Panel2.Controls.Add(new LiteralControl("<br>"));
            }
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd1 = new SqlCommand("insert into comments(commentid,commenttext) values(@cid,@ctxt)", con);
            int j=(int)Session["newsid"];
            cmd1.Parameters.AddWithValue("@cid",j );
            cmd1.Parameters.AddWithValue("@ctxt",TextBox1.Text );
         
            con.Open();
            int m = cmd1.ExecuteNonQuery();
            if (m> 0)
            {
                TextBox1.Text = null;
                Label4.Text = "Comment Posted Successfully";                
            }
            con.Close();
        }
    }
}