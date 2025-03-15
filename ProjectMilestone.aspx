<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProjectMilestone.aspx.vb" Inherits="coursework.ProjectMilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones - Project Management</title>
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
        .dropdown-item.active {
            background-color: #4e54c8;
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
        .filter-container {
            background-color: #f3f4f8;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        .filter-title {
            font-size: 1.25rem;
            margin-bottom: 15px;
            color: #4e54c8;
            font-weight: 600;
        }
        .form-label {
            font-weight: 500;
            color: #4e54c8;
        }
        /* Status badge styles */
        .badge {
            padding: 5px 10px;
            font-weight: 500;
            border-radius: 4px;
        }
        .status-completed {
            background-color: #38b2ac !important; /* success green */
            color: white !important;
        }
        .status-in-progress {
            background-color: #4e54c8 !important; /* primary blue */
            color: white !important;
        }
        .status-delayed {
            background-color: #ffc107 !important; /* warning yellow */
            color: #212529 !important;
        }
        .status-on-hold {
            background-color: #6c757d !important; /* secondary gray */
            color: white !important;
        }
        .status-cancelled {
            background-color: #ff6b6b !important; /* danger red */
            color: white !important;
        }
        .status-default {
            background-color: #0dcaf0 !important; /* info blue */
            color: #212529 !important;
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
                            <a class="nav-link" href="TaskDetails.aspx"><i class="fas fa-tasks"></i> Tasks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Subtask.aspx"><i class="fas fa-list"></i> Subtasks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Milestone.aspx"><i class="fas fa-flag"></i> Milestones</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-chart-bar"></i> Reports
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="UserProjectDetails.aspx">User Projects</a></li>
                                <li><a class="dropdown-item active" href="ProjectMilestone.aspx">Project Milestones</a></li>
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
                <h2 class="page-title"><i class="fas fa-flag-checkered me-2"></i>Project Milestones</h2>
                <p class="text-muted">View and track milestone progress by project</p>
                
                <!-- Filter Section -->
                <div class="filter-container">
                    <h3 class="filter-title"><i class="fas fa-filter me-2"></i>Select Project</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="DropDownList1" class="form-label">Project:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    AutoPostBack="True" 
                                    DataSourceID="SqlDataSource1" 
                                    DataTextField="P_TASKNAME" 
                                    DataValueField="PROJECT_ID"
                                    CssClass="form-select">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Project Milestones List Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource2"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                            <asp:BoundField DataField="P_TASKNAME" HeaderText="Project Name" SortExpression="P_TASKNAME" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="P_STARTDATE">
                                <ItemTemplate>
                                    <%# Eval("P_STARTDATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="P_DUEDATE">
                                <ItemTemplate>
                                    <%# Eval("P_DUEDATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Project Status" SortExpression="PROJECT_STATUS">
                                <ItemTemplate>
                                    <span class='badge <%# GetStatusClass(Eval("PROJECT_STATUS").ToString()) %>'>
                                        <%# Eval("PROJECT_STATUS") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" />
                            <asp:TemplateField HeaderText="Milestone Status" SortExpression="MILESTONE_STATUS">
                                <ItemTemplate>
                                    <span class='badge <%# GetStatusClass(Eval("MILESTONE_STATUS").ToString()) %>'>
                                        <%# Eval("MILESTONE_STATUS") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Milestone Due Date" SortExpression="DUE_DATE">
                                <ItemTemplate>
                                    <%# Eval("DUE_DATE", "{0:yyyy-MM-dd}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-info mt-3">
                                <i class="fas fa-info-circle me-2"></i>No milestones found for this project.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;">
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="select p.project_id, p_taskname, p_startdate, p_duedate, project_status, m.milestone_id, milestone_name, milestone_status, due_date from project p join milestone m on p.project_id = m.project_id where p.project_id = :project">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
    
    <script runat="server">
        Protected Function GetStatusClass(status As String) As String
            Select Case status.ToLower()
                Case "completed"
                    Return "status-completed"
                Case "in progress"
                    Return "status-in-progress"
                Case "delayed"
                    Return "status-delayed"
                Case "on hold"
                    Return "status-on-hold"
                Case "cancelled"
                    Return "status-cancelled"
                Case Else
                    Return "status-default"
            End Select
        End Function
    </script>
</body>
</html>