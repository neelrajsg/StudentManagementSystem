<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="studentmanagement.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Home</title>
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
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        li {
            margin-bottom: 15px;
            margin-right: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
        }

        .logout {
            margin-top: 30px;
        }

        .quotes {
            text-align: center;
            margin-top: 50px;
        }

        .quote {
            font-style: italic;
            color: #555;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
        HttpSession sess = request.getSession(false);
        User user = (User) sess.getAttribute("user");
        if (user == null || !"faculty".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    <h1>Welcome, <%= user.getUsername() %></h1>
    <ul>
        <li><a href="FacultyServlet?action=viewAttendance">View Attendance</a></li>
        <li><a href="FacultyServlet?action=viewGrades">View Grades</a></li>
        <li><a href="FacultyServlet?action=viewTimetable">View Timetable</a></li>
        <li><a href="updateGrades.jsp">Update Grades</a></li>
        <li><a href="updateTimetable.jsp">Update Timetable</a></li>
    </ul>
    <a class="logout" href="LogoutServlet">Logout</a>

    <div class="quotes">
        <p class="quote">"Education is not the filling of a pail, but the lighting of a fire." - William Butler Yeats</p>
        <p class="quote">"The art of teaching is the art of assisting discovery." - Mark Van Doren</p>
        <p class="quote">"A good teacher can inspire hope, ignite the imagination, and instill a love of learning." - Brad Henry</p>
    </div>
</body>
</html>
