<%-- 
    Document   : viewSubscribers
    Created on : 19 Dec 2025
    Author     : piyus
--%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page import="java.util.List" %>
<%@ page import="com.app.dao.SubscriberDAO" %>
<%@ page import="com.app.model.Subscriber" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Subscribers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .container {
            width: 600px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 6px;
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .no-data {
            text-align: center;
            color: #999;
            padding: 20px;
        }
        .links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .links a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Subscribed Emails</h2>

    <%
        SubscriberDAO dao = new SubscriberDAO();
        List<Subscriber> list = dao.getAllSubscribers();
        if (list == null || list.isEmpty()) {
    %>
        <p class="no-data">No subscribers found.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Email</th>
            </tr>
            <%
                for (Subscriber s : list) {
            %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getEmail() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <div class="links">
        <a href="../admin/dashboard.jsp">? Back to Dashboard</a>
        <a href="../index.jsp">Go to Main Website ?</a>
    </div>

</div>

</body>
</html>
