package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import context.DBContext;
import model.bean.Comments;
import model.bean.Music;
import model.bean.Playlist;

public class MusicDAO {
	public static ArrayList<Music> GetMusicByPlaylistWorkspace(Integer playlistId){
		ArrayList<Music> music = new ArrayList<Music>();
		String query = "SELECT musics.*, playlist_music.*, playlist.name AS playlist_name\r\n"
				+ "FROM musics\r\n"
				+ "JOIN playlist_music ON musics.id = playlist_music.music_id\r\n"
				+ "JOIN playlist ON playlist.id = playlist_music.playlist_id\r\n"
				+ "WHERE playlist_id = ?;";
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

                Music musicItem = new Music(id, account_id, genre_id, artist_name, name, music_file, release_date);
                musicItem.setPlaylist_name(rs.getString("playlist_name"));
                music.add(musicItem);

                System.out.println("Success Fetch");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
		return music;
	}
	
	public static Music GetMusicById(int musicId) {
		ArrayList<Music> music = new ArrayList<Music>();		
		String query = "SELECT * FROM musics WHERE id = ?";
	    try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {
	        ps.setInt(1, musicId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            // Retrieve values from the ResultSet
	            int id = rs.getInt("id");
	            int account_id = rs.getInt("account_id");
	            int genre_id = rs.getInt("genre_id");
	            String artist_name = rs.getString("artist_name");
	            String name = rs.getString("name");
	            String music_file = rs.getString("musicFile");
	            Date release_date = rs.getDate("releaseDate");

	            return new Music(id, account_id, genre_id, artist_name, name, music_file, release_date);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed");
	    }
	    return null; // Return null if no matching music item is found
	}

	public static ArrayList<Music> GetMusicByName(String nameToFind) {
	    ArrayList<Music> music = new ArrayList<Music>();
	    // Corrected the query to concatenate % symbols with the parameter value
	    String query = "SELECT * FROM musics WHERE name LIKE ?";
	    try (PreparedStatement ps = DBContext.getConnecttion().prepareStatement(query)) {
	        ps.setString(1, "%" + nameToFind + "%"); // Concatenate % symbols with the parameter value

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
	            Music musicItem = new Music(id, account_id, genre_id, artist_name, name, music_file, release_date);
	            music.add(musicItem);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed");
	    }
	    return music;
	}

	public static void LikeMusic(int userId, int musicId) {
		String query = "INSERT INTO likes(account_id, music_id) VALUES(?, ?)";
        
        try (Connection connection = DBContext.getConnecttion();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, userId);            
            ps.setInt(2, musicId);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Success Insert");
            } else {
                System.out.println("Insertion failed, no rows affected.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
	}
	
	public static void UnlikeMusic(int userId, int musicId) {
		String query = "DELETE FROM likes WHERE account_id=? AND music_id=?";
        
        try (Connection connection = DBContext.getConnecttion();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, userId);            
            ps.setInt(2, musicId);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Success Insert");
            } else {
                System.out.println("Insertion failed, no rows affected.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
	}
	
	public static void AddComment(int userId, int musicId, String comment) {
		String query = "INSERT INTO comments(account_id, music_id, content) VALUES(?, ?, ?)";
        
        try (Connection connection = DBContext.getConnecttion();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, userId);            
            ps.setInt(2, musicId);
            ps.setString(3, comment);
            System.out.print("user: " + userId + "musicId: " + musicId + "comment: " + comment);

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Success Insert");
            } else {
                System.out.println("Insertion failed, no rows affected.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed");
        }
	}
	
	public static ArrayList<Comments> GetAllCommentsByMusicId(int musicId){
		ArrayList<Comments> comments = new ArrayList<Comments>();
	    String query = "SELECT comments.*, accounts.username FROM comments JOIN accounts ON accounts.id=comments.account_id WHERE music_id=?";
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, musicId);

	            ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            // Retrieve values from the ResultSet
		        	int id = rs.getInt("id");
		            int account_id = rs.getInt("account_id");
		            String account_name = rs.getString("username");
		            int music_id = rs.getInt("music_id");
		            String content = rs.getString("content");

		            Comments musicItem = new Comments(id, account_id, account_name, music_id, content);
		            comments.add(musicItem);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        System.out.println("Failed");
		    }
		    return comments;
	}
	
	public static void ChangeComment(int commentId, String newComment) {
	    String query = "UPDATE comments SET content=? WHERE id=?";
	    try (Connection connection = DBContext.getConnecttion();
	             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setString(1, newComment);            
	            ps.setInt(2, commentId);

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
	public static void DeleteComment(int commentId) {
		String query = "DELETE FROM comments WHERE id=?";
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, commentId);

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
	public static boolean IsLike(int userId, int musicId) {
	    String query = "SELECT * FROM likes WHERE account_id=? AND music_id=?";
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, userId);
	            ps.setInt(2, musicId);

	            ResultSet rs = ps.executeQuery();

	            return rs.next(); // If there are results, the user has liked the music; otherwise, they haven't.
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("Failed");
	        }
	    return false;
	}

	public static void DeleteMusic(int musicId) {
		String query1 = "DELETE FROM playlist_music WHERE music_id=?";
		String query2 = "DELETE FROM comments WHERE music_id=?";
		String query3 = "DELETE FROM musics WHERE id=?";
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, musicId);

	            int affectedRows = ps.executeUpdate();

	            if (affectedRows > 0) {
	                System.out.println("Success Delete From playlist");
	            } else {
	                System.out.println("Insertion failed, no rows affected.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("Failed");
	        }
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query2, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, musicId);

	            int affectedRows = ps.executeUpdate();

	            if (affectedRows > 0) {
	                System.out.println("Success Delete Music From Comments");
	            } else {
	                System.out.println("Insertion failed, no rows affected.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("Failed");
	        }
	    try (Connection connection = DBContext.getConnecttion();
	            PreparedStatement ps = connection.prepareStatement(query3, Statement.RETURN_GENERATED_KEYS)) {
	            
	            ps.setInt(1, musicId);

	            int affectedRows = ps.executeUpdate();

	            if (affectedRows > 0) {
	                System.out.println("Success Delete Music");
	            } else {
	                System.out.println("Insertion failed, no rows affected.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("Failed");
	        }
	}
}
