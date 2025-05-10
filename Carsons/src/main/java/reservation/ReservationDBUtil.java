package reservation;

import common.DB;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class ReservationDBUtil {

    private static final Logger LOGGER = Logger.getLogger(ReservationDBUtil.class.getName());

    public static void insertReservation(ReservationModel res) {
        String sql = "INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location, return_location) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, res.getUserId());
            ps.setInt(2, res.getVehicleId());
            ps.setInt(3, res.getLocationId());
            ps.setDate(4, new java.sql.Date(res.getPickupDate().getTime()));
            ps.setDate(5, new java.sql.Date(res.getReturnDate().getTime()));
            ps.setDouble(6, res.getAmount());
            ps.setInt(7, res.getNoOfDates());
            ps.setString(8, res.getPickupLocation());
            ps.setString(9, res.getReturnLocation());

            int rows = ps.executeUpdate();
            LOGGER.info(rows > 0 ? "Reservation inserted." : "Reservation insert failed.");

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Insert error", e);
        }
    }

    public static List<ReservationModel> getAllReservations() {
        List<ReservationModel> list = new ArrayList<>();

        String sql = "SELECT r.*, " +
                     "CONCAT(u.first_name, ' ', u.last_name) AS user_name, " +
                     "CONCAT(v.brand, ' ', v.model) AS vehicle_name, " +
                     "CONCAT(l.district, ', ', l.city) AS location_name " +
                     "FROM Reservation r " +
                     "JOIN User u ON r.user_id = u.user_id " +
                     "JOIN Vehicle v ON r.vehicle_id = v.vehicle_id " +
                     "JOIN Location l ON r.location_id = l.location_id";

        try (Connection con = DB.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                ReservationModel res = mapResultSet(rs);
                res.setUserName(rs.getString("user_name"));
                res.setVehicleName(rs.getString("vehicle_name"));
                res.setLocationName(rs.getString("location_name"));
                list.add(res);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching reservations", e);
        }

        return list;
    }

    public static ReservationModel getReservationById(String id) {
        ReservationModel res = null;

        String sql = "SELECT r.*, " +
                     "CONCAT(u.first_name, ' ', u.last_name) AS user_name, " +
                     "CONCAT(v.brand, ' ', v.model) AS vehicle_name, " +
                     "CONCAT(l.district, ', ', l.city) AS location_name " +
                     "FROM Reservation r " +
                     "JOIN User u ON r.user_id = u.user_id " +
                     "JOIN Vehicle v ON r.vehicle_id = v.vehicle_id " +
                     "JOIN Location l ON r.location_id = l.location_id " +
                     "WHERE r.reservation_id = ?";

        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                res = mapResultSet(rs);
                res.setUserName(rs.getString("user_name"));
                res.setVehicleName(rs.getString("vehicle_name"));
                res.setLocationName(rs.getString("location_name"));
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching reservation with ID: " + id, e);
        }

        return res;
    }

    public static void updateReservation(ReservationModel res) {
        String sql = "UPDATE Reservation SET user_id=?, vehicle_id=?, location_id=?, pickup_date=?, return_date=?, amount=?, no_of_dates=?, pickup_location=?, return_location=? WHERE reservation_id=?";

        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, res.getUserId());
            ps.setInt(2, res.getVehicleId());
            ps.setInt(3, res.getLocationId());
            ps.setDate(4, new java.sql.Date(res.getPickupDate().getTime()));
            ps.setDate(5, new java.sql.Date(res.getReturnDate().getTime()));
            ps.setDouble(6, res.getAmount());
            ps.setInt(7, res.getNoOfDates());
            ps.setString(8, res.getPickupLocation());
            ps.setString(9, res.getReturnLocation());
            ps.setInt(10, res.getReservationId());

            int rows = ps.executeUpdate();
            LOGGER.info(rows > 0 ? "Reservation updated: ID=" + res.getReservationId() : "Update failed");

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Update error", e);
        }
    }

    public static void deleteReservation(String id) {
        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM Reservation WHERE reservation_id = ?")) {
            ps.setInt(1, Integer.parseInt(id));
            int rows = ps.executeUpdate();
            LOGGER.info(rows > 0 ? "Reservation deleted: ID=" + id : "Delete failed");

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Delete error", e);
        }
    }

    public static List<ReservationModel> getReservationsByPage(int page, int pageSize) {
        List<ReservationModel> list = new ArrayList<>();

        String sql = "SELECT r.*, " +
                     "CONCAT(u.first_name, ' ', u.last_name) AS user_name, " +
                     "CONCAT(v.brand, ' ', v.model) AS vehicle_name, " +
                     "CONCAT(l.district, ', ', l.city) AS location_name " +
                     "FROM Reservation r " +
                     "JOIN User u ON r.user_id = u.user_id " +
                     "JOIN Vehicle v ON r.vehicle_id = v.vehicle_id " +
                     "JOIN Location l ON r.location_id = l.location_id " +
                     "ORDER BY r.reservation_id DESC LIMIT ? OFFSET ?";

        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, (page - 1) * pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ReservationModel res = mapResultSet(rs);
                res.setUserName(rs.getString("user_name"));
                res.setVehicleName(rs.getString("vehicle_name"));
                res.setLocationName(rs.getString("location_name"));
                list.add(res);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Pagination fetch error", e);
        }

        return list;
    }

    public static int getReservationCount() {
        int count = 0;
        try (Connection con = DB.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM Reservation")) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error counting reservations", e);
        }
        return count;
    }

    private static ReservationModel mapResultSet(ResultSet rs) throws SQLException {
        return new ReservationModel(
            rs.getInt("reservation_id"),
            rs.getInt("user_id"),
            rs.getInt("vehicle_id"),
            rs.getInt("location_id"),
            rs.getDate("pickup_date"),
            rs.getDate("return_date"),
            rs.getDouble("amount"),
            rs.getInt("no_of_dates"),
            rs.getString("pickup_location"),
            rs.getString("return_location"),
            null // createdAt (optional or unused)
        );
    }

    public static List<Map<String, String>> getUserOptions() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT user_id, CONCAT(first_name, ' ', last_name) AS name FROM User";
        try (Connection con = DB.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, String> entry = new HashMap<>();
                entry.put("id", rs.getString("user_id"));
                entry.put("name", rs.getString("name"));
                list.add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Map<String, String>> getVehicleOptions() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT vehicle_id, CONCAT(brand, ' ', model) AS name FROM Vehicle";
        try (Connection con = DB.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, String> entry = new HashMap<>();
                entry.put("id", rs.getString("vehicle_id"));
                entry.put("name", rs.getString("name"));
                list.add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Map<String, String>> getLocationOptions() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT location_id, CONCAT(district, ', ', city) AS name FROM Location";
        try (Connection con = DB.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, String> entry = new HashMap<>();
                entry.put("id", rs.getString("location_id"));
                entry.put("name", rs.getString("name"));
                list.add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static double getDailyRateByVehicleId(String vehicleId) {
        double rate = 0;
        String sql = "SELECT daily_rate FROM Vehicle WHERE vehicle_id = ?";
    
        try (Connection con = DB.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(vehicleId));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rate = rs.getDouble("daily_rate");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rate;
    }
    
}
