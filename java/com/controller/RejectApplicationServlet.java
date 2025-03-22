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

@WebServlet("/RejectApplicationServlet")
public class RejectApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int appId = Integer.parseInt(request.getParameter("appId"));
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            String deleteQuery = "DELETE FROM club_applications WHERE id=?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, appId);
            pstmt.executeUpdate();

            response.getWriter().println("<script>alert('Application Rejected & Deleted!'); window.location='applications.jsp';</script>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
