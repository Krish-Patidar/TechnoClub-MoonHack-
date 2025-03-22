package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageParticipantsServlet")
public class ManageParticipantsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regId = request.getParameter("regId");
        String action = request.getParameter("action");

        if (regId == null || action == null) {
            response.sendRedirect("manageParticipants.jsp?error=Invalid request");
            return;
        }

        String status;
        if ("accept".equalsIgnoreCase(action)) {
            status = "Accepted";
        } else if ("reject".equalsIgnoreCase(action)) {
            status = "Rejected";
        } else {
            response.sendRedirect("manageParticipants.jsp?error=Invalid action");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE registrations SET status = ? WHERE reg_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, status);
                stmt.setInt(2, Integer.parseInt(regId));
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("manageParticipants.jsp?error=Database error");
            return;
        }

        response.sendRedirect("manageParticipants.jsp?success=Status updated");
    }
}
