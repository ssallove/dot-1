<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="content">
        
        <!-- main-container -->
        <section>
            <p class="category"><img src="<c:url value="/resources/images/category_img.jpg"/>"  title="업종 상단 이미지"/></p>
            <div class="container mb100">
                <h1>업종별 현황<span class="date">데이터 기준일 : ${baseDt}</span></h1>
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
                            <li><i class="fa fa-caret-right"></i>기간 : <span id="periodTx"></span></li>
                            <li><i class="fa fa-caret-right"></i>분류 : <span id="subTxt"></span></li>
                        </ul>
                    </div>
                    <!--//검색 결과-->
                </div>
                <!--//Search-->
                
                <!--업종별 모수 챠트 -->
                <h2>업종별 모수</h2>
                <div class="chartLy">
                    <ul class="chartLy_1p ">
                        <li>
                            <p class="chartTitle "><i class="fa fa-bar-chart"></i>업종별 모수<span id="subChartTxt"></span></p>
                            <div class="chartArea" id="chartContainer" style="height:500px"></div>
                        </li>
                    </ul>
                  </div>
                <!--// 업종별 모수 챠트-->
            
            </div>
        </section>
        <!--// main-container-->
        
        
    </tiles:putAttribute>
    
    <tiles:putAttribute name="javascript.footer">
    
        <script type="text/javascript">

        var largeTx = $("#sel_cate_large option:selected").text(), midTx = $("#sel_cate_mid option:selected").text();
       
        $(document).ready(function () {
            $('#periodTx').text($("#sel_period option:selected").text());
            $('#subTxt,#subChartTxt').text(largeTx+" > "+midTx);;
            
            // event
            defineEvent();
            
            // draw chart
            var myChart = echarts.init(document.getElementById('chartContainer'));
            myChart.setTheme(GV_CHART_THEME);     // , 'infographic'       
            myChart.setOption(getOption());
            
            resizeChartOnWinResizeHandler.on(myChart);
        });
                    
            

          /**
          * EVNET 정의
          **/
          function defineEvent(){
            $("#sel_cate_large").change(function () {
                changeCategory($(this).val());
            });
            
            $("#btnSearch").click(function () {
                var periodClCd = $("#sel_period option:selected").val();
                // cnctCtgCd
                var cnctCtgCd = $("#sel_cate_large").val();
                var largeCd = $("#sel_cate_large").val(), midCd = $("#sel_cate_mid").val();
                if (midCd != "" && midCd != "-" && midCd != "null") {    cnctCtgCd = $("#sel_cate_mid option:selected").val();    } 
                
                // go search
                var param = "?largeCd=" + largeCd;
                param         += "&midCd=" + midCd;
                param += "&periodClCd=" + periodClCd;
                param += "&cnctCtgCd=" + cnctCtgCd;
                location.href = "/category/categoryBusy.do" + param;
            });
            
          }

          /**
          * 분류(Category) 변경 시 하위 분류 조회 
          */ 
          function changeCategory(com_cd, properties_gb) {
            // select box 초기화
            $("#sel_cate_mid").selectBox("disable");    $("#sel_cate_mid").selectBox("options", "<option value=''>전체</option>");
                
            // 하위 분류 조회
            if ("-" != com_cd && com_cd != "") {
                $("#sel_cate_mid").selectBox("enable");

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
                        if (data.cateList.length == 0) {    optionStrs = optionStrs+"<option value=''>전체</option>";    }
                        $("#sel_cate_mid").selectBox("options", optionStrs); 
                    }
                });
            } 
          }  
          
          
          
            
            
            
            
            
            
            
            
            
                
        var serviceMap = {
                'SYR' : 'Syrup',
                'OCB' : 'OCB',
                'TMA' : 'Tmap',
                'TST' : 'Tstore',
                'EVS' : '11번가',
                'TOT' : '통합'
            };    
        // Chart의 Option 정보  
        function getOption(){
            var categoryData = [];
            $.each(${jsonCategorylist}, function(idx, value){ if(categoryData.indexOf(value.cdNm) < 0) categoryData.push(value.cdNm); });
            var chartData = ${jsonCategorylist};
            
            var option = {
            	calculable : true,
                tooltip : {
                    trigger: 'item',
                    showDelay : 0,
                    textStyle : { align : 'left'},
                    formatter : 
                    	function (param) {   return "<font size='2px'><b>["+param.seriesName+"]</b>&nbsp;&nbsp;"+param.data[0]+" : "+  formatCurrency(param.data[1])+"</font>"
                    	    +"</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BLE동의 : "+formatCurrency(param.data[3])
                    	    +"</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위치동의 : "+formatCurrency(param.data[4])
                    	    +"</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PUSH동의 : "+formatCurrency(param.data[5]);    } ,
                    	
                    axisPointer:{
                        show: true,
                        type : 'cross',
                        lineStyle: {
                            type : 'dashed',
                            width : 1
                        }
                    }
                },
                legend: {
                    data: $.map(serviceMap, function(value, idx){ return value; } )
                    , selected: { '통합' : false }
                },
                xAxis : [
                    {
                        type : 'category',
                        splitLine: {show: false}
                        , data : categoryData
                         /*, axisLabel :{interval:function(p, data){
                            return (${jsonCategoryViewlist}.indexOf(data) >= 0);
                        }} */
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        splitNumber: 4,
                        scale: true
                        //, max:9803932
                    }
                ],
                series : getChartData()    // Chart Data
            };
            
            return option;
        }
        
        
            
        
        // Chart Data로 parsing
        var _CHART_MAX_VAL;
        var _CHATR_PER = 200;
        function getChartData(){
            var chartList = ${jsonBubbleChartList};
            _CHART_MAX_VAL =($.map(chartList, function(value, idx){ return value.mbrCnt; } )).max();

            var chartData=[];
            $.each(serviceMap, function(svcCd, value){ chartData.push( _getChartData(svcCd, chartList));        });
            function _getChartData(svcCd, chartList){
                var chartData = $.grep(chartList, function(value, idx){    return value.svcCd == svcCd;    });
                var maxVal = ($.map(chartData, function(value, idx){ return value.mbrCnt; } )).max();
                var data = []; $.each(chartData, function(idx, value){ var mbrCnt = value.mbrCnt; data.push([value.cnctCtgNm, mbrCnt, mbrCnt, value.bleMbrCnt, value.locMbrCnt, value.pushMbrCnt]);  } );
                return {name:serviceMap[svcCd],    type:'scatter', data:data, symbolSize: function (value){    var size = 40*(value[2]/_CHART_MAX_VAL)+4;      return size;                    } };
            }
            return chartData;
        }
            

        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>