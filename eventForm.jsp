<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Add Event</title>
</head>
<body>
    <h2>Add Event - <%= request.getParameter("type") %></h2>

    <form action="AddEventServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="eventType" value="<%= request.getParameter("type") %>">
        
        Image: <input type="file" name="image"><br><br>
        Event Name: <input type="text" name="eventName" required><br><br>
        Event Date: <input type="date" name="eventDate" required><br><br>
        Venue: <input type="text" name="eventVenue" required><br><br>
        Price Poll: <input type="text" name="eventPrice"><br><br>
        Short Description: <textarea name="eventDesc" required></textarea><br><br>
        Hosted By (Club): <input type="text" name="eventHostClub" required><br><br>
        Coordinator Contact: <input type="text" name="coordinatorContact" required><br><br>

        <button type="submit">Submit Event</button>
    </form>
</body>
</html>
