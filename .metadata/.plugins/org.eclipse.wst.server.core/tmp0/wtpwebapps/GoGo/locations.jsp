<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="location.Location" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Location List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="common/header.jsp" %>
    
    <%
        String successMessage = (String) session.getAttribute("success");
        String errorMessage = (String) session.getAttribute("error");
        if (successMessage != null) session.removeAttribute("success");
        if (errorMessage != null) session.removeAttribute("error");
    %>

    <!-- Toast Container -->
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 9999">
        <% if (successMessage != null) { %>
            <div class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body"><%= successMessage %></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        <% } %>
        <% if (errorMessage != null) { %>
            <div class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body"><%= errorMessage %></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        <% } %>
    </div>
    
    <div class="container mt-5">
        <h2 class="mb-4">Available Locations</h2>

        <!-- Add Button -->
        <a href="<%= request.getContextPath() %>/location/insert" class="btn btn-primary mb-3">Add Location</a>
        
        <%
            List<Location> locations = (List<Location>) request.getAttribute("locations");
            if (locations != null && !locations.isEmpty()) {
        %>
        <div class="table-responsive">
            <table class="table table-bordered table-hover bg-white shadow-sm">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>District</th>
                        <th>Contact No</th>
                        <th>Street No</th>
                        <th>Street</th>
                        <th>City</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Location loc : locations) { %>
                    <tr>
                        <td><a href="location?id=<%= loc.getLocation_id() %>" class="text-decoration-none"><%= loc.getLocation_id() %></a></td>
                        <td><%= loc.getDistrict() %></td>
                        <td><%= loc.getLocation_contact_no() %></td>
                        <td><%= loc.getStreet_no() %></td>
                        <td><%= loc.getStreet() %></td>
                        <td><%= loc.getCity() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/location?id=<%= loc.getLocation_id() %>" class="btn btn-sm btn-info text-white">View</a>
                            <a href="<%= request.getContextPath() %>/location/update?id=<%= loc.getLocation_id() %>" class="btn btn-sm btn-warning text-white">Edit</a>
                            <form action="<%= request.getContextPath() %>/location/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this location?');">
                                <input type="hidden" name="id" value="<%= loc.getLocation_id() %>">
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } else { %>
            <div class="alert alert-warning">No locations found.</div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('.toast').forEach(function (toastEl) {
            new bootstrap.Toast(toastEl, { delay: 3000 }).show();
        });
    </script>
</body>
</html>