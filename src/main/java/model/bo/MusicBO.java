package model.bo;

import java.util.ArrayList;

import model.bean.Comments;
import model.bean.Genre;
import model.bean.Music;
import model.dao.MusicDAO;

public class MusicBO {
	public static ArrayList<Music> GetMusicByPlaylistWorkspace(Integer playlistId){
		ArrayList<Music> music = new ArrayList<Music>();
		music = MusicDAO.GetMusicByPlaylistWorkspace(playlistId);
		return music;
	}
	
	public static Music GetMusicById(int musicId) {
		return MusicDAO.GetMusicById(musicId);
	}
	
	public static ArrayList<Music> GetMusicByName(String nameToFind){
		return MusicDAO.GetMusicByName(nameToFind);
	}
	
	public static void LikeMusic(int userId, int musicId) {
		MusicDAO.LikeMusic(userId, musicId);
	}
	
	public static void UnlikeMusic(int userId, int musicId) {
		MusicDAO.UnlikeMusic(userId, musicId);
	}
	
	public static void AddComment(int userId, int musicId, String comment) {
		MusicDAO.AddComment(userId, musicId, comment);
	}
	
	public static ArrayList<Comments> GetAllCommentsByMusicId(int musicId) {
		return MusicDAO.GetAllCommentsByMusicId(musicId);
	}
	
	public static void ChangeComment(int commentId, String newComment) {
		MusicDAO.ChangeComment(commentId, newComment);
	}
	
	public static void DeleteComment(int commentId) {
		MusicDAO.DeleteComment(commentId);
	}
	
	public static boolean IsLike(int userId, int commentId) {
		return MusicDAO.IsLike(userId, commentId);
	}
	
	public static void DeleteMusic(int musicId) {
		MusicDAO.DeleteMusic(musicId);
	}
	public static boolean AddMusic(Music music) {
		return MusicDAO.AddMusic(music);
	}
	public static ArrayList<Genre> getAllGenre() {
		return MusicDAO.getAllGenre();
	}
}
