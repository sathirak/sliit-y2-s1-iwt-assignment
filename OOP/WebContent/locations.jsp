<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location List</title>
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #000;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            text-align: center;
        }
        a {
            color: #007BFF;
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
        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }
        .update-btn {
            background-color: #FFD700;
        }
        .delete-btn {
            background-color: #FF4500;
            color: white;
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
                <form action="updatelocation.jsp" method="get">
                    <input type="hidden" name="location_id" value="<%= loc.getLocation_id() %>">
                    <button type="submit" class="btn delete-btn">Update</button>
                </form>

                <!-- Delete button -->
                <form action="deletelocation.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this location?');">
                    <input type="hidden" name="location_id" value="<%= loc.getLocation_id() %>">
                    <button type="submit" class="btn delete-btn">Delete</button>
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
