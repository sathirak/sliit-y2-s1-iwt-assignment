package com.location;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocationInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String locationId = request.getParameter("location_id");
        String district = request.getParameter("district");
        String locationContactNo = request.getParameter("location_contact_no");
        String streetNo = request.getParameter("street_no");
        String street = request.getParameter("street");
        String city = request.getParameter("city");

        // Validate inputs
        if (locationId == null || district == null || locationContactNo == null ||
            streetNo == null || street == null || city == null ||
            locationId.trim().isEmpty() || district.trim().isEmpty() ||
            locationContactNo.trim().isEmpty() || streetNo.trim().isEmpty() ||
            street.trim().isEmpty() || city.trim().isEmpty()) {
            
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
            return;
        }

        boolean isTrue;
        // Pass locationId to the method (assuming LocationDBUtil is updated)
        isTrue = LocationDBUtil.insertLocation(district, locationContactNo, streetNo, street, city);

        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}