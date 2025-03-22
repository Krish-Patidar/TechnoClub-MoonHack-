<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="solutions.css" />
  <title>Admin Navbar</title>
  <style>
  
  
 
.notifications-dropdown {
  display: none;
  position: absolute;
  top: 20px;
  right: 0;
  width: 300px;
  background-color: #fff;
  border: 1px solid #ccc;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  z-index: 1000;
  padding: 10px;
  border-radius: 8px;
}

.cardd {
  display: flex;
  align-items: center;
  padding: 10px;
  border-bottom: 1px solid #f1f1f1;
}

.container {
  display: flex;
  align-items: center;
}

.left .status-ind {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #28a745; 
}

.right {
  display: flex;
  flex-direction: column;
  margin-left: 10px;
}

.text-content {
  font-size: 14px;
  margin: 0;
}

.text-link {
  color: #007bff;
  text-decoration: none;
}

.time {
  font-size: 12px;
  color: #6c757d;
}

.button-wrap {
  display: flex;
  gap: 5px;
  margin-top: 5px;
}

.primary-cta, .secondary-cta {
  padding: 5px 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.primary-cta {
  background-color: #007bff;
  color: #fff;
}

.secondary-cta {
  background-color: #e9ecef;
  color: #000;
}

.primary-cta:hover, .secondary-cta:hover {
  opacity: 0.8;
}
  
  </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="managerpage.jsp"><span class="logo_color">Techno</span><span>Club</span></a>
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
        <a class="nav-link link_item" href="managerpage.jsp">Reports & Analytics</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link link_item" href="emplymanage.jsp">Applications</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link link_item" href="tasks.jsp">Manage Members</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link link_item" href="attritionPrediction.jsp">AI Credit System</a>
      </li>
    </ul>
   <form class="form-inline my-2 my-lg-0">
  <button class="btnn btn" type="button" data-toggle="tooltip" data-placement="bottom" title="Profile" onclick="window.location.href='managerprofile.jsp'">
    <i class="fa-solid fa-user" style="color: #000000;"></i>
  </button>
</form>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<form class="form-inline my-2 my-lg-0">
  <button class="btn signup" type="button" onclick="window.location.href='AdminLogout'">Log Out</button>
</form>

  </div>
</nav>

 
  </div>
</div>



  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>

  <script src="https://kit.fontawesome.com/a81368914c.js"></script>

  <script src="https://unpkg.com/scrollreveal"></script>

  <script src="main.js"></script>
  <script>
  $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})

  </script>
  
    <script>
        function showNotifications() {
  document.getElementById("notificationsDropdown").style.display = "block";
}

function hideNotifications() {
  document.getElementById("notificationsDropdown").style.display = "none";
}

      </script>
	
  
  


</body>
</html>