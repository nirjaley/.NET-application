<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Users.aspx.vb" Inherits="coursework.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users - Project Management</title>
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
                            <a class="nav-link active" href="Users.aspx"><i class="fas fa-users"></i> Users</a>
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

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="content-container">
                <h2 class="page-title"><i class="fas fa-users me-2"></i>Manage Users</h2>
                
                <!-- User List Section -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="USER_ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover custom-grid">
                        <Columns>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary btn-action">
                                        <i class="fas fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger btn-action"
                                        OnClientClick="return confirm('Are you sure you want to delete this user?');">
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
                            <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID" />
                            <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                            <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                            <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" 
                    InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot;) VALUES (:USER_ID, :USER_NAME, :USER_EMAIL, :USER_CONTACT)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_EMAIL&quot;, &quot;USER_CONTACT&quot; FROM &quot;USERS&quot;" 
                    UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_EMAIL&quot; = :USER_EMAIL, &quot;USER_CONTACT&quot; = :USER_CONTACT WHERE &quot;USER_ID&quot; = :USER_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="USER_EMAIL" Type="String" />
                        <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="USER_EMAIL" Type="String" />
                        <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <!-- Insert User Form Section -->
                <div class="form-container">
                    <h3 class="form-title"><i class="fas fa-user-plus me-2"></i>Add New User</h3>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" 
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="USER_IDTextBox" class="form-label">User ID:</label>
                                        <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="USER_NAMETextBox" class="form-label">Name:</label>
                                        <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="USER_EMAILTextBox" class="form-label">Email:</label>
                                        <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="USER_CONTACTTextBox" class="form-label">Contact:</label>
                                        <asp:TextBox ID="USER_CONTACTTextBox" runat="server" Text='<%# Bind("USER_CONTACT") %>' CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success">
                                    <i class="fas fa-plus-circle me-1"></i> Add User
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-1"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary">
                                <i class="fas fa-plus-circle me-1"></i> New User
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>