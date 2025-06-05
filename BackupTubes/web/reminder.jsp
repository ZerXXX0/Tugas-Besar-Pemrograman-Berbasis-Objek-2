<%--
    Document   : reminder
    Created on : June 5, 2025, 2:00:00 PM WIB
    Author     : Fathan Fardian Sanum (modified by AI)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reminder - Digital Assistant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: url('assets/IMG_6703.jpg') no-repeat center center fixed; /* Assuming the same background as journal.jsp */
            background-size: cover;
            color: white;
            position: relative;
            margin: 0;
            font-family: 'Montserrat', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 80px;
            background-color: #FF3B65;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
            z-index: 1000;
        }

        .sidebar .nav-link {
            color: white;
            margin-bottom: 20px;
            font-size: 18px;
            text-align: center;
        }

        .sidebar .nav-link:hover {
            color: #000;
            background-color: white;
            border-radius: 5px;
        }

        .settings-link {
            position: absolute;
            padding: .5rem 1rem;
            bottom: 20px;
            font-size: 18px;
            color: white;
        }

        .settings-link:hover {
            color: #000;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
            background-color: white;
            border-radius: 5px;
        }

        .main-content {
            margin-left: 100px;
            padding: 40px;
            min-height: 100vh;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .reminder-header {
            flex: 1;
        }

        .reminder-header h1 {
            font-size: 3rem;
            font-weight: 300;
            margin-bottom: 5px;
        }

        .add-reminder-button {
            background-color: #FF3B65; /* Matching sidebar color */
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2rem;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .add-reminder-button:hover {
            background-color: #e0325a; /* Slightly darker on hover */
        }

        .profile-section {
            position: absolute;
            top: 20px;
            right: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 10;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.3);
        }

        .language-dropdown {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 0.9rem;
            color: white;
            cursor: pointer;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 500;
            margin-bottom: 20px;
            margin-top: 40px;
        }

        .section-title:first-of-type {
            margin-top: 0;
        }

        .reminder-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .reminder-card {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            padding: 15px;
            color: #333;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center content vertically */
            align-items: center; /* Align content to the left */
            width: fit-content;
            max-width: 600px;
        }

        .reminder-text {
            font-size: 2.0rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: #333;
        }

        .reminder-time {
            font-size: 5rem;
            color: #555;
            font-weight: 500;
        }

        .dropdown-menu {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        @media (max-width: 768px) {
            .reminder-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <!-- Add Button at the top -->
        <a href="add.jsp" class="nav-link">
            <img src="assets/LogoAdd.png" alt="Add" style="width: 40px; height: 40px;" class="sidebar-icon" id="add-icon">
        </a>
            
        <a href="HomeServlet" class="nav-link <%= request.getParameter("page") == null || request.getParameter("page").equals("home") ? "active" : "" %>">
            <img src="assets/LogoHome.png" alt="Home" style="width: 40px; height: 40px;" class="sidebar-icon" id="home-icon">
        </a>
        
        <a href="AlarmServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("alarm") ? "active" : "" %>">
            <img src="assets/LogoAlarm.png" alt="Alarm" style="width: 40px; height: 40px;" class="sidebar-icon" id="alarm-icon">
        </a>
        
        <a href="ReminderServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("reminder") ? "active" : "" %>">
            <img src="assets/LogoNotif.png" alt="Notification" style="width: 40px; height: 40px;" class="sidebar-icon" id="notif-icon">
        </a>
        
        <a href="NoteServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("note") ? "active" : "" %>">
            <img src="assets/LogoNotes.png" alt="Notes" style="width: 40px; height: 40px;" class="sidebar-icon" id="notes-icon">
        </a>
        
        <a href="TaskServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("todolist") ? "active" : "" %>">
            <img src="assets/LogoToDoList.png" alt="To-Do" style="width: 40px; height: 40px;" class="sidebar-icon" id="todo-icon">
        </a>
        
        <!-- JournalEntry button added below ToDoList -->
        <a href="JournalEntryServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("journal") ? "active" : "" %>">
            <img src="assets/LogoJournal.png" alt="Journal" style="width: 40px; height: 40px;" class="sidebar-icon" id="journal-icon">
        </a>
        
        <a href="settings.jsp" class="settings-link">
            <img src="assets/LogoSetting.png" alt="Settings" style="width: 40px; height: 40px;" class="sidebar-icon" id="settings-icon">
        </a>
    </div>

    <div class="main-content">
        <div class="header-section">
            <div class="reminder-header">
                <h1>Reminder</h1>
            </div>

            <div class="profile-section">
                <div class="profile-info">
                    <span><%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %></span>
                    <div class="dropdown">
                        <img src="assets/Avatar.png" alt="Profile" class="profile-avatar dropdown-toggle" data-bs-toggle="dropdown" style="cursor: pointer;">
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="section-title">Today</h2>
        <div class="reminder-grid">
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Sell some dope</div>
                    <div class="reminder-time">08:00-09:00</div>
                </center>
            </div>
        </div>

        <h2 class="section-title">Tomorrow</h2>
        <div class="reminder-grid">
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Meet the junkie</div>
                    <div class="reminder-time">08:00-09:00</div>
                </center>
            </div>
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Whack a nigga that owe me</div>
                    <div class="reminder-time">21:00-23:00</div>
                </center>
            </div>
        </div>

        <h2 class="section-title">Fri, 16 May 2025</h2>
        <div class="reminder-grid">
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Meeting with the plug</div>
                    <div class="reminder-time">08:00-09:00</div>
                </center>
            </div>
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Meet the junkie</div>
                    <div class="reminder-time">09:00-22:00</div>
                </center>
            </div>
        </div>

        <h2 class="section-title">Sat, 17 May 2025</h2>
        <div class="reminder-grid">
            <div class="reminder-card">
                <center>
                    <div class="reminder-text">Cookin the meth</div>
                    <div class="reminder-time">08:00-09:00</div>
                </center>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka9H3GMh7dQssI40c5n8O11Fpb0pSQZxQSTH5tf9QmjAcqfOgnMw2uZxtFsiqgdF" crossorigin="anonymous"></script>

    <script>
        // Sidebar icon hover effects (assuming assets are available)
        document.getElementById("add-icon").onmouseover = function() {
            this.src = "assets/LogoAddHover.png";
        };
        document.getElementById("add-icon").onmouseout = function() {
            this.src = "assets/LogoAdd.png";
        };

        document.getElementById("home-icon").onmouseover = function() {
            this.src = "assets/HomeHover.png";
        };
        document.getElementById("home-icon").onmouseout = function() {
            this.src = "assets/LogoHome.png";
        };

        document.getElementById("alarm-icon").onmouseover = function() {
            this.src = "assets/AlarmHover.png";
        };
        document.getElementById("alarm-icon").onmouseout = function() {
            this.src = "assets/LogoAlarm.png";
        };

        document.getElementById("notif-icon").onmouseover = function() {
            this.src = "assets/NotifHover.png";
        };
        document.getElementById("notif-icon").onmouseout = function() {
            this.src = "assets/LogoNotif.png";
        };

        document.getElementById("notes-icon").onmouseover = function() {
            this.src = "assets/NotesHover.png";
        };
        document.getElementById("notes-icon").onmouseout = function() {
            this.src = "assets/LogoNotes.png";
        };

        document.getElementById("todo-icon").onmouseover = function() {
            this.src = "assets/ToDoListHover.png";
        };
        document.getElementById("todo-icon").onmouseout = function() {
            this.src = "assets/LogoToDoList.png";
        };

        document.getElementById("journal-icon").onmouseover = function() {
            this.src = "assets/JournalHover.png";
        };
        document.getElementById("journal-icon").onmouseout = function() {
            this.src = "assets/LogoJournal.png";
        };

        document.getElementById("settings-icon").onmouseover = function() {
            this.src = "assets/SettingHover.png";
        };
        document.getElementById("settings-icon").onmouseout = function() {
            this.src = "assets/LogoSetting.png";
        };
    </script>
</body>
</html>