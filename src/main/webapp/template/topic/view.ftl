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
                <#list replies as reply>
                        <div class="ui divider"></div>
                        <h4 class="ui image header">
                            <img src="${base}/images/category.png" class="ui mini rounded image">
                            <div class="content " style="margin-top: 0px;margin-bottom: 0px"> ${reply.user_nickname} 回复于 ${reply.pub_date}
                                &nbsp; &nbsp; &nbsp; &nbsp;${reply_index+1}楼
                            </div>
                        </h4>
                             <div class="center six centered">
                                 &nbsp;&nbsp; &nbsp;&nbsp; ${reply.content}
                             </div>
                </#list>
            <div>
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