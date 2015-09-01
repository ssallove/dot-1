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
						<div class="tab_paneLy active" id="mbrStatBySvcBarChartTab" >
						
						    <div class="layoutLR"> 
						        <li class="floatL in_pane" style="width:100%;" id="mbrStatBySvcBarChart"></li>
						    </div>
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="mbrStatBySvcTableTab">
                        	<p class="expTb mt20">※ 8/18일 이후</p>
                        	<table class="listTB tStriped" id="mbrStatBySvcTable">
                            	<colgroup>
                                	<col width="*">
                                	<col width="28%">
                                	<col width="28%">
                                	<col width="28%">
                            	</colgroup>
    							<thead>
        							<tr>
           								<th>&nbsp;</th>
            							<th>삭제대상</th>
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
						        <li class="floatL in_pane" style="width:45%;" id="tmapCoveragePieChart"></li>
						        <!--오른쪽  챠트영역-->
						        <li class="floatR in_pane" style="width:54%;" id="ocbCoveragePieChart"></li>
						    </div>
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="ocbCoverageTableTab" >
                        
                        	<div class="floatL" style="width:33%;">
	                        	<h3>T-Map Coverage - 일반운전자</h3>
	                        	<p class="expTb mt20">※ 15년 6월 차량 등록대수 기준</p>
	                        	<table class="listTB tStriped" id="tmapGeneralCoverageTable">
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
								<h3>T-Map Coverage - 택시기사</h3>
	                        	<p class="expTb mt20">※ 15년 5월 데이터 현황</p>
	                        	<table class="listTB tStriped" id="tmapTaxiCoverageTable">
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
								<h3>OCB Coverage</h3>
								<p class="expTb mt20">&nbsp;</p>
	                        	<table class="listTB tStriped" id="ocbCoverageTable">
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
                    <!--//TAB Contents-->
				 </div>
                <!---//Tab Layout-->  
                
                
                
                <h2>서비스별 고객데모</h2>
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
						</div>
						<!--//TAB Chart 1-->
                         
                        <!--TAB Table-->
                        <div class="tab_pane2" id="mbrDemoBySvcTableTab" >
                        
                        	<div>
	                        	<h3>BM별 연령 분포</h3>
	                        	<table class="listTB tStriped" id="mbrDemoBySvcAgeTable">
	                            	<colgroup>
	                                	<col width="*">
	                                	<col width="18%">
	                                	<col width="18%">
	                                	<col width="18%">
	                                	<col width="18%">
	                                	<col width="18%">
	                            	</colgroup>
	                            	<thead>
	                            	</thead>
	                            	<tbody>
									</tbody>
								</table>
							</div>
							
							<div class="mt30">
								<h3>BM별 성별 분포</h3>
	                        	<table class="listTB tStriped" id="mbrDemoBySvcGenderTable">
	                            	<colgroup>
	                                	<col width="*">
	                                	<col width="15%">
	                                	<col width="15%">
	                                	<col width="15%">
	                                	<col width="15%">
	                                	<col width="15%">
	                                	<col width="15%">
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
		'OCB'          : [5780762, 33092052],
		'Syrup Wallet' : [1000000, 12724904],
		'T-Map'        : [1000000, 8894678],
		'11st'         : [7207999, 11168644],
		'T-Store'      : [6500000, 17500000]
	};
	
	var mbrStatBySvcLabels = $.map(mbrStatBySvcData, function(val, label){ return label; });
	var mbrStatBySvc100P = mbrStatBySvcData['전국민'][1];
	
	var mbrStatBySvcBarChart = null;
	
	var tmapCoverageData = {
		'T-Map 사용' : {general : 8894678,  taxi : 24576},
		'미사용'     : {general : 11654201, taxi : 257405}
	};
	var taxiLicenseTotal = 254830;
	
	var tmapCoverageLabels = $.map(tmapCoverageData, function(val, label){ return label; });
	var tmapCoverageSum = {general : 0, taxi : 0};
	$.each(tmapCoverageData, function(label){ 
		tmapCoverageSum.general += tmapCoverageData[label].general;
		tmapCoverageSum.taxi += tmapCoverageData[label].taxi;
	});
	
	var tmapCoveragePieChart = null;
	
	var ocbCoverageData = {
		overall : {
			'캐쉬백 가입자 전체' : 33092052,
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
	
	var popByAge = {
		'10대'      : 11225387,
		'20대'      : 6594369,
		'30대'      : 7794495,
		'40대'      : 8204781,
		'50대'      : 6564826,
		'60대 이상' : 7973512
	};
	var totalPop = 0;
	$.each(popByAge, function(label, value){ 
		totalPop += value;
	});	
	
	var mbrDemoBySvcAgeData = {
		'전국민'       : $.map(popByAge, function(val, label){ return getPercentile(val, totalPop); }),
		'OCB'          : [3.7, 14.3, 20, 22.7, 20.6, 18.7],
		'OCB App'      : [2.7, 20.6, 39.2, 26.3, 8.7, 2.6],
		'Syrup Wallet' : [3.4, 29.1, 34.8, 21, 8.8, 3.1]
	};
	var mbrDemoBySvcAgeLabels = $.map(mbrDemoBySvcAgeData, function(val, label){ return label; });
	
	//[여성,남성,미상]
	var mbrDemoBySvcGenderData = {
		'전국민'       : [24149865, 23840896],
		'OCB App'      : [2214080, 2082386, 114],
		'Syrup Wallet' : [6599648, 5635652, 1489604]
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
			
			tRow.append(tCell = $('<td>'+ formatCurrency(mbrStatBySvcData[mbrStatBySvcLabels[i]][0]) +'</td>'));
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
						       p[0][0] + " : " + p[0].value + "<br>" +
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
				y : 45,
				data:['삭제대상','고객수','비율']
		    },
		    grid: {
				y: 100,
				y2: 25,
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
				    axisLabel:{formatter:function(p) { return p / 1000 +' 만명';}}
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
				    name:'삭제대상',
				    type:'bar',
				    barWidth : 55,
				    xAxisIndex:1,
				    itemStyle: {
				    	normal: {   
				    		color:'rgba(252,206,16,0.4)'
				    	}
				    },
				    data : $.map(mbrStatBySvcData, function(val, label){ return val[0] + val[1]; })
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
			'<tr><td class="depth2 txtC">택시 운전자수</td><td>'+ formatCurrency(tmapCoverageSum.taxi) +'</td><td></td></tr>'
		);
		
		for(var i = 0, 
				end = tmapCoverageLabels.length, 
				tbody = {general : $('#tmapGeneralCoverageTable tbody'), taxi : $('#tmapTaxiCoverageTable tbody')} ; i < end ; i++){
			
			for(var k in tbody){
			
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ tmapCoverageLabels[i] +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				tRow.append(tCell = $('<td>'+ formatCurrency(tmapCoverageData[tmapCoverageLabels[i]][k]) +'</td>'));
				tRow.append(tCell = $('<td>'+ getPercentile(tmapCoverageData[tmapCoverageLabels[i]][k], tmapCoverageSum[k]) +'%</td>'));
				
				tCell.addClass('total');
				
				tbody[k].append(tRow);
			
			}
			
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
							fontSize : 18,
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
							
				            if(params.seriesName == "일반 운전자")
				                return getPercentile(tmapCoverageData[tmapCoverageLabels[0]].general, tmapCoverageSum.general) + '%';
				            else if(params.seriesName == "택시 기사")
				                return getPercentile(tmapCoverageData[tmapCoverageLabels[0]].taxi, tmapCoverageSum.taxi) + '%';
				            
						},
						textStyle : {
							color : '#333',
							fontWeight : "bold",
							fontSize : 16,
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
		            x : '15%',
		            x2 : '80%',
		            y : 430,
		            width : '60%',
		            autoPlay : true,
		            playInterval : 5000,
		            symbolSize : 7,
		            type : 'number',
		            data : [
		                '일반 운전자', 
		                '택시 기사',
		            ]
		        },
		        options : [
		            {
		                title : {
		                    text: 'T-Map Coverage',
		                    subtext: '일반 운전자 / 택시 기사',
		                    itemGap : 10
		                },
		                backgroundColor : '#fff',
		                tooltip : {
		                    trigger: 'item',
		                    formatter: "{a} <br/>{b} : {c} ({d}%)"
		                },
		                legend: {
		                    y : 55,
		                    data : tmapCoverageLabels,
		                    selectedMode : false
		                },
		                series : [
		                    {
		                        name:'일반 운전자',
		                        type:'pie',
		                        center: ['50%', '52%'],
		                        radius: [60, 145],
		                        data : $.map(tmapCoverageData, function(val, label){ return {value: val.general,  name:label, itemStyle : labelStyle[label]}; }),
		                    }
		                ]
		            },
		            {
		                series : [
		                    {
		                        name:'택시 기사',
		                        type:'pie',
		                        center: ['50%', 260],
		                        radius: [60, 145],
		                        data : $.map(tmapCoverageData, function(val, label){ return {value: val.taxi,  name:label, itemStyle : labelStyle[label]}; }),
		                    }
		                ]
		            }
		        ]
			});
			
			labelStyle[ocbCoverageLabels.overall[1]] = {
				normal : $.extend(true, {}, labelStyle[tmapCoverageLabels[1]].normal)
			}
			labelStyle[ocbCoverageLabels.overall[1]].normal.label.formatter = getPercentile(ocbCoverageData.overall[ocbCoverageLabels.overall[0]], ocbCoverageSum.overall) + '%';
			
			var ocbCoveragePieChartOption = {
				title : {
				    text: 'OCB Coverage',
				    subtext: '전체 / App',
				    itemGap : 10
				},
				backgroundColor : '#fff',
				tooltip : {
				    trigger: 'item',
				    formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					y : 55,
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
				        radius: [60, 145],
				        itemStyle : {
				        	normal : {
				                color: '#FF7171',
				                label : {
				                    show : true,
				                    position : 'center',
				                    formatter : "{a}",
				                    textStyle: {
				                        fontWeight : "bold",
				                        fontSize : 15,
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
				
				tRow.append($('<th>'+ labels +'</th>'));
				
			});
			
			$('#mbrDemoBySvcAgeTable thead').append(tRow);
			$('th:eq(1)', tRow).attr('colspan', '2');
			
		}
		
		{
			
			var i = 0;
			var tbody = $('#mbrDemoBySvcAgeTable tbody');
			
			$.each(popByAge, function(label, value){
				
				var tRow = $('<tr></tr>'), tCell = null;
				
				tRow.append(tCell = $('<td>'+ label +'</td>'));
				
				tCell.addClass('depth2').addClass('txtC');
				
				tRow.append(tCell = $('<td class="total">'+ formatCurrency(value) +'</td>'));
				
				$.each(mbrDemoBySvcAgeData, function(label, data){
					
					tRow.append(tCell = $('<td>'+ data[i] +'%</td>'));
					
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
			
			var tRow = $(
				'<tr>'+
				'<td class="depth2 txtC">미상</td>'+
				'<td></td><td></td>'+
				'</tr>'
			);
			
			$.each(mbrDemoBySvcGenderLabels.slice(1), function(i, label){
				
				tRow.append($('<td>'+ formatCurrency(mbrDemoBySvcGenderData[label][2]) +'</td>'));
				tRow.append($('<td></td>'));
				
			});
			
			tbody.append(tRow);
			
		}
		
		mbrDemoBySvcRadarChart = echarts.init($('#mbrDemoBySvcRadarChart')[0], GV_CHART_THEME);
		mbrDemoBySvcRadarChart.setOption({
			title : {
				text : 'BM별 연령 분포',
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
				y : 60,
				x : 'center',
				data : mbrDemoBySvcAgeLabels
			},
			calculable : true,
			polar : [ 
				{
					indicator : $.map(popByAge, function(val, label){ return { text : label, max : 40 } }),
					radius : 130
				} 
			],
			calculable : true,
			series : [ 
				{
					name : 'BM별 연령분포',
					type : 'radar',
					data : $.map(mbrDemoBySvcAgeData, function(data, label){ return { value : data, name : label } })
				} 
			]
		});
		
		mbrDemoBySvcBarChart = echarts.init($('#mbrDemoBySvcBarChart')[0], GV_CHART_THEME);
		mbrDemoBySvcBarChart.setOption({
			title : {
				text : 'BM별 성별 분포',
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
				y : 100,
				y2 : 130,
				x2 : 20
			},
			legend : {
				y : 60,
				x : 'center',
				data : [ '여성', '남성' ]
			},
			calculable : true,
			xAxis : [ {
				type : 'value'
			} ],
			yAxis : [ {
				type : 'category',
				data : mbrDemoBySvcGenderLabels
			} ],
			series : [ 
				{
					name : '여성',
					type : 'bar',
					barWidth : 52,
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