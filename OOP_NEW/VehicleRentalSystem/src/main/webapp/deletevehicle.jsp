<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vehicle.VehicleDBUtil" %>
<%@ page import="vehicle.Vehicle" %>
<%@ page import="java.util.*" %>

<%
    String vehicleId = request.getParameter("vehicle_id");
    List<Vehicle> vehDetails = VehicleDBUtil.getVehicleDetails(vehicleId);
    request.setAttribute("vehDetails", vehDetails);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #6e1818;
            font-family: 'Times New Roman', Times, serif;
        }

        .container {
            margin-top: 80px;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            max-width: 700px;
        }

        h2 {
            color: #b30000;
            text-align: center;
            margin-bottom: 30px;
        }

        .info-box {
            background-color: #f8d7da;
            padding: 20px;
            border-left: 5px solid #dc3545;
            margin-bottom: 20px;
        }

        .info-box p {
            margin: 5px 0;
        }

        .btn-danger {
            background-color: #cc0000;
            border: none;
        }

        .btn-danger:hover {
            background-color: #990000;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #565e64;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Confirm Delete Vehicle</h2>

    <c:forEach var="v" items="${vehDetails}">
        <div class="info-box">
            <p><strong>ID:</strong> <c:out value="${v.vehicle_id}" /></p>
            <p><strong>Category:</strong> <c:out value="${v.category}" /></p>
            <p><strong>Model:</strong> <c:out value="${v.model}" /></p>
            <p><strong>Brand:</strong> <c:out value="${v.brand}" /></p>
            <p><strong>Gear:</strong> <c:out value="${v.gear}" /></p>
            <p><strong>Color:</strong> <c:out value="${v.color}" /></p>
            <p><strong>Seats:</strong> <c:out value="${v.seat_no}" /></p>
            <p><strong>Fuel:</strong> <c:out value="${v.fuel_option}" /></p>
            <p><strong>Plate No:</strong> <c:out value="${v.plate_no}" /></p>
            <p><strong>Daily Rate (Rs):</strong> <c:out value="${v.daily_rate}" /></p>
        </div>

        <form action="delete" method="post">
            <input type="hidden" name="vehicle_id" value="${v.vehicle_id}" />
            <div class="btn-group">
                <button type="submit" class="btn btn-danger">Delete Vehicle</button>
                <!-- <a href="vehiclelist.jsp" class="btn btn-secondary">Return to Vehicle List</a> -->
            </div>
        </form>
    </c:forEach>
</div>

</body>
</html>
