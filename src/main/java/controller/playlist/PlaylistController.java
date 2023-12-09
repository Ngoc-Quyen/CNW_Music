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
}


