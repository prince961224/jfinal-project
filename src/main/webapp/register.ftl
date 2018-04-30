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
    <title>欢迎来到注册页面</title>
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
    <a href="" class="item">Music</a>
    <a href="" class="item">Login</a>
    <a href="" class="float right item" id="today"></a>
</div>
<div style="font-size: 25px;text-decoration-color: #DFDFDF;text-align: center;font-family: 黑体" >
    欢迎来到我的个人博客
</div>
    <div class="ui grid container">
        <div class="eight wides centered column">
            <div class="ui inverted teal segment">
                <form action="/registercheck" method="post" class="ui fluid form">

                    <div class="field">
                        <label>用户名</label>
                        <input  id="username"  type="text" name="username" placeholder="请输入用户名" autocomplete="off">
                    </div>

                    <div class="field">
                        <label> 密　码</label>
                        <input  id="password"   type="password" name="password" autocomplete="off" placeholder="请输入密码">
                    </div>

                    <div class="field">
                        <label>昵　称</label>
                        <input id="nickname" type="text" name="nickname" placeholder="请输入昵称" autocomplete="off">
                        <#--备　注:<textarea id="role" name="role" cols="15" rows="10" placeholder="备注" autocomplete="off"></textarea><br/>-->
                    </div>

                    <div class="ui primary fluid  button" >
                        <input type="submit" value="注册">
                    </div>
                    <div class="ui center errmsg">
                    ${errmsg!""}
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>