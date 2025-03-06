package com.reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReservationDelete")
public class ReservationDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
int reservationId = Integer.parseInt(request.getParameter("reservationId"));
        
        boolean isDeleted = ReservationDBUtil.deleteReservation(reservationId);
        
        if (isDeleted) {
            response.sendRedirect("success.jsp"); 
        } else {
            response.sendRedirect("error.jsp"); 
        }
	}

}
