package controller;
import com.jfinal.core.Controller;
import com.jfinal.kit.LogKit;
import model.Category;
import model.User;

import java.util.List;
/**
 *Created by Administrator on 2018/5/5 0004
 * */
public class CategoryController extends Controller {
   //显示板块里的所有内容：
    public void list(){
         List<Category> categories= Category.dao.find("SELECT  * FROM t_category");
         setAttr("categories",categories);
         renderFreeMarker("list.ftl");
    }
   //增加
    public void add(){
    renderFreeMarker("add.ftl");
    }
    //保存：
    public void save(){
        String name = getPara("name");
        Category category =new Category();
        category.setName(name);
        Boolean success=false;
        try {
            success=true;
            category.save();
        }catch (Exception e){
            LogKit.error("板块添加失败，原因是"+e.getMessage());
        }
        String message=success ? "添加成功":"添加失败";
        renderHtml(message + "</br><a href='/category/list'>返回板块列表</a>");
    }
    //更新操作！
    public void modify(){
      Integer id=  getParaToInt(0,-1);
      Category category=Category.dao.findById(id);
        if(category !=null){
            setAttr("category",category);
            renderFreeMarker("modify.ftl");
        }else{
            renderHtml("<h3>板块不存在！！</h3>");
        }
    }
  //update
  public void update(){
      String name = getPara("name");
      Integer id=getParaToInt("id",-1);
      Category category =new Category();
      category.setId(id);
      category.setName(name);
      Boolean success=false;
      try {
          success=true;
          category.update();
      }catch (Exception e){
          LogKit.error("板块更新失败，原因是"+e.getMessage());
      }
      String message=success ? "更新成功":"更新失败";
      renderHtml(message + "</br><a href='/category/list'>返回板块列表</a>");
  }
  //删除
    public void delete(){
        Integer id=getParaToInt(0,-1);
        Boolean success=false;
        try {
            success=true;
           Category.dao.deleteById(id);
        }catch (Exception e){
            LogKit.error("板块删除失败，原因是"+e.getMessage());
        }
        String message=success ? "删除成功":"更新失败";
        renderHtml(message + "</br><a href='/category/list'>返回板块列表</a>");
    }

  /*//登录管理板块！
    public void login(){
        renderFreeMarker("login.ftl");
    }
    public void logincheck(){

    }*/

}
