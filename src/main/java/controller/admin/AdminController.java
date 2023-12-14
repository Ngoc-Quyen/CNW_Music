package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.bean.Account;
import model.bean.Genre;
import model.bean.Music;
import model.bo.AdminBO;
import model.bo.MusicBO;

@WebServlet(urlPatterns={"/AdminController"})
public class AdminController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if(("getAllAccount").equals(action)) {
        	ArrayList<Account> account = AdminBO.GetAllAccount();

        	String json = new Gson().toJson(account);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if(("getAllMusic").equals(action)) {
        	ArrayList<Music> music = AdminBO.GetAllMusic();

        	String json = new Gson().toJson(music);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if(("deleteAccount").equals(action)) {
        	int accountId = Integer.parseInt(req.getParameter("accountId"));
        	AdminBO.DeleteAccount(accountId);
        } else if(("AddMusic").equals(action)) {
        	ArrayList<Genre> genreList = MusicBO.getAllGenre();
        	String json = new Gson().toJson(genreList);
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

		if(("deleteAccount").equals(action)) {
        	int accountId = Integer.parseInt(req.getParameter("accountId"));
        	AdminBO.DeleteAccount(accountId);
        }
	}
}
