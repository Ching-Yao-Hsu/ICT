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
    public partial class notebook : System.Web.UI.Page
    {
        private string strUserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            strUserName = Session["username"].ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList1.SelectedValue = Session["username"].ToString();
            txtContent.Text = DropDownList1.SelectedValue;
            //Response.Write(DropDownList1.SelectedItem); //測試所選取的值


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string str = DropDownList1.SelectedItem.ToString();            

            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString))
            {                    
                    conn.Open();
                    string updatecmd = "UPDATE Note SET NoteContent = @NoteContent WHERE NoteTitle = @NoteTitle";
                    SqlCommand cmd = new SqlCommand(updatecmd, conn);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@NoteTitle", str);
                    //Response.Write(DropDownList1.SelectedItem);
                    cmd.Parameters.AddWithValue("@NoteContent", txtContent.Text);
                    cmd.ExecuteNonQuery();
                    //Response.Redirect(Request.RawUrl);                    
                    DropDownList1.Items.Clear();
                    DropDownList1.DataSourceID = "SqlDataSource2";
                    DropDownList1.DataBind();
            }            
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            string str = DropDownList1.SelectedItem.ToString();
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString))
            {
                conn.Open();
                string deletecmd = "DELETE FROM Note WHERE NoteTitle = @NoteTitle";
                SqlCommand cmd = new SqlCommand(deletecmd, conn);
                cmd.Parameters.AddWithValue("@NoteTitle", str);
                //Response.Write(DropDownList1.SelectedItem);
                cmd.Parameters.AddWithValue("@NoteContent", txtContent.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);

            } 
        }

        protected void btnBackAdd_Click(object sender, EventArgs e)
        {
                Server.Transfer("AddNotebook.aspx");
        }
    }
}