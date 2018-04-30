package controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.LogKit;
import model.User;

import java.util.List;

public class MainController extends Controller {

    public void index(){
        redirect("/login");
    }
    public void  main(){
        User user=getSessionAttr("users");
        if( user == null){
            redirect("/login");
        }else{
            renderFreeMarker("../index.ftl");
        }
    }
    public void loginCheck() {
        String username = getPara("username");
        String password = getPara("password");
        List <User> users=User.dao.find("SELECT * From t_user WHERE username=? AND password=?",username,password);
        if (users.size()!=0) {
            /*登陆成功*/
            setSessionAttr("users",users.get(0));
            redirect("/main");
        } else {
            setAttr("errmsg", "用户名或密码错误");
            renderFreeMarker("../login.ftl");
        }
    }
    public void login() {
        renderFreeMarker("../login.ftl");
        }
    public void logout(){
           removeSessionAttr("users");
           redirect("/login");
    }
    public void register() {
        renderFreeMarker("../register.ftl");
    }

    public void registercheck(){
     String username= getPara("username");
     String password=getPara("password");
     String nickname=getPara("nickname");
     User user=new User();
     user.setUsername(username);
     user.setPassword(password);
     user.setNickname(nickname);
     if(username.isEmpty()||password.isEmpty()){
         setAttr("errmsg","用户名或密码为空！");
         renderFreeMarker("../register.ftl");
     }else{
         user.save();
         redirect("/login");
        }
    }
}
