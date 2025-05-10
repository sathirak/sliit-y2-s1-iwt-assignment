package vehicle;

import java.sql.Connection;
import common.DB;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VehicleDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// Insert ================================
	public static boolean insertvehicle(String category, String model, String brand, String gear, String color,
			int seat_no, String fuel_option, String plate_no, float daily_rate) {
		boolean isSuccess = false;

		try {
			con = DB.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO Vehicle VALUES (0,'" + category + "','" + model + "','" + brand + "','" + gear
					+ "','" + color + "','" + seat_no + "' ,'" + fuel_option + "','" + plate_no + "' ,'" + daily_rate
					+ "')";

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

	// Retrieve ===========
	public static Vehicle getVehicleDetails(String vehicleId) {
		Vehicle v = null;

		try {
			int convertedID = Integer.parseInt(vehicleId);
			con = DB.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM Vehicle WHERE vehicle_id = '" + convertedID + "' ";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				int vehicle_id = rs.getInt(1);
				String category = rs.getString(2);
				String model = rs.getString(3);
				String brand = rs.getString(4);
				String gear = rs.getString(5);
				String color = rs.getString(6);
				int seat_no = rs.getInt(7);
				String fuel_option = rs.getString(8);
				String plate_no = rs.getString(9);
				float daily_rate = rs.getFloat(10);

				v = new Vehicle(vehicle_id, category, model, brand, gear, color, seat_no, fuel_option, plate_no,
						daily_rate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// GET ALL VEHICLES=================

	public static List<Vehicle> getAllVehicles() {
		ArrayList<Vehicle> vehicles = new ArrayList<>();

		try {
			con = DB.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM Vehicle";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Vehicle v = new Vehicle(rs.getInt("vehicle_id"), rs.getString("category"), rs.getString("model"),
						rs.getString("brand"), rs.getString("gear"), rs.getString("color"), rs.getInt("seat_no"),
						rs.getString("fuel_option"), rs.getString("plate_no"), rs.getFloat("daily_rate"));
				vehicles.add(v);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vehicles;
	}

	// Update ==================
	public static boolean updatevehicle(String vehicle_id, String category, String model, String brand, String gear,
			String color, int seat_no, String fuel_option, String plate_no, float daily_rate) {

		try {
			con = DB.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE Vehicle SET category = '" + category + "', model = '" + model + "', brand = '" + brand
					+ "', gear = '" + gear + "', color = '" + color + "', seat_no = '" + seat_no + "', fuel_option = '"
					+ fuel_option + "', plate_no = '" + plate_no + "', daily_rate = '" + daily_rate + "'"
					+ "WHERE vehicle_id = '" + vehicle_id + "'";
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
	public static boolean deletevehicle(String vehicle_id) {

		int convId = Integer.parseInt(vehicle_id);

		try {

			con = DB.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM Vehicle WHERE vehicle_id='" + convId + "'";
			int r = stmt.executeUpdate(sql);

			if (r > 0) {
				isSuccess = true;

				ResultSet rs = stmt.executeQuery("SELECT IFNULL(MAX(vehicle_id), 0) AS max_id FROM Vehicle");
				int maxId = 0;
				if (rs.next()) {
					maxId = rs.getInt("max_id");
				}

				stmt.execute("ALTER TABLE Vehicle AUTO_INCREMENT = " + (maxId + 1));

			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

}
