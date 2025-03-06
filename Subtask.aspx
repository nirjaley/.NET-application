<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Subtask.aspx.vb" Inherits="coursework.Subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        
        <asp:BoundField DataField="SUBTASK_ID" HeaderText="SUBTASK_ID" ReadOnly="True" SortExpression="SUBTASK_ID" />
        <asp:TemplateField HeaderText="TASK_ID" SortExpression="TASK_ID">
    <EditItemTemplate>
        <asp:DropDownList ID="DropDownList2" runat="server" 
            DataSourceID="SqlDataSource1" 
            DataTextField="TASK_NAME" 
            DataValueField="TASK_ID" 
            SelectedValue='<%# Bind("TASK_ID") %>'>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASK_DETAILS&quot;"></asp:SqlDataSource>
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TASK_ID") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>

        <asp:BoundField DataField="SUBTASK_NAME" HeaderText="SUBTASK_NAME" SortExpression="SUBTASK_NAME" />
        <asp:TemplateField HeaderText="START_DATE" SortExpression="START_DATE">
            <ItemTemplate>
                <%# Eval("START_DATE", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="DUE_DATE" SortExpression="DUE_DATE">
            <ItemTemplate>
                <%# Eval("DUE_DATE", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="USER_ID" SortExpression="USER_ID">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("USER_ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASK_ID&quot;, &quot;TASK_ID&quot;, &quot;SUBTASK_NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;USER_ID&quot;) VALUES (:SUBTASK_ID, :TASK_ID, :SUBTASK_NAME, :START_DATE, :DUE_DATE, :USER_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;TASK_ID&quot; = :TASK_ID, &quot;SUBTASK_NAME&quot; = :SUBTASK_NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;USER_ID&quot; = :USER_ID WHERE &quot;SUBTASK_ID&quot; = :SUBTASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                SUBTASK_ID:
                <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' />
                <br />
                TASK_ID:
                <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />
                SUBTASK_NAME:
                <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' />
                <br />
                START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                <br />
                DUE_DATE:
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />

                <br />
                USER_ID:
                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                SUBTASK_ID:
                <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' />
                <br />
                SELECTED TASK:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASK_NAME" DataValueField="TASK_ID" SelectedValue='<%# Bind("TASK_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASK_ID&quot;, &quot;TASK_NAME&quot; FROM &quot;TASK_DETAILS&quot;"></asp:SqlDataSource>
                <br />
                SUBTASK_NAME:
                <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' />
                <br />
                START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                <br />
                DUE_DATE:
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />

                <br />
                USER:
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="USER_NAME" DataValueField="USER_ID" SelectedValue='<%# Bind("USER_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
