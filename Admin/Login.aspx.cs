using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Admin_Login : System.Web.UI.Page
{

    string conStr = WebConfigurationManager.ConnectionStrings["KiwanPro"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["Level"] != null && (int)Session["Level"] == 1)
       {
            Response.Redirect("~/Admin/");
       }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "Select * From [KhachHang] Where email=@User and passwd=@Pass AND lv=1";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("User", txtEmail.Text);
        cmd.Parameters.AddWithValue("Pass", txtPass.Text);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            Session["ID"] = rd["user_id"].ToString();
            Session["Ten"] = rd["name"].ToString(); // lưu session cột name
            Session["Level"] = 1;
            Response.Redirect("~/Admin/Default.aspx");
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Email or password incorrect!";
        }
        conn.Close();
        conn.Dispose();
    }
}