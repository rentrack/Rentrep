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

public partial class AddArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        remlblmsg.Text = "";
        if (!IsPostBack)
        {
            BindCities();
            BindAreaRptr();
        }
    }

    private void BindCities()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM City", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                cityddl.DataSource = dt;
                cityddl.DataTextField = "city_name";
                cityddl.DataValueField = "city_id";
                cityddl.DataBind();
                cityddl.Items.Insert(0, new ListItem("- SELECT A CITY -", "0"));
            }
        }
    }

    private void BindAreaRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.* from Area A inner join City B on B.city_id = A.city_id", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtareas = new DataTable();
                    sda.Fill(dtareas);
                    rptrareas.DataSource = dtareas;
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
            SqlCommand com = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + cityddl.SelectedItem.Text + "'", con);
            con.Open();
            int tbcity = (int)com.ExecuteScalar();
            com.ExecuteNonQuery();
            com.Parameters.Clear();

            

            //Check if Area is present in Area Table
            SqlCommand checkarea = new SqlCommand("SELECT count(*) from Area where area ='" + tbarea.Text + "' AND city_id = '" + tbcity + "'", con);
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
                SqlCommand addcity = new SqlCommand("INSERT INTO [Area](area, city_id) VALUES ('" + tbarea.Text + "','" + tbcity + "')", con);
                addcity.ExecuteNonQuery();
                lblMsg.ForeColor = Color.Green;
                lblMsg.Text = "Record added successfully.";

                //Clear input fields
                tbarea.Text = string.Empty;
            }
            
        }
        BindAreaRptr();

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
        int.TryParse(tbareaid.Text, out idToDelete);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Check if this record exists
            int x = 0, y = 0;
            SqlCommand checkarea = new SqlCommand("SELECT count(*) from [Area] where area_id ='" + idToDelete + "'", con);
            con.Open();
            checkarea.ExecuteNonQuery();
            x = Convert.ToInt32(checkarea.ExecuteScalar().ToString());

            if (x != 0) //Record exists
            {
                SqlCommand checkhist = new SqlCommand("SELECT count(*) FROM Subarea WHERE area_id='" + idToDelete + "'", con);
                checkhist.ExecuteNonQuery();
                y = Convert.ToInt32(checkhist.ExecuteScalar().ToString());

                if(y != 0)
                {
                    remlblmsg.ForeColor = Color.Red;
                    remlblmsg.Text = "ERROR: This area is referenced by sub-areas. To delete this area, first delete those subareas.";
                }
                else { 
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Are you sure you wish to delete this record?');", true);
                    //Response.Write("<script language=javascript>alert('Are you sure you wish to delete this record?')</script>");
                    SqlCommand remrec = new SqlCommand("DELETE FROM Area WHERE area_id='" + idToDelete + "'", con);
                    remrec.ExecuteNonQuery();
                    tbareaid.Text = string.Empty;
                    remlblmsg.ForeColor = Color.Green;
                    remlblmsg.Text = "Record removed successfully.";
                }
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
        BindAreaRptr();
    }
}