using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 
using System.Data.SqlClient; 
using System.Web.Configuration; 

public partial class Admin_HoaDon : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["KiwanPro"].ToString(); 
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = txtidhd.Text;
        string makh = txtmahd.Text;
        string tenkh = txttenkh.Text;
        string sql = String.Format("Insert into HoaDon values('" + id + "','" + makh + "','" + tenkh + "')");
        SqlConnection conn = new SqlConnection(conStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();
    }
}