<%@ page language="java" pageEncoding="UTF-8" session="false"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<title><tiles:insertAttribute name="title"/> (${ pageContext.response.status })</title>
	
	<script type="text/javascript">
	var contextPath = "${ pageContext.request.contextPath }/";
	</script>
	
	<link rel="stylesheet" href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css?${ BROWSER_CACHE_TIME_FLAG }"/>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.css?${ BROWSER_CACHE_TIME_FLAG }"/>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/dotStyle.css?${ BROWSER_CACHE_TIME_FLAG }"/>" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/application.js?${ BROWSER_CACHE_TIME_FLAG }"/>"></script>
    
    
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<tiles:insertAttribute name="javascript.header"/>
	
	<tiles:insertAttribute name="stylesheet"/>

    <script>
	$(document).ready(function () {
		$('#btnError').click(function() {
			window.history.back();
		});
	});
	</script>
</head>

<body class="Error">

	<div class="ErrorPG">
	
    	<div class="pageError">
            <p class="error"><i class="fa icon-warning-sign"></i></p>
            <tiles:insertAttribute name="content"/>
		</div>
        
	</div>
	
    <p class="btn_goPg "><button type="button" id="btnError">이전 페이지로 이동</button></p>

	<tiles:insertAttribute name="javascript.footer"/>

</body>


</html>
