<%@ page import="java.util.List" %>
<%@ page import="vehicle.Vehicle" %>
<%@ page import="vehicle.VehicleDBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Vehicles</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f7f8fa;
        }

        .navbar {
            background-color: #800e06;
            height: 80px;
            border-bottom: 2px solid black;
        }

        .navbar-brand {
            font-size: 26px;
            font-weight: bold;
            color: white;
            transition: color 0.3s;
        }

        .navbar-brand:hover {
            color: red;
        }

        .navbar-brand small {
            font-size: 16px;
            text-transform: none;
        }

        .nav-link {
            font-size: 18px;
            color: white !important;
            margin-right: 15px;
        }

        .vehicle-card {
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .daily-rate {
            font-size: 20px;
            color: #f06156;
        }

        .btn-primary {
            background-color: #800e06;
            border-color: #800e06;
        }

        .btn-primary:hover {
            background-color: #a8120b;
            border-color: #a8120b;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">
        CARSONES <small>Rent A Car</small>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="locations.jsp">Our Locations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contactus.jsp">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Log Out</a>
            </li>
        </ul>
    </div>
</nav>


<div class="container mt-5">
    <h2 class="text-center mb-4" style="color: black;">Available Vehicles</h2>
    <div class="row">
        <%
            List<Vehicle> vehicles = VehicleDBUtil.getAllVehicles();
            for (Vehicle v : vehicles) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card vehicle-card">
                <img src="images/Rent_car.png" class="card-img-top" alt="Vehicle Image">
                <div class="card-body">
                    <h5 class="card-title"><%= v.getBrand() %> <%= v.getModel() %></h5>
                    <p class="card-text">
                        <strong>Category:</strong> <%= v.getCategory() %><br>
                        <strong>Gear:</strong> <%= v.getGear() %><br>
                        <strong>Color:</strong> <%= v.getColor() %><br>
                        <strong>Seats:</strong> <%= v.getSeat_no() %><br>
                        <strong>Fuel:</strong> <%= v.getFuel_option() %><br>
                        <strong>Plate No:</strong> <%= v.getPlate_no() %><br>
                        <strong class="daily-rate">Rate: Rs. <%= v.getDaily_rate() %> / day</strong>
                    </p>
                    <a href="insertReservation.jsp?vehicle_id=<%= v.getVehicle_id() %>" class="btn btn-primary btn-block">Book Now</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
