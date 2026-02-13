<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Happy Client</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .container {
            width: 420px;
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 6px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            background: orange;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background: #e67a00;
        }
        .msg {
            text-align: center;
            color: green;
            margin-bottom: 10px;
        }
        .error {
            text-align: center;
            color: red;
            margin-bottom: 10px;
        }
        .links {
            margin-top: 15px;
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
    <h2>Add Happy Client</h2>

    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <p class="msg">Client added successfully!</p>
    <% } else if ("error".equals(msg)) { %>
        <p class="error">Something went wrong!</p>
    <% } %>

    <!-- IMPORTANT: enctype added -->
    <form action="<%= request.getContextPath() %>/ClientController"
          method="post"
          enctype="multipart/form-data">

        <input type="text" name="name" placeholder="Client Name" required>

        <input type="text" name="designation"
               placeholder="Designation (e.g. Manager)" required>

        <textarea name="description"
                  placeholder="Client feedback / description" required></textarea>

        <!-- REAL IMAGE UPLOAD -->
        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Add Client</button>
    </form>

    <div class="links">
        <a href="../admin/dashboard.jsp">← Back to Dashboard</a>
        <a href="../index.jsp">Go to Main Website →</a>
    </div>
</div>

</body>
</html>
