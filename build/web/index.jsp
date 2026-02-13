<%@ page import="java.util.List" %>
<%@ page import="com.app.dao.ProjectDAO" %>
<%@ page import="com.app.dao.ClientDAO" %>
<%@ page import="com.app.model.Project" %>
<%@ page import="com.app.model.Client" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PixelCraft Studio</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- ICONS -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded" rel="stylesheet">
</head>
<body>

<!-- ================= HEADER ================= -->
<header class="header">
    <div class="container header-flex">

        <div class="brand-wrap">
            
            <h2 class="brand">PixelCraft</h2>
        </div>

        <nav class="main-nav">
            <a href="#">Home</a>
            <a href="#services">Solutions</a>
            <a href="#projects">Work</a>
            <a href="#clients">Reviews</a>
            <a href="admin/dashboard.jsp" class="admin-btn">Admin</a>
        </nav>

    </div>
</header>

<!-- ================= HERO ================= -->
<section class="hero">
    <div class="container hero-grid">

        <div class="hero-text">
            <span class="hero-badge">Digital Product Studio</span>

            <h1>
                We Design & Build <br>
                <span>High-Quality Software</span>
            </h1>

            <p>
                PixelCraft helps startups and businesses build
                scalable, modern and user-friendly digital products.
            </p>

            <div class="hero-actions">
                <button class="orange-btn">Get Proposal</button>
                <a href="#projects" class="outline-btn">See Our Work</a>
            </div>
        </div>

        <div class="hero-media">
            <img
                src="https://images.unsplash.com/photo-1559028012-481c04fa702d?w=900&auto=format&fit=crop&q=60"
                alt="Software dashboard UI">
        </div>

    </div>
</section>

<!-- ================= PROCESS / APPROACH (NEW) ================= -->
<section class="section approach">
    <div class="container">

        <h2 class="section-title">Our Approach</h2>

        <div class="approach-grid">

            <div class="approach-item">
                <span class="material-symbols-rounded approach-icon">lightbulb</span>
                <h4>Understand the Problem</h4>
                <p>
                    We start by understanding your business goals,
                    users, and technical requirements in depth.
                </p>
            </div>

            <div class="approach-item">
                <span class="material-symbols-rounded approach-icon">architecture</span>
                <h4>Design the Solution</h4>
                <p>
                    Clean system design, scalable architecture
                    and user-focused interfaces.
                </p>
            </div>

            <div class="approach-item">
                <span class="material-symbols-rounded approach-icon">rocket_launch</span>
                <h4>Build & Launch</h4>
                <p>
                    Fast, reliable development with testing,
                    deployment and post-launch support.
                </p>
            </div>

        </div>

    </div>
</section>

<!-- ================= SERVICES ================= -->
<section class="section" id="services">
    <div class="container">

        <h2 class="section-title">What We Do</h2>

        <div class="service-grid">

            <div class="service-card">
                <span class="material-symbols-rounded service-icon">developer_mode</span>
                <h4>Product Engineering</h4>
                <p>
                    Robust backend systems and clean architectures
                    designed to scale with your business.
                </p>
            </div>

            <div class="service-card">
                <span class="material-symbols-rounded service-icon">palette</span>
                <h4>UI / UX Design</h4>
                <p>
                    Human-centered design focused on usability,
                    clarity and conversion.
                </p>
            </div>

            <div class="service-card">
                <span class="material-symbols-rounded service-icon">cloud_done</span>
                <h4>Cloud & Deployment</h4>
                <p>
                    Secure cloud deployments, monitoring and
                    performance optimization.
                </p>
            </div>

        </div>
    </div>
</section>

<!-- ================= ABOUT ================= -->
<section class="section about-split">
    <div class="container about-grid">

        <div class="about-media">
            <img
                src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=800&auto=format&fit=crop&q=60"
                alt="Team working together">
        </div>

        <div class="about-text">
            <h2>Why Choose PixelCraft</h2>

            <p>
                We don?t just deliver features ? we build
                reliable systems that support long-term growth.
            </p>

            <ul class="about-points">
                <li>Clean & scalable architecture</li>
                <li>Clear communication & agile workflow</li>
                <li>Long-term technical support</li>
            </ul>
        </div>

    </div>
</section>

<!-- ================= PROJECTS (DB) ================= -->
<section class="section gray" id="projects">
    <div class="container">

        <h2 class="section-title">Selected Projects</h2>

        <div class="card-grid">
            <%
                ProjectDAO projectDAO = new ProjectDAO();
                List<Project> projects = projectDAO.getAllProjects();
                for(Project p : projects){
            %>
            <div class="project-card">
                <img src="images/img/<%= p.getImage() %>">
                <div class="project-content">
                    <h4><%= p.getName() %></h4>
                    <p><%= p.getDescription() %></p>
                </div>
            </div>
            <%
                }
            %>
        </div>

    </div>
</section>

<!-- ================= CLIENTS (DB) ================= -->
<section class="section" id="clients">
    <div class="container">

        <h2 class="section-title">Client Feedback</h2>

        <div class="card-grid">
            <%
                ClientDAO clientDAO = new ClientDAO();
                List<Client> clients = clientDAO.getAllClients();
                for(Client c : clients){
            %>
            <div class="client-card">
                <span class="material-symbols-rounded quote-icon">format_quote</span>
                <p><%= c.getDescription() %></p>
                <h4><%= c.getName() %></h4>
                <span class="client-role"><%= c.getDesignation() %></span>
            </div>
            <%
                }
            %>
        </div>

    </div>
</section>

<!-- ================= CTA ================= -->
<section class="cta-modern">
    <div class="container cta-grid">

        <div class="cta-text">
            <h2>Let?s Build Something Great</h2>
            <p>
                Share your idea and we?ll help you
                turn it into a scalable digital product.
            </p>

            <ul class="cta-points">
                <li>Free consultation</li>
                <li>Clear technical roadmap</li>
                <li>No obligation</li>
            </ul>
        </div>

        <form action="ContactController" method="post" class="cta-form-modern">
            <input type="hidden" name="action" value="add">

            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="mobile" placeholder="Mobile Number" required>
            <input type="text" name="city" placeholder="City / Location" required>

            <button type="submit">Request Consultation</button>
        </form>

    </div>
</section>

<!-- ================= FOOTER ================= -->
<footer class="footer-modern">
    <div class="container footer-grid">

        <div class="footer-brand">
            <h3>PixelCraft</h3>
            <p>
                Building modern digital products with
                performance, clarity and scalability.
            </p>
        </div>

        <div class="footer-links">
            <h4>Navigation</h4>
            <a href="#">Home</a>
            <a href="#services">Services</a>
            <a href="#projects">Projects</a>
            <a href="#clients">Clients</a>
        </div>

        <div class="footer-newsletter">
            <h4>Newsletter</h4>
            <form action="SubscriberController" method="post">
                <input type="hidden" name="action" value="add">
                <input type="email" name="email" placeholder="Your email" required>
                <button type="submit">Subscribe</button>
            </form>
        </div>

    </div>

    <div class="footer-bottom">
        <p>© 2025 PixelCraft Studio. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
