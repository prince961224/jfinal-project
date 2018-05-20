<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎来到登录界面</title>
    <style type="text/css">
        #errmsg{
            color:red;
        }
    </style>
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
            var today=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+week+" "+date.getHours()+"时"+date.getMinutes()+"分"+date.getSeconds()+"秒";
            document.getElementById("today").innerHTML=today;
        }
        window.setInterval("setdatetime()", 1000);
    </script>

</head>
<body>
<div id="today" align="right" style="background-color: #DFDFDF"></div>
<div>
    <form action="/loginCheck" method="post">
        用户名：<input id="username" type="text" name="username" autocomplete="off" placeholder="请输入用户名"><br>
        密　码：<input id="password" type="password" name="password" autocomplete="off" placeholder="请输入密码"><br>
        <input type="submit" value="登录">
    </form>
</div>
<div id="errmsg">${errmsg!""}</div>
</body>
</html>