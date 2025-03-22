<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recognition Cards</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Work Sans", sans-serif;
        }
        body {
            background-color: #121212;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .navbar {
            width: 100%;
            background: #1e1e1e;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            margin: 0 15px;
            transition: color 0.3s;
        }
        .navbar a:hover {
            color: #0077b5;
        }
        .navbar .logo {
            font-size: 26px;
            font-weight: 800;
            color: #ffffff;
        }
        .menu {
            display: flex;
            align-items: center;
        }
        .signup {
            margin-right: 1.8rem;
            border-radius: 2rem;
            border: 1.5px solid transparent;
            background: #4227dd;
            color: #ffffff;
            font-weight: 600;
        }
        .signup:hover {
            background: #341cba;
        }
        
        .login {
            margin-right: 0.8rem;
            color: #ffffff;
            font-weight: 600;
            background: #4227dd;
            border-radius: 2rem;
            border: 1.5px solid transparent;
            
        }
        .login:hover {
            border: 1.8px solid #fafafa;
        }
        .login-btn, .signup-btn {
            color: #ffffff;
            text-decoration: none;
            
        }
        .login-btn:hover, .signup-btn:hover {
            text-decoration: none;
            
        }
        .link_item {
            margin-right: 2rem;
            font-weight: 600;
            text-decoration: none;
            position: relative;
        }
        .link_item:after {
            content: "";
            position: absolute;
            background-color: #4227dd;
            height: 3px;
            width: 0;
            left: 0;
            bottom: -0px;
            transition: 0.3s;
        }
        .link_item:hover:after {
            width: 100%;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            max-width: 1000px;
            margin-top: 20px;
        }
        .card {
            background: #1e1e1e;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            width: 250px;
            text-align: center;
            color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(255, 255, 255, 0.2);
        }
        .card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .card h3 {
            margin-bottom: 10px;
        }
        .card p {
            font-size: 14px;
            opacity: 0.8;
            margin-bottom: 10px;
        }
        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #0077b5;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background 0.3s;
        }
        .card a:hover {
            background-color: #005582;
        }
        @media (max-width: 768px) {
            .card-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="index.jsp" class="logo">Techno<span>Club</span></a>
        <div class="menu">
            <a href="aboutus.jsp" class="link_item">About Us</a>
            <a href="events.jsp" class="link_item">Events</a>
            <a href="recognition.jsp" class="link_item">Recognition</a>
            <button class="login"><a href="studentlogin.jsp" class="login-btn">Student LogIn</a></button>
            <button class="signup"><a href="adminlogin.jsp" class="signup-btn">Admin LogIn</a></button>
        </div>
    </nav>

<br><br>

    <div class="card-container">
        <div class="card">
            <img src="./image/indian1.jpg" alt="User">
            <h3>Aarav Mehta</h3>
            <p>President, Techno Club</p>
            <p>A visionary leader passionate about transforming student organizations through technology.</p>
            <a href="https://www.linkedin.com/in/johndoe" target="_blank">Connect</a>
        </div>

        <div class="card">
            <img src="./image/indianfe2.png" alt="User">
            <h3>Ishita Sharma</h3>
            <p>Admin, AWS Club</p>
            <p>A cloud computing enthusiast, Ishita actively organizes AWS workshops and hackathons.</p>
            <a href="https://www.linkedin.com/in/janesmith" target="_blank">Connect</a>
        </div>

        <div class="card">
            <img src="./image/aarav.jpg" alt="User">
            <h3>Rohan Patel</h3>
            <p>Admin, IEEE Club</p>
            <p>An electronics and AI aficionado, Rohan drives IEEE initiatives through technical events.</p>
            <a href="https://www.linkedin.com/in/mikejohnson" target="_blank">Connect</a>
        </div>

        <div class="card">
            <img src="./image/ishita.jpg" alt="User">
            <h3>Neha Verma</h3>
            <p>Admin, ACM Club</p>
            <p>A coding expert with a knack for algorithms, Neha manages ACM's programming contests.</p>
            <a href="https://www.linkedin.com/in/emilydavis" target="_blank">Connect</a>
        </div>

        <div class="card">
            <img src="./image/kabir.jpg" alt="User">
            <h3>Kabir Iyer</h3>
            <p>Admin, GDG Club</p>
            <p>A tech evangelist focused on Google's ecosystem, Kabir leads GDG events.</p>
            <a href="https://www.linkedin.com/in/chriswilson" target="_blank">Connect</a>
        </div>

        <div class="card">
            <img src="./image/indianfe1.png" alt="User">
            <h3>Simran Kaur</h3>
            <p>Admin, STIC Club</p>
            <p>A dynamic innovator passionate about startups and emerging technologies.</p>
            <a href="https://www.linkedin.com/in/sophiamartinez" target="_blank">Connect</a>
        </div>
    </div>
</body>
</html>