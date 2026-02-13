<%-- 
    Document   : viewContacts
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
<%@ page import="com.app.dao.ContactDAO" %>
<%@ page import="com.app.model.Contact" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Contacts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
        }

        .header {
            background: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            border-radius: 6px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 10px;
        }

        .count {
            text-align: center;
            color: #555;
            margin-bottom: 20px;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
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
            padding: 25px;
            border: 1px dashed #ccc;
        }

        .links {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
        }

        .links a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="header">
    Admin Panel ? Contact Messages
</div>

<div class="container">

    <h2>Contact Messages</h2>

    <%
        ContactDAO dao = new ContactDAO();
        List<Contact> contacts = dao.getAllContacts();
    %>

    <div class="count">
        Total Messages: <strong><%= (contacts == null) ? 0 : contacts.size() %></strong>
    </div>

    <%
        if (contacts == null || contacts.isEmpty()) {
    %>
        <div class="no-data">
            No contact messages found.
        </div>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>City</th>
            </tr>

            <%
                for (Contact c : contacts) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getFullName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getMobile() %></td>
                <td><%= c.getCity() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <div class="links">
        <a href="dashboard.jsp">? Back to Dashboard</a>
        <a href="../index.jsp">Go to Main Website ?</a>
    </div>

</div>

</body>
</html>
