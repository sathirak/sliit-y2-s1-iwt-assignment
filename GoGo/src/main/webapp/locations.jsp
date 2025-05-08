<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #000;
        }
        h2 {
            text-align: center;
            color: #fff;
            background-color: #d32f2f; /* Red background for header */
            padding: 10px;
            margin: 0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #ccc;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #d32f2f; /* Red background for table headers */
            color: #fff; /* White text for table headers */
            font-weight: bold;
        }
        td {
            background-color: #fff; /* White background for table cells */
            color: #000; /* Black text for table cells */
        }
        a {
            color: #000;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .action-buttons form {
            display: inline;
        }
        .action-buttons a, .action-buttons button {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .update-btn {
            background-color: #ffeb3b; /* Yellow background for Update button */
            color: #000; /* Black text */
        }
        .delete-btn {
            background-color: #d32f2f; /* Red background for Delete button */
            color: #fff; /* White text */
        }
    </style>
</head>
<body>
    <h2>Available Locations</h2>
    <table>
        <tr>
            <th>ID (View)</th>
            <th>District</th>
            <th>Contact No</th>
            <th>Street No</th>
            <th>Street</th>
            <th>City</th>
            <th>Actions</th>
        </tr>
        <%
            List<Location> locations = (List<Location>) request.getAttribute("locations");
            if (locations != null) {
                for (Location loc : locations) {
        %>
        <tr>
            <td><a href="location?id=<%= loc.getLocation_id() %>"><%= loc.getLocation_id() %></a></td>
            <td><%= loc.getDistrict() %></td>
            <td><%= loc.getLocation_contact_no() %></td>
            <td><%= loc.getStreet_no() %></td>
            <td><%= loc.getStreet() %></td>
            <td><%= loc.getCity() %></td>
            <td class="action-buttons">
                <!-- Update button -->
                <form action="location/update" method="get">
                    <input type="hidden" name="id" value="<%= loc.getLocation_id() %>">
                    <button type="submit" class="update-btn">Update</button>
                </form>
                <!-- Delete button -->
                <form action="location/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this location?');">
                    <input type="hidden" name="id" value="<%= loc.getLocation_id() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>