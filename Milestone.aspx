﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Milestone.aspx.vb" Inherits="coursework.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestones - Project Management</title>
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
            display: inline-block; /* Ensure proper display */
            text-align: center; /* Center text */
            cursor: pointer; /* Show pointer cursor */
            margin-bottom: 3px; /* Add space between buttons */
            min-width: 80px; /* Minimum width */
        }
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }
        .btn-primary {
            background-color: #4e54c8;
            border: none;
            color: white !important; /* Ensure text color is white */
        }
        .btn-success {
            background-color: #38b2ac;
            border: none;
            color: white !important;
        }
        .btn-danger {
            background-color: #ff6b6b;
            border: none;
            color: white !important;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
            color: white !important;
        }
        .text-muted {
            color: #6c757d !important;
        }
        
        /* Fix for button display */
        .table a.btn {
            text-decoration: none;
            display: inline-block;
            margin-bottom: 2px;
        }
        
        /* Ensure icons display properly */
        .fas {
            display: inline-block;
            margin-right: 4px;
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
                            <a class="nav-link active" href="Milestone.aspx"><i class="fas fa-flag"></i> Milestones</a>
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
                <h2 class="page-title"><i class="fas fa-flag me-2"></i>Manage Milestones</h2>
                <p class="text-muted">Track project progress with key achievements</p>
                
                <!-- Milestone List Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="d-flex flex-column flex-md-row">
                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" 
                                            CssClass="btn btn-sm btn-primary btn-action" role="button">
                                            <i class="fas fa-edit"></i> Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" 
                                            CssClass="btn btn-sm btn-danger btn-action" role="button"
                                            OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                            <i class="fas fa-trash"></i> Delete
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="d-flex flex-column flex-md-row">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" 
                                            CssClass="btn btn-sm btn-success btn-action" role="button">
                                            <i class="fas fa-save"></i> Save
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" 
                                            CssClass="btn btn-sm btn-secondary btn-action" role="button">
                                            <i class="fas fa-times"></i> Cancel
                                        </asp:LinkButton>
                                    </div>
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                            <asp:TemplateField HeaderText="Project" SortExpression="PROJECT_ID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PROJECT_ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" />
                            <asp:TemplateField HeaderText="Due Date" SortExpression="DUE_DATE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DUE_DATE", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="MILESTONE_STATUS">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="MILESTONE_STATUSDropDown" runat="server" SelectedValue='<%# Bind("MILESTONE_STATUS") %>' CssClass="form-select">
                                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MILESTONE_STATUS") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" SortExpression="DESCRIPTION" />
                            <asp:BoundField DataField="PROGRESS_PERCENTAGE" HeaderText="Progress %" SortExpression="PROGRESS_PERCENTAGE" />
                            <asp:TemplateField HeaderText="Project name">
                                <ItemTemplate>
                                    <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceProjectName" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceProjectName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;P_TASKNAME&quot;, &quot;PROJECT_ID&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" 
                    InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONE_ID&quot;, &quot;PROJECT_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;DUE_DATE&quot;, &quot;MILESTONE_STATUS&quot;, &quot;DESCRIPTION&quot;, &quot;PROGRESS_PERCENTAGE&quot;) VALUES (:MILESTONE_ID, :PROJECT_ID, :MILESTONE_NAME, :DUE_DATE, :MILESTONE_STATUS, :DESCRIPTION, :PROGRESS_PERCENTAGE)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT * FROM &quot;MILESTONE&quot;" 
                    UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;MILESTONE_STATUS&quot; = :MILESTONE_STATUS, &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;PROGRESS_PERCENTAGE&quot; = :PROGRESS_PERCENTAGE WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                        <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                        <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                        <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                        <asp:Parameter Name="PROGRESS_PERCENTAGE" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                        <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                        <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                        <asp:Parameter Name="MILESTONE_STATUS" Type="String" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                        <asp:Parameter Name="PROGRESS_PERCENTAGE" Type="Decimal" />
                        <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <!-- Insert Milestone Form Section -->
                <div class="form-container">
                    <h3 class="form-title"><i class="fas fa-plus-circle me-2"></i>Add New Milestone</h3>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1" 
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="MILESTONE_IDTextBox" class="form-label">Milestone ID:</label>
                                        <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="DropDownList1" class="form-label">Project:</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="P_TASKNAME" DataValueField="PROJECT_ID" SelectedValue='<%# Bind("PROJECT_ID") %>' CssClass="form-select">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;P_TASKNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="MILESTONE_NAMETextBox" class="form-label">Milestone Name:</label>
                                        <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-control" />
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
                                        <label for="MILESTONE_STATUSDropDown" class="form-label">Status:</label>
                                        <asp:DropDownList ID="MILESTONE_STATUSDropDown" runat="server" SelectedValue='<%# Bind("MILESTONE_STATUS") %>' CssClass="form-select">
                                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="PROGRESS_PERCENTAGETextBox" class="form-label">Progress Percentage:</label>
                                        <asp:TextBox ID="PROGRESS_PERCENTAGETextBox" runat="server" Text='<%# Bind("PROGRESS_PERCENTAGE") %>' CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="DESCRIPTIONTextBox" class="form-label">Description:</label>
                                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" TextMode="MultiLine" Rows="3" />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                    CssClass="btn btn-success" role="button">
                                    <i class="fas fa-plus-circle me-1"></i> Add Milestone
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                    CssClass="btn btn-secondary ms-2" role="button">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                CssClass="btn btn-primary" role="button">
                                <i class="fas fa-plus-circle me-1"></i> New Milestone
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>

        <!-- jQuery (required for some Bootstrap features) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom Script to ensure FontAwesome icons load properly -->
        <script>
            $(document).ready(function() {
                // Force FontAwesome to refresh (helps in some scenarios)
                setTimeout(function() {
                    $('head link[href*="font-awesome"]').attr('href', function(i, href) {
                        return href;
                    });
                }, 100);
            });
        </script>
    </form>
</body>
</html>