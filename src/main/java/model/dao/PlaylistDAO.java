package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
