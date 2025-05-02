package vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/VehicleDelete")
public class VehicleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vehicle_id = request.getParameter("vehicle_id");
		
		boolean isTrue;
		isTrue = VehicleDBUtil.deletevehicle(vehicle_id);

		if (isTrue == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("vehiclelist.jsp");
			dispatcher.forward(request, response);
			
		} else {
			List<Vehicle> vehicleDetails = VehicleDBUtil.getVehicleDetails(vehicle_id);
			request.setAttribute("vehDetails", vehicleDetails);

			RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}

}
