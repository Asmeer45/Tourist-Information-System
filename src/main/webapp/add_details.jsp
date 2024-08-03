<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession validSession = request.getSession(false);
    if (validSession == null || validSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) validSession.getAttribute("username");

    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    String multimedia_url = request.getParameter("multimedia_url");
    String qrCodeBase64 = (String) request.getAttribute("qrCodeBase64");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            font-family: 'Arial', sans-serif;
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
        .sidebar-logo {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }
        .nav-item {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .nav-item:hover {
            background-color: #495057; /* Darker background color on hover */
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #343a40; /* Dark background color */
            color: #ffffff; /* Light text color */
            width:87vw;
            margin-left: 200px; /* Offset to align with sidebar */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Shadow for header */
            z-index: 1; /* Ensure header stays above other content */
        }
        .header h2 {
            margin: 0;
            font-size: 1.5rem; /* Larger font size */
        }
        .welcome-message {
            margin-left: auto;
            margin-right: 50px;
            text-align: center;
            margin-top: 50px;
            animation: fadeIn 2s;
        }
        .main-content {
            margin-left: 200px;
            width:88vw;
        }
        .form-container {
            width:35vw;
            margin-left: auto;
            margin-right: auto;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
            }
            .header {
                width: 100%;
                margin-left: 0;
            }
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
    <div>
        <div class="header">
            <h2>Tourist Information System</h2>
            <div>
                <span><%= username %></span>
                <button class="btn btn-light btn-sm">Logout</button>
            </div>
        </div>
        <div class="main-content">
            <div class="form-container">
                <h3>Add Landmark Details</h3>
                <form id="addItemForm" action="AddItemController" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= name != null ? name : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required><%= description != null ? description : "" %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="latitude">Latitude</label>
                        <input type="text" class="form-control" id="latitude" name="latitude" value="<%= latitude != null ? latitude : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="longitude">Longitude</label>
                        <input type="text" class="form-control" id="longitude" name="longitude" value="<%= longitude != null ? longitude : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="multimedia_url">Multimedia URL</label>
                        <input type="url" class="form-control" id="multimedia_url" name="multimedia_url" value="<%= multimedia_url != null ? multimedia_url : "" %>" required>
                    </div>
                    <button type="button" class="btn btn-secondary" onclick="generateQRCode()">Generate QR Code</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                    <button type="reset" class="btn btn-danger">Clear</button>
                </form>
                <div class="qr-code">
                    <% if (qrCodeBase64 != null) { %>
                        <h4>Generated QR Code:</h4>
                        <img src="data:image/png;base64,<%= qrCodeBase64 %>" alt="QR Code">
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script>
        function generateQRCode() {
            const form = document.getElementById('addItemForm');
            form.action = 'QRCodeServlet';
            form.method = 'post';
            form.submit();
        }
    </script>
</body>
</html>
