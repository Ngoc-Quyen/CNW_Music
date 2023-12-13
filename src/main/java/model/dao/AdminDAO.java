package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import context.DBContext;
import model.bean.Account;
import model.bean.Music;

public class AdminDAO {
	public static ArrayList<Music> GetAllMusic(){
		ArrayList<Music> music = new ArrayList<Music>();
		String query = "SELECT musics.*, genres.name AS genre_name FROM musics JOIN genres ON genres.id = musics.genre_id";
        try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Retrieve values from the ResultSet
                int id = rs.getInt("id");
                int account_id = rs.getInt("account_id");
                int genre_id = rs.getInt("genre_id");
                String genre_name = rs.getString("genre_name");
                String artist_name = rs.getString("artist_name");
                String name = rs.getString("name");
                String music_file = rs.getString("musicFile");
                Date release_date = rs.getDate("releaseDate");

                Music musicItem = new Music(id, account_id, genre_id, artist_name, name, music_file, release_date);
                musicItem.setGenre_name(genre_name);
                music.add(musicItem);

                System.out.println("Success Fetch");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
		return music;
	}
	
	public static ArrayList<Account> GetAllAccount(){
		ArrayList<Account> accounts = new ArrayList<Account>();
		String query = "SELECT * FROM accounts";
        try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {


            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("Login successful");
                int id = rs.getInt("id");
                int role_id = rs.getInt("role_id");
                String storedUsername = rs.getString("username");
                String storedPassword = rs.getString("password");

                accounts.add(new Account(id, role_id, storedUsername, storedPassword));

            } 
        }catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Failed");
        }
        return accounts;
	}
	
	public static void DeleteAccount(int account_id) {
		String query = "DELETE FROM accounts WHERE id=?";
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, account_id);

	            int affectedRows = ps.executeUpdate();

	            if (affectedRows > 0) {
	                System.out.println("Success Change Comment");
	            } else {
	                System.out.println("Insertion failed, no rows affected.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("Failed");
	        }
	}
}
