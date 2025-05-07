<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f7f9fc;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.form-container {
	margin-top: 50px;
	padding: 30px;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

.form-title {
	text-align: center;
	margin-bottom: 30px;
	font-weight: 600;
}

.btn-primary {
	width: 100%;
}
</style>
</head>
<body>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script>
        alert("<%=errorMessage%>
		");
	</script>
	<%
	}
	%>


	<div class="container">
		<div class="col-md-8 offset-md-2 form-container">
			<h2 class="form-title">Add New Vehicle</h2>
			<form action="insert" method="post">

				<div class="mb-3">
					<label for="category" class="form-label">Category</label> <input
						type="text" class="form-control" name="category" required>
				</div>

				<div class="mb-3">
					<label for="model" class="form-label">Model</label> <input
						type="text" class="form-control" name="model" required>
				</div>

				<div class="mb-3">
					<label for="brand" class="form-label">Brand</label> <input
						type="text" class="form-control" name="brand" required>
				</div>

				<div class="mb-3">
					<label for="gear" class="form-label">Gear Type</label> <select
						class="form-select" name="gear" required>
						<option value="">Select</option>
						<option value="Manual">Manual</option>
						<option value="Automatic">Automatic</option>
					</select>
				</div>

				<div class="mb-3">
					<label for="color" class="form-label">Color</label> <input
						type="text" class="form-control" name="color" required>
				</div>

				<div class="mb-3">
					<label for="seat_no" class="form-label">Seat Count</label> <input
						type="number" class="form-control" name="seat_no" min="1" required>
				</div>

				<div class="mb-3">
					<label for="fuel_option" class="form-label">Fuel Option</label> <select
						class="form-select" name="fuel_option" required>
						<option value="">Select</option>
						<option value="Petrol">Petrol</option>
						<option value="Diesel">Diesel</option>
						<option value="Electric">Electric</option>
						<option value="Petrol/ Hybrid">Petrol/ Hybrid</option>
					</select>
				</div>

				<div class="mb-3">
					<label for="plate_no" class="form-label">Plate Number</label> <input
						type="text" class="form-control" name="plate_no"
						pattern="^[A-Z]{2,3}[-\s][0-9]{4}$"
						title="Format: 2 or 3 capital letters, space or dash, then 4 digits. E.g., AB-1234 or ABC 5678"
						required>
				</div>

				<div class="mb-3">
					<label for="daily_rate" class="form-label">Daily Rate (Rs)</label>
					<input type="number" step="0.01" class="form-control"
						name="daily_rate" min="0" required>
				</div>

				<button type="submit" class="btn btn-primary">Add Vehicle</button>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

