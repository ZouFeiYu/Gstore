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
</head>
<body>
	<!-- 页面顶部-->
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
	<!--我的订单内容区域 #container-->
	<jsp:include page="left.jsp" />
	<!-- 右边栏-->
	<div class="rightsidebar_box rt">
		<!--标题栏-->
		<div class="rs_header">
			<span class="address_title">收获地址管理</span>
		</div>
		<!--收货人信息填写栏-->
		<div class="rs_content">
			<form method="post" action="">
				<input type="hidden" id="addressId" name="addressId" value=""/>
				<!--收货人姓名-->
				<div class="recipients">
					<span class="red">*</span><span class="kuan">收货人：</span><input
						type="text" name="receiverName" id="receiverName" />
				</div>
				<!--收货人所在城市等信息-->
				<div data-toggle="distpicker" class="address_content">
					<span class="red">*</span><span class="kuan">省&nbsp;&nbsp;份：</span><select
						data-province="---- 选择省 ----" id="receiverState" name="receiverState"></select> 城市：<select
						data-city="---- 选择市 ----" id="receiverCity" name="receiverCity"></select> 区/县：<select
						data-district="---- 选择区 ----" id="receiverDistrict" name="receiverDistrict"></select>
				</div>


				<!--收货人详细地址-->
				<div class="address_particular">
					<span class="red">*</span><span class="kuan">详细地址：</span>
					<textarea name="receiverAddress" id="receiverAddress" cols="60"
						rows="3" placeholder="建议您如实填写详细收货地址"></textarea>
				</div>
				<!--收货人地址-->
				<div class="address_tel">
					<span class="red">*</span><span class="kuan">手机号码：</span><input
						type="tel" id="receiverMobile" name="receiverMobile" />固定电话：<input
						type="text" name="receiverPhone" id="receiverPhone" />
				</div>
				<!--邮政编码-->
				<div class="address_postcode">
					<span class="red">&nbsp;</span class="kuan"><span>邮政编码：</span>&nbsp;<input
						type="text" name="receiverZip" />
				</div>
				<!--地址名称-->
				<div class="address_name">
					<span class="red">&nbsp;</span class="kuan"><span>地址名称：</span>&nbsp;<input
						type="text" id="addressName" name="addressName" />如：<span
						class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
				</div>
				<!--保存收货人信息-->
				<div class="save_recipient">保存收货人信息</div>

			</form>
			<!--已有地址栏-->
			<div class="address_information_manage">
				<div class="aim_title">
					<span class="dzmc dzmc_title">地址名称</span><span
						class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址详情</span><span
						class="lxdh lxdh_title">联系电话</span><span
						class="operation operation_title">操作</span>
				</div>
				<div class="aim_content_one aim_active">
					<span class="dzmc dzmc_active">办公室</span> <span
						class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">北京市海淀区北下关街道中鼎大厦B座331</span>
					<span class="lxdh lxdh_normal">18435110514</span> <span
						class="operation operation_normal"> <span
						class="aco_change">修改</span>|<span class="aco_delete">删除</span>
					</span> <span class="swmr swmr_normal"></span>
				</div>
				<div class="aim_content_two">
					<span class="dzmc dzmc_normal">家里</span> <span
						class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">北京市大兴区西红门镇瑞海家园</span>
					<span class="lxdh lxdh_normal">13788882346</span> <span
						class="operation operation_normal"> <span
						class="aco_change">修改</span>|<span class="aco_delete">删除</span>
					</span> <span class="swmr swmr_normal">设为默认</span>
				</div>
				<div class="aim_content_three">
					<span class="dzmc dzmc_normal">宿舍</span> <span
						class="dzxm dzxm_normal">杨洋</span> <span class="dzxq dzxq_normal">山西省小店区山西大学商务学院</span>
					<span class="lxdh lxdh_normal">13799992347</span> <span
						class="operation operation_normal"> <span
						class="aco_change">修改</span>|<span class="aco_delete">删除</span>
					</span> <span class="swmr swmr_normal">设为默认</span>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- 品质保障，私人定制等-->
	<jsp:include page="foot.jsp" />
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/orders.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/distpicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/personal.js"></script>
<script type="text/javascript">
	$(".lxdh_normal").each(function(i, e) {
		var phone = $(e).html();
		$(e).html(changePhone(phone));
	});
</script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/web/action/address/${sessionScope.onLineUser.id}',
			type : 'POST',
			data : null,
			dataType : 'Json',
			success : function(msg){
				if(msg.code==1){
					//ChineseDistricts[86][省号]+ChineseDistricts[省号][市号]+ChineseDistricts[市号][区号]+详细地址
					writeAddress(msg.data);
				}else{
					//alert('用户地址无法加载');
				}
			},
			error : function(){
				alert('请求服务器失败...');
			}
		});
	});
	function writeAddress(data){
		$('.address_information_manage').children().remove();
		var addressName;
		var consignee;
		var provinceCode;
		var citieCode;
		var areaCode;
		var detailed;
		var phone;
		var state;
		for(var i=0;i<data.length;i++){
			addressName=data[i]['addressName'];
			consignee=data[i]['consignee'];
			addressName=data[i]['addressName'];
			provinceCode=data[i]['provinceCode'];
			citieCode=data[i]['citieCode'];
			areaCode=data[i]['areaCode'];
			detailed=data[i]['detailed'];
			phone=data[i]['phone'];
			state=data[i]['state'];
			detailed=ChineseDistricts[86][provinceCode]
				+ChineseDistricts[provinceCode][citieCode]
				+ChineseDistricts[citieCode][areaCode]
				+detailed;
			phone=phone.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
			var html;
				if(state==0){html='<div class="aim_content_two" id="'+data[i]['id']+'">'+
					'<span class="dzmc dzmc_normal">'+addressName+'</span>'+
					'<span class="dzxm dzxm_normal">'+consignee+'</span>'+
					'<span class="dzxq dzxq_normal">'+detailed+'</span>'+
					'<span class="lxdh lxdh_normal">'+phone+'</span>'+
					'<span class="operation operation_normal">'+
					'<span class="aco_change">修改</span>|<span class="aco_delete">删除</span>'+
					'</span><span class="swmr swmr_normal">设为默认</span></div>';
				}else{
					html='<div class="aim_content_two" id="'+data[i]['id']+'">'+
					'<span class="dzmc dzmc_active">'+addressName+'</span>'+
					'<span class="dzxm dzxm_normal">'+consignee+'</span>'+
					'<span class="dzxq dzxq_normal">'+detailed+'</span>'+
					'<span class="lxdh lxdh_normal">'+phone+'</span>'+
					'<span class="operation operation_normal">'+
					'<span class="aco_change">修改</span>|<span class="aco_delete">删除</span>'+
					'</span><span class="swmr swmr_normal"></span></div>';
				}
			$('.address_information_manage').append(html);
		}
		$(".swmr_normal").click(function(){
			setDefault(this);
			$.ajax({
				url:'${pageContext.request.contextPath}/web/action/updateAddressState/'+$(this).parent().attr('id'),
				type:'post',
				dataType:'json',
				success:function(msg){
					if(msg.code==1){
						alert("设置成功");
					}
				},
				error:function(){
					alert("请求服务器失败");
				}
			});
		})
		$(".aco_delete").click(function(){
		if(confirm("确定删除吗？")){
			var url = "";
			var param = "";
			$(this).parent().parent().remove();
			$.post(url,{data:param},function(data){
				
			},"json");
		}
		
	})
	$('.address_information_manage').children().click(function(){
		var id=$(this).attr('id')
		$.ajax({
			url:'${pageContext.request.contextPath}/web/action/checkAddress/'+id,
			type:'post',
			dataType:'json',
			success:function(msg){
				if(msg.code==1){
					addressName=msg.data['addressName'];
					consignee=msg.data['consignee'];
					addressName=msg.data['addressName'];
					provinceCode=msg.data['provinceCode'];
					citieCode=msg.data['citieCode'];
					areaCode=msg.data['areaCode'];
					detailed=msg.data['detailed'];
					phone=msg.data['phone'];
					state=msg.data['state'];
					$("#addressId").val(msg.data['id']);
					$("#receiverName").val(consignee);
					$('#receiverState option').each(function(){
						if($(this).val()==provinceCode){
							//	$(this).attr("selected",'selected');
								//$('#receiverState').trigger(EVENT_CHANGE);
								$(this).prop('selected', true).trigger('change.distpicker');
								return;
							}
					});
					//$('#receiverState option').trigger(EVENT_CHANGE);
					$("#receiverCity option").each(function(){
						if($(this).val()==citieCode){
								//$(this).attr("selected",'selected');
								$(this).prop('selected', true).trigger('change.distpicker');
								return;
							}
					});
					$("#receiverDistrict option").each(function(){
						if($(this).val()==areaCode){
							//$(this).attr("selected",'selected');
							$(this).prop('selected', true).trigger('change.distpicker');
							return;
						}
					});
					$('#receiverAddress').val(detailed);
					$('#receiverMobile').val(phone);
					$('#receiverPhone').val(msg.data['fixedPhone']);
					$('[name=receiverZip]').val(msg.data['postalCode']);
					$('#addressName').val(msg.data['addressName']);
				}
			},
			error:function(){
				alert("请求服务器失败");
			}
		});
});
	}
/* 由于distpicker存在省/市/区,省了以下三种方法
//请求服务器获取省份
$('#receiverState').click(function(){
	
});
//请求服务器获取城市
$('#receiverCity').click(function(){
	
});
//请求服务器获取区/县
$('#receiverDistrict').click(function(){
	
}); */
$('#receiverName').blur(function(){
	$('#receiverState option').each(function(){
		
	});

});

$(".save_recipient").click(function(){
	var receiverName = $("#receiverName").val();// 收件人
	var receiverState = $("#receiverState").val();// 省
	var receiverCity = $("#receiverCity").val();// 市
	var receiverDistrict = $("#receiverDistrict").val();// 区/县
	var receiverAddress = $("#receiverAddress").val();// 
	var receiverMobile = $("#receiverMobile").val();
	if(receiverName && receiverState && receiverCity && receiverDistrict && receiverAddress && receiverMobile){
		//$("form").submit();
		var data={
				"receiverState":receiverState,
				"receiverCity":receiverCity,
				"receiverDistrict":receiverDistrict
			};
		$.ajax({
			url:"${pageContext.request.contextPath}/web/action/updateOrAddAddress/${sessionScope.onLineUser.id}",
			data:$("form").serialize(),
			type:'post',
			success:function(msg){
				if(msg.code==1){
					alert("添加成功");
					//function() {
						$.ajax({
							url : '${pageContext.request.contextPath}/web/action/address/${sessionScope.onLineUser.id}',
							type : 'POST',
							data : null,
							dataType : 'Json',
							success : function(msg){
								if(msg.code==1){
									//ChineseDistricts[86][省号]+ChineseDistricts[省号][市号]+ChineseDistricts[市号][区号]+详细地址
									writeAddress(msg.data);
								}else{
									//alert('用户地址无法加载');
								}
							},
							error : function(){
								alert('请求服务器失败...');
							}
						});
					//}
				}
			},
			error:function(){}
		});
	}else{
		alert("请将必填信息填写完整");
	}
})
</script>
</html>