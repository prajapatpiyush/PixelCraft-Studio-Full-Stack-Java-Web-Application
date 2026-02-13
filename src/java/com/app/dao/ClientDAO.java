package com.app.dao;

import com.app.model.Client;
import com.db.connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {

    // INSERT client
    public boolean addClient(Client client) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO clients(name, description, designation, image) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, client.getName());
            ps.setString(2, client.getDescription());
            ps.setString(3, client.getDesignation());
            ps.setString(4, client.getImage());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // FETCH all clients
    public List<Client> getAllClients() {
        List<Client> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM clients";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Client c = new Client();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setDesignation(rs.getString("designation"));
                c.setImage(rs.getString("image"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ DELETE client by ID
    public boolean deleteClient(int id) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM clients WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
