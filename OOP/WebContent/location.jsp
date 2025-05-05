<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location Details</title>
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
    <h2>Location Details</h2>
    <div class="message">Location updated successfully!</div>
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
                    <a href="#" class="update-btn">Update</a>
                    <a href="#" class="delete-btn">Delete</a>
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
</body>
</html>