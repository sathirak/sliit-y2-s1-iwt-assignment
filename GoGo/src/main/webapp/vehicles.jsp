<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle List</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f7f8fa;
            font-family: 'Times New Roman', Times, serif;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .table-container {
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

        .table {
            border: 2px solid #8B0000;
        }

        .table thead {
            background-color: #b30000;
            color: white;
        }

        .table tbody tr {
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .table tbody tr:hover {
            background-color: #ffe6e6;
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

        .alert-success, .alert-danger {
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .btn-group {
            display: flex;
            gap: 5px;
            justify-content: center;
        }

        .table td, .table th {
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="common/header.jsp" %>

<div class="container table-container">
    <h2 class="text-center mb-4">Available Vehicles</h2>

    <c:if test="${not empty successMsg}">
        <div class="alert alert-success text-center">${successMsg}</div>
    </c:if>
    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger text-center">${errorMsg}</div>
    </c:if>

    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Model</th>
                <th>Brand</th>
                <th>Gear</th>
                <th>Color</th>
                <th>Seats</th>
                <th>Fuel</th>
                <th>Plate No</th>
                <th>Rate (Rs)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="veh" items="${vehicles}">
                <tr>
                    <td>${veh.vehicle_id}</td>
                    <td>${veh.category}</td>
                    <td>${veh.model}</td>
                    <td>${veh.brand}</td>
                    <td>${veh.gear}</td>
                    <td>${veh.color}</td>
                    <td>${veh.seat_no}</td>
                    <td>${veh.fuel_option}</td>
                    <td>${veh.plate_no}</td>
                    <td>${veh.daily_rate}</td>
                    <td>
                        <div class="btn-group">
                            <a href="vehicle/update?id=${veh.vehicle_id}" class="btn btn-warning btn-sm">Update</a>
                            
                            <form action="vehicle/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this vehicle?');">
                                <input type="hidden" name="vehicle_id" value="${veh.vehicle_id}" />
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
