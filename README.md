# PixelCraft Studio – Full Stack Java Web Application

PixelCraft Studio is a fully dynamic full-stack Java web application built using JSP, Servlets, and MVC architecture.  
The project focuses on clean structure, scalability, database integration, and real-world admin operations.

---

##  Project Overview

PixelCraft Studio is a database-driven web application that allows administrators to manage website content dynamically.  

It includes an Admin Panel for managing projects, clients, user inquiries, and newsletter subscriptions.

The system follows MVC architecture to maintain separation of concerns and scalable structure.

---

##  Key Highlights

- Built using Java (JSP + Servlets)
- MVC Architecture implementation
- Fully dynamic & database-driven website
- Structured folder organization
- Real-world admin content management
- Secure backend control for data handling

---

##  Tech Stack

- Java
- JSP
- Servlets
- MVC Architecture
- JDBC
- MySQL
- HTML
- CSS

---

##  Project Architecture (MVC)

The application follows the Model-View-Controller pattern:

- **Model** → Java Beans / Entity Classes
- **View** → JSP Pages
- **Controller** → Servlets
- **DAO Layer** → Database interaction using JDBC

---

##  Admin Panel Features

- Add Projects
- Delete Projects
- Add Clients
- Delete Clients
- View Contact Form Submissions
- View Newsletter Subscribers
- Manage dynamic website content
- Secure admin access

---

##  Frontend Features

- Clean & structured UI
- Dynamic content rendering
- User-friendly navigation
- Responsive layout (if implemented)

---

##  Database Integration

- MySQL database
- JDBC connectivity
- CRUD operations implemented
- Dynamic data rendering from database

---

##  Installation & Setup Guide

### 1️ Install Required Software

- JDK 8 or higher
- Apache Tomcat Server
- MySQL Server
- NetBeans / Eclipse (or any Java IDE)

---

### 2️ Configure Database

Create database:
```
CREATE DATABASE pixelcraft_db;
USE pixelcraft_db;
```

Import required tables (projects, clients, contacts, newsletter, etc.)

---

###  Configure Database Connection

Update database credentials in your DBConnection file:

```
String url = "jdbc:mysql://localhost:3306/pixelcraft_db";
String user = "root";
String password = "YOUR_PASSWORD";
```

---

###  Deploy on Tomcat

- Add project to server
- Start Tomcat
- Access via:


```
http://localhost:3306/PixelCraftStudio
```

---

##  How It Works

1. Users visit the website.
2. Content is fetched dynamically from the database.
3. Admin logs in to manage content.
4. All changes reflect immediately on the website.

---

##  Project Structure


```
PixelCraftStudio/
│
├── src/
│ ├── model/
│ ├── controller/
│ ├── dao/
│
├── web/
│ ├── jsp/
│ ├── css/
│ ├── assets/
│
└── WEB-INF/
```

---

##  Screenshots



https://github.com/user-attachments/assets/6f785061-b19d-43bd-a2b8-39791346f568



---

##  Learning Outcomes

This project helped strengthen my understanding of:

- Full-stack Java development
- MVC architecture implementation
- Servlet lifecycle & request handling
- Database connectivity using JDBC
- Admin workflow logic
- Dynamic content rendering

---

##  Developer

Piyush Prajapati  
Java Full Stack Developer  

---

##  Contact

Open to feedback, collaboration, and full-stack Java opportunities.
