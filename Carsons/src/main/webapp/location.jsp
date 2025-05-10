<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="common/header.jsp" %>
    
    <div class="container mt-4">
        <h2 class="mb-4">Location Details</h2>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert alert-success"><%= message %></div>
        <% } %>
        <%
            Location location = (Location) request.getAttribute("location");
            if (location != null) {
        %>
        <div class="card shadow-sm">
            <div class="card-body">
                <dl class="row">
                    <dt class="col-sm-4">Location ID</dt>
                    <dd class="col-sm-8"><%= location.getLocation_id() %></dd>

                    <dt class="col-sm-4">District</dt>
                    <dd class="col-sm-8"><%= location.getDistrict() %></dd>

                    <dt class="col-sm-4">Contact No</dt>
                    <dd class="col-sm-8"><%= location.getLocation_contact_no() %></dd>

                    <dt class="col-sm-4">Street No</dt>
                    <dd class="col-sm-8"><%= location.getStreet_no() %></dd>

                    <dt class="col-sm-4">Street</dt>
                    <dd class="col-sm-8"><%= location.getStreet() %></dd>

                    <dt class="col-sm-4">City</dt>
                    <dd class="col-sm-8"><%= location.getCity() %></dd>
                </dl>

                <div class="mt-4">
                    <form action="${pageContext.request.contextPath}/location/update" method="get" class="d-inline">
                        <input type="hidden" name="id" value="<%= location.getLocation_id() %>">
                        <button type="submit" class="btn btn-warning text-white">Update</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/location/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this location?');">
                        <input type="hidden" name="id" value="<%= location.getLocation_id() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    <a href="${pageContext.request.contextPath}/location" class="btn btn-secondary ms-2">Back to List</a>
                </div>
            </div>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-danger">No location found.</div>
        <%
            }
        %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>