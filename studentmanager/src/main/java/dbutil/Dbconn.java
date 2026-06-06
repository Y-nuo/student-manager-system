package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbconn {
    // 修复：添加时区、编码和SSL参数
    private static final String URL = "jdbc:mysql://localhost:3306/students?useSSL=false&serverTimezone=UTC&characterEncoding=GBK";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("数据库驱动加载失败", e);
        }
    }

    // 修复：正确的资源关闭顺序，无论是否异常都关闭所有资源
    public void closeAll(Connection conn, Statement stat, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stat != null) stat.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}