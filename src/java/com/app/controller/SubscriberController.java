package com.app.controller;

import com.app.dao.SubscriberDAO;
import com.app.model.Subscriber;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubscriberController")
public class SubscriberController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        Subscriber s = new Subscriber(email);
        SubscriberDAO dao = new SubscriberDAO();

        if (dao.addSubscriber(s)) {
            response.sendRedirect("index.jsp?sub=success");
        } else {
            response.sendRedirect("index.jsp?sub=error");
        }
    }
}
