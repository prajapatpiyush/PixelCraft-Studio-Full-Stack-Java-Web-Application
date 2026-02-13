/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.dao;
import com.app.model.Subscriber;
import com.db.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author piyus
 */
public class SubscriberDAO 
{
    public boolean addSubscriber(Subscriber s) {
        boolean status = false;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO subscribers(email) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getEmail());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Subscriber> getAllSubscribers() {
        List<Subscriber> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM subscribers";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Subscriber s = new Subscriber();
                s.setId(rs.getInt("id"));
                s.setEmail(rs.getString("email"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
