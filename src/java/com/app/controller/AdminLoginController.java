/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // SIMPLE AUTH (GOOD FOR COLLEGE PROJECT)
        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", username);

            response.sendRedirect("admin/dashboard.jsp");

        } else {
            response.sendRedirect("admin/login.jsp?error=true");
        }
    }
}

