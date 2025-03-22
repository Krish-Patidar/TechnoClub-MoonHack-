package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.nio.file.Paths;
import com.controller.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventType = request.getParameter("eventType");
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventVenue = request.getParameter("eventVenue");
        String eventPrice = request.getParameter("eventPrice");
        String eventDesc = request.getParameter("eventDesc");
        String eventHostClub = request.getParameter("eventHostClub");
        String coordinatorContact = request.getParameter("coordinatorContact");

        Part imagePart = request.getPart("image");
        String imageFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("/") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageFileName;
        imagePart.write(imagePath);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO events (event_type, image, event_name, event_date, event_venue, event_price, event_desc, event_host_club, coordinator_contact) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, eventType);
                stmt.setString(2, "uploads/" + imageFileName);
                stmt.setString(3, eventName);
                stmt.setString(4, eventDate);
                stmt.setString(5, eventVenue);
                stmt.setString(6, eventPrice);
                stmt.setString(7, eventDesc);
                stmt.setString(8, eventHostClub);
                stmt.setString(9, coordinatorContact);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
            return;
        }

        response.sendRedirect("events.jsp?success=true");
    }
}
