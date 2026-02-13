package com.app.controller;

import com.app.dao.ProjectDAO;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteProjectController")
public class DeleteProjectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // SESSION PROTECTION
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin/login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        ProjectDAO dao = new ProjectDAO();
        dao.deleteProject(id);

        response.sendRedirect("admin/viewProjects.jsp");
    }
}
