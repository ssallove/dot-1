<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"%>
        
   <% 
      pageContext.setAttribute("show" , -1);
      String show = request.getParameter("show");
      try{
          pageContext.setAttribute("show" , Integer.parseInt(show));
      }catch(Exception e){}
   %>
<tiles:insertDefinition name="header.layout">

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
            <div class="container" id="insights">
                <h1>Insights</h1>
                <ul class="InsightBox mt80">
                    <li>
                        <div class="Lybox">
                            <p class="imgBox">
                                <a href="javascript:drawChart(0);" class="overlay">
                                    <i class="fa fa-link"></i>
                                </a>
                            </p>
                            <p class="title ">Syrup pay 분석</p>
                        </div>
                    </li>
                    <li>
                        <div class="Lybox">
                            <p class="imgBox">
                                <a href="javascript:drawChart(1);" class="overlay">
                                    <i class="fa fa-link"></i>
                                </a>
                            </p>
                            <p class="title ">동상이몽</p>
                        </div>
                    </li>
                    <li>
                        <div class="Lybox">
                            <p class="imgBox">
                                <a href="javascript:drawChart(3);" class="overlay">
                                    <i class="fa fa-link"></i>
                                </a>
                            </p>
                            <p class="title ">검색어로 보는 남녀  탐구생활</p>
                        </div>
                    </li>
                </ul>
                <ul class="InsightBox mt80">
                    <li>
                        <div class="Lybox">
                            <p class="title " onclick="javascript:drawChart(2);">간단한 통계로 본 Syrup</p>
                        </div>
                    </li>
                    <li>
                        <div class="Lybox">
                            <p class="title " onclick="javascript:drawChart(4);">11번가 vs. 경쟁사 app 현황 분석</p>
                        </div>
                    </li>
                    <li>
                        <div class="Lybox">
                            <p class="title " onclick="javascript:drawChart(5);">11번가 상품 Pareto</p>
                        </div>
                    </li>
                </ul>
                <ul class="InsightBox mt80">
                    <li>
                        <div class="Lybox">
                            <p class="title " onclick="javascript:drawChart(6);">모바일 전단</p>
                        </div>
                    </li>
                    <li>
                        <div class="Lybox">
                            <p class="title " onclick="javascript:drawChart(7);">심정미</p>
                        </div>
                    </li>
                </ul>
             </div>
             
             <div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog2"></div></div>
             <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog2"></div></div>
             <%@ include file="/WEB-INF/jsp/insights/incInsights3.jsp" %>
             <%@ include file="/WEB-INF/jsp/insights/incInsights2.jsp" %>
             <%@ include file="/WEB-INF/jsp/insights/incInsights4.jsp" %>
             <%@ include file="/WEB-INF/jsp/insights/incInsights5.jsp" %>
             <%@ include file="/WEB-INF/jsp/insights/incInsights6.jsp" %>
             <%@ include file="/WEB-INF/jsp/insights/incInsights7.jsp" %>
        </section>
        <!--// main-container-->
        
    
    </tiles:putAttribute>
    
    
    <tiles:putAttribute name="javascript.footer">
    <script type="text/javascript" src="<c:url value="/resources/js/insights/insights.js?${ BROWSER_CACHE_TIME_FLAG }"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/insights/syruppay.js?${ BROWSER_CACHE_TIME_FLAG }"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/insights/samediff.js?${ BROWSER_CACHE_TIME_FLAG }"/>"></script>
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
            url: '/resources/data/insights/insights.json',
            dataType: 'json',
            success: function(jsonData) {
            	GV_JSON_DATA = jsonData;
            	drawChart(${show});
            },
            error: function(err){alert("err "+err); console.log(err)}
        });
     }); 
    
    
    function drawChart(modalIdx){
    	if(modalIdx  == -1) return;
    	
    	$('#myModal'+modalIdx).modal('show');
    	var body = $("#modalBody"+modalIdx).html();
    	
    	
    	//if(body == undefined || body == 'undefined' || body == ''){
    		
    	    var data = GV_JSON_DATA[modalIdx];
    	    if(data == null || data == undefined){
    	    	setTimeout(function(){eval('incInsights'+modalIdx+'.showInsight();');}, 200);
    	    	
    	    }else if((data.iframeSrc == null || data.iframeSrc == 'undefined')
    				&& (data.includeSrc == null || data.includeSrc == 'undefined')){
    			
                insights.drawModalDiv(modalIdx, data.title, data.subtitle);
                 
                 var charts=[];
                 $.each(data.charts, function(_idx, chartData){
                     $("#modalBody"+modalIdx).append(insights.getChartDiv(modalIdx, _idx, chartData));
                     
                     setTimeout(function(){
                  	     var option = chartData.option;
                         var myChart = echarts.init($('#chart'+modalIdx+'_'+_idx)[0], GV_CHART_THEME);
                         var chartList = eval(chartData.type+'(myChart, option)');
                         if(chartData.showgrid == 'true'){
                             // creat table
                             insights.drawInsightTable("#grid"+modalIdx+'_'+_idx+" table", chartList, option.legend, option.category, option.timeline);
                         }
                         charts.push(myChart);   
                     }, 200);
                     
                 });
               resizeChartOnWinResizeHandler.on(charts);
               
            }else if(data.iframeSrc == null || data.iframeSrc == 'undefined'){
            	setTimeout(function(){eval(data.includeSrc+'.showInsight();');}, 200);
            	
            }else{    insights.drawiFrame(modalIdx, data);  }
    		
    		var contHeight = screen.availHeight - 100;        
            $('#myModal'+modalIdx+' .modal_content2').height(contHeight+'px');
            $('#myModal'+modalIdx+' .modal_body2').height((contHeight-130)+'px');
    	//}
    }
    
   
    
    
    
    
    
    
    
    
         
    </script>
    </tiles:putAttribute>
    
</tiles:insertDefinition>