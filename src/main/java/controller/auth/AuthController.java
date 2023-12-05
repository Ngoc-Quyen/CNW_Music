package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AuthenticationBO;

@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		System.out.println("to post");
		System.out.println(action);

        // Check the value of the action parameter and perform the corresponding action
        if ("login".equals(action)) {
        	System.out.println("register");
    		String username = req.getParameter("username");
    		String password = req.getParameter("password");
        	boolean i = AuthenticationBO.LoginBO(username, password);
        	if(i) {
        		resp.setContentType("text/html");
        		PrintWriter printWriter = resp.getWriter();
        		printWriter.println("<h1>Login Success");
        	}
        } else if ("register".equals(action)) {
        	System.out.println("register");
    		String username = req.getParameter("username");
    		String password = req.getParameter("password");
        	boolean i = AuthenticationBO.RegisterBO(username, password);
        	if(i) {
        		resp.setContentType("text/html");
        		PrintWriter printWriter = resp.getWriter();
        		printWriter.println("<h1>Register Success");
        	}
        } else {
            // Handle default case or show an error
            resp.getWriter().println("Invalid action");
        }
	}
}
