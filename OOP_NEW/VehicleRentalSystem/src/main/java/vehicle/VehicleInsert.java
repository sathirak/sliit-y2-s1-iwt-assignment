package vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleInsert")
public class VehicleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String category = request.getParameter("category");
			String model = request.getParameter("model");
			String brand = request.getParameter("brand");
			String gear = request.getParameter("gear");
			String color = request.getParameter("color");
			int seat_no = Integer.parseInt(request.getParameter("seat_no"));
			String fuel_option = request.getParameter("fuel_option");
			String plate_no = request.getParameter("plate_no");
			float daily_rate = Float.parseFloat(request.getParameter("daily_rate"));

			boolean isTrue;
			isTrue = VehicleDBUtil.insertvehicle(category, model, brand, gear, color, seat_no, fuel_option, plate_no,
					daily_rate);

			if (isTrue == true) {
				// Retrieve the list of vehicles and forward to vehiclelist.jsp
				List<Vehicle> vehicles = VehicleDBUtil.getAllVehicles();
				request.setAttribute("vehicles", vehicles);
				
				RequestDispatcher dis = request.getRequestDispatcher("vehiclelist.jsp");
				dis.forward(request, response);
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
				dis2.forward(request, response);
			}

		} catch (NumberFormatException e) {
			System.out.println("Invalid input for seat_count or daily_rate");
		}
	}
}
