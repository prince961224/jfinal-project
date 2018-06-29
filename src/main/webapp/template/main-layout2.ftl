<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <script src="${base}/scripts/jquery.serialize-object.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css">
<@block name="head"></@block>
    <title><@block name="title"></@block></title>
    <style type="text/css">
        #main-container {
            margin-top: 15px;

        }

        #footer {
            margin-top: 25px;
            position: fixed;
            bottom: 0;
            width: 100%;

        }

        @media only screen and (max-width: 700px) {
            .hidemobile {
                display: none !important;
            }

        }

        @media only screen and (min-width: 700px) {
            .hidepc {
                display: none !important;
            }

        }
    </style>
</head>
<body>
            <div class="ui sidebar inverted vertical menu" id="sidebar">
                <a href="${base}/" class="item">主页</a>
                <#list categories as category>
                    <a href="${base}/category/${category.id}" class="item">${category.name!''}</a>
                </#list>
            </div>
    <div class="pusher">
        <div class="ui large top fixed inverted menu" id="navbar">
            <a href="#" class="hidepc item" id="sidebar-icon"><i class="sidebar icon"></i></a>
            <a href="${base}/" class="hidemobile active item">主页</a>

        <#list categories as category>
            <a class="hidemobile item" href="${base}/category/${category.id}" class="item">${category.name!''}</a>
        </#list>

            <div class="right menu">
                <div class="ui dropdown item"><i class="user icon"></i><i class="icon dropdown"></i>
                    <div class="menu">
                    <#if (session.user)??>
                        <a href="${base}/logout" class="item">退出</a>
                    <#else>
                        <a href="${base}/register" class="item">注册</a>
                        <a href="${base}/login" class="item">登录 </a>
                    </#if>
                    </div>
                </div>
            </div>
        </div>


    <div class="ui grid stackable container" id="main-container" style="margin-bottom:30px;">
    <@block name="main-content">

    </@block>

    </div>
    <div class="ui inverted segment" id="footer">
        <div class="ui text center aligned container">宁夏大学信息工程学院 &copy;2018-2020</div>
    </div>
</div>
</body>
<@block name="additional">
<script>
    $('.dropdown').dropdown();
    $('#sidebar-icon').click(function () {
        $('.sidebar.menu').sidebar('toggle');
    });
</script>
</@block>
</html>