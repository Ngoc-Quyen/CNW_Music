package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import context.DBContext;

public class AuthenticationDAO {
	public static Connection connection;
	
	public static boolean LoginDAO(String username, String password) {
	    try (Connection connection = DBContext.getConnecttion()) {
	        String query = "SELECT * FROM accounts WHERE username = ? AND password = ?";
	        try (PreparedStatement ps = connection.prepareStatement(query)) {
	            ps.setString(1, username);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
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
