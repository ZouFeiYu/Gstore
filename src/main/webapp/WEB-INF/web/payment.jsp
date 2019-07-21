<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内学子商城——支付页面</title>
    <link href="${pageContext.request.contextPath}/css/payment.css" rel="Stylesheet" />
    <link href="${pageContext.request.contextPath}/css/header.css" rel="Stylesheet" />
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="Stylesheet" />
    <style>
.okPay a{
    color: #FFFFFF;
}
.modal{
    position:fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.8);
    z-index:9999;
    width: 100%;
    height: 100%;
    left:0px;
    top:0px;
    text-align: center;
}
.modal img{
	margin: 0 auto; /*水平居中*/
    position: relative;
    top: 50%; /*偏移*/
    margin-top: -150px; 
}
#close_qrcodde{
    position: relative;
    left:35%;
    width: 30px;
    height: 30px;
    color: white;
    font-size: 30px;
}
#time_out{
 position: absolute;
    /* left:30%; */
    /* top: 30% */
    margin: 10% auto; /*水平居中*/
    width: 300px;
    height: 30px;
    color: white;
    font-size: 15px;
}
    </style>
</head>
<body>
<!-- 页面顶部-->
<jsp:include page="top.jsp"/>
<div id="navlist">
    <ul>
        <li class="navlist_gray_left"></li>
        <li class="navlist_gray">确认订单信息</li>
        <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas>
        </li>
        <li class="navlist_blue">支付订单<b></b></li>
        <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas>
        </li>
        <li class="navlist_gray">支付完成<b></b></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>
<!--订单确认-->
<form action="pay_success.html" method="post" id="pay_form">
    <div id="container" class="clearfix" >
        <!-- 支付订单信息-->
        <div class="pay_info">
            <b>支付金额：<i>4800元</i></b><input type="hidden" name="payment" value="0.01"/>
            <span>支付订单：324235435 收款方：达内商城</span><input type="hidden" name="orderId" />
        </div>
        <!--支付方式-->
        <div id="pay_type">
            <!-- 支付方式头-->
            <div class="pay_type_title">
                <b>网上银行支付</b>
            </div>
            <div id="dnBank">
                <ul>
                    <li><input type="radio" name="bankId" value="BOC-NET-B2C" id="02zg">
                        <label for="02zg"><img src="${pageContext.request.contextPath}/images/pay/pay_img1.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="ICBC-NET-B2C" id="03gs">
                        <label for="03gs"><img src="${pageContext.request.contextPath}/images/pay/pay_img2.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="CMBCHINA-NET-B2C" id="04zs">
                        <label for="04zs"><img src="${pageContext.request.contextPath}/images/pay/pay_img3.jpg" alt="" /></label>
                    </li>
                    <li><input type="radio" name="bankId" value="CCB-NET-B2C" id="05js">
                        <label for="05js"><img src="${pageContext.request.contextPath}/images/pay/pay_img4.jpg" alt=""/></label>
                    </li>
                    <li><input type="radio" name="bankId" value="ABC-NET-B2C" id="06ny">
                        <label for="06ny"><img src="${pageContext.request.contextPath}/images/pay/pay_img5.jpg" alt=""/></label>
                    </li>

                </ul>
            </div>

        </div>
        <div class="modal" style="display:none">
        <span id="time_out" class="pay_leftTime">
            剩余付款时间：<b>15：00</b>
        </span>
        	<img id="qrcode" alt="" src=""/>
        	<label id="close_qrcodde">Χ</label>
        </div>
        <!--结算条-->
        <div id="count_bar">
        <span class="pay_leftTime">
            剩余付款时间：<b>15：00</b>
            <!--获取待支付时间并更改订单状态-->
        </span>
            <span class="okPay"><a href="#">确认支付</a></span>
            <!-- <input type="submit" value="立即付款"> -->
        </div>

    </div>
</form>
<!-- 品质保障，私人定制等-->
<jsp:include page="foot.jsp"/>
<!-- 页面底部-->

<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript">
var time=90;
var t1;
$("#dnBank>ul>li img").click(function(){
	$('.modal').show();
	var bankId=$(this).parent().siblings('[name=bankId]').val();
	$('#qrcode').attr("src","${pageContext.request.contextPath}/web/action/pay/qrcode/"+bankId);
	t1 = window.setInterval(payIsOk,1000);
});
$("#close_qrcodde").click(function(){
	$('.modal').hide();
	window.clearInterval(t1);
});
//var t1 = window.setTimeout(payIsOk,1000); 

function payIsOk(){
	$.ajax({
		url:'${pageContext.request.contextPath}/web/action/pay/qrcode/ok',
		type:'post',
		dataType:'JSON',
		timeout:900000,
		success:function(msg){
			if(msg.code==1){
				window.clearInterval(t1);
				$('.modal').hide();
				$(location).attr("href","${pageContext.request.contextPath}/web/view/paySuccess");
			}else{
				//alert("no");
			}
		},
		error:function(){
			alert('error');
		}
	});
	time--;
	var min=Math.floor(time / 60);
	min=min+"";
	if(min.length==1){
		min='0'+min;
	}
	var s=(time%60);
	s=s+"";
	if(s.length==1){
		s='0'+min;
	}
	$('#time_out b').html( min+" : "+s);
	$('.pay_leftTime b').html( min+" : "+s);
	if(time==0){
		window.clearInterval(t1);
		$('.modal').hide();
		alert('订单支付超时');
	}
}
</script>
<script>
    $("#count_bar .okPay").css("display","none");
    $("#dnBank>ul>li img").click(function(){
        $(this).addClass("hover");
        $(this).parent().parent().siblings().children('label').children('img').removeClass('hover');
        $("#count_bar .okPay").show("3000");
    });
    /* $(":not(#count_bar .okPay)").css("display","none"); */
</script>
<script type="text/javascript">
    function payment() {
        $("#pay_form").submit();
        // document.getElementById('pay_form').submit();
        alert(11);
    }  
</script>
<script>
	$(".okPay").click(function(){
		//window.location.href="pay_success.html";
    })
</script>
<script>
    var canvas=document.getElementById("canvas_gray");
    var cxt=canvas.getContext("2d");
    var gray = cxt.createLinearGradient (10, 0, 10, 38);
    gray.addColorStop(0, '#f5f4f5');
    gray.addColorStop(1, '#e6e6e5');
    cxt.beginPath();
    cxt.fillStyle = gray;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
<script>
    var canvas=document.getElementById("canvas_blue");
    var cxt=canvas.getContext("2d");
    var blue = cxt.createLinearGradient (10, 0, 10, 38);
    blue.addColorStop(0, '#27b0f6');
    blue.addColorStop(1, '#0aa1ed');
    cxt.beginPath();
    cxt.fillStyle = blue;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
</body>
</html>

