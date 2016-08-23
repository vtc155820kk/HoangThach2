using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; // add

public partial class Admin_Categories : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["KiwanPro"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            categories();

            // button add
            pnlAdd.Visible = false;
        }
        lblSuccess.Visible = false;
    }
    string search = "";
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search = "WHERE category_name LIKE N'%" + txtSearch.Text + "%'";
        categories();
    }

    DataTable tb = new DataTable();
    private void categories()
    {
        DataTable tb2 = new DataTable();
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * FROM category " + search + " ORDER BY category_id DESC";
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        conn.Open();
        dt.Fill(tb2);
        conn.Close();
        conn.Dispose();
        tb = tb2;
        GridView1.DataSource = tb;
        GridView1.DataBind();
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        SqlConnection conn = new SqlConnection(conStr);
        string sql = "DELETE FROM category WHERE category_id =" + id;
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();

        //load dữ liệu lại
        categories();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        categories();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the product id of the selected product   
        string catID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.           
        GridViewRow row = GridView1.Rows[e.RowIndex];
        // Get the controls that contain the updated values. In this
        // example, the updated values are contained in the TextBox
        // controls declared in the edit item templates of each TemplateField
        // column fields in the GridView control.
        TextBox name = (TextBox)row.FindControl("txtEditName");
        DropDownList catpar = (DropDownList)row.FindControl("ddlCategory");
        UpdateCategories(catID, name.Text, catpar.Text);
        GridView1.EditIndex = -1;
        categories();
    }
    private void UpdateCategories(string catID, string name, string catpar)
    {
        //SQL statement to update a product
        string sql = String.Format(@"UPDATE category SET category_name=N'{0}',      
                                    parent_id='{1}'
                                    WHERE category_id = {2}",
                                        name,
                                        catpar, catID);
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
        ddlCat0.Items.Insert(0, new ListItem("[No one]", "0"));

        if (btnAddnew.Text == " + Add new category ")
        {
            btnAddnew.Text = " - Cancel add ";
            pnlAdd.Visible = true;
        }
        else
        {
            btnAddnew.Text = " + Add new category ";
            pnlAdd.Visible = false;

        }
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
                ddlSubCategory.Items.Insert(0, new ListItem("[No one]", "0"));
                DataRowView dr = e.Row.DataItem as DataRowView;
                ddlSubCategory.SelectedValue = dr["parent_id"].ToString();
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);

        string sql = "INSERT INTO [category] VALUES(@Name, @CatPar)";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("Name", txtCategory.Text);
        cmd.Parameters.AddWithValue("CatPar", ddlCat0.SelectedValue);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();
        btnAddnew.Text = " + Add new product ";
        pnlAdd.Visible = false;
        lblSuccess.Visible = true;
        categories();
    }
}