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

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
        }
        .hero {
            background: url('images/33.jpg') no-repeat center center/cover;
            min-height: 80vh;
            color: white;
            display: flex;
            align-items: center;
            position: relative;
        }
        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.6);
            width: 100%;
            padding: 3rem 1rem;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .hero-content {
            max-width: 600px;
            padding: 2rem;
            text-align: right;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
        }
        .nav-link {
            color: white !important;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .nav-link:hover {
            color: #ff6b6b !important;
        }
        .login-btn {
            background-color: #ff2d75;
            color: white;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .login-btn:hover {
            background-color: #e01b5c;
            transform: translateY(-2px);
        }
        .feature-card {
            transition: all 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .section-heading {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
            text-align: center;
        }
        .section-heading:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #ff2d75;
        }
    </style>
</head>
<body>

<div class="bg-dark text-white py-2">
    <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <div>
            <img src="images/Rental Car Logo - Made with PosterMyWall.jpg" alt="Logo" height="35">
        </div>
        <div class="d-none d-md-flex gap-4">
            <span><i class="fa fa-envelope me-2"></i>carsones@gmail.com</span>
            <span><i class="fa fa-phone me-2"></i> +94 77 89 89 899</span>
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
                <li class="nav-item"><a class="nav-link" href="reservation">Reservations</a></li>
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
            <div class="mt-4">
                <a href="vehicle/all" class="btn btn-danger btn-lg px-4">Explore Vehicles <i class="fa fa-arrow-right ms-2"></i></a>
                <a href="reservation" class="btn btn-outline-light btn-lg px-4 ms-2">My Reservations <i class="fa fa-calendar-check ms-2"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div class="container py-5">
    <h2 class="section-heading">Why Choose Our Service?</h2>
    
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <div class="mb-3">
                        <i class="fas fa-car-side text-primary" style="font-size: 3rem;"></i>
                    </div>
                    <h4 class="card-title">Wide Selection</h4>
                    <p class="card-text">Choose from our extensive fleet of vehicles to match your specific needs and preferences.</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <div class="mb-3">
                        <i class="fas fa-hand-holding-usd text-success" style="font-size: 3rem;"></i>
                    </div>
                    <h4 class="card-title">Best Rates</h4>
                    <p class="card-text">We offer competitive pricing with no hidden fees. Get the best value for your money.</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <div class="mb-3">
                        <i class="fas fa-headset text-danger" style="font-size: 3rem;"></i>
                    </div>
                    <h4 class="card-title">24/7 Support</h4>
                    <p class="card-text">Our customer service team is available around the clock to assist with any questions or issues.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Call to Action -->
<div class="bg-dark text-white py-5 text-center">
    <div class="container">
        <h2>Ready to book your next vehicle?</h2>
        <p class="lead">Join thousands of satisfied customers who trust us for their transportation needs.</p>
        <a href="reservation/insert" class="btn btn-danger btn-lg mt-3">Make a Reservation Now</a>
    </div>
</div>

<!-- Footer -->
<footer class="bg-black text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>We are a premier car rental service dedicated to providing quality vehicles and excellent service to our customers.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="vehicle/all" class="text-white">Vehicles</a></li>
                    <li><a href="reservation" class="text-white">Reservations</a></li>
                    <li><a href="#" class="text-white">Terms & Conditions</a></li>
                    <li><a href="#" class="text-white">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <address>
                    <i class="fas fa-map-marker-alt me-2"></i> 123 Main Street, Colombo<br>
                    <i class="fas fa-phone me-2"></i> +94 77 89 89 899<br>
                    <i class="fas fa-envelope me-2"></i> carsones@gmail.com
                </address>
            </div>
        </div>
        <hr class="mt-4">
        <div class="text-center">
            <p class="mb-0">&copy; 2023 GoGo Car Rental. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
