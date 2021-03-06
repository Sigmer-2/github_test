<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册页</title>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>/layui/css/style.css">
</head>
<body>

<div class="login-main">
    <header class="layui-elip" style="width: 82%">注册</header>

    <!-- 表单选项 -->
    <form class="layui-form">
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="username" name="username" required lay-verify="required" placeholder="请输入用户名"
                       autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd" name="repassword" required lay-verify="required" placeholder="请确认密码"
                       autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%"/>
        <p style="width: 85%"><a href="login" class="fl">已有账号？立即登录</a><a href="forget" class="fr">忘记密码？</a></p>
    </form>
</div>


<script src="<%=basePath%>/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;

        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function (data) {
            var param = {"username": $("#username").val(), "password": $("#password").val()};
            $.ajax({
                url: '<%=basePath%>user/register',
                type: 'post',
                data: JSON.stringify(param),
                contentType: 'application/json',
                dataType: 'json',
                success: function (result) {
                    if (result.status == 1) {
                        layer.msg('注册成功');
                        ///location.href = "login.html";
                    } else if (result.status == 0) {
                        layer.msg('注册失败');
                    } else {
                        layer.msg('该用户名已经被占用');
                    }
                }
            })
            //防止页面跳转
            return false;
        });


        // you code ...
        // 为密码添加正则验证
        $('#password').blur(function () {
            var reg = /^[\w]{6,12}$/;
            if (!($('#password').val().match(reg))) {   //不合法
                //layer.msg('请输入合法密码');
                $('#pwr').removeAttr('hidden'); //显示
                $('#pri').attr('hidden', 'hidden');  //隐藏
                layer.msg('请输入合法密码(6-12位字符 可包含：大小写字母 数字 下划线)');
            } else { //合法
                $('#pri').removeAttr('hidden');  //显示
                $('#pwr').attr('hidden', 'hidden');  //隐藏
            }
        });

        //验证两次密码是否一致
        $('#rpwd').blur(function () {
            if ($('#password').val() != $('#rpwd').val()) {
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden', 'hidden');
                layer.msg('两次输入密码不一致!');
            } else {
                if($('#rpwd').val()!='') {
                    $('#rpri').removeAttr('hidden');
                    $('#rpwr').attr('hidden', 'hidden');
                }
            }
            ;
        });
    });
</script>
</body>
</html>