using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.SignalR;
namespace ServerToclientUpdate
{
    public partial class PurchaseItem : System.Web.UI.Page 
    {
        ShoppingEntities context = new ShoppingEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CardNumber"] == null)
            {
                Response.Redirect("EnterCardNumber.aspx");
            }
            if (!IsPostBack)
            {
                CardNumber.Text = Session["CardNumber"].ToString();
                
            }
        }

        // Add item in purchase item into card .
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                int rowIndex=Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(((Label)GridView1.Rows[rowIndex].FindControl("lblid")).Text.Trim());

            

                var Row = GridView1.Rows[rowIndex];

                Label lblId = (Label)Row.FindControl("lblid");
                Label lblStockId = (Label)Row.FindControl("lblStock");

                ItemCollection itmcol = context.ItemCollections.Where(i => i.Id == id).FirstOrDefault();
                itmcol.Stock = itmcol.Stock - 1;
                context.SaveChanges();

                ItemPurchased itmPur = new ItemPurchased();
                
                string Cardnumber = Session["CardNumber"].ToString();
                itmPur.CustomerCardId = context.CustomerCards.Where(c => c.CardNumber == Cardnumber).FirstOrDefault().Id;
                itmPur.ItemId = id;

                context.ItemPurchaseds.AddObject(itmPur);
                context.SaveChanges();

                // call the CallUpdate method with parameter lable id and current stock status.
                UpdaterHub.CallUpdate(lblStockId.ClientID, itmcol.Stock.ToString());

                TestServertoClient.DataBind();
                GridView1.DataBind();
            }
        }

        

    }
}