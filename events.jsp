<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, com.controller.DBConnection" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
      href="https://fonts.googleapis.com/css2?family=Concert+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lilita+One&family=Permanent+Marker&family=Radio+Canada+Big:ital,wght@0,400..700;1,400..700&family=Stylish&family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap"
      rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="studentlogin.css" />  
    <title>Events</title>
    <style>
    .event-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    padding: 20px;
}

.event-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* Ensures proper spacing */
    gap: 20px;
    padding: 20px;
}

.event-card {
    background-color: #1E1E1E;
    color: white;
    border-radius: 10px;
    padding: 20px;
    width: calc(33.33% - 20px); /* Ensures 3 cards per row */
    max-width: 350px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
    transition: transform 0.3s ease-in-out;
}

.event-card:hover {
    transform: scale(1.05);
}

.event-card img {
    width: 100%;
    border-radius: 10px;
}

/* Responsive Design */
@media (max-width: 1024px) {
    .event-card {
        width: calc(50% - 20px); /* Two cards per row */
    }
}

@media (max-width: 768px) {
    .event-card {
        width: 100%; /* One card per row */
    }
}
   .header{
   		color: #fff;
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 3.5rem;
    	font-weight: bolder;
    }
    .header_para{
    	text-align: center;
    	align-items: center;
    	color: #fff;
    	justify-content: center;
    	font-size: 1rem;
    	font-weight: bolder;
    }
    
    </style>
</head>

<body>


   <!-- navbar start -->

   <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="index.jsp"><span class="logo_color">Techno</span><span>Club</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <div id="menuToggle">
        <input id="checkbox" type="checkbox">
        <label class="toggle" for="checkbox">
          <div class="bar bar--top"></div>
          <div class="bar bar--middle"></div>
          <div class="bar bar--bottom"></div>
        </label>
      </div>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto link_group">
        <li class="nav-item active">
          <a class="nav-link link_item" href="aboutus.jsp">About Us</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="events.jsp">Events</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="recognition.jsp">Recognition</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn login" type="submit"><a href="studentlogin.jsp" class="login-btn">Student LogIn</a></button>
        <button class="btn signup" type="submit"><a href="adminlogin.jsp" class="signup-btn">Admin LogIn</a></button>
      </form>
    </div>
  </nav>

<br><br>

<div class="header">
		Upcoming Tech <span>Events</span> & Workshops
	</div>
	<br>
	<p class="header_para">
		 Stay ahead in the world of technology with our exclusive events, hackathons, and workshops! Connect with like-minded innovators, enhance your skills, and experience the latest trends in tech. Don’t miss out—explore and register today!
	</p>
<div class="event-container"> <!-- Place this outside the loop -->
    <%
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM events")) {
            while (rs.next()) {
    %>
        <div class="event-card">
            <img src="<%= rs.getString("image") %>" width="200">
            <br>
            <h3><%= rs.getString("event_name") %></h3>
            <p><strong>Date:</strong> <%= rs.getString("event_date") %></p>
            <p><strong>Venue:</strong> <%= rs.getString("event_venue") %></p>
            <p><strong>Hosted By:</strong> <%= rs.getString("event_host_club") %></p>
           <button class="signup btn"> <a href="registerEvents.jsp?event_id=<%= rs.getInt("id") %>
            &event_name=<%= java.net.URLEncoder.encode(rs.getString("event_name"), "UTF-8") %>
            &event_type=<%= rs.getString("event_type") %>" class="signup-btn">Register</a></button>
            <button class="signup btn"><a href="#" class="signup-btn">More Details</a></button>
        </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</div> 
</body>
</html>
