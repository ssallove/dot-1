<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"
%><tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="stylesheet">
	
	<style type="text/css">

	</style>
	
	</tiles:putAttribute>

	<tiles:putAttribute name="content">


	<!-- main-container -->
		<section >
        	<p class="agreement"><img src="<c:url value="/resources/images/agreement_img.jpg"/>"  title="업종 상단 이미지"/></p>
			<div class="container mb100">
			<h1>Overview</h1>
                
                
                
                <h2>서비스별 가입자 현황</h2>
                <!--Tab Layout-->
                <div class="tab_content inTabLy ">
                	<%--
                	<p class="btSpace"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스 조합별 교차 고객 현황</button></p>
                	--%>
                	<!--TAB-->
					<ul class="tabSty">
      					<li class=" active"><a href="#mbrStatBySvcBarChartTab"  data-toggle="tab"><p class="ico"></p>Chart</span></a></li>
                        <li><a href="#mbrStatBySvcTableTab"  data-toggle="tab"><p class="ico"></p>Table</a></li>
      				</ul>
                    <!--//TAB-->
                    <!--TAB Contents-->
                	<div class="tab_content">
                    
                    	<!--TAB Chart 1-->
						<div class="tab_paneLy active" id="mbrStatBySvcBarChartTab">
						    <div class="layoutLR"> 
						        <li class="floatL in_pane" style="width:100%;" id="mbrStatBySvcBarChart"></li>
						        <p><strong>* 전국민 : 통계청, 2010년 인구주택 총조사 기준</strong></p>
						    </div>
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="mbrStatBySvcTableTab">
                        	<p class="expTb mt20">※ 전국민 : 통계청, 2010년 인구주택 총조사 기준</p>
                        	<table class="listTB tStriped" id="mbrStatBySvcTable">
                            	<colgroup>
                                	<col width="*">
                                	<col width="38%">
                                	<col width="37%">
                                	<col width="37%">
                            	</colgroup>
    							<thead>
        							<tr>
           								<th>&nbsp;</th>
            							<th>고객수</th>
            							<th>비율</th>
            						</tr>
    							</thead>
                            	<tbody>
								</tbody>
							</table>
                        </div>
                    </div>
                    <!--//TAB Contents-->
				 </div>
                <!---//Tab Layout-->
                
                
                
                <h2>서비스별 Coverage</h2>
                <!--Tab Layout-->
                <div class="tab_content inTabLy ">
                	<%--
                	<p class="btSpace"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스 조합별 교차 고객 현황</button></p>
                	--%>
                	<!--TAB-->
					<ul class="tabSty">
      					<li class=" active"><a href="#ocbCoverageChartTab"  data-toggle="tab"><p class="ico"></p>Chart</span></a></li>
                        <li><a href="#ocbCoverageTableTab"  data-toggle="tab"><p class="ico"></p>Table</a></li>
      				</ul>
                    <!--//TAB-->
                    <!--TAB Contents-->
                	<div class="tab_content">
                    
                    	<!--TAB Chart 1-->
						<div class="tab_paneLy active" id="ocbCoverageChartTab" >
						
						    <div class="layoutLR">
						    	<!-- 왼쪽 챠트영역-->
						    	<div class="floatL in_pane" style="width:54%;" id="ocbCoveragePieChart"></div>
						        <!--오른쪽  챠트영역-->
						        <div class="floatR in_pane" style="width:45%;" id="tmapCoveragePieChart"></div>
						        <p class="floatL" style="width:54%;">
						        	<strong>
						        	* 캐쉬백 가입율 = 캐쉬백 가입자 / 전국국민
						        	<br/>
						        	** 전국민 : 통계청, 2010년 인구주택 총조사 기준
						        	</strong>
						        </p>
						        <p class="floatR" style="width:45%;"><strong id="tmapCoverageChartComment"></strong></p>
						    </div>
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="ocbCoverageTableTab" >
                        
							<div class="floatL" style="width:33%;">
								<h3>캐쉬백 가입자 현황 </h3>
								<p class="expTb">※ 전국민 : 통계청, 2010년 인구주택 총조사 기준</p>
	                        	<table class="listTB tStriped tBorderBlue" id="ocbCoverageTable">
	                            	<colgroup>
	                                	<col width="*">
	                                	<col width="40%">
	                                	<col width="40%">
	                            	</colgroup>
	                            	<tbody>
									</tbody>
								</table>
							</div>
							
							<div class="floatL mt50" style="width:100%;">
                        
	                        	<div class="floatL" style="width:33%;">
		                        	<h3>운전고객 대비 T-Map 이용자 현황</h3>
		                        	<p class="expTb">※ 차량등록대수 : 국토교통부, '15년 6월 기준</p>
		                        	<table class="listTB tStriped tBorderBlue tmapCoverageTable">
		                            	<colgroup>
		                                	<col width="*">
		                                	<col width="40%">
		                                	<col width="40%">
		                            	</colgroup>
		                            	<tbody>
										</tbody>
									</table>
								</div>
								
								<div class="floatL" style="width:32%;margin-left:1%;">
									<h3>운전면허 소지자 중 T-Map 이용자 현황</h3>
		                        	<p class="expTb">※ 운전면허 소지자 : 경찰청, 2014년말 기준</p>
		                        	<table class="listTB tStriped tBorderBlue tmapCoverageTable">
		                            	<colgroup>
		                                	<col width="*">
		                                	<col width="40%">
		                                	<col width="40%">
		                            	</colgroup>
		                            	<tbody>
										</tbody>
									</table>
								</div>
								
								<div class="floatR" style="width:33%;">
									<h3>택시 운전자 고객 중 T-Map 택시 운전기사 가입현황</h3>
		                        	<p class="expTb">※ 택시 운전자수 : 전국택시운송사업조합연합회, '15년 6월기준</p>
		                        	<table class="listTB tStriped tBorderBlue tmapCoverageTable">
		                            	<colgroup>
		                                	<col width="*">
		                                	<col width="40%">
		                                	<col width="40%">
		                            	</colgroup>
		                            	<tbody>
										</tbody>
									</table>
								</div>
							
							</div>
							
                        </div>
                    </div>
                    <!--//TAB Contents-->
				 </div>
                <!---//Tab Layout-->  
                
                
                
                <h2>서비스별 3개월 Active 고객데모</h2>
                <!--Tab Layout-->
                <div class="tab_content inTabLy ">
                	<%--
                	<p class="btSpace"><button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스 조합별 교차 고객 현황</button></p>
                	--%>
                	<!--TAB-->
					<ul class="tabSty">
      					<li class=" active"><a href="#mbrDemoBySvcChartTab"  data-toggle="tab"><p class="ico"></p>Chart</span></a></li>
                        <li><a href="#mbrDemoBySvcTableTab"  data-toggle="tab"><p class="ico"></p>Table</a></li>
      				</ul>
                    <!--//TAB-->
                    <!--TAB Contents-->
                	<div class="tab_content">
                    
                    	<!--TAB Chart 1-->
						<div class="tab_paneLy active" id="mbrDemoBySvcChartTab" >
						
						    <div class="layoutLR">
						    	<!-- 왼쪽 챠트영역-->
						        <li class="floatL in_pane" style="width:49%;" id="mbrDemoBySvcRadarChart"></li>
						        <!--오른쪽  챠트영역-->
						        <li class="floatR in_pane" style="width:50%;" id="mbrDemoBySvcBarChart"></li>
						    </div>
						    
						    <p><strong>* 경제활동 인구 : 통계청, 15년 7월 기준</strong></p>
						    
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="mbrDemoBySvcTableTab" >
                        
                        	<div>
	                        	<h3>연령별 비율</h3>
	                        	<p class="expTb">※ 경제활동 인구 : 통계청, 15년 7월 기준</p>
	                        	<table class="listTB tStriped" id="mbrDemoBySvcAgeTable">
	                            	<colgroup>
	                                	<col width="*">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                            	</colgroup>
	                            	<thead>
	                            	</thead>
	                            	<tbody>
									</tbody>
								</table>
							</div>
							
							<div class="mt30">
								<h3>성별 비율</h3>
								<p class="expTb">※ 경제활동 인구 : 통계청, 15년 7월 기준</p>
	                        	<table class="listTB tStriped" id="mbrDemoBySvcGenderTable">
	                            	<colgroup>
	                                	<col width="*">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                                	<col width="11%">
	                            	</colgroup>
	                            	<thead>
	                            	</thead>
	                            	<tbody>
									</tbody>
								</table>
							</div>
							
                        </div>
                    </div>
                    <!--//TAB Contents-->
				 </div>
                <!---//Tab Layout-->  
                
                
                
            </div>
		</section>
		<!--// main-container-->
	
	</tiles:putAttribute>
	
	
	<tiles:putAttribute name="javascript.footer">
	
	<script type="text/javascript">
	
	function getPercentile(value, value100P){
		return Math.round(value / value100P * 10000) / 100;
	}
	
	//[삭제대상, 고객수]
	var mbrStatBySvcData = {
		'전국민'       : [0,       48357370],
		'OCB'          : [5780762, 30943787],
		'Syrup Wallet' : [1000000, 12724904],
		'T-Map'        : [1000000, 10107949],
		'11st'         : [7207999, 11168644],
		'T-Store'      : [6500000, 17500000]
	};
	
	var mbrStatBySvcLabels = $.map(mbrStatBySvcData, function(val, label){ return label; });
	var mbrStatBySvc100P = mbrStatBySvcData['전국민'][1];
	
	var mbrStatBySvcBarChart = null;
	
	var tmapCoverageBase = ['등록 차량', '운전면허 소지자', '택시 운전자'];
	// tmapCoverageBase 순
	var tmapCoverageData = {
		'T-Map 사용' : [10107949, 10107949, 24576],
		'미사용'     : [10440930, 19436296, 256955]
	};
	
	var taxiLicenseTotal = 254830;
	
	var tmapCoverageLabels = $.map(tmapCoverageData, function(val, label){ return label; });
	var tmapCoverageSum = [0, 0, 0];
	$.each(tmapCoverageData, function(label){ 
		tmapCoverageSum[0] += tmapCoverageData[label][0];
		tmapCoverageSum[1] += tmapCoverageData[label][1];
		tmapCoverageSum[2] += tmapCoverageData[label][2];
	});
	
	var tmapCoverageChartTitle = [
		{ text : '운전고객 대비 T-Map 이용자 현황', subtext : '전국 자동차기준으로 보았을때 T-Map이용은 '+ getPercentile(tmapCoverageData[tmapCoverageLabels[0]][0], tmapCoverageSum[0]) +'%로 나타남' },
		{ text : '운전면허 소지자 중 T-Map 이용자 현황', subtext : '운전면허 소지자중 T-Map이용율는 '+ getPercentile(tmapCoverageData[tmapCoverageLabels[0]][1], tmapCoverageSum[1]) +'%로 나타남'},
		{ text : '택시 운전자 고객 중 T-Map 택시 운전기사 가입현황', subtext : '택시 운전기사중 '+ getPercentile(tmapCoverageData[tmapCoverageLabels[0]][2], tmapCoverageSum[2]) +'%가 T-Map 택시 앱을 사용하고 있음. '}
	]
	var tmapCoverageChartComment = [
		['* T-Map 이용율 = T-Map 이용자수 / 전국 차량등록대수', '** 차량등록대수 : 국토교통부, \'15년 6월 기준'],
		['* T-Map 이용율 = T-Map 이용자수 / 전국 운전면허 소지자 수', '** 운전면허 소지자 : 경찰청, 2014년말 기준'],
		['* T-Map 택시드라이버 = T-Map 드라이버 수 / 택시 운전자수', '** 택시 운전자수 : 전국택시운송사업조합연합회, \'15년 6월기준']
	]
	
	var tmapCoveragePieChart = null;
	
	var ocbCoverageData = {
		overall : {
			'캐쉬백 가입자 전체' : 30943787,
			'미가입'             : 15265318
		},
		app     : {
			'App 가입'           : 4296580,
			'App 미가입'         : 28795472
		}
	}
	var ocbCoverageLabels = {}, ocbCoverageSum = {}
	for(var k in ocbCoverageData){
		
		ocbCoverageLabels[k] = $.map(ocbCoverageData[k], function(val, label){ return label; })
		ocbCoverageSum[k] = 0;
		$.each(ocbCoverageData[k], function(label, value){ 
			ocbCoverageSum[k] += value;
		});		
		
	}
		
	var ocbCoveragePieChart = null;
	
	var eapByAge = {
		'10대'      : 329000,
		'20대'      : 4113000,
		'30대'      : 5872000,
		'40대'      : 6845000,
		'50대'      : 6212000,
		'60대 이상' : 3933000
	};
	
	var mbrDemoBySvcAgeData = {
		'경제활동인구'       : $.map(eapByAge, function(val, label){ return val; }),
		'Syrup Wallet' : [147720, 1291207, 1762855, 1127385, 419238, 133586],
		'OCB App'      : [25457,  376159,  910518,  648691,  206693, 55459 ],
		'11st'         : [108125, 1287479, 2209587, 1246648, 339159, 111302]
	};
	var mbrDemoBySvcAgeLabels = $.map(mbrDemoBySvcAgeData, function(val, label){ return label; });
	var mbrDemoBySvcAgeRate = {}, mbrDemoBySvcAgeSum = {}, mbrDemoBySvcAgeRateMax = 0;
	$.each(mbrDemoBySvcAgeLabels, function(i, label){
		
		var tot = 0;
		$.each(mbrDemoBySvcAgeData[label], function(i, val){ tot += val; });
		
		mbrDemoBySvcAgeSum[label] = tot;
		mbrDemoBySvcAgeRate[label] = $.map(mbrDemoBySvcAgeData[label], function(val, j){ return  getPercentile(val, tot); });
		
		var _max = Math.ceil(mbrDemoBySvcAgeRate[label].max());
		
		if(_max > mbrDemoBySvcAgeRateMax)
			mbrDemoBySvcAgeRateMax = _max;
		
	});
	
	mbrDemoBySvcAgeRateMax = Math.ceil(mbrDemoBySvcAgeRateMax / 10) * 10;
	
	//[여성,남성]
	var mbrDemoBySvcGenderData = {
		'경제활동인구'       : [11568000, 15736000],
		'Syrup Wallet' : [2968688,  1913303 ],
		'OCB App'      : [1202437,  1020540 ],
		'11st'         : [2758126,  2548385 ]
	};
	var mbrDemoBySvcGenderRate = {};
	$.each(mbrDemoBySvcGenderData, function(label, data){
		var total = data[0] + data[1];
		mbrDemoBySvcGenderRate[label] = [getPercentile(data[0], total), getPercentile(data[1], total)];
	});	
	var mbrDemoBySvcGenderLabels = $.map(mbrDemoBySvcGenderData, function(val, label){ return label; });
	
	var mbrDemoBySvcRadarChart = null;
	var mbrDemoBySvcBarChart = null;
		
	$(function() {
		
		//서비스별 가입자 현황
		for(var i = 0, end = mbrStatBySvcLabels.length, tbody = $('#mbrStatBySvcTable tbody') ; i < end ; i++){
			
			var tRow = $('<tr></tr>'), tCell = null;
			
			tRow.append(tCell = $('<td>'+ mbrStatBySvcLabels[i] +'</td>'));
			
			tCell.addClass('depth2').addClass('txtC');
			
			tRow.append(tCell = $('<td>'+ formatCurrency(mbrStatBySvcData[mbrStatBySvcLabels[i]][1]) +'</td>'));
			tRow.append(tCell = $('<td>'+ getPercentile(mbrStatBySvcData[mbrStatBySvcLabels[i]][1], mbrStatBySvc100P) +'%</td>'));
			
			tCell.addClass('total');
			
			tbody.append(tRow);
			
		}
		
		$('#mbrStatBySvcTable tbody > tr:last').addClass('last');
		
		mbrStatBySvcBarChart = echarts.init($('#mbrStatBySvcBarChart')[0], GV_CHART_THEME);
		mbrStatBySvcBarChart.setOption({
			/*
		    title : {
				text: 'Title - 8/20 오후 결정',
				subtext: 'Sub - 8/20 오후 결정',
				itemGap : 10
		    },
		    */
		    backgroundColor : '#fff',
		    tooltip : {
				trigger: 'axis',
				formatter:function(p){ 
				    if(p.length > 1){
						return p[0][1] + "<br/>" +
						       p[0][0] + " : " + formatCurrency(p[0].value) + "<br>" +
						       p[1][0] + " : " + getPercentile(p[1].value, mbrStatBySvc100P) +'% <br>';
				    } else {
						return p[0][1] + "<br/>";
				    }
				},
				axisPointer:{
				    show: true,
				    type : 'shadow'
				},
		    },
		    legend: {
				y : 25,
				data:['고객수','비율']
		    },
		    grid: {
				y : 80,
				y2 : 25,
				x2 : 20
		    },
		    calculable : true,
		    xAxis : [
				{
				    type : 'category',
				    data : mbrStatBySvcLabels
				},
				{
				    type : 'category',
				    axisLine: {show:false},
				    axisTick: {show:false},
				    axisLabel: {show:false},
				    splitArea: {show:false},
				    splitLine: {show:false},
				    data : mbrStatBySvcLabels
				}
		    ],
		    yAxis : [
				{
				    position : 'left',
				    type : 'value',
				    axisLabel : {formatter:function(p) { return p / 1000 +' 만명';}}
				},
		    ],
		    series : [
				{
				    name:'고객수',
				    type:'bar',
				    barWidth : 55,
				    itemStyle: {
				    	normal: {
				    		color:'rgba(252,206,16,1)', 
				    		label:{
				    			position : 'inside',
				    			show:true,
				    			formatter:function(p){ return Math.round( (p.value/10000) ) + "만"; },
				    			textStyle:{
				    				color:'rgba(76,76,76,0.8)'
				    			}
				    		}
						}
				    },
				    data : $.map(mbrStatBySvcData, function(val, label){ return val[1]; })
				},
				{
				    name:'비율',
				    type:'line',
				    itemStyle: {
				    	normal: {
				    		color:'#FF8383', 
				    		label : {
				    			show: true,
				    			formatter:function(p){ return p.value > 0 ? (getPercentile(p.value, mbrStatBySvc100P) +'%') : '';}
					    	},
					    	labelLine : {
					    		show : true
					    	},
					    	lineStyle: {
					    		width : 2.5
					    	}
						}
				    },
				    data : $.map(mbrStatBySvcData, function(val, label){ return val[1]; })
				}
		    ]
		});
		
		
		
		//서비스별 Coverage
		$('#tmapTaxiCoverageTable tbody').html(
			'<tr><td class="depth2 txtC">택시 등록대수</td><td>'+ formatCurrency(taxiLicenseTotal) +'</td><td></td></tr>'+
			'<tr><td class="depth2 txtC">택시 운전자수</td><td>'+ formatCurrency(tmapCoverageSum[2]) +'</td><td></td></tr>'
		);
		
		for(var i = 0, 
				end = tmapCoverageLabels.length, 
				tbodies = $('.tmapCoverageTable tbody') ; i < end ; i++){
			
			tbodies.each(function(k, _tbody){
			
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ tmapCoverageLabels[i] +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				tRow.append(tCell = $('<td>'+ formatCurrency(tmapCoverageData[tmapCoverageLabels[i]][k]) +'</td>'));
				tRow.append(tCell = $('<td>'+ getPercentile(tmapCoverageData[tmapCoverageLabels[i]][k], tmapCoverageSum[k]) +'%</td>'));
				
				tCell.addClass('total');
				
				$(_tbody).append(tRow);
			
			});
			
		}
		
		$.each(ocbCoverageLabels, function(k, labels){
			
			for(var i = 0, end = labels.length, tbody = $('#ocbCoverageTable tbody') ; i < end ; i++){
				
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ labels[i] +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				tRow.append(tCell = $('<td>'+ formatCurrency(ocbCoverageData[k][labels[i]]) +'</td>'));
				tRow.append(tCell = $('<td>'+ getPercentile(ocbCoverageData[k][labels[i]], ocbCoverageSum[k]) +'%</td>'));
				
				tCell.addClass('total');
				
				tbody.append(tRow);
				
			}
			
		});
		
		{
			
			var labelStyle = {};
			
			labelStyle[tmapCoverageLabels[0]] = {
				normal : {
					label : {
						show : true,
						position : 'center',
						formatter : function(params){

							return params.seriesName;
							
						},
						textStyle : {
							fontWeight : "bold",
							fontSize : 16,
							baseline : 'bottom'
						}
					},
					labelLine : {
						show : false
					}
				}
			};
			
			labelStyle[tmapCoverageLabels[1]] = {
				normal : {
					color : '#ccc',
					label : {
						show : true,
						position : 'center',
						formatter : function(params){
							
							var i = tmapCoverageBase.indexOf(params.seriesName);
							
				            return getPercentile(tmapCoverageData[tmapCoverageLabels[0]][i], tmapCoverageSum[i]) + '%';
				            
						},
						textStyle : {
							color : '#333',
							fontWeight : "bold",
							fontSize : 14,
							baseline : 'top'
						}
					},
					labelLine : {
						show : false
					}
				}
			};
			
			tmapCoveragePieChart = echarts.init($('#tmapCoveragePieChart')[0], GV_CHART_THEME);
			tmapCoveragePieChart.setOption({
		        timeline : {
		            x : '10%',
		            y : 430,
		            width : '80%',
		            autoPlay : true,
		            playInterval : 5000,
		            symbolSize : 7,
		            type : 'number',
		            data : tmapCoverageBase
		        },
		        options : [
		            {
		                title : {
		                    text : '',
		                    subtext : '',
		                    itemGap : 10
		                },
		                backgroundColor : '#fff',
		                tooltip : {
		                    trigger: 'item',
		                    formatter: "{a} <br/>{b} : {c} ({d}%)"
		                },
		                legend: {
		                    y : 70,
		                    data : tmapCoverageLabels,
		                    selectedMode : false
		                },
		                series : [
		                    {
		                        name : tmapCoverageBase[0],
		                        type : 'pie',
		                        center : ['50%', '52%'],
		                        radius : [70, 145],
		                        data : $.map(tmapCoverageData, function(val, label){ return {value: val[0],  name:label, itemStyle : labelStyle[label]}; }),
		                    }
		                ]
		            },
		            {
		                series : [
		                    {
		                        name : tmapCoverageBase[1],
		                        type : 'pie',
		                        //center : ['50%', 260],
		                        //radius : [60, 145],
		                        data : $.map(tmapCoverageData, function(val, label){ return {value: val[1],  name:label, itemStyle : labelStyle[label]}; }),
		                    }
		                ]
		            },
		            {
		                series : [
		                    {
		                        name : tmapCoverageBase[2],
		                        type : 'pie',
		                        //center : ['50%', 260],
		                        //radius : [60, 145],
		                        data : $.map(tmapCoverageData, function(val, label){ return {value: val[2],  name:label, itemStyle : labelStyle[label]}; }),
		                    }
		                ]
		            }
		        ]
			});
			
			setTextTmapCoverage(0);
			
			tmapCoveragePieChart.on(echarts.config.EVENT.TIMELINE_CHANGED, function(params){
				
				setTextTmapCoverage(params.currentIndex);
			
	        });
			
			labelStyle[ocbCoverageLabels.overall[1]] = {
				normal : $.extend(true, {}, labelStyle[tmapCoverageLabels[1]].normal)
			}
			labelStyle[ocbCoverageLabels.overall[1]].normal.label.formatter = getPercentile(ocbCoverageData.overall[ocbCoverageLabels.overall[0]], ocbCoverageSum.overall) + '%';
			
			var ocbCoveragePieChartOption = {
				title : {
				    text: '캐쉬백 가입자 현황 ',
				    subtext: '전국민 중 캐쉬백 가입자는 67.2%이며, 이중 13%만 앱을 사용하고 있음',
				    itemGap : 10
				},
				backgroundColor : '#fff',
				tooltip : {
				    trigger: 'item',
				    formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					y : 70,
				    data : ocbCoverageLabels.overall,
				    selectedMode : false
				},
	            grid : {
	                borderColor : '#fff',
	                x : '53%',
	                y : 105,
	                height : 270
	            },
	            xAxis : [
                     {   
                         type : 'category',
                         axisLine: {show : false},
                         axisTick: {show: false},
                         data : ['OCB App 가입현황']
                     }
                ],
                yAxis : [
                    {
                        show : false,
                        type : 'value',
                    }
                ],
				series : [
				    {
				        name:'OCB',
				        type:'pie',
				        center: ['30%', 260],
				        radius: [70, 145],
				        itemStyle : {
				        	normal : {
				                color: '#FF7171',
				                label : {
				                    show : true,
				                    position : 'center',
				                    formatter : "{a}",
				                    textStyle: {
				                        fontWeight : "bold",
				                        fontSize : 16,
				                        baseline : 'bottom'
				                    }
				                },
				                labelLine : {
				                    show : false
				                }
				        	}
				        },
				        data : $.map(ocbCoverageData.overall, function(val, label){ return {value:val,  name:label, itemStyle : labelStyle[label]}; })
				    }
				]
			};
			
			$.each(ocbCoverageData.app, function(label, value){
				
				ocbCoveragePieChartOption.series.push({
			    	name : label,
			    	type : 'bar',
			    	stack : 'app',
			    	barWidth : 50,
			    	tooltip : {show : false},
			    	itemStyle : {
			            normal : {
			                label : {
			                    show : true,
			                    position : 'right',
			                    formatter : label +" ("+ getPercentile(value, ocbCoverageSum.app) +"%)",
			                    textStyle: {
			                        fontSize : 12,
			                    }
			                }
			            }
			    	},
	                data : [value]
				});
				
			});
			
			ocbCoveragePieChart = echarts.init($('#ocbCoveragePieChart')[0], GV_CHART_THEME);
			ocbCoveragePieChart.setOption(ocbCoveragePieChartOption);
			
			ocbCoveragePieChart.on(echarts.config.EVENT.RESIZE, function(param){
				
				markLineOcbCoverage();
			
	        });
			
			markLineOcbCoverage();
		
		}
		
		
		
		//서비스별 고객데모
		{
			var tRow = $('<tr><th>&nbsp;</th></tr>');
			
			$.each(mbrDemoBySvcAgeLabels, function(k, labels){
				
				tRow.append($('<th colspan="2">'+ labels +'</th>'));
				
			});
			
			$('#mbrDemoBySvcAgeTable thead').append(tRow);
			
		}
		
		{
			
			var i = 0;
			var tbody = $('#mbrDemoBySvcAgeTable tbody');
			
			$.each(eapByAge, function(label, value){
				
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ label +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				$.each(mbrDemoBySvcAgeData, function(label, data){
					
					tRow.append(tCell = $('<td>'+ formatCurrency(data[i]) +'</td>'));
					tRow.append(tCell = $('<td class="total">'+ mbrDemoBySvcAgeRate[label][i] +'%</td>'));
					
				});
				
				tbody.append(tRow);
				
				i++;
				
			});
		
		}
		
		{
			var tRow = $('<tr><th>&nbsp;</th></tr>');
			
			$.each(mbrDemoBySvcGenderLabels, function(k, labels){
				
				tRow.append($('<th colspan="2">'+ labels +'</th>'));
				
			});
			
			$('#mbrDemoBySvcGenderTable thead').append(tRow);
			
		}
		
		{
			
			var tbody = $('#mbrDemoBySvcGenderTable tbody');
			
			$.each(['여성', '남성'], function(i, label){
				
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ label +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				$.each(mbrDemoBySvcGenderData, function(label, data){
					
					tRow.append(tCell = $('<td>'+ formatCurrency(data[i]) +'</td>'));
					tRow.append(tCell = $('<td class="total">'+ mbrDemoBySvcGenderRate[label][i] +'%</td>'));
					
				});
				
				tbody.append(tRow);
				
			});
			
		}
		
		mbrDemoBySvcRadarChart = echarts.init($('#mbrDemoBySvcRadarChart')[0], GV_CHART_THEME);
		mbrDemoBySvcRadarChart.setOption({
			title : {
				text : '연령별 비율',
				subtext : '경제활동 인구 대비 당사의 서비스는 2/30대가 많이 사용하는 것으로 나타남',
				itemGap : 10
			},
			backgroundColor : '#fff',
			tooltip : {
				trigger : 'axis',
				formatter : function(params, ticket, callback){	

       	        	var tooltipStr =  '<table><summary>'+ params[0].indicator +'</summary><tbody>';
       	        	
       	        	for(var i = 0, end = params.length ; i < end ; i++){
       	        		
       	        		var param = params[i];
       	        		
       	        		tooltipStr += ('<tr><th>'+ param.name +'</th><td style="padding-left:5px;">'+ param.value +'%</td></tr>');
       	        		
       	        	}
       	        	
       	        	return tooltipStr += '</tbody></table>';
					
				},
				axisPointer : {
					show : true,
					type : 'shadow'
				},

			},
			legend : {
				y : 70,
				x : 'center',
				data : mbrDemoBySvcAgeLabels
			},
			polar : [ 
				{
					indicator : $.map(eapByAge, function(val, label){ return { text : label, max : mbrDemoBySvcAgeRateMax } }),
					radius : 170,
					center : ['50%', '60%']
				} 
			],
			calculable : true,
			series : [ 
				{
					name : '비율',
					type : 'radar',
					data : $.map(mbrDemoBySvcAgeRate, function(data, label){ return { value : data, name : label } })
				} 
			]
		});
		
		mbrDemoBySvcBarChart = echarts.init($('#mbrDemoBySvcBarChart')[0], GV_CHART_THEME);
		mbrDemoBySvcBarChart.setOption({
			title : {
				text : '성별 비율',
				subtext : '경제활동 인구 대비 당사의 서비스는 여성고객이 많이 사용하는 것으로 나타남',
				itemGap : 10
			},
			backgroundColor : '#fff',
			tooltip : {
				trigger : 'axis',
				axisPointer : {
					show : true,
					type : 'shadow'
				},
				formatter : function(params, ticket, callback){

       	        	var tooltipStr =  '<table><summary>'+ params[0].name +'</summary><tbody>';
       	        	
       	        	for(var i = 0, end = params.length ; i < end ; i++){
       	        		
       	        		var param = params[i];
       	        		
       	        		tooltipStr += ('<tr><th>'+ param.seriesName +'</th><td style="padding-left:5px;">'+ formatCurrency(param.data.actual) +' ('+ param.value +'%)</td></tr>');
       	        		
       	        	}
       	        	
       	        	return tooltipStr += '</tbody></table>';

       	        }
			},
			grid : {
				y : 110,
				y2 : 40,
				x2 : 20
			},
			legend : {
				y : 70, 
				x : 'center',
				data : [ '여성', '남성' ]
			},
			calculable : true,
			xAxis : [ 
				{
					type : 'value'
				} 
			],
			yAxis : [ 
				{
					type : 'category',
					data : mbrDemoBySvcGenderLabels
				}
			],
			series : [ 
				{
					name : '여성',
					type : 'bar',
					barWidth : 60,
					stack : 'demo',
					itemStyle : {
						normal : {
							color : GV_GENDER_COLOR.female(),
							label : {
								show : true,
								formatter : function(v) {
									return v.value + "%";
								},
								position : 'inside'
							}
						}
					},
					data : $.map(mbrDemoBySvcGenderData, function(data, label){ return {value : mbrDemoBySvcGenderRate[label][0], actual : data[0]}; })
				}, 
				{
					name : '남성',
					type : 'bar',
					stack : 'demo',
					itemStyle : {
						normal : {
							color : GV_GENDER_COLOR.male(),
							label : {
								show : true,
								formatter : function(v) {
									return v.value + "%";
								},
								position : 'inside'
							}
						}
					},
					data : $.map(mbrDemoBySvcGenderData, function(data, label){ return {value : mbrDemoBySvcGenderRate[label][1], actual : data[1]}; })
				}
			]
		});
		
		resizeChartOnWinResizeHandler.on(
			mbrStatBySvcBarChart, 
			tmapCoveragePieChart, 
			ocbCoveragePieChart, 
			mbrDemoBySvcRadarChart, 
			mbrDemoBySvcBarChart
		);
		
	});
	
	
	
	function setTextTmapCoverage(index){
		
		tmapCoveragePieChart.setOption({ title : tmapCoverageChartTitle[index] });
		
		$('#tmapCoverageChartComment').html(tmapCoverageChartComment[index].join('<br/>'));
		
	}
	
	
	function markLineOcbCoverage(){
		
		var MARK_LINE_T = 'OCB Coverage 상단 연결선';
		var MARK_LINE_B = 'OCB Coverage 하단 연결선';
		
		var chartDom = $(ocbCoveragePieChart.getDom());
		
		var pieOuterRadius = ocbCoveragePieChart.getSeries()[0].radius[1];
		
		var marKStartX = chartDom.width() * (parseInt(ocbCoveragePieChart.getSeries()[0].center[0]) / 100);
		var marKCenterY = ocbCoveragePieChart.getSeries()[0].center[1];
		
		ocbCoveragePieChart.delMarkLine(2, MARK_LINE_T);
		ocbCoveragePieChart.delMarkLine(1, MARK_LINE_B);
		
		var defaultMarkLineOption = {
			clickable : false,
			symbol : 'circle',
			symbolSize : 1,
			tooltip : {show : false},
			itemStyle : {
				normal : {
					color : '#999',
					label : {show : false}
				},
				emphasis : {}
			}
		}
		
		ocbCoveragePieChart.addMarkLine(2, $.extend(defaultMarkLineOption, {
			data : [
				[{name : MARK_LINE_T, x : marKStartX, y : marKCenterY - pieOuterRadius}, {type : 'max'}]
			]
		}));
		
		ocbCoveragePieChart.addMarkLine(1, $.extend(defaultMarkLineOption, {
			data : [
				[{name : MARK_LINE_B, x : marKStartX, y : marKCenterY + pieOuterRadius}, {xAxis: 0, yAxis: 0}]
			]
		}));
		
	}

	</script>
	</tiles:putAttribute>
	
</tiles:insertDefinition>