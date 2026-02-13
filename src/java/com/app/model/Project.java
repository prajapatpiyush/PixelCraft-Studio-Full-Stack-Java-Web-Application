/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.app.model;

/**
 *
 * @author piyus
 */
public class Project
{
    private int id;
    private String name;
    private String description;
    private String image;

    // Default constructor
    public Project() 
    {
    }

    // Parameterized constructor
    public Project(String name, String description, String image)
    {
        this.name = name;
        this.description = description;
        this.image = image;
    }

    // Getters and Setters

    public int getId() 
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getImage() 
    {
        return image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }
}
