<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TopPerformer.aspx.vb" Inherits="coursework.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers - Project Management</title>
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
        .filter-container {
            background-color: #f8f9fa;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
        }
        .filter-title {
            font-size: 1.1rem;
            margin-bottom: 15px;
            color: #343a40;
        }
        .top-performer {
            background-color: #f8f9fa;
            border-left: 4px solid #28a745;
            padding: 10px 15px;
            margin-bottom: 10px;
        }
        .medal-icon {
            font-size: 1.5rem;
            margin-right: 10px;
        }
        .gold {
            color: #FFD700;
        }
        .silver {
            color: #C0C0C0;
        }
        .bronze {
            color: #CD7F32;
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
                                <li><a class="dropdown-item" href="ProjectMilestone.aspx">Project Milestones</a></li>
                                <li><a class="dropdown-item active" href="TopPerformer.aspx">Top Performers</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="content-container">
                <h2 class="page-title"><i class="fas fa-trophy me-2"></i>Top Performers</h2>
                
                <!-- Filter Section -->
                <div class="filter-container">
                    <h3 class="filter-title"><i class="fas fa-filter me-2"></i>Filter by Project</h3>
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
                                    <asp:ListItem Value="0">All Projects</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Top Performers Grid Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource2"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:TemplateField HeaderText="Rank" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <%# GetRankBadge(Container.DataItemIndex + 1) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                            <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="Completed Tasks" SortExpression="COMPLETED_TASKS" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="alert alert-info mt-3">
                                <i class="fas fa-info-circle me-2"></i>No performance data available for the selected project.
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
                    SelectCommand="SELECT * FROM (
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
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
    
    <script runat="server">
        Protected Function GetRankBadge(rank As Integer) As String
            Select Case rank
                Case 1
                    Return "<div class='d-flex align-items-center'><i class='fas fa-medal medal-icon gold'></i><strong>1st</strong></div>"
                Case 2
                    Return "<div class='d-flex align-items-center'><i class='fas fa-medal medal-icon silver'></i><strong>2nd</strong></div>"
                Case 3
                    Return "<div class='d-flex align-items-center'><i class='fas fa-medal medal-icon bronze'></i><strong>3rd</strong></div>"
                Case Else
                    Return rank.ToString()
            End Select
        End Function
    </script>
</body>
</html>