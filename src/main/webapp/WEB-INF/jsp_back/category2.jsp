<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="stylesheet">
	
		<link href="<c:url value="/resources/nvd3/nv.d3.css"/>"	rel="stylesheet">
		<script type="text/javascript"	src="<c:url value=" /resources/js/adm.common.js "/>"></script>
		<script type="text/javascript"	src="<c:url value=" /resources/js/common.js "/>"></script>
		<script type="text/javascript"	src="<c:url value=" /resources/d3/d3.min.js "/>"></script>
		<script type="text/javascript"	src="<c:url value=" /resources/nvd3/nv.d3.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/d3/radarChart.js "/>"></script>
		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="content">
		
		<p class="category" title="업종 상단 이미지"></p>
		<div class="wrap">
			<h2>
				서비스별 모수 현황<span class="floatR">데이터 기준일 : ${baseDt}</span>
			</h2>
			<!-- search-->
			<div class="searchLy">
				<table>
					<colgroup>
						<col width="80px">
						<col width="200px">
						<col width="80px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>기간</th>
							<td><select class="formSelect" name="sel_period"
								id="sel_period" style="width:150px">
									<c:choose>
										<c:when test="${periodClCd == '1M'}">
											<option value="1M" selected>1개월</option>
										</c:when>
										<c:otherwise>
											<option value="1M">1개월</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${periodClCd == '3M'}">
											<option value="3M" selected>3개월</option>
										</c:when>
										<c:otherwise>
											<option value="3M">3개월</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${periodClCd == '6M'}">
											<option value="6M" selected>6개월</option>
										</c:when>
										<c:otherwise>
											<option value="6M">6개월</option>
										</c:otherwise>
									</c:choose>
							</select></td>
							<th>분류</th>
							<td><select class="formSelect" name="sel_cate_large"
								id="sel_cate_large" style="width:30%">
									<c:forEach items="${cateList1}" var="voList" varStatus="status">
										<c:choose>
											<c:when test="${voList.comCd == largeCd}">
												<option value="${voList.comCd}" selected>${voList.cdNm}</option>
											</c:when>
											<c:otherwise>
												<option value="${voList.comCd}">${voList.cdNm}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select> <select class="formSelect" name="sel_cate_mid"
								id="sel_cate_mid" style="width:30%">
									<c:forEach items="${cateList2}" var="voList" varStatus="status">
										<c:choose>
											<c:when test="${voList.comCd == midCd}">
												<option value="${voList.comCd}" selected>${voList.cdNm}</option>
											</c:when>
											<c:otherwise>
												<option value="${voList.comCd}">${voList.cdNm}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select> <select class="formSelect" name="sel_cate_small"
								id="sel_cate_small" style="width:30%">
									<c:forEach items="${cateList3}" var="voList" varStatus="status">
										<c:choose>
											<c:when test="${voList.comCd == smallCd}">
												<option value="${voList.comCd}" selected>${voList.cdNm}</option>
											</c:when>
											<c:otherwise>
												<option value="${voList.comCd}">${voList.cdNm}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
						</tr>
					</tbody>
				</table>
				<!--검색 버튼-->
				<p class="bt_search">
					<button name="btnSearch" id="btnSearch" type="button">Search</button>
				</p>
				<!--//검색 버튼-->
			</div>
			<!-- //search-->

			<!--검색 조건-->
			<div class="viewSrc">
				<ul>
					<li class="title ">검색 조건</li>
					<li>기간 : <span>${periodTx }</span></li>
					<li>분류 : <span>${largeTx} > ${midTx } > ${smallTx }</span></li>

				</ul>
			</div>
			<!--//검색 조건-->
			
			<h3 class="mt50">서비스별 모수 현황 report</h3> 
				 <!--성연령대별 현황 챠트-->
					<div class="chartLy mb20">
					 <!--챠트 2개 보일 경우-->
			           	<ul class="chartLy_4p">
			           		<li>
			               		<p class="chartTitle">전체</p>
			                   	<div class="chartArea" id="chart5" val="5"  style="height:200px !important" ><svg></svg></div>
			               	</li>
			               	<li>
			               		<p class="chartTitle">PUSH 동의</p>
			                   	<div class="chartArea" id="chart6" val="6"  style="height:200px !important" ><svg></svg></div>
			               	</li>
			           		<li>
			               		<p class="chartTitle">위치 동의</p>
			                   	<div class="chartArea" id="chart7" style="height:200px !important"><svg></svg></div>
			               	</li>
			               	<li>
			               		<p class="chartTitle">BLE 동의 </p>
			                   	<div class="chartArea" id="chart8" style="height:200px !important"><svg></svg></div>
			               	</li>
			           	</ul>
		           	</div>
	            <!--//챠트 2개 보일 경우-->
                <table class="listTable tStriped tHover clear">
					<colgroup>
    					<col width="*">
    					<col width="10%">
    					<col width="13%">
    					<col width="13%">
    					<col width="13%">
    					<col width="13%">
    					<col width="13%">
    					<col width="13%">
    				</colgroup>
    				<thead>
        				<tr>
            				<th>&nbsp;</th>
            				<th>&nbsp;</th>
            				<th>통합</th>
            				<th>Syrup</th>
            				<th>OCB</th>
            				<th>T map</th>
            				<th>11번가</th>
            				<th>T store</th>
        				</tr>
    				</thead>
    				<tbody>
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="8" class="txtC">데이터가 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach items="${list}" var="voList" varStatus="status">
						<tr>
							<c:if test="${voList.funcAgrClCd == '99'}">
								<c:if test="${status.count == 1}">
									<td rowspan="2" class="depth1 txtC"">전체</td>
								</c:if>

								<c:if test="${voList.lv == 1}">
									<td class="depth2 txtL">모수</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>

								<c:if test="${voList.lv == 2}">
									<td class="depth2 txtL">모수기여도(%)</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>
							</c:if>
							<c:if test="${voList.funcAgrClCd == '03'}">
								<c:if test="${status.count == 3}">
									<td rowspan="2" class="depth1 txtC"">PUSH 동의</td>
								</c:if>

								<c:if test="${voList.lv == 1}">
									<td class="depth2 txtL">모수</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>

								<c:if test="${voList.lv == 2}">
									<td class="depth2 txtL">모수기여도(%)</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>
							</c:if>
							<c:if test="${voList.funcAgrClCd == '02'}">
								<c:if test="${status.count == 5}">
									<td rowspan="2" class="depth1 txtC"">위치 동의</td>
								</c:if>

								<c:if test="${voList.lv == 1}">
									<td class="depth2 txtL">모수</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>

								<c:if test="${voList.lv == 2}">
									<td class="depth2 txtL">모수기여도(%)</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>
							</c:if>
							<c:if test="${voList.funcAgrClCd == '01'}">
								<c:if test="${status.count == 7}">
									<td rowspan="2" class="depth1 txtC"">BLE 동의</td>
								</c:if>

								<c:if test="${voList.lv == 1}">
									<td class="depth2 txtL">모수</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>

								<c:if test="${voList.lv == 2}">
									<td class="depth2 txtL">모수기여도(%)</td>
									<td class="total">${voList.tot}</td>
									<td>${voList.syr}</td>
									<td>${voList.ocb}</td>
									<td>${voList.tma}</td>
									<td>${voList.evs}</td>
									<td>${voList.tst}</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
						
		</div>
		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
		
			  function initUiData(){
				  
				  $('#sub_category_2').addClass("active");
				    var chk_all_flag = $("#chk_all").attr("checked");
				    var sel_cate_large = $("#sel_cate_large").val();
				
				    if ("-" == sel_cate_large) {
				    	
				      $("#sel_cate_mid").attr("disabled", "disabled");
				      $("#sel_cate_small").attr("disabled", "disabled");
				      
				    } 
				    
			  }
			  
			  
			  
			  $(document).ready(function () {
			
				initUiData();			    
			
				$("#sel_cate_large").change(function () {
					
				    var com_cd = $(this).val();
				    var properties_gb = "L";

				    $("#sel_cate_mid").val("null");
				    $("#sel_cate_small").val("null");

				    if ("-" == com_cd) {
				    	
				        $("#sel_cate_mid").attr("disabled", "disabled");
				        $("#sel_cate_small").attr("disabled", "disabled");
				        
				    } else {
				    	
				        $("#sel_cate_mid").removeAttr("disabled");
				        $("#sel_cate_small").removeAttr("disabled");
				        
				    }

				    $.ajax({
				    	
				        beforeSend: function () {},
				        data      : {
				            "com_cd": com_cd,
				            "properties_gb": properties_gb
				        },
				        dataType  : "json",
				        type      : "POST",
				        url       : "/cateList.do",
				        success   : function (data) {
				            // 중분류 다시 쓰기
				            $("#sel_cate_mid").find("option").remove().end();
				            
				            for (i = 0; i < data.cateList.length; i++) {
				            	
				                $("#sel_cate_mid").append("<option value=" + data.cateList[i].comCd + ">" + data.cateList[i].cdNm + "</option>");
				                
				            }
				            
				            if (data.cateList.length == 0) {
				            	
				                $("#sel_cate_mid").find("option").remove().end();
				                $("#sel_cate_small").find("option").remove().end();
				                
				            }
				            
				            if ($("#sel_cate_mid").val() == "null") {
				            	
				                $("#sel_cate_small").attr("disabled", "disabled");
				                
				            } else {
				            	
				                $("#sel_cate_small").removeAttr("disabled");
				                
				            }
				            
				        }
				        
				    });

				});
			
				
				
				$("#sel_cate_mid").change(function () {
					
				    var com_cd = $(this).val();
				    var properties_gb = "M";

				    if ("-" == com_cd || "null" == com_cd) {
				    	
				        $("#sel_cate_small").attr("disabled", "disabled");
				        
				    } else {
				    	
				        $("#sel_cate_small").removeAttr("disabled");
				        
				    }

				    $.ajax({
				        beforeSend: function () {},
				        data      : {
				            "com_cd": com_cd,
				            "properties_gb": properties_gb
				        },
				        dataType  : "json",
				        type      : "POST",
				        url       : "/cateList.do",
				        success   : function (data) {
				            // 중분류 다시 쓰기
				            $("#sel_cate_small").find("option").remove().end();
				            
				            for (i = 0; i < data.cateList.length; i++) {
				            	
				                $("#sel_cate_small").append("<option value=" + data.cateList[i].comCd + ">" + data.cateList[i].cdNm + "</option>");
				                
				            }
				            
				        }
				    });
				});
			
				
				
				$("#chk_syrup").click(function () {
					
				    $("#chk_all").attr("checked", false);
				    
				});
				
				
				
				$("#chk_ocb").click(function () {
					
				    $("#chk_all").attr("checked", false);
				    
				});
				
				
				
				$("#chk_tmap").click(function () {
					
				    $("#chk_all").attr("checked", false);
				    
				});
				
				
				
				$("#chk_tstore").click(function () {
					
				    $("#chk_all").attr("checked", false);
				    
				});
				
				
				
				$("#chk_evs").click(function () {
					
				    $("#chk_all").attr("checked", false);
				    
				});
				
				
				
				$("#chk_all").click(function () {
					
				    $("#chk_syrup").attr("checked", false);
				    $("#chk_ocb").attr("checked", false);
				    $("#chk_tmap").attr("checked", false);
				    $("#chk_tstore").attr("checked", false);
				    $("#chk_evs").attr("checked", false);
				    $(this).attr("checked", true);
				    
				});
				
				
			
			    $("#btnSearch").click(function () {
			
			      var svcUnionCd = "";
			      var svcUnionCdNm = "";
			      var periodClCd = $("#sel_period option:selected").val();
			      var cnctCtgCd = "";
			
			      var chkArrData = [
				        {data: "01",seq : "10000"}, {data: "02",seq : "01000"}, {data: "03",seq : "00100"}, {data: "04",seq : "00010"}
				      , {data: "05",seq : "00001"}, {data: "06",seq : "11000"}, {data: "07",seq : "10100"}, {data: "08",seq : "10010"}
				      , {data: "09",seq : "10001"}, {data: "10",seq : "01100"}, {data: "11",seq : "01010"}, {data: "12",seq : "01001"}
				      , {data: "13",seq : "00110"}, {data: "14",seq : "00101"}, {data: "15",seq : "00011"}, {data: "16",seq : "11100"}
				      , {data: "17",seq : "11010"}, {data: "18",seq : "11001"}, {data: "19",seq : "10110"}, {data: "20",seq : "10101"}
				      , {data: "21",seq : "10011"}, {data: "22",seq : "01110"}, {data: "23",seq : "01101"}, {data: "24",seq : "01011"}
				      , {data: "25",seq : "00111"}, {data: "26",seq : "11110"}, {data: "27",seq : "11101"}, {data: "28",seq : "11011"}
				      , {data: "29",seq : "10111"}, {data: "30",seq : "01111"}, {data: "31",seq : "11111"}
			      ];
			
			      var chk1 = $("input:checkbox[id='chk_all']").is(":checked");
			      var chk2 = $("input:checkbox[id='chk_syrup']").is(":checked");
			      var chk3 = $("input:checkbox[id='chk_ocb']").is(":checked");
			      var chk4 = $("input:checkbox[id='chk_tmap']").is(":checked");
			      var chk5 = $("input:checkbox[id='chk_evs']").is(":checked");
			      var chk6 = $("input:checkbox[id='chk_tstore']").is(":checked");
			
			      chk1 = (chk1 == true) ? "1" : "0";
			
			      if (chk1 == "1") {
			    	  
			        svcUnionCd = "31";
			        
			      } else {
			    	  
			        chk2    = (chk2 == true) ? "1" : "0";
			        chk3    = (chk3 == true) ? "1" : "0";
			        chk4    = (chk4 == true) ? "1" : "0";
			        chk5    = (chk5 == true) ? "1" : "0";
			        chk6    = (chk6 == true) ? "1" : "0";
			
			        chkData = chk2 + chk3 + chk4 + chk5 + chk6;
			
			        for (var i = 0; i < chkArrData.length; i++) {
			
			          if (chkArrData[i].seq == chkData) {
			        	  
			            svcUnionCd   = chkArrData[i].data;
			            svcUnionCdNm = chkArrData[i].seq;
			            break;
			            
			          }
			          
			        }
			        
			      }
			      
			      var largeTx = $("#sel_cate_large option:selected").text();
			      var midTx = $("#sel_cate_mid option:selected").text();
			      var smallTx = $("#sel_cate_small option:selected").text();
			      var periodTx = $("#sel_period option:selected").text();
			
			      if (smallTx != "전체") {
			    	  
			        cnctCtgCd = $("#sel_cate_small option:selected").val();
			        
			      } else {
			    	  
			        if (midTx != "전체") {
			        	
			          cnctCtgCd = $("#sel_cate_mid option:selected").val();
			          
			        } else {
			        	
			          cnctCtgCd = $("#sel_cate_large option:selected").val();
			          
			        }
			        
			      }
			      
			      var largeCd = $("#sel_cate_large").val();
			      var midCd = $("#sel_cate_mid").val();
			      var smallCd = $("#sel_cate_small").val();
			      var param = "?svcUnionCd=" + svcUnionCd;
			      param         += "&periodClCd=" + periodClCd;
			      param         += "&cnctCtgCd=" + cnctCtgCd;
			      param         += "&svcUnionCdNm=" + svcUnionCdNm;
			      param         += "&largeCd=" + largeCd;
			      param         += "&midCd=" + midCd;
			      param         += "&smallCd=" + smallCd;
			      param         += "&largeTx=" + largeTx;
			      param         += "&midTx=" + midTx;
			      param         += "&smallTx=" + smallTx;
			      param         += "&periodTx=" + periodTx;
			      location.href = "category2.do" + param;
			
			    });
			  });
			
			  
			  
			  nv.addGraph(function () {
			
			    var chart = nv.models.pieChart().x(function (d) {
			    	
			      return d.key;
			      
			    }).y(function (d) {
			    	
			      return d.y;
			      
			    }).color(d3.scale.category10().range());
			
			    chart.donut(true);
			
			    d3.select("#chart3").datum(pieData1).transition().duration(1200).call(chart);
			
			    return chart;
			    
			  }); 
			
			  
			  
			  nv.addGraph(function () {
			
			    var chart = nv.models.pieChart().x(function (d) {
			    	
			      return d.key
			      
			    }).y(function (d) {
			    	
			      return d.y
			      
			    }).color(d3.scale.category10().range());
			
			    d3.select("#chart4").datum(pieData2).transition().duration(1200).call(chart);
			
			    return chart;
			    
			  });
			
			  var lineArrData = new Array();
			  var lineArrData2 = new Array();
			
			  
			  
			  nv.addGraph(function () {
			    var width = 500;
			    var height = 250;
			    var chart = nv.models.lineChart().x(function (d, i) {
			    	
			      return i;
			      
			    });
			
			    chart.useInteractiveGuideline(true);
			    
			    chart.xAxis.axisLabel('').tickFormat(function (d, i) {
			    	
			      return lineArrData[d];
			      
			    });
			    
			    chart.yAxis.axisLabel('점유율').tickFormat(function (d, i) {
			    	
			      return d + "%";
			      
			    });
			    
			    chart.interpolate("monotone");
			
			    d3.select('#chart1 svg').attr('width', width).attr('height', height).datum(lineData).transition().duration(1200).call(chart);
			    
			    return chart;
			    
			  });
			
			  
			  
			  nv.addGraph(function () {
			
			    var chart = nv.models.lineChart();
			    var width = 500;
			    var height = 250;
			
			    chart.useInteractiveGuideline(true);
			    
			    chart.xAxis.axisLabel('').tickFormat(function (d, i) {
			    	
			      return lineArrData2[d];
			      
			    });
			    
			    chart.yAxis.axisLabel('점유율').tickFormat(function (d, i) {
			    	
			      return d + "%";
			      
			    });
			    
			    chart.interpolate("monotone");
			
			    d3.select('#chart2 svg').attr('width', width).attr('height', height).datum(lineData2).transition().duration(1200).attr("d", lineData2).call(chart);
			
			    return chart;
			    
			  });
			  
			  myRadarChart();
			  
			  
			  
			  function myRadarChart() {
					
				var w = 108;
				var h = 130;

				var colorscale = d3.scale.category10();
	
				//Legend titles
				var LegendOptions = ['Smartphone','Tablet'];
		
					//Data
				var data1=[];
				var data2=[];
				var data3=[];
				var data4=[];
				
				<c:forEach items="${list}" var="voList" varStatus="status">
				
					<c:if test="${voList.funcAgrClCd == '99'}">
						<c:if test="${voList.lv == 2}">
							data1 = [[
								{axis:"Syrup",value:"${voList.syrGrp}"},
								{axis:"OCB",value:"${voList.ocbGrp}"},
								{axis:"T map",value:"${voList.tmaGrp}"},
								{axis:"11번가",value:"${voList.evsGrp}"},
								{axis:"T store",value:"${voList.tstGrp}"}
							]];
						</c:if>
					</c:if>
	
					<c:if test="${voList.funcAgrClCd == '03'}">
						<c:if test="${voList.lv == 2}">
						data2 = [[
							{axis:"Syrup",value:"${voList.syrGrp}"},
							{axis:"OCB",value:"${voList.ocbGrp}"},
							{axis:"T map",value:"${voList.tmaGrp}"},
							{axis:"11번가",value:"${voList.evsGrp}"},
							{axis:"T store",value:"${voList.tstGrp}"}
						]];
						</c:if>
					</c:if>
					
					<c:if test="${voList.funcAgrClCd == '02'}">
						<c:if test="${voList.lv == 2}">
						data3 = [[
							{axis:"Syrup",value:"${voList.syrGrp}"},
							{axis:"OCB",value:"${voList.ocbGrp}"},
							{axis:"T map",value:"${voList.tmaGrp}"},
							{axis:"11번가",value:"${voList.evsGrp}"},
							{axis:"T store",value:"${voList.tstGrp}"}
						]];
						</c:if>
					</c:if>
					
					<c:if test="${voList.funcAgrClCd == '01'}">
						<c:if test="${voList.lv == 2}">
						data4 = [[
							{axis:"Syrup",value:"${voList.syrGrp}"},
							{axis:"OCB",value:"${voList.ocbGrp}"},
							{axis:"T map",value:"${voList.tmaGrp}"},
							{axis:"11번가",value:"${voList.evsGrp}"},
							{axis:"T store",value:"${voList.tstGrp}"}
						]];
						</c:if>
					</c:if>

				</c:forEach>
				
				//Options for the Radar chart, other than default
				var mycfg = {
				  w: w,
				  h: h,
				  maxValue: 1.0,
				  levels: 4,
				  ExtraWidthX: 100
				}
	
				//Call function to draw the Radar chart
				//Will expect that data is in %'s
				
				console.log(data1);
				
				if ( data1.length == 0 && data2.length == 0 && data3.length == 0 && data4.length == 0 )
				{
					return ;
				}
				
				RadarChart.draw("#chart5", data1, mycfg);
	 			RadarChart.draw("#chart6", data2, mycfg);
				RadarChart.draw("#chart7", data3, mycfg);
				RadarChart.draw("#chart8", data4, mycfg);
	
				////////////////////////////////////////////
				/////////// Initiate legend ////////////////
				////////////////////////////////////////////
	
				var svg = d3.select('#body')
					.selectAll('svg')
					.append('svg')
					.attr("width", w+300)
					.attr("height", h)
	
				//Create the title for the legend
				var text = svg.append("text")
					.attr("class", "title")
					.attr('transform', 'translate(90,0)') 
					.attr("x", w - 70)
					.attr("y", 10)
					.attr("font-size", "12px")
					.attr("fill", "#FF0000")
					.text("What % of owners use a specific service in a week");
						
				//Initiate Legend	
				var legend = svg.append("g")
					.attr("class", "legend")
					.attr("height", 100)
					.attr("width", 200)
					.attr('transform', 'translate(90,20)') 
					;
					//Create colour squares
					legend.selectAll('rect')
					  .data(LegendOptions)
					  .enter()
					  .append("rect")
					  .attr("x", w - 65)
					  .attr("y", function(d, i){ return i * 20;})
					  .attr("width", 10)
					  .attr("height", 10)
					  .style("fill", function(d, i){ return colorscale(i);})
					  ;
					//Create text next to squares
					legend.selectAll('text')
					  .data(LegendOptions)
					  .enter()
					  .append("text")
					  .attr("x", w - 52)
					  .attr("y", function(d, i){ return i * 20 + 9;})
					  .attr("font-size", "11px")
					  .attr("fill", "#FF0000")
					  .text(function(d) { return d; })
					  ;	
					
			  }
			 
			
			  
			  function pieData1() {
				  
					var pieData = [];
					
					<c:forEach items= "${ageLineList5}" var ="item1" varStatus="status">
					
						console.log("${item1.sexCd}");
						pieData.push({
							key : "${item1.sexCd}",
							y : "${item1.totMbrCnt}"
						});
					
					</c:forEach>
					
					return pieData;
					
				}
			  
			  
			  
				function pieData2() {
					
					var pieData = [];
					
					<c:forEach items= "${ageLineList6}" var ="item1" varStatus="status">
					
						pieData.push({
							key : "${item1.sexCd}",
							y : "${item1.totMbrCnt}"
						});
					
					</c:forEach>

					return pieData;
					
				}

				
				
				function lineData() {
					
					var sin = [], cos = [];

					<c:forEach items= "${ageLineList1}" var ="item1" varStatus="status">
					
						lineArrData["${status.index}"] = "${item1.ageRngNm}";
						sin.push({
							x : Number("${status.index}"),
							y : Number("${item1.totMbrCnt}")
						});
						
					</c:forEach>
					
					<c:forEach items= "${ageLineList2}" var ="item1" varStatus="status">
					
						lineArrData["${status.index}"] = "${item1.ageRngNm}";
						cos.push({
							x : Number("${status.index}"),
							y : Number("${item1.totMbrCnt}")
						});
						
					</c:forEach>

					return [ {
						values : sin,
						key : "${ageListTitle1}   ",
						color : "#78FF97"
					}, {
						values : cos,
						key : "${ageListTitle2}",
						color : "#24B245"
					} ];
					
				}

				
				
				function lineData2() {
					
					var sin = [], cos = [];

					<c:forEach items= "${ageLineList3}" var ="item1" varStatus="status">
					
						lineArrData2["${status.index}"] = "${item1.ageRngNm}";
						sin.push({
							x : Number("${status.index}"),
							y : Number("${item1.totMbrCnt}")
						});
						
					</c:forEach>
					
					<c:forEach items= "${ageLineList4}" var ="item1" varStatus="status">
					
						lineArrData2["${status.index}"] = "${item1.ageRngNm}";
						cos.push({
							x : Number("${status.index}"),
							y : Number("${item1.totMbrCnt}")
						});
						
					</c:forEach>

					return [ {
						values : sin,
						key : "${ageListTitle3}    ",
						color : "#B25437"
					}, {
						values : cos,
						key : "${ageListTitle4}",
						color : "#FF9878"
					} ];
					
				}
			  
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>