<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="coursework.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
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
        .stats-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,.05);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
            border-top: 4px solid transparent;
        }
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,.1);
        }
        .stats-card .card-body {
            padding: 20px;
        }
        .stats-card h5 {
            margin-bottom: 10px;
            color: #6c757d;
            font-weight: 500;
        }
        .stats-card h2 {
            font-weight: bold;
            margin-bottom: 0;
            color: #212529;
        }
        .card-icon {
            font-size: 40px;
            margin-bottom: 15px;
        }
        .chart-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,.05);
            padding: 25px;
            margin-bottom: 25px;
        }
        .chart-container h4 {
            color: #4e54c8;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .chart-canvas {
            height: 300px;
            width: 100%;
        }
        .stats-card:nth-child(1) {
            border-top-color: #4e54c8;
        }
        .stats-card:nth-child(1) .card-icon {
            color: #4e54c8;
        }
        .stats-card:nth-child(2) {
            border-top-color: #ff6b6b;
        }
        .stats-card:nth-child(2) .card-icon {
            color: #ff6b6b;
        }
        .stats-card:nth-child(3) {
            border-top-color: #38b2ac;
        }
        .stats-card:nth-child(3) .card-icon {
            color: #38b2ac;
        }
        .stats-card:nth-child(4) {
            border-top-color: #f6ad55;
        }
        .stats-card:nth-child(4) .card-icon {
            color: #f6ad55;
        }
        .quick-link-btn {
            border-radius: 8px;
            padding: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        .quick-link-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }
        .btn-primary {
            background-color: #4e54c8;
        }
        .btn-success {
            background-color: #38b2ac;
        }
        .btn-info {
            background-color: #63b3ed;
        }
        .btn-warning {
            background-color: #f6ad55;
            color: white;
        }
        .dashboard-header {
            padding: 10px 0;
            margin-bottom: 10px;
        }
        .dashboard-header h2 {
            color: #4e54c8;
            font-weight: 700;
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
                            <a class="nav-link active" href="Dashboard.aspx"><i class="fas fa-home"></i> Dashboard</a>
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

        <!-- SqlDataSources for Statistics Cards -->
        <asp:SqlDataSource ID="SqlDataSourceTotalProjects" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS Total FROM PROJECT">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceActiveTasks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS Total FROM TASK_DETAILS WHERE STATUS = 'Active'">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceTeamMembers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS Total FROM USERS">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSourceCompletedMilestones" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS Total FROM MILESTONE WHERE MILESTONE_STATUS = 'Completed'">
        </asp:SqlDataSource>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="row dashboard-header">
                <div class="col-12">
                    <h2>Project Management Dashboard</h2>
                    <p class="text-muted">Welcome to your project management system</p>
                </div>
            </div>

            <!-- Statistics Cards -->
            <div class="row mt-3">
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="card-body text-center">
                            <i class="fas fa-project-diagram card-icon"></i>
                            <h5>Total Projects</h5>
                            <h2><asp:Literal ID="litTotalProjects" runat="server"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="card-body text-center">
                            <i class="fas fa-tasks card-icon"></i>
                            <h5>Active Tasks</h5>
                            <h2><asp:Literal ID="litActiveTasks" runat="server"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="card-body text-center">
                            <i class="fas fa-user-check card-icon"></i>
                            <h5>Team Members</h5>
                            <h2><asp:Literal ID="litTeamMembers" runat="server"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="card-body text-center">
                            <i class="fas fa-flag-checkered card-icon"></i>
                            <h5>Completed Milestones</h5>
                            <h2><asp:Literal ID="litMilestones" runat="server"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Project Users Chart -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="chart-container">
                        <h4><i class="fas fa-chart-bar me-2"></i>Users per Project</h4>
                        
                        <asp:SqlDataSource ID="SqlDataSourceProjectUsers" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                            SelectCommand="SELECT p.PROJECT_ID, p.P_TASKNAME as ProjectName, COUNT(pu.USER_ID) as UserCount 
                                          FROM PROJECT p 
                                          LEFT JOIN PROJECT_USER pu ON p.PROJECT_ID = pu.PROJECT_ID 
                                          GROUP BY p.PROJECT_ID, p.P_TASKNAME 
                                          ORDER BY p.PROJECT_ID">
                        </asp:SqlDataSource>
                        
                        <div class="chart-canvas">
                            <canvas id="projectUsersChart"></canvas>
                        </div>
                        <script runat="server">
                            protected void Page_Load(object sender, EventArgs e)
                            {
                                if (!IsPostBack)
                                {
                                    // Load statistics data
                                    LoadStatisticsData();
                                    
                                    // Initialize empty arrays for JavaScript
                                    ClientScript.RegisterStartupScript(this.GetType(), "InitArrays",
                                        "var projectNames = []; var userCounts = [];", true);
                                    
                                    // Fetch data from SqlDataSource and register it for JavaScript
                                    System.Data.DataView dataView = 
                                        (System.Data.DataView)SqlDataSourceProjectUsers.Select(DataSourceSelectArguments.Empty);
                                    
                                    string projectNamesScript = "";
                                    string userCountsScript = "";
                                    
                                    foreach (System.Data.DataRowView row in dataView)
                                    {
                                        string projectName = row["ProjectName"].ToString();
                                        int userCount = Convert.ToInt32(row["UserCount"]);
                                        
                                        projectNamesScript += "projectNames.push('" + projectName.Replace("'", "\\'") + "');";
                                        userCountsScript += "userCounts.push(" + userCount + ");";
                                    }
                                    
                                    // If no data found, use sample data
                                    if (dataView.Count == 0)
                                    {
                                        projectNamesScript = "projectNames = ['Project A', 'Project B', 'Project C', 'Project D', 'Project E'];";
                                        userCountsScript = "userCounts = [3, 5, 2, 4, 1];";
                                    }
                                    
                                    ClientScript.RegisterStartupScript(this.GetType(), "PopulateArrays",
                                        projectNamesScript + userCountsScript, true);
                                }
                            }
                            
                            private void LoadStatisticsData()
                            {
                                // Load Total Projects
                                System.Data.DataView projectsView = 
                                    (System.Data.DataView)SqlDataSourceTotalProjects.Select(DataSourceSelectArguments.Empty);
                                if (projectsView.Count > 0)
                                {
                                    litTotalProjects.Text = projectsView[0]["Total"].ToString();
                                }
                                else
                                {
                                    litTotalProjects.Text = "0";
                                }
                                
                                // Load Active Tasks
                                System.Data.DataView tasksView = 
                                    (System.Data.DataView)SqlDataSourceActiveTasks.Select(DataSourceSelectArguments.Empty);
                                if (tasksView.Count > 0)
                                {
                                    litActiveTasks.Text = tasksView[0]["Total"].ToString();
                                }
                                else
                                {
                                    litActiveTasks.Text = "0";
                                }
                                
                                // Load Team Members
                                System.Data.DataView membersView = 
                                    (System.Data.DataView)SqlDataSourceTeamMembers.Select(DataSourceSelectArguments.Empty);
                                if (membersView.Count > 0)
                                {
                                    litTeamMembers.Text = membersView[0]["Total"].ToString();
                                }
                                else
                                {
                                    litTeamMembers.Text = "0";
                                }
                                
                                // Load Completed Milestones
                                System.Data.DataView milestonesView = 
                                    (System.Data.DataView)SqlDataSourceCompletedMilestones.Select(DataSourceSelectArguments.Empty);
                                if (milestonesView.Count > 0)
                                {
                                    litMilestones.Text = milestonesView[0]["Total"].ToString();
                                }
                                else
                                {
                                    litMilestones.Text = "0";
                                }
                            }
                        </script>
                        
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                var ctx = document.getElementById('projectUsersChart').getContext('2d');
                                var chart = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: projectNames,
                                        datasets: [{
                                            label: 'Number of Users',
                                            data: userCounts,
                                            backgroundColor: 'rgba(78, 84, 200, 0.7)',
                                            borderColor: 'rgba(78, 84, 200, 1)',
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        scales: {
                                            y: {
                                                beginAtZero: true,
                                                ticks: {
                                                    stepSize: 1
                                                }
                                            }
                                        },
                                        plugins: {
                                            legend: {
                                                labels: {
                                                    font: {
                                                        family: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="row mt-4">
                <div class="col-12">
                    <h4 style="color: #4e54c8; margin-bottom: 15px; font-weight: 600;">Quick Links</h4>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <a href="Project.aspx" class="btn btn-primary w-100 quick-link-btn">
                                <i class="fas fa-plus-circle me-2"></i>New Project
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="TaskDetails.aspx" class="btn btn-success w-100 quick-link-btn">
                                <i class="fas fa-clipboard-list me-2"></i>New Task
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="Users.aspx" class="btn btn-info w-100 quick-link-btn text-white">
                                <i class="fas fa-user-plus me-2"></i>Add User
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="TopPerformer.aspx" class="btn btn-warning w-100 quick-link-btn">
                                <i class="fas fa-trophy me-2"></i>View Top Performers
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>