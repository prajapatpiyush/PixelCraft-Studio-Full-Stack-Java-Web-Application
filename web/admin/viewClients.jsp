<%-- 
    Document   : viewClients
    Created on : 19 Dec 2025, 10:31:42?pm
    Author     : piyus
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.app.dao.ClientDAO" %>
<%@ page import="com.app.model.Client" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Clients</title>
    <style>
        body { font-family: Arial; background:#f4f6f8; }
        .container {
            width:90%; margin:40px auto; background:white;
            padding:25px; box-shadow:0 4px 12px rgba(0,0,0,0.15);
        }
        h2 { text-align:center; color:#007bff; }
        table { width:100%; border-collapse:collapse; margin-top:20px; }
        th, td { padding:10px; border-bottom:1px solid #ddd; text-align:center; }
        th { background:#007bff; color:white; }
        img { width:60px; border-radius:50%; }
        .delete { color:red; font-weight:bold; text-decoration:none; }
    </style>
</head>
<body>

<div class="container">
    <h2>All Clients</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Action</th>
        </tr>

        <%
            ClientDAO dao = new ClientDAO();
            List<Client> list = dao.getAllClients();
            for (Client c : list) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getName() %></td>
            <td>
                <img src="../images/img/<%= c.getImage() %>">
            </td>
            <td>
                <a class="delete"
                   href="<%= request.getContextPath() %>/DeleteClientController?id=<%= c.getId() %>"
                   onclick="return confirm('Delete this client?')">
                   Delete
                </a>
            </td>
        </tr>
        <% } %>
    </table>

    <a href="dashboard.jsp">? Back to Dashboard</a>
</div>

</body>
</html>
