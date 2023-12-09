package model.bo;

import java.util.ArrayList;

import model.bean.Playlist;
import model.dao.PlaylistDAO;

public class PlaylistBO {
	public static ArrayList<Playlist> GetPlayList(int id) {
		return PlaylistDAO.GetPlaylistDAO(id);
	}
}
