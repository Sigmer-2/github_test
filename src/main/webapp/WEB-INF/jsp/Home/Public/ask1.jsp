<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/25
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="max-age=72000"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width"/>
    <meta name="HandheldFriendly" content="true"/>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">

    <rapid:block name="header-style">

    </rapid:block>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/layui/layui.js"></script>

</head>

<body>
<div id="page" class="site" style="transform: none;">


    <div id="content" class="site-content" style="transform: none;">
        <rapid:block name="left"></rapid:block>
        <rapid:block name="right">
        </rapid:block>
    </div>

    <div class="clear"></div>
    <rapid:block name="link"></rapid:block>


</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/superfish.js"></script>
<script src='/js/sticky.js'></script>
<script src="/js/script.js"></script>
<script src="/plugin/layui/layui.all.js"></script>




<div class="layui-main">
    <ul class="flow-default" id="ask" lay-filter="ask" >
    </ul>
</div>




<script>

    layui.use(['element','jquery','layer','util','flow'], function() {
        var element = layui.element,
            $ = layui.$,//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
            layer = layui.layer,
            util = layui.util;
        var flow = layui.flow;

        flow.load({
            elem: '#ask',
            /*scrollElem: '#ask',*/
            isAuto: false,
            isLazyimg: true,
            //end: '<p style="color:red">没有更多了</p>',   //加载所有后显示文本，默认'没有更多了'
            done: function (page, next) {
                  /* console.info(page);*/
                //模拟插入
                setTimeout(function () {
                    var lis = [];
                    $.get('flow?page=' + page + '&limit=5',
                        function (res) {
                            console.log(res);
                            console.log(res.data);
                            //假设你的列表返回在data集合中
                            layui.each(res.data.list, function (index, item) {
                               /* for(var i=0;i<data.list.length;i++){
                                    data.list[i]
                                }*/
                               console.log(item);
                                //console.log(data.list);
                                //console.log(list);
                                lis.push('<li>' + item.articleTitle + '</li>');



                            });
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page <res.pages); //总页数
                        });
                }, 200);
            }
        });
    });

</script>

</body>


</html>
