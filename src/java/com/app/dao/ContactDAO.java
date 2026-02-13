/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.dao;

import com.app.model.Contact;
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
public class ContactDAO 
{
    public boolean addContact(Contact contact) {
        boolean status = false;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO contacts(full_name, email, mobile, city) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMobile());
            ps.setString(4, contact.getCity());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Contact> getAllContacts() {
        List<Contact> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM contacts";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Contact c = new Contact();
                c.setId(rs.getInt("id"));
                c.setFullName(rs.getString("full_name"));
                c.setEmail(rs.getString("email"));
                c.setMobile(rs.getString("mobile"));
                c.setCity(rs.getString("city"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
