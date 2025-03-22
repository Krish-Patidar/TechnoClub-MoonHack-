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
       .header{
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 4.5rem;
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
</head>
<body>
 <%
        HttpSession sessionObj = request.getSession(false);
        if (sessionObj == null || sessionObj.getAttribute("studentId") == null) {
            response.sendRedirect("studentlogin.jsp");
        }
        String studentId = (String) sessionObj.getAttribute("studentId");
        String fullName = (String) sessionObj.getAttribute("fullName");
        Integer age = (Integer) sessionObj.getAttribute("age");
        Integer semester = (Integer) sessionObj.getAttribute("semester");
    %>


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

  <div class="header">
		Welcome, <br> <span><%= fullName != null ? fullName : "Student" %></span>
	</div>
	<br><br>
	<p class="header_para">
		The Medi-Caps University Student Dashboard is an interactive platform that empowers students to engage beyond academics. It allows them to explore and join university clubs, track their contributions, and actively participate in extracurricular activities. Students can showcase their achievements, collaborate with peers, and stay updated on upcoming events and initiatives. With a user-friendly interface, the dashboard fosters a dynamic and engaging university experience, encouraging holistic development.
	</p>
<br>

<center>
        <button class="btn signup" type="submit"><a href="exploreClubs.jsp" class="signup-btn">Explore Clubs</a></button>
</center>
  
  
  
  
  </body>
</html>