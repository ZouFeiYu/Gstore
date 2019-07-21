<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="cn">
    <meta charset="UTF-8">
    <title>学子商城收藏夹</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/favorites.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
</head>
<body>
<!-- 页面顶部-->
<jsp:include page="top.jsp"/>
<div class="modal" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提醒
        </div>
        <div class="modal_information">
            <img src="${pageContext.request.contextPath}/images/model/model_img2.png" alt=""/>
            <span>确定删除您的这个宝贝吗？</span>

        </div>
        <div class="yes"><span>删除</span></div>
        <div class="no"><span>不删除</span></div>
    </div>
</div>
<div class="modalYi" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            操作提醒
        </div>
        <div class="modal_information">
            <img src="${pageContext.request.contextPath}/images/model/model_img2.png" alt=""/>
            <span>将您的宝贝移入购物车？</span>

        </div>
        <div class="yes"><span>确定</span></div>
        <div class="no"><span>取消</span></div>
    </div>
</div>
<div class="modalNo" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提示
            <img src="${pageContext.request.contextPath}/images/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="${pageContext.request.contextPath}/images/model/model_img2.png" alt=""/>
            <span>请选择商品</span>

        </div>

    </div>
</div>

<div class="modalAdd" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            添加提示
            <img src="${pageContext.request.contextPath}/images/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="${pageContext.request.contextPath}/images/model/model_img2.png" alt=""/>
            <span>请选择商品</span>

        </div>

    </div>
</div>

<div class="big">
    <form  name="" action="" method="post" >
        <section id="section" >
            <div id="title">
                <b>收藏商品</b>&nbsp;&nbsp;&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
                <b class="store">收藏店家</b>
            </div>
            <div id="box" >
                <div class="imfor_top">
                    <div class="manage">
                        <span class="normal">管理收藏夹</span>

                    </div>
                    <div class="check_top">
                        <div class="all">
                            <span class="normal"> <img src="${pageContext.request.contextPath}/images/myCollect/product_normal.png" alt=""/></span>全选
                        </div>
                        <div class="del">删除</div>
                        <div class="allAdd">加入购物车</div>
                        <div class="sure" style="display: none">
                            <img src="${pageContext.request.contextPath}/images/myCollect/product_true.png" alt=""/>
                            <span>已移入购物车</span>
                        </div>
                    </div>
                    <div class="foot_qk">清空失效商品</div>
                </div>
                <div id="content_box" >
                    <c:forEach items="${goods }" var="good">
                    	<div class="lf" id="${good.id }">
                        <div class="img">
                            <img src="${pageContext.request.contextPath}${good.image}" alt=""/>
                        </div>
                        <div class="describe">
                            <p>${good.title }</p>
                            <span class="price"><b>￥</b><span class="priceContent">${good.price }</span></span>
                            <span class="addCart">加入购物车</span>
                            	<span class="succee" style="display: none">
                                 	<img src="${pageContext.request.contextPath}/images/myCollect/product_true.png" alt=""/>
                                 	<span>已移入购物车</span>
                            	</span>
                        	</div>
                        	<div class="mask" style="display: none">
                            	<div class="maskNormal">
                                	<img src="${pageContext.request.contextPath}/images/myCollect/product_normal_big.png" alt=""/>
                            	</div>
                        	</div>
                    	</div>
                    </c:forEach>
                    
                    
                    
                    
                    

                </div>
                <div class="foot" >
                    <div class="manage">
                        <span class="normal">管理收藏夹</span>
                    </div>
                    <div class="check_top">
                        <div class="all">
                            <span class="normal"> <img src="${pageContext.request.contextPath}/images/myCollect/product_normal.png" alt=""/></span>全选
                        </div>
                        <div class="del">删除</div>
                        <div class="allAdd">加入购物车</div>
                        <div class="sure" style="display: none">
                            <img src="${pageContext.request.contextPath}/images/myCollect/product_true.png" alt=""/>
                            <span>已移入购物车</span>
                        </div>
                    </div>
                </div>


                </div>
        </section>

    </form>
    <div class="none" style="display: none">
        <div class="none_content">
            <img src="${pageContext.request.contextPath}/images/model/model_img3.png" alt="" class="lf"/>
            <p class="lf">您的收藏夹竟然还是空哒( ⊙ o ⊙ )</p>
            <span class="lf">赶快去收藏商品吧！</span>
            <a href="#" class="lf">去购物>></a>
        </div>

    </div>
</div>
<!-- 品质保障，私人定制等-->
<jsp:include page="foot.jsp"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/favorites.js"></script>
<script>
    $(function(){
        if(!$(".imfor")) {
            $('#section').hide();
            $('.none').show();
        }
    })
    //搜索下拉
    $('.seek').focus(function(){

        if($(this).hasClass('clickhover')){

            $(this).removeClass('clickhover');
            $(this).find('.seek_content').hide();
            $(this).find('img').attr('src','${pageContext.request.contextPath}/images/header/header_normal.png');

        }else{
            $(this).addClass('clickhover');
            $(this).find('.seek_content').show();
            $(this).find('img').attr('src','${pageContext.request.contextPath}/images/header/header_true.png');
        }
    })
    $('.seek_content>div').click(function(){
        $('.seek').removeClass('clickhover');
        var text=$(this).html();
        $('.seek span').html(text);
        $(this).parent().hide();
        $('.seek').find('img').attr('src','${pageContext.request.contextPath}/images/header/header_normal.png');
        $('.seek').blur();

    })
    $('.seek').blur(function(){

        $('.seek').removeClass('clickhover');
        $('.seek_content').hide();

        $('.seek').find('img').attr('src','${pageContext.request.contextPath}/images/header/header_normal.png');
        console.log(1);
    })
    $(".care").hover(function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/care1.png");
    },function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/care.png");
    });
    $(".order").hover(function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/order1.png");
    },function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/order.png");
    });
    $(".shopcar").hover(function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/shop_car1.png");
    },function(){
        $(this).attr('src',"${pageContext.request.contextPath}/images/header/shop_car.png");
    });
</script>
</body>
</html>