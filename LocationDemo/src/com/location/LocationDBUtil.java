package com.location;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LocationDBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/locationdb";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static boolean insertLocation(Location location) {
        String sql = "INSERT INTO Locations (Loc_id, Country, State, City, Phone, streetno, street) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, location.getLocId());
            stmt.setString(2, location.getCountry());
            stmt.setString(3, location.getState());
            stmt.setString(4, location.getCity());
            stmt.setString(5, location.getPhone());
            stmt.setString(6, location.getStreetNo());
            stmt.setString(7, location.getStreet());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public static List<Location> getAllLocations() {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM Locations";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Location location = new Location(
                    rs.getInt("Loc_id"),
                    rs.getString("Country"),
                    rs.getString("State"),
                    rs.getString("City"),
                    rs.getString("Phone"),
                    rs.getString("streetno"),
                    rs.getString("street")
                );
                locations.add(location);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return locations;
    }

    public static boolean updateLocation(Location location) {
        String sql = "UPDATE Locations SET Country = , State = , City = , Phone = , streetno = , street =  WHERE Loc_id = ";
        
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, location.getCountry());
            stmt.setString(2, location.getState());
            stmt.setString(3, location.getCity());
            stmt.setString(4, location.getPhone());
            stmt.setString(5, location.getStreetNo());
            stmt.setString(6, location.getStreet());
            stmt.setInt(7, location.getLocId());
            
            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            return false;
        }
    }


    public static boolean deleteLocation(int locId) {
        String sql = "DELETE FROM Locations WHERE Loc_id = ";
        
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, locId);
            
            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            
            return false;
        }
    }

    
    public static Location getLocationById(int locId) {
        String sql = "SELECT * FROM Locations WHERE Loc_id = ";
        
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, locId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
            	
                return new Location(
                    rs.getInt("Loc_id"),
                    rs.getString("Country"),
                    rs.getString("State"),
                    rs.getString("City"),
                    rs.getString("Phone"),
                    rs.getString("streetno"),
                    rs.getString("street")
                );
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}