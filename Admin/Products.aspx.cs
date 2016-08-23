using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; // add

public partial class Admin_Products : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["KiwanPro"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // load category
            products();
            ddlCat.DataTextField = "category_name";
            ddlCat.DataValueField = "category_id";
            ddlCat.DataSource = RetrieveSubCategories();
            ddlCat.DataBind();
            ddlCat.Items.Insert(0, new ListItem("[All Product]", "0"));

            // button add
            pnlAdd.Visible = false;
        }
        lblSuccess.Visible = false;
        
    }
    string search = "";
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search = "WHERE (product_name LIKE N'%" + txtSearch.Text + "%' OR description LIKE N'%" + txtSearch.Text + "%')";
        if (ddlCat.SelectedValue != "0")
        {
            search += " AND product.category_id =" + ddlCat.SelectedValue;
        }
        products();
    }
    DataTable tb = new DataTable();
    private void products()
    {
        DataTable tb2 = new DataTable();
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * FROM product INNER JOIN category ON product.category_id=category.category_id " + search +" ORDER BY product_id DESC";
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        conn.Open();
        dt.Fill(tb2);
        conn.Close();
        conn.Dispose();
        tb = tb2;
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }
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
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        SqlConnection conn = new SqlConnection(conStr);
        string sql = "DELETE FROM product WHERE product_id =" + id;
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();

        //load dữ liệu lại
        products();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        products();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        products();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //check if is in edit mode
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlSubCategory =
                          (DropDownList)e.Row.FindControl("ddlCategory");
                //Bind subcategories data to dropdownlist
                ddlSubCategory.DataTextField = "category_name";
                ddlSubCategory.DataValueField = "category_id";
                ddlSubCategory.DataSource = RetrieveSubCategories();
                ddlSubCategory.DataBind();
                DataRowView dr = e.Row.DataItem as DataRowView;
                ddlSubCategory.SelectedValue = dr["category_id"].ToString();
            }
        }

    }
    private DataTable RetrieveSubCategories() // lay du lieu cho drop downlist category
    {

        //SQL statement to fetch entries from products
        string sql = "SELECT category_id, category_name FROM category";
        DataTable dtSubCategories = new DataTable();
        //Open SQL Connection
        SqlConnection conn = new SqlConnection(conStr);
        conn.Open();
        //Initialize command object
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //Fill the result set
        da.Fill(dtSubCategories);
        return dtSubCategories;
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the product id of the selected product   
        string productID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.           
        GridViewRow row = GridView1.Rows[e.RowIndex];
        // Get the controls that contain the updated values. In this
        // example, the updated values are contained in the TextBox
        // controls declared in the edit item templates of each TemplateField
        // column fields in the GridView control.
        TextBox img = (TextBox)row.FindControl("txtImg");
        TextBox name = (TextBox)row.FindControl("txtEditName");
        DropDownList cat = (DropDownList)row.FindControl("ddlCategory");
        TextBox price = (TextBox)row.FindControl("txtPrice");
        TextBox des = (TextBox)row.FindControl("txtDescription");

        FileUpload uplImg = (FileUpload)row.FindControl("uplImg");
        if (uplImg.HasFile)
        {
            uplImg.PostedFile.SaveAs(MapPath("~/upload/") + uplImg.PostedFile.FileName);
            string path = "upload/" + uplImg.PostedFile.FileName;
            UpdateProduct(productID, path, name.Text, cat.SelectedValue, price.Text, des.Text);
            GridView1.EditIndex = -1;
            products();
        }
        else if (img.Text.Length > 0)
        {
            UpdateProduct(productID, img.Text, name.Text, cat.SelectedValue, price.Text, des.Text);
            GridView1.EditIndex = -1;
            products();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Images Field not allow to empty!')</script>");
        }
    }
    private void UpdateProduct(string productID, string img, string productname, string CategoryID, string Price, string description)
    {
        //SQL statement to update a product
        string sql = String.Format(@"UPDATE product SET product_img='{0}',      
                                    product_name=N'{1}',                             
                                    category_id='{2}',
                                    price ='{3}',
                                    description =N'{4}'
                                    WHERE product_id = {5}",
                                        img,
                                        productname,
                                        CategoryID,
                                        Price, description, productID);
        SqlConnection conn = new SqlConnection(conStr);
        conn.Open();
        //Initialize command object
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();
        
    }
    protected void btnAddnew_Click(object sender, EventArgs e)
    {
        ddlCat0.DataTextField = "category_name";
        ddlCat0.DataValueField = "category_id";
        ddlCat0.DataSource = RetrieveSubCategories();
        ddlCat0.DataBind();

        if (btnAddnew.Text == " + Add new product ")
        { 
            btnAddnew.Text = " - Cancel add ";
            pnlAdd.Visible = true;
        }
        else 
        {
            btnAddnew.Text = " + Add new product ";
            pnlAdd.Visible = false;
            
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);

        string sql = "INSERT INTO [product] VALUES(@Name, @Cat, @Des, @Price, @Img, @User)";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("Name", txtProductname.Text);
        cmd.Parameters.AddWithValue("Cat", ddlCat0.SelectedValue);
        cmd.Parameters.AddWithValue("Des", txtDes.Text);
        cmd.Parameters.AddWithValue("Price", txtPrice.Text);
        string path = "";
        if (uplImg.HasFile)
        {
            uplImg.PostedFile.SaveAs(MapPath("~/upload/") + uplImg.PostedFile.FileName);
            path = "upload/" + uplImg.PostedFile.FileName;
        }
        cmd.Parameters.AddWithValue("Img", path);
        cmd.Parameters.AddWithValue("User", Session["ID"]);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();
        btnAddnew.Text = " + Add new product ";
        pnlAdd.Visible = false;
        lblSuccess.Visible = true;
        products();
    }
}