<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<title>DOT</title>
		
		<script type="text/javascript">
		var contextPath = "${ pageContext.request.contextPath }/";
		</script>
	
		<link href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/css/dotStyle.css"/>" rel="stylesheet">
		
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script> 
		
		<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/application.js"/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/plugins/modernizr.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/plugins/template.js"/>"></script>

		<script type="text/javascript" src="<c:url value="/resources/js/jquery.selectBox.js"/>"></script>
		<%--
		<script type="text/javascript" src="<c:url value="/resources/js/parsley.min.js"/>"></script>
		<script src="<c:url value="/resources/d3/d3.min.js "/>"></script>
		
		<script src="<c:url value="/resources/dimple/lib/d3.v3.4.8.js "/>"></script>
		<script src="<c:url value="/resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
		
		<script src="<c:url value="/resources/d3/radarChart.js "/>"></script>
		--%>
		
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
	</head>
	
	<body class="login">
	
		<!-- page wrapper-->
		<div class="page_login">
	    	<div class="logBox">
	        	<p class="logo"></p>
	        	<strong>Pnet 계정으로 로그인하세요.</strong>	
	            
	            <form class="form_inline" action="<c:url value="/login.do"/>" method="POST">
	            <input type="hidden" name="returnURI" value="<c:out value="${ param.returnURI }"/>"/>
				<div class="layout"> 
	            <!--ID-->
					<div class="layoutLR">
						<label class="logL">ID</label>
						<label class="logR input">
							<i class="icon-append fa fa-user"></i>
	                        <input type="text" name="userId" id="userId" value="" required="required"/>
						</label>
					</div>
	                <!-- Password-->
					<div class="layoutLR">
						<label class="logL">Password</label>
						<label class="logR input">
							<i class="icon-append fa fa-lock"></i>
							<input type="password" name="password" id="password" value="" required="required"/>
						</label>
					</div>
	                <p class="logBtn"><button type="submit" id="btn_login">Login</button></p>
				</div>
				</form>
				
			</div>
		</div>
		<!-- //page-wrapper-->

		<c:if test="${ !(empty loginFailureException) }">
		<div class="modal fade" id="errorInfoModal" tabindex="-1" role="dialog" aria-labelledby="errorInfoModalLabel">
			<div class="modal-dialog modalWd800"> 
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
		            	<div class="login_fail">
		                	<p><img src="<c:url value="/resources/images/login_fail.gif"/>" alt="로그인 실패"/></p>
		                    <strong><span class="fontOrg">로그인에 실패</span> 했습니다</strong>
		                    <p class="exp"><c:out value="${ loginFailureException.message }"/></p>
		                </div>
		                <div class="btn_goPg mt50"><button type="button" data-dismiss="modal">확인</button></div>.
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		
		$('#errorInfoModal').modal({
			backdrop : 'static'
		});
		
		</script>
		</c:if>

	</body>

</html>
