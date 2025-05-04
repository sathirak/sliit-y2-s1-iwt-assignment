<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
</head>
<body>
    <h2>User Details</h2>
    <%
        UserModel user = (UserModel) request.getAttribute("user");
        if (user != null) {
    %>
        <p><strong>ID:</strong> <%= user.getUserId() %></p>
        <p><strong>Name:</strong> <%= user.getFirstName() %> <%= user.getLastName() %></p>
        <p><strong>License No:</strong> <%= user.getLicenseNo() %></p>
        <p><strong>License Expiry Date:</strong> <%= user.getLicenseExpiryDate() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Contact No:</strong> <%= user.getContactNo() %></p>
        
        <!-- Update Button -->
        <form action="<%= request.getContextPath() %>/user/update" method="get">
            <input type="hidden" name="id" value="<%= user.getUserId() %>" />
            <button type="submit">Update User</button>
        </form>

        <!-- Delete Button -->
        <form action="<%= request.getContextPath() %>/user/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
            <input type="hidden" name="id" value="<%= user.getUserId() %>" />
            <button type="submit" style="background-color: red; color: white;">Delete User</button>
        </form>
        
    <%
        } else {
    %>
        <p>User not found.</p>
    <%
        }
    %>
</body>
</html>
