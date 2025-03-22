package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageApplicationServlet")
public class ManageApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int applicationId = Integer.parseInt(request.getParameter("application_id"));
        String action = request.getParameter("action");

        try (Connection con = DBConnection.getConnection()) { 
            if ("accept".equals(action)) {
                String insertSQL = "INSERT INTO club_members (student_id, club_name, full_name, age, semester, cgpa, resume, image)" +
                        "SELECT student_id, club_name, full_name, age, semester, cgpa, resume, image FROM club_applications WHERE id=?";
                PreparedStatement insertPst = con.prepareStatement(insertSQL);
                insertPst.setInt(1, applicationId);
                insertPst.executeUpdate();

                String deleteSQL = "DELETE FROM club_applications WHERE id=?";
                PreparedStatement deletePst = con.prepareStatement(deleteSQL);
                deletePst.setInt(1, applicationId);
                deletePst.executeUpdate();
            } else {
                String updateSQL = "UPDATE club_applications SET status='Rejected' WHERE id=?";
                PreparedStatement updatePst = con.prepareStatement(updateSQL);
                updatePst.setInt(1, applicationId);
                updatePst.executeUpdate();
            }

            response.sendRedirect("adminDashboard.jsp?success=Application+updated");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp?error=" + e.getMessage());
        }
    }
}
