<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Vehicle | Fleet Management | Carsons Admin</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f7f9fc;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.form-container {
	margin-top: 50px;
	padding: 30px;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

.form-title {
	text-align: center;
	margin-bottom: 30px;
	font-weight: 600;
}

.btn-primary {
	width: 100%;
}

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
		<h2 class="mb-4">Add New Vehicle</h2>
		
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger">${errorMsg}</div>
		</c:if>
		
		<form action="${pageContext.request.contextPath}/vehicle/insert" method="post" 
              class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>

			<div class="col-md-6">
				<label for="category" class="form-label">Category</label>
				<input type="text" class="form-control" id="category" name="category" required>
				<div class="invalid-feedback">Please provide a category.</div>
			</div>

			<div class="col-md-6">
				<label for="model" class="form-label">Model</label>
				<input type="text" class="form-control" id="model" name="model" required>
				<div class="invalid-feedback">Please provide a model.</div>
			</div>

			<div class="col-md-6">
				<label for="brand" class="form-label">Brand</label>
				<input type="text" class="form-control" id="brand" name="brand" required>
				<div class="invalid-feedback">Please provide a brand.</div>
			</div>

			<div class="col-md-6">
				<label for="gear" class="form-label">Gear Type</label>
				<select class="form-select" id="gear" name="gear" required>
					<option value="">Select</option>
					<option value="Manual">Manual</option>
					<option value="Automatic">Automatic</option>
				</select>
				<div class="invalid-feedback">Please select a gear type.</div>
			</div>

			<div class="col-md-6">
				<label for="color" class="form-label">Color</label>
				<input type="text" class="form-control" id="color" name="color" required>
				<div class="invalid-feedback">Please provide a color.</div>
			</div>

			<div class="col-md-6">
				<label for="seat_no" class="form-label">Seat Count</label>
				<input type="number" class="form-control" id="seat_no" name="seat_no" min="1" required>
				<div class="invalid-feedback">Please provide a valid seat count.</div>
			</div>

			<div class="col-md-6">
				<label for="fuel_option" class="form-label">Fuel Option</label>
				<select class="form-select" id="fuel_option" name="fuel_option" required>
					<option value="">Select</option>
					<option value="Petrol">Petrol</option>
					<option value="Diesel">Diesel</option>
					<option value="Electric">Electric</option>
					<option value="Petrol/ Hybrid">Petrol/ Hybrid</option>
				</select>
				<div class="invalid-feedback">Please select a fuel option.</div>
			</div>

			<div class="col-md-6">
				<label for="plate_no" class="form-label">Plate Number</label>
				<input type="text" class="form-control" id="plate_no" name="plate_no"
					pattern="^[A-Z]{2,3}[-\s][0-9]{4}$"
					title="Format: 2 or 3 capital letters, space or dash, then 4 digits. E.g., AB-1234 or ABC 5678"
					placeholder="e.g., AB-1234 or ABC 5678"
					required>
				<div class="invalid-feedback">Please provide a valid plate number (e.g., AB-1234).</div>
			</div>

			<div class="col-md-6">
				<label for="daily_rate" class="form-label">Daily Rate (Rs)</label>
				<input type="number" step="0.01" class="form-control" id="daily_rate"
					name="daily_rate" min="0" required>
				<div class="invalid-feedback">Please provide a valid daily rate.</div>
			</div>

			<div class="col-12">
				<button type="submit" class="btn btn-success">Submit</button>
				<a href="${pageContext.request.contextPath}/vehicle" class="btn btn-secondary ms-2">Back to List</a>
			</div>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
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

