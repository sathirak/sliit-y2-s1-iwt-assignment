package reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/reservation/update")
public class UpdateReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        ReservationModel res = ReservationDBUtil.getReservationById(id);

        List<Map<String, String>> users = ReservationDBUtil.getUserOptions();
        List<Map<String, String>> vehicles = ReservationDBUtil.getVehicleOptions();
        List<Map<String, String>> locations = ReservationDBUtil.getLocationOptions();

        request.setAttribute("reservation", res);
        request.setAttribute("users", users);
        request.setAttribute("vehicles", vehicles);
        request.setAttribute("locations", locations);

        request.getRequestDispatcher("/reservationManagement/updateReservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int reservationId = Integer.parseInt(request.getParameter("id"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
            int locationId = Integer.parseInt(request.getParameter("locationId"));
            Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
            Date returnDate = Date.valueOf(request.getParameter("returnDate"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            int noOfDates = Integer.parseInt(request.getParameter("noOfDates"));
            String pickupLocation = request.getParameter("pickupLocation");
            String returnLocation = request.getParameter("returnLocation");

            ReservationModel res = new ReservationModel(reservationId, userId, vehicleId, locationId,
                    pickupDate, returnDate, amount, noOfDates, pickupLocation, returnLocation, null);

            ReservationDBUtil.updateReservation(res);

            request.getSession().setAttribute("success", "Reservation updated successfully!");
            response.sendRedirect(request.getContextPath() + "/reservation?id=" + reservationId);

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Update failed: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/reservation?id=" + request.getParameter("id"));
        }
    }
}
