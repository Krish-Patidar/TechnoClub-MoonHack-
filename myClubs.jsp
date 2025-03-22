<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
    <title>Clubs You've Been Accepted Into</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        .club-card {
            display: inline-block;
            width: 300px;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin: 10px;
            text-align: center;
        }
        .club-card img {
            width: 100%;
            height: 150px;
            border-radius: 8px;
        }
        .club-card h3 {
            margin: 10px 0;
            color: #333;
        }
        .error {
            color: red;
            font-weight: bold;
        }
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
    	font-size: 2.7rem;
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
		Discover Your Clubs – Where <span>Passion</span> Meets Community, <br> 
	</div>
	<br>
	<p class="header_para">
		Welcome to your club space! Here, you’ll find the communities you’ve joined, each offering unique experiences, collaboration, and learning opportunities. Whether you're exploring new interests or deepening your expertise, your clubs are the gateway to innovation, networking, and growth. Stay engaged, participate in events, and make the most of your club journey!
	</p>
<br>

<center>
        <button class="btn signup" type="submit"><a href="exploreClubs.jsp" class="signup-btn">Explore Clubs</a></button>
</center>
  
  

<br><br>


<%
    // Retrieve studentId from request or session
    String studentId = request.getParameter("studentId");
    if (studentId == null || studentId.trim().isEmpty()) {
        studentId = (String) session.getAttribute("studentId");
    }

    if (studentId == null || studentId.trim().isEmpty()) {
%>
        <p class="error">Error: Student ID is missing. Please provide a valid student ID.</p>
<%
    } else {
        out.println("<p><strong>Student ID: </strong>" + studentId + "</p>");

        // Database connection
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");

            // Fetch clubs the student has been accepted into
            String query = "SELECT cm.club_name, cm.image FROM club_members cm WHERE cm.student_id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, studentId);
            rs = ps.executeQuery();

            boolean found = false;
%>
            <div class="container">
<%
            while (rs.next()) {
                found = true;
                String clubName = rs.getString("club_name");
                String clubImage = rs.getString("image") != null ? rs.getString("image") : "default.jpg"; // Fallback image
%>
                <div class="club-card">
                    <img src="<%= clubImage %>" alt="<%= clubName %>">
                    <h3><%= clubName %></h3>
                </div>
<%
            }

            if (!found) {
%>
                <p class="error">You have not been accepted into any clubs yet.</p>
<%
            }
%>
            </div>
<%
        } catch (Exception e) {
            out.println("<p class='error'>Database Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (ps != null) try { ps.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }
    }
%>

</body>
</html>
