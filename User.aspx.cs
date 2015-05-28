using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] != null)
        {
            Label1.Text = "WELCOME :-   " +Session["uname"].ToString();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }

    }
        protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }



    protected void Button2_Click(object sender, EventArgs e)
    {      
        
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    SqlCommand cmd2 = new SqlCommand("select * from news", con);
                    SqlCommand cmd1 = new SqlCommand("select max(newsid) from news", con);
                    con.Open();
                    int j = 1;

                    SqlDataReader rdr = cmd2.ExecuteReader();
                    int m = 0;
                    while (rdr.Read())
                    {
                        m++;
                    }
                    rdr.Close();
                    if (m > 0)
                    {
                        j = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
                        j = j + 1;
                    }
                    
                        string fileextension1 = System.IO.Path.GetExtension(FileUpload1.FileName);
                        string fileextension2 = System.IO.Path.GetExtension(FileUpload2.FileName);
                        if (!((fileextension1.ToLower() == ".jpg" || fileextension1.ToLower() == ".jpeg" || fileextension1.ToLower() == ".png") && (fileextension2.ToLower() == ".jpg" || fileextension2.ToLower() == ".jpeg" || fileextension2.ToLower() == ".png")))
                        {
                            Label4.Text = "only files with .jpg, .jpeg or .png are allowed ";
                            Label4.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
                            FileUpload2.SaveAs(Server.MapPath("~/uploads/" + FileUpload2.FileName));
                            Label4.Text = "files uploaded";                          
                                
                        }

                    SqlCommand cmd3 = new SqlCommand("insert into news(newsid,newsheader,newstext,newsdate,newstype,image1path,image2path) values(" + j + ",@newsheader,@newstext,'" + DateTime.Now.ToShortDateString() + "','" + DropDownList1.SelectedValue + "',@fileupload1,@fileupload2)", con);
                    cmd3.Parameters.AddWithValue("@newsheader", TextBox3.Text);
                    cmd3.Parameters.AddWithValue("@newstext", TextBox1.Text);
                    cmd3.Parameters.AddWithValue("@fileupload1", "~/uploads/" + FileUpload1.FileName);
                    cmd3.Parameters.AddWithValue("@fileupload2", "~/uploads/" + FileUpload2.FileName);
                    int i = cmd3.ExecuteNonQuery();
                    Label3.Text = "" + i + "news submitted";
                    Label3.Visible = true;
                    TextBox2.Text = null;
                    TextBox1.Text = null;
                    TextBox3.Text = null;
                    Panel1.Visible = false;
                    con.Close();
                }
                catch (Exception exc)
                {
                    Response.Write("Exception" + exc);
                }
            }        

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session.Clear();
        HttpContext.Current.Session.Abandon();
        Response.Redirect("~/Default.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {       
        
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into usercomplain(complaintext,complaindate) values(@complaintext,'" + DateTime.Now.ToShortDateString() + "')", con);
                cmd.Parameters.AddWithValue("@complaintext", TextBox2.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                con.Close();
               // Label6.Visible = true;
                Label6.Text = "" + a + "complaint submitted";
                Panel2.Visible = false;
            }      
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/changepassword.aspx");
    }

}