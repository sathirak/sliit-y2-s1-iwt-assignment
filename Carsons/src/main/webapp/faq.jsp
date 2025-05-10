<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQs - Online Car Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .faq-header {
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
        
        .faq-section {
            max-width: 800px;
            margin: 2rem auto;
        }
        
        .accordion-button:not(.collapsed) {
            background-color: #dc3545;
            color: white;
        }
        
        .accordion-button {
            font-weight: bold;
        }
        
        .accordion-button:focus {
            box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="common/publicHeader.jsp" %>

    <div class="faq-header">
        <div class="container">
            <h1 class="display-4">Frequently Asked Questions</h1>
            <p class="lead">Your questions answered about our car rental services</p>
        </div>
    </div>

    <div class="container py-5">
        <h2 class="section-heading">Common Questions</h2>
        
        <div class="faq-section bg-white p-4 rounded shadow-sm">
            <div class="accordion" id="faqAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq1-heading">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                            How do I book a vehicle?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can browse available vehicles under the "Explore Vehicles" section and proceed to booking from there. The booking process is simple and straightforward - just select your dates, provide required information and confirm your reservation.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq2-heading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            What documents do I need to rent a car?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You will need a valid driver's license, national ID or passport, and a payment method. International visitors may also need to provide additional identification or an international driving permit depending on local regulations.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq3-heading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            Is there a minimum age requirement?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, renters must be at least 21 years old with a valid driver's license. For certain premium or luxury vehicles, the minimum age requirement may be 25 years. Additional fees may apply for drivers under 25 years of age.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq4-heading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                            Can I cancel or modify my reservation?
                        </button>
                    </h2>
                    <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, you can cancel or modify your reservation up to 24 hours before the pickup time. Modifications are subject to vehicle availability. Cancellations made less than 24 hours before pickup may incur a cancellation fee.
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="faq5-heading">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5">
                            What should I do in case of a breakdown or accident?
                        </button>
                    </h2>
                    <div id="faq5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Immediately contact our support hotline at +94 77 89 89 899. We provide 24/7 roadside assistance. In case of accidents, ensure you get a police report and contact our emergency support team who will guide you through the next steps.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="bg-dark text-white py-5 text-center">
        <div class="container">
            <h2>Still have questions?</h2>
            <p class="lead">Our customer service team is available to help you with any inquiries.</p>
            <a href="<%= request.getContextPath() %>/contact-us" class="btn btn-outline-light btn-lg mt-3">Contact Us</a>
        </div>
    </div>
    
    <%@ include file="common/publicFooter.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>