package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourist_information","root", "");
            PreparedStatement pst = con.prepareStatement("insert into users(username,password,phone,email) value (?,?,?,?)");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, phone);
            pst.setString(4, email);
            
            
            
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("signup.jsp");
            if(rowCount >0) {
            	request.setAttribute("status","success");
            }
            else {
            	request.setAttribute("status","failed");
            }
            
            dispatcher.forward(request,response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
        
        		try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}        	}
        
	}

}
