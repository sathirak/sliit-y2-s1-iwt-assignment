<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container form-container">
        <h2 class="mb-4 text-center">Update Vehicle</h2>
        <form action="update" method="post">

            <input type="hidden" name="vehicle_id" value="${param.vehicle_id}">

            <div class="mb-3">
                <label class="form-label">Category</label>
                <input type="text" class="form-control" name="category" value="${param.category}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Model</label>
                <input type="text" class="form-control" name="model" value="${param.model}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Brand</label>
                <input type="text" class="form-control" name="brand" value="${param.brand}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Gear</label>
                <select class="form-select" name="gear" required>
                    <option value="Automatic" ${param.gear == 'Automatic' ? 'selected' : ''}>Automatic</option>
                    <option value="Manual" ${param.gear == 'Manual' ? 'selected' : ''}>Manual</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Color</label>
                <input type="text" class="form-control" name="color" value="${param.color}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Number of Seats</label>
                <input type="number" class="form-control" name="seat_no" value="${param.seat_no}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Fuel Option</label>
                <select class="form-select" name="fuel_option" required>
                
                    <option value="Petrol" ${param.fuel_option == 'Petrol' ? 'selected' : ''}>Petrol</option>
                    <option value="Diesel" ${param.fuel_option == 'Diesel' ? 'selected' : ''}>Diesel</option>
                    <option value="Electric" ${param.fuel_option == 'Electric' ? 'selected' : ''}>Electric</option>
                    <option value="Petrol/ Hybrid" ${param.fuel_option == 'Petrol/ Hybrid' ? 'selected' : ''}>Petrol/ Hybrid</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Plate Number</label>
                <input type="text" class="form-control" name="plate_no" value="${param.plate_no}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Daily Rate</label>
                <input type="number" step="0.01" class="form-control" name="daily_rate" value="${param.daily_rate}" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Update Vehicle</button>
            </div>
        </form>
    </div>
</body>
</html>
