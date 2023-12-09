package model.bean;

public class Playlist {
	Integer id;
	Integer account_id;
	String name;
	
	public Playlist(Integer id, Integer account_id, String name) {
		this.id = id;
		this.account_id = account_id;
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
