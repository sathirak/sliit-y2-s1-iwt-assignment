package user;

import common.DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDBUtil {

    private static final Logger LOGGER = Logger.getLogger(UserDBUtil.class.getName());
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Insert user method with UserModel as parameter
    public static void insertUser(UserModel user) {

        try {
            con = DB.getConnection();
            String sql = "INSERT INTO User (first_name, last_name, license_no, license_expiry_date, email, password, contact_no) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getLicenseNo());
            pstmt.setDate(4, new java.sql.Date(user.getLicenseExpiryDate().getTime()));
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getContactNo());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                LOGGER.info("User inserted successfully: " + user.getEmail());
            } else {
                LOGGER.warning("User insertion failed: " + user.getEmail());
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting user: " + user.getEmail(), e);
        }
    }

    // Get user details by userId
    public static UserModel getUserDetails(String userId) {
        UserModel user = null;

        try {
            int id = Integer.parseInt(userId);
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM User WHERE user_id = " + id;
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                user = new UserModel(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("license_no"),
                    rs.getDate("license_expiry_date"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("contact_no")
                );
                LOGGER.info("User retrieved successfully: ID = " + userId);
            } else {
                LOGGER.warning("No user found with ID: " + userId);
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving user with ID: " + userId, e);
        }

        return user;
    }

    // Get all users
    public static List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM User";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                users.add(new UserModel(
                        rs.getInt("user_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("license_no"),
                        rs.getDate("license_expiry_date"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("contact_no")
                    ));
            }

            LOGGER.info("All users retrieved successfully. Total users: " + users.size());

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving all users", e);
        }

        return users;
    }

    // Update user method with UserModel as parameter
    public static void updateUser(UserModel user) {

        try {
            con = DB.getConnection();
            String sql = "UPDATE User SET first_name=?, last_name=?, license_no=?, license_expiry_date=?, email=?, password=?, contact_no=? WHERE user_id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getLicenseNo());
            pstmt.setDate(4, new java.sql.Date(user.getLicenseExpiryDate().getTime()));
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getContactNo());
            pstmt.setInt(8, user.getUserId());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                LOGGER.info("User updated successfully: ID = " + user.getUserId());
            } else {
                LOGGER.warning("User update failed: ID = " + user.getUserId());
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating user with ID: " + user.getUserId(), e);
        }
    }

    // Delete user by userId
    public static void deleteUser(String id) {

        try {
            int userId = Integer.parseInt(id);
            con = DB.getConnection();
            String sql = "DELETE FROM User WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userId);

            int rows = pstmt.executeUpdate();
  
            if (rows > 0) {
                LOGGER.info("User deleted successfully: ID = " + id);
            } else {
                LOGGER.warning("User deletion failed: ID = " + id);
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting user with ID: " + id, e);
        }
    }
}
