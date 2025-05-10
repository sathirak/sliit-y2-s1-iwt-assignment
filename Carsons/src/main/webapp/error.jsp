<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Occurred | Carsons Rental</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="common/header.jsp" %>

<div class="container mt-5">
    <div class="card border-danger shadow-sm">
        <div class="card-header bg-danger text-white">
            <h3 class="mb-0">Error</h3>
        </div>
        <div class="card-body text-center">
            <div class="mb-3">
                <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 3rem;"></i>
            </div>
            <h4><%= request.getAttribute("message") != null ? request.getAttribute("message") : "Oops! An unexpected error occurred." %></h4>
            <div class="mt-4">
                <button onclick="history.back()" class="btn btn-outline-secondary">Go Back</button>
                <a href="<%= request.getContextPath() %>/" class="btn btn-outline-primary ms-2">Go to Home</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
