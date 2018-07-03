<#-- @ftlvariable name="categories" type="java.util.List<Category>" -->
<@override name="title">
    发帖
</@override>
<@override name="content">
    <div class="ui grid container">
        <div class="ui centered twelve wide column " style="margin-top:100px;" >
            <h2 class="header centered six wide column ">增加贴子</h2>
            <form  method="post" class="ui fluid form" id="category-form">
                <div class="field">
                    <input type="text" name="topic_name" placeholder="请输入贴子名称" autocomplete="off">
                    <textarea name="topic_content" placeholder="请输入贴子的内容" autocomplete="off"></textarea>
                </div>
                <div class="ui error message"></div>

                <div class="ui floating dropdown labeled search icon button">
                    <i class="world icon"></i>
                    <span class="text">选择板块</span>
                    <div class="menu">
                        <#if (session.user)??>
                            <#list categories as category>
                            <input type="hidden" name="category_id" id="category_id" value="${category.id}"/>
                            <div class="item">${category.name}</div>
                            </#list>
                        </#if>
                    </div>
                </div>
                <div class="ui field ten wide column" style="margin-bottom:339px">
                    <input type="button" value="添加贴子" class="ui two primary blue button" onclick="addCategory()">
                    <a type="button" href='${base}/index' class="ui two red button">返回主页</a>
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
                           topic_name:{
                                rules:[
                                    {
                                        type:'empty',
                                        prompt:'版块名称不能为空'
                                    }
                                ]
                            },
                            topic_content:{
                                rules:[
                                    {
                                        type:'empty',
                                        prompt:'贴子内容不能为空'
                                    }
                                ]
                            },
                            category_id:{
                                rules:[
                                    {
                                        type:'empty',
                                        prompt:'板块没有选择！'
                                    }
                                ]
                            }
                        }
                    }
            );
    function addCategory() {
        $('#category-form').form('validate form');
        if($('#category-form').form('is valid')){
            $.ajax({
                url:'${base}/topic/save',
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