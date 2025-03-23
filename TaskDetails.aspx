<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TaskDetails.aspx.vb" Inherits="coursework.TaskDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tasks - Project Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f3f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #4e54c8;
            background-image: linear-gradient(to right, #4e54c8, #8f94fb);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            font-weight: bold;
            color: white;
            letter-spacing: 0.5px;
        }
        .nav-link {
            color: rgba(255,255,255,.85);
            transition: all 0.3s ease;
            margin-right: 5px;
            border-radius: 4px;
            padding: 8px 15px !important;
        }
        .nav-link:hover {
            color: white;
            background-color: rgba(255,255,255,0.1);
        }
        .nav-link.active {
            color: #4e54c8 !important;
            font-weight: 500;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .dropdown-menu {
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .dropdown-item:hover {
            background-color: #f3f4f8;
        }
        .content-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,.05);
            padding: 25px;
            margin-bottom: 25px;
        }
        .page-title {
            margin-bottom: 20px;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            color: #4e54c8;
            font-weight: 700;
        }
        .grid-container {
            overflow-x: auto;
        }
        .custom-grid {
            width: 100%;
            border-collapse: collapse;
        }
        .custom-grid th {
            background-color: #f3f4f8;
            font-weight: 600;
        }
        .form-container {
            background-color: #f3f4f8;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            border: 1px solid #dee2e6;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        .form-title {
            font-size: 1.25rem;
            margin-bottom: 15px;
            color: #4e54c8;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-action {
            margin-right: 5px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }
        .btn-primary {
            background-color: #4e54c8;
            border: none;
        }
        .btn-success {
            background-color: #38b2ac;
            border: none;
        }
        .btn-danger {
            background-color: #ff6b6b;
            border: none;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
        .text-muted {
            color: #6c757d !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Dashboard.aspx">SajiloPM</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Dashboard.aspx"><i class="fas fa-home"></i> Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Users.aspx"><i class="fas fa-users"></i> Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Project.aspx"><i class="fas fa-project-diagram"></i> Projects</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="TaskDetails.aspx"><i class="fas fa-tasks"></i> Tasks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Subtask.aspx"><i class="fas fa-list"></i> Subtasks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Milestone.aspx"><i class="fas fa-flag"></i> Milestones</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-chart-bar"></i> Reports
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="UserProjectDetails.aspx">User Projects</a></li>
                                <li><a class="dropdown-item" href="ProjectMilestone.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item" href="TopPerformer.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="content-container">
                <h2 class="page-title"><i class="fas fa-tasks me-2"></i>Manage Tasks</h2>
                <p class="text-muted">Add and manage project tasks</p>
                
                <!-- Task List Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary btn-action">
                                        <i class="fas fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger btn-action"
                                        OnClientClick="return confirm('Are you sure you want to delete this task?');">
                                        <i class="fas fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success btn-action">
                                        <i class="fas fa-save"></i> Save
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary btn-action">
                                        <i class="fas fa-times"></i> Cancel
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="TASK_ID" />
                            <asp:BoundField DataField="TASK_NAME" HeaderText="Task Name" SortExpression="TASK_NAME" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="START_DATE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="DUE_DATE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="STATUS">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select">
                                        <asp:ListItem>Completed</asp:ListItem>
                                        <asp:ListItem>In Progress</asp:ListItem>
                                        <asp:ListItem>Pending</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span class='badge <%# GetStatusBadgeClass(Eval("STATUS").ToString()) %>'>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Milestone" SortExpression="MILESTONE_ID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="MILESTONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot; FROM &quot;MILESTONE&quot;"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("MILESTONE_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Milestone Title">
                                <ItemTemplate>
                                    <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceMilestoneTitle" DataTextField="MILESTONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceMilestoneTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_NAME&quot;, &quot;MILESTONE_ID&quot; FROM &quot;MILESTONE&quot;"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;TASK_DETAILS&quot; WHERE &quot;TASK_ID&quot; = :TASK_ID" 
                    InsertCommand="INSERT INTO &quot;TASK_DETAILS&quot; (&quot;TASK_ID&quot;, &quot;TASK_NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;, &quot;MILESTONE_ID&quot;) VALUES (:TASK_ID, :TASK_NAME, :START_DATE, :DUE_DATE, :STATUS, :MILESTONE_ID)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT * FROM &quot;TASK_DETAILS&quot;" 
                    UpdateCommand="UPDATE &quot;TASK_DETAILS&quot; SET &quot;TASK_NAME&quot; = :TASK_NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS, &quot;MILESTONE_ID&quot; = :MILESTONE_ID WHERE &quot;TASK_ID&quot; = :TASK_ID">
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
                
                <!-- Insert Task Form Section -->
                <div class="form-container">
                    <h3 class="form-title"><i class="fas fa-plus-circle me-2"></i>Add New Task</h3>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSource1" 
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="TASK_IDTextBox" class="form-label">Task ID:</label>
                                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="TASK_NAMETextBox" class="form-label">Task Name:</label>
                                        <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="START_DATETextBox" class="form-label">Start Date:</label>
                                        <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="DUE_DATETextBox" class="form-label">Due Date:</label>
                                        <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="STATUSTextBox" class="form-label">Status:</label>
                                        <asp:DropDownList ID="STATUSTextBox" runat="server" SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select">
                                            <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="DropDownList3" class="form-label">Milestone:</label>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="MILESTONE_NAME" DataValueField="MILESTONE_ID" SelectedValue='<%# Bind("MILESTONE_ID") %>' CssClass="form-select">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot; FROM &quot;MILESTONE&quot;"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success">
                                    <i class="fas fa-plus-circle me-1"></i> Add Task
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary">
                                <i class="fas fa-plus-circle me-1"></i> New Task
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
    
    <script runat="server">
        ' Function to determine the Bootstrap badge class based on task status
        Protected Function GetStatusBadgeClass(status As String) As String
            Select Case status
                Case "Completed"
                    Return "bg-success"
                Case "In Progress"
                    Return "bg-primary"
                Case "Pending"
                    Return "bg-warning"
                Case Else
                    Return "bg-secondary"
            End Select
        End Function
    </script>
</body>
</html>