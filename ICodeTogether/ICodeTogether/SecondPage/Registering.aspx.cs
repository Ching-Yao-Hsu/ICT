using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using ezICT;

namespace ICodeTogether
{
    public partial class Registering : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            
            string str_name = txt_name.Text;
            if (!ezCheckname(str_name) == true)
            {
                if (txt_password.Text == txt_passwordcheck.Text)
                {                    
                    ezInsert();
                    Session["savepass"] = txt_account.Text;
                    Session["username"] = txt_name.Text;
                    Response.Redirect("../HomePage.aspx");
                    Response.End();
                }
                else
                {
                    lbl_message1.Text = "密碼輸入不正確";
                    lbl_message2.Text = "密碼輸入不正確";
                }
            }
            else {
                lbl_message1.Text = "名字重複";
                lbl_message2.Text = "名字重複";
            }
        }

        private bool ezCheckname(string sUserName)
        {            
            bool bln_checkname=true;            
            Ezadonet ezadonet = new Ezadonet();
            try
            {
                ezadonet.Open();
                ezadonet.CommandText = "SELECT [CustID] FROM [dbo].[Customer] WHERE [CustName]=@CustName";
                ezadonet.ParametersClear();
                ezadonet.ParametersAdd("@CustName", txt_name.Text);
                bln_checkname = ezadonet.HasRow;
                if (bln_checkname) sUserName = ezadonet.GetStringValue("CustID");
            }
            catch (Exception e)
            {
                lbl_message1.Text = e.Message;
                lbl_message2.Text = e.Message;
            }
            finally {
                ezadonet.Close();
            }
            
            return bln_checkname;
        }
        
        private void ezInsert()
        {
            string str_conn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string str_storePro = "AddCustomer";
            try
            {
                using (SqlConnection conn = new SqlConnection(str_conn))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(str_storePro, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@CustName", txt_name.Text);
                        cmd.Parameters.AddWithValue("@CustID", txt_account.Text);
                        cmd.Parameters.AddWithValue("@CustPassword", txt_passwordcheck.Text);
                        cmd.Parameters.AddWithValue("@CustBirthday", txt_birthday.Text);
                        cmd.Parameters.AddWithValue("@CustTel", txt_phone.Text);
                        cmd.Parameters.AddWithValue("@CustAddr", txt_addr.Text);
                        cmd.Parameters.AddWithValue("@CustEmail", txt_email.Text);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception e)
            {
                lbl_message1.Text = e.Message;
                lbl_message2.Text = e.Message;
            }







        }        
    }
}