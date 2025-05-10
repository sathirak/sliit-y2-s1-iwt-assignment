<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Branch | Location Management | Carsons Admin</title>
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
        <h2 class="mb-4">Add New Location</h2>
        
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger">${errorMsg}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/location/insert" method="post" 
              class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>
            
            <div class="col-md-6">
                <label for="district" class="form-label">District</label>
                <input type="text" id="district" name="district" class="form-control" required>
                <div class="invalid-feedback">Please provide a district.</div>
            </div>
            
            <div class="col-md-6">
                <label for="location_contact_no" class="form-label">Contact No</label>
                <input type="number" id="location_contact_no" name="location_contact_no" class="form-control" required>
                <div class="invalid-feedback">Please provide a contact number.</div>
            </div>
            
            <div class="col-md-6">
                <label for="street_no" class="form-label">Street No</label>
                <input type="text" id="street_no" name="street_no" class="form-control" required>
                <div class="invalid-feedback">Please provide a street number.</div>
            </div>
            
            <div class="col-md-6">
                <label for="street" class="form-label">Street</label>
                <input type="text" id="street" name="street" class="form-control" required>
                <div class="invalid-feedback">Please provide a street name.</div>
            </div>
            
            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" id="city" name="city" class="form-control" required>
                <div class="invalid-feedback">Please provide a city.</div>
            </div>
            
            <div class="col-12">
                <button type="submit" class="btn btn-success">Submit</button>
                <a href="${pageContext.request.contextPath}/location" class="btn btn-secondary ms-2">Back to List</a>
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