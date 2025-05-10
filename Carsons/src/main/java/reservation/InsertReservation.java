package reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/reservation/insert")
public class InsertReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load dropdown values with names
        List<Map<String, String>> users = ReservationDBUtil.getUserOptions();
        List<Map<String, String>> vehicles = ReservationDBUtil.getVehicleOptions();
        List<Map<String, String>> locations = ReservationDBUtil.getLocationOptions();

        request.setAttribute("users", users);
        request.setAttribute("vehicles", vehicles);
        request.setAttribute("locations", locations);

        request.getRequestDispatcher("/insertReservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
            int locationId = Integer.parseInt(request.getParameter("locationId"));
            Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
            Date returnDate = Date.valueOf(request.getParameter("returnDate"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            int noOfDates = Integer.parseInt(request.getParameter("noOfDates"));
            String pickupLocation = request.getParameter("pickupLocation");
            String returnLocation = request.getParameter("returnLocation");

            ReservationModel res = new ReservationModel(0, userId, vehicleId, locationId,
                    pickupDate, returnDate, amount, noOfDates, pickupLocation, returnLocation, null);

            ReservationDBUtil.insertReservation(res);

            // ✅ Set success message
            request.getSession().setAttribute("success", "Reservation added successfully!");
            response.sendRedirect(request.getContextPath() + "/reservation");

        } catch (Exception e) {
            e.printStackTrace();

            // ❌ Set error message
            request.getSession().setAttribute("error", "Failed to add reservation: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/reservation");
        }
    }
}
