using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;


public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] != null)
        {
            Label2.Text = "WELCOME  :-"+"  " + Session["uname"].ToString();
        }
        else
        {
            Response.Redirect("~/adminlogin.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = true;
        Panel5.Visible = false;
        Panel6.Visible = false;
    }


    //protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    //Response.Write("row index="+e.RowIndex);
    //    //int i=e.RowIndex;
    //    //Response.Write(""+GridView1.Rows[i].Cells[2].Text);
    //   System.IO.File.Delete(Server.MapPath("~/advertisements/1016443_415471278561545_1013100417_n.jpg"));
    ////}


    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
    protected void GridView5_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //string s="<%# Eval(image1path) as string %>" ;
        //Response.Write(""+s);        
       // TableCell cell = GridView5.Rows[e.RowIndex].Cells[6];
        //Response.Write("" + cell);
        //Response.Write(cell.Controls.ToString());          
        //ControlCollection i1 =cell;
        //Response.Write(""+ i1.ToString());
        //Label l1 = (Label)i1;
        //Response.Write("" + l1.Text);
        //Image image1=cell.Controls.
        // string fileName = (cell.Text); 
        //fileName = fileName.Replace("/","\\");
        //    fileName=fileName.Substring(1);
        //    Response.Write(fileName);


        //if (fileName != null || fileName != string.Empty)
        //{
        //    if ((System.IO.File.Exists(fileName)))
        //    {
        //        System.IO.File.Delete(@"C:\Users\shailesh\Documents\Visual Studio 2010\WebSites\WebSite24"+fileName);
        //    }

        //}
        //TableCell cell1 = GridView5.Rows[e.RowIndex].Cells[6];
        //string fileName1 = (cell1.Text);

        //if (fileName != null || fileName != string.Empty)
        //{
        //    if ((System.IO.File.Exists(fileName1)))
        //    {
        //        System.IO.File.Delete(fileName1);
        //    }

        //}

        TableCell cell1 = GridView5.Rows[e.RowIndex].Cells[6];
        TableCell cell2 = GridView5.Rows[e.RowIndex].Cells[7];
        Control i11 = cell1.Controls[0];
        Control i12 = cell2.Controls[0];
        Image image1 = (Image)i11;
        Image image2 = (Image)i12;
        string s1 = image1.ImageUrl;
        System.IO.File.Delete(Server.MapPath(s1));
        string s2 = image2.ImageUrl;
        System.IO.File.Delete(Server.MapPath(s2));
    }
    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = true;
        Panel6.Visible = false;
    }
    protected void signup_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string a = TextBox1.Text;
                SqlCommand cmd = new SqlCommand("select count(*) from admindetails where adminname=@aname", con);
                cmd.Parameters.AddWithValue("@aname",TextBox1.Text);
                con.Open();
                int i = (int)cmd.ExecuteScalar();
                if (i > 0)
                {

                    Label1.Text = "this adminname already exists.enter another adminname ";
                }
                else
                {
                    submitadmindetails();
                    TextBox4.Text = null;
                }
                con.Close();
            }

        }
    }

    private void submitadmindetails()
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd1 = new SqlCommand("insert into admindetails(adminname,password,question,answer) values(@adminname,@pwd,'" + DropDownList1.SelectedValue + "',@answer)", con);
            cmd1.Parameters.AddWithValue("@adminname",TextBox1.Text);
            cmd1.Parameters.AddWithValue("@pwd", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@answer", TextBox4.Text);
            con.Open();
            int j = cmd1.ExecuteNonQuery();
            if (j > 0)
            {
                TextBox1.Text = null;
                Label1.Text = "account created";
            }
            con.Close();
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/adminlogin.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/changepassword.aspx?usertype=admin");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        string fileextension1 = System.IO.Path.GetExtension(FileUpload1.FileName);
        if (!(fileextension1.ToLower() == ".jpg" || fileextension1.ToLower() == ".jpeg" || fileextension1.ToLower() == ".png"))
        {
            Label3.Text = "only files with .jpg, .jpeg or .png are allowed ";
            Label3.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd2 = new SqlCommand("select * from advertisements", con);
                SqlCommand cmd1 = new SqlCommand("select max(imageid) from advertisements", con);
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

                FileUpload1.SaveAs(Server.MapPath("~/abc/" + FileUpload1.FileName));
                Label3.Text = "files uploaded";
                
                SqlCommand cmd = new SqlCommand("insert into advertisements(imagepath,imageid) values(@fileupload,"+j+")", con);
                cmd.Parameters.AddWithValue("@fileupload", "~/abc/" + FileUpload1.FileName);
                cmd.ExecuteNonQuery();

                con.Close();
            }

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell1 = GridView1.Rows[e.RowIndex].Cells[1];        
        Control i11 = cell1.Controls[0];       
        Image image1 = (Image)i11;        
        string s1 = image1.ImageUrl;
        System.IO.File.Delete(Server.MapPath(s1));      
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = true;
    }
}