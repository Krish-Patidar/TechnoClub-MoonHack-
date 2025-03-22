package com.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MyClubsServlet")
public class MyClubsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("studentlogin.jsp");
            return;
        }

        String studentId = (String) session.getAttribute("studentId");
        List<String> myClubs = new ArrayList<>();

        try {
            String jdbcURL = "jdbc:mysql://localhost:3306/technoclub";
            String dbUser = "root";
            String dbPassword = "krrish@001#400";

            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String query = "SELECT club_name FROM club_members WHERE student_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, studentId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                myClubs.add(rs.getString("club_name"));
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("myClubs", myClubs);
        request.getRequestDispatcher("myClubs.jsp").forward(request, response);
    }
}
