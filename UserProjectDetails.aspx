<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UserProjectDetails.aspx.vb" Inherits="coursework.UserProjectDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select u.user_id, user_name, user_email, user_contact, p.project_id, p_taskname, p_startdate, p_duedate, project_status from users u join project_user pu on u.user_id = pu.user_id join project p on pu.project_id = p.project_id where u.user_id = :users">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="users" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="USER_NAME" DataValueField="USER_ID">
            </asp:DropDownList>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="USER_CONTACT" HeaderText="USER_CONTACT" SortExpression="USER_CONTACT" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="P_TASKNAME" HeaderText="P_TASKNAME" SortExpression="P_TASKNAME" />
                <asp:BoundField DataField="P_STARTDATE" HeaderText="P_STARTDATE" SortExpression="P_STARTDATE" />
                <asp:BoundField DataField="P_DUEDATE" HeaderText="P_DUEDATE" SortExpression="P_DUEDATE" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
