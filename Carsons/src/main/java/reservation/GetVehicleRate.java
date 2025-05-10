package reservation;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/reservation/getRate")
public class GetVehicleRate extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String vehicleId = request.getParameter("vehicleId");
        double rate = ReservationDBUtil.getDailyRateByVehicleId(vehicleId);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"rate\": " + rate + "}");
        out.flush();
    }
}
