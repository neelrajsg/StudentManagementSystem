package studentmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FacultyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null || !"faculty".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        String action = request.getParameter("action");

        try (Connection connection = DBConnection.getConnection()) {
            if ("viewAttendance".equals(action)) {
                String sql = "SELECT studentId, date, status FROM Attendance";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("attendance", resultSet);
                request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
            } else if ("viewGrades".equals(action)) {
                String sql = "SELECT studentId, subject, grade FROM Grades";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("grades", resultSet);
                request.getRequestDispatcher("viewGrades.jsp").forward(request, response);
            } else if ("viewTimetable".equals(action)) {
                String sql = "SELECT userId, day, time, subject FROM Timetable";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("timetable", resultSet);
                request.getRequestDispatcher("viewTimetable.jsp").forward(request, response);
            } else if ("updateGrades".equals(action)) {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                String subject = request.getParameter("subject");
                String grade = request.getParameter("grade");

                String sql = "UPDATE Grades SET grade = ? WHERE studentId = ? AND subject = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, grade);
                statement.setInt(2, studentId);
                statement.setString(3, subject);
                statement.executeUpdate();

                response.sendRedirect("facultyHome.jsp?message=Grade Updated Successfully");
            } else if ("updateTimetable".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                String day = request.getParameter("day");
                String time = request.getParameter("time");
                String subject = request.getParameter("subject");

                String sql = "UPDATE Timetable SET day = ?, time = ?, subject = ? WHERE userId = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, day);
                statement.setString(2, time);
                statement.setString(3, subject);
                statement.setInt(4, userId);
                statement.executeUpdate();

                response.sendRedirect("facultyHome.jsp?message=Timetable Updated Successfully");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
