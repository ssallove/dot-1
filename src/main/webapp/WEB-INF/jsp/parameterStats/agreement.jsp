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
	unionDescMap.put("02", "Syrup ∪ OCB ∪ T map");
	unionDescMap.put("03", "Syrup ∪ OCB ∪ 11번가");
	unionDescMap.put("04", "Syrup ∪ OCB ∪ T map ∪ 11번가");
	pageContext.setAttribute("unionDescMap" , unionDescMap);
	
	Map<String, String> intersectDescMap = new HashMap<String, String>();
	intersectDescMap.put("01", "Syrup ∩ OCB");
	intersectDescMap.put("02", "Syrup ∩ OCB ∩ T map");
	intersectDescMap.put("03", "Syrup ∩ OCB ∩ 11번가");
	intersectDescMap.put("04", "Syrup ∩ OCB ∩ T map ∩ 11번가");
	pageContext.setAttribute("intersectDescMap" , intersectDescMap);
	
	ObjectMapper jsonMapper = new ObjectMapper();
	pageContext.setAttribute("jsonWriter" , jsonMapper.writer());
		
%><tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="content">
	
		<style>
/* 	 
			.node rect {
			  cursor: move;
			  fill-opacity: .9;
			  shape-rendering: crispEdges;
			}
			 
			.node text {
			  pointer-events: none;
			  text-shadow: 0 1px 0 #fff;
			}
			 
			.link {
			  fill: none;
			  stroke: #000;
			  stroke-opacity: .2;
			}
			 
			.link:hover {
			  stroke-opacity: .5;
			}
		  */
		</style>




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
                <div class="tab_content inTabLy ">
                	<p class="btSpace"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스 조합별 교차 고객 현황</button></p>
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
						
						    <div class="layoutLR"> 
						        <!-- 왼쪽 챠트영역-->
						        <li class="floatL in_pane" style="width:60%;" id="tabChartL">
						        	<%--
						        	<div class="tab_pane2 active" style="width:100%;height:500px;" id="tabChartL"></div>
						        	--%>
								</li>
						        
						        <!--오른쪽  챠트영역-->
						        <li class="floatR in_pane" style="width:39%;" id="tabChartR">
						            <!-- <ul>
						                <li class="floatL in_pane2 wdh100 " >오른쪽 위 챠트 영역</li>
						                <li  class="floatL in_pane2 wdh100 mt10 ">오른쪽 아래 챠트 영역</li>
						            </ul> -->
						        </li>
						    </div>
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
                        	<p class="expTb mt20">※ Active 고객수 -> 앱활동성 3개월, MAU -> 앱활동성 1개월, Active 고객은 OCB, Syrup, T map </p>
                        	<table class="listTB tStriped ">
                            	<colgroup>
                                	<col width="*">
                         			<col width="10%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                                	<col width="12%">
                            	</colgroup>
    							<thead>
        							<tr>
           								<th>&nbsp;</th>
            							<th>&nbsp;</th>
            							<th>TOTAL</th>
            							<th>Syrup</th>
            							<th>OCB</th>
            							<th>OCB(App)</th>
            							<th>T map</th>
            							<th>11번가</th>
            							<th>T store</th>
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
									<td><fmt:formatNumber value="${voList.tma}"/></td>
									<td><fmt:formatNumber value="${voList.evs}"/></td>
									<td><fmt:formatNumber value="${voList.tst}"/></td>
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
				                <h3>합집합 현황 <span  class="floatR expTb">※ T map, 11번가는 현재기준 동의가 없음.</span></h3>
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
				        				
									<c:if test="${listVoUnion.size() == 0}">
										<tr>
											<td colspan="13" class="txtC">데이터가 없습니다.</td>
										</tr>
									</c:if>
				
									<c:forEach items="${listVoUnion}" var="voList" varStatus="status">
										<tr>
											<td class="depth2 txtC"><c:out value="${unionDescMap[voList.crossSvcUnionCd]}" /></td>
											<td class="total"><fmt:formatNumber value="${voList.scbMbrCntTot}"/></td>
											<td><fmt:formatNumber value="${voList.scbMbrCntPush}"/></td>
											<td><fmt:formatNumber value="${voList.scbMbrCntGeo}"/></td>
											<td><fmt:formatNumber value="${voList.scbMbrCntBle}"/></td>
											<td class="total"><fmt:formatNumber value="${voList.actvMbrCntTot}"/></td>
											<td><fmt:formatNumber value="${voList.actvMbrCntPush}"/></td>
											<td><fmt:formatNumber value="${voList.actvMbrCntGeo}"/></td>
											<td><fmt:formatNumber value="${voList.actvMbrCntBle}"/></td>
											<td class="total"><fmt:formatNumber value="${voList.mauCntTot}"/></td>
											<td><fmt:formatNumber value="${voList.mauCntPush}"/></td>
											<td><fmt:formatNumber value="${voList.mauCntGeo}"/></td>
											<td><fmt:formatNumber value="${voList.mauCntBle}"/></td>
										</tr>
									</c:forEach>
				        				
				       					</tbody>
									</table>
									<!--//합집합 현황-->
				                     
									<h3 class="mt80">교집합 현황 <span  class="floatR expTb">※ T map, 11번가는 현재기준 동의가 없음.</span></h3>
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
				        				
				        				
				        				<c:if test="${listVoIntersect.size() == 0}">
											<tr>
												<td colspan="13" class="txtC">데이터가 없습니다.</td>
											</tr>
										</c:if>
				
										<c:forEach items="${listVoIntersect}" var="voList" varStatus="status">
											<tr>
												<td class="depth2 txtC"><c:out value="${intersectDescMap[voList.crossSvcUnionCd]}" /></td>
												<td class="total"><fmt:formatNumber value="${voList.scbMbrCntTot}"/></td>
												<td><fmt:formatNumber value="${voList.scbMbrCntPush}"/></td>
												<td><fmt:formatNumber value="${voList.scbMbrCntGeo}"/></td>
												<td><fmt:formatNumber value="${voList.scbMbrCntBle}"/></td>
												<td class="total"><fmt:formatNumber value="${voList.actvMbrCntTot}"/></td>
												<td><fmt:formatNumber value="${voList.actvMbrCntPush}"/></td>
												<td><fmt:formatNumber value="${voList.actvMbrCntGeo}"/></td>
												<td><fmt:formatNumber value="${voList.actvMbrCntBle}"/></td>
												<td class="total"><fmt:formatNumber value="${voList.mauCntTot}"/></td>
												<td><fmt:formatNumber value="${voList.mauCntPush}"/></td>
												<td><fmt:formatNumber value="${voList.mauCntGeo}"/></td>
												<td><fmt:formatNumber value="${voList.mauCntBle}"/></td>
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
	
	var floatingBarChart = null;
	var nestedPieChart = null;
	
	<c:choose>
	<c:when test="${ type == 'essential' }">
	var serviceMap = {
		'syr' : 'Syrup',
		'ocb' : 'OCB',
		'oct' : 'OCB(App)',
		'tma' : 'T-Map',
		'tst' : 'T-Store',
		'evs' : '11번가'
	}
	</c:when>
	<c:when test="${ type == 'cross' }">
	var serviceMap = {
		'syr' : 'Syrup',
		'ocb' : 'OCB',
		'oct' : 'OCB(App)'
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
	
	var floatingBarChartConfMap = {
	
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
       	        axisPointer : {         
       	            type : 'shadow'     
       	        },
       	        formatter : function(params, ticket, callback){
       	        	
       	        	if(params.seriesIndex % 2 == 0)
       	        		return params.name +'<br/>'+ params.seriesName +' : '+ formatCurrency(params.data.actual);
       	        	else
       	        		return params.name +'<br/>'+ params.seriesName +' : '+ formatCurrency(floatingBarChart.getSeries()[params.seriesIndex - 1].data[params.dataIndex].actual);
       	        	
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
       	        y2 : 30,
       	        x2 : 20
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
	
	var nestedPieChartConfMap = {
			
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
	            radius : [0, '30%'],
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
	            radius : ['40%', '55%'],
	            itemStyle : {
	                normal : {
	                    labelLine : {
	                        length : 10
	                    }
	                }
	            },
	            data:[]
	        }
		]
		
	}
	
	var floatingBarChartData = [];
	
	function parseFloatingBarChartData(){
		
		var nominalMax = 600;
		var placeHoledMin = nominalMax / 100 * 10;
		
		var data = {};
		
		for(var svc in serviceMap)
			data[svc] = [];
		
		var recordMap = null;
		
		<c:forEach items="${listVoSum}" var="voList" varStatus="status">
		
		<c:set var="dataIndex" value="${status.index % 4}"/>
		
		recordMap = <spring:eval expression="jsonWriter.writeValueAsString(voList)"/>;
		
		//data['tot'][dataIdx] = ${voList.tot};
		for(var svc in serviceMap)
			data[svc][${dataIndex}] = recordMap[svc];
			
		<c:if test="${dataIndex == 3}">
		
			var maxValues = [];
		
			for(var svc in data)
				maxValues.push(data[svc].max())
				
			var maxValue = maxValues.max();
			
			for(var svc in data)
				for(var i = 0, end = data[svc].length ; i < end ; i++){
					
					var n = data[svc][i];
					
					data[svc][i] = { value : nominalMax * n / maxValue, actual : n};
					
				}
			
			floatingBarChartData[${voList.lv}] = [];
			
			for(var svc in data)
				for(var i = 0 ; i < 2 ; i++)
					floatingBarChartData[${voList.lv}].push({
						name : serviceMap[svc],
						type : 'bar',
						stack : '${voList.lv}',
						itemStyle : i == 0 ? floatingBarChartConfMap.dataStyle : floatingBarChartConfMap.placeHoledStyle, 
						data : i == 0 ? data[svc].slice() : $.map(data[svc], function(val, i){ return  nominalMax - val.value + placeHoledMin;})
					});
			
		</c:if>
		</c:forEach>
	}
	
	var nestedPieChartData = {
		sex : [],
		age : [],
		done : false
	};
	
	function parseNextedPieChartData(){
		
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
		
		var recordMap = null;
		
		<c:forEach items="${listVoSumBySex}" var="item" varStatus="status">
		<c:set var="dataIndex" value="${status.index % 3}"/>
		
		<c:if test="${dataIndex == 0}">
		{
			
			var data = {};
			
			for(var svc in serviceMap)
				data[serviceMap[svc]] = [];
		</c:if>
		
			recordMap = <spring:eval expression="jsonWriter.writeValueAsString(item)"/>;
		
			//data['tot'][dataIdx] = ${voList.tot};
			for(var svc in serviceMap)
				data[serviceMap[svc]][${dataIndex}] = {name : sexMap[recordMap['sexCd']], value : recordMap[svc], itemStyle : itemStyle4Sex[recordMap['sexCd']]};
		
		<c:if test="${dataIndex == 2}">
			if(nestedPieChartData.sex[${item.lv}] == undefined)
				nestedPieChartData.sex[${item.lv}] = [];
			
			nestedPieChartData.sex[${item.lv}].push(data);
			
		}
		</c:if>
		
		</c:forEach>
		
		<c:forEach items="${listVoSumByAge}" var="item" varStatus="status">
		<c:set var="dataIndex" value="${status.index % 7}"/>
		
		<c:if test="${dataIndex == 0}">
		{
			
			var data = {};
			
			for(var svc in serviceMap)
				data[serviceMap[svc]] = [];
		</c:if>
		
			recordMap = <spring:eval expression="jsonWriter.writeValueAsString(item)"/>;
			
			for(var svc in serviceMap)
				data[serviceMap[svc]][${dataIndex}] = {name : ageRangeMap[recordMap['ageRngCd']], value : recordMap[svc]};
		
		<c:if test="${dataIndex == 6}">
			if(nestedPieChartData.age[${item.lv}] == undefined)
				nestedPieChartData.age[${item.lv}] = [];
			
			nestedPieChartData.age[${item.lv}].push(data);
			
		}
		</c:if>
		
		</c:forEach>
		
		nestedPieChartData.done =  true;
		
	}
	
	<c:choose>
   	<c:when test="${fn:length(listVoSum) > 0}">
   	
	parseFloatingBarChartData();
	
	
	
	$('button[data-stats-level]').on('click', function(){
		
		var _this = $(this);
		
		if(statsLevel != _this.data('stats-level')){
		
			statsLevel = _this.data('stats-level');

			floatingBarChartConfMap.option.title.text = _this.text() + ' 회원';
			floatingBarChartConfMap.option.series = floatingBarChartData[statsLevel];
			
			floatingBarChart.setOption(floatingBarChartConfMap.option);
			
			if(nestedPieChartData.done)
				drawNestedPieChart(serviceMap['syr'], agreementTypes[0], 0);
		
		}
		
	});
	
	
	
	function drawNestedPieChart(serviceName, agreementTypeName, agreementTypeIndex){
			
		nestedPieChartConfMap.option.title.text = serviceName +' > '+ agreementTypeName;
		//nestedPieChartConfMap.option.title.subtext = formatCurrency(param.data);

		nestedPieChartConfMap.series[0].data = nestedPieChartData.sex[statsLevel][agreementTypeIndex][serviceName];
		nestedPieChartConfMap.series[1].data = nestedPieChartData.age[statsLevel][agreementTypeIndex][serviceName];
		
		nestedPieChart.setOption(nestedPieChartConfMap.option);
		nestedPieChart.setSeries(nestedPieChartConfMap.series);
		
	}
	
	
	
	$(function() {
		
		var leftChartDiv = $('#tabChartL');
		
		floatingBarChart = echarts.init(leftChartDiv[0], GV_CHART_THEME);
           
		$('button[data-stats-level=1]').click();

		floatingBarChart.on(echarts.config.EVENT.CLICK, function(param){
			
			if(param.seriesIndex % 2 == 0)
				if(nestedPieChartData.done)
					drawNestedPieChart(param.seriesName, param.name, param.dataIndex);
		
        });
		
		var rightChartDiv = $('#tabChartR');
		
		nestedPieChart = echarts.init(rightChartDiv[0], GV_CHART_THEME);
          
		setTimeout(function(){
			
			parseNextedPieChartData();
			drawNestedPieChart(serviceMap['syr'], agreementTypes[0], 0);
			
		}, 100);
		
		resizeChartOnWinResizeHandler.on(floatingBarChart, nestedPieChart);
		  
	});
	
	</c:when>
	<c:otherwise>
	$('#tabChartL').css({'line-height' : '500px', 'text-align' : 'center'}).html('<strong>데이터가 없습니다.</strong>');
	</c:otherwise>
	</c:choose>

	</script>
	
	</tiles:putAttribute>
	
</tiles:insertDefinition>