<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Rental Search</title>
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
        .results {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
        }
        .results-text {
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <div class="nav">
        <a href="#">MENU</a>
    </div>
    <div class="form-container">
        <form action="location/insert" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label>District</label>
                    <input type="text" name="district" required>
                </div>
                <div class="form-group">
                    <label>Contact No</label>
                    <input type="number" name="location_contact_no" required>
                </div>
            </div>
            <div class="form-group">
                <label>Street No</label>
                <input type="text" name="street_no" required>
            </div>
            <div class="form-group">
                <label>Street</label>
                <input type="text" name="street" required>
            </div>
            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" required>
            </div>
            <button type="submit">SUBMIT</button>
        </form>
    </div>
    <div class="results">
        26 Results Available
    </div>
    <div class="results-text">
        SELF DRIVER CARS FROM 23-04-2025 TO 25-04-2025 (3 DAY(S))
    </div>
</body>
</html>