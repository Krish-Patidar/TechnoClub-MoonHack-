<%@ page import="java.sql.*" %>
<%@ page import="com.controller.DBConnection" %> 

<%
    String eventId = request.getParameter("event_id");
    String eventName = request.getParameter("event_name");
    String eventType = request.getParameter("event_type");

    if (eventId == null || eventName == null || eventType == null) {
        response.sendRedirect("events.jsp"); 
        return;
    }
%>

<html>
<head>
    <title>Register for <%= eventName %></title>
    <style>
form {
    max-width: 500px;
    background: #fff;
    padding: 20px;
    margin: 20px auto;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    font-family: Arial, sans-serif;
}

h2 {
    text-align: center;
    color: #333;
}

h3 {
    margin-top: 15px;
    color: #007bff;  /* Blue heading */
    border-bottom: 2px solid #007bff;
    padding-bottom: 5px;
    font-size: 18px;
}

label {
    display: block;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input[type="text"],
input[type="email"],
input[type="number"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    transition: 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="number"]:focus {
    border-color: #007bff;
    outline: none;
}

input[type="submit"] {
    width: 100%;
    background: #28a745;
    color: white;
    border: none;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

input[type="submit"]:hover {
    background: #218838;
    transform: scale(1.05);
}

@media (max-width: 600px) {
    form {
        max-width: 90%;
    }
}
    	
    </style>
</head>
<body>
    <h2>Register for <%= eventName %></h2>

    <% if ("Hackathon".equalsIgnoreCase(eventType)) { %>
        <form action="RegisterEventServlet" method="post">
            <input type="hidden" name="event_id" value="<%= eventId %>">
            <input type="hidden" name="event_type" value="Hackathon">
            
            <label>Team Name:</label>
            <input type="text" name="team_name" required><br>

            <h3>Team Leader</h3>
            <label>Name:</label> <input type="text" name="team_leader" required><br>
            <label>Email:</label> <input type="email" name="team_leader_email" required><br>
            <label>Contact No.:</label> <input type="text" name="team_leader_contact" required><br>
            <label>Year:</label> <input type="text" name="team_leader_year" required><br>

            <h3>Team Member 1</h3>
            <label>Name:</label> <input type="text" name="member1_name" required><br>
            <label>Email:</label> <input type="email" name="member1_email" required><br>
            <label>Contact No.:</label> <input type="text" name="member1_contact" required><br>
            <label>Year:</label> <input type="text" name="member1_year" required><br>

            <h3>Team Member 2</h3>
            <label>Name:</label> <input type="text" name="member2_name"><br>
            <label>Email:</label> <input type="email" name="member2_email"><br>
            <label>Contact No.:</label> <input type="text" name="member2_contact"><br>
            <label>Year:</label> <input type="text" name="member2_year"><br>

            <h3>Team Member 3</h3>
            <label>Name:</label> <input type="text" name="member3_name"><br>
            <label>Email:</label> <input type="email" name="member3_email"><br>
            <label>Contact No.:</label> <input type="text" name="member3_contact"><br>
            <label>Year:</label> <input type="text" name="member3_year"><br>

            <input type="submit" value="Register">
        </form>
    <% } else { %>
        <form action="RegisterEventServlet" method="post">
            <input type="hidden" name="event_id" value="<%= eventId %>">
            <input type="hidden" name="event_type" value="Other">

            <label>Name:</label> <input type="text" name="name" required><br>
            <label>Email:</label> <input type="email" name="email" required><br>
            <label>Contact No.:</label> <input type="text" name="contact" required><br>
            <label>Year:</label> <input type="text" name="year" required><br>
            <label>Resume (URL or file path):</label> <input type="text" name="resume"><br>

            <input type="submit" value="Register">
        </form>
    <% } %>

</body>
</html>
