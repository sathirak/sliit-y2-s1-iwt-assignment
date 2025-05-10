<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us | Carsons Premium Car Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .about-header {
            background-color: #212529;
            color: white;
            padding: 4rem 1rem;
            text-align: center;
        }
        
        .section-heading {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
            text-align: center;
        }
        
        .section-heading:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #dc3545;
        }
        
        .about-card {
            transition: all 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .about-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .about-icon {
            font-size: 3rem;
            color: #dc3545;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="common/publicHeader.jsp" %>

    <div class="about-header">
        <div class="container">
            <h1 class="display-4">About CARSONES Rental</h1>
            <p class="lead">Your premier destination for quality vehicle rentals</p>
        </div>
    </div>

    <div class="container py-5">
        <div class="row mb-4">
            <div class="col-lg-8 mx-auto text-center">
                <p class="lead">
                    At CARSONES Rental, we specialize in high-quality self-drive vehicle rentals. From compact cars to luxury vehicles, we offer reliable transport solutions that put you in the driver's seat.
                </p>
            </div>
        </div>
        
        <h2 class="section-heading">Our Company</h2>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 about-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="about-icon">
                            <i class="fas fa-eye"></i>
                        </div>
                        <h4>Our Vision</h4>
                        <p>To redefine excellence in self-drive vehicle rentals by delivering premium quality and becoming the most trusted transport partner in the region.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 about-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="about-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Who We Are</h4>
                        <p>Founded by a passionate team, CARSONES Rental is committed to flexible, affordable self-drive vehicle solutions. We empower customers with modern systems and smooth rental processes.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 about-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="about-icon">
                            <i class="fas fa-fist-raised"></i>
                        </div>
                        <h4>Our Strength</h4>
                        <p>Our strength lies in our well-maintained fleet, expert operations team, and responsive support. We prioritize vehicle quality and customer satisfaction in everything we do.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row g-4 mt-4">
            <div class="col-md-6">
                <div class="card h-100 about-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="about-icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <h4>Our Clients</h4>
                        <p>We serve travelers, businesses, and corporate clients with short- and long-term self-drive rentals. Our trusted customer base values our professionalism and efficiency.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card h-100 about-card shadow-sm">
                    <div class="card-body text-center p-4">
                        <div class="about-icon">
                            <i class="fas fa-car"></i>
                        </div>
                        <h4>Our Fleet</h4>
                        <p>CARSONES Rental offers a diverse selection of compact cars, sedans, SUVs, and luxury vehicles. Every car is regularly maintained for safety, performance, and comfort.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="bg-dark text-white py-5 text-center">
        <div class="container">
            <h2>Ready to Experience Our Service?</h2>
            <p class="lead">Get behind the wheel of one of our quality vehicles today.</p>
            <div class="mt-4">
                <a href="<%= request.getContextPath() %>/vehicle/all" class="btn btn-danger btn-lg">Explore Our Fleet</a>
                <a href="<%= request.getContextPath() %>/contact-us" class="btn btn-outline-light btn-lg ms-2">Contact Us</a>
            </div>
        </div>
    </div>

    <%@ include file="common/publicFooter.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>