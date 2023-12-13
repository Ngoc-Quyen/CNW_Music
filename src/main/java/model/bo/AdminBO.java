package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.bean.Music;
import model.dao.AdminDAO;

public class AdminBO {

	public static ArrayList<Music> GetAllMusic() {
		return AdminDAO.GetAllMusic();
	}
	
	public static ArrayList<Account> GetAllAccount(){
		return AdminDAO.GetAllAccount();
	}
	
	public static void DeleteAccount(int account_id) {
		AdminDAO.DeleteAccount(account_id);
	}
}
