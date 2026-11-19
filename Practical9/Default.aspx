<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Practical9.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Placement Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">

        <h1>Placement Dashboard</h1>
        <hr />

        <h3>Placement Summary</h3>

        <%-- Summary values are filled from the database in Page_Load --%>
        <table border="1" cellpadding="8">
            <tr>
                <td>Total Students</td>
                <td><asp:Label ID="lblTotal" runat="server" /></td>
            </tr>
            <tr>
                <td>Placed Students</td>
                <td><asp:Label ID="lblPlaced" runat="server" /></td>
            </tr>
            <tr>
                <td>Unplaced Students</td>
                <td><asp:Label ID="lblUnplaced" runat="server" /></td>
            </tr>
            <tr>
                <td>Placement Percentage</td>
                <td><asp:Label ID="lblPercentage" runat="server" /></td>
            </tr>
            <tr>
                <td>Highest Package (LPA)</td>
                <td><asp:Label ID="lblHighestPackage" runat="server" /></td>
            </tr>
        </table>

        <h3>Student Placement Records</h3>

        <%-- GridView data control: displays all rows of the Students table --%>
        <asp:GridView ID="gvPlacements" runat="server"
            AutoGenerateColumns="True"
            CellPadding="5"
            EmptyDataText="No student records found.">
        </asp:GridView>

        <br />

        <asp:HyperLink ID="lnkCompanies" runat="server"
            NavigateUrl="~/Companies.aspx">
            View Company Summary
        </asp:HyperLink>

        <br /><br />
    </form>
</body>
</html>
