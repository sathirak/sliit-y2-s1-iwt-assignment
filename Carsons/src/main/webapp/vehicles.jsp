<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fleet Management | Carsons Rental Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="common/header.jsp" %>

<%
    String successMessage = (String) session.getAttribute("successMsg");
    String errorMessage = (String) session.getAttribute("errorMsg");
    if (successMessage != null) session.removeAttribute("successMsg");
    if (errorMessage != null) session.removeAttribute("errorMsg");
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
    <h2 class="mb-4">Available Vehicles</h2>

    <div class="row mb-3">
        <div class="col-md-6">
            <a href="<%= request.getContextPath() %>/vehicle/insert" class="btn btn-primary">Add Vehicle</a>
        </div>
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" id="searchInput" class="form-control" placeholder="Search vehicles...">
                <button class="btn btn-outline-secondary" type="button" onclick="clearSearch()">Clear</button>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Category</th>
                    <th>Model</th>
                    <th>Brand</th>
                    <th>Gear</th>
                    <th>Color</th>
                    <th>Seats</th>
                    <th>Fuel</th>
                    <th>Plate No</th>
                    <th>Rate (Rs)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="veh" items="${vehicles}">
                    <tr class="clickable-row" data-href="<%= request.getContextPath() %>/vehicle?id=${veh.vehicle_id}">
                        <td><a href="<%= request.getContextPath() %>/vehicle?id=${veh.vehicle_id}" class="text-decoration-none">${veh.vehicle_id}</a></td>
                        <td>${veh.category}</td>
                        <td>${veh.model}</td>
                        <td>${veh.brand}</td>
                        <td>${veh.gear}</td>
                        <td>${veh.color}</td>
                        <td>${veh.seat_no}</td>
                        <td>${veh.fuel_option}</td>
                        <td>${veh.plate_no}</td>
                        <td>${veh.daily_rate}</td>
                        <td>
                            <a href="<%= request.getContextPath() %>/vehicle?id=${veh.vehicle_id}" class="btn btn-sm btn-info text-white">View</a>
                            <a href="<%= request.getContextPath() %>/vehicle/update?id=${veh.vehicle_id}" class="btn btn-sm btn-warning text-white">Edit</a>
                            <form action="<%= request.getContextPath() %>/vehicle/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this vehicle?');">
                                <input type="hidden" name="vehicle_id" value="${veh.vehicle_id}" />
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.toast').forEach(function (toastEl) {
        new bootstrap.Toast(toastEl, { delay: 3000 }).show();
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        const rows = document.querySelectorAll('.clickable-row');
        rows.forEach(row => {
            row.addEventListener('click', function(event) {
                if (event.target.tagName === 'A' || event.target.tagName === 'BUTTON' || 
                    event.target.tagName === 'INPUT' || event.target.closest('form')) {
                    return;
                }
                window.location = this.dataset.href;
            });
            row.style.cursor = 'pointer';
        });
        
        document.getElementById('searchInput').addEventListener('keyup', function() {
            let searchText = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('.table tbody tr');
            
            tableRows.forEach(row => {
                let rowText = row.textContent.toLowerCase();
                if (rowText.includes(searchText)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });
    
    function clearSearch() {
        document.getElementById('searchInput').value = '';
        const tableRows = document.querySelectorAll('.table tbody tr');
        tableRows.forEach(row => {
            row.style.display = '';
        });
    }
</script>

</body>
</html>
