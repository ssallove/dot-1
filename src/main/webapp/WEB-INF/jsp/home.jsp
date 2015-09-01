<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="content">
  	      	<!-- contents-->
			<div class="wrapMain">
				<h3>Overview</h3>
            	<div class="graph txtC mb30" style="height:200px">준비중입니다.</div> 
                  	
            	<h3>FAQ</h3>
            	<div class="graph txtC mb30" style="height:200px">준비중입니다.</div>    
              
            	<h3>Contacts</h3>
            	<div class="graph txtC mb30" style="height:200px">준비중입니다.</div>      
  	      	</div>
  	      	<!-- //contents-->
	</tiles:putAttribute>
	<tiles:putAttribute name="javascript.footer">
		<script type="text/javascript">
			$(document).ready(function() {
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
