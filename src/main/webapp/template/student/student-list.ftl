<#-- @ftlvariable name="students" type="java.util.List<model.Student>" -->
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学生列表</title>
</head>
<body>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Remark</th>
    </tr>
    </thead>
    <tbody>
    <#list students as student>
    <tr>
        <td>${student.id}</td>
        <td>${student.name}</td>
        <td>${student.gender}</td>
        <td>${student.age}</td>
        <td>${student.remark}</td>
    </tr>
    </#list>
    </tbody>


</table>


</body>
</html>