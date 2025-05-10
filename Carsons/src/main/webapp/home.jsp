<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Carsons Premium Car Rental | Drive in Style</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

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

<%@ include file="common/publicHeader.jsp" %>

<!-- Hero Section -->
<div class="hero">
    <div class="hero-overlay">
        <div class="hero-content">
            <h1 class="display-5 fw-bold">FIND THE RIGHT VEHICLE FOR YOU</h1>
            <p class="lead">We have more than a thousand vehicles for you to choose from.</p>
            <div class="mt-4">
                <a href="vehicle/all" class="btn btn-danger btn-lg px-4">Explore Vehicles <i class="fa fa-arrow-right ms-2"></i></a>              
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

<!-- Include common footer -->
<%@ include file="common/publicFooter.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
