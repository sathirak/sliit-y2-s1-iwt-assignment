<footer class="bg-dark text-white py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>We are a premier car rental service dedicated to providing quality vehicles and excellent service to our customers.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="<%= request.getContextPath() %>/vehicle/all" class="text-white">Vehicles</a></li>
                    <li><a href="<%= request.getContextPath() %>/reservation" class="text-white">Reservations</a></li>
                    <li><a href="<%= request.getContextPath() %>/about-us" class="text-white">About Us</a></li>
                    <li><a href="<%= request.getContextPath() %>/faq" class="text-white">FAQs</a></li>
                    <li><a href="<%= request.getContextPath() %>/contact-us" class="text-white">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Us</h5>
                <address>
                    <i class="fas fa-map-marker-alt me-2"></i> 123 Main Street, Colombo<br>
                    <i class="fas fa-phone me-2"></i> +94 77 89 89 899<br>
                    <i class="fas fa-envelope me-2"></i> carsones@gmail.com
                </address>
                <div class="mt-3">
                    <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white me-2"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <hr class="mt-4">
        <div class="text-center">
            <p class="mb-0">&copy; 2023 GoGo Car Rental. All rights reserved.</p>
        </div>
    </div>
</footer>
