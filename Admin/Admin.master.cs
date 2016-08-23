using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Level"] == null) Response.Redirect("~/Admin/Login.aspx");
        if (Session["Ten"] != null)
        {
            if (int.Parse(Session["Level"].ToString()) == 1)
            {
                ltlWelcome.Text = "Welcome, <strong>" + Session["Ten"] + "</strong>";
            }
        }
    }

    protected void lkbOut_Click(object sender, EventArgs e)
    {
            Session.Remove("Ten");
            Session.Remove("ID");
            Session.Remove("Level");

            HttpCookie a = new HttpCookie("ID");
            a.Expires = DateTime.Now.AddDays(-1);   //Thiết lập thời gian hết hiệu lực của cookie = trước 1 ngày (kể từ bây giờ)
            Response.Cookies.Add(a);

            Response.Redirect("~/Admin/Login.aspx"); 
    }
}
