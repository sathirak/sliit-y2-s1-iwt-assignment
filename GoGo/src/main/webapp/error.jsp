<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff0f0;
        padding: 30px;
    }
    .message-box {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background-color: #ffe0e0;
        border: 1px solid red;
        border-radius: 8px;
        color: red;
        text-align: center;
    }
</style>
</head>
<body>

<div class="message-box">
    <h2>Error!</h2>
    <p><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Oops! an unexpected error occured" %></p>
</div>

</body>
</html>
