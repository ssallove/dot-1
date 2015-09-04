<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"
%><%@page import="java.util.Map,
				  java.util.HashMap,
				  java.util.LinkedHashMap,
				  com.fasterxml.jackson.databind.ObjectMapper"%><%

	Map<String, String> statsLevelMap = new LinkedHashMap<String, String>();
	statsLevelMap.put("0", "가입고객수");
	statsLevelMap.put("1", "통합고객수");
	statsLevelMap.put("2", "Active 고객수");
	statsLevelMap.put("3", "MAU 고객수");
	pageContext.setAttribute("statsLevelMap" , statsLevelMap);
	
	Map<String, String> agreementTypeMap = new LinkedHashMap<String, String>();
	agreementTypeMap.put("99", "전체");
	agreementTypeMap.put("03", "PUSH동의");
	agreementTypeMap.put("02", "위치동의");
	agreementTypeMap.put("01", "BLE동의");
	pageContext.setAttribute("agreementTypeMap" , agreementTypeMap);
	
	Map<String, String> unionDescMap = new HashMap<String, String>();
	unionDescMap.put("01", "Syrup ∪ OCB");
	unionDescMap.put("02", "Syrup ∪ OCB ∪ T-Map");
	unionDescMap.put("03", "Syrup ∪ OCB ∪ 11번가");
	unionDescMap.put("04", "Syrup ∪ OCB ∪ T-Map ∪ 11번가");
	pageContext.setAttribute("unionDescMap" , unionDescMap);
	
	Map<String, String> intersectDescMap = new HashMap<String, String>();
	intersectDescMap.put("01", "Syrup ∩ OCB");
	intersectDescMap.put("02", "Syrup ∩ OCB ∩ T-Map");
	intersectDescMap.put("03", "Syrup ∩ OCB ∩ 11번가");
	intersectDescMap.put("04", "Syrup ∩ OCB ∩ T-Map ∩ 11번가");
	pageContext.setAttribute("intersectDescMap" , intersectDescMap);
	
	ObjectMapper jsonMapper = new ObjectMapper();
	pageContext.setAttribute("jsonWriter" , jsonMapper.writer());
		
%><tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="content">


<!-- main-container -->
		<section >
        	<p class="agreement"><img src="<c:url value="/resources/images/agreement_img.jpg"/>"  title="업종 상단 이미지"/></p>
			<div class="container mb100">
			<h1>
				<c:choose>
					<c:when test="${ type == 'essential' }">필수</c:when>
					<c:when test="${ type == 'cross' }">교차활용</c:when>
				</c:choose>
				동의 기준
				<c:if test="${ fn:length(listVoSum) > 0 }">
				<fmt:parseDate pattern="yyyyMMdd" value="${listVoSum[0].baseDt}" var="baseDt" />
				<span class="date">데이터 기준일 : <fmt:formatDate type="DATE" value="${ baseDt }"/></span>
				</c:if>
			</h1>
                
                
                <!---서비스별 동의 현황--> 
                <h2>서비스별 동의 현황</h2>
                <!--Tab Layout-->
                <div class="tab_content inTabLy inTabLyTR">
                <p class="btSpace_Gspc"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스 조합별 교차 고객 현황</button></p>
                	<!--TAB-->
					<ul class="tabSty">
      					<li class=" active"><a href="#tab1Chart"  data-toggle="tab"><p class="ico"></p>Chart</span></a></li>
      					<!-- <li><a href="#tab1Map"  data-toggle="tab"><p class="ico"></p>Chart2</a></li> -->
                        <li><a href="#tab1Table"  data-toggle="tab"><p class="ico"></p>Table</a></li>
      				</ul>
                    <!--//TAB-->
                    <!--TAB Contents-->
                	<div class="tab_content">
                    
                    	<!--TAB Chart 1-->
						<div class="tab_paneLy active" id="tab1Chart" >
						
                        	<!--버튼영역-->
                        	<p class=" floatR mb10">
                            	<button type="button" class="chartBt" data-stats-level="1">통합</button>
                                <button type="button" class="chartBt" data-stats-level="2">Active</button>
                                <button type="button" class="chartBt" data-stats-level="3">MAU</button>
                            </p>
                            <!--//버튼영역-->

							<ul class="in_pane wdh100" style="display:table;">
								<li style="display:table-cell;">
									<div class="in_pane3" id="paramBySvcBarChart" style="border-color:#fff;padding:20px 0 0;"></div>
								</li>
								<c:if test="${ type == 'cross' }">
								<li style="display:table-cell;width:30%;vertical-align:top;">
									<div class="in_pane3" style="margin-left:15px;width:auto;">
										<div id="intersectBySvcBarChart" style="height:290px;"></div>
										<div class="chartexpLy">
											<p class="box">
												<strong><img src="<c:url value="/resources/images/ci_sm_tmap.png"/>" width="90" height="46" alt="T-Map" /></strong><span class="intersectBySvcCount" data-bm="tma"></span>
											</p>
											<p class="box">
												<strong><img src="<c:url value="/resources/images/ci_sm_tstore.png"/>" width="90" height="46" alt="T-Store" /></strong><span class="intersectBySvcCount" data-bm="tst"></span>
											</p>
											<p class="box">
												<strong><img src="<c:url value="/resources/images/c_sm_i_11.png"/>" width="90" height="46" alt="11번가" /></strong><span class="intersectBySvcCount" data-bm="evs"></span>
											</p>
										</div>
									</div>
								</li>
								</c:if>
								<li style="display:table-cell;width:35%;">
									<div class="in_pane3" style="margin-left:15px;width:auto;" id="paramBySegPieChart"></div>
								</li>
							</ul>

						</div>
						<!--//TAB Chart 1-->
<!-- 
                    	<div  class="tab_pane2 active" id="tab1Chart" >
                    	<a href="javascript:dimpleBar('0');">가입고객수</a>
                    	<a href="javascript:dimpleBar('1');">통합고객수</a>
                    	<a href="javascript:dimpleBar('2');">Active 고객수</a>
                    	<a href="javascript:dimpleBar('3');">Mau 고객수</a>
                    	</div>
                        //TAB Chart 1 -->
                        
                        <!--TAB Chart 2-->
                        <div  class="tab_pane2" id="tab1Map" >Map</div>
                        <!--//TAB Chart 2-->
                         
                        <!--TAB Table-->
                        <div  class="tab_pane2" id="tab1Table" >
                        	<!--필수 동의 Table-->
                        	<p class="expTb mt20">※ Active 고객수 -> 앱활동성 3개월, MAU -> 앱활동성 1개월, Active 고객은 OCB, Syrup, T-Map </p>
                        	<table class="listTB tStriped ">
                            	<colgroup>
                                	<col width="*">
                                	<c:choose>
                                	<c:when test="${ type == 'essential' }">
                         			<col width="10%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	</c:when>
                                	<c:when test="${ type == 'cross' }">
                         			<col width="16%">
                                	<col width="20%">
                                	<col width="20%">
                                	<col width="20%">
                                	<col width="20%">
                                	</c:when>
                                	</c:choose>
                            	</colgroup>
    							<thead>
        							<tr>
           								<th>&nbsp;</th>
            							<th>&nbsp;</th>
            							<th>TOTAL</th>
            							<th>Syrup</th>
            							<th>OCB</th>
            							<th>OCB(App)</th>
            							<c:if test="${ type == 'essential' }">
            							<th>T-Map</th>
            							<th>11번가</th>
            							<th>T-Store</th>
            							</c:if>
            						</tr>
    							</thead>
                            	<tbody>
                            
                            <c:choose>
							<c:when test="${fn:length(listVoSum) > 0}">
							<c:forEach items="${listVoSum}" var="voList" varStatus="status">
								<tr <c:if test="${status.index % 4 == '3'}"> class="last"</c:if>>
									<c:if test="${status.index % 4 == '0'}">
										<td rowspan="4" class="depth1 txtC last"><c:out value="${statsLevelMap[voList.lv]}" /></td>
									</c:if>
									<td class="depth2 txtL"><c:out value="${agreementTypeMap[voList.funcAgrClCd]}" /></td>
									<td class="total"><fmt:formatNumber value="${voList.tot}"/></td>
									<td><fmt:formatNumber value="${voList.syr}"/></td>
									<td><fmt:formatNumber value="${voList.ocb}"/></td>
									<td><fmt:formatNumber value="${voList.oct}"/></td>
									<c:if test="${ type == 'essential' }">
									<td><fmt:formatNumber value="${voList.tma}"/></td>
									<td><fmt:formatNumber value="${voList.evs}"/></td>
									<td><fmt:formatNumber value="${voList.tst}"/></td>
									</c:if>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="txtC">데이터가 없습니다.</td>
								</tr>
							</c:otherwise>
							</c:choose>
								</tbody>
							</table>
                        	<!--//필수 동의 Table-->
                        </div>
                        <!--//TAB Table-->
                            
                    </div>
                    <!--//TAB Contents-->
				 </div>
                <!---//Tab Layout-->  
                
                
                
                <!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
							<div class="modal-header">
				            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                 <h3 id="myModalLabel">서비스 조합별 교차 고객 현황</h3>
							</div>
				            <div class="modal-body">
                
                
                
                
				                <!-- <h2>서비스 조합별 교차 고객 현황</h2> No Modal -->
				                <h3>합집합 현황 <span  class="floatR expTb">※ T-Map, 11번가는 현재기준 동의가 없음.</span></h3>
				                    <!--합집합 현황-->
									<table class="listTB tStriped ">
				                    	<colgroup>
				                        	<col width="*">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                        </colgroup>
				    					<thead>
				        					<tr class="longH">
				            					<th rowspan="2">서비스조합</th>
				            					<th colspan="4">가입 고객수</th>
				            					<th colspan="4">Active 고객수</th>
				            					<th colspan="4">MAU</th>
				           					</tr>
				        					<tr class="thDepth">
				        					    <th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th>위치동의</th>
				        					    <th>BLE동의</th>
				        					   	<th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th>위치동의</th>
				        					    <th>BLE동의</th>
				        					    <th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th >위치동의</th>
				        					    <th>BLE동의</th>
				    					    </tr>
				        				<tbody>
				        				
									<c:if test="${listUnionStats.size() == 0}">
										<tr>
											<td colspan="13" class="txtC">데이터가 없습니다.</td>
										</tr>
									</c:if>
				
									<c:forEach items="${listUnionStats}" var="item" varStatus="status">
										<tr>
											<td class="depth2 txtC"><c:out value="${unionDescMap[item.crossSvcUnionCd]}" /></td>
											<td class="total"><fmt:formatNumber value="${item.scbMbrCntTot}"/></td>
											<td><fmt:formatNumber value="${item.scbMbrCntPush}"/></td>
											<td><fmt:formatNumber value="${item.scbMbrCntGeo}"/></td>
											<td><fmt:formatNumber value="${item.scbMbrCntBle}"/></td>
											<td class="total"><fmt:formatNumber value="${item.actvMbrCntTot}"/></td>
											<td><fmt:formatNumber value="${item.actvMbrCntPush}"/></td>
											<td><fmt:formatNumber value="${item.actvMbrCntGeo}"/></td>
											<td><fmt:formatNumber value="${item.actvMbrCntBle}"/></td>
											<td class="total"><fmt:formatNumber value="${item.mauCntTot}"/></td>
											<td><fmt:formatNumber value="${item.mauCntPush}"/></td>
											<td><fmt:formatNumber value="${item.mauCntGeo}"/></td>
											<td><fmt:formatNumber value="${item.mauCntBle}"/></td>
										</tr>
									</c:forEach>
				        				
				       					</tbody>
									</table>
									<!--//합집합 현황-->
				                     
									<h3 class="mt80">교집합 현황 <span  class="floatR expTb">※ T-Map, 11번가는 현재기준 동의가 없음.</span></h3>
				                    <!--교집합 현황-->
									<table class="listTB tStriped">
				                    	<colgroup>
				                        	<col width="*">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                            <col width="7%">
				                        </colgroup>
				    					<thead>
				        					<tr class="longH">
				            					<th rowspan="2">서비스조합</th>
				            					<th colspan="4">가입 고객수</th>
				            					<th colspan="4">Active 고객수</th>
				            					<th colspan="4">MAU</th>
				           					</tr>
				        					<tr class="thDepth">
				        					    <th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th>위치동의</th>
				        					    <th>BLE동의</th>
				        					   	<th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th>위치동의</th>
				        					    <th>BLE동의</th>
				        					    <th>전체</th>
				        					    <th>PUSH동의</th>
				        					    <th>위치동의</th>
				        					    <th>BLE동의</th>
				    					    </tr>
				        				<tbody>
				        				
				        				
				        				<c:if test="${listIntersectStats.size() == 0}">
											<tr>
												<td colspan="13" class="txtC">데이터가 없습니다.</td>
											</tr>
										</c:if>
				
										<c:forEach items="${listIntersectStats}" var="item" varStatus="status">
											<tr>
												<td class="depth2 txtC"><c:out value="${intersectDescMap[item.crossSvcUnionCd]}" /></td>
												<td class="total"><fmt:formatNumber value="${item.scbMbrCntTot}"/></td>
												<td><fmt:formatNumber value="${item.scbMbrCntPush}"/></td>
												<td><fmt:formatNumber value="${item.scbMbrCntGeo}"/></td>
												<td><fmt:formatNumber value="${item.scbMbrCntBle}"/></td>
												<td class="total"><fmt:formatNumber value="${item.actvMbrCntTot}"/></td>
												<td><fmt:formatNumber value="${item.actvMbrCntPush}"/></td>
												<td><fmt:formatNumber value="${item.actvMbrCntGeo}"/></td>
												<td><fmt:formatNumber value="${item.actvMbrCntBle}"/></td>
												<td class="total"><fmt:formatNumber value="${item.mauCntTot}"/></td>
												<td><fmt:formatNumber value="${item.mauCntPush}"/></td>
												<td><fmt:formatNumber value="${item.mauCntGeo}"/></td>
												<td><fmt:formatNumber value="${item.mauCntBle}"/></td>
											</tr>
										</c:forEach>
										
				       					</tbody>
									</table>
									 <!--//교집합 현황-->
				                
				                
				            </div>
						</div>
					</div>
				</div>
				<!--//Modal -->
                
            </div>
		</section>
		<!--// main-container-->
	
	</tiles:putAttribute>
	
	
	<tiles:putAttribute name="javascript.footer">
	
	<script type="text/javascript">
	
	var statsLevel = null;
	
	var charts = [];
	
	var paramBySvcBarChart = null;
	var paramBySegPieChart = null;

	<c:choose>
	<c:when test="${ type == 'essential' }">
	var serviceMap = {
		'syr' : 'Syrup',
		'ocb' : 'OCB',
		'oct' : 'OCB(App)',
		'tma' : 'T-Map',
		'tst' : 'T-Store',
		'evs' : '11번가'
	};
	</c:when>
	<c:when test="${ type == 'cross' }">
	var serviceMap = {
		'syr' : 'Syrup',
		'ocb' : 'OCB',
		'oct' : 'OCB(App)'
	};
	
	var intersectMap = {
		'tma' : 'T-Map',
		'tst' : 'T-Store',
		'evs' : '11번가'
	};
	
	var intersectBySvcBarChart = null;
	
	var intersectBySvcBarChartOption = {
	    title : {
	    	text : '',
	    	subtext : '해당 모수와 다른 BM간의 교집합',
	    	itemGap : 10
	    },
   	    tooltip : {
   	        trigger: 'axis',
   	     	formatter: "{a0} <br/>{b0} : {c0}",
   	        axisPointer : {         
   	            type : 'shadow'     
   	        }
   	    },
   	    grid: {
   	        y : 80,
   	        y2 : 30,
   	        x2 : 20
   	    },
   	    xAxis : [
   	        {
   	            type : 'category',
   	         	data : $.map(intersectMap, function(val, i){ return val; })
   	        }
   	    ],
   	    yAxis : [
   	        {
   	            type : 'value'
   	        }
   	    ],
   	    backgroundColor : '#fff',
   	    series : [
   	    	{
   	    		name : '교차모수',
   	    		type : 'bar',
   	    		barCategoryGap : '50%',
   	    		itemStyle : {
   	    			normal : {
   	    				color : function(params){
   	    					return intersectBySvcBarChart._themeConfig.color[params.dataIndex + 3];
   	    				}
   	    			}
   	    		},
   	    		data : ['-', '-', '-']
   	    	}
   	    ]
	};
	
	// 회원 모수 구분 > 동의 형식 > 서비스(Syrup, OCB, OCB(App))
	var intersectBySvcData = [];
	intersectBySvcData.done = false;
		
	function parseIntersectBySvcData(){
		
		var data = {}, _data = null;
		
		for(var svc in serviceMap)
			data[svc] = [];
		
		var listCrossIntersectStats = <spring:eval expression="jsonWriter.writeValueAsString(listCrossIntersectStats)"/>;
		
		$.each(listCrossIntersectStats, function(i, item){
			
			var dataIndex = i % 4;
			
			if(dataIndex == 0)
				_data = $.extend(true, {}, data);
			
			for(var svc in serviceMap)
				_data[svc][dataIndex] = $.map(intersectMap, function(val, itSvcKey){ return { value : item[svc][itSvcKey], serviceKey : itSvcKey }; });
			
			if(dataIndex == 3)
				intersectBySvcData[item.lv] = _data
			
		});
		
		intersectBySvcData.done = true;
		
	}
	
	function drawIntersectBySvcBarChart(serviceKey, agreementTypeIndex){
		
		intersectBySvcBarChartOption.title.text = serviceMap[serviceKey] +' > '+ agreementTypes[agreementTypeIndex];

		intersectBySvcBarChartOption.series[0].data = intersectBySvcData[statsLevel][serviceKey][agreementTypeIndex];
		
		var countSpan = $('.intersectBySvcCount');
		$.each(intersectBySvcBarChartOption.series[0].data, function(i, item){
			countSpan.filter('[data-bm='+ item.serviceKey +']').text(formatCurrency(item.value));
		});
		
		intersectBySvcBarChart.setOption(intersectBySvcBarChartOption);
		
	}
	
	</c:when>
	</c:choose>
	
	var agreementTypes = <spring:eval expression="jsonWriter.writeValueAsString(agreementTypeMap.values())"/>;
	
	var sexMap = {
		'F' : '여성',
		'M' : '남성',
		'Z' : '기타(성별)'
	}
	
	var ageRangeMap = {
		'0009' : '10세 미만',
		'1019' : '10대',
		'2029' : '20대',
		'3039' : '30대',
		'4049' : '40대',
		'5099' : '50세 이상',
		'ZZZZ' : '기타(연령)'
	}
	
	var paramBySvcBarChartConfMap = {
	
		dataStyle : { 
          	    normal: {
          	        label : {
          	            show: true,
          	            position: 'insideLeft',
          	            formatter: function(params, ticket, callback){
          	            	return formatCurrency(params.data.actual);
          	            },
          	         	textStyle : {
          	         		color:'#000'
          	         	}
          	        }
          	    },
          	 	emphasis: {
          	        label : {
          	            show: true,
          	         	textStyle : {
          	         		color:'#000'
          	         	}
          	        }
          	    }
          	},

		placeHoledStyle : {
       	    normal:{
       	        barBorderColor:'rgba(0,0,0,0)',
       	        color:'rgba(0,0,0,0)'
       	    },
       	    emphasis:{
       	        barBorderColor:'rgba(0,0,0,0)',
       	        color:'rgba(0,0,0,0)'
       	    }
       	},
      	
		option : {
		    title : {
		    	text : '',
		    	subtext : 'BM별 모수',
		    	itemGap : 10
		    },
       	    tooltip : {
       	        trigger: 'item',
       	        formatter : function(params, ticket, callback){
       	        	
       	        	if(params.seriesIndex % 2 == 0)
       	        		return params.name +'<br/>'+ params.seriesName +' : '+ formatCurrency(params.data.actual);
       	        	else
       	        		return params.name +'<br/>'+ params.seriesName +' : '+ formatCurrency(paramBySvcBarChart.getSeries()[params.seriesIndex - 1].data[params.dataIndex].actual);
       	        	
       	        }
       	    },
       	    legend: {
       	        y: 55,
       	        //itemGap : document.getElementById('tabChartL').offsetWidth / 8,
       	        data : $.map(serviceMap, function(val, i){ return val; })
       	    },
       	    toolbox: {
       	        show : false,
       	        feature : {
       	            mark : {show: false},
       	            dataView : {show: true, readOnly: true},
       	            restore : {show: false},
       	            saveAsImage : {show: true}
       	        }
       	    },
       	    grid: {
       	        y : 80,
       	        y2 : 20,
       	        x : 70,
       	        x2 : 30,
       	        borderWidth : 0
       	    },
       	    xAxis : [
       	        {
       	            type : 'value',
       	            position: 'top',
       	            splitLine: {show: false},
       	            splitArea: {show: false},
       	            axisLabel: {show: false},
       	            scale: false
       	        }
       	    ],
       	    yAxis : [
       	        {
       	            type : 'category',
       	            splitLine: {show: false},
       	            data : agreementTypes
       	        }
       	    ],
       	    backgroundColor : '#fff',
       	    series : []
       	}
	}
	
	var paramBySegPieChartConfMap = {
			
		option : {
		    title : {
		    	text : '',
		    	subtext : '성연령 분포',
		    	itemGap : 10,
		    	textStyle : {
		    		//fontSize : 22
		    	}
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'horizontal',
		        x : 'center',
		        y : 70,
		        //backgroundColor : 'rgba(0,0,0,0.1)',
		        data:$.map(ageRangeMap, function(val, i){ return val; })
		    },
		    toolbox: {
		        show : false,
		        feature : {
		            dataView : {show : true, readOnly : true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : false,
		    backgroundColor : '#fff',
		    series : []
		},
		
		series : [
	        {
	            name:'성별',
	            type:'pie',
	            center : ['50%', '60%'],
	            selectedMode: 'single',
	            selectedOffset: 5, 
	            radius : [0, '29%'],
	            itemStyle : {
	                normal : {
	                    label : {
	                        position : 'inner'
	                    },
	                    labelLine : {
	                        show : false
	                    }
	                },
	           	 	emphasis: {
	           	        label : {
	           	            show: true
	           	        }
	           	    }
	            },
	            data:[]
	        },
	        {
	            name:'연령대별',
	            type:'pie',
	            center : ['50%', '60%'],
	            selectedOffset: 3, 
	            radius : ['39%', '53%'],
	            itemStyle : {
	                normal : {
	                    labelLine : {
	                        length : 8
	                    }
	                }
	            },
	            data:[]
	        }
		]
		
	}
	
	var paramBySvcData = [];
	
	function parseParamBySvcData(){
		
		var nominalMax = 600;
		var placeHoledMin = nominalMax / 100 * 10;
		
		var data = {};
		
		for(var svc in serviceMap)
			data[svc] = [];
		
		var listVoSum = <spring:eval expression="jsonWriter.writeValueAsString(listVoSum)"/>;
		
		$.each(listVoSum, function(i, item){
			
			var dataIndex = i % 4;
			
			for(var svc in serviceMap)
				data[svc][dataIndex] = item[svc];
			
			if(dataIndex == 3){
				
				var maxValues = [];
				
				for(var svc in data)
					maxValues.push(data[svc].max())
					
				var maxValue = maxValues.max();
				
				for(var svc in data)
					for(var j = 0, end = data[svc].length ; j < end ; j++){
						
						var n = data[svc][j];
						
						data[svc][j] = { value : nominalMax * n / maxValue, actual : n, serviceKey : svc };
						
					}
				
				paramBySvcData[item.lv] = [];
				
				for(var svc in data)
					for(var j = 0 ; j < 2 ; j++)
						paramBySvcData[item.lv].push({
							name : serviceMap[svc],
							type : 'bar',
							stack : item.lv,
							itemStyle : j == 0 ? paramBySvcBarChartConfMap.dataStyle : paramBySvcBarChartConfMap.placeHoledStyle,
							data : j == 0 ? data[svc].slice() : $.map(data[svc], function(_item, _i){ return  { value : nominalMax - _item.value + placeHoledMin, serviceKey : _item.serviceKey };})
						});
				
			}
			
		});
		
	}
	
	var paramBySegData = {
		sex : [],
		age : [],
		done : false
	};
	
	function parseParamBySegData(){
		
		var itemStyle4Sex = {
			'M' : {
				normal : {
					color : GV_GENDER_COLOR.male()
				}
			},
			'F' : {
				normal : {
					color : GV_GENDER_COLOR.female()
				}
			},
			'Z' : {
				normal : {
					color : GV_GENDER_COLOR.unknown()
				}
			}
		}
		
		var data = {}, _data = null;
		
		for(var svc in serviceMap)
			data[svc] = [];
		
		var listVoSumBySex = <spring:eval expression="jsonWriter.writeValueAsString(listVoSumBySex)"/>;
		
		$.each(listVoSumBySex, function(i, item){
			
			var dataIndex = i % 3;
			
			if(dataIndex == 0)
				_data = $.extend(true, {}, data);
			
			for(var svc in serviceMap)
				_data[svc][dataIndex] = {name : sexMap[item['sexCd']], value : item[svc], itemStyle : itemStyle4Sex[item['sexCd']]};
			
			if(dataIndex == 2){
				
				if(paramBySegData.sex[item.lv] == undefined)
					paramBySegData.sex[item.lv] = [];
				
				paramBySegData.sex[item.lv].push(_data);
				
			}
			
		});
		
		var listVoSumByAge = <spring:eval expression="jsonWriter.writeValueAsString(listVoSumByAge)"/>;
		
		$.each(listVoSumByAge, function(i, item){
			
			var dataIndex = i % 7;
		
			if(dataIndex == 0)
				_data = $.extend(true, {}, data);
		
			for(var svc in serviceMap)
				_data[svc][dataIndex] = {name : ageRangeMap[item['ageRngCd']], value : item[svc]};
			
			if(dataIndex == 6){

				if(paramBySegData.age[item.lv] == undefined)
					paramBySegData.age[item.lv] = [];
				
				paramBySegData.age[item.lv].push(_data);

			}
		
		});
		
		paramBySegData.done =  true;
		
	}
	
	<c:choose>
   	<c:when test="${fn:length(listVoSum) > 0}">
   	
	parseParamBySvcData();
	
	
	
	$('button[data-stats-level]').on('click', function(){
		
		var _this = $(this);
		
		if(statsLevel != _this.data('stats-level')){
		
			statsLevel = _this.data('stats-level');

			paramBySvcBarChartConfMap.option.title.text = _this.text() + ' 회원';
			paramBySvcBarChartConfMap.option.series = paramBySvcData[statsLevel];
			
			paramBySvcBarChart.setOption(paramBySvcBarChartConfMap.option);
			
			<c:if test="${ type == 'cross' }">
			if(intersectBySvcData.done)
				drawIntersectBySvcBarChart('syr', 0);
			</c:if>
			
			if(paramBySegData.done)
				drawParamBySegPieChart('syr', 0);
		
		}
		
	});
	
	
	
	function drawParamBySegPieChart(serviceKey, agreementTypeIndex){
			
		paramBySegPieChartConfMap.option.title.text = serviceMap[serviceKey] +' > '+ agreementTypes[agreementTypeIndex];
		//paramBySegPieChartConfMap.option.title.subtext = formatCurrency(param.data);

		paramBySegPieChartConfMap.series[0].data = paramBySegData.sex[statsLevel][agreementTypeIndex][serviceKey];
		paramBySegPieChartConfMap.series[1].data = paramBySegData.age[statsLevel][agreementTypeIndex][serviceKey];
		
		paramBySegPieChart.setOption(paramBySegPieChartConfMap.option);
		paramBySegPieChart.setSeries(paramBySegPieChartConfMap.series);
		
	}
	
	
	
	$(function() {
		
		var charts = [];
		
		charts.push(paramBySvcBarChart = echarts.init($('#paramBySvcBarChart')[0], GV_CHART_THEME));
           
		$('button[data-stats-level=1]').click();
		//툴팁의 enterable 옵션 적용이 제대로 되지 않는 버그에 대한 임시 해결 방안
		statsLevel = null;
		paramBySvcBarChartConfMap.option.tooltip.enterable = true;
		$('button[data-stats-level=1]').click();

		paramBySvcBarChart.on(echarts.config.EVENT.CLICK, function(param){
			
			<c:if test="${ type == 'cross' }">
			if(intersectBySvcData.done)
				drawIntersectBySvcBarChart(param.data.serviceKey, param.dataIndex);
			</c:if>
			if(paramBySegData.done)
				drawParamBySegPieChart(param.data.serviceKey, param.dataIndex);
		
        });
		
		<c:if test="${ type == 'cross' }">
		charts.push(intersectBySvcBarChart = echarts.init($('#intersectBySvcBarChart')[0], GV_CHART_THEME));
		
		setTimeout(function(){
			
			parseIntersectBySvcData();
			drawIntersectBySvcBarChart('syr', 0);
			
		}, 100);
		</c:if>
		
		charts.push(paramBySegPieChart = echarts.init($('#paramBySegPieChart')[0], GV_CHART_THEME));
          
		setTimeout(function(){
			
			parseParamBySegData();
			drawParamBySegPieChart('syr', 0);
			
		}, 100);
		
		resizeChartOnWinResizeHandler.on(charts);
		  
	});
	
	</c:when>
	<c:otherwise>
	$('#paramBySvcBarChart').css({'line-height' : '500px', 'text-align' : 'center'}).html('<strong>데이터가 없습니다.</strong>');
	</c:otherwise>
	</c:choose>

	</script>
	
	</tiles:putAttribute>
	
</tiles:insertDefinition>