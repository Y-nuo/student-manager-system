package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dbutil.Dbconn;
import entity.Student;

public class StudentModel {
    private Dbconn db = new Dbconn();

    // 修复：添加泛型，ps和rs改为局部变量
    public List<Student> search() {
        List<Student> studentlist = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM student";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setSex(rs.getString("sex"));
                student.setGrade(rs.getString("grade"));
                student.setScore(rs.getFloat("score"));
                studentlist.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll(conn, ps, rs);
        }
        return studentlist;
    }

    public Student load(Integer id) {
        Student student = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM student WHERE id = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setSex(rs.getString("sex"));
                student.setAge(rs.getInt("age"));
                student.setGrade(rs.getString("grade"));
                student.setScore(rs.getFloat("score"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeAll(conn, ps, rs);
        }
        return student;
    }

    public int update(int id, String name, String sex, int age, String grade, float score) {
        int rows = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "UPDATE student SET name=?, sex=?, age=?, grade=?, score=? WHERE id=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, sex);
            ps.setInt(3, age);
            ps.setString(4, grade);
            ps.setFloat(5, score);
            ps.setInt(6, id);
            rows = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeAll(conn, ps, null);
        }
        return rows;
    }

    // 修复：添加into关键字，这是之前插入失败的核心原因！
    public int insert(int id, String name, String sex, int age, String grade, float score) {
        int rows = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO student VALUES(?,?,?,?,?,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, sex);
            ps.setInt(4, age);
            ps.setString(5, grade);
            ps.setFloat(6, score);
            rows = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeAll(conn, ps, null);
        }
        return rows;
    }

    public int delete(int id) {
        int rows = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "DELETE FROM student WHERE id=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rows = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeAll(conn, ps, null);
        }
        return rows;
    }
}