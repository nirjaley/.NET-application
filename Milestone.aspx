<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Milestone.aspx.vb" Inherits="coursework.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
        <asp:TemplateField HeaderText="PROJECT_ID" SortExpression="PROJECT_ID">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PROJECT_ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />

        <asp:TemplateField HeaderText="DUE_DATE">
            <ItemTemplate>
                <%# Eval("DUE_DATE", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="MILESTONE_STATUS">
            <ItemTemplate>
                <%# Eval("MILESTONE_STATUS") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="MILESTONE_STATUSDropDown" runat="server" SelectedValue='<%# Bind("MILESTONE_STATUS") %>'>
                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
        <asp:BoundField DataField="PROGRESS_PERCENTAGE" HeaderText="PROGRESS_PERCENTAGE" SortExpression="PROGRESS_PERCENTAGE" />
    </Columns>
</asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONE_ID&quot;, &quot;PROJECT_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;DUE_DATE&quot;, &quot;MILESTONE_STATUS&quot;, &quot;DESCRIPTION&quot;, &quot;PROGRESS_PERCENTAGE&quot;) VALUES (:MILESTONE_ID, :PROJECT_ID, :MILESTONE_NAME, :DUE_DATE, :MILESTONE_STATUS, :DESCRIPTION, :PROGRESS_PERCENTAGE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;MILESTONE_STATUS&quot; = :MILESTONE_STATUS, &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;PROGRESS_PERCENTAGE&quot; = :PROGRESS_PERCENTAGE WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="PROGRESS_PERCENTAGE" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="PROGRESS_PERCENTAGE" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">

    <EditItemTemplate>
        MILESTONE_ID:
        <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' />
        <br />
        PROJECT_ID:
        <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
        <br />
        MILESTONE_NAME:
        <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' />
        <br />
        
        <!-- Date Picker for DUE_DATE -->
        DUE_DATE:
        <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
        <br />
        
        <!-- Dropdown for MILESTONE_STATUS -->
        MILESTONE_STATUS:
        <asp:DropDownList ID="MILESTONE_STATUSDropDown" runat="server" SelectedValue='<%# Bind("MILESTONE_STATUS") %>'>
            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
        </asp:DropDownList>
        <br />

        DESCRIPTION:
        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
        <br />
        PROGRESS_PERCENTAGE:
        <asp:TextBox ID="PROGRESS_PERCENTAGETextBox" runat="server" Text='<%# Bind("PROGRESS_PERCENTAGE") %>' />
        <br />

        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>

    <InsertItemTemplate>
        MILESTONE_ID:
        <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
        <br />
        
        PROJECT:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
        <br />
        
        MILESTONE_NAME:
        <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' />
        <br />

        <!-- Date Picker for DUE_DATE -->
        DUE_DATE:
        <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
        <br />

        <!-- Dropdown for MILESTONE_STATUS -->
        MILESTONE_STATUS:
        <asp:DropDownList ID="MILESTONE_STATUSDropDown" runat="server" SelectedValue='<%# Bind("MILESTONE_STATUS") %>'>
            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
        </asp:DropDownList>
        <br />

        DESCRIPTION:
        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
        <br />
        PROGRESS_PERCENTAGE:
        <asp:TextBox ID="PROGRESS_PERCENTAGETextBox" runat="server" Text='<%# Bind("PROGRESS_PERCENTAGE") %>' />
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
