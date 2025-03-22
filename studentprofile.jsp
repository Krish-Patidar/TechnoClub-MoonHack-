<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
    <title>My Profile</title>
    <style>
    body{
    	background-image: none;
    }
    .navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link{
    	color: #000;
    }
    .welcome{
    	text-align:center;
    	align-items: center;
    	justify-content: center;
    	margin-left: 30rem;
    	font-size: 1.5rem;
    	font-weight: bolder;
    }
     .techno{
    	margin-left: 18px;
    }
    
        /* Center the profile section */
    .profile-container {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    /* Profile Header */
    .profile-container h2 {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #333;
    }

    /* Form Styling */
    .profile-container form {
        display: flex;
        flex-direction: column;
    }

    /* Label Styling */
    .profile-container label {
        font-weight: 600;
        margin-bottom: 5px;
        color: #444;
    }

    /* Input Fields */
    .profile-container input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    /* Readonly Input Field */
    .profile-container input[readonly] {
        background: #e9ecef;
        cursor: not-allowed;
    }

    /* Input Field Focus Effect */
    .profile-container input:focus {
        border-color: #007bff;
        outline: none;
    }

    /* Submit Button */
    .profile-container button {
        background: #4227dd;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }

    /* Button Hover Effect */
    .profile-container button:hover {
        background: #341eb0;
    }
    
    .header{
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 2.8rem;
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
</a>    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
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
		Your Profile - Personalize Your <span>TechnoClub</span> Experience
	</div>
	<br>
	<p class="header_para">
		Welcome to your profile! Here, you can view and update your personal details to keep your TechnoClub journey seamless. Stay connected with your clubs, track your progress, and make the most of your student experience. Keep your information up to date and continue exploring exciting opportunities within the community!
	</p>
<br>
<br>

    <div class="profile-container">
    <h2>Student Profile</h2>
    <form action="UpdateStudentServlet" method="post">
        <label>Student ID (Not Editable):</label>
        <input type="text" name="studentId" value="<%= studentId %>" readonly>

        <label>Full Name:</label>
        <input type="text" name="fullName" value="<%= fullName != null ? fullName : "" %>" required>

        <label>Age:</label>
        <input type="number" name="age" value="<%= age != null ? age : "" %>" required>

        <label>Semester:</label>
        <input type="number" name="semester" value="<%= semester != null ? semester : "" %>" required>

        <button type="submit">Save Details</button>
    </form>
</div>

</body>
</html>
