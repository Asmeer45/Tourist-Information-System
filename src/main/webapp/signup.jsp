<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="styleSheet" type="text/css" href="signup.css">
</head>
<body>
<main>
<h2>Register</h2>
    <form action="Register" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        Phone: <input type="text" name="phone" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" value="Signup">
    </form>
    
    </main>
</body>
</html>