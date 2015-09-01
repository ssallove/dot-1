<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>404 Error</title>
	<script type="text/javascript" src="/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/parsley.min.js"></script>
	
	<!-- jQuery UI 1.11.1 -->
	<link rel="stylesheet" href="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
	<script src="/resources/jquery-ui-1.11.1/jquery-ui.js"></script>

	<!-- Bootstrap -->

    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/holder.js"></script>
	<script src="/resources/js/main.js"></script>
    
    <link href="/resources/css/dot.css" rel="stylesheet" type="text/css">
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript" src=" /resources/js/adm.common.js "></script>
    <script type="text/javascript" src="/resources/js/common.js "></script>
    <script>
	$(document).ready(function () {
		$('#btnError').click(function() {
			window.history.back();
		});
	});
	</script>
</head>

<body class="error">
<div class="errorLy500 ">
	<p class="txtBox">문제가 발생하여 페이지를 표시할 수 없습니다.</p>
    <p class="goBtn"><button id="btnError">이전 페이지로 이동</button></p>
</div>
</body>
</html>
