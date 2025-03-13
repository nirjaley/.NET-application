<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Project.aspx.vb" Inherits="coursework.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Projects - Project Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .nav-link {
            color: rgba(255,255,255,.75);
        }
        .nav-link:hover {
            color: white;
        }
        .nav-link.active {
            color: white !important;
            font-weight: bold;
        }
        .content-container {
            background-color: white;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .page-title {
            margin-bottom: 20px;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
        }
        .grid-container {
            overflow-x: auto;
        }
        .custom-grid {
            width: 100%;
            border-collapse: collapse;
        }
        .custom-grid th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        .form-container {
            background-color: #f8f9fa;
            border-radius: 4px;
            padding: 15px;
            margin-top: 20px;
            border: 1px solid #dee2e6;
        }
        .form-title {
            font-size: 1.25rem;
            margin-bottom: 15px;
            color: #343a40;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-action {
            margin-right: 5px;
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
                            <a class="nav-link active" href="Project.aspx"><i class="fas fa-project-diagram"></i> Projects</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="TaskDetails.aspx"><i class="fas fa-tasks"></i> Tasks</a>
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
                <h2 class="page-title"><i class="fas fa-project-diagram me-2"></i>Manage Projects</h2>
                
                <!-- Project List Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary btn-action">
                                        <i class="fas fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger btn-action"
                                        OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="P_TASKNAME" HeaderText="Project Name" SortExpression="P_TASKNAME" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="P_STARTDATE">
                                <ItemTemplate>
                                    <%# Eval("P_STARTDATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="P_STARTDATETextBox" runat="server" Text='<%# Bind("P_STARTDATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="P_DUEDATE">
                                <ItemTemplate>
                                    <%# Eval("P_DUEDATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="P_DUEDATETextBox" runat="server" Text='<%# Bind("P_DUEDATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="PROJECT_STATUS">
                                <ItemTemplate>
                                    <span class='badge <%# GetStatusBadgeClass(Eval("PROJECT_STATUS").ToString()) %>'><%# Eval("PROJECT_STATUS") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="PROJECT_STATUSDropDown" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>' CssClass="form-select">
                                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
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
                
                <!-- Insert Project Form Section -->
                <div class="form-container">
                    <h3 class="form-title"><i class="fas fa-plus-circle me-2"></i>Add New Project</h3>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSource1" 
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="PROJECT_IDTextBox" class="form-label">Project ID:</label>
                                        <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="P_TASKNAMETextBox" class="form-label">Project Name:</label>
                                        <asp:TextBox ID="P_TASKNAMETextBox" runat="server" Text='<%# Bind("P_TASKNAME") %>' CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="P_STARTDATETextBox" class="form-label">Start Date:</label>
                                        <asp:TextBox ID="P_STARTDATETextBox" runat="server" Text='<%# Bind("P_STARTDATE") %>' TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="P_DUEDATETextBox" class="form-label">Due Date:</label>
                                        <asp:TextBox ID="P_DUEDATETextBox" runat="server" Text='<%# Bind("P_DUEDATE") %>' TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="PROJECT_STATUSDropDownInsert" class="form-label">Status:</label>
                                        <asp:DropDownList ID="PROJECT_STATUSDropDownInsert" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>' CssClass="form-select">
                                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success">
                                    <i class="fas fa-plus-circle me-1"></i> Add Project
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary">
                                <i class="fas fa-plus-circle me-1"></i> New Project
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
        ' Function to determine the Bootstrap badge class based on project status
        Protected Function GetStatusBadgeClass(status As String) As String
            Select Case status
                Case "Active"
                    Return "bg-primary"
                Case "Pending"
                    Return "bg-warning"
                Case "Completed"
                    Return "bg-success"
                Case Else
                    Return "bg-secondary"
            End Select
        End Function
    </script>
</body>
</html>