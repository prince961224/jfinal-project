package controller;


import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.CategoryNabarInterceptor;
import interceptor.Login;
import interceptor.ReplyFormValidator;
import interceptor.TopicFormValidator;
import model.Category;
import model.Reply;
import model.Topic;
import model.User;



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

        User user = getSessionAttr("user");
        Integer admin = 0;
        Integer userId =0;
        if(user == null ){
            setAttr("admin",admin);
            setAttr("userId",userId);
        }else{
            userId = user.getId();
            admin=user.getAdmin();
            setAttr("admin",admin);
            setAttr("userId",userId);
        }
        renderFreeMarker("view.ftl");
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
    @Before({Login.class,CategoryNabarInterceptor.class})
   public void add_topics(){
        String sql="SELECT * FROM t_category WHERE t_category.deleted = 0";
        List<Category> categories = Category.dao.find(sql);
        setAttr("categories",categories);
        renderFreeMarker("add_topics.ftl");
   }
    public void save(){
        String topic_name = getPara("topic_name");
        String topic_content = getPara("topic_content");
        Integer category_id = getParaToInt("category_id");
        User user = getSessionAttr("user");
        Integer userId = user.getId();

        Topic topic = new Topic();
        topic.setTitle(topic_name);
        topic.setContent(topic_content);
        topic.setUserId(userId);
        topic.setCategoryId(category_id);
        Boolean success=false;
        try {
            success=true;
            topic.save();
        }catch (Exception e){
            LogKit.error("贴子添加失败，原因是"+e.getMessage());
        }
        String message=success ? "添加成功":"添加失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }
    @Before({Login.class,CategoryNabarInterceptor.class})
    public void modify(){

            Integer topic_id = getParaToInt(0, -1);
            //获取发帖用户的id
            Integer user_id = getParaToInt(1, -1);

            //获取当前登录用户的id：
            User user = getSessionAttr("user");
            Integer now_id=user.getId();

            String sql="SELECT t_user.* FROM t_user WHERE t_user.`admin`=1 AND t_user.`id`= ? ";
            List<User> users = User.dao.find(sql,user.getId());
            Topic topics = Topic.dao.findById(topic_id);
            if( ! users.isEmpty() || user_id .equals(now_id)){
                setAttr("topic",topics);
                renderFreeMarker("topic_modify.ftl");
            }else{
                renderHtml("对不起，你没有这个权限！");
              /*  setAttr("topic",topics);
                renderFreeMarker("topic_modify.ftl");*/
            }
    }
    @Before({Login.class, TopicFormValidator.class})
    public void update(){
        //固定操作取到板块的名称 和板块的id
        String name = getPara("name");
        Integer id=getParaToInt("id",-1);
        String topic_content = getPara("topic_content");
        Topic topic = new Topic();
        topic.setId(id);
        topic.setTitle(name);
        topic.setContent(topic_content);
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

        //获取发帖用户的id
        Integer user_id = getParaToInt(1, -1);

        //获取当前登录用户的id：
        User user = getSessionAttr("user");
        Integer now_id=user.getId();

        //查询当前用户是否是管理员
        String sql="SELECT t_user.* FROM t_user WHERE t_user.`admin`= 1 AND t_user.`id`= ? ";
        List<User> users = User.dao.find(sql,user.getId());
        //删除贴子（相当于更新操作）

        Topic topic = new Topic();
        topic.setId(topic_id);
        topic.setDeleted(deleted);

        //删除成功地标志
        Boolean success=false;
        //是管理员吗  或者说 是不是发帖用户本人登陆了系统
        if( ! users.isEmpty()|| now_id.equals(user_id)){
            try {
                success=true;
                topic.update();
            }catch (Exception e){
                LogKit.error("板块删除失败，原因是"+e.getMessage());
            }
            String message=success ? "删除成功":"删除失败";
            renderHtml(message + "</br><a href='/index '>返回主页</a>");
        }
        else{
            renderHtml("对不起，你没有这个权限！");
        }
    }
    @Before({CategoryNabarInterceptor.class})
    public void reply_modify(){
        Integer reply_id = getParaToInt(0, -1);
       String sql ="SELECT t_reply.* FROM  t_reply WHERE t_reply.`id`= ?";
        Reply reply = Reply.dao.findById(sql,reply_id);
        if(reply != null ){
            setAttr("reply",reply);
            renderFreeMarker("reply_modify.ftl");
        }else{
            renderHtml("<h3>回帖内容不存在！！</h3>");
        }
    }
    @Before({Login.class,ReplyFormValidator.class})
    public void reply_update(){
        String contents = getPara("contents");
        Integer reply_id = getParaToInt("reply_id");
        Boolean success = false;
        String sql="update t_reply set t_reply.content = ? WHERE t_reply.id = ?";
        try {
           Db.update(sql,contents,reply_id);
            success =true;
        }catch (Exception e){
            LogKit.error("内容更新失败，原因是"+e.getMessage());
        }
        String message = success ? "更新成功":"更新失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }
    @Before({Login.class})
   public  void reply_delete(){
        Integer reply_id = getParaToInt(0,-1);
        String sql="update t_reply set t_reply.deleted = 1 WHERE t_reply.id = ? ";
        Boolean success=false;
        try {
            Db.update(sql,reply_id);
            success=true;
        }catch (Exception e){
            LogKit.error("删除失败，原因是"+e.getMessage());
        }
            String message=success ? "删除成功":"删除失败";
            renderHtml(message + "</br><a href='/index'>返回主页</a>");
    }
}
