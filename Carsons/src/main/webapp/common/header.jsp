<%
    // We'll handle authentication client-side with JavaScript now
%>
<!--- Authentication Modal --->
<div class="modal fade" id="authModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="authModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="authModalLabel">Authentication Required</h5>
            </div>
            <div class="modal-body">
                <form id="authForm">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" required>
                    </div>
                    <div id="authError" class="alert alert-danger d-none">
                        Invalid username or password
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="<%= request.getContextPath() %>/home">
            <span class="text-primary">Car</span>sons Rentals
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
                <a href="javascript:void(0)" onclick="logoutUser()" class="btn btn-outline-light btn-sm">Logout</a>
            </div>
        </div>
    </div>
</nav>

<!-- Script to handle authentication -->
<script>
    // Check authentication on page load
    document.addEventListener("DOMContentLoaded", function() {
        checkAuthentication();
    });

    function checkAuthentication() {
        const username = localStorage.getItem('carsons_username');
        const password = localStorage.getItem('carsons_password');
        
        if (!username || !password || username !== 'admin' || password !== 'abc123') {
            showAuthModal();
            return false;
        }
        return true;
    }

    function showAuthModal() {
        const authModal = new bootstrap.Modal(document.getElementById('authModal'));
        authModal.show();
        
        document.getElementById('authForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            if (username === 'admin' && password === 'abc123') {
                localStorage.setItem('carsons_username', username);
                localStorage.setItem('carsons_password', password);
                
                authModal.hide();
                
                window.location.reload();
            } else {
                document.getElementById('authError').classList.remove('d-none');
            }
        });
    }

    function logoutUser() {
        localStorage.removeItem('carsons_username');
        localStorage.removeItem('carsons_password');
        
        window.location.href = '<%= request.getContextPath() %>/home';
    }
</script>
