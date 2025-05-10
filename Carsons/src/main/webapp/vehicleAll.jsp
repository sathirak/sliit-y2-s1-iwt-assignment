<%@ page import="java.util.List" %>
<%@ page import="vehicle.Vehicle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Vehicles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .vehicle-card {
            transition: all 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
            height: 100%;
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
            color: #dc3545;
            font-weight: bold;
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
        
        .btn-book-now {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
            transition: all 0.3s ease;
        }
        
        .btn-book-now:hover {
            background-color: #c82333;
            border-color: #bd2130;
            transform: translateY(-2px);
        }
        
        .vehicle-features {
            margin-bottom: 0.5rem;
        }
        
        .feature-icon {
            width: 20px;
            text-align: center;
            margin-right: 8px;
            color: #6c757d;
        }
    </style>
</head>
<body class="bg-light">

<%@ include file="common/publicHeader.jsp" %>

<div class="container mt-5">
    <h2 class="section-heading">Available Vehicles</h2>
    
    <div class="row g-4">
        <%
            List<Vehicle> vehicles = (List<Vehicle>)request.getAttribute("vehicles");
            if (vehicles != null && !vehicles.isEmpty()) {
                for (Vehicle v : vehicles) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card vehicle-card shadow-sm">
                <img src="../images/Rent_car.png" class="card-img-top" alt="Vehicle Image">
                <div class="card-body">
                    <h5 class="card-title fw-bold"><%= v.getBrand() %> <%= v.getModel() %></h5>
                    <div class="vehicle-features">
                        <p class="mb-2"><i class="fas fa-car feature-icon"></i> <strong>Category:</strong> <%= v.getCategory() %></p>
                        <p class="mb-2"><i class="fas fa-cog feature-icon"></i> <strong>Gear:</strong> <%= v.getGear() %></p>
                        <p class="mb-2"><i class="fas fa-palette feature-icon"></i> <strong>Color:</strong> <%= v.getColor() %></p>
                        <p class="mb-2"><i class="fas fa-users feature-icon"></i> <strong>Seats:</strong> <%= v.getSeat_no() %></p>
                        <p class="mb-2"><i class="fas fa-gas-pump feature-icon"></i> <strong>Fuel:</strong> <%= v.getFuel_option() %></p>
                        <p class="mb-2"><i class="fas fa-id-card feature-icon"></i> <strong>Plate No:</strong> <%= v.getPlate_no() %></p>
                    </div>
                    <p class="daily-rate mt-3">Rs. <%= v.getDaily_rate() %> / day</p>
                </div>
                <div class="card-footer bg-white border-0 pb-3 text-center">
                    <a href="../reservation/insert?vehicleId=<%= v.getVehicle_id() %>" class="btn btn-book-now btn-lg w-100">
                        <i class="fas fa-calendar-check me-2"></i>Book Now
                    </a>
                </div>
            </div>
        </div>
        <% 
                }
            } else {
        %>
            <div class="col-12">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i> No vehicles available at the moment.
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

<div class="bg-dark text-white py-5 text-center mt-5">
    <div class="container">
        <h2>Need Help Choosing a Vehicle?</h2>
        <p class="lead">Our team is ready to assist you with finding the perfect vehicle for your needs.</p>
        <a href="<%= request.getContextPath() %>/contact-us" class="btn btn-outline-light btn-lg mt-3">Contact Us</a>
    </div>
</div>

<%@ include file="common/publicFooter.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
