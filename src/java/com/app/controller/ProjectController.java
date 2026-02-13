package com.app.controller;

import com.app.dao.ProjectDAO;
import com.app.model.Project;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ProjectController")
@MultipartConfig
public class ProjectController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        // 2. Get image file
        Part imagePart = request.getPart("image");

        // Create unique filename (prevents overwrite)
        String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

        // 3. Upload path
        String uploadPath = getServletContext().getRealPath("/images/img/");

        // 4. Save image to server
        imagePart.write(uploadPath + fileName);

        // 5. Save data to DB
        Project project = new Project(name, description, fileName);
        ProjectDAO dao = new ProjectDAO();
        boolean status = dao.addProject(project);

        // 6. Redirect
        if (status) {
            response.sendRedirect("admin/addProject.jsp?msg=success");
        } else {
            response.sendRedirect("admin/addProject.jsp?msg=error");
        }
    }
}
