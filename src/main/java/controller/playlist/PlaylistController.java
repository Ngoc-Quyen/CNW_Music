package controller.playlist;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.bean.Playlist;
import model.bo.PlaylistBO;

@WebServlet("/PlaylistController")
public class PlaylistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        ArrayList<Playlist> playlist = PlaylistBO.GetPlayList(userId);

        // Convert the playlist to JSON
        String json = new Gson().toJson(playlist);

        // Set the content type to application/json
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Write the JSON data to the response
        resp.getWriter().write(json);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String actionType = req.getParameter("action");
    	
        if ("create".equals(actionType)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	
        	int playlistId = PlaylistBO.CreatePlaylist(userId);
        	// Convert the playlist to JSON
        	String json = new Gson().toJson(playlistId);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);        
        }
        else if("change-name".equals(actionType)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	Integer playlistId = Integer.parseInt(req.getParameter("playlistId"));
        	String newName = req.getParameter("newName");
        	System.out.print("userid=" + userId + "playlistid=" + playlistId);
        	PlaylistBO.ChangeName(userId, playlistId, newName);
        }
    }    
}


