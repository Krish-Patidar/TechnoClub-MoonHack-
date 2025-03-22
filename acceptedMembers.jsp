<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Retrieve session
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminId") == null) {
        response.sendRedirect("adminlogin.jsp?error=Please+login+first");
        return;
    }

    // Get club name from session
    String clubName = (String) adminSession.getAttribute("clubName");

    if (clubName == null) {
%>
        <div class="container mt-4">
            <div class="alert alert-warning">Club information not found. Please log in again.</div>
        </div>
<%
        return;
    }

    // Database connection
    String url = "jdbc:mysql://localhost:3306/technoclub";
    String username = "root";
    String password = "krrish@001#400";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // Query to get accepted members for the specific club
        String sql = "SELECT full_name, student_id, age, semester, cgpa, total_credit, total_events FROM club_members WHERE club_name = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, clubName);
        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
    <title>Accepted Members - <%= clubName %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            font-weight: bold;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        .table {
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table thead {
            background-color: #2c3e50;
            color: white;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
            transition: 0.3s ease-in-out;
        }
        .btn-primary {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            border-radius: 50px;
            background: #2c3e50;
            border: none;
            transition: 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background: #1a252f;
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
    .credit-btn {
    background-color: #28a745;  /* Green color */
    color: white;               /* White text */
    border: none;               /* Remove border */
    padding: 10px 15px;         /* Adjust padding */
    font-size: 16px;            /* Increase font size */
    font-weight: bold;          /* Make text bold */
    border-radius: 5px;         /* Rounded corners */
    cursor: pointer;            /* Pointer cursor on hover */
    transition: background 0.3s ease, transform 0.2s ease;
}

.credit-btn:hover {
    background-color: #218838;  /* Darker green on hover */
    transform: scale(1.05);     /* Slight zoom effect */
}

.credit-btn:active {
    background-color: #1e7e34;  /* Even darker green on click */
    transform: scale(0.95);     /* Slight shrink effect */
}

/* Modal Background */
.modal {
    display: none; /* Hide by default */
    position: fixed; 
    z-index: 1000; /* Ensures it appears on top */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
    justify-content: center;
    align-items: center;
}

/* Modal Content Box */
.modal-content {
    background: #fff;
    padding: 20px;
    width: 350px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    position: relative;
}

/* Heading */
.modal-content h3 {
    margin-bottom: 15px;
    color: #333;
}

/* Labels */
.modal-content label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
    text-align: left;
    color: #555;
}

/* Input Fields */
.modal-content input {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

/* Disabled Input Styling */
#student_id_display {
    background-color: #f0f0f0;
    cursor: not-allowed;
}

/* Submit & Cancel Buttons */
.modal-content button {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

/* Submit Button */
.modal-content button[type="submit"] {
    background-color: #28a745;  /* Green */
    color: white;
}

.modal-content button[type="submit"]:hover {
    background-color: #218838;
    transform: scale(1.05);
}

/* Cancel Button */
.close-btn {
    background-color: #dc3545;  /* Red */
    color: white;
    margin-top: 8px;
}

.close-btn:hover {
    background-color: #c82333;
    transform: scale(1.05);
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
  

    <div class="container">
    <div class="header">
		Accepted Members of <br><span><%= clubName %></span>!
	</div>
	<br>
	<p class="header_para">
		Welcome to the <%= clubName %> Club’s official members list! Here, you’ll find the brightest minds who have been selected to be a part of our prestigious club. These members have demonstrated exceptional skills, academic excellence, and a passion for technology and innovation. As part of IEEE, they will have the opportunity to collaborate on groundbreaking projects, participate in technical events, and grow as future leaders in the industry. We are proud to have them on board and look forward to their contributions in shaping the future of technology!
	</p>
    <br><br>

        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Student ID</th>
                    <th>Age</th>
                    <th>Semester</th>
                    <th>CGPA</th>
                    <th>Total Credit</th>
                    <th>Total Events</th>
                     <th>Give Credit</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("full_name") %></td>
                        <td><%= rs.getString("student_id") %></td>
                        <td><%= rs.getInt("age") %></td>
                        <td><%= rs.getInt("semester") %></td>
                        <td><%= rs.getBigDecimal("cgpa") %></td>
                        <td><%= rs.getInt("total_credit") %></td>
                        <td><%= rs.getInt("total_events") %></td>
                        <td>
                <button class="credit-btn" onclick="openCreditForm('<%= rs.getString("student_id") %>')">Give Credit</button>
            </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
  <!-- Credit Form Modal -->
    <div id="creditModal" class="modal">
        <div class="modal-content">
            <h3>Give Credit</h3>
            <form action="GiveCreditServlet" method="post">
                <input type="hidden" id="student_id" name="student_id">
                <label>Student ID:</label>
                <input type="text" id="student_id_display" disabled><br><br>
                
                <label>Event Number:</label>
                <input type="number" name="event_number" required><br><br>
                
                <label>Credit Points:</label>
                <input type="number" name="credit_points" required><br><br>
                
                <button type="submit">Submit</button>
                <button type="button" class="close-btn" onclick="closeCreditForm()">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function openCreditForm(studentId) {
            document.getElementById("student_id").value = studentId;
            document.getElementById("student_id_display").value = studentId;
            document.getElementById("creditModal").style.display = "flex";
        }

        function closeCreditForm() {
            document.getElementById("creditModal").style.display = "none";
        }
    </script>
    </div>

</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <div class="container mt-4">
            <div class="alert alert-danger">Error fetching members: <%= e.getMessage() %></div>
        </div>
<%
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
