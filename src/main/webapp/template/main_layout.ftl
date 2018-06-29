<#-- @ftlvariable name="topics" type="java.util.List<model.Topic>" -->
<#-- @ftlvariable name="categories" type="java.util.List<model.Category>" -->
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <style type="text/css">
        li{
            display: inline;
        }

        li a{
            color:block;
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

    <@block name="head"></@block>
    <title><@block name="title"></@block></title>


</head>
<body>
<nav>
    <div class="ui inverted menu">
        <li class="item"><a href="/login">登录</a></li>
        <li class="item"><a href="/demo">主页</a></li>
        <#list categories as category>
        <li class="item"><a href="/category/${category.id}">${category.name!""}</a></li>
        </#list>
        <a href="" class="float right item" id="today"></a>
    </div>
    <div style="font-size: 25px;text-decoration-color: #DFDFDF;text-align: center;font-family: 黑体" >
        欢迎来到皮皮乐论坛
    </div>
</nav>

<@block name="content">
<div class="ui grid container " id="main-container" style="margin-top: 20px;">
    <div class="twelve wides column">
        <div class="ui raised segment">
            <div class="ui divided list">
                <div>热帖榜</div>
                <#list topics as topic>
                    <div class="item">
                        <div class="content">
                            <div class="header">
                                <a href="/topic/${topic.id}">
                                    ${topic.title}
                                </a>&nbsp;&nbsp;
                                回复:${topic.reply_count}
                            </div>
                        </div>
                        <div>
                            <div class="right floated content">
                                <span><a href="/category/${topic.category_id}">${topic.category_name !""}</a></span>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>
<div>
</@block>

    <footer >
        <div>
            <div class="ui inverted segment" id="footer">
                <div class="ui text center aligned container">宁夏大学 信息工程学院 计算机科学与技术专业 于兴胜 @2015-2019</div>
            </div>
        </div>
    </footer>
</body>
</html>