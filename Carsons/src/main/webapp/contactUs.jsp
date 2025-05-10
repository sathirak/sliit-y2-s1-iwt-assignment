<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Carsones Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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
            background: #dc3545;
        }
        
        .contact-header {
            background-color: #212529;
            color: white;
            padding: 4rem 1rem;
            text-align: center;
        }
        
        .contact-icon {
            width: 80px;
            height: 80px;
            background-color: #dc3545;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 1.5rem;
            transition: all 0.3s ease;
        }
        
        .contact-card:hover .contact-icon {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .contact-card {
            transition: all 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
            height: 100%;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .social-links a {
            width: 40px;
            height: 40px;
            background: #dc3545;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin: 0 10px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            transform: translateY(-3px);
            background: #c82333;
        }
        
        .btn-submit {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            transition: all 0.3s ease;
        }
        
        .btn-submit:hover {
            background-color: #c82333;
            border-color: #bd2130;
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="common/publicHeader.jsp" %>

    <div class="contact-header">
        <div class="container">
            <h1 class="display-4">Contact Us</h1>
            <p class="lead">We're here to help and answer any question you might have</p>
        </div>
    </div>

    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card h-100 contact-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="contact-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h4>Our Location</h4>
                        <p>123 Main Street, Colombo, Sri Lanka</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 contact-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="contact-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <h4>Call Us</h4>
                        <p>+94 77 89 89 899</p>
                        <p>+94 11 2 123 456</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 contact-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h4>Email Us</h4>
                        <p>carsones@gmail.com</p>
                        <p>support@carsones.com</p>
                    </div>
                </div>
            </div>
        </div>
        
        <h2 class="section-heading">Send Us a Message</h2>
        
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <form class="row g-3 needs-validation" novalidate>
                            <div class="col-md-6">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" required>
                                <div class="invalid-feedback">Please provide your name.</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" required>
                                <div class="invalid-feedback">Please provide a valid email.</div>
                            </div>
                            
                            <div class="col-12">
                                <label class="form-label">Subject</label>
                                <input type="text" class="form-control" required>
                                <div class="invalid-feedback">Please provide a subject.</div>
                            </div>
                            
                            <div class="col-12">
                                <label class="form-label">Message</label>
                                <textarea class="form-control" rows="5" required></textarea>
                                <div class="invalid-feedback">Please provide a message.</div>
                            </div>
                            
                            <div class="col-12">
                                <button type="submit" class="btn btn-submit btn-lg">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row mt-5">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <h5 class="text-center mb-4">Business Hours</h5>
                        <div class="row text-center">
                            <div class="col-md-4">
                                <p><strong>Monday - Friday:</strong><br> 8:00 AM - 8:00 PM</p>
                            </div>
                            <div class="col-md-4">
                                <p><strong>Saturday:</strong><br> 9:00 AM - 5:00 PM</p>
                            </div>
                            <div class="col-md-4">
                                <p><strong>Sunday:</strong><br> 10:00 AM - 4:00 PM</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="common/publicFooter.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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