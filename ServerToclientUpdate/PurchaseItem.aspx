<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseItem.aspx.cs" Inherits="ServerToclientUpdate.PurchaseItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-1.1.0-beta1.js" type="text/javascript"></script>
    <!-- Below script generated on run time, you can find your derived hub method and broadcast method into it script file -->
    <script src="signalr/hubs" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

            //Hub reference 
            var usc = $.connection.updaterHub;
            //That function used by hub for broadcast message
            usc.client.updateStock = function (lableid, currentstock) {

                //Used lable id for reference particular control for set current stock
                lableid = '#' + lableid;
                $(lableid).text('');
                //Set current stock on label
                $(lableid).text(currentstock);
                //alert(lableid + " " + currentstock);
                // $("#txtSpan").val("Change");
                //$("#txtcheck").val(lableid);
            };

            //Start the hub connetion
            $.connection.hub.start();

            //Testing purpose
            //            $("#herfClick").click(function () {
            //                alert("call");
            //                usc.server.callUpdate('lbl0', '100');
            //            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Using card Number
                </td>
                <td>
                    <asp:Label ID="CardNumber" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                        DataSourceID="TestServertoClient" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <%--<asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock"  />--%>
                            <asp:TemplateField HeaderText="Stock">
                                <ItemTemplate>
                                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock")  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnAdd" Text="Add to Card" runat="server" CommandName="Add" CommandArgument='<%# Container.DataItemIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <a href="#" id="herfClick">Click Me</a>
        <input type="text" id="txtcheck" />
    </div>
    <asp:EntityDataSource ID="TestServertoClient" runat="server" ConnectionString="name=ShoppingEntities"
        DefaultContainerName="ShoppingEntities" EnableFlattening="False" EntitySetName="ItemCollections">
    </asp:EntityDataSource>
    </form>
</body>
</html>
