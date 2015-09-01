<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="content">
        <!-- main-container -->
        <section >
            <p class="category"><img src="<c:url value="/resources/images/category_img.jpg"/>"  title="업종 상단 이미지"/></p>
            <div class="container mb100">
                <h1>서비스별 데모 현황 <span class="date">데이터 기준일 : ${baseDt}</span></h1>
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
                                <th>서비스</th>
                                <td colspan="3" >
                                    <!-- 서비스 Form group-->
                                    <form style="display:inline-block; white-space:nowrap;">
                                          <label class="pr40">
                                              <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_all" <c:if test="${fn:substring(svcUnionCdNm, 0, 1) == 2}"> checked </c:if>>
                                            <span class="lbl">통합</span> 
                                        </label>
                                        <label class="pr40">
                                            <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_syrup" <c:if test="${fn:substring(svcUnionCdNm, 0, 1) == 1}"> checked </c:if>>
                                            <span class="lbl">Syrup</span> 
                                        </label>
                                         <label class="pr40">
                                            <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_ocb" <c:if test="${fn:substring(svcUnionCdNm, 1, 2) == 1}"> checked </c:if>>
                                            <span class="lbl">OCB</span> 
                                        </label>
                                        <label class="pr40">
                                            <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_tmap" <c:if test="${fn:substring(svcUnionCdNm, 2, 3) == 1}"> checked </c:if>>
                                            <span class="lbl">T map</span> 
                                        </label>
                                         <label class="pr40">
                                            <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_evs" <c:if test="${fn:substring(svcUnionCdNm, 4, 5) == 1}"> checked </c:if>>
                                            <span class="lbl">11번가</span> 
                                        </label>
                                        <label class="pr40">
                                            <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_tstore" <c:if test="${fn:substring(svcUnionCdNm, 3, 4) == 1}"> checked </c:if>>
                                            <span class="lbl">T store</span> 
                                        </label>
                                    </form>
                                
                                </td>
                            </tr>
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
                    <p class="btnSrc"><button  name="btnSearch" id="btnSearch" type="button">검색버튼</button></p>
                     <!--//Btn_search-->
                    <!--검색 결과-->
                    <div class="viewSrc">
                        <ul>
                            <li class="title ">검색 조건</li>
                            <li><i class="fa fa-caret-right"></i>서비스 : <span>${svcUnionNm }</span></li>
                            <li><i class="fa fa-caret-right"></i>기간 : <span id="periodTx"></span></li>
                            <li><i class="fa fa-caret-right"></i>분류 : <span id="subTxt"></span></li>
                        </ul>
                    </div>
                    <!--//검색 결과-->
                </div>
                <!--//Search-->
                
                
                
                <!--성연령대별 현황 챠트 -->
                <h2>성연령대별 현황</h2>
                <div class="chartLy">
                    <ul class="chartLy_2p ">
                        <li style="width:66% !important">
                            <p class="chartTitle "><i class="fa fa-bar-chart"></i>연령대 구성<span>${subTxt }</span></p>
                            <div class="chartArea" id="AgeChart">챠트 영역</div>
                        </li>
                        <li style="width:33% !important">
                            <p class="chartTitle ico"><i class="fa fa-bar-chart"></i>성별 구성<span>${subTxt }</span></p>
                            <div class="chartArea" id="SexChart">챠트 영역</div>
                        </li>
                    </ul>
                    
                  </div>
                <!--// 성연령대별 현황 챠트-->
                
                
                
                
                
                <!--Layout left-right-->
                <div class="layoutLR ">
                    <!-- <h2>Title</h2> -->
                    <!--주활동지역 현황-->
                    <div class="LF" style="width:66% !important">
                        <ul class="chartLy_1p ">
                        <li>
                            <p class="chartTitle "><i class="fa fa-bar-chart"></i>성연령대 구성<span>${subTxt }</span></p>
                            <div class="chartArea" id="SexAgeChart" style="width:100%; height:400px">챠트 영역</div>
                        </li>
                        
                    </ul>
                        
                    </div>
                    <!--//주활동지역 현황-->
                    
                    <div class="RG" style="width:33% !important; margin-top:-5px;">
                    
                        <c:choose>
                           <c:when test="${rankingList.size() == 0}">
                            <div class="rankingLayout">
                                   <p class="noData">No Data</p>
                            </div>
                           </c:when>
                           <c:otherwise>
                           
                            <div class="rankingLy">
                            <p class="icon"></p>
                            <div class="inBox" style="height:430px;">
                                <h3>주활동지역 현황</h3>
                                <ul>
                                    <c:forEach items="${rankingList}" var="voList" varStatus="status">
                                        <c:choose>
                                        <c:when test="${status.index == 0}">
                                            <li class="wdh100"><span class="high">${voList.seq}</span><span class="txtHigh">${voList.mainArea}</span></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="wdh100"><span class="low">${voList.seq}</span>${voList.mainArea}</li>
                                        </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        
                           </c:otherwise>
                          </c:choose>
                    </div>
                </div>
                <!--//Layout left-right-->
                

            </div>
        </section>
        <!--// main-container-->
        
        
        
        
    </tiles:putAttribute>
    
    <tiles:putAttribute name="javascript.footer">
    
<script type="text/javascript">
    var sexCategory = ['남성','여성','전체(남)','전체(여)'];
    var ageRangeCategory = ['0-9세', '10-19세', '20-29세', '30-39세', '40-49세', '50세 이상', '기타(연령)'];
    
/* 
    var ageRangeMap = [{'0009' : '10세 미만'}
    , {'1019' : '10세'}
    , {'2029' : '20세'}
    , {'3039' : '30세'}
    , {'4049' : '40세'}
    , {'5099' : '50세 이상'}
    , {'ZZZZ' : '기타(연령)'}];
var ageRangeCategory = $.map(ageRangeMap, function(value, idx){  
                                    var ctNm = ''; 
                                    $.each(value, function(idx, val){ ctNm = val;});
                                    return ctNm; }  );
                                     */
var largeTx = $("#sel_cate_large option:selected").text(), midTx = $("#sel_cate_mid option:selected").text(), smallTx =  $("#sel_cate_small option:selected").text();
var subTitle = (smallTx != '' && smallTx != '-' && smallTx != '전체') ? smallTx 
              : ((midTx != '' && midTx != '-' && midTx != '전체') ? midTx :((largeTx == '' || largeTx == '-') ? '전체' : largeTx ));
                                          
  $(document).ready(function () {
    $('#periodTx').text($("#sel_period option:selected").text());
    $('#subTxt').text(largeTx+" > "+midTx+" > "+smallTx);
    
    defineEvent();
        
    // draw chart
    var resizeCharts = [];
    $.each(['AgeChart', 'SexChart', 'SexAgeChart'], function(idx, data){
              var myChart = echarts.init(document.getElementById(data));
              myChart.setTheme(GV_CHART_THEME);        
              myChart.setOption(eval('_get'+data+'Option();'));
              resizeCharts.push(myChart);
    });
    
    resizeChartOnWinResizeHandler.on(resizeCharts);
 });  

  /**
  * EVNET 정의
  **/
  function defineEvent(){
    $("#sel_cate_large").change(function () {
        changeCategory($(this).val(), "L");
    });
    $("#sel_cate_mid").change(function () {
        changeCategory($(this).val(), "M");
    });
            
    $("#chk_syrup, #chk_ocb, #chk_tmap, #chk_evs, #chk_tstore").click(function () {
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
            
    $("#btnSearch").click(search);
  }

  /**
  * 조회 조건을 검색  
  */
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
  function search(){
      var svcUnionCd = "";
      var svcUnionCdNm = "";
      var cnctCtgCd = "";
      var periodClCd = $("#sel_period option:selected").val();
      
      // svcUnionCd, svcUnionCdNm
      var chk2 = $("input:checkbox[id='chk_syrup']").is(":checked") ? "1" : "0";
      var chk3 = $("input:checkbox[id='chk_ocb']").is(":checked") ? "1" : "0";
      var chk4 = $("input:checkbox[id='chk_tmap']").is(":checked") ? "1" : "0";
      var chk5 = $("input:checkbox[id='chk_evs']").is(":checked") ? "1" : "0";
      var chk6 = $("input:checkbox[id='chk_tstore']").is(":checked") ? "1" : "0";

      var selData = chkArrData.getDataByKey("seq", (chk2 + chk3 + chk4 + chk6 + chk5));
      if(selData == null){    svcUnionCd = "31";    }
      else{    svcUnionCd = selData.data;    svcUnionCdNm = selData.seq;        }
      
      // cnctCtgCd
      var largeCd = $("#sel_cate_large").val(), midCd = $("#sel_cate_mid").val(), smallCd = $("#sel_cate_small").val();
      if (smallCd != "" && smallCd != "-") {    cnctCtgCd = $("#sel_cate_small option:selected").val();    } 
      else if (midCd != "" && midCd != "-") {    cnctCtgCd = $("#sel_cate_mid option:selected").val();    } 
      else {            cnctCtgCd = $("#sel_cate_large option:selected").val();    }
      
      // go search
      var param = "?svcUnionCd=" + svcUnionCd;
      param         += "&periodClCd=" + periodClCd;
      param         += "&cnctCtgCd=" + cnctCtgCd;
      param         += "&svcUnionCdNm=" + svcUnionCdNm;
      param         += "&largeCd=" + largeCd;
      param         += "&midCd=" + midCd;
      param         += "&smallCd=" + smallCd;
      location.href = "/category/categoryDemo.do" + param;

  }
  
  /**
  * 분류(Category) 변경 시 하위 분류 조회 
  */ 
  function changeCategory(com_cd, properties_gb) {
    // select box 초기화
    if(properties_gb == "L"){
        $("#sel_cate_mid").selectBox("disable");    $("#sel_cate_mid").selectBox("options", "<option value=''>전체</option>"); 
    }
    $("#sel_cate_small").selectBox("disable");        $("#sel_cate_small").selectBox("options", "<option value=''>전체</option>"); 
        
    // 하위 분류 조회
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
                if (data.cateList.length == 0) {    optionStrs = optionStrs+"<option value=''>전체</option>";    }
                $("#sel_cate_"+subCateNm).selectBox("options", optionStrs); 
            }
        });
    } 
  }  
  
  
  
  
  
  
  
  
  
  
  
  
  
  /**
  * ####  DROW CHART #############################################################
  */
    /**
    * #### 001.연령대별 현황 CHART #################
    */
    function _getAgeChartOption(){
	    // define default chart option
	   	var _ageChartOpt = {    
	               tooltip  : { trigger: 'axis', textStyle : { align : 'left'},
	                     axisPointer:{ show: true,    type : 'line',    lineStyle: {type : 'dashed', width : 1}},
	                     formatter: function(value){ return value[0].name+"</br>"+value[0].seriesName+" : "+value[0].value+"% </br>"+(value[1].seriesName == "전체" ? "" : value[1].seriesName+" : "+value[1].value+" %"); }},
	               legend   : { data : [], x : 'right', y : 'top' },
	               xAxis    : [ { data : [], type : 'category', boundaryGap : false}],
	               yAxis    : [ { type : 'value', scale : true,    axisLabel : {    formatter: '{value} %'    }    }],
	               series   : [ { data : [], type : 'line', name : '전체', markPoint : { data : [ {type : 'max'}, {type : 'min'} ] }, 
	                               itemStyle: {  normal: {    areaStyle: { color : 'rgba(178,235,244,0.2)' },
	                                                       lineStyle: { color : 'rgba(61,183,204,0.4)', width : 2 }    } }  },
	                            { data : [], type : 'line', name : '', markPoint : { data : [ {type : 'max'}, {type : 'min'} ] },
	                              itemStyle: {    normal: {    lineStyle: { width : 4.5, zlevel : 5 }    }    } } ]    };
	   	
	    // set chart data
		var allChartData = [], subChartData = [];
		$.each(${jsonAgeChartList}, function(idx, data){    
		if(data.cnctCtgCd == '-'){ allChartData.push(parseFloat(data.totMbrCnt));}    
		else{ subChartData.push(parseFloat(data.totMbrCnt));}    } );
		if(subChartData.length == 0){    subChartData = allChartData;    }
		
		// set chart option
		_ageChartOpt.legend.data = (subTitle == '전체') ? ['전체'] : ['전체', subTitle];
		_ageChartOpt.xAxis[0].data = ageRangeCategory;
		_ageChartOpt.series[0].data = allChartData;
		_ageChartOpt.series[1].name = subTitle;
		_ageChartOpt.series[1].data = subChartData;
		
		return _ageChartOpt;
    }  
      
      

      
	/**
	* #### 002.성별 현황 CHART #################
	*/
	function _grepSexChartData(sexCd, chartData, opt){
		var chartData = $.grep(chartData, function(value, idx){    return value.sexCd == sexCd;    });
	    return $.map(chartData, function(value, idx){ return parseFloat(value.totMbrCnt) * ($.isNumeric(opt) ? opt : 1);}  );
	}
    function _getSexChartOption(){
    	// define default chart option
    	var _sexChartOpt = {
                tooltip : { trigger : 'item', textStyle : { align : 'left'}, formatter: function(value){ return value.seriesName+"</br>"+value.name+" : "+value.data+" %" } },
                legend  : { data : [], x:'right'    },
                //calculable : true,
                xAxis   : [ { data : [], type : 'category' }    ],    
                yAxis   : [ { type : 'value', scale:false,    axisLabel:{formatter:'{value} %'}    }    ],
                series  : [ { data : [], name : '', type:'bar', barGap : '2%', barCategoryGap : '40%', itemStyle: {normal: {color:GV_GENDER_COLOR.male(0.95), label:{show:true}}}
                                , markLine : { data : [], itemStyle:{ normal: {color:GV_GENDER_COLOR.male()}    }    } },
                            { data : [], name : '', type:'bar', itemStyle: {normal: {color:GV_GENDER_COLOR.female(0.95), label:{show:true}}}
                                , markLine : { data : [], itemStyle:{ normal: {color:GV_GENDER_COLOR.female()} }    } } ]   };
    	
        // set chart Data
        var maleData = _grepSexChartData('M', ${jsonSexChartList});
        var femaleData = _grepSexChartData('F', ${jsonSexChartList});
        
        // cross 방향
        var crossMData = [[{type : 'max'},{ type : 'min'}]], crossFData = [[{type : 'max'},{ type : 'min'}]];
        if(femaleData.length == 1) femaleData.push(femaleData[0]);    if(maleData.length == 1) maleData.push(femaleData[0]);
        if(maleData[0] < maleData[0][1]){    crossMData = [[{type : 'min'},{ type : 'max'}]];    }
        if(femaleData[0] < femaleData[1]){    crossFData = [[{type : 'min'},{ type : 'max'}]];    }
        
        // set chart option
        _sexChartOpt.legend.data = [sexCategory[0], sexCategory[1]];
        _sexChartOpt.xAxis[0].data = (subTitle == '전체') ? ['전체'] : ['전체', subTitle];
        _sexChartOpt.series[0].name = sexCategory[0];
        _sexChartOpt.series[0].data = maleData;
        _sexChartOpt.series[0].markLine.data = crossMData;
        _sexChartOpt.series[1].name = sexCategory[1];
        _sexChartOpt.series[1].data = femaleData;
        _sexChartOpt.series[1].markLine.data = crossFData;
        
        return _sexChartOpt;
    }  
     
    
      
      /**
      * #### 003.성연령대별 현황 CHART #################
      */
    function _getSexAgeChartOption(){
      // define default chart option
        var _sexAgeChartOpt = { 
	               calculable : true,
	               tooltip : { trigger: 'axis', textStyle : { align : 'left'}, axisPointer : { type : 'shadow'},
	                           formatter: function(value){ 
	                                           var rtndata = value[0][1]+"<br/>" +  value[1][0] + " : " + value[1].data + " % (전체 "+value[0].data+" %)";
	                                           rtndata += "<br/> " +  value[3][0] + " : " + value[3].data * -1 + "% (전체 "+(value[2].data*-1) +" %)";
	                                           return rtndata;}    },
	               legend  : { data:[],    x:'right'    },
	               grid    : { y: 80 },
	               xAxis   : [ { type : 'value', position: 'bottom', scale : false,
	                             axisLabel:{formatter:function(value){ if(value > 0) return value + "%"; else return (-1 * value)  + "%";}},
	                             splitLine: {lineStyle:{type:'dashed'}}    }    ],
	               yAxis   : [ { data : [], boundaryGap : false, type : 'category', axisLine: {show: false}, axisTick: {show: false} }    ],
	                           // 전체 (남)        
	               series    : [ { data:[], name:'', type:'line', symbolSize : 0,
	                               itemStyle: {normal: {   label : {show: false},
	                                                       color : GV_GENDER_COLOR.male(),
	                                                       areaStyle: {color : GV_GENDER_COLOR.male(0.2)} ,
	                                                       lineStyle: {color : 'rgba(255,255,255,0)'}  }    }  },
	                           // 카테고리 (남)
	                           { data : [], name:'', type:'line', symbolSize : 5, barWidth : 32,
	                               itemStyle: {normal: {   label : {show: true}, lineStyle: {width : 3.5} }    }   },
	                              // 전체 (여)
	                           { data : [], name:'', type:'line', symbolSize : 0,
	                               itemStyle: {normal: {   label : {show: false},
	                                                       color : GV_GENDER_COLOR.female(),
	                                                       areaStyle: {color : GV_GENDER_COLOR.female(0.2)}  ,
	                                                       lineStyle: {color : 'rgba(255,255,255,0)'}     }    }    },
	                              // 카테고리 (여)
	                           { data : [], name:'', type:'line', symbolSize : 5, barWidth : 32,
	                               itemStyle: {normal: {    label : {show: true, position: 'left'
	                                                               , formatter : function (value){    return (-1 * value.data);}    }
	                                                       ,lineStyle: {    width : 3.5}    }    }   }    ]    };

        // set chart option
        _sexAgeChartOpt.legend.data = sexCategory;
        _sexAgeChartOpt.yAxis[0].data = ageRangeCategory;
       
        _sexAgeChartOpt.series[0].name = sexCategory[2];
        _sexAgeChartOpt.series[0].data = _grepSexChartData('M', ${jsonSexAgeAllChartList});
        

        _sexAgeChartOpt.series[1].name = sexCategory[0];
        _sexAgeChartOpt.series[1].data = _grepSexChartData('M', ${jsonSexAgeChartList});
        

        _sexAgeChartOpt.series[2].name = sexCategory[3];
        _sexAgeChartOpt.series[2].data = _grepSexChartData('F', ${jsonSexAgeAllChartList}, -1);
        
        

        _sexAgeChartOpt.series[3].name = sexCategory[1];
        _sexAgeChartOpt.series[3].data = _grepSexChartData('F', ${jsonSexAgeChartList}, -1);
        
        return _sexAgeChartOpt;
    }  
              
        </script>
        
    </tiles:putAttribute>
</tiles:insertDefinition>