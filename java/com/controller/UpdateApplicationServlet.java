package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateApplicationServlet")
public class UpdateApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));
        String studentId = request.getParameter("studentId");
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        int semester = Integer.parseInt(request.getParameter("semester"));
        BigDecimal cgpa = new BigDecimal(request.getParameter("cgpa"));
        String clubName = request.getParameter("clubName"); 

        System.out.println("DEBUG: club_name = " + clubName); 

        String jdbcURL = "jdbc:mysql://localhost:3306/technoclub"; 
        String dbUser = "root"; 
        String dbPassword = "krrish@001#400"; 

        try (Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            if ("accept".equals(action)) {
                String insertSQL = "INSERT INTO club_members (student_id, full_name, age, semester, cgpa, club_name) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStmt = con.prepareStatement(insertSQL)) {
                    insertStmt.setString(1, studentId);
                    insertStmt.setString(2, fullName);
                    insertStmt.setInt(3, age);
                    insertStmt.setInt(4, semester);
                    insertStmt.setBigDecimal(5, cgpa);
                    insertStmt.setString(6, clubName); 
                    insertStmt.executeUpdate();
                }

                String deleteSQL = "DELETE FROM club_applications WHERE id = ?";
                try (PreparedStatement deleteStmt = con.prepareStatement(deleteSQL)) {
                    deleteStmt.setInt(1, applicationId);
                    deleteStmt.executeUpdate();
                }
            } else if ("reject".equals(action)) {
                String deleteSQL = "DELETE FROM club_applications WHERE id = ?";
                try (PreparedStatement deleteStmt = con.prepareStatement(deleteSQL)) {
                    deleteStmt.setInt(1, applicationId);
                    deleteStmt.executeUpdate();
                }
            }

            response.sendRedirect("adminDashboard.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
