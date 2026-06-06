package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StudentModel;

public class Deleteservlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            StudentModel model = new StudentModel();
            model.delete(id);
            // 绝对路径跳转，避免404
            response.sendRedirect(request.getContextPath() + "/ListStudentServlet.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}