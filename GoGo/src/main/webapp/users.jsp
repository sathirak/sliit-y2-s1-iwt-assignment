<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, user.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #000;
        }
        h2 {
            text-align: center;
            color: #fff;
            background-color: #d32f2f;
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
            background-color: #d32f2f;
            color: #fff;
            font-weight: bold;
        }
        td {
            background-color: #fff;
            color: #000;
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
            background-color: #ffeb3b;
            color: #000;
        }
        .delete-btn {
            background-color: #d32f2f;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>All Registered Users</h2>
    <%
        List<UserModel> users = (List<UserModel>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
    %>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>License No</th>
            <th>Expiry</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        <%
            for (UserModel user : users) {
        %>
        <tr>
            <td><a href="<%= request.getContextPath() %>/user?id=<%= user.getUserId() %>"><%= user.getUserId() %></a></td>
            <td><%= user.getFirstName() %> <%= user.getLastName() %></td>
            <td><%= user.getLicenseNo() %></td>
            <td><%= user.getLicenseExpiryDate() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getContactNo() %></td>
            <td class="action-buttons">
                <!-- Update button -->
                <form action="user/update" method="get">
                    <input type="hidden" name="id" value="<%= user.getUserId() %>">
                    <button type="submit" class="update-btn">Update</button>
                </form>
                <!-- Delete button -->
                <form action="user/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                    <input type="hidden" name="id" value="<%= user.getUserId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
        <p>No users found.</p>
    <%
        }
    %>
</body>
</html>
