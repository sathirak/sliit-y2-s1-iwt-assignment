package location;

import common.DB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LocationDBUtil {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Insert ================================
    public static boolean insertLocation(String district, String locationContactNo, 
            String streetNo, String street, String city) {
        boolean isSuccess = false;

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO Location VALUES (0,'" + district + "','" + locationContactNo + "','" + streetNo + "','" + street + "','" + city + "')";
            
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

    // View ================================
    public static List<Location> getLocationDetails(String locationId) {
        ArrayList<Location> locations = new ArrayList<>();

        try {
            int convertedID = Integer.parseInt(locationId);
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM Location WHERE location_id = '" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int location_id = rs.getInt(1);
                String district = rs.getString(2);
                String location_contact_no = rs.getString(3);
                String street_no = rs.getString(4);
                String street = rs.getString(5);
                String city = rs.getString(6);

                Location loc = new Location(location_id, district, location_contact_no, street_no, street, city);
                locations.add(loc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return locations;
    }

    // Get all locations ================================
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return locations;
    }

    // Update ================================
    public static boolean updateLocation(String id, String district, String locationContactNo, 
            String streetNo, String street, String city) {
        boolean isSuccess = false;

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "UPDATE Location SET district = '" + district + "', location_contact_no = '" + locationContactNo + "', street_no = '" + streetNo + "', street = '" + street + "', city = '" + city + "' WHERE location_id = '" + id + "'";
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

    // Delete ================================
    public static boolean deleteLocation(String id) {
        boolean isSuccess = false;

        try {
            int convId = Integer.parseInt(id);
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM Location WHERE location_id = '" + convId + "'";
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