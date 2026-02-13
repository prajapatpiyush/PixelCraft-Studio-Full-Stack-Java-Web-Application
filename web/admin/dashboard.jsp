<%-- 
    Document   : dashboard
    Created on : 19 Dec 2025
    Author     : piyus
--%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 18px;
            text-align: center;
            font-size: 22px;
        }
        .sub-header {
            text-align: center;
            margin-top: 10px;
            color: #555;
        }
        .container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 40px auto;
            max-width: 900px;
        }
        .card {
            background-color: white;
            width: 220px;
            margin: 15px;
            padding: 25px;
            text-align: center;
            border-radius: 6px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            transition: 0.3s;
        }
        .card a {
            text-decoration: none;
            color: #2c3e50;
            font-size: 16px;
            font-weight: bold;
            display: block;
        }
        .card:hover {
            background-color: #ecf0f1;
            transform: translateY(-5px);
        }
        .footer-links {
            text-align: center;
            margin-bottom: 30px;
        }
        .footer-links a {
            margin: 0 10px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="header" style="display:flex; justify-content:space-between; align-items:center;">
    <span>Admin Dashboard</span>

    <a href="<%= request.getContextPath() %>/LogoutController"
       style="color:white; text-decoration:none; font-size:14px;">
       Logout
    </a>
</div>

<div class="sub-header">
    Manage website content and user data
</div>

<div class="container">

    <div class="card">
        <a href="addProject.jsp">? Add Project</a>
    </div>

    <div class="card">
        <a href="addClient.jsp">? Add Client</a>
    </div>

    <div class="card">
        <!-- FIXED PATH -->
        <a href="viewContacts.jsp">? View Contacts</a>
    </div>

    <div class="card">
        <a href="viewSubscribers.jsp">? View Subscribers</a>
    </div>
    <div class="card">
    <a href="viewProjects.jsp">View / Delete Projects</a>
    </div>
    <div class="card">
    <a href="viewClients.jsp">View / Delete Clients</a>
    </div>

</div>

<div class="footer-links">
    <a href="../index.jsp">? Go to Main Website</a>
</div>
</body>
</html>
