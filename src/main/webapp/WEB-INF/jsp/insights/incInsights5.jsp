<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--modal-->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog2">
        <div class="modal_content2 ">
        
            <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">close</span></button>
            <p class="paper_lfBg "></p>
            <p class="paper_rgBg "></p>
            
            <div class="modal_header2">
                <h2>11번가 매출상품의 Pareto분석<span class="dottxt">11번가 매출상품의 전체/카테고리별 Pareto분석</span></h2>
                
            </div>
            
            <div class="modal_body2">
                <!--내용1-->
                <div class="news mt10">
                    <h3>최근 1년 11번가는 월평균 고객 280만명이 상품종류 130만개를 구매해 총 매출 3,750억 달성</h3>
                    <div class="layoutLR mb0">
                        <li class=" floatL boxSty newsCbox" style="width:49%;">
                            <p class="chart" id="insights5_chart_0">Chart Area</p>
                        </li>
                        <li class=" floatR boxSty newsCbox" style="width:49%">
                            <p class="chart" id="insights5_chart_1">Chart Area</p>
                        </li>
                    </div>
                        
                </div>
                <!--//내용1-->
                
                <!--내용3-->
                <div class="news mt50">
                <h3>상품 Pareto분석을 통해 매출상위상품의 매출기여도를 살펴보면 상위 1%인 13만개 상품이 전체 매출의 55% 인 2,058억원 기여<br/>
                        매출의 80%는 상위 7% 상품이 달성하며 월별 차이는 미미함 </h3>
                        <div class="layoutLR newsCbox">
                            <li class=" floatL boxSty" style="width:100%;">
                            <p class="chart" id="insights5_chart_2">Chart Area</p>
                        </li>
                        </div>
                </div>
                <!--//내용3-->
                
                 <!--내용4-->
                <div class="news mt50">
                <h3>2015년 7월의 카테고리별 상품 Pareto를 살펴보면 상위 1%상품의 매출비중이 <br/>
					- 쌀/과일/논수축산물 90%, 기저귀/분유/유아식 75%, 시계/쥬얼리/액세서리 74%, 여행/숙박/항공권 74%로 상대적으로 높고<br/>
					- 티켓/공연/전시/스포츠 15%, 수입명품 18%, 브랜드 여성의류/언더웨어 19%, 브랜드 신발/가방/잡화 26%, 브랜드 시계/쥬얼리 27% 상대적으로 낮음.<br/>
					- 이중 쌀/과일/논수축산물, 기저귀/분유/유아식 카테고리의 1인구매상품의 매출비율이 각각 90%, 43%로 Reseller로 인한 매출로 판단됨.</h3>
                    <div class="newsCbox">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights5_chart_3" style="height:468px">Chart Area</p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용4-->
                
            </div>
        </div>
     </div>
 </div>
 <!--!//modal -->
 
 
 
 
 <script>

 var incInsights5 = {
		 showInsight : function(){
			 var charts=[];
			 var myChart = echarts.init($('#insights5_chart_0')[0], GV_CHART_THEME);  this.drawChart0(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights5_chart_1')[0], GV_CHART_THEME);  this.drawChart1(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights5_chart_2')[0], GV_CHART_THEME);  this.drawChart2(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights5_chart_3')[0], GV_CHART_THEME);  this.drawChart3(myChart);   charts.push(myChart);
			 resizeChartOnWinResizeHandler.on(charts);
		 },
	        
		 cvtformat_val : function(param) {
	            return "[" + param[0][1] + "]<br/>" +
                param[0][0] + " : " + param[0][2] + "억원<br/>" +
                param[1][0] + " : " + param[1][2] + "<br/>" +
                param[2][0] + " : " + param[2][2] + "<br/>";
         } ,
		 drawChart0 : function(myChart){
			 var monthPurchData = [  ["266","271","282","278","298","268","254","290","280","282","305","307"],
		                                ["123","125","130","123","129","120","113","135","132","132","140","146"],
		                                ["3616","3695","3821","3528","4028","3438","3286","3853","3682","3688","4019","4295"] ];
			 
			 var option = {
			            title : {
			                text: '월별 11번가 매출현황',
			            },
			            tooltip : {
			                trigger : 'axis',
			                axisPointer : {            
			                    type : 'shadow'   
			                },
			                formatter : incInsights5.cvtformat_val
			            },
			            grid:{y:105, y2:20},
			            legend: {
				            y : 40
				            , x:'right'
				            , data:['총매출(억원)', '구매고객수(만)', '상품수(만)']
			            },
			            calculable : true,
			            xAxis : [
			                {
			                    type : 'category',
			                    data : function(){
			                        var list = [];
			                        for(var i = 8; i < 13; i++){
			                            var temptxt = "2014-";
			                            if(i<10) temptxt += "0";
			                            list.push(temptxt+i);
			                        }
			                        for(var i = 8; i < 13; i++){
			                            var temptxt = "2015-";
			                            if(i<10) temptxt += "0";
			                            list.push(temptxt+i);
			                        }
			                        return list;
			                    }()
			                }
			            ],
			            yAxis : [
			                {
			                    type : 'value',
			                    name : '단위: 만',
			                    
			                },
			                {
			                    type : 'value',
			                    name : '단위: 억원',
			                }
			            ],
			            series : [
			                {
			                    name:'총매출(억원)',
			                    barGap:'5%',
			                    type:'bar',
			                    yAxisIndex: 1,
			                    data: monthPurchData[2],
			                    itemStyle: {
			                      normal: {
			                        color : 'rgba(252,206,16,0.7)'
			                       },
			                    }
			                },
			                {
			                    name:'구매고객수(만)',
			                    type:'line',
			                    data: monthPurchData[0],
			                    symbolSize : 6,
			                    itemStyle: {
			                      normal: {
			                        color : "#FF8383",
			                        lineStyle: {
			                            width : 3.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                },
			                {
			                    name:'상품수(만)',
			                    type:'line',
			                    data: monthPurchData[1],
			                    symbolSize : 6,
			                    itemStyle: {
			                     normal: {
			                        lineStyle: {
			                            width : 3.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                }
			            ]
			        };
             myChart.setOption(option);
		 },
		 
		 drawChart1 : function(myChart){
			 var monthTopData = [
			                     ["56.3","56.3","55.3","53.4","54.2","54.6","55.2","54.6","54.0","54.5","54.6","56.1"],
			                     ["81.3","81.1","80.5","79.5","80.1","80.0","80.2","80.1","79.5","79.7","80.2","81.0"],
			                     ["3616","3695","3821","3528","4028","3438","3286","3853","3682","3688","4019","4295"] ];
			 
			 var option = {
			            title : {
			                text: '월별 11번가 매출상위상품 비중',
			            },
			            tooltip : {
			                trigger : 'axis',
			                axisPointer : {            
			                    type : 'shadow'   
			                },
			                formatter : incInsights5.cvtformat_val
			            },
			            grid:{y:105, y2:20},
			            legend: {
				            y : 40
				            , x:'right'
			                , data:['총매출(억원)', '상위1%비중', '상위7%비중']
			            },
			            calculable : true,
			            xAxis : [
			                {
			                    type : 'category',
			                    data : function(){
			                        var list = [];
			                        for(var i = 8; i < 13; i++){
			                            var temptxt = "2014-";
			                            if(i>9) temptxt += "0";
			                            list.push(temptxt+i);
			                        }
			                        for(var i = 8; i < 13; i++){
			                            var temptxt = "2015-";
			                            if(i>9) temptxt += "0";
			                            list.push(temptxt+i);
			                        }

			                        return list;
			                    }()
			                }
			            ],
			            yAxis : [
			                {
			                    type : 'value',
			                    axisLabel : {
			                        formatter: '{value} %'
			                    }
			                },
			                {
			                    type : 'value',
			                    name : '단위: 억원'
			                }
			            ],
			            series : [
			                {
			                    name:'총매출(억원)',
			                    barGap:'5%',
			                    type:'bar',
			                    yAxisIndex: 1,
			                    data: monthTopData[2],
			                    itemStyle: {
			                      normal: {
			                        color : 'rgba(252,206,16,0.7)'
			                       },
			                    }
			                },
			                {
			                    name:'상위1%비중',
			                    type:'line',
			                    data: monthTopData[0],
			                    symbolSize : 6,
			                    itemStyle: {
			                     normal: {
			                        color : "#FF8383",
			                        lineStyle: {
			                            width : 3.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                },
			                {
			                    name:'상위7%비중',
			                    type:'line',
			                    data: monthTopData[1],
			                    symbolSize : 6,
			                    itemStyle: {
			                     color : "#FF8383",
			                     normal: {
			                        lineStyle: {
			                            width : 3.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                }
			            ]
			        };
                 myChart.setOption(option);
		 },
		 
		 
		 
		 drawChart2 : function(myChart){
			 var monthPerProduct = [  [54.2,75.8,84.3,88.7,91.5,93.4,94.8,95.9,96.8,97.4,98.0,98.4,98.8,99.1,99.4,99.6,99.7,99.8,99.9,100.0,100.0],
		                                 [54.6,75.9,84.2,88.5,91.3,93.2,94.6,95.7,96.6,97.3,97.9,98.3,98.7,99.0,99.3,99.5,99.7,99.8,99.9,100.0,100.0],
		                                 [56.1,76.9,84.9,89.0,91.6,93.4,94.8,95.8,96.7,97.3,97.9,98.4,98.7,99.1,99.3,99.5,99.7,99.8,99.9,100.0,100.0] ];
			 var option = {
			            title : {
			                text: '월별 11번가 상품 Pareto',
			            },
			            tooltip : {
			                trigger : 'axis',
			                axisPointer : {            
			                    type : 'shadow'   
			                },
			                formatter : incInsights5.cvtformat_val
			            },
			            grid : {
			                y : 85
			            },
			            legend: {
			                y : 50,
			                data:['2014-12', '2015-03', '2015-07']
			            },
			            calculable : true,
			            xAxis : [
			                {
			                    type : 'category',
			                    data : function(){
			                        var list = ['1'];
			                        for(var i = 0; i < 101; i+=5){
			                            if(i > 1) list.push(i);
			                        }
			                        return list;
			                    }()
			                }
			            ],
			            yAxis : [
			                {
			                    type : 'value',
			                    name : '매출비중',
			                    axisLabel : {
			                        formatter: '{value} %'
			                    }
			                },
			            ],
			            series : [
			                {
			                    name:'2014-12',
			                    type:'line',
			                    symbolSize : 4,
			                    data: monthPerProduct[0],
			                    itemStyle: {
			                      normal: {
			                        lineStyle: {
			                            width : 2.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   },
			                },
			                {
			                    name:'2015-03',
			                    type:'line',
			                    data: monthPerProduct[1],
			                    symbolSize : 4,
			                    itemStyle: {
			                      normal: {
			                        lineStyle: {
			                            width : 2.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                },
			                {
			                    name:'2015-07',
			                    type:'line',
			                    data: monthPerProduct[2],
			                    symbolSize : 4,
			                    itemStyle: {
			                     normal: {
			                        color : "rgba(252,206,16,0.7)",
			                        lineStyle: {
			                            width : 2.5
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   }
			                },
			                {
			                    type:'line',
			                    data: [80],
			                    symbolSize : 0,
			                    itemStyle: {
			                     normal: {
			                        color : "rgba(0,0,0,0)",
			                        lineStyle: {
			                            width : 0
			                       },
			                       label:{
			                         show:false,
			                       }
			                     }
			                   },
			                   markLine : {
			                        data : [
			                            {type : 'max', name: 'pareto', 
			                            itemStyle: {
			                                normal: {
			                                    color:'#FF8383', 
			                                    label : {
			                                        show: true,
			                                        formatter:function(p){ 
			                                            return  '80% 지점';
			                                        }
			                                    },
			                                    labelLine : {
			                                        show : true
			                                    },
			                                    lineStyle: {
			                                        width : 2.5
			                                    }
			                                }
			                            },}
			                        ]
			                    }
			                }
			                
			            ]
			        };
		       
               myChart.setOption(option);
		                    
		 },
		 
		 drawChart3 : function(myChart){
			 var category = [];
		    var productCnt = [];
		    var allSalesPer = [];
		    var top1Per = [];

		    initData();

		    function initData(){
		        $.ajax({
		            type: "GET",
		            url: '/resources/data/insights/pareto3.csv',
		            dataType: "text",
		            success: function(data) {dataProcess(data);},
		            error: function(err){alert("err"); console.log(err)}
		        });

		    }

		    function dataProcess(data){
		        data_ = data.split("\n");
		        data_.forEach(function(entry) {
		            var entry_ = entry.split("$");
		            category.push(entry_[0]);
		            productCnt.push(entry_[3]);
		            allSalesPer.push(entry_[1]);
		            top1Per.push(entry_[2]);
		        });

		         var option = {
		            title : {
		                text: '카테고리내 상위1% 상품 매출 비중'
		            },
		            tooltip : {
		                trigger : 'axis',
		                axisPointer : {            
		                    type : 'shadow'   
		                },
		                formatter:function(p){ 
		                        return "[" + p[0][1] + "]<br/>" +
		                               p[0][0] + " : " +  Math.round( p[0].value * 100) / 100 +'개 <br>' +
		                               p[1][0] + " : " +  Math.round( p[1].value * 100) / 100 +'% <br>' +
		                               p[2][0] + " : " +  Math.round( p[2].value * 100) / 100 +'% <br>'; 
		                }
		            },
		            legend: {
		                data:['상품수(개)','카테고리 총매출비중','카테고리내 상위1% 매출비중'],
		                y : 20,
		                textStyle:{fontSize : 14}
		            },
		            grid: {
		                y : 60,
		                y2 : 180
		            },
		            xAxis : [
		                {
		                    type : 'category',
		                    data : category,
		                     axisLabel : {
		                        rotate : 90,
		                        textStyle:{
		                            fontWight : 'bold',
		                            color : '#000000',
		                            fontSize : 14
		                        }
		                    }
		                }
		            ],
		            yAxis : [
		                {
		                    type : 'value',
		                    name : '매출비중',
		                    axisLabel : {
		                        formatter: '{value} %'
		                    }
		                },
		                {   
		                    max: 350000,
		                    type : 'value',
		                    name : '총구매상품수',
		                    axisLabel : {
		                        formatter: '{value} 개'
		                    }
		                }
		            ], 
		            series : [
		                  {
		                        name:'상품수(개)',
		                        type : 'bar',
		                        yAxisIndex: 1,
		                        data : productCnt,
		                        itemStyle: {
		                         normal: {
		                           color:"#9cd5c2"
		                         }
		                       },
		                 },{
		                        name:'카테고리 총매출비중',
		                        type : 'line',
		                        symbolSize : 3,
		                        data : allSalesPer,
		                        itemStyle: {
		                         normal: {
		                           color:'#DB7093',
		                           lineStyle: {
		                                width : 3.5
		                            }
		                         }
		                       },
		                 },{
		                        name:'카테고리내 상위1% 매출비중',
		                        type : 'line',
		                        symbolSize : 3,
		                        data : top1Per,
		                        itemStyle: {
		                         normal: {
		                           color : '#00CED1',
		                           lineStyle: {
		                                width : 3.5
		                            }
		                         }
		                       },
		                 },
		            ]
		        };
		        myChart.setOption(option);
			}
		 }
		 
		 
 };
 
 
 </script>