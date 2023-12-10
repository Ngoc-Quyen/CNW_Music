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

import model.bean.Music;
import model.bo.MusicBO;

@WebServlet(urlPatterns = {"/MusicController"})
public class MusicController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the playlistItemId parameter from the URL
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
}

