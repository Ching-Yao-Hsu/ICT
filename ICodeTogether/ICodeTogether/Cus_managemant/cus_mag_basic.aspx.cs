using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace ICodeTogether.Cus_managemant
{
    public partial class cus_mag_basic : System.Web.UI.Page
    {
        
        private string strCustName;

        protected void Page_Load(object sender, EventArgs e)
        {
            strCustName = Session["username"].ToString();

           

            if (!Page.IsPostBack)
            {
                try
                {
                    qry_customer();
                }
                catch (Exception ex)
                {
                    throw;
                }            
            }  
        }


        /**********************************************************************************************
         *查詢客戶資料
         **********************************************************************************************/
        protected void qry_customer()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "SELECT * FROM dbo.Customer WHERE CustName = @CustName";
            using (SqlConnection Conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand(strcmd, Conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(strcmd, Conn))
                    {
                        da.SelectCommand.Parameters.AddWithValue("@CustName", strCustName);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        txt_username.Text = dt.Rows[0][4].ToString();
                        txt_useraccount.Text = dt.Rows[0][2].ToString();
                        txt_userbirth.Text = dt.Rows[0][5].ToString();
                        txt_userphone.Text = dt.Rows[0][6].ToString();
                        txt_add.Text = dt.Rows[0][7].ToString();
                        txt_email.Text = dt.Rows[0][8].ToString();
                    }
                }
            }

        }

        /**********************************************************************************************
         *修改按鈕
         **********************************************************************************************/
        protected void btn_submit_Click(object sender, EventArgs e)
        {

            //修改資料
            string strCustID = txt_useraccount.Text;
            string strCustName = txt_username.Text;
            DateTime dtcustbirthday = Convert.ToDateTime(txt_userbirth.Text);
            string strcusttel = txt_userphone.Text;
            string strcustaddr = txt_add.Text;
            string strcustemail = txt_email.Text;
            updcust(strCustID,strCustName,dtcustbirthday,strcusttel,strcustaddr,strcustemail);

            //再重新查詢
            qry_customer();
            //alert修改完成
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('修改完成')", true);
        }

        /**********************************************************************************************
         *修改客戶資料
         **********************************************************************************************/
        protected void updcust(string strCustID,string strCustName,DateTime dtcustbirthday,string strcusttel,string strcustaddr,string strcustemail)
        {

            SqlConnection Conn = new SqlConnection("Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True");
            Conn.Open();
            SqlCommand cmd = new SqlCommand("updatecustomer", Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add(new SqlParameter("@CustNo", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@CustID", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@CustName", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@CustBirthday", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@CustTel", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@CustAddr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@CustEmail", SqlDbType.NVarChar));

            //cmd.Parameters["@CustNo"].Value = strCustNO;
            cmd.Parameters["@CustID"].Value = strCustID;
            cmd.Parameters["@CustName"].Value = strCustName;
            cmd.Parameters["@CustBirthday"].Value = dtcustbirthday;
            cmd.Parameters["@CustTel"].Value = strcusttel;
            cmd.Parameters["@CustAddr"].Value = strcustaddr;
            cmd.Parameters["@CustEmail"].Value = strcustemail;
            cmd.ExecuteNonQuery();

            Conn.Close();
        }

        protected void btn_exit_Click(object sender, EventArgs e)
        {
            qry_customer();
        }
    }
}