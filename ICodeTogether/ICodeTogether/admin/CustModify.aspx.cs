using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICodeTogether.admin
{
    public partial class CustModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (txt_search.Text == string.Empty)
            {
                lv_show.DataSourceID = "sds_show";
            }
            else
            {
                lv_show.DataSourceID = "sds_search";
            }
            lv_selected.DataSourceID = "";
            lv_selected.Visible = false;
        }        

        protected void lv_show_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                lv_selected.DataSourceID = "sds_selected";
                lv_selected.Visible = true;
            }
        }       

        protected void lv_selected_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            
        }
    }
}