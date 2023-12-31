package model.bean;

import java.sql.Date;

public class Music {
	Integer id;
	Integer account_id;
	Integer genre_id;
	String artist_name;
	String name;
	String music_file;
	Date release_date;
	String playlist_name;
	String genre_name;
	
	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

	public String getPlaylist_name() {
		return playlist_name;
	}

	public void setPlaylist_name(String playlist_name) {
		this.playlist_name = playlist_name;
	}

	public Music(Integer id, Integer account_id, Integer genre_id, String artist_name, String name, String music_file, Date release_date) {
		this.id = id;
		this.account_id = account_id;
		this.genre_id = genre_id;
		this.artist_name = artist_name;
		this.name = name;
		this.music_file = music_file;
		this.release_date = release_date;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}
	public Integer getGenre_id() {
		return genre_id;
	}
	public void setGenre_id(Integer genre_id) {
		this.genre_id = genre_id;
	}
	public String getArtist_name() {
		return artist_name;
	}
	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMusic_file() {
		return music_file;
	}
	public void setMusic_file(String music_file) {
		this.music_file = music_file;
	}
	public Date getRelease_date() {
		return release_date;
	}
	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}
	
	
}
