<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/jsp/common/directive.jsp" %>
<%@page import="java.util.Map,
                java.util.LinkedHashMap" %>

<%
    Map<String, String> levelMap = new LinkedHashMap<String, String>();
    levelMap.put("1", "모수");
    levelMap.put("2", "모수기여도(%)");
    pageContext.setAttribute("levelMap", levelMap);

    Map<String, String> mosuTypeMap = new LinkedHashMap<String, String>();
    mosuTypeMap.put("99", "전체");
    mosuTypeMap.put("03", "PUSH동의");
    mosuTypeMap.put("02", "위치동의");
    mosuTypeMap.put("01", "BLE동의");
    pageContext.setAttribute("mosuTypeMap", mosuTypeMap);
%>

<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="content">
        <!-- main-container -->
        <section>
            <p class="category"><img src="<c:url value="/resources/images/category_img.jpg"/>" title="업종 상단 이미지"/></p>

            <div class="container mb100">
                <h1>서비스별 현황 <span class="date">데이터 기준일 : ${baseDt}</span></h1>
                <!--Search-->
                <div class="searchConts mt50">
                    <table>
                        <colgroup>
                            <col width="90px">
                            <col width="200px">
                            <col width="80px">
                            <col width="">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>서비스</th>
                            <td colspan="3">
                                <!-- 서비스 Form group-->
                                <form style="display:inline-block; white-space:nowrap;">
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_all"
                                        <c:if test="${fn:substring(svcUnionCdNm, 0, 1) == 2}"> checked </c:if>>
                                        <span class="lbl">통합</span>
                                    </label>
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_syrup"
                                        <c:if test="${fn:substring(svcUnionCdNm, 0, 1) == 1}"> checked </c:if>>
                                        <span class="lbl">Syrup</span>
                                    </label>
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_ocb"
                                        <c:if test="${fn:substring(svcUnionCdNm, 1, 2) == 1}"> checked </c:if>>
                                        <span class="lbl">OCB</span>
                                    </label>
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_tmap"
                                        <c:if test="${fn:substring(svcUnionCdNm, 2, 3) == 1}"> checked </c:if>>
                                        <span class="lbl">T map</span>
                                    </label>
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_evs"
                                        <c:if test="${fn:substring(svcUnionCdNm, 4, 5) == 1}"> checked </c:if>>
                                        <span class="lbl">11번가</span>
                                    </label>
                                    <label class="pr40">
                                        <input class="ace ace-checkbox-2" type="checkbox" name="chk_svc" id="chk_tstore"
                                        <c:if test="${fn:substring(svcUnionCdNm, 3, 4) == 1}"> checked </c:if>>
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
                            <td>
                                <!--대분류 select-->
                                <select id="sel_cate_large" name="sel_cate_large" style="width:30%">
                                    <c:forEach items="${cateList1}" var="voList" varStatus="status">
                                        <option value="${voList.comCd}"
                                                <c:if test="${voList.comCd == largeCd}">selected</c:if>>${voList.cdNm}</option>
                                    </c:forEach>
                                </select>
                                <!--중분류 select-->
                                <select id="sel_cate_mid" name="sel_cate_mid" style="width:30%"
                                        <c:if test="${largeCd == 'null' || largeCd == '' || largeCd == '-'}">disabled</c:if>>
                                    <c:forEach items="${cateList2}" var="voList" varStatus="status">
                                        <option value="${voList.comCd}"
                                                <c:if test="${voList.comCd == midCd}">selected</c:if>>${voList.cdNm}</option>
                                    </c:forEach>
                                </select>
                                <!--소분류 select-->
                                <select id="sel_cate_small" name="sel_cate_small" style="width:30%"
                                        <c:if test="${midCd == 'null' || midCd == '' || midCd == '-'}">disabled</c:if>>
                                    <c:forEach items="${cateList3}" var="voList" varStatus="status">
                                        <option value="${voList.comCd}"
                                                <c:if test="${voList.comCd == smallCd}">selected</c:if>>${voList.cdNm}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <!--Btn_search-->
                    <p class="btnSrc">
                        <button name="btnSearch" id="btnSearch" type="button">검색버튼</button>
                    </p>
                    <!--//Btn_search-->
                    <!--검색 결과-->
                    <div class="viewSrc">
                        <ul>
                            <li class="title ">검색 조건</li>
                            <li><i class="fa fa-caret-right"></i>서비스 : <span>${svcUnionNm }</span></li>
                            <li><i class="fa fa-caret-right"></i>기간 : <span id="periodTx"></span></li>
                            <li><i class="fa fa-caret-right"></i>분류 : <span id="subTxt1"></span></li>
                        </ul>
                    </div>
                    <!--//검색 결과-->
                </div>
                <!--//Search-->


                <!--서비스별 모수 현황 List-->
                <h2 class="mt80">서비스별 모수 현황</h2>

                <div class="mt30 detailLy">
                    <p class="btSpace">
                        <button class="view" type="button" data-toggle="modal" data-target="#myModal">서비스별 모수 현황 리스트
                        </button>
                    </p>
                    <p class="txt"><strong>[서비스별 모수 현황 리스트]</strong>를 클릭 하시면 자세한 내용을 볼 수 있습니다.</p>

                    <div class="detailListBox2">
                        <ul class="detailList">
                            <li id="card_all">
                                <ul>
                                    <li class="ciTotal">Integration</li>
                                    <!--통합-->
                                    <li class="boxTotal" id="totTxt"></li>
                                    <!--//통합-->
                                </ul>
                            </li>
                            <li id="card_syrup">
                                <ul>
                                    <li class="ci"><img src="<c:url value="/resources/images/ci_syrup.png"/>"
                                                        alt="syrup"/></li>
                                    <!--syrup-->
                                    <li class="box" id="syrTxt"></li>
                                    <!--//syrup-->
                                </ul>
                            </li>
                            <li id="card_ocb">
                                <ul>
                                    <li class="ci"><img src="<c:url value="/resources/images/ci_ok.png"/>"
                                                        alt="OK cashbag"/></li>
                                    <!--OK cashbag-->
                                    <li class="box" id="ocbTxt"></li>
                                    <!--//OK cashbag-->
                                </ul>
                            </li>
                            <li id="card_tmap">
                                <ul>
                                    <li class="ci"><img src="<c:url value="/resources/images/ci_tmap.png"/>"
                                                        alt="T map"/></li>
                                    <!--T map-->
                                    <li class="box" id="tmaTxt"></li>
                                    <!--//T map-->
                                </ul>
                            </li>
                            <li id="card_evs">
                                <ul>
                                    <li class="ci"><img src="<c:url value="/resources/images/ci_11.png"/>" alt="11번가"/>
                                    </li>
                                    <!--11번가-->
                                    <li class="box" id="evsTxt"></li>
                                    <!--//11번가-->
                                </ul>
                            </li>
                            <li id="card_tstore">
                                <ul>
                                    <li class="ci"><img src="<c:url value="/resources/images/ci_tstore.png"/>"
                                                        alt="T store"/></li>
                                    <!--T store-->
                                    <li class="box" id="tstTxt"></li>
                                    <!--//T store-->
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--// 서비스별 모수 현황 List-->


                <h2 class="mt80">서비스별 데모 현황</h2>
                <!--검색 결과-->
                <div class="searchConts">
                    <div class="viewSrc2" style="margin-top:0 !important">
                        <ul>
                            <li class="title ">검색 조건</li>
                            <li><i class="fa fa-caret-right"></i>서비스 : <span>${svcUnionNm }</span></li>
                            <li><i class="fa fa-caret-right"></i>기간 : <span id="periodTx2"></span></li>
                            <li><i class="fa fa-caret-right"></i>분류 : <span id="subTxt5"></span></li>
                        </ul>
                    </div>

                </div>
                <!--//검색 결과-->

                <!--성연령대별 현황 챠트 -->
                <!-- <h3 class="mt30">성연령대별 현황</h2> -->
                <div class="chartLy mt30">
                    <ul class="chartLy_2p ">
                        <li style="width:66% !important">
                            <p class="chartTitle "><i class="fa fa-bar-chart"></i>연령대 구성<span id="subTxt2"></span></p>

                            <div class="chartArea" id="AgeChart">챠트 영역</div>
                        </li>
                        <li style="width:33% !important">
                            <p class="chartTitle ico"><i class="fa fa-bar-chart"></i>성별 구성<span id="subTxt3"></span></p>

                            <div class="chartArea" id="SexChart">챠트 영역</div>
                        </li>
                    </ul>

                </div>
                <!--// 성연령대별 현황 챠트-->


                <!--Layout left-right-->
                <div class="layoutLR ">
                    <!-- <h2>Title</h2> -->
                    <!--주활동지역 현황-->
                    <div class="LF" style="width:66% !important; position:relative">
                        <ul class="chartLy_1p ">
                            <li>
                                <p class="chartTitle"><i class="fa fa-bar-chart"></i>성연령대 구성<span id="subTxt4"></span>
                                </p>

                                <p style="position:absolute; left:40%; top:200px; background:url(<c:url
                                        value="/resources/images/icon_woman.png"/>) 0 0 no-repeat; width:128px; height:128px; background-size: 60%"></p>

                                <p style="position:absolute; right:35%; top:200px; background:url(<c:url
                                        value="/resources/images/icon_man.png"/>) 0 0 no-repeat; width:128px; height:128px; background-size: 60%"></p>

                                <div class="chartArea" id="SexAgeChart" style="width:100%; height:400px;"></div>
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
                                                        <li class="wdh100"><span class="high">${voList.seq}</span><span
                                                                class="txtHigh">${voList.mainArea}</span></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="wdh100"><span
                                                                class="low">${voList.seq}</span>${voList.mainArea}</li>
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

                <div class="chartLy mt30">
                    <ul class="chartLy_1p ">
                        <li>
                            <p class="chartTitle ">
                                <i class="fa fa-bar-chart"></i>주 활동지역 현황
                            </p>

                            <div class="chartArea" style="height:500px;">
                                <div id="chart1" style="width:100%; height: 100%;"></div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>

        </section>
        <!--// main-container-->


        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
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
                            <c:set var="currMosuTypeCd" value=""/>
                            <c:forEach items="${mosulist}" var="voList" varStatus="status">
                                <tr>
                                    <c:if test="${currMosuTypeCd != voList.funcAgrClCd}">
                                        <td rowspan="2" class="depth1 txtC"><c:out
                                                value="${mosuTypeMap[voList.funcAgrClCd]}"/></td>
                                        <c:set var="currMosuTypeCd" value="${voList.funcAgrClCd }"/>
                                    </c:if>
                                    <td class="depth2 txtL"><c:out value="${levelMap[voList.lv]}"/></td>
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
            var sexCategory = ['남성', '여성', '전체(남)', '전체(여)'];
            var ageRangeCategory = ['0-9세', '10-19세', '20-29세', '30-39세', '40-49세', '50세 이상', '기타(연령)'];
            var Network = (function(){
                return {
                    option : {},
                    mainAdmDongCdCnt : 10,
                    crossAdmDongCdCnt : 5,
                    height : 0,
                    width : 0,
                    NODE_COLOR : "",
                    NODE_BORDER_COLOR : "",
                    LINE_COLOR : ""
                }
            })();

            function getNetworkChart(chartName, dataNodeList, dataLinkList) {

                var myChart = echarts.init(document.getElementById(chartName));

                myChart.setTheme(GV_CHART_THEME);

                myChart.setOption(_getNetworkChartOption(dataNodeList, dataLinkList));

                resizeChartOnWinResizeHandler.on(myChart);

            }

            function _getNetworkChartOption(dataNodeList, dataLinkList) {

                var nodeList = [];
                var linkList = [];
                var categoriesList = [];
                var categoryIdx = 0;
                // category[0] : 시,구,동
                // category[1] : 상위지역
                var cityName = $("#chart2ParentTitle").text();
                var subCityName = $("#chart2SubTitle").text();

                Network.NODE_COLOR = '#49cdf4';
                Network.NODE_BORDER_COLOR = '#2c9ae9';
                Network.LINE_COLOR = '#2353a3';

                categoriesList[0] = {name: ''};
                categoriesList[1] = {name: ''};

                var confidenceSum = 0.0;
                for(var i=0; i<dataLinkList.length; i++){
                    confidenceSum += Number(dataLinkList[i].confidence);
                }

                var confidenceAve = confidenceSum / dataLinkList.length;

                console.log("dataNodeList",dataNodeList);
                console.log("dataLinkList",dataLinkList);

                $.each(dataNodeList, function(idx, data){

                    if(data.dongNm === categoriesList[0].name) {
                        categoryIdx = 0;
                    } else {
                        categoryIdx = 1;
                    }

                    nodeList[idx] = {

                        category: categoryIdx,
                        name: (function(){

                            var smallSelect = $("#sel_cate_small option:selected").text();
                            var midSelect = $("#sel_cate_mid option:selected").text();
                            var largeSelect = $("#sel_cate_large option:selected").text();

                            if( smallSelect === "" || smallSelect === "전체" ) {
                                smallSelect = "전체";
                            }

                            if (midSelect === "" || midSelect === "전체") {
                                midSelect = "전체";
                            }

                            return data.sCtgNm;

//                            if ( smallSelect !== "전체" ) {
//                                return data.sCtgNm;
//                            } else {
//                                if ( midSelect !== "전체" ) {
//                                    return data.mCtgNm;
//                                } else {
//                                    return data.lCtgNm;
//                                }
//                            }

                        })(),
                        value: data.mbrCnt,
                        //label: data.mCtgNm,
                        itemStyle: {
                            normal: {
                                label: {
                                    position: 'right',
                                    textStyle: {
                                        color: 'black',
                                        fontSize: 14
                                    }
                                },
                                color: (function(d){

                                    var smallSelect = $("#sel_cate_small option:selected").text();
                                    var midSelect = $("#sel_cate_mid option:selected").text();
                                    var largeSelect = $("#sel_cate_large option:selected").text();

                                    if( smallSelect === "" || smallSelect === "전체" ) {
                                        smallSelect = "전체";
                                    }

                                    if (midSelect === "" || midSelect === "전체") {
                                        midSelect = "전체";
                                    }

                                    if ( smallSelect !== "전체" ) {
                                        if(smallSelect === d.sCtgNm) {
                                            return "#ff4f84";
                                        } else {
                                            return '#49cdf4';
                                        }
                                    }

                                })(data)
                            }
                        }
                    }

                });

                console.log("nodeList", nodeList);

                $.each(dataLinkList, function(idx, data){

                    linkList[idx] = {
                        source: (function(){
                            var smallSelect = $("#sel_cate_small option:selected").text();
                            var midSelect = $("#sel_cate_mid option:selected").text();
                            var largeSelect = $("#sel_cate_large option:selected").text();

                            if( smallSelect === "" || smallSelect === "전체" ) {
                                smallSelect = "전체";
                            }

                            if (midSelect === "" || midSelect === "전체") {
                                midSelect = "전체";
                            }

                            return data.srcSCtgNm;

//                            if ( smallSelect !== "전체" ) {
//                                return data.srcSCtgNm;
//                            } else {
//                                if ( midSelect !== "전체" ) {
//                                    return data.srcMCtgNm;
//                                } else {
//                                    return data.srcLCtgNm;
//                                }
//                            }
                        })(),
                        target: (function(){
                            var smallSelect = $("#sel_cate_small option:selected").text();
                            var midSelect = $("#sel_cate_mid option:selected").text();
                            var largeSelect = $("#sel_cate_large option:selected").text();

                            if( smallSelect === "" || smallSelect === "전체" ) {
                                smallSelect = "전체";
                            }

                            if (midSelect === "" || midSelect === "전체") {
                                midSelect = "전체";
                            }

                            return data.tgtSCtgNm;

//                            if ( smallSelect !== "전체" ) {
//                                return data.tgtSCtgNm;
//                            } else {
//                                if ( midSelect !== "전체" ) {
//                                    return data.tgtMCtgNm;
//                                } else {
//                                    return data.tgtLCtgNm;
//                                }
//                            }
                        })(),
                        weight: data.weight,
                        name: data.srcDongNm,
                        itemStyle: {
                            normal: {
                                width: (confidenceAve < Number(data.confidence) ) ? 1 : 0.2,
                                color: Network.LINE_COLOR
                            }
                        }
                    }

                });

                var option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: '{b}'
                    },
                    series: [
                        {
                            type: 'force',
                            categories: categoriesList,
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true,
                                        textStyle: {
                                            color: '#333',
                                            fontSize: 14
                                        },
                                        position: 'right'
                                    },
                                    nodeStyle: {
                                        brushType: 'both',
                                        borderColor: '#cbeffa', // #2c9ae9, #db0948
                                        borderWidth: 8
                                    } ,
                                    linkStyle: {
                                        type: 'curve'
                                    }
                                }

                            },
                            minRadius: 10, // 노드 최소 크기
                            maxRadius: 30, // 노드 최대 크기
                            gravity: 3.0,
                            scaling: 2.5,
//                                large: true,
                            roam: 'move', // scale, move
                            nodes: nodeList,
                            links: linkList
                        }
                    ]
                };

                Network.option = option;

                return option;

            }

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
            var largeTx = $("#sel_cate_large option:selected").text(), midTx = $("#sel_cate_mid option:selected").text(), smallTx = $("#sel_cate_small option:selected").text();
            var subTitle = (smallTx != '' && smallTx != '-' && smallTx != '전체') ? smallTx
                    : ((midTx != '' && midTx != '-' && midTx != '전체') ? midTx : ((largeTx == '' || largeTx == '-') ? '전체' : largeTx ));

            $(document).ready(function () {
                $('#periodTx, #periodTx2').text($("#sel_period option:selected").text());
                $('#subTxt1, #subTxt2, #subTxt3, #subTxt4, #subTxt5').text(largeTx + " > " + midTx + " > " + smallTx);

                getNetworkChart('chart1', ${jsonNetworkNodeChartList}, ${jsonNetworkLinkChartList});

                var mosuList = '${jsonMosuList}';
                if (mosuList !== "") {
                    var data = $.grep(JSON.parse(mosuList), function (value, idx) {
                        return value.funcAgrClCd == '99' && value.lv == '1';
                    });
                    $.each(['tot', 'syr', 'ocb', 'tma', 'evs', 'tst'], function (idx, value) {
                        $('#' + value + 'Txt').text(eval('data[0].' + value));
                    })

                    $("input:checkbox").each(function (idx, data) {
                        if ($(this).attr("id").indexOf("chk_") == 0) {
                            if ($(this).is(":checked")) {
                                $('#card' + ($(this).attr("id").substr(3))).addClass("check");
                            }
                        }
                    });
                }

                defineEvent();

                // draw chart
                var resizeCharts = [];
                $.each(['AgeChart', 'SexChart', 'SexAgeChart'], function (idx, data) {
                    var myChart = echarts.init(document.getElementById(data));
                    myChart.setTheme(GV_CHART_THEME);
                    myChart.setOption(eval('_get' + data + 'Option();'));
                    resizeCharts.push(myChart);
                });

                resizeChartOnWinResizeHandler.on(resizeCharts);
            });

            /**
             * EVNET 정의
             **/
            function defineEvent() {
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
                {data: "01", seq: "10000"}, {data: "02", seq: "01000"}, {data: "03", seq: "00100"}, {
                    data: "04",
                    seq: "00010"
                }
                , {data: "05", seq: "00001"}, {data: "06", seq: "11000"}, {data: "07", seq: "10100"}, {
                    data: "08",
                    seq: "10010"
                }
                , {data: "09", seq: "10001"}, {data: "10", seq: "01100"}, {data: "11", seq: "01010"}, {
                    data: "12",
                    seq: "01001"
                }
                , {data: "13", seq: "00110"}, {data: "14", seq: "00101"}, {data: "15", seq: "00011"}, {
                    data: "16",
                    seq: "11100"
                }
                , {data: "17", seq: "11010"}, {data: "18", seq: "11001"}, {data: "19", seq: "10110"}, {
                    data: "20",
                    seq: "10101"
                }
                , {data: "21", seq: "10011"}, {data: "22", seq: "01110"}, {data: "23", seq: "01101"}, {
                    data: "24",
                    seq: "01011"
                }
                , {data: "25", seq: "00111"}, {data: "26", seq: "11110"}, {data: "27", seq: "11101"}, {
                    data: "28",
                    seq: "11011"
                }
                , {data: "29", seq: "10111"}, {data: "30", seq: "01111"}, {data: "31", seq: "11111"}
            ];
            function search() {
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
                if (selData == null) {
                    svcUnionCd = "31";
                }
                else {
                    svcUnionCd = selData.data;
                    svcUnionCdNm = selData.seq;
                }

                // cnctCtgCd
                var largeCd = $("#sel_cate_large").val(), midCd = $("#sel_cate_mid").val(), smallCd = $("#sel_cate_small").val();
                if (smallCd != "null" && smallCd != "" && smallCd != "-") {
                    cnctCtgCd = $("#sel_cate_small option:selected").val();
                }
                else if (midCd != "null" && midCd != "" && midCd != "-") {
                    cnctCtgCd = $("#sel_cate_mid option:selected").val();
                }
                else {
                    cnctCtgCd = $("#sel_cate_large option:selected").val();
                }

                if (midCd == "null") {
                    midCd = "";
                }
                if (smallCd == "null") {
                    smallCd = "";
                }

                // go search
                var param = "?svcUnionCd=" + svcUnionCd;
                param += "&periodClCd=" + periodClCd;
                param += "&cnctCtgCd=" + cnctCtgCd;
                param += "&svcUnionCdNm=" + svcUnionCdNm;
                param += "&largeCd=" + largeCd;
                param += "&midCd=" + midCd;
                param += "&smallCd=" + smallCd;
                location.href = "/category/categoryDemo.do" + param;

            }

            /**
             * 분류(Category) 변경 시 하위 분류 조회
             */
            function changeCategory(com_cd, properties_gb) {
                // select box 초기화
                if (properties_gb == "L") {
                    $("#sel_cate_mid").selectBox("disable");
                    $("#sel_cate_mid").selectBox("options", "<option value=''>전체</option>");
                }
                $("#sel_cate_small").selectBox("disable");
                $("#sel_cate_small").selectBox("options", "<option value=''>전체</option>");

                // 하위 분류 조회
                var subCateNm = (properties_gb == "L") ? "mid" : "small";
                if ("-" != com_cd && com_cd != "") {
                    $("#sel_cate_" + subCateNm).selectBox("enable");

                    $.ajax({
                        beforeSend: function () {
                        },
                        data: {
                            "com_cd": com_cd,
                            "properties_gb": properties_gb
                        },
                        dataType: "json",
                        type: "POST",
                        url: "/cateList.do",
                        success: function (data) {
                            var optionStrs = "";
                            for (i = 0; i < data.cateList.length; i++) {
                                optionStrs = optionStrs + "<option value='" + data.cateList[i].comCd + "'>" + data.cateList[i].cdNm + "</option>";
                            }
                            if (data.cateList.length == 0) {
                                optionStrs = optionStrs + "<option value=''>전체</option>";
                            }
                            $("#sel_cate_" + subCateNm).selectBox("options", optionStrs);
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
            function _getAgeChartOption() {
                // define default chart option
                var _ageChartOpt = {
                    tooltip: {
                        trigger: 'axis', textStyle: {align: 'left'},
                        axisPointer: {type: 'shadow'},
                        //axisPointer:{ show: true,    type : 'line',    lineStyle: {type : 'dashed', width : 1}},
                        formatter: function (param) {
                            console.log(param);
                            return param[0].name + "</br>" + param[0].seriesName + " : " + param[0].value + "% </br>" + (param[1].seriesName == "전체" ? "" : param[1].seriesName + " : " + param[1].value + " %");
                        }
                    },
                    legend: {data: [], x: 'right', y: 'top'},
                    xAxis: [{data: [], type: 'category', boundaryGap: true}],
                    yAxis: [{type: 'value', scale: true, axisLabel: {formatter: '{value} %'}}],
                    series: [{
                        data: [], type: 'line', name: '전체', markPoint: {data: [{type: 'max'}, {type: 'min'}]},
                        itemStyle: {
                            normal: {
                                areaStyle: {color: 'rgba(178,235,244,0.2)'},
                                lineStyle: {color: 'rgba(61,183,204,0.4)', width: 2}
                            }
                        }
                    },
                        {
                            data: [], type: 'line', name: '', markPoint: {data: [{type: 'max'}, {type: 'min'}]},
                            itemStyle: {normal: {lineStyle: {width: 4.5, zlevel: 5}}}
                        }]
                };

                // set chart data
                var allChartData = [], subChartData = [];
                $.each(${jsonAgeChartList}, function (idx, data) {
                    if (data.cnctCtgCd == '-') {
                        allChartData.push({name: data.mbrCnt, value: parseFloat(data.totMbrCnt)});
                    }
                    else {
                        subChartData.push({name: data.mbrCnt, value: parseFloat(data.totMbrCnt)});
                    }
                });
                if (subChartData.length == 0) {
                    subChartData = allChartData;
                }

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
            function _grepSexChartData(sexCd, chartData, opt) {
                var chartData = $.grep(chartData, function (value, idx) {
                    return value.sexCd == sexCd;
                });
                return $.map(chartData, function (value, idx) {
                    return parseFloat(value.totMbrCnt) * ($.isNumeric(opt) ? opt : 1);
                });
            }
            function _getSexChartOption() {
                // define default chart option
                var _sexChartOpt = {
                    tooltip: {
                        trigger: 'item', textStyle: {align: 'left'}, formatter: function (value) {
                            return value.seriesName + "</br>" + value.name + " : " + value.data + " %"
                        }
                    },
                    legend: {data: [], x: 'right'},
                    //calculable : true,
                    xAxis: [{data: [], type: 'category'}],
                    yAxis: [{type: 'value', scale: false, axisLabel: {formatter: '{value} %'}}],
                    series: [{
                        data: [],
                        name: '',
                        type: 'bar',
                        barGap: '2%',
                        barCategoryGap: '40%',
                        itemStyle: {normal: {color: GV_GENDER_COLOR.male(0.95), label: {show: true}}}
                        ,
                        markLine: {data: [], itemStyle: {normal: {color: GV_GENDER_COLOR.male()}}}
                    },
                        {
                            data: [],
                            name: '',
                            type: 'bar',
                            itemStyle: {normal: {color: GV_GENDER_COLOR.female(0.95), label: {show: true}}}
                            ,
                            markLine: {data: [], itemStyle: {normal: {color: GV_GENDER_COLOR.female()}}}
                        }]
                };

                // set chart Data
                var maleData = _grepSexChartData('M', ${jsonSexChartList});
                var femaleData = _grepSexChartData('F', ${jsonSexChartList});

                // cross 방향
                var crossMData = [[{type: 'max'}, {type: 'min'}]], crossFData = [[{type: 'max'}, {type: 'min'}]];
                if (femaleData.length == 1) femaleData.push(femaleData[0]);
                if (maleData.length == 1) maleData.push(femaleData[0]);
                if (maleData[0] < maleData[0][1]) {
                    crossMData = [[{type: 'min'}, {type: 'max'}]];
                }
                if (femaleData[0] < femaleData[1]) {
                    crossFData = [[{type: 'min'}, {type: 'max'}]];
                }

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
            function _getSexAgeChartOption() {
                // define default chart option
                var _sexAgeChartOpt = {
                    calculable: true,
                    tooltip: {
                        trigger: 'axis', textStyle: {align: 'left'}, axisPointer: {type: 'shadow'},
                        formatter: function (value) {
                            var rtndata = value[0][1] + "<br/>" + value[1][0] + " : " + value[1].data + " % (전체 " + value[0].data + " %)";
                            rtndata += "<br/> " + value[3][0] + " : " + value[3].data * -1 + "% (전체 " + (value[2].data * -1) + " %)";
                            return rtndata;
                        }
                    },
                    legend: {data: [], x: 'right'},
                    grid: {y: 80},
                    xAxis: [{
                        type: 'value', position: 'bottom', scale: false,
                        axisLabel: {
                            formatter: function (value) {
                                if (value > 0) return value + "%"; else return (-1 * value) + "%";
                            }
                        },
                        splitLine: {lineStyle: {type: 'dashed'}}
                    }],
                    yAxis: [{
                        data: [],
                        boundaryGap: false,
                        type: 'category',
                        axisLine: {show: false},
                        axisTick: {show: false}
                    }],
                    // 전체 (남)
                    series: [{
                        data: [], name: '', type: 'line', symbolSize: 0,
                        itemStyle: {
                            normal: {
                                label: {show: false},
                                color: GV_GENDER_COLOR.male(),
                                areaStyle: {color: GV_GENDER_COLOR.male(0.2)},
                                lineStyle: {color: 'rgba(255,255,255,0)'}
                            }
                        }
                    },

                        // 카테고리 (남)
                        {
                            data: [], name: '', type: 'line', symbolSize: 5, barWidth: 32,
                            itemStyle: {normal: {label: {show: true}, lineStyle: {width: 3.5}}}
                        },

                        // 전체 (여)
                        {
                            data: [], name: '', type: 'line', symbolSize: 0,
                            itemStyle: {
                                normal: {
                                    label: {show: false},
                                    color: GV_GENDER_COLOR.female(),
                                    areaStyle: {color: GV_GENDER_COLOR.female(0.2)},
                                    lineStyle: {color: 'rgba(255,255,255,0)'}
                                }
                            }
                        },
                        // 카테고리 (여)
                        {
                            data: [], name: '', type: 'line', symbolSize: 5, barWidth: 32,
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true, position: 'left'
                                        , formatter: function (value) {
                                            return (-1 * value.data);
                                        }
                                    }
                                    , lineStyle: {width: 3.5}
                                }
                            }
                        },
                        // 전체 legend 를 위한 Temp
                        {
                            data: [0, 0, 0, 0, 0, 0, 0], name: '', type: 'bar', symbolSize: 0,
                            itemStyle: {
                                normal: {
                                    label: {show: false},
                                    color: GV_GENDER_COLOR.male(),
                                    areaStyle: {color: GV_GENDER_COLOR.male(0.2)},
                                    lineStyle: {color: 'rgba(255,255,255,0)'}
                                }
                            }
                        },
                        {
                            data: [0, 0, 0, 0, 0, 0, 0], name: '', type: 'bar', symbolSize: 0,
                            itemStyle: {
                                normal: {
                                    label: {show: false},
                                    color: GV_GENDER_COLOR.female(),
                                    areaStyle: {color: GV_GENDER_COLOR.female(0.2)},
                                    lineStyle: {color: 'rgba(255,255,255,0)'}
                                }
                            }
                        }

                    ]
                };

                // set chart option
                _sexAgeChartOpt.legend.data = sexCategory;
                _sexAgeChartOpt.yAxis[0].data = ageRangeCategory;

                _sexAgeChartOpt.series[0].name = "전체";
                _sexAgeChartOpt.series[0].data = _grepSexChartData('M', ${jsonSexAgeAllChartList});


                _sexAgeChartOpt.series[1].name = sexCategory[0];
                _sexAgeChartOpt.series[1].data = _grepSexChartData('M', ${jsonSexAgeChartList});


                _sexAgeChartOpt.series[2].name = "전체";
                _sexAgeChartOpt.series[2].data = _grepSexChartData('F', ${jsonSexAgeAllChartList}, -1);


                _sexAgeChartOpt.series[3].name = sexCategory[1];
                _sexAgeChartOpt.series[3].data = _grepSexChartData('F', ${jsonSexAgeChartList}, -1);


                _sexAgeChartOpt.series[4].name = sexCategory[2];
                _sexAgeChartOpt.series[5].name = sexCategory[3];


                return _sexAgeChartOpt;
            }

        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>