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
    <title>学生详细信息</title>
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
        .show-box {
            width: 520px;
            background: #ffffff;
            border-radius: 16px;
            padding: 45px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }
        .show-box h1 {
            text-align: center;
            color: #2d3748;
            margin-bottom: 40px;
            font-size: 26px;
            font-weight: 600;
        }
        .info-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 40px;
        }
        .info-table td {
            padding: 18px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 15px;
        }
        .info-table tr:last-child td {
            border-bottom: none;
        }
        .info-table td:first-child {
            background-color: #f8fafc;
            width: 130px;
            text-align: center;
            font-weight: 500;
            color: #4a5568;
        }
        .info-table td:last-child {
            color: #2d3748;
            padding-left: 20px;
        }
        .btn-box {
            display: flex;
            justify-content: center;
            gap: 25px;
        }
        .btn {
            padding: 12px 35px;
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
        .btn-danger {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: #fff;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
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
    </style>
</head>
<body>
    <div class="show-box">
        <h1>学生详情信息</h1>
        <table class="info-table">
            <tr>
                <td>编号</td>
                <td><%= student.getId() %></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><%= student.getName() %></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><%= student.getSex() %></td>
            </tr>
            <tr>
                <td>班级</td>
                <td><%= student.getGrade() %></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><%= student.getAge() %></td>
            </tr>
            <tr>
                <td>成绩</td>
                <td><%= student.getScore() %></td>
            </tr>
        </table>
        <div class="btn-box">
            <form action="<%=path%>/Deleteservlet.do" method="post">
                <input type="hidden" name="id" value="<%= student.getId() %>">
                <button type="submit" class="btn btn-danger" onclick="return confirm('确定要删除该学生吗？')">确认删除</button>
            </form>
            <a href="<%=path%>/ListStudentServlet.do" class="btn btn-primary">返回列表</a>
        </div>
    </div>
</body>
</html>