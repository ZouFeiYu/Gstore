<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商品搜索页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/search.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>



<body>
	<!-- 页面顶部-->
	<jsp:include page="top.jsp"></jsp:include>
	<div class="big">
		<form name="" action="" method="post">
			<section id="section">
				<p class="header">全部结果>笔记本</p>
				<div id="wrap">

					<c:forEach items="${goods }" var="good">

						<div class="lf" id="${good.id}">
							<div class="img">
								<img
									src="${pageContext.request.contextPath}/images/search/product_img1.png"
									alt="" onclick="toItemInfo(${good.id})" />
							</div>
							<div class="describe">
								<p onclick="toItemInfo(${good.id})">${good.title}</p>
								<span class="price"><b>￥</b><span class="priceContent">${good.price}</span></span>
								<span class="addCart"><img id="collect" class="collect"
									src="${pageContext.request.contextPath}/images/search/care.png"
									alt="" /><a href="javascript:void(0);" class="add_cart">加入购物车</a></span>
								<!--<span class="succee" style="display: none"> 
								<img src="/images/search/product_true.png" alt="" /> 
								<span>已移入购物车</span>
							</span>-->
							</div>
						</div>

					</c:forEach>

				</div>
			</section>
		</form>
	</div>
	<!-- 尾部-->
	<!-- 页面底部-->
	<div class="foot_bj">
		<div id="foot">
			<div class="lf">
				<p class="footer1">
					<img
						src="${pageContext.request.contextPath}/images/footer/logo.png"
						alt="" class=" footLogo" />
				</p>
				<p class="footer2">
					<img
						src="${pageContext.request.contextPath}/images/footer/footerFont.png"
						alt="" />
				</p>
			</div>
			<div class="foot_left lf">
				<ul>
					<li><a href="#"><h3>买家帮助</h3></a></li>
					<li><a href="#">新手指南</a></li>
					<li><a href="#">服务保障</a></li>
					<li><a href="#">常见问题</a></li>
				</ul>
				<ul>
					<li><a href="#"><h3>商家帮助</h3></a></li>
					<li><a href="#">商家入驻</a></li>
					<li><a href="#">商家后台</a></li>
				</ul>
				<ul>
					<li><a href="#"><h3>关于我们</h3></a></li>
					<li><a href="#">关于达内</a></li>
					<li><a href="#">联系我们</a></li>
					<li><img
						src="${pageContext.request.contextPath}/images/footer/wechat.png"
						alt="" /> <img
						src="${pageContext.request.contextPath}/images/footer/sinablog.png"
						alt="" /></li>
				</ul>
			</div>
			<div class="service">
				<p>学子商城客户端</p>
				<img src="${pageContext.request.contextPath}/images/footer/ios.png"
					class="lf"> <img
					src="${pageContext.request.contextPath}/images/footer/android.png"
					alt="" class="lf" />
			</div>
			<div class="download">
				<img
					src="${pageContext.request.contextPath}/images/footer/erweima.png">
			</div>
			<!-- 页面底部-备案号 #footer -->
			<div class="record">&copy;2017 达内集团有限公司 版权所有 京ICP证xxxxxxxxxxx</div>
		</div>
	</div>
	<div class="modal" style="display: none">
		<input type="hidden" value="" id="good_id" /> <input type="hidden"
			value="" id="type" />
		<div class="modal_dialog">
			<div class="modal_header">操作提醒</div>
			<div class="modal_information">
				<img
					src="${pageContext.request.contextPath}/images/model/model_img2.png"
					alt="" /> <span>将您的宝贝加入购物车？</span>

			</div>
			<div class="yes">
				<span>确定</span>
			</div>
			<div class="no">
				<span>取消</span>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
	<script>
	$(".add_cart").click(function(){
		var id=$(this).parent().parent().parent().attr('id');
		$(".modal #good_id").val(id);
		$(".modal #type").val('cart');
		$(".modal").show();
		$(".modal .modal_information span").html("将您的宝贝加入购物车?");
	})
	/* $(".yes").click(function(){
	    $(".modal").hide();
	    var id=$(".modal #good_id").val();
	    $.ajax({
		    url : "${pageContext.request.contextPath}/web/action/cart/addGood",
	    	data : {"id":id,"count":1},
	    	type:"post",
	    	dataType:'json',
	    	success:function(msg){
		    	if(msg.code==1){
			    	alert("加入购物车成功!");
			    }else{
				    alert("加入购物车失败!")
				}
		    },
		    error:function(){
			    alert("请求服务器失败!");
			}
		}); 
	}) */
	$('.no').click(function(){
    	$('.modal').hide();
    	
    })
</script>
	<!--<script type="text/javascript">
	// var status = ${status};
	var pages = ${pageBean.totalPages};
	var index = ${pageBean.pageIndex};
	$(".tcdPageCode").createPage({
		// 总页数
	    pageCount:pages,
	 	// 起始页
	    current:index,
	    backFn:function(p){
	    	// 执行代码
	    	window.location.href="http://localhost:18888/search.html?q=${q}&page="+p;
	    }
	});
</script>-->
	<script type="text/javascript">
    /* 商品详情页  */
	function toItemInfo(id) {
		if (id) {
			window.location.href="${pageContext.request.contextPath}/web/view/details/"+id;
		}else {
			alert("商品id不存在");
		}
	} 
</script>
	<script type="text/javascript">
	/**添加到收藏**/
    $(".collect").click(function(e){
    	var id=$(this).parent().parent().parent().attr('id');
		$(".modal #good_id").val(id);
		$(".modal #type").val('favorites');
    	$(".modal").show();
		$(".modal .modal_information span").html("将您的宝贝加入收藏夹");
    })
    $(".yes").click(function(){
	    $(".modal").hide();
	   
	    var id=$(".modal #good_id").val();
	    var data;
	    var url;
	    if($(".modal #type").val()=='favorites'){
	    	data={"id":id};
	    	url="${pageContext.request.contextPath}/web/action/favorites/addGood";
	    	 if($('#'+id+' #collect').attr("src")=="${pageContext.request.contextPath}/images/search/care1.png"){
	    		 $('#'+id+' #collect').attr("src","${pageContext.request.contextPath}/images/search/care.png");
		    	 }else{
		    		 $('#'+id+' #collect').attr("src","${pageContext.request.contextPath}/images/search/1.png");
			    	 }
		}else{
			data={"id":id,"count":1};
			url="${pageContext.request.contextPath}/web/action/cart/addGood";
		}
	    $.ajax({
		    url : url,
	    	data : data,
	    	type:"post",
	    	dataType:'json',
	    	success:function(msg){
		    	if(msg.code==1){
			    	alert(msg.msg);
			    }else{
				    alert(msg.msg)
				}
		    },
		    error:function(){
			    alert("请求服务器失败!");
			}
		}); 
    })
</script>
</body>
</html>