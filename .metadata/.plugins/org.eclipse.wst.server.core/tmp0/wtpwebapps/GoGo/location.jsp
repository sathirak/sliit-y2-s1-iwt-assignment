<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        td {
            background-color: #fff;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .action-buttons a {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            font-weight: bold;
        }
        .update-btn {
            background-color: #ffeb3b;
            color: #000;
        }
        .delete-btn {
            background-color: #f44336;
            color: #fff;
        }
        p {
            text-align: center;
            color: red;
        }
        .message {
            text-align: center;
            color: green;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <div class="container mt-4">
        <h2>Location Details</h2>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <div class="message"><%= message %></div>
        <% } %>
        <%
            Location location = (Location) request.getAttribute("location");
            if (location != null) {
        %>
        <table>
            <tr>
                <th>Location ID</th>
                <th>District</th>
                <th>Contact No</th>
                <th>Street No</th>
                <th>Street</th>
                <th>City</th>
                <th>Actions</th>
            </tr>
            <tr>
                <td><%= location.getLocation_id() %></td>
                <td><%= location.getDistrict() %></td>
                <td><%= location.getLocation_contact_no() %></td>
                <td><%= location.getStreet_no() %></td>
                <td><%= location.getStreet() %></td>
                <td><%= location.getCity() %></td>
                <td>
                    <div class="action-buttons">
                        <form action="${pageContext.request.contextPath}/location/update" method="get">
                            <input type="hidden" name="id" value="<%= location.getLocation_id() %>">
                            <button type="submit" class="update-btn">Update</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/location/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this location?');">
                            <input type="hidden" name="id" value="<%= location.getLocation_id() %>">
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
        <%
            } else {
        %>
        <p>No location found.</p>
        <%
            }
        %>
    </div>
</body>
</html>