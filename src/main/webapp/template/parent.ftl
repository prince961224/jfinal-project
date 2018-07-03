<#-- @ftlvariable name="topics" type="java.util.List<model.Topic>" -->
<#-- @ftlvariable name="categories" type="java.util.List<model.Category>" -->
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css">
    <@block name="head"></@block>
    <style type="text/css">
      li{
            display: inline;
        }
      li a{
          color:white;
      }
      li a:hover{
            background:turquoise;
        }
    </style>
    <#--显示时间和日期的scripts-->
    <script type="text/javascript">
        function setdatetime(){
            var  date=new Date();
            var  day=date.getDay();
            var week;
            switch(day){
                case 0:week="星期日";break;
                case 1:week="星期一";break;
                case 2:week="星期二";break;
                case 3:week="星期三";break;
                case 4:week="星期四";break;
                case 5:week="星期五";break;
                case 6:week="星期六";break;
            }
            var hours;
            var today;
            if(date.getHours()<10){
                today=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+week+" "+"0"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
            }
            else {
                today = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()  +" "+week+" "+ date.getHours()+ ":" + date.getMinutes() + ":"+date.getSeconds();
            }
            document.getElementById("today").innerHTML=today;
        }
        window.setInterval("setdatetime()", 1000);
    </script>
    <title><@block name="title"></@block></title>

</head>
<body>
<nav>
    <div class="ui inverted menu">
       <#-- 这部分是主页和时间-->
                    <li class="item"><a href="#"></a></li>
                    <li class="item"><a href="${base}/index">主页</a></li>
                    <#list categories as category>
                    <li class="item"><a href="${base}/category/${category.id}">${category.name!""}</a></li>
                    </#list>
                   <li class="item" id="today"></li>
         <#--  这部分是右边的小人头像-->
        <div class="right menu">
            <div class="ui dropdown item"><i class="user icon"></i>
                <i class="icon dropdown"></i>
                <div class="menu">
                    <#if (session.user)??>
                        <a href="${base}/logout" class="item">退出系统</a>
                        <a href="${base}/user/change" class="item">修改信息</a>
                    <#else>
                        <a href="${base}/register" class="item">注册</a>
                        <a href="${base}/login" class="item">登录 </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <div style="font-size: 25px;text-decoration-color: #DFDFDF;text-align: center;font-family:微软雅黑" >
        <img src="${base}/images/category.png" class="ui avatar image"  > 皮 皮 乐
    </div>
</nav>
<@block name="content">

<div class="ui grid container eleven wides column " id="main-container" style="margin-top:20px;" >
    <div class="twelve wides column" >
        <div class="ui rai sed segment" >
            <div class="ui divided list">
                <div>
                  <h2 style="color: #0ea432 " class="ui '黑体'" >热帖榜</h2>
                </div>
                <#list topics as topic>
                    <div class="item">
                        <div class="content">
                            <div class="header">
                                <a href="${base}/topic/${topic.id}">${topic.title}</a>&nbsp;&nbsp;
                                <div class="ui mini circular blue label">
                                    回复
                                    <div class="detail" >${(topic.reply_count)!'0'}</div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="right floated content">
                                <span>
                                    <a href="${base}/category/${topic.category_id}">${topic.category_name !""}</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
   </div>
    <#if (admin==1)>
        <div class="ui three wides column " style=" float: right">
            <div class="ui vertical menu">
                <div class="item">
                    <a href="${base}/category/list" class="blue ui blue button ">板块管理</a>
                </div>
            <#--<div class="item">B</div>
            <div class="item">C</div>-->
            </div>
        </div>
    </#if>
</div>
</@block>
<footer >
    <div>
        <div class="ui inverted segment" id="footer">
            <div class="ui text center aligned container">宁夏大学 信息工程学院 计算机科学与技术专业  于兴胜  &copy;2015-2019</div>
        </div>
    </div>
</footer>

</body>
<@block name="additional">
<script>
    $('.dropdown').dropdown();
    $('#sidebar-icon').click(function () {
        $('.sidebar.menu').sidebar('toggle');
    });
</script>
</@block>
</html>