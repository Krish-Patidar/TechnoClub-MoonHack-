<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Analytics Dashboard</title>
    <link rel="stylesheet" href="dashboard-style.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
    /* Main styles for the dashboard */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', Arial, sans-serif;
}

body {
  background-color: #f8f9fa;
  color: #333;
}

/* Header and navigation */
.header {
  background-color: white;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  padding: 12px 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: sticky;
  top: 0;
  z-index: 100;
}

.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  color: #333;
  font-weight: bold;
  font-size: 18px;
}

.logo-icon {
  background-color: #4e7bff;
  color: white;
  width: 28px;
  height: 28px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.nav-menu {
  display: flex;
  gap: 24px;
}

.nav-item {
  text-decoration: none;
  color: #666;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 5px;
}

.nav-item.active {
  color: #4e7bff;
  font-weight: 500;
}

.user-menu {
  display: flex;
  align-items: center;
  gap: 16px;
}

.icon-button {
  background: none;
  border: none;
  cursor: pointer;
  color: #666;
  font-size: 16px;
}

.user-profile {
  display: flex;
  align-items: center;
  gap: 8px;
}

.user-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background-color: #e9ecef;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #4e7bff;
  font-weight: bold;
}

.user-info {
  display: flex;
  flex-direction: column;
  font-size: 12px;
}

.user-name {
  font-weight: 500;
  font-size: 14px;
}

.user-email {
  color: #666;
}

/* Dashboard content */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 24px;
}

.dashboard-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.dashboard-title {
  color: #333;
}

.dashboard-subtitle {
  color: #666;
  font-size: 14px;
  font-weight: normal;
  margin-top: 4px;
}

.button-group {
  display: flex;
  gap: 12px;
}

.btn {
  padding: 8px 16px;
  border-radius: 6px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 6px;
}

.btn-primary {
  background-color: #4e7bff;
  color: white;
}

.btn-secondary {
  background-color: #7a5af8;
  color: white;
}

/* Cards grid */
.cards-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  margin-bottom: 24px;
}

.card {
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
  padding: 20px;
}

.card-header {
  color: #666;
  font-size: 12px;
  text-transform: uppercase;
  margin-bottom: 8px;
}

.card-title {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 6px;
}

.card-footer {
  margin-top: 12px;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 8px;
}

.card-stats {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.stat-bar {
  height: 60px;
  width: 8px;
  border-radius: 4px;
}

.increase-text {
  color: #28a745;
}

.increase-text-ai {
  color: #4e7bff;
}

.increase-text-events {
  color: #28a745;
}

.increase-text-performance {
  color: #8e24aa;
}

.bar-ai {
  background-color: #4e7bff;
}

.bar-events {
  background-color: #28a745;
}

.bar-performance {
  background-color: #8e24aa;
}

/* Actions and projects sections */
.bottom-grid {
  display: grid;
  grid-template-columns: 1fr 2fr;
  gap: 20px;
  margin-top: 24px;
}

.actions-card {
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
  padding: 20px;
}

.actions-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.progress-circle {
  width: 150px;
  height: 150px;
  position: relative;
  margin: 0 auto 20px;
}

.progress-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.progress-text {
  font-size: 28px;
  font-weight: bold;
  color: #4e7bff;
}

.actions-footer {
  text-align: center;
  color: #666;
  font-size: 14px;
  margin-bottom: 20px;
}

.action-button {
  width: 100%;
  padding: 8px;
  border: 1px solid #4e7bff;
  color: #4e7bff;
  background: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
}

.projects-card {
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
  padding: 20px;
}

.projects-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.projects-title {
  font-size: 16px;
  font-weight: 500;
}

.view-all {
  color: #4e7bff;
  text-decoration: none;
  font-size: 14px;
  display: flex;
  align-items: center;
  gap: 4px;
}

.project-table {
  width: 100%;
  border-collapse: collapse;
}

.project-table tr {
  border-bottom: 1px solid #f0f0f0;
}

.project-table tr:last-child {
  border-bottom: none;
}

.project-table td {
  padding: 12px 8px;
}

.project-name {
  display: flex;
  align-items: center;
  gap: 10px;
}

.project-icon {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}

.project-icon-nlp {
  background-color: #4e7bff;
}

.project-icon-vision {
  background-color: #ff7043;
}

.project-icon-support {
  background-color: #28a745;
}

.project-icon-analytics {
  background-color: #8e24aa;
}

.accuracy-tag {
  background-color: #4e7bff;
  color: white;
  font-size: 12px;
  padding: 2px 8px;
  border-radius: 12px;
}

.text-muted {
  color: #666;
  font-size: 14px;
}

/* Add circle progress animation */
svg.progress-ring {
  transform: rotate(-90deg);
  overflow: visible;
}

circle.progress-ring__circle {
  stroke-dasharray: 283;
  transition: stroke-dashoffset 0.5s;
  transform-origin: 50% 50%;
}

/* Responsive adjustments */
@media (max-width: 992px) {
  .cards-grid, .bottom-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 768px) {
  .nav-menu {
    display: none;
  }
}
    </style>
</head>
<body>
<%
    // Ensure session is active
    HttpSession sessionObj = request.getSession(true);
    // Retrieve student ID from session
    String studentId = (String) sessionObj.getAttribute("studentId");
    // If student ID is missing in session, try to get it from request (URL parameter)
    if (studentId == null || studentId.isEmpty()) {
        studentId = request.getParameter("student_id");
        // If student ID is found in request, store it in session
        if (studentId != null && !studentId.isEmpty()) {
            sessionObj.setAttribute("studentId", studentId);
            System.out.println("Debug: Stored Student ID in session - " + studentId);
        }
    }
    // Debugging output
    System.out.println("Debug: Session Student ID - " + (studentId != null ? studentId : "null"));
    int totalCredit = 0, totalEvents = 0;
    if (studentId != null && !studentId.isEmpty()) {
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/technoclub", "root", "krrish@001#400");
            // Fetch total_credit and total_events from database
            PreparedStatement stmt = conn.prepareStatement("SELECT total_credit, total_events FROM club_members WHERE student_id = ?");
            stmt.setString(1, studentId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalCredit = rs.getInt("total_credit");
                totalEvents = rs.getInt("total_events");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        out.println("<div class='error-message'>Error: Student ID is missing! Please login again.</div>");
    }
    
    // Calculate performance metric based on credit score
    String performanceRating = (totalCredit > 100) ? "Excellent" : (totalCredit > 50) ? "Good" : "Needs Improvement";
    int performanceCount = (totalCredit > 100) ? 137 : (totalCredit > 50) ? 98 : 45;
%>

    <!-- Header/Navigation -->
    <header class="header">
        <div class="logo">
            <div class="logo-icon"><i class="fas fa-chart-line"></i></div>
            AI Analytics
        </div>
        <nav class="nav-menu">
            <a href="student.jsp" class="nav-item"><i class="fas fa-home"></i> Home</a>
            <a href="exploreClubs.jsp" class="nav-item"><i class="fas fa-money-bill-wave"></i> Explore Clubs</a>
                        <a href="myClubs.jsp" class="nav-item"><i class="fas fa-money-bill-wave"></i> My Clubs</a>
            <a href="aicredit.jsp" class="nav-item active"><i class="fas fa-chart-bar"></i>AI Credit Points</a>
            <a href="studentprofile.jsp" class="nav-item"><i class="fas fa-calendar"></i> My Profile</a>
        </nav>
        <div class="user-menu">
            <button class="icon-button"><i class="fas fa-search"></i></button>
            <button class="icon-button"><i class="fas fa-bell"></i></button>
            <button class="icon-button"><i class="fas fa-comment"></i></button>
            <div class="user-profile">
                <div class="user-avatar">A</div>
                <div class="user-info">
                    <div class="user-name">Medicaps Student</div>
                    <div class="user-email">studentmu@edu.in</div>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="dashboard-header">
            <div>
                <h1 class="dashboard-title">AI Analytics Dashboard</h1>
                <h3 class="dashboard-subtitle">Monitor key metrics. Check reporting and review insights</h3>
            </div>
            <div class="button-group">
                <button class="btn btn-primary"><i class="fas fa-file-export"></i> Export</button>
                <button class="btn btn-secondary"><i class="fas fa-cog"></i> Settings</button>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="cards-grid">
            <!-- AI Credits Card -->
            <div class="card">
                <div class="card-header">AI CREDITS</div>
                <div class="card-content">
                    <div class="card-title"><%= totalCredit > 0 ? totalCredit : 8425 %></div>
                    <div class="card-footer">
                        <span class="increase-text-ai">15% more ai credits</span>
                    </div>
                </div>
                <div class="card-stats">
                    <div class="stat-bar bar-ai" style="height: 60px;"></div>
                    <div class="stat-bar bar-ai" style="height: 45px;"></div>
                </div>
            </div>

            <!-- Coordinated Events Card -->
            <div class="card">
                <div class="card-header">COORDINATED EVENTS</div>
                <div class="card-content">
                    <div class="card-title"><%= totalEvents > 0 ? totalEvents : 42 %></div>
                    <div class="card-footer">
                        <span class="increase-text-events">8% more coordinated events</span>
                    </div>
                </div>
                <div class="card-stats">
                    <div class="stat-bar bar-events" style="height: 50px;"></div>
                    <div class="stat-bar bar-events" style="height: 40px;"></div>
                </div>
            </div>

<!-- Performance Remarks Card -->
<div class="card">
    <div class="card-header">PERFORMANCE REMARKS</div>
    <div class="card-content"> 
        <div class="card-title">
            <%
                String remark = "";
                if (performanceCount > 100) {
                    remark = "Excellent";
                } else if (performanceCount > 80) {
                    remark = "Very Good";
                } else if (performanceCount > 60) {
                    remark = "Good";
                } else if (performanceCount > 40) {
                    remark = "Bad";
                } else {
                    remark = "Needs Improvement";
                }
            %>
            <%= remark %>
        </div>
        <div class="card-footer">
            <span class="increase-text-performance">12% more performance remarks</span>
        </div>
    </div>
</div>	
</div>

    

        <!-- Bottom Section -->
        <div class="bottom-grid">
            <!-- Actions Card -->
            <div class="actions-card">
                <div class="actions-header">
                    <h3>Actions needed</h3>
                    <i class="fas fa-ellipsis-h"></i>
                </div>
                <div class="progress-circle">
                    <svg class="progress-ring" width="150" height="150">
                        <circle class="progress-ring__circle" stroke="#e6e6e6" stroke-width="12" fill="transparent" r="65" cx="75" cy="75"/>
                        <circle class="progress-ring__circle" stroke="#4e7bff" stroke-width="12" fill="transparent" r="65" cx="75" cy="75" 
                            stroke-dasharray="408.4" stroke-dashoffset="106.2"/>
                    </svg>
                    <div class="progress-overlay">
                        <div class="progress-text">74%</div>
                    </div>
                </div>
                <div class="actions-footer">
                    3 actions remaining
                </div>
                <button class="action-button">View all actions</button>
            </div>

            <!-- Projects Card -->
            <div class="projects-card">
                <div class="projects-header">
                    <h3 class="projects-title">Clubs You've Applied To</h3>
                    <a href="#" class="view-all">See all applications <i class="fas fa-arrow-right"></i></a>
                </div>
                <table class="project-table">
                    <tr>
                        <td>
                            <div class="project-name">
                                <div class="project-icon project-icon-nlp"></div>
                                AWS Club
                            </div>
                        </td>
                        <td class="text-muted">Cloud Computing	</td>
                        <td class="text-muted">Updated 50 seconds ago</td>
                        <td><span class="accuracy-tag">87% shortlisted</span></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-name">
                                <div class="project-icon project-icon-vision"></div>
                                IEEE Club
                            </div>
                        </td>
                        <td class="text-muted">Engineering & Tech</td>
                        <td class="text-muted">Updated 1 hour ago</td>
                        <td><span class="accuracy-tag">92% selected</span></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-name">
                                <div class="project-icon project-icon-support"></div>
                                GDG Club
                            </div>
                        </td>
                        <td class="text-muted">Google Developer</td>
                        <td class="text-muted">Updated 1 hour ago</td>
                        <td><span class="accuracy-tag">80% shortlisted</span></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-name">
                                <div class="project-icon project-icon-analytics"></div>
                                ACM Club
                            </div>
                        </td>
                        <td class="text-muted">Computing Research</td>
                        <td class="text-muted">Updated 2 hour ago</td>
                        <td><span class="accuracy-tag">93% confirmed</span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script>
        // If you need any JavaScript functionality
        document.addEventListener('DOMContentLoaded', function() {
            // You can add any JavaScript functionality here
        });
    </script>
</body>
</html>