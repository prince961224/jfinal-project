package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import com.sun.prism.shader.Solid_TextureSecondPassLCD_AlphaTest_Loader;
import interceptor.CategoryFormValidator;
import interceptor.CategoryNabarInterceptor;
import interceptor.Login;
import interceptor.TopicFormValidator;
import model.Category;
import model.Reply;
import model.Topic;
import model.User;
import org.omg.PortableInterceptor.USER_EXCEPTION;

import java.util.List;

public class TopicController extends Controller {
    @Before(CategoryNabarInterceptor.class)
    public void index(){
        Integer id= getParaToInt(0,-1);
        Topic topic = Topic.dao.findById(id);
        setAttr("topic",topic);

        Integer pageNumber = getParaToInt("page", 1);
        SqlPara sqlPara = Db.getSqlPara("getRepliesByTopicId");
        sqlPara.addPara(id);
        Page<Reply> page = Reply.dao.paginate(pageNumber, 10, sqlPara);
        setAttr("page",page);

        renderFreeMarker("view1.ftl");
    }
    public void reply(){
        Integer userId = getParaToInt("user_id", -1);
        String content = getPara("context", "");
        Integer topicId = getParaToInt("topic_id", -1);
        Reply reply=new Reply();
        reply.setTopicId(topicId);
        reply.setContent(content);
        reply.setUserId(userId);
        reply.save();
        renderHtml("回复成功");
    }

   /* @Before(POST.class)
    public void replies() {
        Integer id = getParaToInt("topicId", -1);
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = 10;

        SqlPara sqlPara = Db.getSqlPara("getRepliesByTopicId");
        sqlPara.addPara(id);

        Page<Reply> replyPage = Reply.dao.paginate(pageNumber, pageSize, sqlPara);
        renderJson(replyPage);
    }*/
    @Before({Login.class,CategoryNabarInterceptor.class})
    public void modify(){
        Integer topic_id = getParaToInt(0, -1);
        User user = getSessionAttr("user");
        String sql="SELECT t_user.* FROM t_user WHERE t_user.`admin`=1 AND t_user.`id`= ? ";
        List<User> users = User.dao.find(sql,user.getId());
        Topic topics = Topic.dao.findById(topic_id);
        if(users.isEmpty()){
            renderHtml("对不起，你没有这个权限！");
        }else{
            setAttr("topic",topics);
            renderFreeMarker("topic_modify.ftl");
        }
    }
    @Before({Login.class, TopicFormValidator.class})
    public void update(){
        //固定操作取到板块的名称 和板块的id
        String name = getPara("name");
        Integer id=getParaToInt("id",-1);
        Topic topic = new Topic();
        topic.setId(id);
        topic.setTitle(name);
        Boolean success=false;
        try {
            success=true;
            topic.update();
        }catch (Exception e){
            LogKit.error("贴子更新失败，原因是"+e.getMessage());
        }
        String message=success ? "更新成功":"更新失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }


    @Before({Login.class})
    public void delete() {
       Integer topic_id = getParaToInt(0, -1);
        Integer deleted= 1 ;
        //查询当前用户是否是管理员
        User user = getSessionAttr("user");
        String sql="SELECT t_user.* FROM t_user WHERE t_user.`admin`= 1 AND t_user.`id`= ? ";
        List<User> users = User.dao.find(sql,user.getId());
        //删除贴子（相当于更新操作）
        Topic topic = new Topic();
        topic.setId(topic_id);
        topic.setDeleted(deleted);
        //删除成功地标志
        Boolean success=false;
        if( users.isEmpty() ){
            renderHtml("对不起，你没有这个权限！");
        }
        else{
            try {
                success=true;
                topic.update();
                     }catch (Exception e){
                        LogKit.error("板块删除失败，原因是"+e.getMessage());
                }
        }
        String message=success ? "删除成功":"删除失败";
        renderHtml(message + "</br><a href='/index '>返回主页</a>");
    }



}
