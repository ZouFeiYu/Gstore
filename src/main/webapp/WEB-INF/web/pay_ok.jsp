<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>支付成功</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    <link href="${pageContext.request.contextPath}/css/payment.css" rel="Stylesheet"/>
</head>
<body>
<!-- 页面顶部-->
<div id="container" >
    <div class="rightsidebar_box rt">
        <div class="pay_result">
            <img src="${pageContext.request.contextPath}/images/pay/pay_succ.png" alt=""/>
            <p>支付成功</p>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>