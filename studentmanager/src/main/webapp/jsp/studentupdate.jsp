<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="entity.Student" %>
<%
    String path = request.getContextPath();
    Student student = (Student) request.getAttribute("student");
    if (student == null) {
        response.sendRedirect(path + "/jsp/error.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="GBK">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改学生信息</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Microsoft Yahei", "PingFang SC", sans-serif;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }
        .form-container {
            width: 550px;
            background: #ffffff;
            border-radius: 16px;
            padding: 45px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }
        .form-container h1 {
            text-align: center;
            color: #2d3748;
            margin-bottom: 40px;
            font-size: 26px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #4a5568;
            font-weight: 500;
            font-size: 15px;
        }
        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            height: 48px;
            padding: 0 16px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s ease;
            background-color: #f8fafc;
        }
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        .form-group input:disabled {
            background-color: #edf2f7;
            color: #718096;
            cursor: not-allowed;
        }
        .radio-group {
            display: flex;
            gap: 30px;
            align-items: center;
        }
        .radio-group label {
            display: inline-flex;
            align-items: center;
            margin: 0;
            cursor: pointer;
            font-weight: 400;
        }
        .radio-group input {
            margin-right: 8px;
            transform: scale(1.2);
        }
        .btn-group {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 40px;
        }
        .btn {
            padding: 12px 40px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .btn-secondary {
            background: #e2e8f0;
            color: #4a5568;
        }
        .btn-secondary:hover {
            background: #cbd5e0;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>修改学生信息</h1>
        <form action="<%=path%>/DoUpdateservlet.do" method="post">
            <input type="hidden" name="id" value="<%= student.getId() %>">
            
            <div class="form-group">
                <label>学号：</label>
                <input type="text" value="<%= student.getId() %>" disabled>
            </div>
            <div class="form-group">
                <label>姓名：</label>
                <input type="text" name="name" value="<%= student.getName() %>" required>
            </div>
            <div class="form-group">
                <label>性别：</label>
                <div class="radio-group">
                    <label><input type="radio" name="sex" value="男" <%= "男".equals(student.getSex()) ? "checked" : "" %>> 男</label>
                    <label><input type="radio" name="sex" value="女" <%= "女".equals(student.getSex()) ? "checked" : "" %>> 女</label>
                </div>
            </div>
            <div class="form-group">
                <label>年龄：</label>
                <input type="number" name="age" value="<%= student.getAge() %>" min="1" max="100" required>
            </div>
            <div class="form-group">
                <label>班级：</label>
                <input type="text" name="grade" value="<%= student.getGrade() %>" required>
            </div>
            <div class="form-group">
                <label>成绩：</label>
                <input type="number" step="0.1" min="0" max="100" name="score" value="<%= student.getScore() %>" required>
            </div>
            <div class="btn-group">
                <input type="submit" class="btn btn-primary" value="确认修改">
                <a href="<%=path%>/ListStudentServlet.do" class="btn btn-secondary">返回列表</a>
            </div>
        </form>
    </div>
</body>
</html>