<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Carsones Rental</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('path/to/background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .navbar {
            background: rgba(0, 0, 0, 0.8);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
        }
        .navbar .logo {
            height: 40px;
        }
        .navbar .right {
            display: flex;
            align-items: center;
        }
        .navbar .contact-info a {
            color: #fff;
            margin: 0 10px;
        }
        .navbar .social a {
            color: #fff;
            margin: 0 5px;
        }
        .navbar .register {
            background: #ff4081;
            padding: 5px 15px;
            border-radius: 5px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 5px;
        }
        h2 {
            text-align: center;
            color: #fff;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #ddd;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            background: rgba(255, 255, 255, 0.1);
            color: #fffff;
        }
        button {
            background-color: #ff4081;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #e91e63;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <img src="path/to/logo.png" alt="Carsones Rental Logo" class="logo">
            <a href="#">Vehicle Dashboard</a>
            <a href="#">About Us</a>
            <a href="#">FAQs</a>
            <a href="#">Contact Us</a>
        </div>
        <div class="right">
            <div class="contact-info">
                <a href="mailto:carsones@gmail.com">carsones@gmail.com</a>
                <a href="tel:+94778989899">+94 77 89 89 899</a>
            </div>
            <div class="social">
                <a href="#">f</a>
                <a href="#">t</a>
                <a href="#">in</a>
                <a href="#">G+</a>
                <a href="#">©</a>
            </div>
            <a href="#" class="register">Register</a>
        </div>
    </div>
    <div class="container">
        <h2>Contact Us</h2>
        <form action="contactus" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>