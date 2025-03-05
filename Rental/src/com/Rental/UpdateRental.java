package com.Rental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateRental extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        int rentalId = Integer.parseInt(request.getParameter("rentalId"));
        String paymentMethod = request.getParameter("paymentMethod");
        double downPayment = Double.parseDouble(request.getParameter("downPayment"));
        double totalPayment = Double.parseDouble(request.getParameter("totalPayment"));
        double refund = Double.parseDouble(request.getParameter("refund"));
        String paidDate = request.getParameter("paidDate");

        Rental rental = new Rental(rentalId, paymentMethod, downPayment, totalPayment, refund, paidDate);
        boolean isUpdated = RentalDBUtill.updateRental(rental);

        if (isUpdated) {
        	
            response.sendRedirect("rental.jsp");
            
        } else {
        	
            response.sendRedirect("updaterental.jsp");
        }
    }
}