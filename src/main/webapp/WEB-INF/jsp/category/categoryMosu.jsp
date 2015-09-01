<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
<%@page import="java.util.Map,
				  java.util.LinkedHashMap"%>
<%
	String largeTxt = (String)request.getAttribute("largeTx");
	String midTxt = (String)request.getAttribute("midTx");
	String smallTxt = (String)request.getAttribute("smallTx");
	
	String subTxt = "전체 > 전체 > 전체";
	if(largeTxt != null && !largeTxt.equals("") && !largeTxt.equals("전체")  ){
		subTxt = largeTxt+" > ";
		if(midTxt != null && !midTxt.equals("") && !midTxt.equals("전체")  ){
			subTxt = subTxt+midTxt+" > ";
			if(smallTxt != null && !smallTxt.equals("") && !smallTxt.equals("전체")  ){
				subTxt = subTxt+smallTxt;
			}else{
				subTxt = subTxt+"전체";
			}
		}else{
			subTxt = subTxt+"전체 > 전체";
		}
	}
	pageContext.setAttribute("subTxt" , subTxt);
	
	
	Map<String, String> levelMap = new LinkedHashMap<String, String>();
	levelMap.put("1", "모수");
	levelMap.put("2", "모수기여도(%)");
	pageContext.setAttribute("levelMap" , levelMap);

	Map<String, String> mosuTypeMap = new LinkedHashMap<String, String>();
	mosuTypeMap.put("99", "전체");
	mosuTypeMap.put("03", "PUSH동의");
	mosuTypeMap.put("02", "위치동의");
	mosuTypeMap.put("01", "BLE동의");
	pageContext.setAttribute("mosuTypeMap" , mosuTypeMap);
		
%>
<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="content">
		
		<!-- main-container -->
		<section >
        	<p class="category"><img src="<c:url value="/resources/images/category_img.jpg"/>"  title="업종 상단 이미지"/></p>
			<div class="container mb100">
            	<h1>서비스별 모수 현황<span class="date">데이터 기준일 : ${baseDt}</span></h1>
                <!--Search-->
                <div class="searchConts mt50">
                	<table >
                    	<colgroup>
                        	<col width="90px">
                            <col width="200px">
                            <col width="80px">
                            <col width="">
                        </colgroup>
    					<tbody>
        					<tr>
        					    <th>기 간</th>
        					    <td>
                                	<!--기간 select-->
                					<select name="sel_period" id="sel_period" style="width:100px">
                    					<option value="1M" <c:if test="${periodClCd == '1M'}">selected</c:if>>1개월</option>
                    					<option value="3M" <c:if test="${periodClCd == '3M'}">selected</c:if>>3개월</option>
                    					<option value="6M" <c:if test="${periodClCd == '6M'}">selected</c:if>>6개월</option>
                					</select>
                                </td>
        					    <th>분 류</th>
        					    <td >
                                	<!--대분류 select-->
                                	<select id="sel_cate_large" name="sel_cate_large" style="width:30%"> 
	                                	<c:forEach items="${cateList1}" var="voList" varStatus="status">
											<option value="${voList.comCd}" <c:if test="${voList.comCd == largeCd}">selected</c:if>>${voList.cdNm}</option>
										</c:forEach>
									</select> 
                                    <!--중분류 select-->
 									<select id="sel_cate_mid" name="sel_cate_mid"  style="width:30%" <c:if test="${largeCd == 'null' || largeCd == '' || largeCd == '-'}">disabled</c:if>> 
 										<c:forEach items="${cateList2}" var="voList" varStatus="status">
											<option value="${voList.comCd}" <c:if test="${voList.comCd == midCd}">selected</c:if>>${voList.cdNm}</option>
										</c:forEach>
									</select> 
                                   <!--소분류 select--> 
                                   <select id="sel_cate_small"  name="sel_cate_small" style="width:30%" <c:if test="${midCd == 'null' || midCd == '' || midCd == '-'}">disabled</c:if>> 
  										<c:forEach items="${cateList3}" var="voList" varStatus="status">
											<option value="${voList.comCd}" <c:if test="${voList.comCd == smallCd}">selected</c:if>>${voList.cdNm}</option>
										</c:forEach>
									</select> 
                                </td>
    					    </tr>
       					</tbody>
					</table>
                    <!--Btn_search-->
                    <p class="btnSrc_sm"><button  name="btnSearch" id="btnSearch" type="button">검색버튼</button></p>
                     <!--//Btn_search-->
                    <!--검색 결과-->
                    <div class="viewSrc">
                    	<ul>
							<li class="title ">검색 조건</li>
							<li><i class="fa fa-caret-right"></i>기간 : <span>${periodTx }</span></li>
							<li><i class="fa fa-caret-right"></i>분류 : <span>${subTxt }</span></li>
						</ul>
                    </div>
					<!--//검색 결과-->
                </div>
            	<!--//Search-->
                
                
                
                <!--서비스별 모수 현황 List-->
                <div class="mt80 detailLy">
                	<p class="btSpace"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스별 모수 현황 리스트</button></p>
                    <p class="txt"><strong>[서비스별 모수 현황 리스트]</strong>를 클릭 하시면 자세한 내용을 볼 수 있습니다.</p>
                    <div class="detailListBox">
                    <ul class="detailList">
                    	<li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                        		<ul>
                            		<li class="ciTotal">Integration</li>
                                	<!--통합-->
                                	<li class="boxTotal" id="totTxt"></li>
                                	<!--//통합-->
                                </ul>
                            </a>
                        </li>
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                        		<ul>
                            		<li class="ci"><img src="<c:url value="/resources/images/ci_syrup.png"/>" alt="syrup"/></li>
                                	<!--syrup-->
                                	<li class="box" id="syrTxt"></li>
                                	<!--//syrup-->
                            	</ul>
                            </a>
                        </li>
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                       			<ul>
                            		<li class="ci"><img src="<c:url value="/resources/images/ci_ok.png"/>" alt="OK cashbag"/></li>
                                	<!--OK cashbag-->
                                	<li class="box" id="ocbTxt"></li>
                                	<!--//OK cashbag-->
                            	</ul>
                            </a>
                        </li>
                    </ul>
                    <ul class="detailList mt30">
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                        		<ul>
                            		<li class="ci"><img src="<c:url value="/resources/images/ci_tmap.png"/>" alt="T map"/></li>
                                	<!--T map-->
                                	<li class="box" id="tmaTxt"></li>
                                	<!--//T map-->
                            	</ul>
                            </a>
                        </li>
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                        		<ul>
                            		<li class="ci"><img src="<c:url value="/resources/images/ci_11.png"/>" alt="11번가"/></li>
                                	<!--11번가-->
                                	<li class="box" id="evsTxt"></li>
                                	<!--//11번가-->
                            	</ul>
                            </a>
                        </li>
                        <li>
                        	<a href="#" data-toggle="modal" data-target="#service">
                            	<ul>
                            		<li class="ci"><img src="<c:url value="/resources/images/ci_tstore.png"/>" alt="T store"/></li>
                                	<!--T store-->
                                	<li class="box" id="tstTxt"></li>
                                	<!--//T store-->
                            	</ul>
                            </a>
                        </li>
                    </ul>
                    </div>
                </div>
                <!--// 서비스별 모수 현황 List-->

            </div>
		</section>
		<!--// main-container-->
		
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
			<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h3 id="myModalLabel">서비스별 모수 현황</h3>
			</div>
            <div class="modal-body">
            	<table class="listTB tStriped">
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
            				<th colspan="2">&nbsp;</th>
            				<th>TOTAL</th>
            				<th>Syrup</th>
            				<th>OCB</th>
            				<th>T map</th>
            				<th>11번가</th>
            				<th>T store</th>
        				</tr>
    				</thead>
    				<tbody>
        				<c:if test="${mosulist.size() == 0}">
							<tr>
								<td colspan="8" class="noData"><i class="fa fa-file-text-o"></i>데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="currMosuTypeCd" value="" />
						<c:forEach items="${mosulist}" var="voList" varStatus="status">						
							<tr>
								<c:if test="${currMosuTypeCd != voList.funcAgrClCd}">
									<td rowspan="2" class="depth1 txtC"><c:out value="${mosuTypeMap[voList.funcAgrClCd]}" /></td>
									<c:set var="currMosuTypeCd" value="${voList.funcAgrClCd }" />
								</c:if>
								<td class="depth2 txtL"><c:out value="${levelMap[voList.lv]}" /></td>
								<td class="total">${voList.tot}</td>
								<td>${voList.syr}</td>
								<td>${voList.ocb}</td>
								<td>${voList.tma}</td>
								<td>${voList.evs}</td>
								<td>${voList.tst}</td>
							</tr>
						</c:forEach>
                    </tbody>
				</table>
            </div>
		</div>
	</div>
</div>
<!--//Modal -->

		
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
			  
			  $(document).ready(function () {
				  var data = $.grep(${jsonMosuList}, function(value, idx){	return value.funcAgrClCd == '99' && value.lv == '1';	});
				  $.each(['tot', 'syr', 'ocb', 'tma', 'evs', 'tst'], function(idx, value){
					  $('#'+value+'Txt').text(eval('data[0].'+value));
				  });
				  
				//myRadarChart();
				
				$("#sel_cate_large").change(function () {
					changeCategory($(this).val(), "L");
				});
				$("#sel_cate_mid").change(function () {
					changeCategory($(this).val(), "M");
				});
				
			    $("#btnSearch").click(function () {
			      var periodClCd = $("#sel_period option:selected").val();
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
			      
			      var param = "?periodClCd=" + periodClCd;
			      param         += "&cnctCtgCd=" + cnctCtgCd;
			      param         += "&largeCd=" + largeCd;
			      param         += "&midCd=" + midCd;
			      param         += "&smallCd=" + smallCd;
			      param         += "&largeTx=" + largeTx;
			      param         += "&midTx=" + midTx;
			      param         += "&smallTx=" + smallTx;
			      param         += "&periodTx=" + periodTx;
			      
			      location.href = "/category/categoryMosu.do" + param;
			
			    });
			    
			  });
			
			  /* 분류 category 조회 */ 
			  function changeCategory(com_cd, properties_gb) {
				
				if(properties_gb == "L"){
					$("#sel_cate_mid").selectBox("options", "<option value=''>전체</option>"); 
			        $("#sel_cate_mid").selectBox("disable");
				}
				
				$("#sel_cate_small").selectBox("options", "<option value=''>전체</option>"); 
			    $("#sel_cate_small").selectBox("disable");
			           
			    var subCateNm = (properties_gb == "L") ? "mid" : "small";
			    
			    if ("-" != com_cd && com_cd != "") {
			    	$("#sel_cate_"+subCateNm).selectBox("enable");

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
				        	var optionStrs = "";
				            for (i = 0; i < data.cateList.length; i++) {
				            	optionStrs = optionStrs+"<option value='" + data.cateList[i].comCd + "'>" + data.cateList[i].cdNm + "</option>";
				            }
				            
				            if (data.cateList.length == 0) {
				            	optionStrs = optionStrs+"<option value=''>전체</option>";
				            }
				            $("#sel_cate_"+subCateNm).selectBox("options", optionStrs); 
				        }
				    });
			    } 
			  }
			  
			/* 
			  
			  <!-- 
              서비스별 모수 현황 챠트
              <h2>서비스별 모수 현황</h2>
              <div class="chartLy">
              	<ul class="chartLy_4p ">
              		<li>
                  		<p class="chartTitle "><i class="fa fa-bar-chart"></i>전체</p>
                      	<div class="chartArea" id="chart5" val="5"  style="height:200px !important" ><svg></svg></div>
                  	</li>
                  	<li>
                  		<p class="chartTitle ico"><i class="fa fa-bar-chart"></i>PUSH 동의</p>
                      	<div class="chartArea" id="chart6" val="5"  style="height:200px !important" ><svg></svg></div>
                  	</li>
                      <li>
                  		<p class="chartTitle ico"><i class="fa fa-bar-chart"></i>위치 동의</p>
                      	<div class="chartArea" id="chart7" style="height:200px !important"><svg></svg></div>
                  	</li>
                      <li>
                  		<p class="chartTitle ico"><i class="fa fa-bar-chart"></i>BLE 동의</p>
                      	<div class="chartArea" id="chart8" val="6"  style="height:200px !important" ><svg></svg></div>
                  	</li>
              	</ul>
				</div>
              // 서비스별 모수 현황 챠트
               -->
			  var lineArrData = new Array();
			  var lineArrData2 = new Array();
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
				<c:forEach items="${mosulist}" var="voList" varStatus="status">
				
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
			 
			 */
			  /* 
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
					
				} */
			  
		</script>
		
	</tiles:putAttribute>
	
</tiles:insertDefinition>
