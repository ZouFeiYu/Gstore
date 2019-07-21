<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function search_by_name(){
	$(location).attr("href","${pageContext.request.contextPath}/web/view/search/"+$('#input').val());
	//alert($("#input").val());
}
</script>
<input type="hidden" value="${pageContext.request.contextPath}"
	id="basePath" name="basePath" />
<!-- 页面顶部-->
<header id="top" class="fixed_nav">
	<div id="logo" class="lf">
		<img class="animated jello"
			src="${pageContext.request.contextPath}/images/header/logo.png"
			alt="logo" />
	</div>
	<div id="top_input" class="lf">
		<input id="input" type="text" placeholder="请输入您要搜索的内容" /> <a
			href="#" onclick="search_by_name()"
			class="rt"><img id="search"
			src="${pageContext.request.contextPath}/images/header/search.png"
			alt="搜索" /></a>
	</div>
	<div class="rt">
		<ul class="lf">
			<li><a
				href="${pageContext.request.contextPath}/web/view/favorites/${sessionScope.onLineUser.id}"
				title="我的收藏"><img class="care"
					src="${pageContext.request.contextPath}/images/header/care.png"
					alt="" /></a><b>|</b></li>
			<li><a
				href="${pageContext.request.contextPath}/web/view/orders/${sessionScope.onLineUser.id}"
				title="我的订单"><img class="order"
					src="${pageContext.request.contextPath}/images/header/order.png"
					alt="" /></a><b>|</b></li>
			<li><a
				href="${pageContext.request.contextPath}/web/view/cart/${sessionScope.onLineUser.id}"
				title="我的购物车"><img class="shopcar"
					src="${pageContext.request.contextPath}/images/header/shop_car.png"
					alt="" /></a><b>|</b></li>
			<!-- <li><a href="help.html">帮助</a><b>|</b></li>
				<li><a href="login.html">登录</a></li> -->
			<c:choose>
				<c:when test="${sessionScope.onLineUser!=null}">
					<li><a
						href="${pageContext.request.contextPath}/web/view/person/${sessionScope.onLineUser.id}">Hi:${sessionScope.onLineUser.userName}</a><b>|</b></li>
					<li><a
						href="${pageContext.request.contextPath}/web/action/logout"
						title="退出后,下次将不再自动登录">退出</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/web/view/register">注册</a><b>|</b></li>
					<li><a
						href="${pageContext.request.contextPath}/web/view/login">登录</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</header>
<!-- nav主导航-->
<nav id="nav">
	<ul>
		<li><a href="${pageContext.request.contextPath}/web/view/index"
			class="acti">首页</a></li>
		<li><a
			href="${pageContext.request.contextPath}/web/view/index#computer">电脑办公</a></li>
		<li><a
			href="${pageContext.request.contextPath}/web/view/index#stationery">办公文具</a></li>
	</ul>
</nav>
