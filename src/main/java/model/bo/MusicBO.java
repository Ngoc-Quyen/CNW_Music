package model.bo;

import java.util.ArrayList;

import model.bean.Music;
import model.dao.MusicDAO;

public class MusicBO {
	public static ArrayList<Music> GetMusicByPlaylistWorkspace(Integer playlistId){
		ArrayList<Music> music = new ArrayList<Music>();
		music = MusicDAO.GetMusicByPlaylistWorkspace(playlistId);
		return music;
	}
}
