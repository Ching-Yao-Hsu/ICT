using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace ICodeTogether
{
    public class ezBtn
    {
        public void Menu_isenable(string str_Mname, int isenable)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            using (conn)
            {
                conn.Open();
                using (cmd.Connection = conn)
                {
                    cmd.CommandText = "UPDATE [dbo].[Navbar_menu] SET [isenable]=@isenable WHERE mname = @mname";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@mname", str_Mname);
                    cmd.Parameters.AddWithValue("@isenable", isenable);                    
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}