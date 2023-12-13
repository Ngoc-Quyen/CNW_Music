package controller.music;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.bean.Comments;
import model.bean.Music;
import model.bo.MusicBO;

@WebServlet(urlPatterns = {"/MusicController"})
public class MusicController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the playlistItemId parameter from the URL
        String action = req.getParameter("action");
        
        if("getMusicById".equals(action)) {
        	String musicItemId = req.getParameter("musicItemId");
        	Music music = MusicBO.GetMusicById(Integer.parseInt(musicItemId));
        	
        	String json = new Gson().toJson(music);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if("getAllMusicByPlaylistId".equals(action)) {
        	String playlistItemIdStr = req.getParameter("playlistItemId");
        	
        	// Parse the playlistItemId to an Integer
        	Integer playlistItemId = null;
        	if (playlistItemIdStr != null && !playlistItemIdStr.isEmpty()) {
        		try {
        			playlistItemId = Integer.parseInt(playlistItemIdStr);
        		} catch (NumberFormatException e) {
        			e.printStackTrace(); // Handle the parsing error if needed
        		}
        	}
        	
        	// Now you can use the playlistItemId as needed
        	System.out.println("Playlist Item ID: " + playlistItemId);
        	
        	ArrayList<Music> playlist = MusicBO.GetMusicByPlaylistWorkspace(playlistItemId);
        	
        	// Convert the playlist to JSON
        	String json = new Gson().toJson(playlist);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if("getMusicByName".equals(action)) {
        	String nameToFind = req.getParameter("nameToFind");

        	ArrayList<Music> playlist = MusicBO.GetMusicByName(nameToFind);
        	
        	// Convert the playlist to JSON
        	String json = new Gson().toJson(playlist);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if(("likeMusic").equals(action)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	
        	MusicBO.LikeMusic(userId, musicId);
        }
        else if(("getCommentsById").equals(action)) {
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	
        	ArrayList<Comments> comments = MusicBO.GetAllCommentsByMusicId(musicId);
        	// Convert the playlist to JSON
        	String json = new Gson().toJson(comments);
        	
        	// Set the content type to application/json
        	resp.setContentType("application/json");
        	resp.setCharacterEncoding("UTF-8");
        	
        	// Write the JSON data to the response
        	resp.getWriter().write(json);
        }
        else if(("checkLike").equals(action)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	
        	boolean isLike = MusicBO.IsLike(userId, musicId);
        	
        	String json = new Gson().toJson(isLike);
        	
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
    	if(("likeMusic").equals(action)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	
        	MusicBO.LikeMusic(userId, musicId);
        }
    	else if(("unlikeMusic").equals(action)) {
        	HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	
        	MusicBO.UnlikeMusic(userId, musicId);
        }
    	else if(("addComment").equals(action)) {
    		HttpSession session = req.getSession();
        	Integer userId = (Integer) session.getAttribute("userId");
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	String comment = req.getParameter("comment");
        	
        	MusicBO.AddComment(userId, musicId, comment);
    	}
    	else if(("editComment").equals(action)) {
    		Integer commentId = Integer.parseInt(req.getParameter("commentId"));
        	String newComment = req.getParameter("newComment");
        	MusicBO.ChangeComment(commentId, newComment);
    	}
    	else if(("deleteComment").equals(action)) {
    		Integer commentId = Integer.parseInt(req.getParameter("commentId"));
    		MusicBO.DeleteComment(commentId);
    	}
    	else if(("deleteMusic").equals(action)) {
        	int musicId = Integer.parseInt(req.getParameter("musicId"));
        	MusicBO.DeleteMusic(musicId);
    	}
    }
}

