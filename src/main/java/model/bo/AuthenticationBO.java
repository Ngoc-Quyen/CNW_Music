package model.bo;

import java.io.IOException;

import model.bean.Account;
import model.dao.AuthenticationDAO;

public class AuthenticationBO {
	public static Account LoginBO(String username, String password) {
		return AuthenticationDAO.LoginDAO(username, password);
	}
	
	public static boolean RegisterBO(String username, String password) {
		return AuthenticationDAO.RegisterDAO(username, password);
	}
}
