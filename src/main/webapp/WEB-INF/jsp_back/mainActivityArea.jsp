<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="stylesheet">
    
        <link href="<c:url value="/resources/nvd3/nv.d3.css"/>"	rel="stylesheet">
        <script type="text/javascript" src="<c:url value=" /resources/js/adm.common.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/js/common.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/d3/d3.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/nvd3/nv.d3.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/lib/d3.v3.4.8.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
        
    </tiles:putAttribute>
    
    <tiles:putAttribute name="content">
    
	    <p class="activityA" title="주 활동지역 상단 이미지"></p>
	    <div class="wrap">
        	<h2>주 활동지역<span class="floatR">데이터 기준일 : ${baseDt}</span></h2>
        	<!-- search-->
            <div class="searchLy">
            	<table >
                	<colgroup>
                        <col width="60px">
                        <col width="*">
                    </colgroup>
					<tbody>
    					<tr>
    					    <th>지역</th>
    					    <td ><span class="pr7">시 :</span> 
    					    <select class="formSelect"  style="width:25%" name="size" id="sel_si" title="시선택">
                                   	<c:forEach items="${admList1}" var="voList" varStatus="status">
                                    	<c:choose>
										    <c:when test= "${voList.admDongCd == siCd}">
										        <option value="${voList.admDongCd}" selected>${voList.sido}</option>
										    </c:when>
										    <c:otherwise>
										        <option value="${voList.admDongCd}">${voList.sido}</option>
										    </c:otherwise>
										</c:choose>
                                    </c:forEach>
                                </select>
                            
                                <span class="pr7 pl15">구 :</span> 
                                <select class="formSelect"  style="width:25%"  name="size" id="sel_gu" title="구선택">
                                   	<c:forEach items="${admList2}" var="voList" varStatus="status">
                                   		<c:choose>
	                                    	<c:when test= "${voList.admDongCd == guCd}">
											    <option value="${voList.admDongCd}" selected>${voList.sigungu}</option>
											</c:when>
										    <c:otherwise>
										        <option value="${voList.admDongCd}">${voList.sigungu}</option>
										    </c:otherwise>
									    </c:choose>
                                    </c:forEach>
                                </select>
                             
                                <span class="pr7 pl15">동 :</span> 
                                <select class="formSelect" style="width:25%" name="size" id="sel_dong" title="동선택">
	                                 <c:forEach items="${admList3}" var="voList" varStatus="status">
	                                 	<c:choose>
	                                  		<c:when test= "${voList.admDongCd == dongCd}">
									    		<option value="${voList.admDongCd}" selected>${voList.admDong}</option>
											</c:when>
								   			<c:otherwise>
								        		<option value="${voList.admDongCd}">${voList.admDong}</option>
								   		 	</c:otherwise>
							   			</c:choose>
	                                 </c:forEach>
                                 </select>
                            </td>
					    </tr>
   					</tbody>
				</table>
                <!--검색 버튼-->
					<p class="bt_search"><button name="btnSearch" id="btnSearch" type="button">Search</button></p>
                <!--//검색 버튼-->
            </div>
            
            <!--검색 조건-->
            <div class="viewSrc">
            	<ul>
                	<li class="title ">검색 조건</li>
                    <li>시 : <span>${siTx}</span></li>
                    <li>구 : <span>${guTx }</span></li>
                    <li>동 : <span>${dongTx }</span></li>
                  
                </ul>
            </div>
             <!--//검색 조건-->
             
             <div class="layoutLR">

               	<div class="LF">
               		<h3 class="mt50">지역별 모수 현황 차트</h3>
               		<div id="chartContainer"></div>
               	</div>

               	<div class="RG">
               		<!--지역별 모수 현황--> 
		            <h3 class="mt50">지역별 모수 현황</h3>
		            <table class="listTable  tHover">
		                <colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
		    				<tr>
		        				<th>선택 지역</th>
		        				<th>현황 지역</th>
		        				<th>모수</th>
		        				<th>PUSH 동의</th>
		       				</tr>
						</thead>
						
						<tbody>
		                
		                <c:if test="${list7.size() == 0}">
		            		<tr>
		             			<td colspan="4" class="txtC">데이터가 없습니다.</td>
		            		</tr>
		            	</c:if>
		                
		                <c:forEach items="${list7}" var="voList" varStatus="status">
			                 <tr>
			                <c:choose>
							    <c:when test= "${status.count == 1}">
							    	<c:set var="mainAcvtDongNm" value="${voList.mainAcvtDongNm}" />
							        <td  class="depth2 txtC gubun depthT"> ${voList.mainAcvtDongNm}</td>
							    </c:when>
							    <c:otherwise>
							        <td  class="depth2 txtC gubun"><c:out value="${mainAcvtDongNm}" /></td>
							    </c:otherwise>
							</c:choose>
							
							<c:choose>
							    <c:when test= "${status.count == 1}">
							        <td class="txtC depthT">${voList.mainAcvtDongNm}</td>
				                    <td class="depthT">${voList.totalTooltip}</td>
				                    <td class="depthT">${voList.rightTooltip}</td>
							    </c:when>
							    <c:otherwise>
							         <td class="txtC">${voList.mainAcvtDongNm}</td>
				                     <td>${voList.totalTooltip}</td>
				                     <td>${voList.rightTooltip}</td>
							    </c:otherwise>
							</c:choose>
							
			                
			                 </tr>
		                </c:forEach>
		                </tbody>
		            </table>
		            <!--// 지역별 모수 현황-->
               	</div>
               	
            </div>
           
           <div id="bwrap"> 
            <!--성연령대별 현황 챠트-->
            <h3 class="mt50 clear">성연령대별 현황</h3> 
            <div class="chartLy">
            	<!--챠트 3개 보일 경우-->
            	<ul class="chartLy_3p">
            		<li>
                		<p class="chartTitle">성별 현황</p>
                    	<div class="chartArea" id="chart1"></div>
                	</li>
                	<li>
                		<p class="chartTitle">연령대 현황 </p>
                    	<div class="chartArea" id="chart2"></div>
                	</li>
                	<li>
                		<p class="chartTitle">성연령대 현황</p>
                    	<div class="chartArea" id="chart3"></div>
                	</li>
            	</ul>
                <!--//챠트 3개 보일 경우-->
            </div>
            
             <div class="layoutLR">
                	<!--업종 순위-->
                	<div class="LF">
                		<h3 class="mt50">업종 순위</h3>
                			<table class="listTable  tHover"> 
                				<colgroup>
                    				<col width="100px">
                        			<col width="*">
                				</colgroup>
    							<thead>
        							<tr>
            							<th>순위</th>
            							<th>업종(소분류)</th>
           							</tr>
                    			</thead>
                    			<tbody>
        						<c:if test="${list2.size() == 0}">
				               		<tr>
				                		<td colspan="2" class="txtC">데이터가 없습니다.</td>
				               		</tr>
				               	</c:if>
				                	
				                <c:forEach items="${list2}" var="voList" varStatus="status">
				                	 <tr>
				                     <td class="depth2 txtC"><c:out value="${voList.seq}" /></td>
					                 <td class="txtL"><c:out value="${voList.ctgNm}" /></td>
				                	 </tr>
				                </c:forEach>
       							</tbody>
							</table>
						</div>
                        <!--//업종순위-->
                
               			<!--함께방문하는지역-->
                    <div class="RG">
                       	<h3 class="mt50">함께 방문하는 지역</h3>
               			<table class="listTable  tHover"> 
               				<colgroup>
                   				<col width="100px">
                       			<col width="*">
               				</colgroup>
   							<thead>
       							<tr>
           							<th>순위</th>
           							<th>지역(동단위)</th>
       							</tr>
                   			</thead>
                   			<tbody>
				                <c:if test="${list3.size() == 0}">
				               		<tr>
				                		<td colspan="2" class="txtC">데이터가 없습니다.</td>
				               		</tr>
				               	</c:if>
				               	
				                <c:forEach items="${list3}" var="voList" varStatus="status">
				                 <tr>
				                     <td class="depth2 txtC"><c:out value="${voList.seq}" /></td>
					                 <td class="txtL"><c:out value="${voList.admDong}" /></td>
				                 </tr>
				                </c:forEach>
   							</tbody>
						</table>
                        </div>
                        <!--//함께방문하는지역-->
                	</div>
                	
                </div>
        </div>
        
        </tiles:putAttribute>
        
        <tiles:putAttribute name="javascript.footer">
        
        
            <script type="text/javascript">
            
            	// 지역별 모수 현황 높이 
            	var tableHeight = $(".listTable").height();
            	
            	
            	
	          	//콤마찍기
	            function comma(str) {
	                str = String(str);
	                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	            }
	          
	          	
	          	
	          	//콤마풀기
	            function uncomma(str) {
	                str = String(str);
	                return str.replace(/[^\d]+/g, '');
	            }
	          
	          	
	          	
	            dimpleBar1();
	            
				function dimpleBar1() {

					var w = 480;
					var svg = dimple.newSvg("#chartContainer", 590, tableHeight+70);
					var data = [];
					var guNameArr = [];
					var tooltipArr = [];
					var totalTooltipData = [];
					var totTooltipDataArr = [];
					
					<c:forEach items="${list7}" var="voList" varStatus="status">
					
						if ("${status.index}" > 0) {
							
							  data.push(
						            {"현황지역":"${voList.mainAcvtDongNm}","모수":"${voList.hBarLeft}","Channel":"모수-PUSH", "toolTip":"${voList.hBarTotal}"},
						            {"현황지역":"${voList.mainAcvtDongNm}","모수":"${voList.hBarRight}","Channel":"PUSH", "toolTip":"${voList.hBarTotal}"}
						       );
							  
						      guNameArr.push("${voList.mainAcvtDongNm}");
						      
						      tooltipArr["${voList.mainAcvtDongNm}"] = "전체:" + "${voList.totalTooltip}" + "    PUSH동의:" + "${voList.rightTooltip}";
						      
						      totalTooltipData.push("${voList.totalTooltip}");
						      
						      totTooltipDataArr["${voList.mainAcvtDongNm}${voList.hBarLeft}"] = "${voList.totalTooltip}";
						      
						}

	                </c:forEach>
	                
				    var myChart = new dimple.chart(svg, data);
				    
				    myChart.setBounds(75, 30, w, tableHeight)
				    
				    svg.select("#chartContainer svg g").attr("transform", "translate(10,-10)");
				    
				    var x = myChart.addMeasureAxis("x", "모수");
				    var y = myChart.addCategoryAxis("y", "현황지역");
				    
				    x.showGridlines = false;
				    
				    //x.tickFormat = ',.f';  
				    
				    y.addOrderRule(guNameArr, "DESC");
				    
				    //myChart.noFormats = true;
				    
				    var mySeries = myChart.addSeries("Channel", dimple.plot.bar);
				    
				    mySeries.barGap = 0.4;
				    
				    mySeries.lineMarkers = false;
				    
				    mySeries.addOrderRule("Channel");
				    
				    mySeries.afterDraw = function (shape, data) {
				    	
				    	if( data.key.indexOf('PUSH') != 0 ) {
				    		
				    		// Get the shape as a d3 selection
					        var s = d3.select(shape),
					          rect = {
					            x: parseFloat(s.attr("x")),
					            y: parseFloat(s.attr("y")),
					            width: parseFloat(s.attr("width")),
					            height: parseFloat(s.attr("height"))
					          };
				    		
					        // Only label bars where the text can fit
					        if (rect.height >= 8) {
					          // Add a text label for the value
					          svg.append("text")
					            // Position in the centre of the shape (vertical position is
					            // manually set due to cross-browser problems with baseline)
					            .attr("x", rect.x + rect.width + 20)
					            .attr("y", rect.y + rect.height / 2 - 5)
					            // Centre align
					            /* .style("text-anchor", "middle")
					            .style("font-size", "10px")
					            .style("font-family", "sans-serif")
					            // Make it a little transparent to tone down the black
					            .style("opacity", 0.6) */
					            // Format the number
					            .text(totTooltipDataArr[data.cy+data.xValue]);
					          
					        }
					        
				    	}
				        
				      };
				      
				    myLegend = myChart.addLegend(100, tableHeight + 60, 510, 100, "right");
				    
				    myChart.customClassList = {
			            axisLine: 'line',
			            barSeries: 'box',
			            axisLabel: 'writing',
			            axisTitle: 'writing',
			            colorClasses: [
			              'hatch-1',
			              'hatch-2',
			              'hatch-3'
			            ]
			        };
				    
				    mySeries.getTooltipText = function (e) {
				    
				    	return [tooltipArr[e.cy]];
				        
				    };
				    
				    myChart.draw();
				    
				    myLegend.shapes.selectAll(".hatch-1").style("fill", "#7f6ec7").style("stroke", "#7f6ec7");
					myLegend.shapes.selectAll(".hatch-2").style("fill", "#f3c536").style("stroke", "#f3c536");
				    
				}
				
				
				
				dimpleBarChart2();
				
				function dimpleBarChart2() {
					
					 var svg = dimple.newSvg("#chart1", "80%", "400");
					 
					 var data = [];
					 
					 <c:forEach items= "${ageBarListM1}" var ="item1" varStatus="status">
		   	  			data.push({성별: "${item1.sexCd}", 비율: Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
		    	  	 </c:forEach>
		    	  		   
		         	 <c:forEach items= "${ageBarListF1}" var ="item1" varStatus="status">
		   	  		 	data.push({성별: "${item1.sexCd}", 비율: Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
      	  		     </c:forEach>
					
					 var myChart = new dimple.chart(svg, data);
					 
					 myChart.setBounds(60, 30, "70%", "300");
				     
					 myChart.addCategoryAxis("x", ["성별","지역"]);
				     
					 myChart.addMeasureAxis("y", "비율");
				     
					 var s = myChart.addSeries("지역", dimple.plot.bar); // legend 순서.
					 
					 s.addOrderRule("지역", "DESC");
				     
					 var myLegend = myChart.addLegend(65, 10, 510, 20, "left");
					 
					 myChart.customClassList = {
					            axisLine: 'line',
					            barSeries: 'box',
					            axisLabel: 'writing',
					            axisTitle: 'writing',
					            colorClasses: [
					              'hatch-1',
					              'hatch-2',
					              'hatch-3'
					            ]
					        };
				     
					 myChart.draw();
					 
					 myLegend.shapes.selectAll(".hatch-1").style("fill", "#7f6ec7").style("stroke", "#7f6ec7");
					 myLegend.shapes.selectAll(".hatch-2").style("fill", "#f3c536").style("stroke", "#f3c536");
				      
				}
				
				
				
				dimpleBarChart3();
				
				function dimpleBarChart3() {
					
					var svg = dimple.newSvg("#chart2", "80%", "400");
					 
					var data = [];
					
					<c:forEach items= "${ageBarListM2}" var ="item1" varStatus="status">
						data.push({연령: "${item1.ageRngNm}", 비율:  Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
	      	  	  	</c:forEach>
	      	  	   
	           	   	<c:forEach items= "${ageBarListF2}" var ="item1" varStatus="status">
	           			data.push({연령: "${item1.ageRngNm}", 비율:  Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
	      	  	   	</c:forEach>
	      	  	   	
	      	  		var myChart = new dimple.chart(svg, data);
			      
					myChart.setBounds(60, 30, "70%", "300");
			     
				 	myChart.addCategoryAxis("x", ["연령","지역"]);
			     
				 	myChart.addMeasureAxis("y", "비율");
			     
				 	var s = myChart.addSeries("지역", dimple.plot.bar);
				 	
				 	s.addOrderRule("지역", "DESC");
			     
				 	var myLegend = myChart.addLegend(65, 10, 510, 20, "left");
				 	
				 	myChart.customClassList = {
				            axisLine: 'line',
				            barSeries: 'box',
				            axisLabel: 'writing',
				            axisTitle: 'writing',
				            colorClasses: [
				              'hatch-1',
				              'hatch-2',
				              'hatch-3'
				            ]
				        };
			     
				 	myChart.draw();
				 	
				 	myLegend.shapes.selectAll(".hatch-1").style("fill", "#7f6ec7").style("stroke", "#7f6ec7");
					myLegend.shapes.selectAll(".hatch-2").style("fill", "#f3c536").style("stroke", "#f3c536");
					
				}
				
				
				
				dimpleBarChart4();
				
				function dimpleBarChart4() {
					
					var svg = dimple.newSvg("#chart3", "80%", "400");
					 
					var data = [];
					
					<c:forEach items= "${ageBarListM3}" var ="item1" varStatus="status">
						data.push({연령: "${item1.ageRngNm}", 비율:  Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
	      	  	  	</c:forEach>
	      	  	   
	           	   	<c:forEach items= "${ageBarListF3}" var ="item1" varStatus="status">
	           			data.push({연령: "${item1.ageRngNm}", 비율:  Number("${item1.totMbrCnt}"), 지역:"${item1.admDongNm}" });
	      	  	   	</c:forEach>
	      	  	   	
	      	  		var myChart = new dimple.chart(svg, data);
			      
					myChart.setBounds(60, 30, "70%", "300");
			     
				 	myChart.addCategoryAxis("x", ["연령","지역"]);
			     
				 	myChart.addMeasureAxis("y", "비율");
			     
				 	var s = myChart.addSeries("지역", dimple.plot.bar);
				 	
				 	s.addOrderRule("지역", "DESC");
			     
				 	var myLegend = myChart.addLegend(65, 10, 510, 20, "left");
				 	
				 	myChart.customClassList = {
				            axisLine: 'line',
				            barSeries: 'box',
				            axisLabel: 'writing',
				            axisTitle: 'writing',
				            colorClasses: [
				              'hatch-1',
				              'hatch-2',
				              'hatch-3'
				            ]
				        };
			     
				 	myChart.draw();
				 	
				 	myLegend.shapes.selectAll(".hatch-1").style("fill", "#7f6ec7").style("stroke", "#7f6ec7");
					myLegend.shapes.selectAll(".hatch-2").style("fill", "#f3c536").style("stroke", "#f3c536");
					
				}
            
				
				
            	function initUiData() {
            		
					$('#sub_area').addClass("active");
					
					var siName = $( "#sel_si option:selected").text();
					
					if ("전체" == siName) {
						
					  	$("#bwrap").hide();
					  	
					} else {
					
					  	$("#bwrap").show();
					
					}
                	
                	if($("#sel_si").val() == "00"){
                		$( "#sel_gu" ).attr("disabled", "disabled");
                	}  else{
                		$( "#sel_gu" ).removeAttr("disabled");
                	}
                	
                	if($("#sel_gu").val() == "00000"){
                		$( "#sel_dong" ).attr("disabled", "disabled");
                	}  else{
                		$( "#sel_dong" ).removeAttr("disabled");
                	}
		  	  	    
		  	  		tableRowSum();

            	}
            	
            	
            	
            	function tableRowSum(){
            		
            		$(".gubun").each(function () {
            			
                        var rows = $(".gubun:contains('"+$(this).text()+"')");
                        
                        if (rows.length > 1) {
                        	
                            rows.eq(0).attr("rowspan", rows.length);
                            rows.not(":eq(0)").remove();
                            
                        }
                        
                    });
            		
            	}
            
            	
            	
                $ (document).ready(function () {
                	
                	initUiData();
                	
                	
                	
                	$ ("#btnSearch").click(function(){
                		
                		var admDongCd = "";
                		var siCd = $( "#sel_si option:selected").val();
                		var guCd = $( "#sel_gu option:selected").val();
                		var dongCd = $( "#sel_dong option:selected").val();
                		var siTx = $( "#sel_si option:selected").text();
                		var guTx = $( "#sel_gu option:selected").text();
                		var dongTx = $( "#sel_dong option:selected").text();
                		
                		var param = "?admDongCd=" + admDongCd;
                		param += "&siCd="+ siCd;
                		param += "&guCd="+ guCd;
                		param += "&dongCd="+ dongCd;
                		param += "&siTx="+ siTx;
                		param += "&guTx="+ guTx;
                		param += "&dongTx="+ dongTx;
                		location.href="main_activity_area.do" + param;
                		
                	});
                	
                	
                	
                	$( "#sel_si" ).change(function() {
                		
                		var com_cd = $(this).val();
						var properties_gb = "L";
						
						$("#sel_gu").val("00000");
						$("#sel_dong").val("00000000");
						
						if($( "#sel_si" ).val() == "00"){
							
							$( "#sel_gu" ).attr("disabled", "disabled");
	                		$( "#sel_dong" ).attr("disabled", "disabled");
	                		
	                	}  else{
	                		
	                		$( "#sel_gu" ).removeAttr("disabled");
	                		$( "#sel_dong" ).removeAttr("disabled");
	                		
	                	}
						
                		$.ajax({
                			beforeSend:function(){},
        			        url: "/admList.do",
        			        type: "POST",
        			        dataType: "json",
        			        data: {"com_cd":com_cd, "properties_gb":properties_gb},
        			        success: function (data) {
        			        	// 중분류 다시 쓰기
        			        	$("#sel_gu").find("option").remove().end();
        			        	
        			        	for(i=0; i<data.admList.length; i++) {
        			        		$("#sel_gu").append("<option value="+data.admList[i].admDongCd+">" + data.admList[i].sigungu + "</option>");
        			        	}
        			        	
        			         	if ($("#sel_gu").val() == "00000") {
        	                		$( "#sel_dong" ).attr("disabled", "disabled");
        	                	} else {
        	                		$( "#sel_dong" ).removeAttr("disabled");
        	                	} 
        			         	
        			        }
        			    });
               		});

                	
                	
                	$( "#sel_gu" ).change(function() {
                		
                		var com_cd = $(this).val();
						var properties_gb = "M";
						
						if ($(this).val() == "00000") {
	                		$( "#sel_dong" ).attr("disabled", "disabled");
	                	} else {
	                		$( "#sel_dong" ).removeAttr("disabled");
	                	}
						
                		$.ajax({
                			
        			        url: "/admList.do",
        			        type: "POST",
        			        dataType: "json",
        			        data: {"com_cd":com_cd, "properties_gb":properties_gb},
        			        success: function (data) {
        			        	// 중분류 다시 쓰기
        			        	$("#sel_dong").find("option").remove().end();
        			        	
        			        	for(i=0; i<data.admList.length; i++){
        			        		$("#sel_dong").append("<option value="+data.admList[i].admDongCd+">" + data.admList[i].admDong + "</option>");
        			        	}
        			        	
        			        }
        			    });
               		});
                });
                
            </script>
            
        </tiles:putAttribute>
    </tiles:insertDefinition>