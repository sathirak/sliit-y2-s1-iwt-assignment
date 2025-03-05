package com.Rental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RentalDBUtill {
    private static final String URL = "jdbc:mysql://localhost:3306/yourdb";
    private static final String USER = "root";
    private static final String PASSWORD = "12345";

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Create
    public static boolean insertRental(Rental rental) {
        String sql = "INSERT INTO Rental (rental_Id, payment_method, down_payment, total_payment, refund, paid_date)"
        		   + "VALUES ()";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	
            pstmt.setInt(1, rental.getRentalId());
            pstmt.setString(2, rental.getPaymentMethod());
            pstmt.setDouble(3, rental.getDownPayment());
            pstmt.setDouble(4, rental.getToatalPayment());
            pstmt.setDouble(5, rental.getRefund());
            pstmt.setString(6, rental.getPaidDate());
            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
            
            return false;
        }
    }

    // Read
    public static List<Rental> getAllRentals() {
    	
        List<Rental> rentals = new ArrayList<>();
        String sql = "SELECT * FROM Rental";
        
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
            	
                Rental rental = new Rental(
                    rs.getInt("rental_Id"),
                    rs.getString("payment_method"),
                    rs.getDouble("down_payment"),
                    rs.getDouble("total_payment"),
                    rs.getDouble("refund"),
                    rs.getString("paid_date")
                );
                rentals.add(rental);
            }
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
        
        return rentals;
    }

    // Update
    public static boolean updateRental(Rental rental) {
        String sql = "UPDATE Rental SET payment_method=, down_payment=, total_payment=, refund=, paid_date= WHERE rental_Id=";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	
            pstmt.setString(1, rental.getPaymentMethod());
            pstmt.setDouble(2, rental.getDownPayment());
            pstmt.setDouble(3, rental.getToatalPayment());
            pstmt.setDouble(4, rental.getRefund());
            pstmt.setString(5, rental.getPaidDate());
            pstmt.setInt(6, rental.getRentalId());
            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
            
            return false;
        }
    }

    // Delete
    public static boolean deleteRental(int rentalId) {
        String sql = "DELETE FROM Rental WHERE rental_Id=?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	
            pstmt.setInt(1, rentalId);
            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
            
            return false;
        }
    }
}