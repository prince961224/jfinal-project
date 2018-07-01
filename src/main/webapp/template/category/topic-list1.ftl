<@override name="title">
    板块贴子列表管理
</@override>
    <@override name="content">
     <div style="margin-bottom:205px;margin-top: 50px;margin-left:100px">
        <div class="ui grid container" id="mian-container" >
            <table class="ui selectable inverted table">
                <thead>
                    <tr>
                        <th>贴子名称</th>
                        <th>发布人</th>
                        <th>发布时间</th>
                    </tr>
                </thead>
                <tbody>
                     <#list page.getList() as topic>
                 <tr>
                         <td>
                             <div class="ui ribbon label"><a href="${base}/topic/${topic.id!''}">${topic.title!''}</a></div>
                         </td>
                         <td>
                             <div>${topic.nickname !''} </div>
                         </td>
                         <td>
                             <div>${topic.pubDate!''}</div>
                         </td>
                     <td>
                         <div style="text-align: center" class="ui center six ">
                                <#if (session.user)??>
                                    <a href="/topic/modify/${topic.id}" class="ui center blue button">更新贴子</a> |
                                    <a href="/topic/delete/${topic.id}"class="ui center red button">删除贴子</a>
                                <#else>
                                    <span style="color:red;">请<a href="${base}/login">登录</a>后再处理操作</span>
                                </#if>
                         </div>
                     </td>
                 </tr>
                     </#list>
                </tbody>
            </table>
            <div>
                <#if page.getPageNumber() !=1 >
                    <a href="?page=${page.getPageNumber()-1}">上一页</a>
                 </#if>
                ${page.getPageNumber()}/${page.getTotalPage()}
                <#if page.getPageNumber() != page.getTotalPage() >
                    <a href="?page=${page.getPageNumber()+1}">下一页</a>
                </#if>
            </div>
         </div>
    </div>
    </@override>
<@extends name="../parent.ftl"></@extends>
