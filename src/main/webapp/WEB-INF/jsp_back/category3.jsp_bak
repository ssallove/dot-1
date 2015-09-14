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
		
		<script type="text/javascript" src="<c:url value=" /resources/dimple/lib/d3.v3.4.8.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="content">
		
		<p class="category" title="업종 상단 이미지"></p>
		<div class="wrap">
			<h2>
				서비스별 데모 현황<span class="floatR">데이터 기준일 : ${baseDt}</span>
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
							<th>서비스</th>
							<td colspan="3">
								<form style="display: inline-block; white-space: nowrap;">
									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 0, 1) == 2}">
											<label for="chk_all" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_all" value="1" checked> 통합	</label>
										</c:when>
										<c:otherwise>
											<label for="chk_all" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_all" value="0"> 통합 </label>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 0, 1) == 1}">
											<label for="chk_syrup" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_syrup" value="1" checked> Syrup </label>
										</c:when>
										<c:otherwise>
											<label for="chk_syrup" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_syrup" value="0"> Syrup </label>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 1, 2) == 1}">
											<label for="chk_ocb" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_ocb" value="1" checked> OCB	</label>
										</c:when>
										<c:otherwise>
											<label for="chk_ocb" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_ocb" value="0"> OCB	</label>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 2, 3) == 1}">
											<label for="chk_tmap" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_tmap" value="1" checked> T map	</label>
										</c:when>
										<c:otherwise>
											<label for="chk_tmap" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_tmap" value="0"> T map </label>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 4, 5) == 1}">
											<label for="chk_evs" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_evs" value="1" checked> 11 번가 </label>
										</c:when>
										<c:otherwise>
											<label for="chk_evs" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_evs" value="0"> 11 번가 </label>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${fn:substring(svcUnionCdNm, 3, 4) == 1}">
											<label for="chk_tstore" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_tstore" value="1" checked> T store </label>
										</c:when>
										<c:otherwise>
											<label for="chk_tstore" class="checkB pr40"> <input type="checkbox" name="chk_svc" id="chk_tstore" value="0"> T store	</label>
										</c:otherwise>
									</c:choose>

								</form>
							</td>
						</tr>

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
					<li>서비스 : <span>${svcUnionNm }</span></li>
					<li>기간 : <span>${periodTx }</span></li>
					<li>분류 : <span>${largeTx} > ${midTx } > ${smallTx }</span></li>

				</ul>
			</div>
			<!--//검색 조건-->
			
			<!--성연령대별 현황 챠트-->
            <h3 class="mt50">성연령대별 현황</h3> 
			<div class="chartLy">
				 <!--챠트 2개 보일 경우-->
	           	<ul class="chartLy_2p">
	           		<li>
	               		<p class="chartTitle">연령대 구성</p>
	                   	<div class="chartArea" id="chart1"></div>
	               	</li>
	               	<li>
	               		<p class="chartTitle">성별 구성(${largeTx} > ${midTx } > ${smallTx }) </p>
	                   	<div class="chartArea" id="chart2"></div>
	               	</li>
	           	</ul>
	               <!--//챠트 2개 보일 경우-->
				 <!--챠트 2개 보일 경우-->
	           	<ul class="chartLy_2p">
	               	<li>
	               		<p class="chartTitle">성별 구성(전체) </p>
	                   	<div class="chartArea"><svg  id="chart3"></svg></div>
	               	</li>
	               	<li>
	               		<p class="chartTitle">성별 구성(${largeTx} > ${midTx } > ${smallTx }) </p>
	                   	<div class="chartArea"><svg  id="chart4"></svg></div>
	               	</li>
	           	</ul>
               <!--//챠트 2개 보일 경우-->
            </div>
            
			<!--주활동지역 현황-->
            <h3 class="mt50">주 활동지역 현황</h3>
            <table class="listTable  tHover"> 
            	<colgroup>
                	<col width="100px">
                    <col width="*">
                    <col width="100px">
                    <col width="*">
                </colgroup>
				<thead>
    				<tr>
        				<th>순위</th>
        				<th>주 활동 지역(구단위)</th>
        				<th>순위</th>
        				<th>주 활동 지역(구단위)</th>
    				</tr>
                </thead>
                <tbody>
                	<c:if test="${list5.size() == 0}">
			        <tr>
						<td colspan="4" class="txtC">데이터가 없습니다.</td>
					</tr>
					</c:if>
		
					<c:if test="${list5.size() > 0}">
	   				<tr>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[0].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[0].mainArea}" /></td>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[1].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[1].mainArea}" /></td>
	   				</tr>
	   				<tr>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[2].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[2].mainArea}" /></td>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[3].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[3].mainArea}" /></td>
	   				</tr>
	   				<tr>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[4].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[4].mainArea}" /></td>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[5].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[5].mainArea}" /></td>
	   				</tr>
	   				<tr>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[6].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[6].mainArea}" /></td>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[7].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[7].mainArea}" /></td>
	   				</tr>
	   				<tr>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[8].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[8].mainArea}" /></td>
	       				<td class="depth2 txtC"><c:out value="${arrayList5[9].seq}" /></td>
	       				<td class="txtL"><c:out value="${arrayList5[9].mainArea}" /></td>
	   				</tr>
	   				</c:if>
   				</tbody>
			</table>
							
		</div>
		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
		
			  function initUiData(){
				  
				  $('#sub_category_3').addClass("active");
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
			
			        chkData = chk2 + chk3 + chk4 + chk6 + chk5;
			
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
			      location.href = "category3.do" + param;
			
			    });
			  });
			  
			  
			  
			  dimplePie1();
			  
			  function dimplePie1() {
				  
				  var svg = dimple.newSvg('#chart3', "100%", "100%");
				  
				  var pieData = [];
					
					<c:forEach items= "${ageLineList5}" var ="item1" varStatus="status">
					
						pieData.push({
							
							Owner : "${item1.sexCd}",
							y : "${item1.totMbrCnt}"
							
						});
					
					</c:forEach>
				  
				  var myChart = new dimple.chart(svg, pieData);					
			      
				  myChart.setBounds(20, 20, 460, "80%");
			      
			      myChart.addMeasureAxis("p", "y");
			      
			      var s = myChart.addSeries("Owner", dimple.plot.pie);
			      
			      s.addOrderRule("Owner", "DESC");
			      
			      myChart.addLegend(500, 20, 90, 300, "left");
			      
			      myChart.draw();
			      
			  }
			  
			  
			  
			  dimplePie2();
			  
			  function dimplePie2() {
				  
				  var svg = dimple.newSvg('#chart4', "100%", "100%");
				  
				  var pieData = [];
					
					<c:forEach items= "${ageLineList6}" var ="item1" varStatus="status">
					
						pieData.push({
							
							Owner : "${item1.sexCd}",
							y : "${item1.totMbrCnt}"
							
						});
					
					</c:forEach>
				  
				  var myChart = new dimple.chart(svg, pieData);
				  
			      myChart.setBounds(20, 20, 460, "80%")
			      
			      myChart.addMeasureAxis("p", "y");
			      
			      var s = myChart.addSeries("Owner", dimple.plot.pie);
			      
			      s.innerRadius = "50%";
			      
			      s.addOrderRule("Owner", "DESC");
			      
			      myChart.addLegend(500, 20, 90, 300, "left");
			      
			      myChart.draw();
			  }
			  
			  
			  
			  dimpleLineChart1();
			  
			  function dimpleLineChart1() {
				  
				  var svg = dimple.newSvg('#chart1', "100%", "100%");
				  var data = [];
				 
				  <c:forEach items= "${ageLineList1}" var ="item1" varStatus="status">

					data.push(
						    {
								연령 : "${item1.ageRngNm}",
								비율 : Number("${item1.totMbrCnt}"),
								Channel: "${ageListTitle1}"
							}
					    );
					
				  </c:forEach>
				  
				  <c:forEach items= "${ageLineList2}" var ="item1" varStatus="status">

					data.push(
						    {
								연령 : "${item1.ageRngNm}",
								비율 : Number("${item1.totMbrCnt}"),
								Channel: "${ageListTitle2}"
							}
					    );
					
				  </c:forEach>
				  
				  var myChart = new dimple.chart(svg, data);

				  myChart.setBounds(60, 30, 505, "80%");

				  var x = myChart.addCategoryAxis("x", "연령");

				  x.addOrderRule("연령");

				  myChart.addMeasureAxis("y", "비율");

				  var s = myChart.addSeries("Channel", dimple.plot.line);
				  
				  s.lineMarkers = true;
				  
				  s.lineWeight = 2;

				  s.interpolation = "cardinal";
				  
				  s.addOrderRule("Channel");

				  myLegend = myChart.addLegend(60, 10, 500, 20, "right");
				  
				  myChart.draw();
				  
			  }
			  
			  
			  
			  dimpleLineChart2();
			  
			  function dimpleLineChart2() {
				  
				  var svg = dimple.newSvg('#chart2', "100%", "100%");
				  var data = [];
				 
				  <c:forEach items= "${ageLineList3}" var ="item1" varStatus="status">

					data.push(
						    {
								연령 : "${item1.ageRngNm}",
								비율 : Number("${item1.totMbrCnt}"),
								Channel: "${ageListTitle1}"
							}
					    );
					
				  </c:forEach>
				  
				  <c:forEach items= "${ageLineList4}" var ="item1" varStatus="status">

					data.push(
						    {
								연령 : "${item1.ageRngNm}",
								비율 : Number("${item1.totMbrCnt}"),
								Channel: "${ageListTitle2}"
							}
					    );
					
				  </c:forEach>
				  
				  var myChart = new dimple.chart(svg, data);

				  myChart.setBounds(60, 30, 505, "80%");

				  var x = myChart.addCategoryAxis("x", "연령");

				  x.addOrderRule("연령");

				  myChart.addMeasureAxis("y", "비율");

				  var s = myChart.addSeries("Channel", dimple.plot.line);
				  
				  s.lineMarkers = true;
				  
				  s.lineWeight = 2;

				  s.interpolation = "cardinal";
				  
				  s.addOrderRule("Channel");

				  myLegend = myChart.addLegend(60, 10, 500, 20, "right");
				  
				  myChart.draw();
				  
			  }
			  
		</script>
		
	</tiles:putAttribute>
</tiles:insertDefinition>