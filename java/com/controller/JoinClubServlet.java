package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.controller.DBConnection;

@WebServlet("/JoinClubServlet")
public class JoinClubServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        String fullName = request.getParameter("full_name");
        int age = Integer.parseInt(request.getParameter("age"));
        int semester = Integer.parseInt(request.getParameter("semester"));
        BigDecimal cgpa = new BigDecimal(request.getParameter("cgpa"));
        String resume = request.getParameter("resume");
        String image = request.getParameter("image");
        String clubName = request.getParameter("club_name");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnection.getConnection();

            String sql = "INSERT INTO club_applications (student_id, club_name, full_name, age, semester, cgpa, resume, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, studentId);
            pst.setString(2, clubName);
            pst.setString(3, fullName);
            pst.setInt(4, age);
            pst.setInt(5, semester);
            pst.setBigDecimal(6, cgpa);
            pst.setString(7, resume);
            pst.setString(8, image);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("successMessage", "Application submitted successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to submit application.");
            }

            request.getRequestDispatcher("exploreClubs.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("joinClubForm.jsp").forward(request, response);
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
