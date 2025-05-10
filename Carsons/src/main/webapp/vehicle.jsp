<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="common/header.jsp" %>

<div class="container mt-4">
    <h2 class="mb-4">Vehicle Details</h2>
    
    <div class="card shadow-sm">
        <div class="card-body">
            <dl class="row">
                <dt class="col-sm-4">Vehicle ID</dt>
                <dd class="col-sm-8">${vehDetails.vehicle_id}</dd>

                <dt class="col-sm-4">Category</dt>
                <dd class="col-sm-8">${vehDetails.category}</dd>

                <dt class="col-sm-4">Brand</dt>
                <dd class="col-sm-8">${vehDetails.brand}</dd>

                <dt class="col-sm-4">Model</dt>
                <dd class="col-sm-8">${vehDetails.model}</dd>

                <dt class="col-sm-4">Gear Type</dt>
                <dd class="col-sm-8">${vehDetails.gear}</dd>

                <dt class="col-sm-4">Color</dt>
                <dd class="col-sm-8">${vehDetails.color}</dd>

                <dt class="col-sm-4">Number of Seats</dt>
                <dd class="col-sm-8">${vehDetails.seat_no}</dd>

                <dt class="col-sm-4">Fuel Type</dt>
                <dd class="col-sm-8">${vehDetails.fuel_option}</dd>

                <dt class="col-sm-4">Plate Number</dt>
                <dd class="col-sm-8">${vehDetails.plate_no}</dd>

                <dt class="col-sm-4">Daily Rate</dt>
                <dd class="col-sm-8">Rs. ${vehDetails.daily_rate}</dd>
            </dl>

            <div class="mt-4">
                <form action="<%= request.getContextPath() %>/vehicle/update" method="get" class="d-inline">
                    <input type="hidden" name="id" value="${vehDetails.vehicle_id}">
                    <button type="submit" class="btn btn-warning text-white">Update</button>
                </form>

                <form action="<%= request.getContextPath() %>/vehicle/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this vehicle?');">
                    <input type="hidden" name="vehicle_id" value="${vehDetails.vehicle_id}" />
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>

                <a href="<%= request.getContextPath() %>/vehicle" class="btn btn-secondary ms-2">Back to List</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
