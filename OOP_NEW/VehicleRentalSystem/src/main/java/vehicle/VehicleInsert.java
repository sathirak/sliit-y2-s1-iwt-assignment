package vehicle;

import java.io.IOException;

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

		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String plate_no = request.getParameter("plate_no");
		String color = request.getParameter("color");
		String fuel_option = request.getParameter("fuel_option");
		String gear = request.getParameter("gear");
		// concatinated by=========
		int seat_count = Integer.parseInt(request.getParameter("seat_count"));
		float daily_rate = Float.parseFloat(request.getParameter("daily_rate"));

		boolean isTrue;
		isTrue = VehicleDBUtill.insertvehicle(category, brand, model, plate_no, color, fuel_option, gear, seat_count,
				daily_rate);

		if (isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}
}
