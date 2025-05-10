<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Booking | Reservation Management | Carsons Admin</title>
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
    <h2 class="mb-4">Add New Reservation</h2>

    <form action="<%= request.getContextPath() %>/reservation/insert" method="post"
          class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>

        <!-- User Dropdown -->
        <div class="col-md-4">
            <label class="form-label">User</label>
            <select name="userId" class="form-select" required>
                <option value="">Select User</option>
                <%
                    List<Map<String, String>> users = (List<Map<String, String>>) request.getAttribute("users");
                    for (Map<String, String> user : users) {
                %>
                    <option value="<%= user.get("id") %>"><%= user.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a user.</div>
        </div>

        <!-- Vehicle Dropdown -->
        <div class="col-md-4">
            <label class="form-label">Vehicle</label>
            <select name="vehicleId" class="form-select" required>
                <option value="">Select Vehicle</option>
                <%
                    List<Map<String, String>> vehicles = (List<Map<String, String>>) request.getAttribute("vehicles");
                    for (Map<String, String> vehicle : vehicles) {
                %>
                    <option value="<%= vehicle.get("id") %>"><%= vehicle.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a vehicle.</div>
        </div>

        <!-- Location Dropdown -->
        <div class="col-md-4">
            <label class="form-label">Pickup location/return location</label>
            <select name="locationId" class="form-select" required>
                <option value="">Select Location</option>
                <%
                    List<Map<String, String>> locations = (List<Map<String, String>>) request.getAttribute("locations");
                    for (Map<String, String> location : locations) {
                %>
                    <option value="<%= location.get("id") %>"><%= location.get("name") %></option>
                <% } %>
            </select>
            <div class="invalid-feedback">Please select a location.</div>
        </div>

        <!-- Pickup Date -->
        <div class="col-md-6">
            <label class="form-label">Pickup Date</label>
            <input type="date" name="pickupDate" class="form-control" required />
            <div class="invalid-feedback">Please provide a pickup date.</div>
        </div>

        <!-- Return Date -->
        <div class="col-md-6">
            <label class="form-label">Return Date</label>
            <input type="date" name="returnDate" class="form-control" required />
            <div class="invalid-feedback">Please provide a return date.</div>
        </div>

        <!-- Amount -->
        <div class="col-md-6">
            <label class="form-label">Amount</label>
            <input type="number" step="0.01" name="amount" class="form-control" required readonly />
            <div class="invalid-feedback">This will be calculated automatically.</div>
        </div>

        <!-- No. of Days -->
        <div class="col-md-6">
            <label class="form-label">No. of Days</label>
            <input type="number" name="noOfDates" class="form-control" required readonly />
            <div class="invalid-feedback">This will be auto-calculated.</div>
        </div>

  

        <!-- Submit -->
        <div class="col-12">
            <button type="submit" class="btn btn-success">Submit Reservation</button>
            <a href="<%= request.getContextPath() %>/reservation" class="btn btn-secondary ms-2">Back to List</a>
        </div>
    </form>
</div>

<!-- Bootstrap Validation & Dynamic Calculation -->
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

        const pickupDateInput = document.querySelector('input[name="pickupDate"]');
        const returnDateInput = document.querySelector('input[name="returnDate"]');
        const noOfDatesInput = document.querySelector('input[name="noOfDates"]');
        const vehicleSelect = document.querySelector('select[name="vehicleId"]');
        const amountInput = document.querySelector('input[name="amount"]');

        let currentRate = 0;

        function calculateDaysAndAmount() {
            const pickup = new Date(pickupDateInput.value);
            const ret = new Date(returnDateInput.value);

            if (pickupDateInput.value && returnDateInput.value) {
                if (ret <= pickup) {
                    alert("Return Date must be after Pickup Date.");
                    returnDateInput.value = '';
                    noOfDatesInput.value = '';
                    amountInput.value = '';
                } else {
                    const diffTime = ret - pickup;
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    noOfDatesInput.value = diffDays;

                    if (currentRate > 0) {
                        amountInput.value = (currentRate * diffDays).toFixed(2);
                    }
                }
            }
        }

        function fetchRate(vehicleId) {
            if (!vehicleId) return;

            fetch(`<%= request.getContextPath() %>/reservation/getRate?vehicleId=` + vehicleId)
                .then(response => response.json())
                .then(data => {
                    currentRate = data.rate || 0;
                    const days = parseInt(noOfDatesInput.value);
                    if (!isNaN(days)) {
                        amountInput.value = (currentRate * days).toFixed(2);
                    }
                })
                .catch(err => {
                    console.error("Rate fetch error:", err);
                });
        }

        pickupDateInput.addEventListener('change', calculateDaysAndAmount);
        returnDateInput.addEventListener('change', calculateDaysAndAmount);
        vehicleSelect.addEventListener('change', function () {
            fetchRate(this.value);
        });
    })();
</script>

</body>
</html>