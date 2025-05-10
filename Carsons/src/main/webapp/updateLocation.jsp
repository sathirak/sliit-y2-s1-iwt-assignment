<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Location</title>
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
        <h2 class="mb-4">Update Location</h2>

        <form action="update" method="post" class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>
            <div class="col-md-6">
                <label for="location_id" class="form-label">Location ID</label>
                <input type="text" class="form-control" id="location_id" name="location_id" value="${location.location_id}" readonly>
            </div>

            <div class="col-md-6">
                <label for="district" class="form-label">District</label>
                <input type="text" class="form-control" id="district" name="district" value="${location.district}" required>
                <div class="invalid-feedback">Please provide a district.</div>
            </div>

            <div class="col-md-6">
                <label for="location_contact_no" class="form-label">Contact Number</label>
                <input type="text" class="form-control" id="location_contact_no" name="location_contact_no" value="${location.location_contact_no}" required>
                <div class="invalid-feedback">Please provide a contact number.</div>
            </div>

            <div class="col-md-6">
                <label for="street_no" class="form-label">Street Number</label>
                <input type="text" class="form-control" id="street_no" name="street_no" value="${location.street_no}" required>
                <div class="invalid-feedback">Please provide a street number.</div>
            </div>

            <div class="col-md-6">
                <label for="street" class="form-label">Street</label>
                <input type="text" class="form-control" id="street" name="street" value="${location.street}" required>
                <div class="invalid-feedback">Please provide a street name.</div>
            </div>

            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" value="${location.city}" required>
                <div class="invalid-feedback">Please provide a city.</div>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update Location</button>
                <a href="${pageContext.request.contextPath}/location" class="btn btn-secondary ms-2">Back to List</a>
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