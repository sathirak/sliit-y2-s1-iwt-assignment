<%@ page import="java.util.*, reservation.ReservationModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Reservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%@ include file="common/header.jsp" %>

<%
    String successMessage = (String) session.getAttribute("success");
    String errorMessage = (String) session.getAttribute("error");
    if (successMessage != null) session.removeAttribute("success");
    if (errorMessage != null) session.removeAttribute("error");
%>

<!-- Toast Container -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 9999">
    <% if (successMessage != null) { %>
        <div class="toast align-items-center text-bg-success border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body"><%= successMessage %></div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    <% } %>
    <% if (errorMessage != null) { %>
        <div class="toast align-items-center text-bg-danger border-0 show" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body"><%= errorMessage %></div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    <% } %>
</div>

<div class="container mt-5">
    <h2 class="mb-4">All Reservations</h2>

    <div class="row mb-3">
        <div class="col-md-6">
            <!-- Add Button -->
            <a href="<%= request.getContextPath() %>/reservation/insert" class="btn btn-primary">Add Reservation</a>
        </div>
        <div class="col-md-6">
            <!-- Client-side Search -->
            <div class="input-group">
                <input type="text" id="searchInput" class="form-control" placeholder="Search reservations...">
                <button class="btn btn-outline-secondary" type="button" onclick="clearSearch()">Clear</button>
            </div>
        </div>
    </div>

    <%
        List<ReservationModel> reservations = (List<ReservationModel>) request.getAttribute("reservations");
        if (reservations != null && !reservations.isEmpty()) {
    %>

    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Vehicle</th>
                    <th>Location</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (ReservationModel res : reservations) { %>
                <tr class="clickable-row" data-href="<%= request.getContextPath() %>/reservation?id=<%= res.getReservationId() %>">
                    <td><%= res.getReservationId() %></td>
                    <td><%= res.getUserName() != null ? res.getUserName() : "N/A" %></td>
                    <td><%= res.getVehicleName() != null ? res.getVehicleName() : "N/A" %></td>
                    <td><%= res.getLocationName() != null ? res.getLocationName() : "N/A" %></td>
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

    <!-- Pagination -->
    <%
        Integer currentPage = (Integer) request.getAttribute("currentPage");
        Integer totalPages = (Integer) request.getAttribute("totalPages");

        if (currentPage != null && totalPages != null && totalPages > 1) {
    %>
    <nav>
        <ul class="pagination justify-content-center mt-4">
            <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                <a class="page-link" href="?page=<%= currentPage - 1 %>">Previous</a>
            </li>

            <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= i == currentPage ? "active" : "" %>">
                    <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                </li>
            <% } %>

            <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                <a class="page-link" href="?page=<%= currentPage + 1 %>">Next</a>
            </li>
        </ul>
    </nav>
    <% } %>

    <% } else { %>
        <div class="alert alert-warning">No reservations found.</div>
    <% } %>
</div>

<!-- Bootstrap JS and Toast Activation -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.toast').forEach(function (toastEl) {
        new bootstrap.Toast(toastEl, { delay: 3000 }).show();
    });
    
    // Add row click handling
    document.addEventListener('DOMContentLoaded', function() {
        const rows = document.querySelectorAll('.clickable-row');
        rows.forEach(row => {
            row.addEventListener('click', function(event) {
                // Prevent click if the click was on a button, link or form
                if (event.target.tagName === 'A' || event.target.tagName === 'BUTTON' || 
                    event.target.tagName === 'INPUT' || event.target.closest('form')) {
                    return;
                }
                window.location = this.dataset.href;
            });
            row.style.cursor = 'pointer';
        });
        
        // Add search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            let searchText = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('.table tbody tr');
            
            tableRows.forEach(row => {
                let rowText = row.textContent.toLowerCase();
                if (rowText.includes(searchText)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });
    
    // Function to clear search
    function clearSearch() {
        document.getElementById('searchInput').value = '';
        const tableRows = document.querySelectorAll('.table tbody tr');
        tableRows.forEach(row => {
            row.style.display = '';
        });
    }
</script>

</body>
</html>
