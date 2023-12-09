package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bo.AuthenticationBO;

@WebServlet(urlPatterns={"/AuthController"})
public class AuthController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println("to post");
        System.out.println(action);

        // Check the value of the action parameter and perform the corresponding action
        if ("login".equals(action)) {
            System.out.println("register");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            Account acc = AuthenticationBO.LoginBO(username, password);
            if (acc != null) {
                // Redirect to index.jsp after successful login
                HttpSession session = req.getSession();
                session.setAttribute("userId", acc.getId());
                resp.sendRedirect("index.jsp");
            }
        } else if ("register".equals(action)) {
            System.out.println("register");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            boolean i = AuthenticationBO.RegisterBO(username, password);
            if (i) {
                // Redirect to login page after successful registration
                resp.sendRedirect("./view/pages/auth/Login.jsp");
            }
        } else {
            // Handle default case or show an error
            resp.getWriter().println("Invalid action");
        }
    }
}
