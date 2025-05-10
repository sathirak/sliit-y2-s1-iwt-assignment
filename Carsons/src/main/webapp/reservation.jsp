<%@ page import="reservation.ReservationModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details | Reservation Management | Carsons Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="common/header.jsp" %>

<div class="container mt-4">
    <h2 class="mb-4">Reservation Details</h2>

    <%
        ReservationModel res = (ReservationModel) request.getAttribute("reservation");
        if (res != null) {
    %>

    <div class="card shadow-sm">
        <div class="card-body">
            <dl class="row">
                <dt class="col-sm-4">Reservation ID</dt>
                <dd class="col-sm-8"><%= res.getReservationId() %></dd>

                <dt class="col-sm-4">User</dt>
                <dd class="col-sm-8"><%= res.getUserName() %></dd>

                <dt class="col-sm-4">Vehicle</dt>
                <dd class="col-sm-8"><%= res.getVehicleName() %></dd>

                <dt class="col-sm-4">Location</dt>
                <dd class="col-sm-8"><%= res.getLocationName() %></dd>

                <dt class="col-sm-4">Pickup Date</dt>
                <dd class="col-sm-8"><%= res.getPickupDate() %></dd>

                <dt class="col-sm-4">Return Date</dt>
                <dd class="col-sm-8"><%= res.getReturnDate() %></dd>

                <dt class="col-sm-4">Amount</dt>
                <dd class="col-sm-8">$<%= res.getAmount() %></dd>

                <dt class="col-sm-4">Days</dt>
                <dd class="col-sm-8"><%= res.getNoOfDates() %></dd>

                <dt class="col-sm-4">Pickup Location</dt>
                <dd class="col-sm-8"><%= res.getPickupLocation() %></dd>

                <dt class="col-sm-4">Return Location</dt>
                <dd class="col-sm-8"><%= res.getReturnLocation() != null ? res.getReturnLocation() : "N/A" %></dd>
            </dl>

            <div class="mt-4">
                <form action="<%= request.getContextPath() %>/reservation/update" method="get" class="d-inline">
                    <input type="hidden" name="id" value="<%= res.getReservationId() %>" />
                    <button type="submit" class="btn btn-warning text-white">Update</button>
                </form>

                <form action="<%= request.getContextPath() %>/reservation/delete" method="post" class="d-inline" onsubmit="return confirm('Delete this reservation?');">
                    <input type="hidden" name="id" value="<%= res.getReservationId() %>" />
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>

                <a href="<%= request.getContextPath() %>/reservation" class="btn btn-secondary ms-2">Back to List</a>
            </div>
        </div>
    </div>

    <% } else { %>
        <div class="alert alert-danger">Reservation not found.</div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
