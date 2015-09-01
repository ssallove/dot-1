<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
<tiles:insertDefinition name="header.layout">
	<tiles:putAttribute name="stylesheet">
		<script type="text/javascript" src="<c:url value=" /resources/js/adm.common.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/js/common.js "/>"></script>
	</tiles:putAttribute>
	<tiles:putAttribute name="content">
			<!--메인 슬라이드 이미지-->
  	      	<div id="carousel-example-generic" class="carousel" data-ride="carousel" >
  				<!-- Indicators -->
  				<ol class="carousel-indicators" >
    				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
    				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
  				</ol>

  				<!-- Wrapper for slides -->
  				<div class="carousel-inner" role="listbox">
    				<p class="item active mainF1">main image1</p>
    				<p class="item mainF2" title="main images1">main image2</p>
                    <p class="item mainF3">main image3</p>
				</div>

				<!-- Controls button-->
  				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    				<span aria-hidden="true"><img src="/resources/images/btn_prev.png" alt="Previous"/></span>
  				</a>
  				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    				<span aria-hidden="true"><img src="/resources/images/btn_next.png"  alt="Next"/></span>
  				</a>
  	      	</div>
  	      	<!--//메인 슬라이드 이미지-->
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
				$('#sub_home').addClass("active");

				$('.carousel').carousel({
					interval : 3000
				})
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
