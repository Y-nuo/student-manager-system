package control;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.StudentModel;
import entity.Student;
import util.ExcelUtil;

// 开启文件上传支持
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 最大10MB
public class ImportStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        int successCount = 0;
        int failCount = 0;
        
        try {
            // 获取上传的文件
            Part filePart = request.getPart("excelFile");
            if (filePart == null || filePart.getSize() == 0) {
                throw new Exception("请选择要导入的Excel文件");
            }
            
            // 验证文件格式
            String fileName = filePart.getSubmittedFileName();
            if (!fileName.endsWith(".xlsx")) {
                throw new Exception("只支持.xlsx格式的Excel文件");
            }
            
            // 读取Excel文件
            InputStream inputStream = filePart.getInputStream();
            List<Student> studentList = ExcelUtil.readStudentExcel(inputStream);
            
            // 批量插入数据库
            StudentModel model = new StudentModel();
            for (Student student : studentList) {
                // 检查学号是否已存在
                Student existStudent = model.load(student.getId());
                if (existStudent == null) {
                    model.insert(student.getId(), student.getName(), student.getSex(), 
                                student.getAge(), student.getGrade(), student.getScore());
                    successCount++;
                } else {
                    failCount++;
                }
            }
            
            // 导入成功，跳转到列表页并显示结果
            request.getSession().setAttribute("importResult", 
                "导入完成！成功：" + successCount + " 条，失败：" + failCount + " 条（重复学号已跳过）");
            response.sendRedirect(request.getContextPath() + "/ListStudentServlet.do");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "导入失败：" + e.getMessage());
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}