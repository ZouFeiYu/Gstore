<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>商城购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"/>
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
<div class="big">
    <form  name="" action="" method="post">
    <section id="section" >
        <div id="title">
            <b>购物车</b>
            <p>
                已选<span class="total color">0</span>件商品<span class="interval"></span>合计(不含运费):<span class="totalPrices color susum">0.00</span><span class="unit color">元</span>
            </p>
        </div>
        <div id="box" >
            <div id="content_box">
                <div class="imfor_top">
                    <div class="check_top">
                        <div class="all">
                            <span class="normal">
                                <img src="${pageContext.request.contextPath}/images/cart/product_normal.png" alt=""/>
                            </span>  <input type="hidden" name="" value="">全选
                        </div>
                    </div>
                    <div class="pudc_top">商品</div>
                    <div class="pices_top">单价(元)</div>
                    <div class="num_top">数量</div>
                    <div class="totle_top">金额</div>
                    <div class="del_top">操作</div>
                </div>
                <c:forEach items="${goods }" var="good">
                	<div class="imfor" id="${good.id}">
                    <div class="check">
                        <div class="Each">
                            <span class="normal">
                                <img src="${pageContext.request.contextPath}/images/cart/product_normal.png" alt=""/>
                            </span>
                            <input type="hidden" name="" value="">
                        </div>
                    </div>
                    <div class="pudc">
                        <div class="pudc_information" id="pudcId3">
                            <img src="${pageContext.request.contextPath}/images/cart/product_simg1.png" class="lf"/>
                            <input type="hidden" name="" value="">
                        <span class="des lf">
                           ${good.title}
                              <input type="hidden" name="" value="">
                        </span>
                            <p class="col lf"><span>颜色：</span><span class="color_des">深空灰  <input type="hidden" name="" value=""></span></p>
                        </div>
                    </div>
                    <div class="pices">
                        <p class="pices_des">达内专享价</p>
                        <p class="pices_information"><b>￥</b><span>${good.price}  <input type="hidden" name="" value=""></span></p>
                    </div>
                    <div class="num"><span class="reduc">&nbsp;-&nbsp;</span><input name="count" id="count" type="text" value="${count[good.id] }" ><span class="add">&nbsp;+&nbsp;</span></div>
                    <div class="totle">
                        <span>￥</span>
                        <span class="totle_information">${good.price}</span>
                    </div>
                    <div class="del">
                        <!-- <div>
                            <img src="img/true.png" alt=""/>
                            <span>已移入收藏夹</span>
                        </div>
                         <a href="javascript:;" class="del_yr">移入收藏夹</a>
                        -->
                        <a href="javascript:;" class="del_d">删除</a>
                    </div>
                </div>
                </c:forEach>
                
                
            </div>
            <div class="foot">
                <div class="foot_check">
                    <div class="all">
                        <span class="normal">
                                <img src="${pageContext.request.contextPath}/images/cart/product_normal.png" alt=""/>
                            </span>  <input type="hidden" name="" value="">全选
                    </div>
                </div>
                <a href="javascript:;" class="foot_del">删除</a>
                <!--<a href="javascript:;" class="foot_yr">移入收藏夹</a>-->
                <div class="foot_qk">清空失效商品</div>
                <div class="foot_cash" id="go-buy">去结算</div>
                <div class="foot_tol"><span>合计(不含运费):</span><span  class="foot_pices susumOne">0.00</span><span class='foot_des'>元</span></div>
                <div class="foot_selected">
                    已选<span class="totalOne color">0</span>件商品
                </div>
            </div>
        </div>
    </section>
    </form>
    <div class="none" style="display: none">
        <p class="none_title">购物车</p>
        <div class="none_top"></div>
        <div class="none_content">
            <img src="${pageContext.request.contextPath}/images/30.png" alt="" class="lf"/>
            <p class="lf">您的购物车竟然还是空哒( ⊙ o ⊙ )</p>
            <span class="lf">赶快去下单吧！</span>
            <a href="#" class="lf">去购物>></a>
        </div>

    </div>
</div>
<!-- 品质保障，私人定制等-->
<jsp:include page="foot.jsp"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script>
    <!-- 显示空购物车页面-->
    $(function(){
        if(!$(".imfor")) {
            $('#section').hide();
            $('.none').show();
        }
    })
    $("#go-buy").click(function(){
        var ids=new Array();
        var i=0;
        $('.Each span').each(function(){
            if($(this).hasClass("true")){
                
                var id=$(this).parent().parent().parent().attr("id");
                var count=$("#"+id+" #count").val();
                ids[i]='{"id":"'+id+'","count":'+count+'}';
                i++;
            }
           
        });
        $.ajax({
			url:"${pageContext.request.contextPath}/web/action/order/creat",
			type:"post",
			data: {"orders":ids},
			 traditional: true,
			dataType:"json",
			success:function(msg){
				if(msg.code==1){
					alert("下单成功,请结算");
					$(location).attr("href","${pageContext.request.contextPath}/web/view/orderConfirm")
				}else{
					alert("下单失败");
				}
			},
			error:function(){
				alert("请求服务器失败");
			}
        });
    })
</script>
</body>
</html>