<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"
%><tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="stylesheet">
    
    <style type="text/css">
    table.listTB  th{background-repeat: repeat-x};
    </style>
    
    </tiles:putAttribute>

    <tiles:putAttribute name="content">


    <!-- main-container -->
        <section >
            <p class="agreement"><img src="<c:url value="/resources/images/agreement_img.jpg"/>"  title="업종 상단 이미지"/></p>
            <div class="container mb100" id="syrupMain">
            <h1>Overview</h1>
            
                
                
                
                
                
            </div>
        </section>
        <!--// main-container-->
    
    </tiles:putAttribute>
    
    
    <tiles:putAttribute name="javascript.footer">
    <script type="text/javascript" src="<c:url value="/resources/js/insights.js "/>"></script>
    <script type="text/javascript">
    

    $(document).ready(function () {
    	var chartType = 
    		[{title:'Syrup pay 구매 비율', subtitle:'전체 대비 Syrup pay 이용률',  chartType:"barLineChart"}
    		   , {title:'고객 성별/연령별 고객비율', subtitle:'전체 vs Syrup pay',  chartType:'areaLineChart'}
    		   , {title:'Syrup pay 구매 비율', subtitle:'전체 대비 Syrup pay 이용률',  chartType:'importChart'}
    		   , {title:'Syrup Pay와 구매등급', subtitle:'Syrup Pay와 구매등급의 상관관계',  chartType:'timeLineChart'}];
    	var charts=[];
    	$.each(chartType, function(idx, data){
    		$("#syrupMain").append(getChartDiv(idx), data.title);
            var myChart = echarts.init($('#syruppayChart'+idx)[0], GV_CHART_THEME);
            eval(data.chartType+'(myChart, idx, data.title, data.subtitle)');
            charts.push(myChart);
    	});
    	resizeChartOnWinResizeHandler.on(charts);
     }); 
    
    function areaLineChart(myChart, idx, title, subtitle){
    	var allMData = [3, 22, 33, 27, 15, 5];  // 전체(남)
    	var mData = [5, 20, 35, 25, 10, 5]; // 남
    	var allFData = [-5, -15, -27, -33, -17, -3];    // 전체(여)
    	var fData = [-5, -10, -25, -35, -20, -5];   // 여

        var category = ['0-9세', '10-19세', '20-29세', '30-39세', '40-49세', '50세이상'];
    	var chartList = [];
    	$.each(category, function(idx, data){
    		chartList.push({legend:'남성', category:data, name:'남', value:mData[idx]});
    		chartList.push({legend:'여성', category:data, name:'여', value:fData[idx]});
    		chartList.push({legend:'전체(남)', category:data, name:'전체', value:allMData[idx]});
    		chartList.push({legend:'전체(여)', category:data, name:'전체', value:allFData[idx]});
    	});

    	insights.drawInsightTable('syruppayTableTab'+idx, chartList);

        var option =insights.getAreaLineOpt(chartList, title, subtitle);
        option.series[0].itemStyle = {normal: { label : {show: true}, lineStyle: { width : 3.5 } }};
        option.series[1].itemStyle = {normal: { label : {show: true, position: 'left', formatter : function(param){ return (-1 * parseFloat(param.value)); }}, lineStyle: { width : 3.5 } }};
        option.series[2].itemStyle = {normal: { label : {show: false}, areaStyle: { color : 'rgba(61,183,204,0.19)' }, lineStyle: { color : 'rgba(255,255,255,0)' }}};
        option.series[3].itemStyle = {normal: { label : {show: false}, areaStyle: { color : 'rgba(255,166,72,0.19)' }, lineStyle: { color : 'rgba(255,255,255,0)' }}};
        option.series[2].symbolSize = 0;    option.series[3].symbolSize = 0;
        myChart.setOption(option);
        
        return myChart;
    }
    
    
    function barLineChart(myChart, idx, title, subtitle){
    	 var customer = [2801970, 2823140, 3051350, 3075475];
         var number = [9459568, 9697998, 10943562, 11026314];
         var amount = [368997864419, 368605099980, 402150536060, 431662645915];

         var srpcustomer = [21046,63583,276798,385985];
         var srpnumber = [38416,130856,655698,986372];
         var srpamount = [955788010,3121261940,17301479550,30563059420];

         var category = ['2015-04','2015-05','2015-06','2015-07'];
         var chartList = [];        
         for(var i=0, len=category.length; i<len; i++){
             chartList.push({legend:'구매고객수', category:category[i], itemStyle:topPerLabel, name:'구매고객수', value: Math.round((srpcustomer[i]/customer[i])*10000)/100});
             chartList.push({legend:'구매건수', category:category[i], itemStyle:topPerLabel, name:'구매건수', value: Math.round((srpnumber[i]/number[i])*10000)/100});
             chartList.push({legend:'구매금액', category:category[i], itemStyle:topPerLabel, name:'구매금액', value: Math.round((srpamount[i]/amount[i])*10000)/100});
         }
         
         insights.drawInsightTable('syruppayTableTab'+idx, chartList);
         
         function itemFormatter(param){ return param.name+"</br>"+param.seriesName+" : "+param.value+"%";  };
         
         var option = insights.getMultiBarOpt(chartList, title, subtitle);
         option.yAxis[0].axisLabel = perLabel;  
         option.series[0].markLine = dashMarkLine;
         option.series[1].markLine = dashMarkLine;
         option.series[2].markLine = dashMarkLine;
         option.tooltip.formatter = itemFormatter;
         myChart.setOption(option);
         return myChart;
    }
    
    
     function timeLineChart(myChart, idx, title, subtitle){
    	 var totalSum = [5016525, 5309935, 594512, 448506];
         var allAprill = [ 197639, 546743, 1615477, 2656277, 546743]; //389];
         var allAgust = [250555, 635162, 1789567, 2634310, 635162]; //341];
         var NotUseSyrupPay = [35021, 79624, 182185, 151658, 79624]; //18];
         var UseSyrupPay = [57573, 123690, 255435, 157807, 123690]; //7];
         
         var timeline = [ 'Syrup pay 이용 전', 'Syrup pay 이용 후' ];
         var legend = ['전체', 'Syrup Pay 구매고객'];
         var category = ['VVIP','VIP','TOP','BEST','NEW'];
         var markFormatters = {"VVIP":"37%\n증가", "VIP":"42%\n증가", "TOP":"34%\n증가"};
         var chartList = [];        

         for(var i=0, len=category.length; i<len; i++){
             chartList.push({legend:legend[0], category:category[i], itemStyle:insidePerLabel , name:timeline[0], value: Math.round(Math.round(allAprill[i]/totalSum[0]*10000)/10000*100*100)/100});
             chartList.push({legend:legend[0], category:category[i], itemStyle:insidePerLabel , name:timeline[1], value: Math.round(Math.round(allAgust[i]/totalSum[1]*10000)/10000*100*100)/100});
             chartList.push({legend:legend[1], category:category[i], itemStyle:insidePerLabel , name:timeline[0], value: Math.round(Math.round(NotUseSyrupPay[i]/totalSum[2]*10000)/10000*100*100)/100});
             chartList.push({legend:legend[1], category:category[i], itemStyle:insidePerLabel , name:timeline[1], value: Math.round(Math.round(UseSyrupPay[i]/totalSum[3]*10000)/10000*100*100)/100});
         }
         
         
        insights.drawInsightTable('syruppayTableTab'+idx, chartList, timeline);
        
        var option = {
                timeline : { x : 255, y : 520, width : 350, autoPlay : true, playInterval : 4000, type : 'number' , data : [] },
                options : [] };
        
        option.timeline.data = timeline;
        $.each(timeline, function(idx, _timeline){
        	var _option = insights.getMultiBarOpt($.grep(chartList, function(_data){    return _data.name == _timeline;    }), title, subtitle);
        	_option.yAxis[0].axisLabel = perLabel;
        	_option.tooltip.formatter = function(param){ return param.data.name+" ("+param.name+")</br>"+param.seriesName+" : "+param.value+"%";  };  
        	option.options.push(_option);
        });
        
        var defMarkPoint=[], markPoint = [], mIdx=0;
        $.each(markFormatters, function(key, value){
             var yAxis = option.options[1].series[1].data[mIdx].value;
             markPoint.push({name:'markPoint'+mIdx, symbolSize : 20, itemStyle : {normal:{color:'#CC3D3D', label:{show:true, position:'inside', textStyle:{color:'#fff', fontSize:11}, formatter:function(param){ return value; } }}}, xAxis:key, yAxis:yAxis});
             defMarkPoint.push({name:'markPoint'+mIdx, symbolSize : 0, itemStyle : {normal:{label:{show:false }}}});
             mIdx++;
        });
        option.options[0].series[1].markPoint.data = defMarkPoint;
        option.options[1].series[1].markPoint.data = markPoint;
         
        myChart.setOption(option);
        return myChart;
     }
     
     
     function importChart(myChart, idx, title, subtitle){
    	 initData();

    	    function cvtformat_val(p, i){
    	        var idx = i.split(":")[1]*1;
    	        return p[0][1] + "<br/>" +
    	               p[0][0] + " : " + Math.round(p[0][2] /100 * mosuSyrup[idx]) + " 명 (" + p[2][2] + " %)<br/>" +
    	               p[1][0] + " : " + Math.round(p[1][2] /100 * mosuSyrup[idx]) + " 명 (" + p[3][2] + " %<br/>";

    	    } 

    	    function initData(){
    	        $.ajax({
    	            type: "GET",
    	            url: '<c:url value="/resources/data/Syruppay__.csv "/>',
    	            dataType: "text",
    	            success: function(data) {dataProcess(data);},
    	            error: function(err){alert("err "+err); console.log(err)}
    	        });
    	    }

    	    var mosuSyrup = [];
    	    var dateData = [];
    	    var purchase = [];
    	    var purchasePer = [];
    	    var firPurchase = [];
    	    var firPurchasePer = [];

    	    function dataProcess(data){
    	        data_ = data.split("\n");
    	        data_.forEach(function(entry) {
    	            var entry_ = entry.split(",");
    	            mosuSyrup.push(entry_[1]);
    	            dateData.push(entry_[0]);
    	            /* {category:entry_[0]} */
    	            purchase.push(entry_[2] / entry_[1] * 100);
    	            purchasePer.push(entry_[3]* 1);
    	            firPurchase.push(entry_[4] / entry_[1] * 100);
    	            firPurchasePer.push(entry_[5]* 1);
    	        });
                myChart.setOption(option1);    
                
    	    }

    	    
    	       
    	        option1 = {
    	        		backgroundColor : '#fff',
    	            title : {
    	                text: 'Syrup pay 구매 비율',
    	                subtext: '전체 대비 Syrup pay 이용률'
    	            },
    	            tooltip : {
    	                trigger : 'axis',
    	                axisPointer : {            
    	                    type : 'shadow'   
    	                },
    	                formatter : cvtformat_val
    	            },
    	            grid:{
    	                y : 95
    	            },
    	            legend: {
    	                y : 50,
    	                data:['Syrup pay 구매고객 비율','Syrup pay 첫 구매고객 비율']
    	            },
    	            dataZoom : {
    	                show : true,
    	                dataBackgroundColor : '#9cd5c2',
    	                zoomLock : true,
    	                realtime : true,
    	                start : 0,
    	                end : 20
    	            },
    	            xAxis : [
    	                {
    	                    type : 'category',
    	                    boundaryGap : true,
    	                    data : dateData
    	                }
    	            ],
    	            yAxis : [
    	                {
    	                    type : 'value',
    	                    max : 15,
    	                    axisLabel : {
    	                        formatter : function(d){
    	                            return d + "%";
    	                        } 
    	                    }
    	                } 
    	            ],
    	            series : [
    	              {
    	                    name:'Syrup pay 구매고객',
    	                    type : 'line',
    	                    symbolSize : 0,
    	                    itemStyle : {normal: {color : 'rgba(0,0,0,0)'}}, //  temporarily transparen
    	                    data : purchase
    	                },
    	                {
    	                    name:'Syrup pay 첫 구매고객',
    	                    type : 'line',
    	                    symbolSize : 0,
    	                    itemStyle : {normal: {color : 'rgba(0,0,0,0)'}}, //  temporarily transparen
    	                    data : firPurchase
    	                },
    	                {
    	                    name:'Syrup pay 구매고객 비율',
    	                    type:'bar',
    	                    barGap:'2%',
    	                    data : purchasePer
    	                },
    	                {
    	                    name:'Syrup pay 첫 구매고객 비율',
    	                    type:'bar',
    	                    barGap:'2%',
    	                    data : firPurchasePer
    	                }
    	            ]
    	        };
    	                    
     }

     /*     
         function marFormatter(param){
             var category = ['VVIP','VIP','TOP','BEST','NEW'];
             var idx = category.indexOf(param.data.xAxis);
             var value = parseFloat(option.options[1].series[1].data[idx].value) - parseFloat(option.options[0].series[1].data[idx].value);
             return value < 0 ? value+"%\n감소" : value+"%\n증가"; 
         }
         
      */  
      


      
      var insidePerLabel = {
              normal : {
                  label : {
                      show : true,
                      position : 'inside',
                      formatter: "{c} %",
                      textStyle: {
                          color : '#fff',
                          fontSize : 11,
                      }
                  }
              }
          };
      
      var topPerLabel = {
              normal : {
                  label : {
                      show : true,
                      position : 'top',
                      formatter: "{c} %"
                  }
              }
          };
      
      var perLabel =  {
              formatter : function(value){
                  return value + " %";
              } 
          };
      
      var dashMarkLine = {
              itemStyle:{
                  normal:{
                      lineStyle:{
                          type: 'dashed'
                      }
                  }
              },
              data : [
                  [{type : 'min'}, {type : 'max'}]
              ]
          };
      
      
      

      function getChartDiv(idx){
          var chartDiv = '';
         chartDiv+= '            <h2 id="syrupPayTitle'+idx+'">서비스별 가입자 현황</h2>                                                                       ';
         chartDiv+= '            <!--Tab Layout-->                                                                                                       ';
         chartDiv+= '            <div class="tab_content inTabLy ">                                                                                      ';
         chartDiv+= '                <!--TAB-->                                                                                                          ';
         chartDiv+= '                <ul class="tabSty">                                                                                                 ';
         chartDiv+= '                    <li class=" active"><a href="#syruppayChartTab'+idx+'"  data-toggle="tab"><p class="ico"></p>Chart</span></a></li>    ';
         chartDiv+= '                    <li><a href="#syruppayTableTab'+idx+'"  data-toggle="tab"><p class="ico"></p>Table</a></li>                           ';
         chartDiv+= '                </ul>                                                                                                               ';
         chartDiv+= '                <!--//TAB-->                                                                                                        ';
         chartDiv+= '                <!--TAB Contents-->                                                                                                 ';
         chartDiv+= '                <div class="tab_content">                                                                                           ';
         chartDiv+= '                    <!--TAB Chart 1-->                                                                                              ';
         chartDiv+= '                    <div class="tab_paneLy active" id="syruppayChartTab'+idx+'" >                                                         ';
         chartDiv+= '                        <div class="layoutLR" id="syruppayDiv'+idx+'">                                                                    ';
         chartDiv+= '                            <li class="floatL in_pane" style="width:100%;" id="syruppayChart'+idx+'"></li>                                ';
         chartDiv+= '                        </div>                                                                                                      ';
         chartDiv+= '                    </div>                                                                                                          ';
         chartDiv+= '                    <!--//TAB Chart 1-->                                                                                            ';
         chartDiv+= '                    <!--TAB Table-->                                                                                                ';
         chartDiv+= '                    <div  class="tab_pane2" id="syruppayTableTab'+idx+'" >                                                                ';
         chartDiv+= '                        <!--필수 동의 Table-->                                                                                      ';
         chartDiv+= '                        <table class="listTB tStriped ">                                                                            ';
         chartDiv+= '                            <colgroup></colgroup>                                                                                   ';
         chartDiv+= '                            <thead></thead>                                                                                         ';
         chartDiv+= '                            <tbody>                                                                                                 ';
         chartDiv+= '                            </tbody>                                                                                                ';
         chartDiv+= '                        </table>                                                                                                    ';
         chartDiv+= '                        <!--//필수 동의 Table-->                                                                                    ';
         chartDiv+= '                    </div>                                                                                                          ';
         chartDiv+= '                    <!--//TAB Table-->                                                                                              ';
         chartDiv+= '                                                                                                                                    ';
         chartDiv+= '                </div>                                                                                                              ';
         chartDiv+= '                <!--//TAB Contents-->                                                                                               ';
         chartDiv+= '             </div>                                                                                                                 ';
         chartDiv+= '            <!---//Tab Layout-->                                                                                                    ';
         chartDiv+= '                                                                                                                                    ';
            return chartDiv; 
      }
       
   
           
         
    </script>
    </tiles:putAttribute>
    
</tiles:insertDefinition>