package reservation;

import common.DB;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class ReservationDBUtil {

    private static final Logger LOGGER = Logger.getLogger(ReservationDBUtil.class.getName());

    public static void insertReservation(ReservationModel res) {
        String sql = "INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location, return_location) "
                +
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

        try (Connection con = DB.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation")) {

            while (rs.next()) {
                list.add(mapResultSet(rs));
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching reservations", e);
        }

        return list;
    }

    public static ReservationModel getReservationById(String id) {
        ReservationModel res = null;

        try (Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Reservation WHERE reservation_id = ?")) {

            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                res = mapResultSet(rs);
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
        try (Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("DELETE FROM Reservation WHERE reservation_id = ?")) {

            ps.setInt(1, Integer.parseInt(id));
            int rows = ps.executeUpdate();
            LOGGER.info(rows > 0 ? "Reservation deleted: ID=" + id : "Delete failed");

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Delete error", e);
        }
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
                null );
    }

    // Get all user IDs
    public static List<Integer> getAllUserIds() {
        List<Integer> ids = new ArrayList<>();
        try (Connection con = DB.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT user_id FROM User")) {
            while (rs.next())
                ids.add(rs.getInt("user_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }

    // Get all vehicle IDs
    public static List<Integer> getAllVehicleIds() {
        List<Integer> ids = new ArrayList<>();
        try (Connection con = DB.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT vehicle_id FROM Vehicle")) {
            while (rs.next()) ids.add(rs.getInt("vehicle_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }

    // Get all location IDs
    public static List<Integer> getAllLocationIds() {
        List<Integer> ids = new ArrayList<>();
        try (Connection con = DB.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT location_id FROM Location")) {
            while (rs.next()) ids.add(rs.getInt("location_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }
    
    
    
}