package controller;

import com.jfinal.core.Controller;

public class MainController extends Controller {

    public void index(){
        renderFreeMarker("index.ftl");
    }
  public void login(){
        renderFreeMarker("login.ftl");
  }
  public void loginCheck(){
      String username=getPara("username");
      String password=getPara("password");
      if(username.equals("admin")&&password.equals("123456")){
          redirect("/");
      }
      else{
          setAttr("errmsg","用户名或密码错误");
          renderFreeMarker("login.ftl");
      }
  }
}
