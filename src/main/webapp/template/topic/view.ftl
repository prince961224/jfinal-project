<#-- @ftlvariable name="topic" type="java.util.List<model.Topic>" -->
<@override name="head">
<script rel="stylesheet" src="${base}/scripts/vue-resource.min.js"></script>
<script rel="stylesheet" src="${base}/scripts/vue.min.js"></script>
<style>
    p{
        color: #3c5876;
    }
    h1{
        text-align: center;
        font-family: 仿宋;
        font-size: 25px;
    }
</style>
</@override>
<@override name="title">欢迎来到XXX贴子</@override>

<@override name="content">
    <div class="ui sixteen wide column " id="content" style="margin-left: 40px; margin-right: 200px">
         <div class="ui basic segment">
            <h1>${ (topic.title) ! '无标题'}</h1>
                <div class="ui basic segment">
                    <p style="font-size:1.1rem;text-indent: 2rem;">${(topic.content)!'无内容'}</p>
                </div>
                <#list page.getList() as reply>
                        <div class="ui divider"></div>
                        <h4 class="ui image header">
                            <img src="${base}/images/category.png" class="ui mini rounded image">
                            <div class="content " style="margin-top: 0px;margin-bottom: 0px">
                                ${reply.user_nickname} 回复于 ${reply.pub_date}
                                   &nbsp; &nbsp; &nbsp; &nbsp;
                                 ${(page.getPageNumber()-1)*10+(reply_index+1)}楼
                            </div>
                        </h4>
                             <div class="center six centered">
                                 &nbsp;&nbsp; &nbsp;&nbsp; ${reply.content}
                                <#-- 验证是否是管理员登录 或者 发帖本人登录了？-->

                                 <#if admin == 1>
                                      <div class="ui three wides" style="float: right">
                                          <a href="${base}/topic/reply_modify/${reply.id}" class="ui button blue one "> 更新 </a>
                                          <a href="${base}/topic/reply_delete/${reply.id}" class="ui button red one ">  删除 </a>
                                      </div>
                                 <#elseif ( reply.user_id == userId )>
                                     <div class="ui three wides" style="float: right">
                                         <a href="/topic/reply_modify/${reply.id} " class="ui button blue one "> 更新 </a>
                                         <a href="/topic/reply_delete/${reply.id} " class="ui button red one ">  删除 </a>
                                     </div>
                                 </#if>
                             </div>

                </#list>
                 <div style="text-align: center"  class="six wides" >
                     <#if page.getPageNumber() !=1 >
                        <a href="?page=${page.getPageNumber()-1}">上一页</a>
                     </#if>
                         ${page.getPageNumber()}/${page.getTotalPage()}
                    <#if page.getPageNumber() != page.getTotalPage() >
                        <a href="?page=${page.getPageNumber()+1}">下一页</a>
                    </#if>
                 </div>
                  <div style="margin-top: 50px;margin-bottom: 20px">
                    <#if (session.user)??>
                        <form action="${base}/topic/reply">
                            <input type="hidden" name="user_id" value="${session.user.id}">
                            <input type="hidden" name="topic_id" value="${topic.id}">
                            回复内容<textarea name="context" id="context" cols="30" rows="10"></textarea>
                            <input type="submit" value="回复">
                        </form>
                    <#else>
                        <span style="color:red;">请<a href="${base}/login">登录</a>后再回复</span>
                    </#if>
                  </div>
         </div>
    </div>
</@override>
<@override name="additional">
    <@super/>
</@override>
<@extends name="../parent.ftl"></@extends>
