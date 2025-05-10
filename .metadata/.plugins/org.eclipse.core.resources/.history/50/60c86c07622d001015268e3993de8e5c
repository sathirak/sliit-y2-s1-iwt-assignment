<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/home.jsp">
            <strong>CARSONES</strong> Rental
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link <%= request.getServletPath().contains("reservation") ? "active" : "" %>" 
                       href="<%= request.getContextPath() %>/reservation">Reservations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getServletPath().contains("user") ? "active" : "" %>" 
                       href="<%= request.getContextPath() %>/user">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getServletPath().contains("vehicle") ? "active" : "" %>" 
                       href="<%= request.getContextPath() %>/vehicle">Vehicles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getServletPath().contains("location") ? "active" : "" %>" 
                       href="<%= request.getContextPath() %>/location">Locations</a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="<%= request.getContextPath() %>/logout.jsp" class="btn btn-outline-light btn-sm">Logout</a>
            </div>
        </div>
    </div>
</nav>
