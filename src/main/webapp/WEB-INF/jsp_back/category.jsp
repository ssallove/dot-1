<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="stylesheet">
	
		<link href="<c:url value="/resources/nvd3/nv.d3.css"/>"	rel="stylesheet">
		<script type="text/javascript"	src="<c:url value=" /resources/js/adm.common.js "/>"></script>
		<script type="text/javascript"	src="<c:url value=" /resources/js/common.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/d3/d3.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/nvd3/nv.d3.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/dimple/lib/d3.v3.4.8.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
        
	</tiles:putAttribute>
	
	<tiles:putAttribute name="content">
		
		<p class="category3" title="업종 상단 이미지"></p>
            <div class="wrap">
            	<h2>업종별 현황<span class="floatR">데이터 기준일 : ${baseDt} </span></h2>
                <!-- search-->
                <div class="searchLy">
                	<table class="block">
                    	<colgroup>
                        	<col width="80px">
                            <col width="600px">
                            <col width="65px">
                            <col width="">
                        </colgroup>
    					<tbody>
        					<tr>
            					<th >서비스</th>
            					<td> 
                                	<form sty;le="display:inline-block; white-space:nowrap;">
      									<label for="r_total" class="checkB pr30"  >
        									<input type="radio" id="r_total" name="svcCd" value="TOT" checked="checked">TOTAL
      									</label>
      									<label for="r_syr" class="checkB pr30">
        									<input type="radio" id="r_syr" name="svcCd" value="SYR"> Syrup
      									</label>
      									<label for="r_ocb" class="checkB pr30">
        									<input type="radio" id="r_ocb" name="svcCd" value="OCB"> OCB
      									</label>
                                        <label for="r_tma" class="checkB pr30">
        									<input type="radio" id="r_tma" name="svcCd" value="TMA"> T map
      									</label>
                                        <label for="r_evs" class="checkB pr30">
        									<input type="radio" id="r_evs" name="svcCd" value="EVS"> 11번가
      									</label>
                                        <label for="r_tst" class="checkB">
        									<input type="radio" id="r_tst" name="svcCd" value="TST"> T store
      									</label>
    								</form>
                                
                                </td>
            					<th>기간</th>
            					 <td>
                                	<select class="formSelect" name="sel_period" id="sel_period" style="width:100px">
                        				<option value="1M">1개월</option>
							    		<option value="3M" selected="">3개월</option>    	
							    		<option value="6M">6개월</option>
							    	 </select>
                                </td>
                            </tr>
       					</tbody>
					</table>
                    <!--검색 버튼-->
					<p class="bt_search"><button name="btnSearch" id="btnSearch" type="button">Search</button></p>
                    <!--//검색 버튼-->
                </div>
                <!-- //search-->
                
                <!--검색 조건-->
                <div class="viewSrc">
                	<ul>
                    	<li class="title ">검색 조건</li>
                        <li>서비스 : <span>${svcNm}</span></li>
                        <li>기간 : <span>${periodClNm}</span></li>
                      
                    </ul>
                </div>
                <!--//검색 조건-->
                
                <h3 class="mt50">업종별 모수</h3>
                <div class="chartLy">

                    <!--챠트 1개 보일 경우-->
                	<ul class="chartLy_1p">
                		<li>
                    		<p class="chartTitle">업종별 모수</p>
                        	<div class="chartArea2" id="chartContainer"></div>
                    	</li>
                	</ul>
                    <!--//챠트 1개 보일 경우-->
                </div>

            </div>
		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
		
			console.log(" > ${baseDt}");
		
			getBubbleChart2();
			
			function getBubbleChart2() {

			    var svg = dimple.newSvg("#chartContainer", 590, 500);
			    
				var data = [];
				var xOrderByData = [];
				var tooltipArrData = [];
				
				<c:forEach items="${list2}" var="voList" varStatus="status">
				
					data.push(
						{						
				    		"모수" : "${voList.mbrCnt}",	
							"대분류" : "${voList.lCtgNm}",
							"중분류" : "${voList.cnctCtgNm}"
						}   
					);
					
					tooltipArrData["${voList.mbrCnt},${voList.lCtgNm}"] = "${voList.cnctCtgNm}";
					
				</c:forEach>

				<c:forEach items="${list1}" var="voList" varStatus="status">
				
					xOrderByData.push ( "${voList.cdNm}");
					
				</c:forEach>
				
			    // The main chart
			    var myChart = new dimple.chart(svg, data);
			    
			    // The chart to show in a tooltip
			    var tipChart = null;
			    // The other popup shapes
			    var popup = null;

			    // Position the main chart
			    myChart.setBounds(60, 40, "95%", 400);

			    // Add the main chart axes
			    var x = myChart.addCategoryAxis("x", "대분류");
			    myChart.addMeasureAxis("y", "모수");
			    myChart.addMeasureAxis("z", "모수");
			    myChart.addMeasureAxis("p", "중분류");
			    
			    x.addOrderRule(xOrderByData);

			    // Draw bubbles by SKU colored by brand
			    var s = myChart.addSeries([
			        "모수", "대분류"
			    ], dimple.plot.bubble);

			    // Handle the hover event - overriding the default behaviour
			    s.addEventHandler("mouseover", onHover);
			    // Handle the leave event - overriding the default behaviour
			    s.addEventHandler("mouseleave", onLeave);

			    // Draw the main chart
			    myChart.draw();

			    // Event to handle mouse enter
			    function onHover(e) {
			    	
			        // Get the properties of the selected shape
			        var cx = parseFloat(e.selectedShape.attr("cx")),
			            cy = parseFloat(e.selectedShape.attr("cy")),
			            r = parseFloat(e.selectedShape.attr("r")),
			            fill = e.selectedShape.attr("fill"),
			            stroke = e.selectedShape.attr("stroke");

			        // Set the size and position of the popup
			        var width = 180,
			            height = 23,
			            x = (cx + r + width + 10 < svg.attr("width")
			                ? cx + r + 10
			                : cx - r - width - 20);
			            y = (cy - height / 2 < 0
			                ? 15
			                : cy - height / 2);
			        
			        // Fade the popup fill mixing the shape fill with 80% white
			        var popupFillColor = d3.rgb(d3.rgb(fill).r + 0.8 * (255 - d3.rgb(fill).r), d3.rgb(fill).g + 0.8 * (255 - d3.rgb(fill).g), d3.rgb(fill).b + 0.8 * (255 - d3.rgb(fill).b));
			        
			        // Create a group for the popup objects
			        popup = svg.append("g");
			        
			        // Add a rectangle surrounding the chart
			        popup.append("rect").attr("x", x + 5).attr("y", y - 5).attr("width", width).attr("height", height).attr("rx", 5).attr("ry", 5).style("fill", popupFillColor).style("stroke", stroke).style("stroke-width", 2);
			        
			        // Add the series value text
			        popup.append("text").attr("x", x + 10).attr("y", y + 10).text(tooltipArrData[e.yValue+","+e.xValue] + " : " + comma(e.yValue)).style("font-family", "sans-serif").style("font-size", 10).style("fill", stroke);

			    };

			    // Event to handle mouse exit
			    function onLeave(e) {
			        // Remove the popup
			        if (popup !== null) {
			            popup.remove();
			        }
			    };

			}
		
			//콤마찍기
            function comma(str) {
				
                str = String(str);
                
                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
                
            }
			
			
			
			function initUiData(){
				
				var svcCd = "${svcCd}";
				var periodClCd = "${periodClCd}";
				
				if (svcCd == "TOT") {
					$("#r_total").attr("checked", "checked");
				} else if (svcCd == "SYR") {
					$("#r_syr").attr("checked", "checked");
				} else if (svcCd == "OCB") {
					$("#r_ocb").attr("checked", "checked");
				} else if (svcCd == "TMA") {
					$("#r_tma").attr("checked", "checked");
				} else if (svcCd == "EVS") {
					$("#r_evs").attr("checked", "checked");
				} else if (svcCd == "TST") {
					$("#r_tst").attr("checked", "checked");
				}
				
				$("#sel_period").val(periodClCd);
			}
			  
			  
			  
			$(document).ready(function () {

			    initUiData();

			    $("#btnSearch").click(function () {
			    	
		            var svcCd = $("input[name='svcCd']:checked").val();
		            var periodClCd = $("#sel_period option:selected").val();
		            
			        var param = "?svcCd=" + svcCd;
			        param += "&periodClCd=" + periodClCd;
			        location.href = "category.do" + param;

			    });
			});
			  
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>