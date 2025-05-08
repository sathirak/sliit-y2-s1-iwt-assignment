<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #d32f2f;
            color: white;
            text-align: center;
            padding: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .header p {
            margin: 5px 0;
        }
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: #d32f2f;
            padding: 10px 0;
        }
        .nav a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }
        .form-container {
            max-width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-row {
            display: flex;
            gap: 20px;
        }
        .form-row .form-group {
            flex: 1;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <div class="nav">
        <a href="#">MENU</a>
    </div>
    <div class="form-container">
        <h2>Insert New User</h2>
        <form action="${pageContext.request.contextPath}/user/insert" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="licenseNo">License Number</label>
                    <input type="text" id="licenseNo" name="licenseNo" required>
                </div>
                <div class="form-group">
                    <label for="licenseExpiryDate">License Expiry Date</label>
                    <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" required>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="contactNo">Contact Number</label>
                <input type="text" id="contactNo" name="contactNo" required>
            </div>
            <button type="submit">SUBMIT</button>
        </form>
    </div>
</body>
</html>
