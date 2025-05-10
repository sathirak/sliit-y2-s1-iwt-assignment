<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="common/header.jsp" %>
    
    <div class="container mt-4">
        <h2 class="mb-4">User Details</h2>
        <%
            UserModel user = (UserModel) request.getAttribute("user");
            if (user != null) {
        %>
        <div class="card shadow-sm">
            <div class="card-body">
                <dl class="row">
                    <dt class="col-sm-4">User ID</dt>
                    <dd class="col-sm-8"><%= user.getUserId() %></dd>

                    <dt class="col-sm-4">Full Name</dt>
                    <dd class="col-sm-8"><%= user.getFirstName() %> <%= user.getLastName() %></dd>

                    <dt class="col-sm-4">License No</dt>
                    <dd class="col-sm-8"><%= user.getLicenseNo() %></dd>

                    <dt class="col-sm-4">License Expiry Date</dt>
                    <dd class="col-sm-8"><%= user.getLicenseExpiryDate() %></dd>

                    <dt class="col-sm-4">Email</dt>
                    <dd class="col-sm-8"><%= user.getEmail() %></dd>

                    <dt class="col-sm-4">Contact No</dt>
                    <dd class="col-sm-8"><%= user.getContactNo() %></dd>
                </dl>

                <div class="mt-4">
                    <form action="<%= request.getContextPath() %>/user/update" method="get" class="d-inline">
                        <input type="hidden" name="id" value="<%= user.getUserId() %>" />
                        <button type="submit" class="btn btn-warning text-white">Update</button>
                    </form>

                    <form action="<%= request.getContextPath() %>/user/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="id" value="<%= user.getUserId() %>" />
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>

                    <a href="<%= request.getContextPath() %>/user" class="btn btn-secondary ms-2">Back to List</a>
                </div>
            </div>
        </div>
        <%
            } else {
        %>
            <div class="alert alert-danger">User not found.</div>
        <%
            }
        %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>