<#-- @ftlvariable name="topic" type="java.util.List<model.Topic>" -->
<@override name="title">
    贴子处理
</@override>
<@override name="content">
 <div class="ui grid container">
     <div class="ui centered twelve wide column " style="margin-top:100px;" >
         <h2 class="header centered six wide column ">更新贴子名称、内容</h2>
         <form  method="post" class="ui fluid form" id="category-form">
             <div class="field">
                 <input type="text" name="name" placeholder="更新贴子名称" autocomplete="off" value="${topic.title}" />
             </div>
             <div>
                 <input type="text" name="topic_content" id="topic_context" value="${topic.content}" >
             </div>
             <div class="ui error message"></div>
             <div class="ui field ten wide column" style="margin-bottom:339px">
                 <input type="hidden" name="id" value="${topic.id}"/>
                 <input type="button"  name="name" class="ui two primary blue button" onclick="updateCategory()" value="更新">
                 <a type="button" href='${base}/category/${topic.category_id}' class="ui two red button">返回板块列表</a>
             </div>
         </form>
     </div>
 </div>
</@override>

<@override name="additional">
    <@super />
<script>
    $('#category-form')
            .form({
                        fields:{
                            name:{
                                rules:[{
                                        type:'empty',
                                        prompt:'贴子名称不能为空'
                                    }
                                ]
                            },
                            topic_content:{
                                rules:[{
                                    type:'empty',
                                    prompt:'贴子名称不能为空'
                                }]
                            }
                        }
                    }
            );
    function updateCategory() {
        $('#category-form').form('validate form');
        if($('#category-form').form('is valid')){
            $.ajax({
                url:'/topic/update',
                type:'post',
                data:$('#category-form').serialize(),
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