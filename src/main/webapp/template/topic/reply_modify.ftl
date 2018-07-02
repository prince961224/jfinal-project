<#-- @ftlvariable name="reply" type="java.util.List<model.Reply>" -->
<@override name="title">
    更新回帖内容
</@override>
<@override name="content">
    <div class="ui grid container">
        <div class="ui centered twelve wide column " style="margin-top:100px;" >
            <h2 class="header centered six wide column ">更新回帖内容</h2>
            <form class="ui fluid form" id="reply-form">
                <div class="field">
                    <input type="text" name="contents" cols="30" rows="10" placeholder="更新回帖内容" autocomplete="off" value="${reply.content}"/>
                </div>
                <div class="ui error message"></div>
                <div class="ui field ten wide column" style="margin-bottom:339px">
                    <input type="hidden" name="reply_id" value="${reply.id}"/>
                    <input type="button" name="name" class="ui two primary blue button" onclick="updateReply()" value="更新">
                    <a type="button" href='${base}/index' class="ui two red button">返回主页</a>
                </div>
            </form>
        </div>
    </div>
</@override>

<@override name="additional">
    <@super />
<script>
    $('#reply-form')
            .form({
                        fields:{
                           contents:{
                                rules:[
                                    {
                                        type:'empty',
                                        prompt:'回帖内容不能为空'
                                    }
                                ]
                            }
                        }
                    }
            );

    function updateReply() {
        $('#reply-form').form('validate form');
        if($('#reply-form').form('is valid')){
            $.ajax({
                url:'${base}/topic/reply_update',
                type:'post',
                data:$('#reply-form').serialize(),
                success:function (res) {
                    alert(res.message);
                }
            })
        }
    }
</script>
</@override>
<@extends name="../parent.ftl">
</@extends>