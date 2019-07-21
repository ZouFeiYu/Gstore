<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>学子商城登陆页面</title>

</head>
<body>
	<div id="cateroty"></div>
	<a href="#" onclick="ac()">点我</a>

</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	function ac() {
		$.ajax({
			url : '${pageContext.request.contextPath}/web/action/selectCategory',
			dataType : 'json',
			data : {
				'parentId' : 0
			},
			type : 'post',
			success : function(msg) {
				if (msg.code == 1) {
					$('#cateroty').children().remove();
					var data = msg.data;
					var html = '<ul>' + writh(data) + '</ul>';
					$('#cateroty').append(html);
				} else {
					$('#cateroty').text("获取数据失败");
				}
			},
			error : function() {
				$('#cateroty').text("请求服务器失败");
			}
		});
	}
	function writh(data) {
		var html="";
		for (var i = 0; i < data.length; i++) {
			html = html + '<li>' + data[i]['name'] + '</li>';
			if (data[i]['children'] != null) {
				html = html + '<ul>' + writh(data[i]['children']) + '</ul>';
			}
		}
		return html;
	}
</script>
</html>