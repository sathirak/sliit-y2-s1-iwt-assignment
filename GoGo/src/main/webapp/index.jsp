<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .login-container input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        border: none;
        color: white;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
    }
    .login-container input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
