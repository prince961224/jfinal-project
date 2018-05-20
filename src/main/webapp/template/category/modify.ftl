<#-- @ftlvariable name="category" type="java.util.List<model.Category>" -->
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="/category/update" method="post">
    <input type="hidden" name="id" value="${category.id}"/>
   名称 <input  type="text" name="name" autocomplete="off" value="${category.name}"/></br>
    <input type="submit" value="modify"/>
</form>
</body>
</html>