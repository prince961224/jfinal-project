<#-- @ftlvariable name="categories" type="java.util.List<model.Category>" -->
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
<table border="1" cellpadding="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>名称</th>
            <th>Operation</th>
        </tr>
    </thead>
<tbody>
    <#list categories as category>
        <tr>
             <td>${category.id}</td>
             <td>${category.name}</td>
             <td><a href="/category/modify/${category.id}">modify</a> |  <a href="/category/delete/${category.id}">delete</a></td>
        </tr>
    </#list>
</tbody>
</table>
<div>
    <a href="/category/add"> Add Category</a>
</div>
</body>
</html>