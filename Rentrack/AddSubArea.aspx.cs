using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class AddSubArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        remlblmsg.Text = "";
        if (!IsPostBack)
        {
            BindAreas();
            BindSubAreaRptr();
        }
    }

    private void BindAreas()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Area", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                areaddl.DataSource = dt;
                areaddl.DataTextField = "area";
                areaddl.DataValueField = "area_id";
                areaddl.DataBind();
                areaddl.Items.Insert(0, new ListItem("- SELECT AN AREA -", "0"));
            }
        }
    }

    private void BindSubAreaRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.* from Subarea A inner join Area B on B.area_id = A.area_id", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtsubareas = new DataTable();
                    sda.Fill(dtsubareas);
                    rptrareas.DataSource = dtsubareas;
                    rptrareas.DataBind();
                }
            }
        }

    }

    protected void Addtodbbtn_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            int temp = 0;

            //Get city id
            SqlCommand com = new SqlCommand("SELECT area_id FROM [Area] WHERE area = '" + areaddl.SelectedItem.Text + "'", con);
            con.Open();
            int tbarea = (int)com.ExecuteScalar();
            com.ExecuteNonQuery();
            com.Parameters.Clear();



            //Check if Subarea is present in Subarea Table
            SqlCommand checkarea = new SqlCommand("SELECT count(*) from Subarea where subarea ='" + tbsubarea.Text + "' AND area_id = '" + tbarea + "'", con);
            checkarea.ExecuteNonQuery();
            temp = Convert.ToInt32(checkarea.ExecuteScalar().ToString());
            if (temp != 0) //a record is found
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "This record already exists in the database.";
            }
            else //record is not found
            {
                //Add Area to table
                SqlCommand addcity = new SqlCommand("INSERT INTO [Subarea](subarea, area_id) VALUES ('" + tbsubarea.Text + "','" + tbarea + "')", con);
                addcity.ExecuteNonQuery();
                lblMsg.ForeColor = Color.Green;
                lblMsg.Text = "Record added successfully.";

                //Clear input fields
                tbsubarea.Text = string.Empty;
            }

        }
        BindSubAreaRptr();

        //Make Add Panel active
        remheading.CssClass = remheading.CssClass.Replace("active", "");
        remrow.CssClass = remrow.CssClass.Replace("active", "fade");

        //Make Remove Panel inactive
        addheading.CssClass = "nav-link tabheadings active";
        addrow.CssClass = "tab-pane container col-12 active";
    }

    protected void removebtn_Click(object sender, EventArgs e)
    {
        int idToDelete;
        int.TryParse(tbsubareaid.Text, out idToDelete);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Check if this record exists
            int x = 0;
            SqlCommand checksubarea = new SqlCommand("SELECT count(*) from [Subarea] where subarea_id ='" + idToDelete + "'", con);
            con.Open();
            checksubarea.ExecuteNonQuery();
            x = Convert.ToInt32(checksubarea.ExecuteScalar().ToString());

            if (x != 0) //Record exists
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Are you sure you wish to delete this record?');", true);
                //Response.Write("<script language=javascript>alert('Are you sure you wish to delete this record?')</script>");
                SqlCommand remrec = new SqlCommand("DELETE FROM Subarea WHERE subarea_id='" + idToDelete + "'", con);
                remrec.ExecuteNonQuery();
                tbsubareaid.Text = string.Empty;
                remlblmsg.ForeColor = Color.Green;
                remlblmsg.Text = "Record removed successfully.";
            }
            else
            {
                remlblmsg.ForeColor = Color.Red;
                remlblmsg.Text = "This record does not exist.";
            }
        }
        //Make Add Panel inactive
        addheading.CssClass = addheading.CssClass.Replace("active", "");
        addrow.CssClass = addrow.CssClass.Replace("active", "fade");

        //Make Remove Panel active
        remheading.CssClass = "nav-link tabheadings active";
        remrow.CssClass = "tab-pane container col-12 active";
        BindSubAreaRptr();
    }
}