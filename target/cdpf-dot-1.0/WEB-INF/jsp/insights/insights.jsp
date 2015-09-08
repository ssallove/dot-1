<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"
%><tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="stylesheet">
    
    <style type="text/css">
    table.listTB  th{background-repeat: repeat-x};
    </style>
    
    </tiles:putAttribute>

    <tiles:putAttribute name="content">

<!-- 
    /*
,{"name":"그날엔 우리", "title":"그날에 우리"
    , "subtitle":"우리 회사 서비스는 그날이 되면 어떻게 이용될까요? (Tmap 이동, 11번가 구매, OCB  적립)"
    , "iframeSrc":"http://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1LhJyYLwoLeRpUhSVZQnEc1mt0c07jxnBv_mDUI2-2Hw&font=Default&lang=en&start_at_end=true&initial_zoom=3&height=410"
    , "toptitle":"Tmap 사용자들은 그날 어디에 많이가고,<br/>11번가 고객은 그날을 앞두고 무엇을 많이 구매할까요?<br/>또 OCB 적립의 경우 그날엔 어떤 적립이 많을까요?"
  }
  */
   -->
    <!-- main-container -->
        <section >
            <p class="Insights"><img src="<c:url value="/resources/images/Insights_img.jpg"/>"  title="Insights 상단 이미지"/></p>
            <div class="container mb100">
                <h1>Insights</h1>
                
                <ul class="InsightBox mt80" id="insights">
                </ul>
                
             </div>
             
             
             <div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
             <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"></div></div>
               
        </section>
        <!--// main-container-->
        
    
    </tiles:putAttribute>
    
    
    <tiles:putAttribute name="javascript.footer">
    <script type="text/javascript" src="<c:url value="/resources/js/insights/insights.js "/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/insights/syruppay.js "/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/insights/samediff.js "/>"></script>
    <script type="text/javascript">

    
    
    
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
    
    function axisFormmater(param, axis){    return param[0].name+"<br/>"+param[0].seriesName+" : "+param[0].value+"%<br/>"+param[1].seriesName+" : "+param[1].value+"%<br/>";}
    
    

    var GV_JSON_DATA;
    $(document).ready(function () {
    	$.ajax({
            type: "GET",
            url: '/resources/data/insights.json',
            dataType: 'json',
            success: function(jsonData) {
            	GV_JSON_DATA = jsonData;
            	$.each(jsonData, function(modalIdx, data) {
           
            		
            		$('#insights').append('<li>                                                                                  '
							                +'    <div class="Lybox">                                                               '
							                +'        <p class="imgBox">                                                            '
							                +'            <a href="#" class="overlay" data-toggle="modal" data-target="#myModal'+modalIdx+'">  '
							                +'                <i class="fa fa-link"></i>                                            '
							                +'            </a>                                                                      '
							                +'        </p>                                                                          '
							                +'        <p class="title ">'+data.name+'</p>                                          '
							                +'    </div>                                                                            '
							                +'</li>                                                                                 ');
            	});
            },
            error: function(err){alert("err "+err); console.log(err)}
        });

    	$('#myModal0').on('shown.bs.modal', function () { drawChart(0); }) ;
   	    $('#myModal1').on('shown.bs.modal', function () { drawChart(1); }) ;
   	    $('#myModal2').on('shown.bs.modal', function () { drawChart(2); }) ;
     }); 
    
    function drawChart(modalIdx){
    	var body = $("#modalBody"+modalIdx).html();
    	if(body == undefined || body == 'undefined' || body == ''){
    	    var data = GV_JSON_DATA[modalIdx];
    		if(data.iframeSrc == null || data.iframeSrc == 'undefined'){
                insights.drawModalDiv(modalIdx, data.title, data.subtitle);
                
                var charts=[];
                if(data.iframeSrc == null || data.iframeSrc == 'undefined'){
                   $.each(data.charts, function(_idx, chartData){
                       $("#modalBody"+modalIdx).append(insights.getChartDiv(modalIdx, _idx, chartData));

                       var option = chartData.option;
                       var myChart = echarts.init($('#chart'+modalIdx+'_'+_idx)[0], GV_CHART_THEME);
                       var chartList = eval(chartData.type+'(myChart, option)');
                       if(chartData.showgrid == 'true'){
                           // creat table
                           insights.drawInsightTable("#grid"+modalIdx+'_'+_idx+" table", chartList, option.legend, option.category, option.timeline);
                       }
                       charts.push(myChart);
                   });
               }
               resizeChartOnWinResizeHandler.on(charts);
            }else{
                insights.drawiFrame(modalIdx, data); 
            }
    	}
    }
    
   
         
    </script>
    </tiles:putAttribute>
    
</tiles:insertDefinition>