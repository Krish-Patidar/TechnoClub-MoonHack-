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

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            String query = "SELECT * FROM students WHERE student_id=? AND password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, studentId);
            pst.setString(2, password);
            
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("studentId", rs.getString("student_id"));
                session.setAttribute("fullName", rs.getString("full_name"));
                session.setAttribute("age", rs.getInt("age"));
                session.setAttribute("semester", rs.getInt("semester"));

                response.sendRedirect("studentprofile.jsp");
            } else {
                response.sendRedirect("studentlogin.jsp?error=Invalid Credentials");
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
