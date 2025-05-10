<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserModel" %>
<%@ page import="user.UserDBUtil" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
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
        <h2 class="mb-4">Update User</h2>
        
        <%
            String userIdStr = request.getParameter("id");
            if (userIdStr != null) {
                try {
                    int userId = Integer.parseInt(userIdStr);
                    UserModel user = UserDBUtil.getUserDetailsById(String.valueOf(userId));
                    if (user != null) {
        %>
            <form action="<%= request.getContextPath() %>/user/update" method="post" class="row g-3 bg-white p-4 rounded shadow-sm needs-validation" novalidate>
                <input type="hidden" name="id" value="<%= user.getUserId() %>" />

                <div class="col-md-6">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required/>
                    <div class="invalid-feedback">Please provide a first name.</div>
                </div>

                <div class="col-md-6">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%= user.getLastName() %>" required/>
                    <div class="invalid-feedback">Please provide a last name.</div>
                </div>

                <div class="col-md-6">
                    <label for="licenseNo" class="form-label">License No</label>
                    <input type="text" class="form-control" id="licenseNo" name="licenseNo" value="<%= user.getLicenseNo() %>" required/>
                    <div class="invalid-feedback">Please provide a license number.</div>
                </div>

                <div class="col-md-6">
                    <label for="licenseExpiryDate" class="form-label">License Expiry Date</label>
                    <input type="date" class="form-control" id="licenseExpiryDate" name="licenseExpiryDate" 
                           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(user.getLicenseExpiryDate()) %>" required/>
                    <div class="invalid-feedback">Please provide a license expiry date.</div>
                </div>

                <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required/>
                    <div class="invalid-feedback">Please provide a valid email.</div>
                </div>

                <div class="col-md-6">
                    <label for="contactNo" class="form-label">Contact No</label>
                    <input type="text" class="form-control" id="contactNo" name="contactNo" value="<%= user.getContactNo() %>" required/>
                    <div class="invalid-feedback">Please provide a contact number.</div>
                </div>

                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Update User</button>
                    <a href="<%= request.getContextPath() %>/user" class="btn btn-secondary ms-2">Back to List</a>
                </div>
            </form>
        <%
                } else {
        %>
                <div class="alert alert-danger">User not found.</div>
        <%
                }
            } catch (NumberFormatException e) {
        %>
            <div class="alert alert-danger">Invalid user ID format.</div>
        <%
            }
        } else {
        %>
            <div class="alert alert-danger">Invalid user ID.</div>
        <%
            }
        %>
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
