<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/theme.css">
</head>
<body>
    <%@ include file="common/header.jsp" %>
    
    <div class="container">
        <h2 class="page-title">User Details</h2>
        <%
            UserModel user = (UserModel) request.getAttribute("user");
            if (user != null) {
        %>
            <div class="user-details">
                <p><%= user.getUserId() %></p>
                <p><%= user.getFirstName() %> <%= user.getLastName() %></p>
                <p><%= user.getLicenseNo() %></p>
                <p><%= user.getLicenseExpiryDate() %></p>
                <p><%= user.getEmail() %></p>
                <p><%= user.getContactNo() %></p>
            </div>
            
            <form action="<%= request.getContextPath() %>/user/update" method="get" class="form-inline">
                <input type="hidden" name="id" value="<%= user.getUserId() %>" />
                <button type="submit" class="btn btn-gray">Update User</button>
            </form>

            <form action="<%= request.getContextPath() %>/user/delete" method="post" class="form-inline" onsubmit="return confirm('Are you sure you want to delete this user?');">
                <input type="hidden" name="id" value="<%= user.getUserId() %>" />
                <button type="submit" class="btn btn-red">Delete User</button>
            </form>
        <%
            } else {
        %>
            <p class="error-message">User not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>