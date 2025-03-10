package com.location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteLocation")
public class DeleteLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locId = Integer.parseInt(request.getParameter("locId"));
        boolean isDeleted = LocationDBUtil.deleteLocation(locId);

        if (isDeleted) {
        	
            response.sendRedirect("location.jsp");
            
        } else {
        	
            response.sendRedirect("deletelocation.jsp?locId=" + locId + "&error=true");
        }
    }
}