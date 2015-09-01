<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,kr.co.skplanet.aquamarine.model.AccountVO" session="true" %>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		<title><tiles:insertAttribute name="title"/></title>
	
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
		
		<tiles:insertAttribute name="javascript.header"/>
		
		<tiles:insertAttribute name="stylesheet"/>
		
		<script>
		
			$(document).ready(function () {
				
				var session_user_no = "${AccountVO.id}";
				
				$('#loginoutBtn').click(function() {
					
					if (session_user_no.length) logout();
					else $('#login-popup').modal('show');
					
				});
				
				
				
				$('#sub_home').click(function() {
					
					if (session_user_no.length) location.href="/home.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
				
				
				$('#sub_mosu').click(function() {
					
					if (session_user_no.length) location.href="/agreement_mosu.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
				
				
				$('#sub_category_1').click(function() {
					
					if (session_user_no.length)  location.href="/category.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});

				
				
				$('#sub_category_2').click(function() {
					
					if (session_user_no.length)  location.href="/category2.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
				
				
				$('#sub_category_3').click(function() {
					
					if (session_user_no.length)  location.href="/category3.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
				
				
				$('#sub_area').click(function() {
					
					if (session_user_no.length)  location.href="/main_activity_area.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
				
				
				$('#sub_chart').click(function() {
					
					if (session_user_no.length)  location.href="/chart_test.do";
					else alert("정상적인 방법으로 접속 하지 않았습니다.");
					
				});
				
			});
			
		</script>
		
	</head>
	
	
	
	<body class="lfBg">
	
		<div class="wrapper" >
			
			<header>
				<h1><img src="/resources/images/dotLogo.png"  alt="DOT"/></h1>
		    	
				<p id="loginoutBtn" class="logout">
					<button class="log btn_log">
						<c:choose>
							<c:when test="${not empty AccountVO.id}">
								Logout
							</c:when>
							<c:otherwise>
								Login
							</c:otherwise>
						</c:choose>
					</button>
				</p>
				<!--GNB-->
				<div class="gnb">
				    <ul>
				        <li id="sub_home" class="home"><img src="/resources/images/icon_nav1.png" alt="Home"/><a href="#">Home</a></li>
				        <li id="sub_mosu" class="agreeM"><img src="/resources/images/icon_nav2.png" alt="동의"/><a href="#">동의</a></li>
			        	<li  class="category" style="background:#2f99cd;"><img src="/resources/images/icon_nav3.png" alt="업종"/>업종
		                	<!--2Depth-->
		                	 <ul>
		                    	<li id="sub_category_1"><a href="#">업종별 현황</a></li>
		                        <li id="sub_category_2"><a href="#">서비스별 모수 현황</a></li>
		                        <li id="sub_category_3"><a href="#">서비스별 데모 현황</a></li>
		                    </ul>
		                    <!--//2Depth-->
		                </li>
				        <li id="sub_area" class="activityA"><img src="/resources/images/icon_nav4.png" alt="주활동지역"/><a href="#">주활동지역</a></li>
				    </ul>
				</div>
				<!--//GNB--> 
			</header>
			
			<div class="conts">
			
				<main>
				<tiles:insertAttribute name="content"/>
				</main>
				
				<footer>
					<p class="copyright" id="sub_chart">(463-400) 경기도 성남시 분당구 판교로 264(삼평동) The Planet SK플래닛 주식회사 대표이사 서진우<br>
							Copyright © 2015 SK Planet.  ALL RIGHTS RESERVED</p>
				</footer>
			</div>
			
		</div>
			
		<tiles:insertAttribute name="javascript.footer"/>
	
	</body>

</html>