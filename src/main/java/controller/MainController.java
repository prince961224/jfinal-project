package controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import model.Topic;
import model.User;

import java.util.List;

public class MainController extends Controller {

    public void index(){
        List<Record> topics = Db.find("SELECT t_topic.*,t_category.`name` AS category_name FROM t_topic " +
                "INNER JOIN t_category ON t_topic.category_id=t_category.`id` " +
                "ORDER BY reply_count DESC LIMIT 1,25");
        setAttr("topics",topics);
        String username = getPara("name");
        setAttr("username",username);
        renderFreeMarker("main_layout.ftl");
    }
    public void  main(){
        List<Record> topics = Db.find("SELECT t_topic.*,t_category.`name` AS category_name FROM t_topic " +
                "INNER JOIN t_category ON t_topic.category_id=t_category.`id` " +
                "ORDER BY reply_count DESC LIMIT 1,25");
        setAttr("topics",topics);
        renderFreeMarker("main_layout.ftl");
    }
    public void loginCheck() {
        String username = getPara("username");
        String password = getPara("password");
        List <User> users=User.dao.find("SELECT * From t_user WHERE username=? AND password=?",username,password);
        if (users.size()!=0) {
            /*登陆成功*/
            setAttr("name",username);
            setSessionAttr("users",users.get(0));
            List<Record> topics = Db.find("SELECT t_topic.*,t_category.`name` AS category_name FROM t_topic " +
                    "INNER JOIN t_category ON t_topic.category_id=t_category.`id` " +
                    "ORDER BY reply_count DESC LIMIT 1,25");
            setAttr("topics",topics);
            renderFreeMarker("main_layout.ftl");

        } else {
            setAttr("errmsg", "用户名或密码错误");
            renderFreeMarker("login.ftl");
        }
    }
    public void login() {
        renderFreeMarker("login.ftl");
    }
    public void logout(){
        removeSessionAttr("users");
        redirect("login");
    }
    public void register() {
        renderFreeMarker("register.ftl");
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
            renderFreeMarker("register.ftl");
        }else{
            user.save();
            redirect("login");
        }
    }
    public void music_palyer(){
        renderFreeMarker("music.ftl");
    }
}
