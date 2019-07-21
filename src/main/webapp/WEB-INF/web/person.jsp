<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>我的订单 - 达内学子商城</title>
<link href="${pageContext.request.contextPath}/css/orders.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/header.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/footer.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/personage.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/icon/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/css/icon/css/cropper.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/icon/css/sitelogo.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/icon/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="top.jsp" />
	<!-- 我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li><a href="${pageContext.request.contextPath}/web/view/index">首页</a>
				<span>&gt;</span> <a
				href="${pageContext.request.contextPath}/web/view/person/${sessionScope.onLineUser.id}">个人中心</a>
			</li>
		</ul>
	</div>
	<jsp:include page="left.jsp" />
	<!-- 右边栏-->
	<!--个人信息头部-->
	<div class="rightsidebar_box rt">
		<div class="rs_header">
			<span class="rs_header_active"><a href="${pageContext.request.contextPath}/web/view/person/${sessionScope.onLineUser.id}">我的信息</a></span>
			<span><a href="${pageContext.request.contextPath}/web/view/person/password/${sessionScope.onLineUser.id}">安全管理</a></span>
		</div>

		<!--个人信息具体内容 -->
		<div class="rs_content">
			<!--头像-->
			<div class="rs_content_headPortrait">
				<span class="same">我的头像：</span>
				<c:choose>
					<c:when test="${sessionScope.onLineUser.image!=null}">
						<img src="${sessionScope.onLineUser.image}" alt="" id="icon"
							width="50px" height="50px" />
					</c:when>
					<c:otherwise>
						<img
							src="${pageContext.request.contextPath}/images/personage/touxiang.png"
							alt="" id="icon" width="50px" height="50px" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="iconPic"
					value="${sessionScope.onLineUser.image}" id="iconPic"> <span
					class="change_headPortrait same_click" data-toggle="modal"
					data-target="#avatar-modal">更改头像</span>
			</div>
			<!--用户名-->
			<div class="rs_content_username">
				<span class="same">用户名：</span> <span class="same rs_username">${sessionScope.onLineUser.userName}</span>
				<input class="ed_username"
					value="${sessionScope.onLineUser.userName}" style="display: none;" />
				<span class="change_username same_click">更改用户名</span> <span
					id="check_username_info" class="msg_check"></span>
			</div>
			<!--性别-->
			<div class="rs_content_sex">
				<%-- <span class="same">性别：</span> <span class="man selected"> <img
					src="${pageContext.request.contextPath}/images/personage/select.png"
					alt="" />男
				</span> <span class="women"> <img
					src="${pageContext.request.contextPath}/images/personage/un_select.png"
					alt="" />女
				</span> --%>
				<c:choose>
					<c:when test="${sessionScope.onLineUser.gender==0}">
						<span class="same">性别：</span>
						<span class="man selected"> <img
							src="${pageContext.request.contextPath}/images/personage/select.png"
							alt="" />男
						</span>
						<span class="women"> <img
							src="${pageContext.request.contextPath}/images/personage/un_select.png"
							alt="" />女
						</span>
					</c:when>
					<c:otherwise>
						<span class="same">性别：</span>
						<span class="man"> <img
							src="${pageContext.request.contextPath}/images/personage/un_select.png"
							alt="" />男
						</span>
						<span class="women selected"> <img
							src="${pageContext.request.contextPath}/images/personage/select.png"
							alt="" />女
						</span>
					</c:otherwise>
				</c:choose>
			</div>
			<!--绑定电话-->
			<div class="rs_content_tel">
				<span class="same">绑定电话：</span> <input type="text" name="phone"
					value="${sessionScope.onLineUser.phone}" /><span
					id="check_phone_info" class="msg_check"></span>
			</div>
			<!--绑定邮箱-->
			<div class="rs_content_mail">
				<span class="same">绑定邮箱：</span> <input class="ed_email"
					value="${sessionScope.onLineUser.email}" style="display: none;" />
				<span class="rs_mail">${sessionScope.onLineUser.email}</span> <span
					class="same_click change_mail">更改邮箱</span><span
					id="check_email_info" class="msg_check"></span>
			</div>
			<!--保存按钮-->
			<div class="save">保存更改</div>
		</div>
	</div>
	</div>
	<!-- 头像插件 -->
	<div class="modal fade" id="avatar-modal" aria-hidden="true"
		aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
				<form class="avatar-form">
					<div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">×</button>
						<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput" style="line-height: 35px;">图片上传</label>
								<button class="btn btn-info" type="button" style="height: 35px;"
									onClick="$('input[id=avatarInput]').click();">请选择图片</button>
								<span id="avatar-name"></span> <input class="avatar-input hide"
									id="avatarInput" name="avatar_file" type="file">
							</div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg" id="imageHead"></div>
									<!--<div class="avatar-preview preview-md"></div> 
                        <div class="avatar-preview preview-sm"></div>-->
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-4">
									<div class="btn-group">
										<button class="btn btn-info fa fa-undo" data-method="rotate"
											data-option="-90" type="button" title="Rotate -90 degrees">
											向左旋转</button>
									</div>
									<div class="btn-group">
										<button class="btn  btn-info fa fa-repeat"
											data-method="rotate" data-option="90" type="button"
											title="Rotate 90 degrees">向右旋转</button>
									</div>
								</div>
								<div class="col-md-5" style="text-align: right;">
									<button class="btn btn-info fa fa-arrows"
										data-method="setDragMode" data-option="move" type="button"
										title="移动">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper("setDragMode", "move")">
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-search-plus"
										data-method="zoom" data-option="0.1" title="放大图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper("zoom", 0.1)"> <!--<span class="fa fa-search-plus"></span>-->
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-search-minus"
										data-method="zoom" data-option="-0.1" title="缩小图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper("zoom", -0.1)"> <!--<span class="fa fa-search-minus"></span>-->
										</span>
									</button>
									<button type="button" class="btn btn-info fa fa-refresh"
										data-method="reset" title="重置图片">
										<span class="docs-tooltip" data-toggle="tooltip" title=""
											data-original-title="$().cropper("
											reset")" aria-describedby="tooltip866214">
									</button>
								</div>
								<div class="col-md-3">
									<button id="button_save"
										class="btn btn-info btn-block avatar-save fa fa-save"
										type="button" data-dismiss="modal">保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/orders.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/personal.js"></script>
<script
	src="${pageContext.request.contextPath}/js/icon/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/icon/cropper.js"></script>
<script src="${pageContext.request.contextPath}/js/icon/sitelogo.js"></script>
<script
	src="${pageContext.request.contextPath}/js/icon/html2canvas.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	//做个下简易的验证  大小 格式  
	$('#avatarInput').on('change', function(e) {
		var filemaxsize = 1024 * 5;//5M 
		var target = $(e.target);
		var Size = target[0].files[0].size / 1024;
		if (Size > filemaxsize) {
			alert('图片过大，请重新选择!');
			$(".avatar-wrapper").childre().remove;
			return false;
		}
		if (!this.files[0].type.match(/image.*/)) {
			alert('请选择正确的图片!')
		} else {
			var filename = document.querySelector("#avatar-name");
			var texts = document.querySelector("#avatarInput").value;
			var teststr = texts; //你这里的路径写错了 
			testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的 
			filename.innerHTML = testend;
		}

	});

	$(".avatar-save").on("click", function() {
		var img_lg = document.getElementById('imageHead');
		// 截图小的显示框内的内容 
		html2canvas(img_lg, {
			allowTaint : true,
			taintTest : false,
			onrendered : function(canvas) {
				canvas.id = "mycanvas";
				//生成base64图片数据 
				var dataUrl = canvas.toDataURL("image/png");
				var newImg = document.createElement("img");
				newImg.src = dataUrl;
				imagesAjax(dataUrl)
			}
		});
	})
	function imagesAjax(src) {
		var data = {};
		data.img = src;
		$
				.ajax({
					url : "${pageContext.request.contextPath}/web/upload/portrait/${sessionScope.onLineUser.id}",
					data : data,
					type : "POST",
					dataType : 'json',
					success : function(re) {
						if (re) {
							if (re.code == 1) {
								$('#icon').attr('src', re.data.url);
								$('#iconPic').val(re.data.url);
							} else {
								alert("上传失败")
							}

						}
					}
				});
	}
</script>
<script type="text/javascript">
	$("#icon").click(function() {
		window.open($(this).attr("src"));
	})
</script>
<!--<script>
	$(".x").click(function(){
		$(".modal").hide();
	})
	$(".change_headPortrait").click(function(){
		$(".modal").show();
	})
</script>-->
<script>
	$("#button_save").click(function() {
		var url = $("#imageHead img").attr("src");
		$('#icon').attr('src', url);
	})
</script>
<script type="text/javascript">
	$('.save').click(function() {
		//判断用户名,手机号,邮箱号是否可用,如果按注册时一样的查询,会出现以下情况导致bug
		/*当用户输入的信息是原来的时候,查询会出现已被占用的情况无法导致无法更改,id,查询用户名是否存在，存在用id对照是否当前用户*/
		var imagePath = $('#iconPic').val();
		var name = $('.ed_username').val();
		var phone = $('[name=phone]').val();
		var email = $('.ed_email').val();
		var gender;
		var span = $('.rs_content_sex span');
		for (var i = 0; i < span.length; i++) {
			if ($(span[i]).hasClass('selected')) {
				if ($(span[i]).hasClass('man')) {
					gender = 0;
				}
				if ($(span[i]).hasClass('women')) {
					gender = 1;
				}
			}
		}

		var data = {
			"imagePath" : imagePath,
			"name" : name,
			"phone" : phone,
			"email" : email,
			"gender" : gender
		};
		var length = 0;
		$('.msg_check').each(function() {
			if ($(this).hasClass('msg_error')) {
				length++;
			}
		});
		if (length == 0) {
			updataUser(data);
		}else{
			alert('信息有误');
		}
	});
	function updataUser(data) {
		$.ajax({
			url : '${pageContext.request.contextPath}/web/action/updataUser/${sessionScope.onLineUser.id}',
			type : 'POST',
			data : data,
			dataType : 'json',
			success : function(msg) {
				if (msg.code == 1) {
					alert(msg.msg);
					//$(location).attr('href', 'personage.page');
				} else {
					alert(msg.msg);
				}
			},
			error : function() {
				alert("服务器繁忙...");
			}
		});
	}

	$('.ed_username')
			.blur(
					function() {
						var data = $('.ed_username').val();
						if (data.length < 1) {
							$("#check_username_info").text("用户名不能为空");
							$("#check_username_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_username_info").addClass('msg_error');
						} else if (data.length < 6) {
							$("#check_username_info").text("用户名不能少于6位");
							$("#check_username_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_username_info").addClass('msg_error');
						} else if (data.length > 9) {
							$("#check_username_info").text("用户名不能多于9位");
							$("#check_username_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_username_info").addClass('msg_error');
						} else {
							$("#check_username_info").text("正在查询中...");
							$("#check_username_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_username_info").addClass('msg_default');
							$
									.ajax({
										url : '${pageContext.request.contextPath}/web/action/checkUserName/${sessionScope.onLineUser.id}',
										data : {
											'username' : data
										},
										type : 'post',
										dataType : 'json',
										success : function(msg) {
											if (msg.code == 1) {
												$("#check_username_info").text(
														'用户名可以使用');
												$("#check_username_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_username_info")
														.addClass('msg_success');
											} else {
												$("#check_username_info").text(
														'用户名不可用');
												$("#check_username_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_username_info")
														.addClass('msg_error');
											}
										},
										error : function() {
											("#check_username_info")
													.text("服务器繁忙");
											$("#check_username_info")
													.removeClass(
															'msg_default msg_error msg_success');
											$("#check_username_info").addClass(
													'msg_error');
										}
									});
						}
					});
	$('[name=phone]')
			.blur(
					function() {
						var data = $('[name=phone]').val();
						var patrm = /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
						if ($('#oldPhone').val() == data) {
						} else if (data.length < 1) {
							$("#check_phone_info").text("手机号不能为空");
							$("#check_phone_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_phone_info").addClass('msg_error');
						} else if (!patrm.test(data)) {
							$("#check_phone_info").text("请输入正确的手机号");
							$("#check_phone_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_phone_info").addClass('msg_error');
						} else {
							$("#check_phone_info").text("正在查询中...");
							$("#check_phone_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_phone_info").addClass('msg_default');
							$
									.ajax({
										url : '${pageContext.request.contextPath}/web/action/checkPhone/${sessionScope.onLineUser.id}',
										data : {
											'phone' : data
										},
										type : 'POST',
										dataType : 'JSON',
										success : function(msg) {
											if (msg.code == 1) {
												$("#check_phone_info").text(
														'手机号可以使用');
												$("#check_phone_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_phone_info")
														.addClass('msg_success');
											} else {
												$("#check_phone_info").text(
														'手机号已被占用');
												$("#check_phone_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_phone_info")
														.addClass('msg_error');
											}
										},
										error : function() {
											("#check_phone_info").text("服务器繁忙");
											$("#check_phone_info")
													.removeClass(
															'msg_default msg_error msg_success');
											$("#check_phone_info").addClass(
													'msg_error');
										}
									});
						}
					});
	$('.ed_email')
			.blur(
					function() {
						var data = $('.ed_email').val();
						//	var patrm = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
						var patrm = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
						$("#check_email_info").text("查询中...");
						if ($('#oldEmail').val() == data) {
						} else if (data.length < 1) {
							$("#check_email_info").text("邮箱不能为空");
							$("#check_email_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_email_info").addClass('msg_error');
						} else if (!patrm.test(data)) {
							$("#check_email_info").text("请输入正确的邮箱");
							$("#check_email_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_email_info").addClass('msg_error');
						} else {
							$("#check_email_info").text("正在查询中...");
							$("#check_email_info").removeClass(
									'msg_default msg_error msg_success');
							$("#check_email_info").addClass('msg_default');
							$
									.ajax({
										url : '${pageContext.request.contextPath}/web/action/checkEmail/${sessionScope.onLineUser.id}',
										data : {
											'email' : data
										},
										type : 'POST',
										dataType : 'JSON',
										success : function(msg) {
											if (msg.code == 1) {
												$("#check_email_info").text(
														'邮箱号可以使用');
												$("#check_email_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_email_info")
														.addClass('msg_success');
											} else {
												$("#check_email_info").text(
														'邮箱号已被占用');
												$("#check_email_info")
														.removeClass(
																'msg_default msg_error msg_success');
												$("#check_email_info")
														.addClass('msg_error');
											}
										},
										error : function() {
											("#check_email_info").text("服务器繁忙");
											$("#check_email_info")
													.removeClass(
															'msg_default msg_error msg_success');
											$("#check_email_info").addClass(
													'msg_error');
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
	float: right;
	color: #FFF;
	padding: 4px;
	margin-top: 20px;
	border-radius: 2px;
	font: 14px "simhei", Arial, Helvetica, sans-serif;
	/* font: 16px; */
}
</style>
</html>