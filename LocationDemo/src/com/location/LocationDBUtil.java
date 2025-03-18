package com.location;

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
    public static boolean insertLocation(String district, String locationContactNo, String address, 
                                        String streetNo, String city, String street) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO Location VALUES (0, '" + district + "', '" + locationContactNo + "', '" + 
                        address + "', '" + streetNo + "', '" + city + "', '" + street + "')";
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

    // Retrieve ================================
    public static List<Location> getLocationDetails(String locationId) {
        int convertedID = Integer.parseInt(locationId);
        ArrayList<Location> locations = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM Location WHERE location_id = '" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int location_id = rs.getInt(1);
                String district = rs.getString(2);
                String location_contact_no = rs.getString(3);
                String address = rs.getString(4);
                String street_no = rs.getString(5);
                String city = rs.getString(6);
                String street = rs.getString(7);

                Location loc = new Location(location_id, district, location_contact_no, 
                                         address, street_no, city, street);
                locations.add(loc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return locations;
    }

    // Update ================================
    public static boolean updateLocation(String id, String district, String locationContactNo, 
                                        String address, String streetNo, String city, String street) {
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "UPDATE Location SET district = '" + district + "', " +
                        "location_contact_no = '" + locationContactNo + "', " +
                        "address = '" + address + "', " +
                        "street_no = '" + streetNo + "', " +
                        "city = '" + city + "', " +
                        "street = '" + street + "' " +
                        "WHERE location_id = '" + id + "'";
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
        int convId = Integer.parseInt(id);

        try {
            con = DBConnect.getConnection();
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