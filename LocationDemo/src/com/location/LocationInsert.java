package com.location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LocationInsert")
public class LocationInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locId = Integer.parseInt(request.getParameter("locId"));
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String streetNo = request.getParameter("streetNo");
        String street = request.getParameter("street");

        Location location = new Location(locId, country, state, city, phone, streetNo, street);
        boolean isInserted = LocationDBUtil.insertLocation(location);

        if (isInserted) {
            response.sendRedirect("location.jsp");
        } else {
            response.sendRedirect("locationinsert.jsp?error=true");
        }
    }
}