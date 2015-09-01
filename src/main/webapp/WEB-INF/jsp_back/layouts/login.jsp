<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,kr.co.skplanet.aquamarine.model.AccountVO" session="true" %>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>Login</title>
		
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/parsley.min.js"/>"></script>
		<link rel="stylesheet" href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css"/>" rel="stylesheet" type="text/css">
		<script src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script> 
		<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
		<script src="<c:url value="/resources/js/main.js"/>"></script>
		<link href="<c:url value="/resources/css/dot.css"/>" rel="stylesheet">
	
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
		
			var session_user_no = "${AccountVO.id}";
			
			if (session_user_no.length) location.href="/home.do";
		
			$(document).ready(function() {
			});
			
		</script>
		
	</head>
	
	<body class="login">
		<div class="loginLy">
			<p class="logo"><img src="resources/images/dotLogo.png"  alt="DOT Logo"/></p>
			<div class="txtBox">
		    	<form class="form_inline" action="/loginproc.do" method="POST">
		        	<!--ID-->
		        	<div class="form_group">
		        		<p class="wd">ID</p>
		                <input  type="text" name="userId" id="userId" value="admin" class="loginput ">
		        	</div>
		            <!--//ID-->
		            <!--Password-->
		            <div class="form_group">
		        		<p class="wd">Password</p>
		                <input  type="password" name="password" id="password" value="" class="loginput noborB">
		        	</div>
		             <!--//Password-->
		             <p class="logBtn"><button id="btn_login" type="submit">Login</button></p>
		        </form>
		    </div>
		</div>
		
	</body>

</html>