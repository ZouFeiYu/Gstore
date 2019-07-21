<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="cn">
<meta charset="UTF-8">
<title>学子商城首页</title>
<link href="${pageContext.request.contextPath}/css/header.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/footer.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/slide.css"
	rel="stylesheet" />
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
	<!-- banner部分-->
	<div class="ck-slide">
		<ul class="ck-slide-wrapper">
			<li><a href="${pageContext.request.contextPath}/web/view/product_details.html"><img
					src="${pageContext.request.contextPath}/images/itemCat/itemCat_banner1.png"
					alt=""></a></li>
			<li style="display: none"><a href="product_details.html"><img
					src="${pageContext.request.contextPath}/images/itemCat/itemCat_banner2.png"
					alt=""></a></li>
			<li style="display: none"><a href="product_details.html"><img
					src="${pageContext.request.contextPath}/images/itemCat/itemCat_banner3.png"
					alt=""></a></li>
			<li style="display: none"><a href="product_details.html"><img
					src="${pageContext.request.contextPath}/images/itemCat/itemCat_banner4.png"
					alt=""></a></li>
			<li style="display: none"><a href="product_details.html"><img
					src="${pageContext.request.contextPath}/images/itemCat/itemCat_banner1.png"
					alt=""></a></li>
		</ul>
		<a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a
			href="javascript:;" class="ctrl-slide ck-next">下一张</a>
		<div class="ck-slidebox">
			<div class="slideWrap">
				<ul class="dot-wrap">
					<li class="current"><em>1</em></li>
					<li><em>2</em></li>
					<li><em>3</em></li>
					<li><em>4</em></li>
					<li><em>5</em></li>
				</ul>
			</div>
		</div>
	</div>


	
	<c:forEach items="${caterotys}" var="cateroty">
		
		<h2 id="computer" class="stair">
		<span><img
			src="${pageContext.request.contextPath}/images/itemCat/computer_icon.png"
			alt=".stair" /></span>${cateroty.name } /${cateroty.sortOrder }F
		</h2>
		<div class="lf1">
		<div class="lf1_top">
			<!-- 上面部分左侧区域-->
			<div class="left lf">
				<c:choose>
					<c:when test="${goods[cateroty.id][0]!=null }">
						<div class="left_pro lf">
							<p class="top_ys1">${goods[cateroty.id][0].itemType}</p>

							<p class="top_ys2">${goods[cateroty.id][0].title}</p>

							<p class="top_ys3">${goods[cateroty.id][0].price}</p>
							<p class="top_ys4 color_2">
								<a href="${pageContext.request.contextPath}/web/view/details/${goods[cateroty.id][0].id}">查看详情</a>
							</p>
					
						</div>
						<span><img src="${pageContext.request.contextPath}${goods[cateroty.id][0].image}" alt="" /></span>
					</c:when>
					<c:otherwise>
						<img alt="" src="${pageContext.request.contextPath}/images/error/nullGood1.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 上面部分右侧区域-->
			<div class="right lf">
				<c:choose>
					<c:when test="${goods[cateroty.id][1]!=null }">
						<div class="right_pro lf">
							<p class="top_ys1">${goods[cateroty.id][1].itemType}</p>

							<p class="top_ys2">${goods[cateroty.id][1].title}</p>

							<p class="top_ys3">${goods[cateroty.id][1].price}</p>

							<p class="top_ys4 color_2">
								<a href="${pageContext.request.contextPath}/web/view/details/${goods[cateroty.id][1].id}">查看详情</a>
							</p>
						</div>
						<span><img src="${pageContext.request.contextPath}/${goods[cateroty.id][1].image}" alt="" /></span>
			
					</c:when>
					<c:otherwise>
						<img alt="" src="${pageContext.request.contextPath}/images/error/nullGood2.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="lf1_bottom">
			<div class="item_cat lf">
				<div class="cat_header color_2">
					<span> <img
						src="${pageContext.request.contextPath}/images/itemCat/computer_icon1.png"
						alt="" /> ${cateroty.name } /${cateroty.sortOrder }F
					</span>
				</div>
				<div class="item_cat_all">
					<c:forEach items="${cateroty.children}" var="cateroty1">
						<p>${cateroty1.name}</p>
						<ul>
							<c:forEach items="${cateroty1.children}" var="cateroty2">
								<li><a href="${pageContext.request.contextPath}/web/view/search/${cateroty2.id}">${cateroty2.name}</a></li>
							</c:forEach>
						</ul>
					
					</c:forEach>
				</div>
			</div>
			<div class="item_msg lf">
				<c:choose>
					<c:when test="${goods[cateroty.id][2]!=null }">
						<img src="${pageContext.request.contextPath}${goods[cateroty.id][2].image}" alt="" />

						<p class="bottom_ys2">${goods[cateroty.id][2].title}</p>

						<p class="bottom_ys3">${goods[cateroty.id][2].price}</p>

						<p class="bottom_ys4 color_2">
							<a href="${pageContext.request.contextPath}/web/view/details/${goods[cateroty.id][2].id}">查看详情</a>
						</p>
					</c:when>
					<c:otherwise>
						<img alt="" src="${pageContext.request.contextPath}/images/error/nullGood3.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="item_msg lf">
				<c:choose>
					<c:when test="${goods[cateroty.id][3]!=null }">
						<img src="${pageContext.request.contextPath}${goods[cateroty.id][3].image}" alt="" />

						<p class="bottom_ys2">${goods[cateroty.id][3].title}</p>

						<p class="bottom_ys3">${goods[cateroty.id][3].price}</p>

						<p class="bottom_ys4 color_2">
							<a href="${pageContext.request.contextPath}/web/view/details/${goods[cateroty.id][3].id}">查看详情</a>
						</p>
					</c:when>
					<c:otherwise>
						<img alt="" src="${pageContext.request.contextPath}/images/error/nullGood3.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="item_msg lf">
				<c:choose>
					<c:when test="${goods[cateroty.id][4]!=null }">
						<img src="${pageContext.request.contextPath}${goods[cateroty.id][4].image}" alt="" />

						<p class="bottom_ys2">${goods[cateroty.id][4].title}</p>

						<p class="bottom_ys3">${goods[cateroty.id][4].price}</p>

						<p class="bottom_ys4 color_2">
							<a href="${pageContext.request.contextPath}/web/view/details/${goods[cateroty.id][4].id}">查看详情</a>
						</p>
					</c:when>
					<c:otherwise>
						<img alt="" src="${pageContext.request.contextPath}/images/error/nullGood3.jpg"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
		
	</c:forEach>


<jsp:include page="foot.jsp"/>
	<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/slide.js"></script>
	<script>
		$('.ck-slide').ckSlide({
			autoPlay : true,//默认为不自动播放，需要时请以此设置
			dir : 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
			interval : 3000
		//默认间隔2000毫秒
		});
	</script>
	<script>
		$("#iii").click(function() {
			location.href = "product_details.html";
		})
	</script>
</body>
</html>