<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Details</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #6e1818;
            font-family: 'Times New Roman', Times, serif;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .vehicle-container {
            margin-top: 100px;
            background: #ffffff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            color: #b30000;
            font-weight: bold;
        }

        .card {
            border: 2px solid #8B0000;
            border-radius: 15px;
            overflow: hidden;
        }

        .card-header {
            background-color: #b30000;
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .detail-row {
            padding: 10px;
            border-bottom: 1px solid #eeeeee;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: bold;
            color: #333;
        }

        .detail-value {
            color: #666;
        }

        .btn-warning {
            background-color: #ffcc00;
            border: none;
        }

        .btn-danger {
            background-color: #cc0000;
            border: none;
        }

        .btn-warning:hover {
            background-color: #e6b800;
        }

        .btn-danger:hover {
            background-color: #990000;
        }

        .btn-actions {
            margin-top: 20px;
        }

        .back-link {
            margin-top: 20px;
            display: block;
            color: white;
            text-decoration: none;
        }

        .back-link:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-warning me-2" href="vehicle/insert">Add Vehicle</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-info me-2" href="vehicle">All Vehicles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-light" href="#">Admin Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container vehicle-container">
    <h2 class="text-center mb-4">Vehicle Details</h2>

    <div class="card mx-auto" style="max-width: 800px;">
        <div class="card-header text-center">
            ${vehDetails.brand} ${vehDetails.model} - ${vehDetails.plate_no}
        </div>
        <div class="card-body">
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Vehicle ID:</div>
                <div class="col-md-8 detail-value">${vehDetails.vehicle_id}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Category:</div>
                <div class="col-md-8 detail-value">${vehDetails.category}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Brand:</div>
                <div class="col-md-8 detail-value">${vehDetails.brand}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Model:</div>
                <div class="col-md-8 detail-value">${vehDetails.model}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Gear Type:</div>
                <div class="col-md-8 detail-value">${vehDetails.gear}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Color:</div>
                <div class="col-md-8 detail-value">${vehDetails.color}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Number of Seats:</div>
                <div class="col-md-8 detail-value">${vehDetails.seat_no}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Fuel Type:</div>
                <div class="col-md-8 detail-value">${vehDetails.fuel_option}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Plate Number:</div>
                <div class="col-md-8 detail-value">${vehDetails.plate_no}</div>
            </div>
            <div class="row detail-row">
                <div class="col-md-4 detail-label">Daily Rate:</div>
                <div class="col-md-8 detail-value">Rs. ${vehDetails.daily_rate}</div>
            </div>
        </div>
    </div>

    <div class="text-center btn-actions">
        <a href="vehicle/update?id=${vehDetails.vehicle_id}" class="btn btn-warning">Update Vehicle</a>
        
        <form action="vehicle/delete" method="post" style="display: inline-block; margin-left: 10px;" 
              onsubmit="return confirm('Are you sure you want to delete this vehicle?');">
            <input type="hidden" name="vehicle_id" value="${vehDetails.vehicle_id}" />
            <button type="submit" class="btn btn-danger">Delete Vehicle</button>
        </form>
    </div>

    <div class="text-center">
        <a href="vehicle" class="back-link">← Back to All Vehicles</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
