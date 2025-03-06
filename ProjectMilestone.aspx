<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProjectMilestone.aspx.vb" Inherits="coursework.ProjectMilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.project_id, p_taskname, p_startdate, p_duedate, project_status, m.milestone_id, milestone_name, milestone_status, due_date from project p join milestone m on p.project_id = m.project_id where p.project_id = :project">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Select Project</div>
    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="P_TASKNAME" HeaderText="P_TASKNAME" SortExpression="P_TASKNAME" />
                <asp:BoundField DataField="P_STARTDATE" HeaderText="P_STARTDATE" SortExpression="P_STARTDATE" />
                <asp:BoundField DataField="P_DUEDATE" HeaderText="P_DUEDATE" SortExpression="P_DUEDATE" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />
                <asp:BoundField DataField="MILESTONE_STATUS" HeaderText="MILESTONE_STATUS" SortExpression="MILESTONE_STATUS" />
                <asp:BoundField DataField="DUE_DATE" HeaderText="DUE_DATE" SortExpression="DUE_DATE" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
