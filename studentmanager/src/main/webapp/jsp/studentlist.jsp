<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.util.List,entity.Student" %>
<%
    String path = request.getContextPath();
    List<Student> stuList = (List<Student>) request.getAttribute("studentlist");
    String importResult = (String) request.getSession().getAttribute("importResult");
    if (importResult != null) {
        request.getSession().removeAttribute("importResult");
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="GBK">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息列表</title>
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
            padding: 50px 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .header h1 {
            color: #2d3748;
            font-size: 28px;
            font-weight: 600;
        }
        .btn-group {
            display: flex;
            gap: 15px;
        }
        .add-btn {
            padding: 12px 28px;
            background: linear-gradient(135deg, #42e695 0%, #3bb2b8 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(66, 230, 149, 0.3);
            border: none;
            cursor: pointer;
        }
        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(66, 230, 149, 0.4);
        }
        .import-btn {
            padding: 12px 28px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            border: none;
            cursor: pointer;
        }
        .import-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .import-result {
            background: #e6fffa;
            border: 1px solid #38b2ac;
            color: #234e52;
            padding: 12px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 15px;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
        }
        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            font-weight: 500;
            padding: 16px;
            text-align: center;
            font-size: 16px;
        }
        td {
            padding: 16px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
            color: #4a5568;
            font-size: 15px;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover {
            background-color: #f8fafc;
            transition: background-color 0.2s ease;
        }
        .action-btn {
            display: inline-block;
            padding: 6px 16px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
            margin: 0 4px;
        }
        .edit-btn {
            color: #667eea;
            border: 1px solid #667eea;
        }
        .edit-btn:hover {
            background-color: #667eea;
            color: #fff;
        }
        .delete-btn {
            color: #e53e3e;
            border: 1px solid #e53e3e;
        }
        .delete-btn:hover {
            background-color: #e53e3e;
            color: #fff;
        }
        .empty-tip {
            text-align: center;
            padding: 60px;
            color: #718096;
            font-size: 18px;
        }
        /* 导入模态框样式 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            background: #fff;
            padding: 40px;
            border-radius: 16px;
            width: 450px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        .modal-content h2 {
            text-align: center;
            color: #2d3748;
            margin-bottom: 30px;
            font-size: 22px;
        }
        .file-input {
            width: 100%;
            padding: 15px;
            border: 2px dashed #cbd5e0;
            border-radius: 8px;
            margin-bottom: 25px;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .file-input:hover {
            border-color: #667eea;
            background: #f8fafc;
        }
        .modal-btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        .modal-btn {
            padding: 10px 30px;
            border: none;
            border-radius: 50px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .modal-btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
        }
        .modal-btn-secondary {
            background: #e2e8f0;
            color: #4a5568;
        }
        .modal-btn:hover {
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 导入结果提示 -->
        <% if (importResult != null) { %>
            <div class="import-result"><%= importResult %></div>
        <% } %>
        
        <div class="header">
            <h1>学生信息管理列表</h1>
            <div class="btn-group">
                <button class="import-btn" onclick="showImportModal()">批量导入Excel</button>
                <a href="<%=path%>/jsp/studentinsert.jsp" class="add-btn">+ 新增学生</a>
            </div>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>班级</th>
                    <th>成绩</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <% if (stuList != null && !stuList.isEmpty()) { %>
                    <% for (Student s : stuList) { %>
                    <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getName() %></td>
                        <td><%= s.getSex() %></td>
                        <td><%= s.getAge() %></td>
                        <td><%= s.getGrade() %></td>
                        <td><%= s.getScore() %></td>
                        <td>
                            <a href="<%=path%>/Updateservlet.do?id=<%= s.getId() %>" class="action-btn edit-btn">修改</a>
                            <a href="<%=path%>/Deleteservlet.do?id=<%= s.getId() %>" class="action-btn delete-btn" onclick="return confirm('确定要删除该学生吗？')">删除</a>
                        </td>
                    </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="7" class="empty-tip">暂无学生数据，请点击上方按钮添加或导入</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- 批量导入模态框 -->
    <div id="importModal" class="modal">
        <div class="modal-content">
            <h2>批量导入学生信息</h2>
            <form action="<%=path%>/ImportStudentServlet.do" method="post" enctype="multipart/form-data">
                <div class="file-input" onclick="document.getElementById('excelFile').click()">
                    <p>点击选择Excel文件</p>
                    <p style="color:#718096; font-size:13px; margin-top:8px;">支持.xlsx格式，第一行为表头</p>
                    <input type="file" id="excelFile" name="excelFile" accept=".xlsx" style="display:none;" onchange="updateFileName(this)">
                </div>
                <p id="fileName" style="text-align:center; color:#4a5568; margin-bottom:20px;"></p>
                <div class="modal-btn-group">
                    <button type="submit" class="modal-btn modal-btn-primary">开始导入</button>
                    <button type="button" class="modal-btn modal-btn-secondary" onclick="hideImportModal()">取消</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function showImportModal() {
            document.getElementById('importModal').style.display = 'flex';
        }

        function hideImportModal() {
            document.getElementById('importModal').style.display = 'none';
            document.getElementById('excelFile').value = '';
            document.getElementById('fileName').innerText = '';
        }

        function updateFileName(input) {
            if (input.files.length > 0) {
                document.getElementById('fileName').innerText = '已选择：' + input.files[0].name;
            }
        }

        // 点击模态框外部关闭
        document.getElementById('importModal').addEventListener('click', function(e) {
            if (e.target === this) {
                hideImportModal();
            }
        });
    </script>
</body>
</html>