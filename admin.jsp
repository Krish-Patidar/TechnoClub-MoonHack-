<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminId") == null) {
        response.sendRedirect("adminlogin.jsp?error=Please+login+first");
        return;
    }

    int adminId = (Integer) adminSession.getAttribute("adminId");
    String clubName = (String) adminSession.getAttribute("clubName");

    // 🛠️ Debugging: Print clubName to check if it's null
    System.out.println("DEBUG: clubName from session: " + clubName);

    // Fetch clubName from database if it's null
    if (clubName == null) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
             PreparedStatement pst = con.prepareStatement("SELECT club_name FROM admins WHERE admin_id = ?")) {
             
            Class.forName("com.mysql.cj.jdbc.Driver");
            pst.setInt(1, adminId);
            ResultSet rsClub = pst.executeQuery();
            if (rsClub.next()) {
                clubName = rsClub.getString("club_name");
                adminSession.setAttribute("clubName", clubName); // Store in session for future use
            }
            rsClub.close();
        } catch (Exception e) {
            e.printStackTrace();
%>
            <div class="container mt-4">
                <div class="alert alert-danger">Error fetching club information. Please contact support.</div>
            </div>
<%
            return;
        }
    }

    // Check if clubName is still null
    if (clubName == null) {
%>
        <div class="container mt-4">
            <div class="alert alert-warning">Club information not found. Please log in again.</div>
        </div>
<%
        return;
    }

    // Database connection to fetch pending applications
    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
         PreparedStatement pst = con.prepareStatement("SELECT * FROM club_applications WHERE club_name = ? AND status = 'Pending'")) {
        
        pst.setString(1, clubName);
        ResultSet rs = pst.executeQuery();
%>

<%
    // Retrieve login time from session
    java.util.Date adminLoginTime = (java.util.Date) adminSession.getAttribute("adminLoginTime");
%>

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
  <link rel="stylesheet" href="style.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Admin Dashboard</title>
      <style>
    body{
    	background-image: none;
    }
    .navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link{
    	color: #000;
    }
    .signup{
    	background: #4227dd;
    	border-radius: 20px;
    	text-decoration-line: none;
    
    }
     .signup a{
    	text-decoration-line: none;
    
    }
    .signup:hover{
    	background: #381fc8;
    	text-decoration: none;
    	border-radius: 20px;
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

<nav class="navbar navbar-expand-lg navbar-light">
   <a class="navbar-brand" href="admin.jsp">
    <img src="image/technoclub.webp" alt="TechnoClub Logo" height="100" class="techno">
</a>

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
          <a class="nav-link link_item" href="adminDashboard.jsp">Applications</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="acceptedMembers.jsp">Club Members</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="addEvents.jsp">Add Events</a>
        </li>
           <li class="nav-item active">
          <a class="nav-link link_item" href="manageParticipants.jsp">Manage Participants</a>
        </li>
         <li class="nav-item active">
          <a class="nav-link link_item" href="admincredit.jsp">Give AI Credits</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn signup" type="submit"><a href="AdminLogout" class="signup-btn">Logout</a></button>
      </form>
    </div>
  </nav>
  
  



<div class="header">
		Welcome, <br> <span><%= clubName %></span> Admin
	</div>
	<br>
	<p class="header_para">
		An Admin plays a crucial role in managing and overseeing the operations of their assigned club. They are responsible for handling member registrations, reviewing and updating applications, organizing events, and ensuring smooth communication between club members. Admins also have access to important management features, such as updating club details, moderating discussions, and maintaining records. With exclusive privileges, they help drive engagement, promote activities, and enhance the overall experience for members. Their leadership and decision-making ensure the club runs efficiently, fostering a collaborative and dynamic environment for all participants. 
	</p>
<center>
    <div class="alert">
        <strong>Dashboard Accessed:</strong> <%= adminLoginTime != null ? adminLoginTime.toString() : "Not Available" %>
    </div>
</center>


<center>
        <button class="btn signup" type="submit"><a href="admincredit.jsp" class="signup-btn">AI Credit System</a></button>
</center>





<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>

  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/scrollreveal"></script>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>

  <script src="main.js"></script>
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <div class="container mt-4">
            <div class="alert alert-danger">Error fetching applications.</div>
        </div>
<%
    }
%>
