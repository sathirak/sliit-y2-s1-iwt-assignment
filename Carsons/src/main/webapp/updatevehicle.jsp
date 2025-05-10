<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Vehicle</title>
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
        <h2 class="mb-4">Update Vehicle</h2>
        
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center">${errorMsg}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/vehicle/update" method="post" class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>

            <input type="hidden" name="vehicle_id" value="${vehicle.vehicle_id}">

            <div class="col-md-6">
                <label class="form-label">Category</label>
                <input type="text" class="form-control" name="category" value="${vehicle.category}" required>
                <div class="invalid-feedback">Please provide a category.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Model</label>
                <input type="text" class="form-control" name="model" value="${vehicle.model}" required>
                <div class="invalid-feedback">Please provide a model.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Brand</label>
                <input type="text" class="form-control" name="brand" value="${vehicle.brand}" required>
                <div class="invalid-feedback">Please provide a brand.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Gear</label>
                <select class="form-select" name="gear" required>
                    <option value="Automatic" ${vehicle.gear == 'Automatic' ? 'selected' : ''}>Automatic</option>
                    <option value="Manual" ${vehicle.gear == 'Manual' ? 'selected' : ''}>Manual</option>
                </select>
                <div class="invalid-feedback">Please select a gear type.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Color</label>
                <input type="text" class="form-control" name="color" value="${vehicle.color}" required>
                <div class="invalid-feedback">Please provide a color.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Number of Seats</label>
                <input type="number" class="form-control" name="seat_no" value="${vehicle.seat_no}" required>
                <div class="invalid-feedback">Please provide the number of seats.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Fuel Option</label>
                <select class="form-select" name="fuel_option" required>
                    <option value="Petrol" ${vehicle.fuel_option == 'Petrol' ? 'selected' : ''}>Petrol</option>
                    <option value="Diesel" ${vehicle.fuel_option == 'Diesel' ? 'selected' : ''}>Diesel</option>
                    <option value="Electric" ${vehicle.fuel_option == 'Electric' ? 'selected' : ''}>Electric</option>
                    <option value="Petrol/ Hybrid" ${vehicle.fuel_option == 'Petrol/ Hybrid' ? 'selected' : ''}>Petrol/ Hybrid</option>
                </select>
                <div class="invalid-feedback">Please select a fuel option.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Plate Number</label>
                <input type="text" class="form-control" name="plate_no" value="${vehicle.plate_no}" required>
                <div class="invalid-feedback">Please provide a plate number.</div>
            </div>

            <div class="col-md-6">
                <label class="form-label">Daily Rate</label>
                <input type="number" step="0.01" class="form-control" name="daily_rate" value="${vehicle.daily_rate}" required>
                <div class="invalid-feedback">Please provide a daily rate.</div>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update Vehicle</button>
                <a href="${pageContext.request.contextPath}/vehicle" class="btn btn-secondary ms-2">Back to List</a>
            </div>
        </form>
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
