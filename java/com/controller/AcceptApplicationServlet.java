package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AcceptApplicationServlet")
public class AcceptApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int appId = Integer.parseInt(request.getParameter("appId"));
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            // Fetch application details
            String fetchQuery = "SELECT * FROM club_applications WHERE id=?";
            pstmt = conn.prepareStatement(fetchQuery);
            pstmt.setInt(1, appId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String studentId = rs.getString("student_id");
                String clubName = rs.getString("club_name");
                String fullName = rs.getString("full_name");
                int age = rs.getInt("age");
                int semester = rs.getInt("semester");
                double cgpa = rs.getDouble("cgpa");
                String resume = rs.getString("resume");
                String image = rs.getString("image");

                // Insert into club_members table
                String insertQuery = "INSERT INTO club_members (student_id, club_name, full_name, age, semester, cgpa, resume, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, studentId);
                insertStmt.setString(2, clubName);
                insertStmt.setString(3, fullName);
                insertStmt.setInt(4, age);
                insertStmt.setInt(5, semester);
                insertStmt.setDouble(6, cgpa);
                insertStmt.setString(7, resume);
                insertStmt.setString(8, image);
                insertStmt.executeUpdate();

                // Update application status to 'Accepted'
                String updateQuery = "UPDATE club_applications SET status='Accepted' WHERE id=?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setInt(1, appId);
                updateStmt.executeUpdate();
            }

            // Redirect back to applications.jsp
            response.sendRedirect("adminDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
