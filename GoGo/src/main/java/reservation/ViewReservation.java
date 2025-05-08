package reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/reservation")
public class ViewReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            if (id != null) {
                // View a specific reservation
                ReservationModel res = ReservationDBUtil.getReservationById(id);
                request.setAttribute("reservation", res);
                request.getRequestDispatcher("/viewReservation.jsp").forward(request, response);

            } else {
                // Paginated list view
                int page = 1;
                int pageSize = 10;

                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException ignored) {}
                }

                List<ReservationModel> reservations = ReservationDBUtil.getReservationsByPage(page, pageSize);
                int totalReservations = ReservationDBUtil.getReservationCount();
                int totalPages = (int) Math.ceil((double) totalReservations / pageSize);

                request.setAttribute("reservations", reservations);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);

                request.getRequestDispatcher("/reservations.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error loading reservations: " + e.getMessage());
        }
    }
}
