package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public loginservlet() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourist_information","root", "");
             PreparedStatement pst = con.prepareStatement("select * from users where username = ? and password = ?");
             pst.setString(1, username);
             pst.setString(2, password);
             
             System.out.println("usr is"+username);
             System.out.println("ps is"+password);
             
             ResultSet rs = pst.executeQuery();
             if (rs.next()) {
            	 session.setAttribute("username", rs.getString("username"));
            	 
            	 dispatcher = request.getRequestDispatcher("userDashboard.jsp");
            	 System.out.println("Success");
             }
             else {
            	 request.setAttribute("status", "failed");
            	 dispatcher = request.getRequestDispatcher("login.jsp");
            	 System.out.println("UnSuccessful");
             }
             dispatcher.forward(request, response);
             System.out.println("*******");
             
        }
        catch(Exception e) {
        	e.printStackTrace();
        	System.out.println(e);
        }
	}

	
}
