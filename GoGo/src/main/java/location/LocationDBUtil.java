package location;

import common.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LocationDBUtil {

    private static final Logger LOGGER = Logger.getLogger(LocationDBUtil.class.getName());
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insertLocation(String district, String locationContactNo, 
            String streetNo, String street, String city) {
        boolean isSuccess = false;

        try {
            con = DB.getConnection();
            String sql = "INSERT INTO Location VALUES (0,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, district);
            pstmt.setString(2, locationContactNo);
            pstmt.setString(3, streetNo);
            pstmt.setString(4, street);
            pstmt.setString(5, city);
            
            int result = pstmt.executeUpdate();

            if (result > 0) {
                isSuccess = true;
                LOGGER.info("Location inserted successfully: " + district + ", " + city);
            } else {
                LOGGER.warning("Location insertion failed: " + district + ", " + city);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting location: " + district + ", " + city, e);
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public static Location getLocationDetails(String locationId) {
        Location location = null;

        try {
            if (locationId == null || locationId.trim().isEmpty()) {
                LOGGER.warning("Empty location ID provided");
                return null;
            }
            
            int convertedID = Integer.parseInt(locationId);
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM Location WHERE location_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int location_id = rs.getInt("location_id");
                String district = rs.getString("district");
                String location_contact_no = rs.getString("location_contact_no");
                String street_no = rs.getString("street_no");
                String street = rs.getString("street");
                String city = rs.getString("city");

                location = new Location(location_id, district, location_contact_no, street_no, city, street);
                LOGGER.info("Location retrieved successfully: ID = " + locationId);
            } else {
                LOGGER.warning("No location found with ID: " + locationId);
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid location ID format: " + locationId, e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving location with ID: " + locationId, e);
        } finally {
            closeResources();
        }

        return location;
    }

    public static List<Location> getAllLocations() {
        List<Location> locations = new ArrayList<>();

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM Location";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Location loc = new Location(
                    rs.getInt("location_id"),
                    rs.getString("district"),
                    rs.getString("location_contact_no"),
                    rs.getString("street_no"),
                    rs.getString("street"),
                    rs.getString("city")
                );
                locations.add(loc);
            }

            LOGGER.info("All locations retrieved successfully. Total locations: " + locations.size());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving all locations", e);
        } finally {
            closeResources();
        }

        return locations;
    }

    public static boolean updateLocation(String id, String district, String locationContactNo, 
            String streetNo, String street, String city) {
        boolean isSuccess = false;

        try {
            if (id == null || id.trim().isEmpty()) {
                LOGGER.warning("Empty location ID provided for update");
                return false;
            }
            
            int locationId = Integer.parseInt(id);
            con = DB.getConnection();
            String sql = "UPDATE Location SET district = ?, location_contact_no = ?, street_no = ?, street = ?, city = ? WHERE location_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, district);
            pstmt.setString(2, locationContactNo);
            pstmt.setString(3, streetNo);
            pstmt.setString(4, street);
            pstmt.setString(5, city);
            pstmt.setInt(6, locationId);
            
            int result = pstmt.executeUpdate();

            if (result > 0) {
                isSuccess = true;
                LOGGER.info("Location updated successfully: ID = " + id);
            } else {
                LOGGER.warning("Location update failed: ID = " + id);
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid location ID format for update: " + id, e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating location with ID: " + id, e);
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    public static boolean deleteLocation(String id) {
        boolean isSuccess = false;

        try {
            if (id == null || id.trim().isEmpty()) {
                LOGGER.warning("Empty location ID provided for deletion");
                return false;
            }
            
            int convId = Integer.parseInt(id);
            con = DB.getConnection();
            String sql = "DELETE FROM Location WHERE location_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convId);
            
            int result = pstmt.executeUpdate();

            if (result > 0) {
                isSuccess = true;
                LOGGER.info("Location deleted successfully: ID = " + id);
            } else {
                LOGGER.warning("Location deletion failed: ID = " + id);
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid location ID format for deletion: " + id, e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting location with ID: " + id, e);
        } finally {
            closeResources();
        }

        return isSuccess;
    }
    
    private static void closeResources() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Error closing database resources", e);
        }
    }
}