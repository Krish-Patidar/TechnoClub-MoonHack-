<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
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
  <link rel="stylesheet" href="style.css" />
    <title>Explore Clubs</title>
    
    <style>
    body{
    	background-image: none;
    }
    .navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link{
    	color: #000;
    }
    
    .techno{
    	margin-left: 18px;
    }
    
    .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* Center cards in a row */
    gap: 20px; /* Space between cards */
    margin-top: 20px;
}

.club-card {
    width: 30%; /* Each card takes about 30% of the width */
    background: #DCDAF6;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    padding: 15px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
}

.club-card:hover {
    transform: translateY(-5px); /* Slight lift effect on hover */
}

.club-card img {
    width: 100%;
    height: 200px; /* Fixed height for uniform images */
    object-fit: cover;
    border-radius: 10px;
}

.club-card h3 {
    font-size: 20px;
    margin-top: 10px;
    color: #333;
    font-weight: bold;
}

.club-card p {
    font-size: 14px;
    color: #666;
    margin: 10px 0;
}

.club-card a {
    display: inline-block;
    background-color: #4227dd;
    color: #fff;
    padding: 8px 15px;
    text-decoration: none;
    border-radius: 20px;
    font-weight: 600;
    font-family: "Work Sans", sans-serif";
    transition: background 0.3s ease-in-out;
}

.club-card a:hover {
    background-color: #331eae;
}

/* Responsive Grid */
@media (max-width: 992px) {
    .club-card {
        width: 45%; /* Two cards per row on medium screens */
    }
}

@media (max-width: 600px) {
    .club-card {
        width: 90%; /* Single card per row on small screens */
    }
}

.header{
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 3.2rem;
    	font-weight: bolder;
    }
    .header_para{
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 1rem;
    	font-weight: bolder;
    }
    </style>
    
    
       <script>
        window.onload = function() {
            var successMessage = '<%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %>';
            var errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';

            if (successMessage) {
                alert(successMessage);
            }
            if (errorMessage) {
                alert(errorMessage);
            }
        };
    </script>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light">
<a class="navbar-brand" href="student.jsp">
    <img src="image/technoclub.webp" alt="TechnoClub Logo" height="100" class="techno">
</a>      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
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
          <a class="nav-link link_item" href="exploreClubs.jsp">Explore Clubs</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="MyClubsServlet">My Clubs</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="studentprofile.jsp">My Profile</a>
        </li>
           <li class="nav-item active">
          <a class="nav-link link_item" href="aicredit.jsp">AI Credit Points</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn signup" type="submit"><a href="StudentLogout" class="signup-btn">Logout</a></button>
      </form>
    </div>
  </nav>


<br>



<div class="header">
		Discover & Join Exciting Clubs at<span>TechnoClub</span>!
	</div>
	<br>
	<p class="header_para">
		At TechnoClub, we believe in the power of community and shared passion. Whether you're into coding, robotics, design, entrepreneurship, or cultural activities, there's a club for you! Explore our diverse clubs, connect with like-minded peers, and enhance your skills beyond the classroom. Join a club today and be a part of something bigger!
	</p>
<br>
<br>
    <div class="container">
        <%
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM clubs");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
        %>
        <div class="club-card">
<img src="<%= request.getContextPath() + "/" + rs.getString("club_image") %>" alt="<%= rs.getString("club_name") %>">
            <h3><%= rs.getString("club_name") %></h3>
            <p><%= rs.getString("club_desc") %></p>
            <a href="joinClubForm.jsp?clubId=<%= rs.getInt("club_id") %>">Join Club</a>
        </div>
        <% } con.close(); %>
    </div>
</body>
</html>
