<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Car Rental</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome 6 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
        }
        .hero {
            background: url('images/33.jpg') no-repeat center center/cover;
            min-height: 100vh;
            color: white;
            display: flex;
            align-items: center;
            position: relative;
        }
        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.5);
            width: 100%;
            padding: 3rem 1rem;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .hero-content {
            max-width: 500px;
            padding: 1rem;
            text-align: right;
        }
        .nav-link {
            color: white !important;
            font-weight: bold;
        }
        .login-btn {
            background-color: #ff2d75;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="common/header.jsp" %>

<div class="bg-dark text-white py-2">
    <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <div>
            <img src="images/Rental Car Logo - Made with PosterMyWall.jpg" alt="Logo" height="35">
        </div>
        <div class="d-none d-md-flex gap-4">
            <span><i class="fa fa-envelope"></i>carsones@gmail.com</span>
            <span><i class="fa fa-phone"></i> +94 77 89 89 899</span>
        </div>
        <div class="d-flex align-items-center gap-3">
            <a href="#" class="text-white"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" class="text-white"><i class="fab fa-google-plus-g"></i></a>
            <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
            <a href="#" class="btn login-btn btn-sm">Register</a>
        </div>
    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container">
        <a class="navbar-brand d-lg-none" href="vehicle/all">Vehicle Rental</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navMenu">
            <ul class="navbar-nav gap-4">
                <li class="nav-item"><a class="nav-link" href="vehicle/all">Vehicle Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="#">FAQs</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero">
    <div class="hero-overlay">
        <div class="hero-content">
            <h1 class="display-5 fw-bold">FIND THE RIGHT VEHICLE FOR YOU</h1>
            <p class="lead">We have more than a thousand vehicles for you to choose from.</p>
            <a href="vehicle/all" class="btn btn-danger btn-lg">Explore Vehicles<i class="fa fa-arrow-right ms-1"></i></a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
