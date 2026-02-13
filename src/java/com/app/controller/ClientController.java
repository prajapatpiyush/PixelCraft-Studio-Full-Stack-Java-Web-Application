package com.app.controller;

import com.app.dao.ClientDAO;
import com.app.model.Client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ClientController")
@MultipartConfig
public class ClientController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String designation = request.getParameter("designation");

        // IMAGE PART
        Part imagePart = request.getPart("image");

        // Unique filename
        String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();

        // Upload path
        String uploadPath = getServletContext().getRealPath("/images/img/");

        // Save image
        imagePart.write(uploadPath + fileName);

        // Save to DB
        Client client = new Client(name, description, designation, fileName);
        ClientDAO dao = new ClientDAO();

        if (dao.addClient(client)) {
            response.sendRedirect("admin/addClient.jsp?msg=success");
        } else {
            response.sendRedirect("admin/addClient.jsp?msg=error");
        }
    }
}
