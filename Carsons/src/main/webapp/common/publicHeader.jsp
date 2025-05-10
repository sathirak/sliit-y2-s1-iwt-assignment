<nav class="navbar navbar-expand-lg navbar-dark bg-black py-3">
    <div class="container">
        <!-- Brand visible on all screen sizes -->
        <a class="navbar-brand fw-bold" href="<%= request.getContextPath() %>/home">
            <span class="text-primary">Car</span>sons Rentals
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navMenu">
            <ul class="navbar-nav gap-2">
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium" href="<%= request.getContextPath() %>/vehicle/all">Our Vehicles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium" href="<%= request.getContextPath() %>/about-us">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium" href="<%= request.getContextPath() %>/faq">FAQs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium" href="<%= request.getContextPath() %>/contact-us">Contact Us</a>
                </li>
                <li class="nav-item ms-lg-2">
                    <a class="nav-link btn btn-primary text-white px-4" href="<%= request.getContextPath() %>/reservation">Admin</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    .navbar .nav-link {
        position: relative;
        transition: all 0.3s ease;
    }
    
    .navbar .nav-link:not(.btn):hover {
        color: #fff;
    }
    
    .navbar .nav-link:not(.btn)::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--bs-primary);
        transition: width 0.3s ease;
    }
    
    .navbar .nav-link:not(.btn):hover::after {
        width: 100%;
    }
</style>
