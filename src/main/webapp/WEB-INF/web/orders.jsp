<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>我的订单 - 学子商城</title>
<link href="${pageContext.request.contextPath}/css/orders.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" />
</head>
<body>
	<!-- 页面顶部-->
<jsp:include page="top.jsp"/>
	<!-- 我的订单导航栏-->
	<div id="nav_order">
		<ul>
			<li><a href="${pageContext.request.contextPath}/web/view/index">首页</a>
				<span>&gt;</span> <a
				href="${pageContext.request.contextPath}/web/view/orders/${sessionScope.onLineUser.id}">订单管理</a>
			</li>
		</ul>
	</div>

	<!--我的订单内容区域 #container-->
	<jsp:include page="left.jsp"/>
		<!-- 右边栏-->
		<div class="rightsidebar_box rt">
			<!-- 商品信息标题-->
			<table id="order_list_title" cellpadding="0" cellspacing="0">
				<tr>
					<th width="345">商品</th>
					<th width="82">单价（元）</th>
					<th width="50">数量</th>
					<th width="82">售后</th>
					<th width="100">实付款（元）</th>
					<th width="90">交易状态</th>
					<th width="92">操作</th>
				</tr>
			</table>
			<!-- 订单列表项 -->
			<c:forEach var="oeder" items="${orders}">
				<div id="orderItem">
				<p class="orderItem_title">
					<span id="order_id"> &nbsp;&nbsp;订单编号:<a href="#">${oeder.orderId }</a>
					<%-- </span> &nbsp;&nbsp;成交时间：2016-01-04 18:00&nbsp;&nbsp; <span> <a
						href="#" class="servie"> 联系客服<img
							src="${pageContext.request.contextPath}/images/myOrder/kefuf.gif" />
					</a> --%>
					</span>
				</p>
			</div>
			
			<c:forEach items="${oeder.goods}" var="good">
			<div id="orderItem_detail">
				<ul>
					<li class="product"><b><a href="#"><img
								src="${pageContext.request.contextPath}/images/myOrder/product_img1.png" /></a></b> <b
						class="product_name lf"> <a href="">${good.title }</a> <br />
					</b> <b class="product_color "> 颜色：深空灰 </b></li>
					<li class="unit_price">专属价 <br /> ￥8800
					</li>
					<li class="count">1件</li>
					<li class="sale_support">退款/退货 <br /> 我要维权
					</li>
					<li class=" payments_received">${good.price }</li>
					<li class="trading_status"><img
						src="${pageContext.request.contextPath}/images/myOrder/car.png" alt="" />
						<c:if test="${oeder.status == -1}">
						待付款
						</c:if>
						<c:if test="${oeder.status== 0}">
						订单失效
						</c:if>
						<c:if test="${oeder.status == 1}">
						付款成功
						</c:if> <br /> <a
						href="orderInfo.html">订单详情</a> <br /> <a href="#"
						class="view_logistics">查看物流</a></li>
					<li class="operate"><a href="#">确认收货</a></li>
				</ul>
			</div>
			</c:forEach>
			</c:forEach>
			
			

			


			<!--分页器-->
			<!-- <div class="tcdPageCode"></div> -->

		</div>
	</div>

	<!--<iframe src="order_status.html" width="1000" height=500""></iframe>-->
	<!-- 品质保障，私人定制等-->
<jsp:include page="foot.jsp"/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/orders.js"></script>
</html>