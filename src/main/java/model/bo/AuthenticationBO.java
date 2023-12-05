package model.bo;

import java.io.IOException;

import model.dao.AuthenticationDAO;

public class AuthenticationBO {
	public static boolean LoginBO(String username, String password) {
		return AuthenticationDAO.LoginDAO(username, password);
	}
	
	public static boolean RegisterBO(String username, String password) {
		return AuthenticationDAO.RegisterDAO(username, password);
	}
}
