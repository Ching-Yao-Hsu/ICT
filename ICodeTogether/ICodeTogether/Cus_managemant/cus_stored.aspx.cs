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
    public partial class cus_stored : System.Web.UI.Page
    {
        string strCustID = "";        
        protected void Page_Load(object sender, EventArgs e)
        {

            strCustID = Session["savepass"].ToString();
            txt_cusid.Text = strCustID;            
            showbalances();
            upbalances();
            if (!Page.IsPostBack)
            {
               
            }
            else
            {                
                showdetail();                
            }
                     
        }
        /**********************************************************************************************
         *顯示客戶本次儲值明細
         **********************************************************************************************/
        protected void showdetail()
        {
            DateTime currentTime = System.DateTime.Now;
            lbl_id.Text = txt_cusid.Text;
            lbl_date.Text = currentTime.ToString();
            lbl_function.Text = DropDownList1.Text;
            lbl_money.Text = RadioButtonList1.Text;
           
        }
        /**********************************************************************************************
                 *客戶儲值
        **********************************************************************************************/

        protected void addstored(string strCustID, DateTime dtstoredate, string storedfunction,int storedvalues)
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "INSERT INTO Cus_Stored(CustID,Stored_date,Stored_function,Stored_value)VALUES( @CustID,@storedate,@storedfunction,@storedvalues)";
            SqlConnection Conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(strcmd, Conn);
            Conn.Open();
            cmd.Parameters.Add(new SqlParameter("@CustID", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@storedate", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@storedfunction", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@storedvalues", SqlDbType.Int));
            cmd.Parameters["@CustID"].Value = strCustID;
            cmd.Parameters["@storedate"].Value = dtstoredate;
            cmd.Parameters["@storedfunction"].Value = storedfunction;
            cmd.Parameters["@storedvalues"].Value = storedvalues;
            cmd.ExecuteNonQuery();
            Conn.Close();



        }
        /**********************************************************************************************
         *客戶儲值確認
         **********************************************************************************************/

        protected void btn_check_Click(object sender, EventArgs e)
        {
            string strCustID = lbl_id.Text;
            DateTime dtstoredate= Convert.ToDateTime(lbl_date.Text);
            string storedfunction = lbl_function.Text;
            int storedvalues = int.Parse(lbl_money.Text);
            addstored(strCustID, dtstoredate, storedfunction, storedvalues);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('加值成功')", true);
            
            Response.Redirect("cus_stored_details.aspx");
            
        }

        /**********************************************************************************************
         *顯示客戶餘額
         **********************************************************************************************/
        protected void showbalances()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "SELECT TOP 1  (SELECT  SUM(amount) FROM [dbo].[vi_course_detail] AS T2 WHERE [OrderDate] <= T1.[OrderDate] and [CustID] = @CustID) AS balance FROM[dbo].[vi_course_detail] AS T1  WHERE[CustID] = @CustID ORDER BY[OrderDate] DESC ";
            
            SqlConnection Conn = new SqlConnection(strconn);
            Conn.Open();
            using (SqlCommand cmd = new SqlCommand(strcmd, Conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(strcmd, Conn))
                {
                   
                    da.SelectCommand.Parameters.AddWithValue("@CustID", strCustID);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    lbl_balance.Text = dt.Rows[0][0].ToString();
                    
                }
            }           
        }
        /**********************************************************************************************
         *客戶餘額更新
         **********************************************************************************************/
        protected void upbalances()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "UPDATE Customer SET CustOverage=@CustOverage WHERE CustID = @CustID ";
            SqlConnection Conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(strcmd, Conn);
            Conn.Open();
            cmd.Parameters.AddWithValue("@CustID", strCustID);
            cmd.Parameters.AddWithValue("@CustOverage", lbl_balance.Text);
            cmd.ExecuteNonQuery();
            Conn.Close();
            
           
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            Panel_details.Visible = true;
            
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }
    }
}