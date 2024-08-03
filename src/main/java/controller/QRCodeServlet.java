package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.QRCodeUtil;

import java.io.IOException;
import java.util.Base64;

@WebServlet(name = "QRCodeServlet", urlPatterns = {"/QRCodeServlet"})
public class QRCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QRCodeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String multimedia_url = request.getParameter("multimedia_url");

        if (name != null && !name.isEmpty()) {
            try {
                byte[] qrCode = QRCodeUtil.generateQRCode(name, 200, 200);
                String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCode);

                request.setAttribute("name", name);
                request.setAttribute("description", description);
                request.setAttribute("latitude", latitude);
                request.setAttribute("longitude", longitude);
                request.setAttribute("multimedia_url", multimedia_url);
                request.setAttribute("qrCodeBase64", qrCodeBase64);

                request.getRequestDispatcher("add_details.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "QR Code generation failed.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Name is required for QR code generation.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
