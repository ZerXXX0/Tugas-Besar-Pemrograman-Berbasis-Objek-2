<%-- 
    Document   : todolist
    Created on : May 22, 2025, 8:08:32 PM
    Author     : Fathan Fardian Sanum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List - Digital Assistant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <style>
        .card {
            color: black;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
            margin-top: 70px;
        }
        .card-header {
            background-color: transparent !important;
            border-bottom: none !important;
            padding: 0;
            padding-bottom: 15px;
            color: black;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="card">
            <div class="card-header">
                To-Do List
            </div>
            <div class="card-body">
                <ul>
                    <li>Buy groceries</li>
                    <li>Complete the report</li>
                    <li>Call mom</li>
                    <li>Walk the dog</li>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka9H3GMh7dQssI40c5n8O11Fpb0pSQZxQSTH5tf9QmjAcqfOgnMw2uZxtFsiqgdF" crossorigin="anonymous"></script>
</body>
</html>
