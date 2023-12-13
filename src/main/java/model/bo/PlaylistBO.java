package model.bo;

import java.util.ArrayList;

import model.bean.Playlist;
import model.dao.PlaylistDAO;

public class PlaylistBO {
	public static ArrayList<Playlist> GetPlayList(int id) {
		return PlaylistDAO.GetPlaylistDAO(id);
	}
	
	public static int CreatePlaylist(int userId) {
		return PlaylistDAO.CreatePlaylistDAO(userId);
	}
	
	public static void ChangeName(int userId, int playlistId, String newName) {
		PlaylistDAO.ChangePlaylistName(userId, playlistId, newName);
	}
	
	public static void AddMusicToPlaylist(int musicId, int playlistId) {
		PlaylistDAO.AddMusicToPlaylist(musicId, playlistId);
	}
}
