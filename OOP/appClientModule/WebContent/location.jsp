<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location Management</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons button {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            cursor: pointer;
        }
        .update-btn {
            background-color: #FFD700;
            color: black;
        }
        .delete-btn {
            background-color: #FF4500;
            color: white;
        }
    </style>
</head>
<body>
    <h1>LOCATION DETAILS</h1>
    
    <div class="success-message">
        <c:if test="${not empty message}">
            ${message}
        </c:if>
    </div>

    <table>
        <thead>
            <tr>
                <th>Location ID</th>
                <th>District</th>
                <th>Contact No</th>
                <th>Street No</th>
                <th>City</th>
                <th>Street</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="location" items="${locationList}">
                <tr>
                    <td>${location.location_id}</td>
                    <td>${location.district}</td>
                    <td>${location.location_contact_no}</td>
                    <td>${location.street_no}</td>
                    <td>${location.city}</td>
                    <td>${location.street}</td>
                    
                    <td class="action-buttons">
                         <form action="updateLocation.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="location_id" value="${location.location_id}" />
                            <input type="hidden" name="district" value="${location.district}" />
                            <input type="hidden" name="location_contact_no" value="${location.location_contact_no}" />
                            <input type="hidden" name="street_no" value="${location.street_no}" />
                            <input type="hidden" name="city" value="${location.city}" />
                            <input type="hidden" name="street" value="${location.street}" />
                            <button type="submit" class="update-btn">Update</button>
                        </form>
                        
                        <button class="delete-btn" onclick="if(confirm('Are you sure you want to delete this location?')) location.href='deleteLocation?location_id=${location.location_id}'">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>