package controller;

import com.jfinal.core.Controller;
import model.Student;

import java.util.List;


public class StudentController extends Controller {

    public void add() {
        renderFreeMarker("add-student.ftl");
    }

    public void save() {
        String name = getPara("name");
        Integer age = getParaToInt("age");
        String gender = getPara("gender");
        String remark = getPara("remark");
        Student student = new Student();
        student.setName(name);
        student.setAge(age);
        student.setRemark(remark);
        student.setGender(gender);

      student.save();
        renderHtml("保存成功");
    }


    public void list() {
        String gender = getPara("gender", "");
        String sql;
        List<Student> students;
        if (gender.isEmpty()) {
            sql = "SELECT * FROM t_student";
            students = Student.dao.find(sql);
        } else {
            sql = "SELECT * FROM t_student WHERE gender = ?";
            students = Student.dao.find(sql, gender);
        }
        setAttr("students", students);
        renderFreeMarker("student-list.ftl");
    }

}
