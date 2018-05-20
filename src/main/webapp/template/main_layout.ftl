<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<#--/**使用semantic-ui**/-->
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="/styles/semantic.min.css">
    <style type="text/css">
        .errmsg{
            color: red;
        }
    </style>
    <title>欢迎来到主页面</title>
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
</head>
<body>
<div class="ui top attached inverted nav menu">
    <a href="" class="item">Index</a>
    <a href="" class="item">Campus</a>
    <a href="/music_palyer" class="item">Music</a>
    <a href="/login" class="item">Login</a>
    <a href="" class="float right item" id="today"></a>
</div>
<div style="font-size: 25px;text-decoration-color: #DFDFDF;text-align: center;font-family: 黑体" >
        尊敬的${name !""} 欢迎来到XX论坛
</div>
<#--
<div class="ui grid container">
    <div class="eight wides centered column">
        <div class="ui inverted teal segment">
            <form action="/main" method="post" class="ui fluid form">
                <div>
                <h1>hello</h1>
                </div>
                <div class="ui center errmsg">
                ${errmsg!""}
                </div>
            </form>
        </div>
    </div>
</div>-->
<div class="ui grid container " id="main-container" style="margin-top: 20px;">
    <div class="twelve wides column">
        <div class="ui raised segment">
            <div class="ui divided list">
                <div>热帖榜</div>
                <#list topics as topic>
                    <div class="item">
                        <div class="content">
                            <div class="header"><a href="/topic/${topic.id}">${topic.title}</a>&nbsp;&nbsp;
                                回复:${topic.reply_count}
                            </div>
                        </div>
                        <div>
                            <div class="right floated content">
                                <span>${topic.category_name !""}</span>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="ui inverted segment" id="footer">
        <div class="ui text center aligned container">于兴胜 @2018-520</div>
    </div>
</div>
</body>
</html>