<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		
		<title><tiles:insertAttribute name="title"/></title>
		
		<script type="text/javascript">
		var contextPath = "${ pageContext.request.contextPath }/";
		</script>
	
			
		<link href="<c:url value="/resources/jquery-ui-themes-1.11.1/themes/smoothness/jquery-ui.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/css/dotStyle.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/css/magic.min.css"/>" rel="stylesheet">
		
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/jquery-ui-1.11.1/jquery-ui.js"/>"></script> 
		
		<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/holder.js"/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/application.js"/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/plugins/modernizr.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/plugins/template.js"/>"></script>
		<%--
		<script type="text/javascript" src="<c:url value="/resources/js/parsley.min.js"/>"></script>
		--%>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.selectBox.js"/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/d3/d3.min.js "/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/dimple/lib/d3.v3.4.8.js "/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/d3/radarChart.js "/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/js/underscore-min.js "/>"></script>
		
		<script src="<c:url value="/resources/geo/queue.v1.min.js "/>"></script>
		<script src="<c:url value="/resources/geo/topojson.v1.min.js "/>"></script>
		
		<script type="text/javascript" src="<c:url value="/resources/echart/echarts-all.js"/>"></script>
		
		
		<style>
			/********************
			 * SVG CSS
			 */
			
			
			svg {
			  -webkit-touch-callout: none;
			  -webkit-user-select: none;
			  -khtml-user-select: none;
			  -moz-user-select: none;
			  -ms-user-select: none;
			  user-select: none;
			  /* Trying to get SVG to act like a greedy block in all browsers */
			  display: block;
			  width:100%;
			  height:100%;
			}
			
			
			svg text {
			  font-family: 'Nanum Gothic', sans-serif  !important;
			  font-size: 11px  !important;
			  color: #333  !important;
			}
			
			svg .title {
			  font-family: 'Nanum Gothic', sans-serif;
			  font-size: 14px;
			}
			/*******************
			 그래프 수정
			*/
			.line {
			  fill: #7f6ec7;
			}
			
			/* .box,.line {
			  stroke: none !important;
			  stroke-width: 2px;
			  stroke-linecap: round;
			  stroke-linejoin: round;
			} */
			
			text {
				font-weight: normal !important;
				fill: #000;
				/* opacity: 0.5 !important; */
			}
			
			g text {
				font-size: 11px !important;
			}
			
			.domain {
			  stroke: #b3b3b3 !important;
			  stroke-width: 1px;
			  /* opacity: 0.5;  */
			}
			
			line {
			  stroke: #b3b3b3 !important;
			  stroke-width: 1px;
			  /* opacity: 0.5 !important; */ 
			}
			
			.writing {
			  font-family: 'Nanum Gothic';
			  font-size: 11px;
			}
			
			.hatch-1 {
			  fill: #7f6ec7;
			  stroke: #7f6ec7;
			}
			
			.hatch-2 {
			  fill: #f3c536;
			  stroke: #f3c536;
			}
			
			.hatch-3 {
			  fill: url(#cross-hatch);
			} 
			 /* 
 			#chartContainer svg {
				height: auto;
			}
			   */ 
			.g_font {
				font-family: 'Nanum Gothic', sans-serif; 
				color:#333; 
				font-size:13px;
			}
		</style>

		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<tiles:insertAttribute name="javascript.header"/>
		
		<tiles:insertAttribute name="stylesheet"/>
		
		<script>
			var GV_CHART_THEME = 'macarons';	// EChart Theme (업종별현황)
			//var GV_MALE_COLOR = 'rgba(64, 203, 243, '; /*  GV_MALE_COLOR+alpha값)
			//var GV_FEMALE_COLOR = 'rgba(255, 70, 126, '; /*  ,0.95)' */	//var GV_FEMALE_CROSS_COLOR = 'rgba(255,166,72,1)'; //'rgba(152,0,0,1)';
			
			var GV_GENDER_COLOR = {
				
				male : function(alpha){
					return 'rgba(64, 203, 243, '+ ($.isNumeric(alpha) ? alpha : 1) +')';
				},
				female : function(alpha){
					return 'rgba(255, 70, 126, '+ ($.isNumeric(alpha) ? alpha : 1) +')';
				},
				unknown : function(alpha){
					return 'rgba(157, 220, 81, '+ ($.isNumeric(alpha) ? alpha : 1) +')';
				}
					
			}
			
			$(document).ready(function () {
				
				$('SELECT').selectBox();	// select box css
				
				$('#sub_chart').click(function() {
					
					location.href = "<spring:url value="/chart_test.do" javaScriptEscape="true"/>";
					
				});
				
			});
			
		</script>
		
	</head>
	
	
	
	<body>
	
	<!-- scrollToTop -->
	<div class="scrollToTop"><span>top</span></div>
    
	<!-- page wrapper-->
	<div class="page-wrapper">
    
		<!-- header-->
		<header class="header fixed clearfix">
		
        	<p id="loginoutBtn" class="logout">
        		<%--
        		<c:choose>
					<c:when test="${not empty AccountVO.id}">
						<a href="<c:url value="/logout.do"/>"><button>Logout</button></a>
					</c:when>
					<c:otherwise>
						<button>LogIn</button>
					</c:otherwise>
				</c:choose>
				--%>
				<a href="<c:url value="/logout.do"/>"><button>Logout</button></a>
            </p>
			<div class="container">
				<!-- header-left -->
				<div class="headerLF clearfix">
					<!-- logo -->
                    <a href="<c:url value="/home.do"/>"><p class="logo"><span>Dig Out Treasure</span></p></a>
				</div>
				<!--// header-left -->
                
                <!-- header-right -->
				<div class="headerRG clearfix">
					<!-- main-navigation-->
					<div class="main-navigation animated">
					<!-- navbar-->
						<nav class="navbar navbar-default" role="navigation">
							<div class="container-fluid">
								<div class="collapse navbar-collapse" >
									<ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
											<a href="<c:url value="/parameterStats/overview.do"/>" class="dropdown-toggle" data-toggle="dropdown">모수현황 <span class="fa fa-angle-down"></span></a>
											<ul class="dropdown-menu" style="left:-50px;">
                                            	<p><img src="<c:url value="/resources/images/icon-dropdownMenu.png"/>"></p>
                                                <li><a href="<c:url value="/parameterStats/overview.do"/>">Overview</a></li>
                                            	<li><a href="<c:url value="/parameterStats/agreement/essential.do"/>">필수 동의 기준</a></li>
                                                <li><a href="<c:url value="/parameterStats/agreement/cross.do"/>">교차활용 동의 기준</a></li>
											</ul>
										</li>
                                         <li class="dropdown">
											<a href="<c:url value="/category/categoryBusy.do"/>" class="dropdown-toggle " data-toggle="dropdown">업종 <span class="fa fa-angle-down"></span></a>
											<ul class="dropdown-menu" style="left:-50px;">
                                            	<p><img src="<c:url value="/resources/images/icon-dropdownMenu.png"/>"></p>
                                                <!--업종 2depth-->
                                            	<li><a href="<c:url value="/category/categoryBusy.do"/>">업종별 현황</a></li>
                                                <li><a href="<c:url value="/category/categoryMosu.do"/>">서비스별 모수 현황</a></li>
                                                <li><a href="<c:url value="/category/categoryDemo.do"/>">서비스별 데모 현황</a></li>
											</ul>
										</li>
										<li class="dropdown">
											<a href="<c:url value="/main_activity_area.do"/>" class="dropdown-toggle" data-toggle="dropdown">주 활동지역</a>
										</li>
										<li class="dropdown">
                                            <a href="<c:url value="/insights/insights.do"/>" class="dropdown-toggle" data-toggle="dropdown">Insights</a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="<c:url value="/insights/insights.do"/>" class="dropdown-toggle" data-toggle="dropdown">그날에 우리</a>
                                        </li>
									</ul>
								</div>
							</div>
						</nav>
						<!-- //navbar-->
					</div>
					<!--// main-navigation -->
				</div>
                <!--// header-right -->
                
			</div>
		</header>
		<!-- //header-->
			
		<div class="conts">
		
			<main>
			<tiles:insertAttribute name="content"/>
			</main>
			
			
			<!--footer-->
			<footer>
	        	<div class="container">
					<p class="copyR">(463-400) 경기도 성남시 분당구 판교로 264(삼평동) The Planet SK플래닛 주식회사 대표이사 서진우<br>
					Copyright © 2015 SK Planet.  ALL RIGHTS RESERVED</p>
					<p class="wording">Commerce Data PF Team 이란</p>
	            </div>
			</footer> 
			<!-- //footer -->
		
		</div>
		
	</div>
		
	<tiles:insertAttribute name="javascript.footer"/>
	
	</body>

</html>