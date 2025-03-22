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

@WebServlet("/RegisterEventServlet")
public class RegisterEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("event_id"));
        String eventType = request.getParameter("event_type");

        try (Connection conn = DBConnection.getConnection()) {
            String sql;
            PreparedStatement stmt;

            if ("Hackathon".equalsIgnoreCase(eventType)) {
                sql = "INSERT INTO registrations (event_id, event_type, team_name, team_leader, team_leader_email, team_leader_contact, " +
                        "member1_name, member1_email, member1_contact, " +
                        "member2_name, member2_email, member2_contact, " +
                        "member3_name, member3_email, member3_contact, status) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Pending')";

                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, eventId);
                stmt.setString(2, eventType);
                stmt.setString(3, request.getParameter("team_name"));
                stmt.setString(4, request.getParameter("team_leader"));
                stmt.setString(5, request.getParameter("team_leader_email"));
                stmt.setString(6, request.getParameter("team_leader_contact"));
                stmt.setString(7, request.getParameter("member1_name"));
                stmt.setString(8, request.getParameter("member1_email"));
                stmt.setString(9, request.getParameter("member1_contact"));
                stmt.setString(10, request.getParameter("member2_name"));
                stmt.setString(11, request.getParameter("member2_email"));
                stmt.setString(12, request.getParameter("member2_contact"));
                stmt.setString(13, request.getParameter("member3_name"));
                stmt.setString(14, request.getParameter("member3_email"));
                stmt.setString(15, request.getParameter("member3_contact"));

            } else {
                sql = "INSERT INTO registrations (event_id, event_type, name, email, contact, year, resume, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, eventId);
                stmt.setString(2, eventType);
                stmt.setString(3, request.getParameter("name"));
                stmt.setString(4, request.getParameter("email"));
                stmt.setString(5, request.getParameter("contact"));
                stmt.setString(6, request.getParameter("year"));
                stmt.setString(7, request.getParameter("resume"));
            }

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Registration successful.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("events.jsp");
    }
}
