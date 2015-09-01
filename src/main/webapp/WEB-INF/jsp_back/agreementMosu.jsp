<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>


<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="stylesheet">
	
		<link href="<c:url value="/resources/nvd3/nv.d3.css"/>"	rel="stylesheet">
		<script type="text/javascript" src="<c:url value=" /resources/js/adm.common.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/js/common.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/d3/d3.min.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/nvd3/nv.d3.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/d3/radarChart.js "/>"></script>
		<script type="text/javascript" src="<c:url value=" /resources/d3/sankey.js "/>"></script>
		
	</tiles:putAttribute>

	<tiles:putAttribute name="content">
	
		<style>
	 
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
		 
		</style>

		<p class="agreement" title="동의 상단 이미지"></p>
		<div class="wrap">
			<h2>동의<span class="floatR">데이터 기준일 : ${sBaseDt}</span></h2>
			<h3>서비스별 고객 현황</h3>
			<!--Tab-->
			<ul class="nav tabLine">
				<li class="active"><a href="#tab1" data-toggle="tab">필수 동의</a></li>
				<li><a href="#tab2" data-toggle="tab">교차활용 동의</a></li>
			</ul>
			<div class="tab_content">
				<!--Tab 필수 동의-->
				<div class="tab_pane active" id="tab1">
					<!--그래프 영역-->
					<h4>가입 고객수</h4>
					<div class="graph txtC mb30"><svg></svg></div>
					<!-- <p id="chart"> -->
					<!--//그래프 영역-->

					<!--필수 동의 Table-->
					<p class="expTb">※ Active 고객수 -> 앱활동성 3개월, MAU -> 앱활동성 1개월,
						Active 고객은 OCB, Syrup, T map</p>
					<table class="listTable tStriped tHover">
						
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

							<c:if test="${listVoEssenMosu.size() == 0}">
							
								<tr>
									<td colspan="8" class="txtC">데이터가 없습니다.</td>
								</tr>
								
							</c:if>

							<c:forEach items="${listVoEssenMosu}" var="voList" varStatus="status">
							
								<tr>
									
									<c:if test="${voList.lv == '0'}">
										
										<c:if test="${status.count == 1}">
								
											<td rowspan="4" class="depth1 txtC">가입고객수</td>
								
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '99'}">
										
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
											
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '03'}">
							
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
								
										</c:if>
								
										<c:if test="${voList.funcAgrClCd == '02'}">
								
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '01'}">

											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

									</c:if>

									<c:if test="${voList.lv == '1'}">
										
										<c:if test="${status.count == 5}">
										
											<td rowspan="4" class="depth1 txtC">통합고객수</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '99'}">
										
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '03'}">

											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '02'}">
											
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '01'}">

											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

									</c:if>

									<c:if test="${voList.lv == '2'}">
										
										<c:if test="${status.count == 9}">
										
											<td rowspan="4" class="depth1 txtC">Active 고객수</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '99'}">
										
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '03'}">
										
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '02'}">
										
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '01'}">
										
											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
									
									</c:if>

									<c:if test="${voList.lv == '3'}">
									
										<c:if test="${status.count == 13}">
									
											<td rowspan="4" class="depth1 txtC">MAU 고객수</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '99'}">
									
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '03'}">
									
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '02'}">
									
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '01'}">
									
											<td class="depth2 txtL">BLE동의</td>
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
					<!--//필수 동의 Table-->

				</div>
				<!--//Tab 필수 동의-->

				<!--Tab 교차활용 동의-->
				<div class="tab_pane fade" id="tab2">
					<!--그래프 영역-->
					<h4>가입 고객수</h4>
					<div class="graph txtC mb30"><svg></svg></div>					
					<!--//그래프 영역-->

					<!--교차활용 동의 Table-->
					<p class="expTb">※ Active 고객수 -> 앱활동성 3개월, MAU -> 앱활동성 1개월,
						Active 고객은 OCB, Syrup, T map</p>
					<table class="listTable tStriped tHover">
						
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

							<c:if test="${listVoCrosMosu.size() == 0}">
								
								<tr>
									<td colspan="8" class="txtC">데이터가 없습니다.</td>
								</tr>
							
							</c:if>

							<c:forEach items="${listVoCrosMosu}" var="voList" varStatus="status">
							
								<tr>
							
									<c:if test="${voList.lv == '0'}">
							
										<c:if test="${status.count == 1}">
							
											<td rowspan="4" class="depth1 txtC">가입고객수</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '99'}">
							
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '03'}">
							
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '02'}">
							
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '01'}">
							
											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
									</c:if>
							
									<c:if test="${voList.lv == '1'}">
							
										<c:if test="${status.count == 5}">
							
											<td rowspan="4" class="depth1 txtC">통합고객수</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '99'}">
							
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '03'}">
							
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
							
										</c:if>
							
										<c:if test="${voList.funcAgrClCd == '02'}">
							
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
										
										<c:if test="${voList.funcAgrClCd == '01'}">
										
											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
										
										</c:if>
									
									</c:if>

									<c:if test="${voList.lv == '2'}">
									
										<c:if test="${status.count == 9}">
									
											<td rowspan="4" class="depth1 txtC">Active 고객수</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '99'}">
									
											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '03'}">
									
											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '02'}">
									
											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
										<c:if test="${voList.funcAgrClCd == '01'}">
									
											<td class="depth2 txtL">BLE동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>
									
										</c:if>
									
									</c:if>

									<c:if test="${voList.lv == '3'}">

										<c:if test="${status.count == 13}">

											<td rowspan="4" class="depth1 txtC">MAU 고객수</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '99'}">

											<td class="depth2 txtL">전체</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '03'}">

											<td class="depth2 txtL">PUSH동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '02'}">

											<td class="depth2 txtL">위치동의</td>
											<td class="total">${voList.tot}</td>
											<td>${voList.syr}</td>
											<td>${voList.ocb}</td>
											<td>${voList.tma}</td>
											<td>${voList.evs}</td>
											<td>${voList.tst}</td>

										</c:if>

										<c:if test="${voList.funcAgrClCd == '01'}">

											<td class="depth2 txtL">BLE동의</td>
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
					<!--//교차활용 동의 Table-->
				</div>
				<!--//Tab 교차활용 동의-->
			</div>
			<!--//Tab-->

			<h3 class="mt50">서비스 조합별 교차 고객 현황</h3>
			<h4>
				합집합 현황 <span class="floatR expTb">※ T map, 11번가는 현재기준 동의가 없음.</span>
			</h4>
			<!--합집합 현황-->
			<table class="listTable tStriped tHover mb30">
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
					<tr>
						<th rowspan="2">서비스조합</th>
						<th colspan="4">가입 고객수</th>
						<th colspan="4">Active 고객수</th>
						<th colspan="4">MAU</th>
					</tr>
					<tr>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
					</tr>
				<tbody>
					
					<c:if test="${listVoUnion.size() == 0}">
						
						<tr>
							<td colspan="13" class="txtC">데이터가 없습니다.</td>
						</tr>
					
					</c:if>

					<c:forEach items="${listVoUnion}" var="voList" varStatus="status">
					
						<tr>
					
							<c:if test="${voList.crossSvcUnionCd == '01'}">
					
								<td class="depth2 txtC">Syrup ∪ OCB</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '02'}">
					
								<td class="depth2 txtC">Syrup ∪ OCB ∪ T map</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '03'}">
					
								<td class="depth2 txtC">Syrup ∪ OCB ∪ 11번가</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '04'}">
					
								<td class="depth2 txtC">Syrup ∪ OCB ∪ T map ∪ 11번가</td>
					
							</c:if>
					
							<td class="total">${voList.scbMbrCntTot}</td>
							<td>${voList.scbMbrCntPush}</td>
							<td>${voList.scbMbrCntGeo}</td>
							<td>${voList.scbMbrCntBle}</td>
							<td class="total">${voList.actvMbrCntTot}</td>
							<td>${voList.actvMbrCntPush}</td>
							<td>${voList.actvMbrCntGeo}</td>
							<td>${voList.actvMbrCntBle}</td>
							<td class="total">${voList.mauCntTot}</td>
							<td>${voList.mauCntPush}</td>
							<td>${voList.mauCntGeo}</td>
							<td>${voList.mauCntBle}</td>
						
						</tr>
					
					</c:forEach>
					
				</tbody>
				
			</table>
			<!--//합집합 현황-->

			<h4>
				교집합 현황 <span class="floatR expTb">※ T map, 11번가는 현재기준 동의가 없음.</span>
			</h4>
			<!--교집합 현황-->
			<table class="listTable tStriped tHover">
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
					<tr>
						<th rowspan="2">서비스조합</th>
						<th colspan="4">가입 고객수</th>
						<th colspan="4">Active 고객수</th>
						<th colspan="4">MAU</th>
					</tr>
					<tr>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
						<th class="depth1">전체</th>
						<th class="depth1">PUSH동의</th>
						<th class="depth1">위치동의</th>
						<th class="depth1">BLE동의</th>
					</tr>
				<tbody>
					
					<c:if test="${listVoIntersect.size() == 0}">
					
						<tr>
							<td colspan="13" class="txtC">데이터가 없습니다.</td>
					
						</tr>
					
					</c:if>

					<c:forEach items="${listVoIntersect}" var="voList" varStatus="status">
					
						<tr>
					
							<c:if test="${voList.crossSvcUnionCd == '01'}">
					
								<td class="depth2 txtC">Syrup ∩ OCB</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '02'}">
					
								<td class="depth2 txtC">Syrup ∩ OCB ∩ T map</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '03'}">
					
								<td class="depth2 txtC">Syrup ∩ OCB ∩ 11번가</td>
					
							</c:if>
					
							<c:if test="${voList.crossSvcUnionCd == '04'}">
					
								<td class="depth2 txtC">Syrup ∩ OCB ∩ T map ∩ 11번가</td>
					
							</c:if>
					
							<td class="total">${voList.scbMbrCntTot}</td>
							<td>${voList.scbMbrCntPush}</td>
							<td>${voList.scbMbrCntGeo}</td>
							<td>${voList.scbMbrCntBle}</td>
							<td class="total">${voList.actvMbrCntTot}</td>
							<td>${voList.actvMbrCntPush}</td>
							<td>${voList.actvMbrCntGeo}</td>
							<td>${voList.actvMbrCntBle}</td>
							<td class="total">${voList.mauCntTot}</td>
							<td>${voList.mauCntPush}</td>
							<td>${voList.mauCntGeo}</td>
							<td>${voList.mauCntBle}</td>
					
						</tr>
					
					</c:forEach>
				
				</tbody>
			
			</table>
			<!--//교집합 현황-->

			<input type="hidden" value="${localIP}" /> 
			<input type="hidden" value="${clientIP}" />
			
		</div>
		<!-- <style>
			.node {
			  border: solid 1px white;
			  font: 10px sans-serif;
			  line-height: 12px;
			  overflow: hidden;
			  position: absolute;
			  text-indent: 2px;
			}
		
		</style> -->

	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
			// 시럽 -> ocb -> tmap -> 11번가 -> TST
			$(document).ready(function() {
				
				$('#sub_mosu').addClass("active");
				
			});
			

			
			// d3.js start
			function dataFactory(seriesNum, perSeries, ageCase) {

				var total = [], push = [], loc = [], ble = [];

				if (ageCase == "1") { // selectAreaSexAgeList1

					total.push({
						x : Number(0),
						y : Number(49063273)
					});
					push.push({
						x : Number(0),
						y : Number(4022441)
					});
					loc.push({
						x : Number(0),
						y : Number(5599185)
					});
					ble.push({
						x : Number(0),
						y : Number(202310)
					});

					total.push({
						x : Number(1),
						y : Number(38823951)
					});
					push.push({
						x : Number(1),
						y : Number(4022441)
					});
					loc.push({
						x : Number(1),
						y : Number(3077747)
					});
					ble.push({
						x : Number(1),
						y : Number(202310)
					});

					total.push({
						x : Number(2),
						y : Number(13081001)
					});
					push.push({
						x : Number(2),
						y : Number(0)
					});
					loc.push({
						x : Number(2),
						y : Number(3586859)
					});
					ble.push({
						x : Number(2),
						y : Number(0)
					});

					total.push({
						x : Number(3),
						y : Number(19077940)
					});
					push.push({
						x : Number(3),
						y : Number(0)
					});
					loc.push({
						x : Number(3),
						y : Number(0)
					});
					ble.push({
						x : Number(3),
						y : Number(0)
					});

					total.push({
						x : Number(4),
						y : Number(17816654)
					});
					push.push({
						x : Number(4),
						y : Number(0)
					});
					loc.push({
						x : Number(4),
						y : Number(0)
					});
					ble.push({
						x : Number(4),
						y : Number(0)
					});

					total.push({
						x : Number(5),
						y : Number(19700274)
					});
					push.push({
						x : Number(5),
						y : Number(0)
					});
					loc.push({
						x : Number(5),
						y : Number(0)
					});
					ble.push({
						x : Number(5),
						y : Number(0)
					});

					return [ 
						{
							values : total,
							key : "Total    ",
							color : "#0A26B2"
						}, 
						{
							values : push,
							key : "Push",
							color : "#24B28E"
						}, 
						{
							values : loc,
							key : "  위치동의",
							color : "#92FFE3"
						}, 
						{
							values : ble,
							key : "   BLE동의",
							color : "#B25437"
						} 
					];

				}
				
			}
			
			
			
			function defaultChartConfig(containerId, data, chartOptions, options) {

				var arrName = [];
				
				arrName.push("Total");
				arrName.push("Syrup");
				arrName.push("OCB");
				arrName.push("T map");
				arrName.push("11번가");
				arrName.push("T Store");

				nv.addGraph(function() {
					
					var chart;
					
					chart = nv.models.multiBarChart().margin({
						bottom : 100,
						left : 70
					}).groupSpacing(0.1);
					
					chart.showControls(false); // 차트 구분
					
					chart.options(chartOptions);

					chart.reduceXTicks(false).staggerLabels(true);

					chart.xAxis.tickFormat(function(d, i) {
						return arrName[d];
					}).axisLabelDistance(35).showMaxMin(false);
					chart.yAxis.tickFormat(function(d, i) {
						return d;
					}).axisLabelDistance(-5);

					d3.select('#' + containerId + ' svg').attr("height", "400px").datum(data).call(chart);
					
					return chart;
					
				});
				
			}
			// dataFactory :
			// 첫번째 인자 : x축 바 갯수
			// 두번째 인자 : x축 바 그룹갯수
			defaultChartConfig("chart1", dataFactory(4, 10, 1), {
				delay : 0,
				transitionDuration : 0,
				groupSpacing : 0.1
			}, 1);
			
			sankey_chart();
			
			treeMap();
			
			
			
			function treeMap(){
				
				var margin = {top: 40, right: 10, bottom: 10, left: 10},
			    width = 960 - margin.left - margin.right,
			    height = 500 - margin.top - margin.bottom;

				var color = d3.scale.category20c();
	
				var treemap = d3.layout.treemap()
				    .size([width, height])
				    .sticky(true)
				    .value(function(d) { return d.size; });
	
				var div = d3.select("#chart2").append("div")
				    .style("position", "relative")
				    .style("width", (width + margin.left + margin.right) + "px")
				    .style("height", (height + margin.top + margin.bottom) + "px")
				    .style("left", margin.left + "px")
				    .style("top", margin.top + "px");
	
				d3.json("jsonTest.do", function(error, root) {
					
				if (error) throw error;
	
				var node = div.datum(root).selectAll(".node")
				      .data(treemap.nodes)
				      .enter().append("div")
				      .attr("class", "node")
				      .call(position)
				      .style("background", function(d) { return d.children ? color(d.name) : null; })
				      .text(function(d) { return d.children ? null : d.name; });
	
				d3.selectAll("input").on("change", function change() {
					
						var value = this.value === "count" ? function() { return 1; } : function(d) { return d.size; };
		
					    node.data(treemap.value(value).nodes)
					        .transition()
					        .duration(1500)
					        .call(position);
					    
					});
				  
				});
				
			}
						
			
			
			function position() {
				
			  this.style("left", function(d) { return d.x + "px"; })
			      .style("top", function(d) { return d.y + "px"; })
			      .style("width", function(d) { return Math.max(0, d.dx - 1) + "px"; })
			      .style("height", function(d) { return Math.max(0, d.dy - 1) + "px"; });
			}
			
			
			
			function sankey_chart() {
				
				var units = "Widgets";
				 
				var margin = {top: 10, right: 10, bottom: 10, left: 10},
				    width = 1200 - margin.left - margin.right,
				    height = 740 - margin.top - margin.bottom;
				 
				var formatNumber = d3.format(",.0f"),    // zero decimal places
				    format = function(d) { return formatNumber(d) + " " + units; },
				    color = d3.scale.category20();
				 
				// append the svg canvas to the page
				var svg = d3.select("#chart").append("svg")
				    .attr("width", width + margin.left + margin.right)
				    .attr("height", height + margin.top + margin.bottom)
				    .append("g")
				    .attr("transform", 
				          "translate(" + margin.left + "," + margin.top + ")");
				 
				// Set the sankey diagram properties
				var sankey = d3.sankey()
				    .nodeWidth(36)
				    .nodePadding(10)
				    .size([width, height]);
				 
				var path = sankey.link();
				 
				// load the data
				d3.json("../resources/data/sankeygreenhouse.json", function(error, graph) {
				 
				    var nodeMap = {};
				    graph.nodes.forEach(function(x) { nodeMap[x.name] = x; });
				    graph.links = graph.links.map(function(x) {
				    	
				      return {
				    	  
				        source: nodeMap[x.source],
				        target: nodeMap[x.target],
				        value: x.value
				        
				      };
				      
				    });
				 
				    sankey
				      .nodes(graph.nodes)
				      .links(graph.links)
				      .layout(32);
				 
				    // add in the links
				    var link = svg.append("g").selectAll(".link")
				      .data(graph.links)
				      .enter().append("path")
				      .attr("class", "link")
				      .attr("d", path)
				      .style("stroke-width", function(d) { return Math.max(1, d.dy); })
				      .sort(function(a, b) { return b.dy - a.dy; });
				 
				    // add the link titles
				    link.append("title").text(function(d) {
				      	return d.source.name + " → " + d.target.name + "\n" + format(d.value);
				    });
				 
				    // add in the nodes
				    var node = svg.append("g").selectAll(".node")
				       .data(graph.nodes)
				       .enter().append("g")
				       .attr("class", "node")
				       .attr("transform", function(d) { 
						  return "translate(" + d.x + "," + d.y + ")"; }
				       )
				       .call(d3.behavior.drag()
				       .origin(function(d) { return d; })
				       .on("dragstart", function() { 
						  this.parentNode.appendChild(this); }
				       )
				       .on("drag", dragmove));
				 
				       // add the rectangles for the nodes
				      node.append("rect")
				           .attr("height", function(d) { return d.dy; })
				      	   .attr("width", sankey.nodeWidth())
				           .style("fill", function(d) { 
						       return d.color = color(d.name.replace(/ .*/, "")); }
				           )
				           .style("stroke", function(d) { 
						       return d3.rgb(d.color).darker(2); }
				           )
				    	   .append("title")
				      	   .text(function(d) { 
						       return d.name + "\n" + format(d.value); }
				      	   );
				 
					  // add in the title for the nodes
					  node.append("text")
					      .attr("x", -6)
					      .attr("y", function(d) { return d.dy / 2; })
					      .attr("dy", ".35em")
					      .attr("text-anchor", "end")
					      .attr("transform", null)
					      .text(function(d) { return d.name; })
					      .filter(function(d) { return d.x < width / 2; })
					      .attr("x", 6 + sankey.nodeWidth())
					      .attr("text-anchor", "start");
				 
					  // the function for moving the nodes
					  function dragmove(d) {
					    d3.select(this).attr("transform", 
					        "translate(" + (
					        	   d.x = Math.max(0, Math.min(width - d.dx, d3.event.x))
					        	) + "," + (
					                   d.y = Math.max(0, Math.min(height - d.dy, d3.event.y))
					            ) + ")");
					    sankey.relayout();
					    link.attr("d", path);
					  }
					
				});
				
			}
			
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>