<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Users.aspx.vb" Inherits="coursework.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="USER_CONTACT" HeaderText="USER_CONTACT" SortExpression="USER_CONTACT" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;) VALUES (:USER_ID, :USER_NAME, :USER_EMAIL, :USER_CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_EMAIL&quot; = :USER_EMAIL, &quot;USER_CONTACT&quot; = :USER_CONTACT WHERE &quot;USER_ID&quot; = :USER_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
           
            <InsertItemTemplate>
                USER_ID:
                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                <br />
                USER_NAME:
                <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' />
                <br />
                USER_EMAIL:
                <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' />
                <br />
                USER_CONTACT:
                <asp:TextBox ID="USER_CONTACTTextBox" runat="server" Text='<%# Bind("USER_CONTACT") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
