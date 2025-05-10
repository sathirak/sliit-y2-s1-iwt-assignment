<%@ page import="reservation.ReservationModel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Booking Details | Reservation Management | Carsons Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .was-validated .form-control:invalid,
        .was-validated .form-select:invalid {
            border-color: #dc3545;
        }
        .was-validated .form-control:invalid:focus,
        .was-validated .form-select:invalid:focus {
            box-shadow: 0 0 0 0.2rem rgba(220,53,69,.25);
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="common/header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Update Reservation</h2>

    <%
        ReservationModel res = (ReservationModel) request.getAttribute("reservation");
        List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
        List<Map<String, String>> vehicles = (List<Map<String, String>>) request.getAttribute("vehicles");
        List<Map<String, String>> locations = (List<Map<String, String>>) request.getAttribute("locations");

        if (res != null) {
    %>

    <form action="<%= request.getContextPath() %>/reservation/update" method="post" class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>
        <input type="hidden" name="id" value="<%= res.getReservationId() %>" />

        <!-- User Dropdown -->
        <div class="col-md-4">
            <label class="form-label">User</label>
            <select name="userId" class="form-select" required>
                <% for (Map<String, String> user : users) {
                    String selected = user.get("id").equals(String.valueOf(res.getUserId())) ? "selected" : "";
                %>
                    <option value="<%= user.get("id") %>" <%= selected %>><%= user.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a user.</div>
        </div>

        <!-- Vehicle Dropdown -->
        <div class="col-md-4">
            <label class="form-label">Vehicle</label>
            <select name="vehicleId" class="form-select" required>
                <% for (Map<String, String> vehicle : vehicles) {
                    String selected = vehicle.get("id").equals(String.valueOf(res.getVehicleId())) ? "selected" : "";
                %>
                    <option value="<%= vehicle.get("id") %>" <%= selected %>><%= vehicle.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a vehicle.</div>
        </div>

        <!-- Location Dropdown -->
        <div class="col-md-4">
            <label class="form-label">Location</label>
            <select name="locationId" class="form-select" required>
                <% for (Map<String, String> location : locations) {
                    String selected = location.get("id").equals(String.valueOf(res.getLocationId())) ? "selected" : "";
                %>
                    <option value="<%= location.get("id") %>" <%= selected %>><%= location.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a location.</div>
        </div>

        <!-- Pickup Date -->
        <div class="col-md-6">
            <label class="form-label">Pickup Date</label>
            <input type="date" name="pickupDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(res.getPickupDate()) %>" class="form-control" required />
            <div class="invalid-feedback">Please provide a pickup date.</div>
        </div>

        <!-- Return Date -->
        <div class="col-md-6">
            <label class="form-label">Return Date</label>
            <input type="date" name="returnDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(res.getReturnDate()) %>" class="form-control" required />
            <div class="invalid-feedback">Please provide a return date.</div>
        </div>

        <!-- Amount -->
        <div class="col-md-6">
            <label class="form-label">Amount</label>
            <input type="number" step="0.01" name="amount" value="<%= res.getAmount() %>" class="form-control" required />
            <div class="invalid-feedback">Please enter a valid amount.</div>
        </div>

        <!-- No. of Days -->
        <div class="col-md-6">
            <label class="form-label">No. of Days</label>
            <input type="number" name="noOfDates" value="<%= res.getNoOfDates() %>" class="form-control" required />
            <div class="invalid-feedback">Please enter number of days.</div>
        </div>

        <!-- Pickup Location -->
        <div class="col-md-6">
            <label class="form-label">Pickup Location</label>
            <input type="text" name="pickupLocation" value="<%= res.getPickupLocation() %>" class="form-control" required />
            <div class="invalid-feedback">Please provide a pickup location.</div>
        </div>

        <!-- Return Location -->
        <div class="col-md-6">
            <label class="form-label">Return Location</label>
            <input type="text" name="returnLocation" value="<%= res.getReturnLocation() %>" class="form-control" required />
            <div class="invalid-feedback">Please provide a return location.</div>
        </div>

        <!-- Submit -->
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Update Reservation</button>
            <a href="<%= request.getContextPath() %>/reservation" class="btn btn-secondary ms-2">Back to List</a>
        </div>
    </form>

    <% } else { %>
        <div class="alert alert-danger">Reservation not found.</div>
    <% } %>
</div>

<!-- Bootstrap Validation Script -->
<script>
    (function () {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>

</body>
</html>
