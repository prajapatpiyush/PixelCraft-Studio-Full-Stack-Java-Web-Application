package com.app.dao;

import com.app.model.Project;
import com.db.connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    // INSERT project into database
    public boolean addProject(Project project) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO projects(name, description, image) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getImage());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // FETCH all projects from database
    public List<Project> getAllProjects() {
        List<Project> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM projects";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Project p = new Project();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ DELETE project by ID
    public boolean deleteProject(int id) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM projects WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
