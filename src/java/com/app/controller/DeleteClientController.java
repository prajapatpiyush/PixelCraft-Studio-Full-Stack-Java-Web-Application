package com.app.controller;

import com.app.dao.ClientDAO;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteClientController")
public class DeleteClientController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin/login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        ClientDAO dao = new ClientDAO();
        dao.deleteClient(id);

        response.sendRedirect("admin/viewClients.jsp");
    }
}
