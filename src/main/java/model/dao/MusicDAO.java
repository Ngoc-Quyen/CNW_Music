package model.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import context.DBContext;
import model.bean.Music;
import model.bean.Playlist;

public class MusicDAO {
	public static ArrayList<Music> GetMusicByPlaylistWorkspace(Integer playlistId){
		ArrayList<Music> music = new ArrayList<Music>();
		String query = "SELECT * FROM musics JOIN playlist_music ON playlist_music.music_id=musics.id WHERE playlist_id = ?";
        try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {
            ps.setInt(1, playlistId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Retrieve values from the ResultSet
                int id = rs.getInt("id");
                int account_id = rs.getInt("account_id");
                int genre_id = rs.getInt("genre_id");
                String artist_name = rs.getString("artist_name");
                String name = rs.getString("name");
                String music_file = rs.getString("musicFile");
                Date release_date = rs.getDate("releaseDate");
                // ... other columns

                Music musicItem = new Music(id, account_id, genre_id, artist_name, name, music_file, release_date);
                music.add(musicItem);

                System.out.println("Success Fetch");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
		return music;
	}
}
