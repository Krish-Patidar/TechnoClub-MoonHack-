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
  <link rel="stylesheet" href="style.css" />
    <title>About Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            position: relative;
            height: 250px;
            text-align: center;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            overflow: hidden;
        }
        .header::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100vw;
            height: 33vh;
            background: url('https://www.medicaps.ac.in/resources/img/About--img/from-the-desk/1.%20Banner_11zon.jpg') no-repeat center center/cover;
            opacity: 0.5;
            z-index: -1;
        }
        .header h1, .header p {
            position: relative;
            color: black;
            background: rgba(255, 255, 255, 0.3);
            padding: 10px 20px;
            border-radius: 5px;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            background: #1E1E1E;
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content {
            display: flex;
            align-items: center;
        }
        .text {
            flex: 1;
        }
        .text h2 {
            color: #fff;
            font-weight: bolder;
        }
        .profile img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
    </style>
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
  
    <div class="header">
        
    </div>
    <div class="container">
        <div class="content">
            <div class="text">
                <h2>Chancellor's Message</h2>
                <p>As the Chancellor of Medi-Caps University, I strongly believe that innovation is the cornerstone of progress, and this hackathon serves as a platform to push the boundaries of student-led technology solutions. The challenge at hand—developing an intelligent, AI-powered platform for seamless student organization management—is not just about coding but about solving real-world inefficiencies through structured, scalable, and impactful solutions.<br><br>

                  This hackathon is an opportunity for participants to reimagine student engagement, governance, and operational transparency by leveraging modern technology. By creating a system where students and administrators can interact effortlessly, track AI-driven credit points, and streamline event management, we can enhance efficiency, recognition, and collaboration in student-led initiatives. <br><br>
                  
                  Chancellor Shri R.C. Mittal firmly believes in empowering young minds through knowledge, ethical values, and critical thinking. <br><br> His vision is to establish Medi-Caps University as a global hub for learning and research, fostering a culture of creativity, curiosity, and continuous growth.
                  
                  I encourage all participants to think beyond conventional methods, embrace innovative problem-solving approaches, and develop solutions that set new benchmarks in student organization management. This event is more than just a competition—it is a step toward digital transformation in academia, where technology fosters a connected, efficient, and future-ready student ecosystem.</p>
            </div>
            <br>
            <div class="profile">
                <img src="https://www.medicaps.ac.in/resources/img/About--img/from-the-desk/2.%20Chancellor%20Sir.JPG_11zon.jpg" alt="Chris Spring">
                <p><strong>Shri R.C. Mittal</strong><br>Chancellor of Medi-Caps</p>
            </div>
        </div>
    </div>
</body>
</html>