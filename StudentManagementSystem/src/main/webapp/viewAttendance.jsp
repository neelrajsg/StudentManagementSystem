<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="studentmanagement.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Attendance</title>
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

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e74c3c;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            align-self: center;
        }

        a:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Attendance Details</h1>
    <table>
        <tr>
            <th>Date</th>
            <th>Status</th>
        </tr>
        <%
            ResultSet attendance = (ResultSet) request.getAttribute("attendance");
            while (attendance != null && attendance.next()) {
                String date = attendance.getString("date");
                String status = attendance.getString("status");
        %>
        <tr>
            <td><%= date %></td>
            <td><%= status %></td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="<%= ((User) request.getSession().getAttribute("user")).getRole().equals("student") ? "studentHome.jsp" : "facultyHome.jsp" %>">Back</a>
</body>
</html>
