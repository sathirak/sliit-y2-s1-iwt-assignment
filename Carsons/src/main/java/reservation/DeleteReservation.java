package reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reservation/delete")
public class DeleteReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            ReservationDBUtil.deleteReservation(id);

            request.getSession().setAttribute("success", "Reservation deleted successfully!");
            response.sendRedirect(request.getContextPath() + "/reservation");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Delete failed: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/reservation");
        }
    }
}
