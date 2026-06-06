package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StudentModel;

public class Insertservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            int age = Integer.parseInt(request.getParameter("age"));
            String grade = request.getParameter("grade");
            float score = Float.parseFloat(request.getParameter("score"));

            StudentModel model = new StudentModel();
            int row = model.insert(id, name, sex, age, grade, score);
            System.out.println("插入成功行数：" + row);
            
            response.sendRedirect(request.getContextPath() + "/ListStudentServlet.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/jsp/studentinsert.jsp");
    }
}