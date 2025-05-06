<%@ page import="java.util.*, reservation.ReservationModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Reservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"> All Reservations</h2>

    <!-- Add Button -->
    <a href="<%= request.getContextPath() %>/reservation/insert" class="btn btn-primary mb-3">
         Add Reservation
    </a>

    <%
        List<ReservationModel> reservations = (List<ReservationModel>) request.getAttribute("reservations");
        if (reservations != null && !reservations.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Vehicle ID</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (ReservationModel res : reservations) { %>
                <tr>
                    <td><%= res.getReservationId() %></td>
                    <td><%= res.getUserId() %></td>
                    <td><%= res.getVehicleId() %></td>
                    <td><%= res.getPickupDate() %></td>
                    <td><%= res.getReturnDate() %></td>
                    <td>$<%= res.getAmount() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/reservation?id=<%= res.getReservationId() %>" class="btn btn-sm btn-info text-white">View</a>
                        <a href="<%= request.getContextPath() %>/reservation/update?id=<%= res.getReservationId() %>" class="btn btn-sm btn-warning text-white">Edit</a>
                        <form action="<%= request.getContextPath() %>/reservation/delete" method="post" class="d-inline" onsubmit="return confirm('Delete this reservation?');">
                            <input type="hidden" name="id" value="<%= res.getReservationId() %>" />
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
        <div class="alert alert-warning">No reservations found.</div>
    <% } %>
</div>

</body>
</html>