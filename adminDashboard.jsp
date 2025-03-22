<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Retrieve session for the club admin
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminId") == null) {
        response.sendRedirect("adminlogin.jsp?error=Please+login+first");
        return;
    }

    int adminId = (Integer) adminSession.getAttribute("adminId");
    String clubName = (String) adminSession.getAttribute("clubName");

    // Debugging: Ensure clubName is available
    System.out.println("DEBUG: clubName from session: " + clubName);

    // Fetch club name from DB if not found in session
    if (clubName == null) {
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
             PreparedStatement pst = con.prepareStatement("SELECT club_name FROM admins WHERE admin_id = ?")) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            pst.setInt(1, adminId);
            ResultSet rsClub = pst.executeQuery();
            
            if (rsClub.next()) {
                clubName = rsClub.getString("club_name");
                adminSession.setAttribute("clubName", clubName); // Store for future use
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

    // If clubName is still null, show error and prevent execution
    if (clubName == null) {
%>
        <div class="container mt-4">
            <div class="alert alert-warning">Club information not found. Please log in again.</div>
        </div>
<%
        return;
    }

    // Fetch applications for the logged-in club admin
    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
         PreparedStatement pst = con.prepareStatement("SELECT * FROM club_applications WHERE club_name = ? AND status = 'Pending'")) {

        pst.setString(1, clubName);
        ResultSet rs = pst.executeQuery();
%>

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
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <title>Pending Club Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            margin-bottom: 20px;
        }
        .card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            align-items: center;
            margin-left: 88px;
        }
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
    	font-size: 2.5rem;
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
		Pending <span><%= clubName %></span> Applications
	</div>
	<br>
	<p class="header_para">
		Review and manage student applications for your club with ease. Here, you can view pending applications, check student details, and take action by accepting or rejecting requests. Ensure you select the right candidates who align with your club’s vision and values. 
	</p>
<br><br>
    <div class="container mt-4">
        <div class="row">
            <%
                boolean hasApplications = false;
                while (rs.next()) {
                    hasApplications = true;
                    String applicantImage = rs.getString("image");
                    String defaultImage = "https://via.placeholder.com/100";
            %>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <div class="text-center">
                        <img src="image/<%= (applicantImage != null && !applicantImage.isEmpty()) ? applicantImage : defaultImage %>" class="mb-3">
                        <h5><%= rs.getString("full_name") %></h5>
                        <p><strong>Student ID:</strong> <%= rs.getString("student_id") %></p>
                        <p><strong>Age:</strong> <%= rs.getInt("age") %></p>
                        <p><strong>Semester:</strong> <%= rs.getInt("semester") %></p>
                        <p><strong>CGPA:</strong> <%= rs.getBigDecimal("cgpa") %></p>
                        <a href="<%= rs.getString("resume") %>" class="btn btn-primary mb-2" target="_blank">View Resume</a>
                        <form action="UpdateApplicationServlet" method="post">
                            <input type="hidden" name="applicationId" value="<%= rs.getInt("id") %>">
                            <input type="hidden" name="studentId" value="<%= rs.getString("student_id") %>">
                            <input type="hidden" name="fullName" value="<%= rs.getString("full_name") %>">
                            <input type="hidden" name="age" value="<%= rs.getInt("age") %>">
                            <input type="hidden" name="semester" value="<%= rs.getInt("semester") %>">
                            <input type="hidden" name="cgpa" value="<%= rs.getBigDecimal("cgpa") %>">
                            <input type="hidden" name="clubName" value="<%= rs.getString("club_name") %>">
                            <button type="submit" name="action" value="accept" class="btn btn-success me-2">Accept</button>
                            <button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
                if (!hasApplications) {
            %>
                <div class="text-center text-danger">No pending applications</div>
            <%
                }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
