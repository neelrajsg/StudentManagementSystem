<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: #333;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        #nav {
            text-align: center;
        }

        #nav a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            font-size: 1.2em;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        #nav a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Welcome to the Student Management System</h1>
    <div id="nav">
        <a href="login.jsp?role=student">Login as Student</a><br/>
        <a href="login.jsp?role=faculty">Login as Faculty</a>
    </div>
</body>
</html>
