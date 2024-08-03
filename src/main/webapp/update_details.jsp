<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.*" %>
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
    <title>Update Landmark</title>
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
            width: 100%;
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
                <button class="btn btn-light btn-sm">Logout</button>
            </div>
        </div>
        <div class="form-container">
            <h3>Update Landmark</h3>
            <form action="UpdateController" method="post">
                <input type="hidden" name="id" value="<%= landmark.getId() %>">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= landmark.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required><%= landmark.getDescription() %></textarea>
                </div>
                <div class="form-group">
                    <label for="latitude">Latitude</label>
                    <input type="text" class="form-control" id="latitude" name="latitude" value="<%= landmark.getLatitude() %>" required>
                </div>
                <div class="form-group">
                    <label for="longitude">Longitude</label>
                    <input type="text" class="form-control" id="longitude" name="longitude" value="<%= landmark.getLongitude() %>" required>
                </div>
                <div class="form-group">
                    <label for="multimedia_url">Multimedia URL</label>
                    <input type="url" class="form-control" id="multimedia_url" name="multimedia_url" value="<%= landmark.getMultimedia_url() %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</body>
</html>
