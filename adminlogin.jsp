<%
    HttpSession adminSession = request.getSession();
    adminSession.setAttribute("adminLoginTime", new java.util.Date()); // Store login time
%>

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
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="studentlogin.css" />  
    <title>Medicaps Club Admin LogIn</title>
</head>

<body>


   <!-- navbar start -->

   <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="index.jsp"><span class="logo_color">Techno</span><span>Club</span></a>
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
          <a class="nav-link link_item" href="aboutus.jsp">About Us</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="events.jsp">Events</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link link_item" href="recognition.jsp">Recognition</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <button class="btn login" type="submit"><a href="studentlogin.jsp" class="login-btn">Student LogIn</a></button>
        <button class="btn signup" type="submit"><a href="adminlogin.jsp" class="signup-btn">Admin LogIn</a></button>
      </form>
    </div>
  </nav>


  <!-- navbar end -->

<br><br>

  <main>
    <div class="box">
      <div class="inner-box">
        <div class="forms-wrap">
          <form action="AdminLoginServlet" method="post" class="sign-in-form form">
            <div class="logo">
            </div>

            <div class="heading">
              <h2>Welcome, <br> 
            </h2>
             <h1 class="manager-name">Multi-Chapter Student Organizations
                                      </h1>
            			
              <h6>Don't have access?
                    </h6>
              <a href="#" class="togglee">Ask Admin for access

              </a>
            </div>
            
       <% if (request.getAttribute("error") != null) { %>
    <p style="color: red; text-align: center;" weight="400"><%= request.getAttribute("error") %></p>
<% } %>



		
            <div class="actual-form">
           
              <div class="input-wrap">
            
                <input
                  type="email"
                  minlength="4"
                  class="input-field"
                  autocomplete="off"
                    name="admin_email" required
                />
                <label>Club Email
              </div>

              <div class="input-wrap">
                <input
                  type="password"
                  minlength="4"
                  class="input-field"
                  autocomplete="off" 
                  name="admin_password" required                />
                <label>Password</label>
              </div>

              <input type="submit" value="Log In" class="sign-btn" />

              <p class="text">
                Forgot your password or login details?
<br>
                <a href="#">Request assistance
                </a>with signing in
              </p>
            </div>
          </form>
        </div>
        
        

        <div class="carousel">
          <div class="images-wrapper">
            <img src="./image/admin.jpg" class="image img-1 show" alt="" />
            <img src="./image/admin.jpg" class="image img-2" alt="" />
            <img src="./image/admin.jpg" class="image img-3" alt="" />
          </div>

          
        </div>
      </div>
    </div>
  </main>

  <br><br><br>
  <br><br><br><br><br><br>


  <!-- footer start -->


  <footer class="footer">
    <div class="container">
      <div class="roww">
        <div class="footer-col">
          <h4>Platform</h4>
          <ul>
            <li><a href="#">Apps</a></li>
            <li><a href="#">Data Sources</a></li>
            <li><a href="#">TechFusion AI</a></li>
            <li><a href="#">Security</a></li>
            <li><a href="#">Actions</a></li>
            <li><a href="#">Integrations</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>TechFusion For</h4>
          <ul>
            <li><a href="#">Business</a></li>
            <li><a href="#">Enterprise</a></li>
            <li><a href="#">IT & Engineering</a></li>
            <li><a href="#">Agencies</a></li>
            <li><a href="#">Field Teams</a></li>
            <li><a href="#">Operations</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Resources</h4>
          <ul>
            <li><a href="#">Hire an Expert</a></li>
            <li><a href="#">Become an Expert</a></li>
            <li><a href="#">Community</a></li>
            <li><a href="#">Events</a></li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Help Center</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>follow us</h4>
          <div class="social-links">
            <a href="https://www.instagram.com/accounts/login/" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://x.com/i/flow/login" target="_blank"><i class="fa-brands fa-x-twitter"></i></a>
            <a href="https://api.linkedin.com/login" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://github.com/login" target="_blank"><i class="fa-brands fa-github"></i></a>
          </div>
        </div>
      </div>
    </div>
    <hr width="100%" size="2" color="#555255" class="hrline">
    <center>
      <h3 class="copyright"> © 2024 TechFusion. All Rights Reserved. Created by Krish Patidar.
      </h3>
    </center>
  </footer>

  <!-- footer end -->

  
  




  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
  crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/a81368914c.js"></script>

<script src="https://unpkg.com/scrollreveal"></script>

<script src="main.js"></script>

<script src="manager.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
	var status = document.getElementbyId("status").value;
	if(status == "failed"){
		swal("Sorry", "Wrong Username or Password", "failed");
	}
</script>


</body>
</html>
































    