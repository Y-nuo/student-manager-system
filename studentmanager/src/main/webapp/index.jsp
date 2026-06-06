<%@ page language="java" pageEncoding="GBK"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="GBK">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Microsoft Yahei", "PingFang SC", sans-serif;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .bg-decoration {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }
        .bg-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: float 6s ease-in-out infinite;
        }
        .bg-circle:nth-child(1) {
            width: 300px;
            height: 300px;
            top: -100px;
            left: -100px;
            animation-delay: 0s;
        }
        .bg-circle:nth-child(2) {
            width: 200px;
            height: 200px;
            bottom: -50px;
            right: -50px;
            animation-delay: 2s;
        }
        .bg-circle:nth-child(3) {
            width: 150px;
            height: 150px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation-delay: 4s;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        .container {
            position: relative;
            z-index: 1;
            text-align: center;
            background: rgba(255,255,255,0.95);
            padding: 70px 100px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
        }
        h1 {
            font-size: 42px;
            color: #2d3748;
            margin-bottom: 50px;
            font-weight: 700;
            letter-spacing: 2px;
        }
        .enter-btn {
            display: inline-block;
            padding: 18px 60px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 50px;
            font-size: 22px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            letter-spacing: 1px;
        }
        .enter-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.5);
        }
        .enter-btn:active {
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="bg-decoration">
        <div class="bg-circle"></div>
        <div class="bg-circle"></div>
        <div class="bg-circle"></div>
    </div>
    <div class="container">
        <h1>学生信息管理系统</h1>
        <a href="<%=path%>/ListStudentServlet.do" class="enter-btn">进入系统</a>
    </div>
</body>
</html>