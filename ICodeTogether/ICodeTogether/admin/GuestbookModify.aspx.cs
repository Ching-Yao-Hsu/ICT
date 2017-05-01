using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICodeTogether.admin
{
    public partial class GuestbookModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        }
    }
}