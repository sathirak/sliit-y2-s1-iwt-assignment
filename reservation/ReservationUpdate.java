package com.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReservationUpdate")
public class ReservationUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reservationId = request.getParameter("reservationId");
        String noOfDays = request.getParameter("noOfDays");
        String cancellationDetails = request.getParameter("cancellationDetails");
        String pickupDate = request.getParameter("pickupDate");
        String returnDate = request.getParameter("returnDate");
        
        boolean isUpdated = ReservationDBUtil.updateReservation(reservationId, noOfDays, cancellationDetails, pickupDate, returnDate);
        
        if (isUpdated) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("unsuccess.jsp");
        }
	}

}
