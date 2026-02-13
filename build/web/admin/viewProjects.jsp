<%-- 
    Document   : viewProjects
    Created on : 19 Dec 2025, 10:26:18?pm
    Author     : piyus
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.app.dao.ProjectDAO" %>
<%@ page import="com.app.model.Project" %>

<%
    // SESSION PROTECTION
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Projects</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6f8;
        }
        .container {
            width: 90%;
            margin: 40px auto;
            background: white;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        img {
            width: 80px;
            border-radius: 4px;
        }
        .delete-btn {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }
        .back {
            margin-top: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>All Projects</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Action</th>
        </tr>

        <%
            ProjectDAO dao = new ProjectDAO();
            List<Project> list = dao.getAllProjects();

            for (Project p : list) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td>
                <img src="../images/img/<%= p.getImage() %>">
            </td>
            <td>
                <a class="delete-btn"
                   href="<%= request.getContextPath() %>/DeleteProjectController?id=<%= p.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this project?')">
                   Delete
                </a>
            </td>
        </tr>
        <% } %>
    </table>

    <a class="back" href="dashboard.jsp">? Back to Dashboard</a>
</div>

</body>
</html>
