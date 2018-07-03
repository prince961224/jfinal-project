package controller;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import interceptor.Login;
import model.User;
import org.omg.PortableInterceptor.USER_EXCEPTION;

import java.util.List;

public class UserController extends Controller {
    @Before(Login.class)
    public void change(){
        User user = getSessionAttr("user");
        if (user ==null){
           redirect("/login");
        }else{
            setAttr("user",user);
            renderFreeMarker("change_info.ftl");
        }
    }

       public void doChange_info(){
           User  now_user = getSessionAttr("user");
           String now_name = now_user.getUsername();
           Integer user_id = getParaToInt(0, -1);
           String username = getPara("username");
           String password = getPara("password");
           String nickname = getPara("nickname");
           String email = getPara("email");
           String sql = "SELECT t_user.* FROM t_user WHERE t_user.`username` = ? ";
           List<User> users = User.dao.find(sql, username);
           boolean success = false;
           String message="";
           if(users.isEmpty() || now_name.equals(username)) {

               if (username.isEmpty()) {
                   renderHtml("用户名为空");
                   return;
               } else {
                 /*  String sql1="UPDATE t_user set t_user.username = ？";*/
                   User user = new User();
                   user.setId(user_id);
                   user.setUsername(username);
                   user.setPassword(password);
                   user.setNickname(nickname);
                   user.setEmail(email);
                   try {
                       user.update();
                       success = true;
                   } catch (Exception e) {
                       LogKit.error("用户注册失败，原因是:" + e.getMessage());
                   }
               }
           }else{
               setAttr("errmsg", "用户名已经存在");
               message="用户名已经存在";
               Kv result = Kv.by("success", success).set("message", message);
               renderJson(result);
               return;
           }
           message = success ?"修改成功":"修改失败";
           Kv result = Kv.by("success", success).set("message", message);
           renderJson(result);

       }





    /*public void register(){
        renderFreeMarker("change_info.ftl");
    }
    public void registercheck() {
        String username = getPara("username");//姓名
        String password = getPara("password");//密码
        String nickname = getPara("nickname");//昵称
        String email = getPara("email");//邮箱

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setEmail(email);
        if (username.isEmpty() || password.isEmpty()) {
            setAttr("errmsg", "用户名或密码错误");
            renderFreeMarker("change_info.ftl");
        } else {
            user.save();
            redirect("/user/login");
        }
    }
    public void login(){
      renderFreeMarker("login.ftl");
      }*/


}
