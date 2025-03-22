<%@ page import="java.sql.*" %>
<%@ page import="com.controller.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
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
    <title>Manage Participants</title>
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
    table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background: #4227dd;
    color: #fff;
    font-weight: bold;
}

tr:nth-child(even) {
    background: #f9f9f9;
}

tr:hover {
    background: #f1f1f1;
}

/* Centering the form inside the table cell */
td form {
    display: flex;
    justify-content: center;
    gap: 10px; /* Space between buttons */
}

button {
    padding: 8px 12px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

button[name="action"][value="accept"] {
    background: #28a745;
    color: #fff;
}

button[name="action"][value="reject"] {
    background: #dc3545;
    color: #fff;
}

button:hover {
    opacity: 0.9;
}
 .header{
    	text-align: center;
    	align-items: center;
    	justify-content: center;
    	font-size: 3.5rem;
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
   <a class="navbar-brand" href="studentDashboard.jsp">
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
		Manage <span>Participants</span> Efficiently
			</div>
	<br>
	<p class="header_para">
		Easily oversee and manage event participants with our streamlined dashboard. Accept or reject registrations with a single click, ensuring smooth coordination and organization. Keep track of participant details, maintain event integrity, and enhance engagement seamlessly.
	</p>
<br><br>

<table border="1">
    <tr>
        <th>Event</th>
        <th>Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Action</th>
    </tr>

    <%
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT r.reg_id, e.event_name, " +
                         "COALESCE(r.team_leader, r.name) AS participant_name, " +
                         "COALESCE(r.team_leader_email, r.email) AS email, " +
                         "COALESCE(r.team_leader_contact, r.contact) AS contact, " +
                         "r.status " +
                         "FROM registrations r " +
                         "JOIN events e ON r.event_id = e.id";

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int regId = rs.getInt("reg_id");
                    String eventName = rs.getString("event_name");
                    String participantName = rs.getString("participant_name");
                    String email = rs.getString("email");
                    String contact = rs.getString("contact");
                    String status = rs.getString("status");
    %>

    <tr>
        <td><%= eventName %></td>
        <td><%= participantName %></td>
        <td><%= email %></td>
        <td><%= contact %></td>
        <td>
            <% if (!"Accepted".equals(status) && !"Rejected".equals(status)) { %>
                <form action="ManageParticipantsServlet" method="post">
                    <input type="hidden" name="regId" value="<%= regId %>">
                    <button type="submit" name="action" value="accept">Accept</button>
                    <button type="submit" name="action" value="reject">Reject</button>
                </form>
            <% } else { %>
                <%= status %>
            <% } %>
        </td>
    </tr>

    <%
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

</table>

</body>
</html>
