<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="loginstyle.css">
</head>
<body>
   
    <main>
        <h2>User Login</h2>
        <form action="loginservlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <button type="submit">Login</button>
        </form>
        
        <p>Don't have an account? <a href="signup.jsp">Register here</a></p>
        <p>Login As Admin <a href="AdminLogin.jsp">Admin Login</a>
        
        
    </main>
</body>
</html>