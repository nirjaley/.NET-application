<%@ Page Language="C#" AutoEventWireup="true" Inherits="coursework.Dashboard" %>

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
        
        <!-- SqlDataSource for Task Status Pie Chart -->
        <asp:SqlDataSource ID="SqlDataSourceTaskStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT STATUS as TaskStatus, COUNT(*) as TaskCount 
                          FROM TASK_DETAILS 
                          GROUP BY STATUS 
                          ORDER BY STATUS">
        </asp:SqlDataSource>

        <!-- SqlDataSource for Project Progress Chart -->
        <asp:SqlDataSource ID="SqlDataSourceProjectProgress" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT p.P_TASKNAME as ProjectName, m.progress_percentage as Progress 
                          FROM PROJECT p 
                          JOIN MILESTONE m ON p.project_id = m.project_id 
                          ORDER BY p.P_TASKNAME">
        </asp:SqlDataSource>

        <!-- SqlDataSource for Task Assignment Distribution Chart -->
        <asp:SqlDataSource ID="SqlDataSourceTaskAssignment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT u.user_name as UserName, COUNT(ta.task_id) as TaskCount 
                          FROM TASK_ASSIGNMENT ta 
                          JOIN USERS u ON ta.user_id = u.user_id 
                          GROUP BY u.user_name 
                          ORDER BY u.user_name">
        </asp:SqlDataSource>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="row dashboard-header">
                <div class="col-12">
                    <h2>Dashboard</h2>
                    <p class="text-muted">Welcome to SajiloPM</p>
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
                    </div>
                </div>
            </div>

           <!-- Task Status and Task Assignment Pie Charts (Side by Side) -->
<div class="row mt-4">
    <div class="col-md-6">
        <div class="chart-container">
            <h4><i class="fas fa-chart-pie me-2"></i>Tasks by Status</h4>
            <div class="chart-canvas">
                <canvas id="taskStatusChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="chart-container">
            <h4><i class="fas fa-chart-pie me-2"></i>Task Assignment Distribution</h4>
            <div class="chart-canvas">
                <canvas id="taskAssignmentChart"></canvas>
            </div>
        </div>
    </div>
</div>

            <!-- Project Progress Chart -->
<div class="row mt-4">
    <div class="col-12">
        <div class="chart-container">
            <h4><i class="fas fa-chart-line me-2"></i>Project Progress</h4>
            <div class="chart-canvas">
                <canvas id="projectProgressChart"></canvas>
            </div>
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

        <script runat="server">
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Load statistics data
                    LoadStatisticsData();
                    
                    // Initialize empty arrays for JavaScript
                    ClientScript.RegisterStartupScript(this.GetType(), "InitArrays",
                        "var projectNames = []; var userCounts = []; var taskStatuses = []; var taskCounts = []; var projectProgress = []; var taskAssignments = [];", true);
                    
                    // Fetch project users data from SqlDataSource and register it for JavaScript
                    System.Data.DataView projectUsersView = 
                        (System.Data.DataView)SqlDataSourceProjectUsers.Select(DataSourceSelectArguments.Empty);
                    
                    string projectNamesScript = "";
                    string userCountsScript = "";
                    
                    foreach (System.Data.DataRowView row in projectUsersView)
                    {
                        string projectName = row["ProjectName"].ToString();
                        int userCount = Convert.ToInt32(row["UserCount"]);
                        
                        projectNamesScript += "projectNames.push('" + projectName.Replace("'", "\\'") + "');";
                        userCountsScript += "userCounts.push(" + userCount + ");";
                    }
                    
                    // If no data found for project users, use sample data
                    if (projectUsersView.Count == 0)
                    {
                        projectNamesScript = "projectNames = ['Project A', 'Project B', 'Project C', 'Project D', 'Project E'];";
                        userCountsScript = "userCounts = [3, 5, 2, 4, 1];";
                    }
                    
                    // Fetch task status data from SqlDataSource and register it for JavaScript
                    System.Data.DataView taskStatusView = 
                        (System.Data.DataView)SqlDataSourceTaskStatus.Select(DataSourceSelectArguments.Empty);
                    
                    string taskStatusesScript = "";
                    string taskCountsScript = "";
                    
                    foreach (System.Data.DataRowView row in taskStatusView)
                    {
                        string taskStatus = row["TaskStatus"].ToString();
                        int taskCount = Convert.ToInt32(row["TaskCount"]);
                        
                        taskStatusesScript += "taskStatuses.push('" + taskStatus.Replace("'", "\\'") + "');";
                        taskCountsScript += "taskCounts.push(" + taskCount + ");";
                    }
                    
                    // If no data found for task status, use sample data
                    if (taskStatusView.Count == 0)
                    {
                        taskStatusesScript = "taskStatuses = ['Active', 'Completed', 'On Hold', 'Delayed', 'Cancelled'];";
                        taskCountsScript = "taskCounts = [12, 8, 3, 2, 1];";
                    }
                    
                    // Fetch project progress data from SqlDataSource and register it for JavaScript
                    System.Data.DataView projectProgressView = 
                        (System.Data.DataView)SqlDataSourceProjectProgress.Select(DataSourceSelectArguments.Empty);
                    
                    string projectProgressScript = "";
                    
                    foreach (System.Data.DataRowView row in projectProgressView)
                    {
                        string projectName = row["ProjectName"].ToString();
                        int progress = Convert.ToInt32(row["Progress"]);
                        
                        projectProgressScript += "projectProgress.push({ projectName: '" + projectName.Replace("'", "\\'") + "', progress: " + progress + " });";
                    }
                    
                    // If no data found for project progress, use sample data
                    if (projectProgressView.Count == 0)
                    {
                        projectProgressScript = "projectProgress = [{ projectName: 'Project A', progress: 50 }, { projectName: 'Project B', progress: 75 }, { projectName: 'Project C', progress: 90 }];";
                    }
                    
                    // Fetch task assignment data from SqlDataSource and register it for JavaScript
                    System.Data.DataView taskAssignmentView = 
                        (System.Data.DataView)SqlDataSourceTaskAssignment.Select(DataSourceSelectArguments.Empty);
                    
                    string taskAssignmentsScript = "";
                    
                    foreach (System.Data.DataRowView row in taskAssignmentView)
                    {
                        string userName = row["UserName"].ToString();
                        int taskCount = Convert.ToInt32(row["TaskCount"]);
                        
                        taskAssignmentsScript += "taskAssignments.push({ userName: '" + userName.Replace("'", "\\'") + "', taskCount: " + taskCount + " });";
                    }
                    
                    // If no data found for task assignment, use sample data
                    if (taskAssignmentView.Count == 0)
                    {
                        taskAssignmentsScript = "taskAssignments = [{ userName: 'User A', taskCount: 5 }, { userName: 'User B', taskCount: 3 }, { userName: 'User C', taskCount: 7 }];";
                    }
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "PopulateArrays",
                        projectNamesScript + userCountsScript + taskStatusesScript + taskCountsScript + projectProgressScript + taskAssignmentsScript, true);
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
                // Project Users Bar Chart
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

                // Task Status Pie Chart
                var taskCtx = document.getElementById('taskStatusChart').getContext('2d');
                var taskChart = new Chart(taskCtx, {
                    type: 'pie',
                    data: {
                        labels: taskStatuses,
                        datasets: [{
                            data: taskCounts,
                            backgroundColor: [
                                'rgba(78, 84, 200, 0.7)',  // Primary color - Active
                                'rgba(56, 178, 172, 0.7)', // Success color - Completed
                                'rgba(246, 173, 85, 0.7)', // Warning color - On Hold
                                'rgba(255, 107, 107, 0.7)',// Danger color - Delayed
                                'rgba(160, 174, 192, 0.7)' // Secondary color - Other statuses
                            ],
                            borderColor: [
                                'rgba(78, 84, 200, 1)',
                                'rgba(56, 178, 172, 1)',
                                'rgba(246, 173, 85, 1)',
                                'rgba(255, 107, 107, 1)',
                                'rgba(160, 174, 192, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'right',
                                labels: {
                                    font: {
                                        family: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        var label = context.label || '';
                                        var value = context.raw || 0;
                                        var total = context.dataset.data.reduce((a, b) => a + b, 0);
                                        var percentage = Math.round((value / total) * 100);
                                        return label + ': ' + value + ' tasks (' + percentage + '%)';
                                    }
                                }
                            }
                        }
                    }
                });

                // Project Progress Bar Chart
                var projectProgressCtx = document.getElementById('projectProgressChart').getContext('2d');
                var projectProgressChart = new Chart(projectProgressCtx, {
                    type: 'bar',
                    data: {
                        labels: projectProgress.map(p => p.projectName),
                        datasets: [{
                            label: 'Progress (%)',
                            data: projectProgress.map(p => p.progress),
                            backgroundColor: 'rgba(56, 178, 172, 0.7)',
                            borderColor: 'rgba(56, 178, 172, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                max: 100,
                                ticks: {
                                    stepSize: 10
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

                // Task Assignment Distribution Pie Chart
                var taskAssignmentCtx = document.getElementById('taskAssignmentChart').getContext('2d');
                var taskAssignmentChart = new Chart(taskAssignmentCtx, {
                    type: 'pie',
                    data: {
                        labels: taskAssignments.map(t => t.userName),
                        datasets: [{
                            data: taskAssignments.map(t => t.taskCount),
                            backgroundColor: [
                                'rgba(78, 84, 200, 0.7)',
                                'rgba(56, 178, 172, 0.7)',
                                'rgba(246, 173, 85, 0.7)',
                                'rgba(255, 107, 107, 0.7)',
                                'rgba(160, 174, 192, 0.7)'
                            ],
                            borderColor: [
                                'rgba(78, 84, 200, 1)',
                                'rgba(56, 178, 172, 1)',
                                'rgba(246, 173, 85, 1)',
                                'rgba(255, 107, 107, 1)',
                                'rgba(160, 174, 192, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'right',
                                labels: {
                                    font: {
                                        family: "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        var label = context.label || '';
                                        var value = context.raw || 0;
                                        var total = context.dataset.data.reduce((a, b) => a + b, 0);
                                        var percentage = Math.round((value / total) * 100);
                                        return label + ': ' + value + ' tasks (' + percentage + '%)';
                                    }
                                }
                            }
                        }
                    }
                });
            });
        </script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>