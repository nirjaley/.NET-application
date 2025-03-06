<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TopPerformer.aspx.vb" Inherits="coursework.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (
    SELECT 
        user_name,
        user_email,
        user_contact,
        COUNT(*) AS completed_tasks
    FROM 
        Users u
    WHERE 
        user_id IN (
            SELECT user_id 
            FROM Task_Assignment ta
            JOIN Task_Details td ON ta.task_id = td.task_id
            WHERE td.status = 'Completed'
            AND (NVL(:project, 0) = 0 OR ta.project_id = :project)
        )
    GROUP BY 
        user_name,
        user_email,
        user_contact
    ORDER BY 
        completed_tasks DESC
)
WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
        </asp:GridView>
    </form>
</body>
</html>
