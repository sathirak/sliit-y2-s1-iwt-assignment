<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0fff0;
        padding: 30px;
    }
    .message-box {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background-color: #e0ffe0;
        border: 1px solid green;
        border-radius: 8px;
        color: green;
        text-align: center;
    }
</style>
</head>
<body>

<div class="message-box">
    <h2>Success!</h2>
    <p><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Success!" %></p>
</div>

</body>
</html>
