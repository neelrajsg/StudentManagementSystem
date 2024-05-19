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

public class StudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("index.jsp");
            return;
        }

        int userId = user.getUserId();
        String action = request.getParameter("action");

        try (Connection connection = DBConnection.getConnection()) {
            if ("viewAttendance".equals(action)) {
                String sql = "SELECT date, status FROM Attendance WHERE studentId = (SELECT studentId FROM Students WHERE userId = ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("attendance", resultSet);
                request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
            } else if ("viewGrades".equals(action)) {
                String sql = "SELECT subject, grade FROM Grades WHERE studentId = (SELECT studentId FROM Students WHERE userId = ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("grades", resultSet);
                request.getRequestDispatcher("viewGrades.jsp").forward(request, response);
            } else if ("viewTimetable".equals(action)) {
                String sql = "SELECT day, time, subject FROM Timetable WHERE userId = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, userId);
                ResultSet resultSet = statement.executeQuery();
                request.setAttribute("timetable", resultSet);
                request.getRequestDispatcher("viewTimetable.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

