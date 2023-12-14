package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import context.DBContext;
import model.bean.Account;

public class AuthenticationDAO {
	public static Connection connection;
	
	public static Account LoginDAO(String username, String password) {
	    try (Connection connection = DBContext.getConnecttion()) {
	        String query = "SELECT * FROM accounts WHERE username = ? AND password = ?";
	        try (PreparedStatement ps = connection.prepareStatement(query)) {
	            ps.setString(1, username);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                System.out.println("Login successful");
	                int id = rs.getInt("id");
	                int role_id = rs.getInt("role_id");
	                String storedUsername = rs.getString("username");
	                String storedPassword = rs.getString("password");

	                // Verify the retrieved username and password for additional security checks
	                if (storedUsername.equals(username) && storedPassword.equals(password)) {
	                    // Create and return an Account object
	                    return new Account(id, role_id, storedUsername, storedPassword);
	                } else {
	                    // Username or password mismatch
	                    System.out.println("Username or password mismatch");
	                    return null;  // or throw an exception if preferred
	                }
	            } else {
	                // No matching user found
	                System.out.println("No matching user found");
	                return null;  // or throw an exception if preferred
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Log or handle the exception accordingly
	        return null;  // or throw an exception if preferred
	    }
	}


    public static boolean RegisterDAO(String username, String password) {
        try (Connection connection = DBContext.getConnecttion()) {
        	String query = "INSERT INTO accounts (role_id, username, password) VALUES (?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1, 2); // set role_id to id of role user
                ps.setString(2, username);
                ps.setString(3, password);

                int i = ps.executeUpdate();

                if (i > 0) {
                    System.out.println("Success");
                    return true;
                } else {
                    System.out.println("Failed");
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
