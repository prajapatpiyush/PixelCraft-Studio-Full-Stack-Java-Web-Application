<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Project</title>
    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        input, textarea {
            width: 100%;
            margin: 8px 0;
            padding: 8px;
        }
        button {
            padding: 10px;
            width: 100%;
            margin-top: 10px;
        }
        .msg { color: green; }
        .error { color: red; }
        .back-btn {
            background: #007bff;
            color: white;
            text-decoration: none;
            display: block;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add Project</h2>

    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <p class="msg">Project added successfully!</p>
    <% } else if ("error".equals(msg)) { %>
        <p class="error">Something went wrong!</p>
    <% } %>

    <!-- IMPORTANT: enctype added -->
    <form action="../ProjectController"
          method="post"
          enctype="multipart/form-data">

        <input type="text" name="name" placeholder="Project Name" required>

        <textarea name="description"
                  placeholder="Project Description"
                  required></textarea>

        <!-- REAL IMAGE UPLOAD -->
        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Add Project</button>
    </form>

    <a href="../index.jsp" class="back-btn">? Go to Main Page</a>
</div>

</body>
</html>
