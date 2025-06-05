<%-- 
    Document   : add
    Created on : 5 Jun 2025, 14.52.12
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add - Digital Assistant</title>
    <!-- Bootstrap 5.0.2 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: url('assets/IMG_6703.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            position: relative;
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 100vh;
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
        
        .sidebar .nav-link.active {
            background-color: white;
            color: #000;
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
        
        .page-title {
            font-size: 3rem;
            font-weight: 300;
            margin-bottom: 40px;
            color: white;
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
            color: white;
        }
        
        .profile-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.3);
        }
        

        
        .cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
            gap: 30px;
        }
        
        .add-card {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            padding: 25px;
            color: #333;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        
        .card-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }
        
        .time-display {
            font-size: 3rem;
            font-weight: 300;
            margin-bottom: 15px;
            color: #333;
            text-align: center;
        }
        
        .day-selector {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .day-btn {
            width: 35px;
            height: 35px;
            border: none;
            background-color: transparent;
            color: #666;
            font-weight: 500;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .day-btn:hover, .day-btn.active {
            background-color: #FF3B65;
            color: white;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 12px 15px;
            font-size: 1rem;
            transition: border-color 0.2s;
        }
        
        .form-control:focus {
            border-color: #FF3B65;
            box-shadow: 0 0 0 0.2rem rgba(255, 59, 101, 0.25);
        }
        
        .form-control.large-text {
            min-height: 120px;
            resize: vertical;
        }
        
        .add-btn {
            background-color: #FF3B65;
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .add-btn:hover {
            background-color: #e6335a;
        }
        
        .voice-note-area {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            padding: 30px 0;
        }
        
        .microphone-icon {
            width: 80px;
            height: 80px;
            background-color: #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .microphone-icon:hover {
            background-color: #555;
        }
        
        .microphone-icon i {
            font-size: 2rem;
            color: white;
        }
        
        .todo-input-area {
            min-height: 150px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 15px;
            background-color: white;
        }
        
        .todo-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .todo-checkbox {
            margin-right: 10px;
            transform: scale(1.2);
        }
        
        .todo-input {
            border: none;
            outline: none;
            flex: 1;
            font-size: 1rem;
            background: transparent;
        }
        
        .add-todo-btn {
            background: none;
            border: none;
            color: #FF3B65;
            font-size: 1.2rem;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .dropdown-menu {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Add Button at the top -->
        <a href="add.jsp" class="nav-link">
            <img src="assets/LogoAdd.png" alt="Add" style="width: 40px; height: 40px;" class="sidebar-icon" id="add-icon">
        </a>
            
        <a href="HomeServlet" class="nav-link <%= request.getParameter("page") != null && request.getParameter("page").equals("home") ? "active" : "" %>">
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

    <!-- Profile Section -->
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

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="page-title">Add</h1>
        
        <div class="cards-container">
            <!-- Alarm Card -->
            <div class="add-card">
                <h3 class="card-title">Alarm</h3>
                <form action="AlarmServlet" method="post">
                    <div class="time-display">07:00</div>
                    <div class="day-selector">
                        <button type="button" class="day-btn" data-day="S">S</button>
                        <button type="button" class="day-btn" data-day="M">M</button>
                        <button type="button" class="day-btn" data-day="T">T</button>
                        <button type="button" class="day-btn" data-day="W">W</button>
                        <button type="button" class="day-btn" data-day="T">T</button>
                        <button type="button" class="day-btn" data-day="F">F</button>
                        <button type="button" class="day-btn" data-day="S">S</button>
                    </div>
                    <div class="form-group">
                        <input type="time" class="form-control" name="alarmTime" value="07:00" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="alarmName" placeholder="Title" required>
                    </div>
                    <input type="hidden" name="selectedDays" id="alarmDays">
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- Reminder Card -->
            <div class="add-card">
                <h3 class="card-title">Reminder</h3>
                <form action="ReminderServlet" method="post">
                    <div class="time-display">17:00</div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="reminderDate" placeholder="17/08/1945" required>
                    </div>
                    <div class="form-group">
                        <input type="time" class="form-control" name="reminderTime" value="00:00" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="reminderName" placeholder="Title" required>
                    </div>
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- Note Card -->
            <div class="add-card">
                <h3 class="card-title">Note</h3>
                <form action="NoteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="noteTitle" placeholder="Title" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control large-text" name="noteContent" placeholder="Write your note here..." required></textarea>
                    </div>
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- Voice Note Card -->
            <div class="add-card">
                <h3 class="card-title">Voice Note</h3>
                <form action="VoiceNoteServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="voiceTitle" placeholder="Title" required>
                    </div>
                    <div class="voice-note-area">
                        <div class="microphone-icon" id="recordBtn">
                            <i class="fas fa-microphone"></i>
                        </div>
                        <input type="file" class="form-control" name="voiceFile" accept="audio/*" style="display: none;" id="voiceFileInput">
                        <button type="button" class="btn btn-outline-secondary" onclick="document.getElementById('voiceFileInput').click()">Choose Audio File</button>
                    </div>
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- Journal Card -->
            <div class="add-card">
                <h3 class="card-title">Journal</h3>
                <form action="JournalServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="journalTitle" placeholder="Title" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control large-text" name="journalContent" placeholder="Write your journal entry here..." required></textarea>
                    </div>
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- Activity Card -->
            <div class="add-card">
                <h3 class="card-title">Activity</h3>
                <form action="ActivityServlet" method="post">
                    <div class="form-group">
                        <input type="time" class="form-control" name="activityTime" placeholder="00:00" required>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="activityDescription" placeholder="Activity description..." required></textarea>
                    </div>
                    <button type="submit" class="add-btn">Add</button>
                </form>
            </div>

            <!-- To-Do Card -->
            <div class="add-card">
                <h3 class="card-title">To-Do</h3>
                <form action="TodoServlet" method="post">
                    <div class="todo-input-area" id="todoArea">
                        <div class="todo-item">
                            <input type="checkbox" class="todo-checkbox">
                            <input type="text" class="todo-input" name="todoItems[]" placeholder="Add a task...">
                        </div>
                    </div>
                    <button type="button" class="add-todo-btn" onclick="addTodoItem()">
                        <i class="fas fa-plus"></i> Add another task
                    </button>
                    <button type="submit" class="add-btn" style="margin-top: 20px;">Add</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka9H3GMh7dQssI40c5n8O11Fpb0pSQZxQSTH5tf9QmjAcqfOgnMw2uZxtFsiqgdF" crossorigin="anonymous"></script>
    
    <script>
        // Sidebar icon hover effects
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

        // Day selector functionality for alarm
        document.querySelectorAll('.day-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                this.classList.toggle('active');
                updateSelectedDays();
            });
        });

        function updateSelectedDays() {
            const selectedDays = [];
            document.querySelectorAll('.day-btn.active').forEach(btn => {
                selectedDays.push(btn.getAttribute('data-day'));
            });
            document.getElementById('alarmDays').value = selectedDays.join(',');
        }

        // Add todo item functionality
        function addTodoItem() {
            const todoArea = document.getElementById('todoArea');
            const newItem = document.createElement('div');
            newItem.className = 'todo-item';
            newItem.innerHTML = `
                <input type="checkbox" class="todo-checkbox">
                <input type="text" class="todo-input" name="todoItems[]" placeholder="Add a task...">
            `;
            todoArea.appendChild(newItem);
        }

        // Voice recording functionality (basic implementation)
        document.getElementById('recordBtn').addEventListener('click', function() {
            const icon = this.querySelector('i');
            if (icon.classList.contains('fa-microphone')) {
                icon.classList.remove('fa-microphone');
                icon.classList.add('fa-stop');
                this.style.backgroundColor = '#FF3B65';
                // Start recording logic would go here
            } else {
                icon.classList.remove('fa-stop');
                icon.classList.add('fa-microphone');
                this.style.backgroundColor = '#333';
                // Stop recording logic would go here
            }
        });

        // Time display updates
        document.querySelectorAll('input[type="time"]').forEach(input => {
            input.addEventListener('change', function() {
                const timeDisplay = this.closest('.add-card').querySelector('.time-display');
                if (timeDisplay) {
                    timeDisplay.textContent = this.value;
                }
            });
        });
    </script>
</body>
</html>