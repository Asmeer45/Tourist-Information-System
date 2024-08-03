//AdminLoginServlet
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        // Hardcoded credentials (replace with your actual logic)
	        if ("admin".equals(username) && "1234".equals(password)) {
	            // Create a session
	            HttpSession session = request.getSession();
	            session.setAttribute("username", username);

	            // Redirect to a welcome page or dashboard
	            response.sendRedirect("index.jsp");
	        } else {
	            // Redirect back to login page with error message
	            response.sendRedirect("AdminLogin.jsp?error=1");
	        }
	    }

}
