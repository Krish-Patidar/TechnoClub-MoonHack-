package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GiveCreditServlet")
public class GiveCreditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        int newEvent = Integer.parseInt(request.getParameter("event_number"));
        int newCredit = Integer.parseInt(request.getParameter("credit_points"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            String sql = "UPDATE club_members SET total_credit = total_credit + ?, total_events = total_events + ? WHERE student_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, newCredit);
            stmt.setInt(2, newEvent);
            stmt.setString(3, studentId);
            
            int rowsUpdated = stmt.executeUpdate();
            conn.close();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("acceptedMembers.jsp"); // Refresh page to show updated data
            } else {
                response.getWriter().println("Failed to update credit!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
