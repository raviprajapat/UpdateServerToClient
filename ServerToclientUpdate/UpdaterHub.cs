using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
namespace ServerToclientUpdate
{
    /// <summary>
    /// Derived signalr hub class
    /// </summary>
    public class UpdaterHub : Hub
    {

        /// <summary>
        /// Call that method where current item stock is update.(GridView1_RowCommand event : PurchaseItem.aspx)
        /// </summary>
        /// <param name="lableid">Lable client id, which used to set current item stock status.</param>
        /// <param name="currentstock">Update current item stock.</param>
        public static void CallUpdate(string lableid, string currentstock)
        {
            var hub = GlobalHost.ConnectionManager.GetHubContext<ServerToclientUpdate.UpdaterHub>();
            // broadcast the lableid and currentstock status at client side.
            hub.Clients.All.UpdateStock(lableid, currentstock);

        }

        // We can broadcast message and data between particular connection and particular group. 
    }
}