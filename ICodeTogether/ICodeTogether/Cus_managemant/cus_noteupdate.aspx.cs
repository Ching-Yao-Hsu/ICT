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
    public partial class cus_noteupdate : System.Web.UI.Page
    {
       
         public string strNoteno = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            strNoteno=Request.QueryString["id"];
            
           
            
            if (!Page.IsPostBack)
            {
               
                qry_note();
            }
            

        }
        protected void qry_note()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "SELECT * FROM dbo.Note WHERE NoteNo = @NoteNo";
            using (SqlConnection conn=new SqlConnection(strconn))
            {
                using(SqlCommand cmd=new SqlCommand(strcmd, conn))
                {
                    using(SqlDataAdapter da=new SqlDataAdapter(strcmd, conn))
                    {
                        da.SelectCommand.Parameters.AddWithValue("@NoteNo", strNoteno);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        lbl_notedate.Text = dt.Rows[0][1].ToString();
                        lbl_ntetitle.Text = dt.Rows[0][4].ToString();
                        txt_notecontent.Text = dt.Rows[0][2].ToString();

                    }
                }
            }
        }
        protected void updateNote(string strNoteContent)
        {

            SqlConnection Conn = new SqlConnection("Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True");
            Conn.Open();
            string strncmd = "UPDATE Note SET NoteContent = @NoteContent WHERE NoteNo =@NoteNo";
            SqlCommand cmd = new SqlCommand(strncmd, Conn);
            cmd.Parameters.Add(new SqlParameter("@NoteNo", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@NoteContent", SqlDbType.NVarChar));

            cmd.Parameters["@NoteNo"].Value = strNoteno;
            cmd.Parameters["@NoteContent"].Value = strNoteContent;

            //cmd.Parameters.AddWithValue("@NoteNo", strNoteno);
            //cmd.Parameters.AddWithValue("@NoteContent", txt_notecontent.Text);

            cmd.ExecuteNonQuery();

            Conn.Close();
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            string strNoteContent = txt_notecontent.Text;
            updateNote(strNoteContent);
            qry_note();
        }

        protected void btn_exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("cus_notefix.aspx");
        }
    }
}