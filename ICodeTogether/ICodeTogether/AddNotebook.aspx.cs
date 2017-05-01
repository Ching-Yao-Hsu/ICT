using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ICodeTogether
{
    public partial class AddNotebook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("InsertNotebook", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@title", SqlDbType.NVarChar));
                    cmd.Parameters.Add(new SqlParameter("@content", SqlDbType.NVarChar));
                    cmd.Parameters.Add(new SqlParameter("@datetime", SqlDbType.DateTime));
           


                    cmd.Parameters["@title"].Value = txtTitle.Text;
                    cmd.Parameters["@content"].Value = txtContent.Text;
                    cmd.Parameters["@datetime"].Value = DateTime.Now.ToString();
                    

                    cmd.ExecuteNonQuery();
                }
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Server.Transfer("UpdateNotebook.aspx");
        }
    }
}