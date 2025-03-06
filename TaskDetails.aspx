<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TaskDetails.aspx.vb" Inherits="coursework.TaskDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" ReadOnly="True" SortExpression="TASK_ID" />
                <asp:BoundField DataField="TASK_NAME" HeaderText="TASK_NAME" SortExpression="TASK_NAME" />
                <asp:TemplateField HeaderText="START_DATE" SortExpression="START_DATE">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="DUE_DATE" SortExpression="DUE_DATE">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="STATUS" SortExpression="STATUS">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("STATUS") %>'>
                            <asp:ListItem>Completed</asp:ListItem>
                            <asp:ListItem>In Progress</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MILESTONE_ID" SortExpression="MILESTONE_ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="MILESTONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot; FROM &quot;MILESTONE&quot;"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MILESTONE_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASK_DETAILS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" InsertCommand="INSERT INTO &quot;TASK_DETAILS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;, &quot;MILESTONE_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :START_DATE, :DUE_DATE, :STATUS, :MILESTONE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TASK_DETAILS&quot;" UpdateCommand="UPDATE &quot;TASK_DETAILS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS, &quot;MILESTONE_ID&quot; = :MILESTONE_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                TASK_ID:
                <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' />
                <br />
                TASK_NAME:
                <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />
                START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                <br />
                DUE_DATE:
                <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                <br />
                STATUS:
                <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                MILESTONE_ID:
                <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                TASK_ID:
    <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                <br />

                TASK_NAME:
    <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' />
                <br />

                START_DATE:
    <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                <br />

                DUE_DATE:
    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                <br />

                STATUS:
    <asp:DropDownList ID="STATUSTextBox" runat="server" SelectedValue='<%# Bind("STATUS") %>'>
        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
    </asp:DropDownList>
                <br />

                MILESTONE_ID:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="MILESTONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot; FROM &quot;MILESTONE&quot;"></asp:SqlDataSource>
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
