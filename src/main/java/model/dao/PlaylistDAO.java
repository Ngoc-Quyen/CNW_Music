package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import context.DBContext;
import model.bean.Playlist;

public class PlaylistDAO {
    public static ArrayList<Playlist> GetPlaylistDAO(int id) {
        ArrayList<Playlist> playlist = new ArrayList<Playlist>();
        String query = "SELECT * FROM playlist WHERE account_id = ?";
        try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Retrieve values from the ResultSet
                int playlistId = rs.getInt("id");
                int playlistAccoutId = rs.getInt("account_id");
                String playlistName = rs.getString("name");
                // ... other columns

                Playlist playlistItem = new Playlist(playlistId, playlistAccoutId, playlistName);
                playlist.add(playlistItem);

                System.out.println("Success Fetch");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }

        return playlist;
    }
    
    public static int CreatePlaylistDAO(int userId) {
        int generatedPlaylistId = -1; // Default value in case of failure
        String query = "INSERT INTO playlist(account_id, name) VALUES(?, ?)";
        
        try (Connection connection = DBContext.getConnecttion();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, userId);
            ps.setString(2, "Danh sách phát của bạn");

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve the generated keys
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedPlaylistId = generatedKeys.getInt(1);
                        System.out.println("Generated Playlist ID: " + generatedPlaylistId);
                    }
                }
                System.out.println("Success Insert");
            } else {
                System.out.println("Insertion failed, no rows affected.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }

        return generatedPlaylistId;
    }

    public static void ChangePlaylistName(int userId, int playlistId, String newName) {
        String query = "UPDATE playlist SET name = ? WHERE account_id = ? AND id = ?";
        
        try (Connection connection = DBContext.getConnecttion();
             PreparedStatement ps = connection.prepareStatement(query)) {
            
            ps.setString(1, newName);
            ps.setInt(2, userId);
            ps.setInt(3, playlistId);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Success Update");
            } else {
                System.out.println("Update failed, no rows affected.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
    }

}
