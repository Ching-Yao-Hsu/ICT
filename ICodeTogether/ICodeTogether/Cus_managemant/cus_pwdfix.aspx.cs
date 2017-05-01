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
    public partial class cus_pwdfix : System.Web.UI.Page
    {

        protected string strCustpwd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            strCustpwd = Session["savepass"].ToString();



            if (!IsPostBack)
            {
                txt_oldpwd.Text = "";
                txt_newpwd.Text = "";
                txt_newpwd2.Text = "";
            }
            else
            {
                strCustpwd = Session["savepass"].ToString();
            }
        

        }

        /// <summary>
/// 修改密碼事件
/// </summary>
        protected void btn_check_Click(object sender, EventArgs e)
        { 
            Label4.Text = "";
            if (txt_oldpwd.Text=="")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('請輸入欲改密碼')", true);
            }
            else
            {
                CheckUserpwd();
                if (txt_newpwd.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('請輸入新密碼')", true);
                }
                else
                {

                    if (txt_newpwd.Text == txt_newpwd2.Text)
                    {
                        Uppassword(strCustpwd);
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('您的密碼已修改成功')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('兩次密碼輸入不同,請重新輸入')", true);
                        txt_newpwd.Text = "";
                        txt_newpwd2.Text = "";
                    }
                }
            }

           


        }


        /// <summary>
        /// 確認使用者
        /// </summary>
        protected  void CheckUserpwd()
        {
            if (txt_oldpwd.Text != strCustpwd)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('原密碼有誤,請輸入正確密碼')", true);
                txt_oldpwd.Text = "";
            }
        }

        
        /// <summary>
        /// 更新密碼
        /// </summary>

        protected void Uppassword(string strCustpwd)
        {
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Customer SET CustPassword=@newpwd WHERE CustPassword= @CustPassword", conn);
            cmd.Parameters.Add(new SqlParameter("@CustPassword", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@newpwd", SqlDbType.NVarChar));
            cmd.Parameters["@CustPassword"].Value = strCustpwd;
            cmd.Parameters["@newpwd"].Value = txt_newpwd.Text;

            cmd.ExecuteNonQuery();
            conn.Close();

        }
        
        /// <summary>
        /// 重新填寫
        /// </summary>
     
        protected void btn_exit_Click(object sender, EventArgs e)
        {
            txt_oldpwd.Text = "";
            txt_newpwd.Text = "";
            txt_newpwd2.Text = "";


        }
    }
}