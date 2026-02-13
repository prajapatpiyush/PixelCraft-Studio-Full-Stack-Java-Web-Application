<%-- 
    Document   : login
    Created on : 19 Dec 2025, 10:10:20?pm
    Author     : piyus
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6f8;
        }
        .login-box {
            width: 360px;
            margin: 120px auto;
            background: white;
            padding: 30px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            border-radius: 8px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            background: orange;
            border: none;
            color: white;
            cursor: pointer;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>Admin Login</h2>

    <% if ("true".equals(request.getParameter("error"))) { %>
        <p class="error">Invalid username or password</p>
    <% } %>

    <form action="<%= request.getContextPath() %>/AdminLoginController" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
        <p>username:admin  and password: admin123</p>
    </form>
</div>

</body>
</html>
