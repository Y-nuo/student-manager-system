package entity;

// 修复：符合JavaBean规范，成员变量私有化
public class Student {
    private int id;
    private String name;
    private String sex;
    private String grade;
    private int age;
    private float score;

    // 无参构造方法
    public Student() {}

    // 全参构造方法
    public Student(int id, String name, String sex, String grade, int age, float score) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.grade = grade;
        this.age = age;
        this.score = score;
    }

    // Getter和Setter方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }
}