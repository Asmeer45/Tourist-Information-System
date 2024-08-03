package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.dbconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteController", urlPatterns = {"/DeleteController"})
public class DeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = request.getParameter("id");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dbconnect.getConnection();
            String sql = "DELETE FROM landmarks WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(itemId));
            preparedStatement.executeUpdate();

            response.sendRedirect("ItemListController"); // Redirect to the item list controller after deletion
        } catch (Exception e) {
            e.printStackTrace();
            // You might want to handle exceptions more gracefully here, possibly redirecting to an error page
        } finally {
        	dbconnect.closeConnection(connection);
        }
    }
}
