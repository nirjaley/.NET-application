<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Project.aspx.vb" Inherits="coursework.Project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

        <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
        <asp:BoundField DataField="P_TASKNAME" HeaderText="P_TASKNAME" SortExpression="P_TASKNAME" />

        <asp:TemplateField HeaderText="P_STARTDATE">
            <ItemTemplate>
                <%# Eval("P_STARTDATE", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="P_STARTDATETextBox" runat="server" Text='<%# Bind("P_STARTDATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="P_DUEDATE">
            <ItemTemplate>
                <%# Eval("P_DUEDATE", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="P_DUEDATETextBox" runat="server" Text='<%# Bind("P_DUEDATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="PROJECT_STATUS">
            <ItemTemplate>
                <%# Eval("PROJECT_STATUS") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="PROJECT_STATUSDropDown" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'>
                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM PROJECT WHERE PROJECT_ID = :PROJECT_ID"
                InsertCommand="INSERT INTO PROJECT (PROJECT_ID, P_TASKNAME, P_STARTDATE, P_DUEDATE, PROJECT_STATUS) VALUES (:PROJECT_ID, :P_TASKNAME, :P_STARTDATE, :P_DUEDATE, :PROJECT_STATUS)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT PROJECT_ID, P_TASKNAME, P_STARTDATE, P_DUEDATE, PROJECT_STATUS FROM PROJECT"
                UpdateCommand="UPDATE PROJECT SET P_TASKNAME = :P_TASKNAME, P_STARTDATE = :P_STARTDATE, P_DUEDATE = :P_DUEDATE, PROJECT_STATUS = :PROJECT_STATUS WHERE PROJECT_ID = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="P_TASKNAME" Type="String" />
                    <asp:Parameter Name="P_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="P_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="P_TASKNAME" Type="String" />
                    <asp:Parameter Name="P_STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="P_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                PROJECT_ID:
                <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' />
                <br />
                P_TASKNAME:
                <asp:TextBox ID="P_TASKNAMETextBox" runat="server" Text='<%# Bind("P_TASKNAME") %>' />
                <br />
                P_STARTDATE:
                <asp:TextBox ID="P_STARTDATETextBox" runat="server" Text='<%# Bind("P_STARTDATE") %>' TextMode="Date" />
                <br />
                P_DUEDATE:
                <asp:TextBox ID="P_DUEDATETextBox" runat="server" Text='<%# Bind("P_DUEDATE") %>' TextMode="Date" />
                <br />
                PROJECT_STATUS:
                <asp:DropDownList ID="PROJECT_STATUSDropDown" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'>
                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PROJECT_ID:
                <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                <br />
                P_TASKNAME:
                <asp:TextBox ID="P_TASKNAMETextBox" runat="server" Text='<%# Bind("P_TASKNAME") %>' />
                <br />
                P_STARTDATE:
                <asp:TextBox ID="P_STARTDATETextBox" runat="server" Text='<%# Bind("P_STARTDATE") %>' TextMode="Date" />
                <br />
                P_DUEDATE:
                <asp:TextBox ID="P_DUEDATETextBox" runat="server" Text='<%# Bind("P_DUEDATE") %>' TextMode="Date" />
                <br />
                PROJECT_STATUS:
                <asp:DropDownList ID="PROJECT_STATUSDropDownInsert" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'>
                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
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
