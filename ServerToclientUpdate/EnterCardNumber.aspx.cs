using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerToclientUpdate
{
    public partial class EnterCardNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcessCard_Click(object sender, EventArgs e)
        {
            Session["CardNumber"] = txtCardNumber.Text.Trim();
            if (txtCardNumber.Text.Trim() != string.Empty)
            {
                Response.Redirect("PurchaseItem.aspx");
            }

        }
    }
}