<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert User</title>
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
        <h2 class="mb-4">Insert New User</h2>
        
        <form action="${pageContext.request.contextPath}/user/insert" method="post" 
              class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>
            
            <div class="col-md-6">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" id="firstName" name="firstName" class="form-control" required>
                <div class="invalid-feedback">Please provide a first name.</div>
            </div>
            
            <div class="col-md-6">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" id="lastName" name="lastName" class="form-control" required>
                <div class="invalid-feedback">Please provide a last name.</div>
            </div>
            
            <div class="col-md-6">
                <label for="licenseNo" class="form-label">License Number</label>
                <input type="text" id="licenseNo" name="licenseNo" class="form-control" required>
                <div class="invalid-feedback">Please provide a license number.</div>
            </div>
            
            <div class="col-md-6">
                <label for="licenseExpiryDate" class="form-label">License Expiry Date</label>
                <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" class="form-control" required>
                <div class="invalid-feedback">Please provide the license expiry date.</div>
            </div>
            
            <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control" required>
                <div class="invalid-feedback">Please provide a valid email.</div>
            </div>
            
            <div class="col-md-6">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
                <div class="invalid-feedback">Please provide a password.</div>
            </div>
            
            <div class="col-md-6">
                <label for="contactNo" class="form-label">Contact Number</label>
                <input type="text" id="contactNo" name="contactNo" class="form-control" required>
                <div class="invalid-feedback">Please provide a contact number.</div>
            </div>
            
            <div class="col-12">
                <button type="submit" class="btn btn-success">Submit</button>
                <a href="${pageContext.request.contextPath}/user" class="btn btn-secondary ms-2">Back to List</a>
            </div>
        </form>
    </div>
    
    <!-- Bootstrap JS -->
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
