/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.controller;

import com.app.dao.ContactDAO;
import com.app.model.Contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piyus
 */
@WebServlet("/ContactController")
public class ContactController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("city");

        Contact contact = new Contact(fullName, email, mobile, city);
        ContactDAO dao = new ContactDAO();

        if (dao.addContact(contact)) {
            response.sendRedirect("index.jsp?contact=success");
        } else {
            response.sendRedirect("index.jsp?contact=error");
        }
    }
}
