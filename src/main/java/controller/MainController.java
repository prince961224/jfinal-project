package controller;

import com.jfinal.core.Controller;
import model.Register;
import model.Student;

public class MainController extends Controller {

    public void index() {
        renderFreeMarker("index.ftl");
    }



//    public void loginCheck() {
//        String username = getPara("username");
//        String password = getPara("password");
//        if (username.equals("admin") && password.equals("123456")) {
//            redirect("/");
//        } else {
//            setAttr("errmsg", "用户名或密码错误");
//            renderFreeMarker("login.ftl");
//        }
//    }

    public void add() {
        renderFreeMarker("add-student.ftl");
    }
//    public void login() {
//        renderFreeMarker("login.ftl");
//    }

    public void register() {
        renderFreeMarker("register.ftl");
    }

    public void save() {
        String username = getPara("username");
        Integer age = getParaToInt("age");
        String gender = getPara("gender");
        String remark = getPara("remark");
        String password = getPara("password");
        Register register = new Register();
        register.setUsername(username);
        register.setAge(age);
        register.setRemark(remark);
        register.setGender(gender);
        register.setPassword(password);
        register.save();
        renderHtml("已经保存成功");
    }

}




