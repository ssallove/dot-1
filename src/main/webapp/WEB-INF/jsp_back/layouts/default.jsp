<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/directive.jsp" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title><tiles:insertAttribute name="title"/></title>
<script type="text/javascript">
var contextPath = "<c:url value="/"/>";
</script>
<link rel="stylesheet" href="<c:url value="/resources/css/intro.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.validity.cust.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/lang/ko.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/application.js"/>"></script>

<!-- jQuery UI 1.10.3 -->
<link rel="stylesheet" href="<c:url value="/resources/jquery-ui-1.10.3.custom/css/redmond/jquery-ui-1.10.3.custom.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"/>"></script>

<tiles:insertAttribute name="javascript.header"/>
<tiles:insertAttribute name="stylesheet"/>
</head>

<body>

<tiles:insertAttribute name="content"/>

<div id="footer">Copyright(c) 2013 SKPlanet All Rights Reserved.</div>

<tiles:insertAttribute name="javascript.footer"/>

</body>

</html>