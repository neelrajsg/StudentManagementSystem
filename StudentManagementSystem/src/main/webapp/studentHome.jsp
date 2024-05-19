<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="studentmanagement.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin-top: 15px;
        }

        ul li {
            margin: 35px 0;
        }

        ul li a {
            text-decoration: none;
            color: #3498db;
            font-size: 1.2em;
            padding: 10px 20px;
            border: 2px solid #3498db;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
        }

        ul li a:hover {
            background-color: #3498db;
            color: #fff;
            transform: scale(1.05);
        }

        .logout-button {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #e74c3c;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .logout-button:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <%
        HttpSession sesion = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    <h1>Welcome, <%= user.getUsername() %></h1>
    <ul>
        <li><a href="StudentServlet?action=viewAttendance">View Attendance</a></li>
        <li><a href="StudentServlet?action=viewGrades">View Grades</a></li>
        <li><a href="StudentServlet?action=viewTimetable">View Timetable</a></li>
    </ul>
    <a class="logout-button" href="LogoutServlet">Logout</a>
</body>
</html>
