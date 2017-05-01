using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ICodeTogether.Cus_managemant
{
    public partial class cus_notefix : System.Web.UI.Page
    {
        private string strCustName;
        protected void Page_Load(object sender, EventArgs e)
        {

            strCustName = Session["username"].ToString();
            

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "mydelete")
            {
                foreach (RepeaterItem RpItem in Repeater1.Items)
                {
                    CheckBox CB = (CheckBox)RpItem.FindControl("CheckBox1");
                    if (CB.Checked)
                    {
                        Response.Write(CB.Text + "<br>");
                        string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
                        string strcmd = "DELETE dbo.Note WHERE NoteNo ='"+CB.Text+"'";
                        SqlConnection conn = new SqlConnection(strconn);
                        conn.Open();
                        SqlCommand cmd = new SqlCommand(strcmd, conn);
                       
                        cmd.ExecuteNonQuery();
                        conn.Close();

                    }
                   
                }
               
            }
            Response.Redirect("cus_notefix.aspx");


        }
       
    }
}