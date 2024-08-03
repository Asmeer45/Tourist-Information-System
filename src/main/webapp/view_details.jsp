<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.Landmark" %>

<%
    HttpSession validSession = request.getSession(false);
    if (validSession == null || validSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) validSession.getAttribute("username");
    Landmark landmark = (Landmark) request.getAttribute("landmark");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Landmark Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
        }
        .sidebar {
             height: 100%;
            width: 200px;
            background-color: #343a40; /* Dark background color */
            padding-top: 20px;
            color: #ffffff; /* Light text color */
            position: fixed;
            overflow-y: auto; /* Enable scrolling for sidebar if content exceeds height */
        }
        .main-content {
            margin-left: 200px;
            padding: 20px;
            width: calc(100% - 200px); /* Adjust for sidebar width */
        }
        .logo {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }
        .nav-item {
            padding: 10px;
            cursor: pointer;
        }
        .nav-item:hover {
            background-color: #e9ecef;
            transition: background-color 0.3s;
        }
        .header {
           display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background-color: #343a40;
            color: white;
            position: fixed;
            width: 100%;
            z-index: 1;
            margin-top: -20px;
            margin-left: -20px;
        }
        .header h2 {
            margin: 0;
        }
        .form-container {
            margin-top: 60px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .landmark-details {
            margin-bottom: 20px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-logo">
            
        </div>
        <div class="nav-item"><a href="add_details.jsp" class="text-white">Add Details</a></div>
        <div class="nav-item"><a href="ItemListController" class="text-white">List Details</a></div>
       
    </div>
    <div class="main-content">
        <div class="header">
            <h2>Tourist Information System</h2>
            <div>
                <span><%= username %></span>
                <form action="LogoutController" method="post" style="display:inline;">
                    <button type="submit" class="btn btn-light btn-sm">Logout</button>
                </form>
            </div>
        </div>
        <div class="form-container">
            <div class="landmark-details">
                <h3>Landmark Details</h3>
                <p><strong>Name:</strong> <%= landmark.getName() %></p>
                <p><strong>Description:</strong> <%= landmark.getDescription() %></p>
                <p><strong>Latitude:</strong> <%= landmark.getLatitude() %></p>
                <p><strong>Longitude:</strong> <%= landmark.getLongitude() %></p>
                <p><strong>Multimedia URL:</strong> <a href="<%= landmark.getMultimedia_url() %>" target="_blank"><%= landmark.getMultimedia_url() %></a></p>
            </div>
            <div class="button-group">
                <form action="UpdateController" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= landmark.getId() %>">
                    <button type="submit" class="btn btn-warning btn-sm">Update</button>
                </form>
                
                <form action="DeleteController" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= landmark.getId() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
                
                <a href="ItemListController" class="btn btn-secondary">Back</a> <!-- Link to go back to landmark list page -->
            </div>
        </div>
    </div>
</body>
</html>
