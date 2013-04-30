<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterCardNumber.aspx.cs"
    Inherits="ServerToclientUpdate.EnterCardNumber" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Enter Card Number
                </td>
                <td>
                    <asp:TextBox ID="txtCardNumber" runat="server" Width="234px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnProcessCard" runat="server" Text="Process Card" 
                        onclick="btnProcessCard_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
