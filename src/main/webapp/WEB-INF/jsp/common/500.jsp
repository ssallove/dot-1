<%@ page language="java" pageEncoding="UTF-8" session="false"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>500 Error</title>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/parsley.min.js"/>"></script>
	
	<!-- jQuery UI 1.11.1 -->
	<link rel="stylesheet" href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css"/>" rel="stylesheet" type="text/css">
	<script src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script>

	<!-- Bootstrap -->

    <link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet" type="text/css">
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
    
    <link href="<c:url value="/resources/css/dotStyle.css"/>" rel="stylesheet" type="text/css">
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript" src=" <c:url value="/resources/js/adm.common.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js"/> "></script>
    <script>
	$(document).ready(function () {
		$('#btnError').click(function() {
			window.history.back();
		});
	});
	</script>
</head>

<body class="Error">
	<!-- page wrapper-->
	<div class="ErrorPG">
    	<div class="pageError">
            <p class="error"><i class="fa icon-warning-sign"></i></p>
            <p class="txt2">500 INTERNAL SERVER ERROR</p>
            <p class="txtKo2">문제가 발생하여 페이지를 표시할 수 없습니다.</p>				
			
		</div>
        
	</div>
    <p class="btn_goPg "><button type="button" id="btnError">이전 페이지로 이동</button></p>
	<!-- //page-wrapper-->


</body>

</html>
