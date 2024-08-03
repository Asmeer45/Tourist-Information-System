<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Landmark" %>

<%
    HttpSession validSession = request.getSession(false);
    if (validSession == null || validSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) validSession.getAttribute("username");
    
    List<Landmark> landmarkList = (List<Landmark>) request.getAttribute("landmarkList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landmark List</title>
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
        .table-container {
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
            <h2>Landmark List</h2>
            <div>
                <span><%= username %></span>
                <button class="btn btn-light btn-sm">Logout</button>
            </div>
        </div>
        <div class="table-container">
            <div class="mb-3">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search landmarks...">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">Search</button>
                    </div>
                </div>
            </div>
            <table class="table table-striped" width="700px">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Latitude</th>
                        <th>Longitude</th>
                        <th>Multimedia URL</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (landmarkList != null) {
                            for (Landmark landmark : landmarkList) {
                    %>
                    <tr>
                        <td><%= landmark.getId() %></td>
                        <td><%= landmark.getName() %></td>
                        <td><%= landmark.getDescription() %></td>
                        <td><%= landmark.getLatitude() %></td>
                        <td><%= landmark.getLongitude() %></td>
                        <td><a href="<%= landmark.getMultimedia_url() %>" target="_blank"><%= landmark.getMultimedia_url() %></a></td>
                        <td>
                            <form action="ViewController" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= landmark.getId() %>">
                                <button type="submit" class="btn btn-info btn-sm">View</button>
                            </form>
                            <form action="UpdateController" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= landmark.getId() %>">
                                <button type="submit" class="btn btn-warning btn-sm">Update</button>
                            </form>
                            <form action="DeleteController" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= landmark.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
