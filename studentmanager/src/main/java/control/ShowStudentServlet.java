package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entity.Student;
import model.StudentModel;

public class ShowStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            StudentModel model = new StudentModel();
            Student student = model.load(id);
            if (student == null) {
                throw new Exception("学生不存在");
            }
            request.setAttribute("student", student);
            request.getRequestDispatcher("/jsp/studentshow.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}