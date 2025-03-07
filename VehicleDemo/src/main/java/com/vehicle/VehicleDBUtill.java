package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VehicleDBUtill {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// Insert ================================
	public static boolean insertvehicle(String brand, String model, String plate_no, String color, String fuel_option,
			int seat_count, float daily_rate) {
		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO vehicle VALUES (0,'" + brand + "','" + model + "','" + plate_no + "','" + color
					+ "','" + fuel_option + "' ,'" + seat_count + "' ,'" + daily_rate + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// Retrieve =========== //cus = veh
	public static List<Vehicle> getVehicleDetails(String vehicleId) {
		int convertedID = Integer.parseInt(vehicleId);
		ArrayList<Vehicle> veh = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM vehicle WHERE vehicle_id = '" + convertedID + "' ";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int vehicle_id = rs.getInt(1);
				String brand = rs.getString(2);
				String model = rs.getString(3);
				String plate_no = rs.getString(4);
				String color = rs.getString(5);
				String fuel_option = rs.getString(6);
				int seat_count = rs.getInt(7);
				float daily_rate = rs.getFloat(8);

				Vehicle v = new Vehicle(vehicle_id, brand, model, plate_no, color, fuel_option, seat_count, daily_rate);
				veh.add(v);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return veh;
	}

	// Update ==================
	public static boolean updatevehicle(String id, String name, String email, String phone, String username,
			String password) {

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE vehicle SET name = '" + name + "', email = '" + email + "', phone = '" + phone
					+ "', username = '" + username + "', password = '" + password + "'" + "WHERE id = '" + id + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// Delete========================
	public static boolean deletevehicle(String id) {

		int convId = Integer.parseInt(id);

		try {

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM vehicle WHERE id='" + convId + "'";
			int r = stmt.executeUpdate(sql);

			if (r > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

}
