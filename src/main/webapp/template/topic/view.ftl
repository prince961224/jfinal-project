<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${topic.title}</title>
</head>
<body>
<h1>${topic.title}</h1>
<p>
${topic.content !""}
</p>

<ul>
<#list replies as reply>
   <li>
       ${reply.content}
       <br>_ _  <b>${reply.user_nickname}</b> 回复于${reply.pub_date}
   </li>
</#list>
</ul>
<#if (session.user)??>
<form action="${base}/topic/reply">
    <input type="hidden" name="user_id" value="${session.user.id}">
    <input type="hidden" name="topic_id" value="${topic.id}">
    回复内容<textarea name="context" id="context" cols="30" rows="10"></textarea>
    <input type="submit" value="回复">
</form>
</#if>

</body>
</html>