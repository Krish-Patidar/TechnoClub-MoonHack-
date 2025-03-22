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
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        int semester = Integer.parseInt(request.getParameter("semester"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            String query = "UPDATE students SET full_name=?, age=?, semester=? WHERE student_id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, fullName);
            pst.setInt(2, age);
            pst.setInt(3, semester);
            pst.setString(4, studentId);

            int rowsAffected = pst.executeUpdate();
            
            if (rowsAffected > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("fullName", fullName);
                session.setAttribute("age", age);
                session.setAttribute("semester", semester);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("studentprofile.jsp");
    }
}
