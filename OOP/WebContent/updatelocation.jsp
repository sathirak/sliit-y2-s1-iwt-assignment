<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Location</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #d32f2f;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .header p {
            margin: 5px 0;
            font-size: 14px;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #d32f2f;
        }
        .promo-section {
            background-color: #ffeb3b;
            padding: 10px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .promo-section input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .promo-section button {
            background-color: #4caf50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .promo-section button:hover {
            background-color: #45a049;
        }
        .submit-btn {
            background-color: #d32f2f;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>CARS</h1>
        <p>Since 2025</p>
        <p>info@cars.com</p>
    </div>

    <div class="container">
        <h2>Update Location</h2>
        <form action="location/update" method="post">
            <div class="form-group">
                <label for="location_id">Location ID</label>
                <input type="text" id="location_id" name="location_id" required>
            </div>

            <div class="form-group">
                <label for="district">District</label>
                <input type="text" id="district" name="district" required>
            </div>

            <div class="form-group">
                <label for="location_contact_no">Contact Number</label>
                <input type="text" id="location_contact_no" name="location_contact_no" required>
            </div>

            <div class="form-group">
                <label for="street_no">Street Number</label>
                <input type="text" id="street_no" name="street_no" required>
            </div>

            <div class="form-group">
                <label for="street">Street</label>
                <input type="text" id="street" name="street" required>
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" required>
            </div>
            <button type="submit" class="submit-btn">Update Location</button>
        </form>
    </div>
</body>
</html>