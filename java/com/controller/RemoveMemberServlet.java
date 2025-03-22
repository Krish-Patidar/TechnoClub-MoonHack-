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

@WebServlet("/RemoveMemberServlet")
public class RemoveMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int memberId = Integer.parseInt(request.getParameter("memberId"));
        String studentId = request.getParameter("studentId");
        String clubName = request.getParameter("clubName");

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            PreparedStatement deleteMemberPst = con.prepareStatement("DELETE FROM club_members WHERE id = ?");
            deleteMemberPst.setInt(1, memberId);
            deleteMemberPst.executeUpdate();

            PreparedStatement deleteStudentPst = con.prepareStatement("DELETE FROM club_members WHERE student_id = ? AND club_name = ?");
            deleteStudentPst.setString(1, studentId);
            deleteStudentPst.setString(2, clubName);
            deleteStudentPst.executeUpdate();

            response.sendRedirect("acceptedMembers.jsp?success=Member+Removed");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("acceptedMembers.jsp?error=Database+Error");
        }
    }
}
