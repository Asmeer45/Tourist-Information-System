package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.dbconnect;
//import util.LoginValidation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AddItemController", urlPatterns = {"/AddItemController"})
public class AddItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddItemController() {
        super();

    }


protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	 	Connection connection = null;
	 	PreparedStatement preparedStatement = null;	
	
	
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String multimedia_url = request.getParameter("multimedia_url");
        
        System.out.println(name);
        System.out.println(description);
        System.out.println(latitude);
        System.out.println(longitude);
        System.out.println(multimedia_url);
        
        
        
        try {
            connection = dbconnect.getConnection();
            String sql = "INSERT INTO landmarks (name, description, latitude, longitude, multimedia_url) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, latitude);
            preparedStatement.setString(4, longitude);
            preparedStatement.setString(5, multimedia_url);

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            response.sendRedirect("add_details.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	dbconnect.closeConnection(connection);
        }
        
        
        
        
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

}
