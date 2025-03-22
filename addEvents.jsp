<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <title>Add Events</title>
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
    .form {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

form label {
    font-weight: bold;
    display: block;
    margin-top: 10px;
}

form input,
form select,
form textarea {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

form textarea {
    resize: vertical;
    min-height: 100px;
}

form button {
    width: 100%;
    padding: 10px;
    background-color: #4227dd;
    color: white;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    margin-top: 15px;
    cursor: pointer;
}

form button:hover {
    background-color: #381fc8;
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
		Effortlessly Organize and <span>Manage</span> Club Events
			</div>
	<br>
	<p class="header_para">
		Plan and manage your club’s upcoming events with ease! Use this section to add hackathons, tech talks, startup expos, and more. Simply fill in the details, upload an event image, and share it with participants. Ensure smooth coordination and engagement for every event you host! 
	</p>
<br><br>
    <form action="AddEventServlet" method="post" enctype="multipart/form-data" class="form">
        <label>Event Type:</label>
        <select name="eventType" required>
            <option value="Hackathon">Hackathon</option>
            <option value="TechTalk">Tech Talk</option>
            <option value="StartupExpo">Startup Expo</option>
        </select><br>

        <label>Event Name:</label>
        <input type="text" name="eventName" required><br>

        <label>Event Date:</label>
        <input type="date" name="eventDate" required><br>

        <label>Event Venue:</label>
        <input type="text" name="eventVenue" required><br>

        <label>Event Price:</label>
        <input type="text" name="eventPrice"><br>

        <label>Event Description:</label>
        <textarea name="eventDesc" required></textarea><br>

        <label>Host Club:</label>
        <input type="text" name="eventHostClub" required><br>

        <label>Coordinator Contact:</label>
        <input type="text" name="coordinatorContact" required pattern="[0-9]{10}" title="Enter a valid 10-digit phone number"><br>

        <label>Event Image:</label>
        <input type="file" name="image" accept="image/*" required><br>

        <button type="submit">Add Event</button>
    </form>
</body>
</html>
