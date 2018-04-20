<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加学生</title>
</head>
<body>
<form action="/student/save" method="POST">
    <label for="name">姓名:</label>
    <input id="name" type="text" name="name" placeholder="请输入姓名" autocomplete="off"> <br>

    <label for="gender">性别:</label>
    <select name="gender" id="gender">
        <option>男</option>
        <option>女</option>
    </select> <br>
    <label for="age">年龄:</label>
    <input id="age" type="text" name="age"  autocomplete="off" size="3"> <br>

    <label for="remark">备注:</label>
    <textarea name="remark" id="remark" cols="20" rows="10"></textarea> <br>
    <input type="submit" value="保存">
</form>
</body>
</html>