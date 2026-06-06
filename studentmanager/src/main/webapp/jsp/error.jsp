<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="GBK">
    <title>操作出错</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Microsoft Yahei", sans-serif;
            box-sizing: border-box;
        }
        body {
            background-color: #f5f7fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .err-box {
            width: 420px;
            background: #ffffff;
            border: 1px solid #f2c8cb;
            border-radius: 12px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
        }
        .err-box h1 {
            color: #dc3545;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .err-box p {
            color: #666;
            margin-bottom: 30px;
        }
        .back-btn {
            display: inline-block;
            padding: 10px 28px;
            background: #0d6efd;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.2s;
        }
        .back-btn:hover {
            background: #0b5ed7;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="err-box">
        <h1>操作出错了</h1>
        <p>请检查输入信息或稍后重试</p>
        <a href="<%=request.getContextPath()%>/ListStudentServlet.do" class="back-btn">返回学生列表</a>
    </div>
</body>
</html>