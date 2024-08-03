package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Landmark;
import util.dbconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateController() {
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
            request.getRequestDispatcher("update_details.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	dbconnect.closeConnection(connection);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String multimedia_url = request.getParameter("multimedia_url");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dbconnect.getConnection();
            String sql = "UPDATE landmarks SET name = ?, description = ?, latitude = ?, longitude = ?, multimedia_url = ? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, latitude);
            preparedStatement.setString(4, longitude);
            preparedStatement.setString(5, multimedia_url);
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();

            response.sendRedirect("ItemListController");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	dbconnect.closeConnection(connection);
        }
    }
}
