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
    public partial class C_CSharp2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetContent();
            PrintUserName();
        }

        protected void GetContent()
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "select UnitContent from Unit where UnitNo = 'U006'";
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    string str = dr["unitContent"].ToString();
                    lblcontent1.Text = str;
                }
                cmd.Cancel();
                dr.Close();
            }
            catch (Exception)
            {

            }
            finally
            {
                conn.Close();
            }
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            string b;
            b = txtContent.Text;
            b = b.Replace(" ", "&nbsp;");
            b = b.Replace("\n", "<br>");
            try
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("InsertGuestbook", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.Text));
                    cmd.Parameters.Add(new SqlParameter("@content", SqlDbType.Text));
                    //cmd.Parameters.Add(new SqlParameter("@datetime", SqlDbType.DateTime));
                    cmd.Parameters.Add(new SqlParameter("@unitNo", SqlDbType.NVarChar));

                    cmd.Parameters["@name"].Value = txtName.Text;
                    cmd.Parameters["@content"].Value = b;
                    //cmd.Parameters["@datetime"].Value = DateTime.Now.ToString();
                    cmd.Parameters["@unitNo"].Value = "U006";
                    cmd.ExecuteNonQuery();
                    //Response.Redirect(Request.RawUrl);
                    cmd.Cancel();
                    Repeater1.DataSourceID = "SqlDataSource1";
                }
            }

            catch (Exception)
            {

            }
        }

        protected void PrintUserName()
        {
            string str_conn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string str_cmd = "SELECT CustName FROM Customer WHERE CustID = @CustID";
            string str_CustID = Session["savepass"].ToString();
            using (SqlConnection conn = new SqlConnection(str_conn))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(str_cmd, conn))
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@CustID", str_CustID);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        txtName.Text = dr["CustName"].ToString();
                    }
                    cmd.Cancel();
                }
            }

        }
    }
}