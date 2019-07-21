<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
    <link href="${pageContext.request.contextPath}/css/orders.css" rel="Stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/header.css" rel="Stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="Stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/personage.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="top.jsp"/>
<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li><a href="">首页<span>&gt;</span>个人中心</a></li>
    </ul>
</div>
<!--我的订单内容区域 #container-->
<jsp:include page="left.jsp"/>
    <!-- 右边栏-->
    <!--个人信息头部-->
    <div class="rightsidebar_box rt">
        <div class="rs_header">
            <span ><a href="${pageContext.request.contextPath}/web/view/person/${sessionScope.onLineUser.id}">我的信息</a></span>
            <span class="rs_header_active"><a href="${pageContext.request.contextPath}/web/view/person/password/${sessionScope.onLineUser.id}">安全管理</a></span>
        </div>

        <!--安全管理 -->
        <div class="rs_content">
            <p class="change_password_title">更改密码</p>
            <div class="new_password">
                <span class="word">输入旧密码：</span><input type="password" name ="old_passwrod"/><span class="change_hint msg_default msg_check" id="old_pass_info"></span>
            </div>
            <div class="new_password">
                <span class="word">输入新密码：</span><input type="password"name="new_password"/><span class="change_hint msg_default msg_check" id="new_pass_info"></span>
            </div>
            <div class="confirm_password">
                <span class="word">确认新密码：</span><input type="password" name="confirm_password"/><span class="confirm_hint msg_default msg_check" id="confirm_pass_info"></span>
            </div>
            <div class="save_password">
                保存更改
            </div>
        </div>


    </div>
</div>

<!-- 品质保障，私人定制等-->
<jsp:include page="foot.jsp"/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/orders.js"></script>
<script type="text/javascript">
$('[name=old_passwrod]').blur(function(){
	var data=$(this).val();
	if(data.length==0){
		$('#old_pass_info').text('密码不可为空');
		$("#old_pass_info").removeClass('msg_default msg_error msg_success');
		$("#old_pass_info").addClass('msg_error');
	}else if(data.length<6||data.length>12){
		$('#old_pass_info').text('密码长度应该在6到12位');
		$("#old_pass_info").removeClass('msg_default msg_error msg_success');
		$("#old_pass_info").addClass('msg_error');
	}else{
		$('#old_pass_info').text('正在查询中...');
		$("#old_pass_info").removeClass('msg_default msg_error msg_success');
		$("#old_pass_info").addClass('msg_default');
		$.ajax({
			url:'${pageContext.request.contextPath}/web/action/checkPassword/${sessionScope.onLineUser.id}',
			type:'POST',
			data:{'password':data},
			dataType:'json',
			success:function(msg){
				if(msg.code==1){
					$('#old_pass_info').text('密码正确');
					$("#old_pass_info").removeClass('msg_default msg_error msg_success');
					$("#old_pass_info").addClass('msg_success');
				}else{
					$('#old_pass_info').text('密码错误');
					$("#old_pass_info").removeClass('msg_default msg_error msg_success');
					$("#old_pass_info").addClass('msg_error');
				}
			},
			error:function(){
				$('#old_pass_info').text('查询失败');
				$("#old_pass_info").removeClass('msg_default msg_error msg_success');
				$("#old_pass_info").addClass('msg_error');
			}
		});
	}
});
$('[name=new_password]').blur(function(){
	var data=$(this).val();
	if(data.length==0){
		$('#new_pass_info').text('密码不可为空');
		$("#new_pass_info").removeClass('msg_default msg_error msg_success');
		$("#new_pass_info").addClass('msg_error');
	}else if(data.length<6||data.length>12){
		$('#new_pass_info').text('密码长度应该在6到12位');
		$("#new_pass_info").removeClass('msg_default msg_error msg_success');
		$("#new_pass_info").addClass('msg_error');
	}else{
		$('#new_pass_info').text('密码符合');
		$("#new_pass_info").removeClass('msg_default msg_error msg_success');
		$("#new_pass_info").addClass('msg_success');
	}
});
$('[name=confirm_password]').blur(function(){
	var data=$(this).val();
	if(data.length==0){
		$('#confirm_pass_info').text('密码不可为空');
		$("#confirm_pass_info").removeClass('msg_default msg_error msg_success');
		$("#confirm_pass_info").addClass('msg_error');
	}else if(data.length<6||data.length>12){
		$('#confirm_pass_info').text('密码长度应该在6到12位');
		$("#confirm_pass_info").removeClass('msg_default msg_error msg_success');
		$("#confirm_pass_info").addClass('msg_error');
	}else if(data!=$('[name=new_password]').val()){
		$('#confirm_pass_info').text('两次密码不符');
		$("#confirm_pass_info").removeClass('msg_default msg_error msg_success');
		$("#confirm_pass_info").addClass('msg_error');
	}else{
		$('#confirm_pass_info').text('密码符合');
		$("#confirm_pass_info").removeClass('msg_default msg_error msg_success');
		$("#confirm_pass_info").addClass('msg_success');
	}
});
$('.save_password').click(function(){
	if($('[name=confirm_password]').val()!=$('[name=new_password]').val()){
		$('#confirm_pass_info').text('两次密码不符');
		$("#confirm_pass_info").removeClass('msg_default msg_error msg_success');
		$("#confirm_pass_info").addClass('msg_error');
	}
	var length=0;
	$('.msg_check').each(function() {
		if ($(this).hasClass('msg_success')) {
			length++;
		}
	});
	var data={
			'oldPass':$('[name=old_passwrod]').val(),
			'newPass':$('[name=new_password]').val(),
			'confirmPass':$('[name=confirm_password]').val()
		};
	if(length==3){
		$.ajax({
			url:'${pageContext.request.contextPath}/web/action/person/updataPassword/{id}',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg.code==1){
					$(location).attr('http',"${pageContext.request.contextPath}/web/"+msg.data.url);
				}else{
					alert("密码更新失败");
				}
			},
			error:function(){
				alert("服务器繁忙...");
			}
		});
	}
});
</script>
<style type="text/css">
.msg_error {
	background-color: #D00;
}

.msg_success {
	background-color: #0d0;
}

.msg_default {
	background-color: #999;
}

.msg_check {
	/* float: right; */
	color: #FFF;
	/* padding: 4px; */
	margin-top: 20px;
	margin-left: 10px;
	border-radius: 2px;
	font: 14px "simhei", Arial, Helvetica, sans-serif;
	/* font: 16px; */
}
</style>
</html>