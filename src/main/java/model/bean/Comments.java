package model.bean;

public class Comments {
	Integer id;
	Integer account_id;
	String account_name;
	Integer music_id;
	String content;
	
	public Comments(int id, int account_id, String account_name, int music_id, String content) {
		this.id = id;
		this.account_id = account_id;
		this.account_name = account_name;
		this.music_id = music_id;
		this.content = content;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}
	public Integer getMusic_id() {
		return music_id;
	}
	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
