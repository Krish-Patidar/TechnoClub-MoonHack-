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
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminEmail = request.getParameter("admin_email");
        String adminPassword = request.getParameter("admin_password");

        if (adminEmail == null || adminPassword == null || adminEmail.isEmpty() || adminPassword.isEmpty()) {
            request.setAttribute("error", "Missing Credentials");
            request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            String query = "SELECT admin_id, club_name FROM club_admins WHERE admin_email = ? AND admin_password = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, adminEmail);
            pst.setString(2, adminPassword);
            rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminId", rs.getInt("admin_id"));
                session.setAttribute("clubName", rs.getString("club_name"));

                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("error", "Incorrect email or password");
                request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database Error");
            request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}