<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录界面</title>
    <style type="text/css">
        #errmsg{
            color:red;
        }
    </style>
</head>
<body>
<form action="/loginCheck" method="post">
    用户名：<input type="text" name="username" autocomplete="off" placeholder="请输入用户名"><br>
    密码：<input type="password" name="password" autocomplete="off" placeholder="请输入密码"><br>
    <input type="submit" value="登录">
</form>
<div id="errmsg">${errmsg!""}</div>
</body>
</html>