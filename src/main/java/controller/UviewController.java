package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.dbconnect;
import model.Landmark;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class ViewController
 */
@WebServlet(name = "UviewController", urlPatterns = {"/UviewController"})
public class UviewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UviewController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String landmarkId = request.getParameter("id");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = dbconnect.getConnection();
            String sql = "SELECT * FROM landmarks WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(landmarkId));
            resultSet = preparedStatement.executeQuery();

            Landmark landmark = null;
            if (resultSet.next()) {
                landmark = new Landmark();
                landmark.setId(resultSet.getInt("id"));
                landmark.setName(resultSet.getString("name"));
                landmark.setDescription(resultSet.getString("description"));
                landmark.setLatitude(resultSet.getString("latitude"));
                landmark.setLongitude(resultSet.getString("longitude"));
                landmark.setMultimedia_url(resultSet.getString("multimedia_url"));
            }

            request.setAttribute("landmark", landmark);
            request.getRequestDispatcher("Uview_details.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	dbconnect.closeConnection(connection);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
