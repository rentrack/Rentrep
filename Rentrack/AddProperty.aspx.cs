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

public partial class AddProperty : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindCities();
            areaddl.Items.Insert(0, new ListItem("- UNAVAILABLE -", "0"));
            areaddl.Attributes.Add("disabled", "disabled");
            subareaddl.Items.Insert(0, new ListItem("- UNAVAILABLE -", "0"));
            subareaddl.Attributes.Add("disabled", "disabled");
        }


        dot1.Attributes.Add("class", "activedot");
        prog1.Attributes.Add("class", "activeprogbar");
        propdetaildiv.Visible = false;
        propimgdiv.Visible = false;
        successdiv.Visible = false;
        
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

            if(dt.Rows.Count != 0)
            {
                cityddl.DataSource = dt;
                cityddl.DataTextField = "city_name";
                cityddl.DataValueField = "city_id";
                cityddl.DataBind();
                cityddl.Items.Insert(0, new ListItem("- SELECT CITY -", "0"));
            }
        }
        
    }

    protected void proptypenextbtn_Click(object sender, EventArgs e)
    {
        proptypediv.Visible = false;
        propdetaildiv.Visible = true;
        dot2.Attributes.Add("class", "activedot");
        prog2.Attributes.Add("class", "activeprogbar");
    }


    protected void propdetprevbtn_Click(object sender, EventArgs e)
    {
        proptypediv.Visible = true;
        propdetaildiv.Visible = false;
        dot2.Attributes.Add("class", "inactivedot");
        prog2.Attributes.Add("class", "inactiveprogbar");
    }

    protected void propdetnextbtn_Click(object sender, EventArgs e)
    {
        propdetaildiv.Visible = false;
        propimgdiv.Visible = true;
        dot3.Attributes.Add("class", "activedot");
        prog3.Attributes.Add("class", "activeprogbar");
    }

    //Generate Property Code
    public string GenerateNumber()
    {
        Random random = new Random();
        string propcode = "";
        int i;
        for (i = 1; i < 11; i++)
        {
            propcode += random.Next(0, 9).ToString();
        }
        return propcode;
    }

    protected void propimgnextbtn_Click(object sender, EventArgs e)
    {
        prog4.Attributes.Add("class", "activeprogbar");
        propimgdiv.Visible = false;
        successdiv.Visible = true;
        Int32 temp = 0;

        //Select Property Purpose
        string proppurpose = "oh";
        if (sellradio.Checked==true)
        {
            proppurpose = sellradio.Text;
        }
        else if (rentradio.Checked==true)
        {
            proppurpose = rentradio.Text;
        }
        else
        {
            proppurpose = "none";
        }
        
        //Property Code
        string propcode = GenerateNumber();
        string cityselected = cityddl.SelectedItem.Value;
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {    
            //Add values to Property Table
            SqlCommand cmd1 = new SqlCommand("INSERT INTO [Property](property_title, property_type, property_purpose, property_desc, property_price, property_code, is_sold, is_rented, area_id, subarea_id) VALUES ('" + tbproptitle.Text + "','"+ propertytypedropdown.SelectedItem.Value + "','" + proppurpose + "','" + tbpropdesc.Text + "','" + tbprice.Text + "','" + propcode + "','" + 0 + "','" + 0 + "','" + areaddl.SelectedItem.Value + "','" + subareaddl.SelectedItem.Value + "')", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            
        }
        /*foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        {
            string filename = Path.GetFileName(postedFile.FileName);
            using (Stream fs = postedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    string constr = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "insert into Property_Image values ( @image_name)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@image_name", filename);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
        */
    }



    protected void propimgprevbtn_Click(object sender, EventArgs e)
    {
        propdetaildiv.Visible = true;
        propimgdiv.Visible = false;
        dot3.Attributes.Add("class", "inactivedot");
        prog3.Attributes.Add("class", "inactiveprogbar");
    }

    protected void areaddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        int areaID = Convert.ToInt32(areaddl.SelectedItem.Value);
        int test = 0;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Subarea where area_id = '" + areaID + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            test = (int)cmd1.ExecuteScalar();

            if ((Convert.ToInt32(cityddl.SelectedItem.Value) != 0) && (test != 0))
            {
                subareaddl.Attributes.Remove("disabled");
                SqlCommand cmd = new SqlCommand("SELECT * FROM Subarea where area_id = '" + areaID + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    subareaddl.DataSource = dt;
                    subareaddl.DataTextField = "subarea";
                    subareaddl.DataValueField = "subarea_id";
                    subareaddl.DataBind();
                    subareaddl.Items.Insert(0, new ListItem("- SELECT SUBAREA -", "0"));
                }
            }
            else
            {
                subareaddl.Attributes.Add("disabled", "disabled");
                subareaddl.SelectedIndex = 0;
            }
        }
    }

    protected void cityddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cityID = Convert.ToInt32(cityddl.SelectedItem.Value);
        int test = 0;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Area where city_id = '" + cityID + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            test = (int)cmd1.ExecuteScalar();

            if ((Convert.ToInt32(cityddl.SelectedItem.Value) != 0) && (test != 0))
            {
                areaddl.Attributes.Remove("disabled");
                SqlCommand cmd = new SqlCommand("SELECT * FROM Area where city_id = '" + cityID + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    areaddl.DataSource = dt;
                    areaddl.DataTextField = "area";
                    areaddl.DataValueField = "area_id";
                    areaddl.DataBind();
                    areaddl.Items.Insert(0, new ListItem("- SELECT AREA -", "0"));
                }
            }
            else
            {
                areaddl.Attributes.Add("disabled", "disabled");
                areaddl.SelectedIndex = 0;
                subareaddl.Attributes.Add("disabled", "disabled");
                subareaddl.SelectedIndex = 0;
            }
        }
        
    }
}