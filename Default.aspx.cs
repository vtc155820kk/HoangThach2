using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class _Default : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["KiwanPro"].ToString(); // chuỗi kết nối từ web.config

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sanphammoi();
            
        }
        
    }

  

    private void sanphammoi()
    {
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * FROM product ORDER BY product_id DESC";
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        conn.Open();
        dt.Fill(ds);
        DataView sp = new DataView(ds.Tables[0]);
        
        for (int i = 0; i < sp.Count; i++)
        {
            ltlProduct.Text += string.Format("<li class='span3 clearfix'><div class='thumbnail'><a href='ChiTietSanPham.aspx?id={1}'><img src='{0}' alt='{2}'></a></div><div class='thumbSetting'><div class='thumbTitle'><h3><a href='ChiTietSanPham.aspx?id={1}' class='invarseColor'>{2}</a></h3></div><div class='product-desc'><p>{3}</p></div><div class='thumbPrice'><span>{4} VNĐ</span></div><div class='thumbButtons'><a class='btn btn-primary btn-small btn-block' href='GioHang.aspx?add={1}&q=1'>Đặt mua</a></div></div></li>", sp[i]["product_img"], sp[i]["product_id"], sp[i]["product_name"], sp[i]["description"], format_price(sp[i]["price"].ToString()));
        }
        conn.Close();
        conn.Dispose();

    } // end void sanphamoi

    
    private string format_price(string val) // định dạng giá
    {
        val = val.Replace(",", "");
        val = val.Replace(".", "");
        string s = "";
        while (val.Length > 3)
        {
            s = "." + val.Substring(val.Length - 3) + s;
            val = val.Substring(0, val.Length - 3);

        }
        s = val + s;
        return s;
    } // end định dạng giá

    
    
} // end class