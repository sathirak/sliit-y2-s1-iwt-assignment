package com.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReservationInsert")
public class ReservationInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reservationId = Integer.parseInt(request.getParameter("reservationId"));
		int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
        String cancellationDetails = request.getParameter("cancellationDetails");
        String pickupDate = request.getParameter("pickupDate");
        String returnDate = request.getParameter("returnDate");

        boolean isInserted = ReservationDBUtil.insertReservation(reservationId, noOfDays, cancellationDetails, pickupDate, returnDate);
        
        if (isInserted) {
            response.sendRedirect("success.jsp"); 
        } else {
            response.sendRedirect("unsuccess.jsp"); 
        }
		
	}

}
