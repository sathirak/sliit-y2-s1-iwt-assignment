<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Location</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #8B0000;
            text-align: center;
        }
        .success-message {
            color: green;
            text-align: center;
        }
        .error-message {
            color: red;
            text-align: center;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container label {
            display: block;
            margin: 10px 0 5px;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-container button {
            padding: 10px 20px;
            background-color: #8B0000; /* Matches the h1 color (DELETE LOCATION topic) */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #6B0000; /* Slightly darker shade for hover */
        }
    </style>
</head>
<body>
    <h1>DELETE LOCATION</h1>
    
    <div class="success-message">
        <c:if test="${not empty message}">
            ${message}
        </c:if>
    </div>
    <div class="error-message">
        <c:if test="${not empty error}">
            ${error}
        </c:if>
    </div>

    <div class="form-container">
        <form action="location/delete" method="post">
            <label for="locationId">Location ID</label>
            <input type="text" id="locationId" name="locationId" required />
            <button type="submit" onclick="return confirm('Are you sure you want to delete this location?');">Delete Location</button>
        </form>
    </div>
</body>
</html>