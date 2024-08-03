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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "uListDetailsController", urlPatterns = {"/uListDetailsController"})
public class uListDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uListDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        List<Landmark> landmarkList = new ArrayList<>();

        try {
            connection = dbconnect.getConnection();
            String sql = "SELECT id, name, description, latitude, longitude, multimedia_url FROM landmarks";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Landmark landmark = new Landmark();
                landmark.setId(resultSet.getInt("id"));
                landmark.setName(resultSet.getString("name"));
                landmark.setDescription(resultSet.getString("description"));
                landmark.setLatitude(resultSet.getString("latitude"));
                landmark.setLongitude(resultSet.getString("longitude"));
                landmark.setMultimedia_url(resultSet.getString("multimedia_url"));
                
              
                
                landmarkList.add(landmark);
            }

            request.setAttribute("landmarkList", landmarkList);
            request.getRequestDispatcher("UItemList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbconnect.closeConnection(connection);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
