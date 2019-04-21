using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class AddCity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        remlblmsg.Text = "";
        if (!IsPostBack)
        {
            BindCityRptr();
        }
    }

    private void BindCityRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from City", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtcities = new DataTable();
                    sda.Fill(dtcities);
                    rptrcities.DataSource = dtcities;
                    rptrcities.DataBind();
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
            SqlCommand checkcity = new SqlCommand("SELECT count(*) from [City] where city_name ='" + tbcity.Text + "'" + " AND province_state ='" + tbprovince.Text + "' AND country = '" + tbcountry.Text + "'", con);
            con.Open();
            checkcity.ExecuteNonQuery();
            temp = Convert.ToInt32(checkcity.ExecuteScalar().ToString());

            if (temp != 0) //a record is found
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "This record already exists in the database.";
            }
            else
            {
                //Add City to table
                SqlCommand addcity = new SqlCommand("INSERT INTO [City](city_name, province_state, country) VALUES ('" + tbcity.Text + "','" + tbprovince.Text + "','" + tbcountry.Text + "')", con);
                addcity.ExecuteNonQuery();
                lblMsg.ForeColor = Color.Green;
                lblMsg.Text = "Record added successfully.";

                //Clear input fields
                tbcity.Text = string.Empty;
                tbprovince.Text = string.Empty;
                tbcountry.Text = string.Empty;
            }
        }
        BindCityRptr();

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
        int.TryParse(tbcityid.Text, out idToDelete);
        
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Check if this record exists
            int x = 0, y = 0;
            SqlCommand checkcity = new SqlCommand("SELECT count(*) from [City] where city_id ='" + idToDelete + "'", con);
            con.Open();
            checkcity.ExecuteNonQuery();
            x = Convert.ToInt32(checkcity.ExecuteScalar().ToString());

            if(x != 0) //Record exists
            {
                SqlCommand checkhist = new SqlCommand("SELECT count(*) FROM Area WHERE city_id='" + idToDelete + "'", con);
                checkhist.ExecuteNonQuery();
                y = Convert.ToInt32(checkhist.ExecuteScalar().ToString());

                if (y != 0)
                {
                    remlblmsg.ForeColor = Color.Red;
                    remlblmsg.Text = "ERROR: This city is referenced by areas. To delete this city, first delete those areas.";
                }
                else { 
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Are you sure you wish to delete this record?');", true);
                    //Response.Write("<script language=javascript>alert('Are you sure you wish to delete this record?')</script>");
                    SqlCommand remrec = new SqlCommand("DELETE FROM City WHERE city_id='" + idToDelete + "'", con);
                    remrec.ExecuteNonQuery();
                    tbcityid.Text = string.Empty;
                    remlblmsg.ForeColor = Color.Green;
                    remlblmsg.Text = "Record removed successfully.";
                }
            }
            else {

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
        BindCityRptr();
    }
}