<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,kr.co.skplanet.aquamarine.model.AccountVO" session="true" %>
<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title><tiles:insertAttribute name="title"/></title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
<!-- jQuery UI 1.11.1 -->
<link rel="stylesheet" href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script> 
<!-- Bootstrap -->
<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
<script src="<c:url value="/resources/js/imageMain.js"/>"></script>
<tiles:insertAttribute name="javascript.header"/>
<tiles:insertAttribute name="stylesheet"/>
<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-56167432-1', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body>
<!-- 
*********************************
	이미지비교검색페이지의 Header
*********************************
-->
<!-- Top Navibar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index.do">POC</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/report.do">REPORTS</a></li>
				<li><a href="/random.do">APPS</a></li>
				<li><a href="/info.do">ABOUT</a></li>
				<li><a href="/imageIndex.do">이미지비교</a></li>
			</ul>
			<form role="form" method="post" action="<c:url value="/searchImage.do"/>" id="imageMain-form" data-ajax="false" class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" id="searchProdName" name="searchProdName" placeholder="앱검색" title="상품명" data-container="body" data-toggle="popover" data-placement="bottom" data-content="검색해 보세요"/>
					<input type="hidden" id="searchPkgNm" name="searchPkgNm" />
					<input type="hidden" id="searchTstoreProdId" name="searchTstoreProdId" />
					<input type="hidden" id="searchNaverAppId" name="searchNaverAppId" />
					<input type="hidden" id="searchCount" name="searchCount" value="10"/>
				</div>
				<button id="searchBtn" class="btn btn-info" onclick="javascript:goSearch();return false;">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
		</div>
	</div>
</div>
<!-- // Top Navibar -->
<!-- Container -->      
<div class="container">
	<tiles:insertAttribute name="content"/>
</div>
<!-- // Container -->
<div class="container">
    <hr>
	<!-- Footer -->
	<footer>
		<p>Copyright &copy; 2014 SKPlanet All Rights Reserved.</p>
	</footer>
	<!-- // Footer -->	
</div>	
<tiles:insertAttribute name="javascript.footer"/>
</body>
</html>