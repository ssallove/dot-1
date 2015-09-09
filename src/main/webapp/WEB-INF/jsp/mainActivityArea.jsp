<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/directive.jsp" %>
<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="content">
        <!-- main-container -->
        <section>
            <p class="activityA">
                <img src="resources/images/activity_img.jpg" title="주활동지역 상단 이미지"/>
            </p>

            <div class="container mb100">
                <h1>
                    주 활동지역
                    <span class="date" id="baseDt"></span>
                </h1>
                <!---지역별 모수 현황-->
                <h2>지역별 모수 현황</h2>

                <div class="detailLy2">
                    <p class="btSpace">
                        <button class="view" type="button" data-toggle="modal" data-target="#myModal">지역별 모수 현황 리스트
                        </button>
                    </p>
                    <p class="txt">[지역별 모수 현황 리스트]를 클릭 하시면 자세한 내용을 볼 수 있습니다.</p>
                    <!-- 지도 영역-->
                    <div class="layoutLR ">
                        <li class="LF">
                            <div class="round_chartArea">
                                <!--Button Korea Map-->
                                <p class="koreaBtn ">
                                    <button type="button" id="clickKoreaMap">Korea Map</button>
                                </p>
                                <p>

                                <div id="koreaMap" style="height: 600px"></div>
                                </p>
                            </div>
                        </li>
                        <!-- 막대 챠트 영역-->
                        <li class="RG">
                            <div class="round_chartArea">
                                <div id="chartContainer"></div>
                            </div>
                        </li>
                    </div>
                </div>
                <!---//지역별 모수 현황-->
                <div id="divSubData" style="display: none;">
                    <!--성연령대별 현황-->
                    <h2>성연령대별 현황</h2>

                    <div class="chartLy">
                        <ul class="chartLy_1p ">
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성연령대 현황
                                </p>

                                <div class="chartArea">
                                    <div id="chart3" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="chartLy  mt80">
                        <ul class="chartLy_2p ">
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성별/연령대별 현황
                                    <span id="chart2ParentTitle"></span>
                                </p>

                                <div class="chartArea">
                                    <div id="chart1" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성별/연령대별 현황
                                    <span id="chart2SubTitle"></span>
                                </p>

                                <div class="chartArea">
                                    <div id="chart2" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--//성연령대별 현황-->
                    <div class="layoutLR">
                        <!--업종 순위-->
                        <div class="floatL mt80" style="width: 33% !important">
                            <div class="rankingLy">
                                <p class="icon"></p>

                                <div class="inBox inBoxBg">
                                    <h3>업종 순위 (소분류)</h3>
                                    <ul id="rankGrid"></ul>
                                </div>
                            </div>
                        </div>
                        <!--//업종 순위-->
                        <!--함께 방문하는 지역 -->
                        <div class="floatR mt80 regionLy2" style="width: 65% !important">

                            <p class="tit">함께 방문하는 지역</p>
                            <p class="btnSp">
                                <button class="button" type="button" data-toggle="modal" id="chart6_popup" data-target="#myModa2">확대보기
                                </button>
                            </p>

                            <div class="inBox2">
                                <div id="chart4" style="width:100%; height: 480px;"></div>
                            </div>
                        </div>
                        <!--//함께 방문하는 지역 -->
                    </div>
                </div>
            </div>
        </section>
        <!--// main-container-->

        <!-- Modal 지역별 모수 현황  GRID -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modalWd">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 id="myModalLabel">지역별 모수 현황</h3>
                        <!--현황지역 설명 박스-->
                        <div class="dongBox2 mb10">
                            <li class="box ">
                                <!--현황 지역-->
                                <ul>
                                    <li class="LF">현황 지역</li>
                                    <li class="RG fontBlue " id="areaDong">역삼동</li>
                                </ul>
                            </li>
                            <li class="box">
                                <!--모수-->
                                <ul>
                                    <li class="LF">모수</li>
                                    <li class="RG fontGreen " id="areaMosu">2,117,088</li>
                                </ul>
                            </li>
                            <li class="box">
                                <!--PUSH 동의-->
                                <ul>
                                    <li class="LF">PUSH 동의</li>
                                    <li class="RG fontYellow " id="areaPush">725,423</li>
                                </ul>
                            </li>
                        </div>
                        <!--//현황지역 설명 박스-->
                    </div>
                    <div class="modal-body ">
                        <table class="listTB tStriped">
                            <colgroup>
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>현황지역</th>
                                <th>모수</th>
                                <th>PUSH 동의</th>
                            </tr>
                            </thead>
                            <tbody id="mosuTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--//Modal 지역별 모수 현황-->






<!--Modal 동단위 현황지역 -->
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  id="chartDongDiv">
	<div class="modal-dialog3 ">
        <div class="modal-content">
			<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                <!--현황지역 설명 박스-->
            		<div class="dongBox">
            			<li class="box ">
                        	<!--현황 지역-->
                        	<ul>
                            	<li class="LF">현황 지역</li>
                                <li class="RG fontBlue " id="dongNm">역삼동</li>
                            </ul>
                        </li>
                		<li class="box">
                        	<!--모수-->
                        	<ul>
                            	<li class="LF">모수</li>
                                <li class="RG fontGreen " id="dongMosu">2,117,088</li>
                            </ul>
                        </li>
                		<li class="box">
                        	<!--PUSH 동의-->
                        	<ul>
                            	<li class="LF">PUSH 동의</li>
                                <li class="RG fontYellow " id="dongPush">725,423</li>
                            </ul>
                        </li>
            		</div>
            		<!--//현황지역 설명 박스-->

			</div>
            <div class="modal-body">
            	<!--성연령대별 현황-->
                <div class="chartLy mt10">
                	<ul class="chartLy_3p ">
                    	<li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별 현황</p>
                        	<div class="chartArea2" id="chartDong1" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                        <li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별/연령대별 현황<span id="chartDong2SubTitle"></span></p>
                        	<div class="chartArea2" id="chartDong2" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                        <li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별/연령대별 현황<span id="chartDong3SubTitle"></span></p>
                        	<div class="chartArea2" id="chartDong3" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                    </ul>
                </div>
				<!--//성연령대별 현황-->
                
                <div class="layoutLR mt10">
                	<!--업종 순위-->
                	<div class="floatL" style="width:33% !important">
                    	<div class="rankingLy">
                        	<p class="icon"></p>
                            <div class="inBox">
                            	<h3>업종 순위 (소분류)</h3>
                                <ul id="dongRankGrid"></ul>
							</div>
                    	</div>
                     </div>
                     <!--//업종 순위-->
                     
                     <!--함께 방문하는 지역 -->
                     <div class="floatR regionLy" style="width:65% !important">
                     	<p class="tit">함께 방문하는 지역</p>
                        <div class="inBox">
                            <div id="chart5"  style="width:760px !important; height:370px;"></div>
                        </div>
                     </div>
                     <!--//함께 방문하는 지역 -->
                </div>

			</div>
        </div>
    </div>
</div>
<!--//Modal 현황지역-->







<!-- Modal 함께 방문하는 지역  네트웍차트 -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">

        <div class="modal-content" style="width:100% !important;">
			<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h3 id="myModalLabel">함께 방문하는 지역</h3>
			</div>

            <div class="modal-body">
            
				<!--Search-->
                <div class="searchConts mb10" style="min-width:auto !important">
                	<table style="margin-top:-5px;">
                    	<colgroup>
                            <col width="50px">
                            <col width="220px">
                             <col width="50px">
                            <col width="220px">
                        </colgroup>
    					<tbody>
        					<tr>
        					    <th>기준 행정동</th>
        					    <td>
                                	<select  name="size" id="mainAdmDongCdCnt" title="main 행정동 " style="width:160px">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
							    	</select>
                                </td>
                                <th>연관 행정동</th>
        					    <td>
                                    <select  style="width:150px"  name="size" id="crossAdmDongCdCnt" title="cross 행정동 ">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
							    	</select>
                                </td>
        					</tr>
       					</tbody>
					</table>
                    <!--Btn_search-->

                    <p class="btnSrc_sm_modal"><button  name="btnSearch" id="btnSearch" type="button">검색버튼</button></p>
                     <!--//Btn_search-->
				</div>
                <!--//Search-->
                <div class="layoutLR modalChartLy">

                    <div class="floatL" style="width:80%">
                        <div id="chart6"  style="width:100%; height:500px;"></div>
                    </div>

                    <div class="floatR" style="width:19%">
                        <div class="chartIcon">
                            <button class="plus" id="maxButton"><i class="fa fa-plus"></i></button>
                            <button class="minus" id="minButton"><i class="fa fa-minus"></i></button>
                            <p class="line">
                                <button class="line1" id="thinethickLine"><i class="fa fa-plus"></i></button>
                                <button class="line2" id="thineLine"><i class="fa fa-plus"></i></button>
                                <button class="line3" id="thickLine"><i class="fa fa-plus"></i></button>
                            </p>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<!-- //Modal 함께 방문하는 지역-->  


    </tiles:putAttribute>
    <tiles:putAttribute name="javascript.footer">

        <script src="<c:url value=" /resources/geo/geo.js "/>"></script>

        <script type="text/javascript" src="<c:url value=" /resources/bootstrap/js/jasny-bootstrap.js "/>"></script>

        <script type="text/javascript">

            var City = (function(){
                return {
                    cd : "",
                    name : "",
                    data : {}
                };
            })();

            var Network = (function(){
                return {
                    option : {},
                    mainAdmDongCdCnt : 5,
                    crossAdmDongCdCnt : 10,
                    height : 0,
                    width : 0,
                    MAIN_CHART_ID_NM : "chart4", // 메인 차트
                    DONG_CHART_ID_NM : "chart5", // 동 차트
                    MAX_CHART_ID_NM : "chart6", // 확대 /축소 차트
                    NODE_COLOR : "",
                    NODE_BORDER_COLOR : "",
                    LINE_COLOR : ""
                };
            })();

            $(document).ready(function () {

                var chartWidth = (($(document).width() - 240)/100*98/3)-40;    // screen.availWidth

                $('#chartDong1').width(chartWidth);
                $('#chartDong2').width(chartWidth);
                $('#chartDong3').width(chartWidth);
                $('#chart6').width('1502');

                $("#mainAdmDongCdCnt").selectBox("value", "10");
                $("#crossAdmDongCdCnt").selectBox("value", "5");

                var start = Date.now();
                getGeoMapMaker(); // 지도 호출
                console.log("Page load took $(document).ready(function () {" + (Date.now() - start) + " milliseconds");

                $("#clickKoreaMap").click(function () {
                    callAjaxMainActivityArea("", "", "getCallBack");
                });

            });

            $('#chart6_popup').click(function(){

                Network.mainAdmDongCdCnt = 10; // main 행정동 갯수
                Network.crossAdmDongCdCnt = 5;
                var cityCd = City.cd;
                if(City.cd.length > 6) {
                    cityCd = City.cd.substring(0, 6);
                }
                callAjaxMainActivityArea(City.name, cityCd, getNetworkChartPopup);

            });

            $('#thineLine').click(function(){

                var myChart = echarts.init(document.getElementById(Network.MAX_CHART_ID_NM));

                $.each(Network.option.series[0].links, function(idx, data) {
                    if (data.itemStyle.normal.width === 3) {
                        data.itemStyle.normal.color = '#f8f8f8';
                    } else {
                        data.itemStyle.normal.color = Network.LINE_COLOR;
                    }
                });

                myChart.setOption(Network.option);
                myChart.refresh();

                getNetworkChartClickEvent(myChart);

            });

            $('#thickLine').click(function(){

                var myChart = echarts.init(document.getElementById(Network.MAX_CHART_ID_NM));

                $.each(Network.option.series[0].links, function(idx, data) {
                    if (data.itemStyle.normal.width === 1.5) {
                        data.itemStyle.normal.color = '#f8f8f8';
                    } else {
                        data.itemStyle.normal.color = Network.LINE_COLOR;
                    }
                });

                myChart.setOption(Network.option);
                myChart.refresh();

                getNetworkChartClickEvent(myChart);

            });

            $('#thinethickLine').click(function(){

                var myChart = echarts.init(document.getElementById(Network.MAX_CHART_ID_NM));

                $.each(Network.option.series[0].links, function(idx, data){
                    data.itemStyle.normal.color = Network.LINE_COLOR;
                });

                myChart.setOption(Network.option);
                myChart.refresh();

                getNetworkChartClickEvent(myChart);

            });

            $('#minButton').click(function(){

                Network.option.series[0].scaling = Number(Network.option.series[0].scaling) - 0.3;
                Network.option.series[0].gravity = Number(Network.option.series[0].gravity) - 1;

                if(Network.option.series[0].scaling < 3) {
                    Network.option.series[0].scaling = 3.1;
                }

                if(Network.option.series[0].gravity < 4){
                    Network.option.series[0].gravity = 4.1;
                }

                var myChart = echarts.init(document.getElementById(Network.MAX_CHART_ID_NM));
                myChart.setOption(Network.option);
                myChart.refresh();

                var height = $('#' + Network.MAX_CHART_ID_NM).height();
                height = height - 100;
                if(height < 500) {
                    height = 500;
                }

                $('#modalChartLy').height(height); //  차트 박스 테두리
                $('#' + Network.MAX_CHART_ID_NM).height(height);

                var canvas = $('canvas');
                canvas.attr('z-index', 100);
                canvas.attr('margin', 0);
                canvas.attr('padding', 0);

                getNetworkChartClickEvent(myChart);

            });

            $('#maxButton').click(function(){

                Network.option.series[0].scaling = Number(Network.option.series[0].scaling) + 0.3;
                Network.option.series[0].gravity = Number(Network.option.series[0].gravity) + 1;

                var myChart = echarts.init(document.getElementById(Network.MAX_CHART_ID_NM));
                myChart.setOption(Network.option);
                myChart.refresh();

                var height = $('#' + Network.MAX_CHART_ID_NM).height();
                height = height + 100;
                $('#modalChartLy').height(height); //  차트 박스 테두리
                $('#' + Network.MAX_CHART_ID_NM).height(height);

                var canvas = $('canvas');
                canvas.attr('z-index', 100);
                canvas.attr('margin', 0);
                canvas.attr('padding', 0);

                getNetworkChartClickEvent(myChart);

            });

            $('#btnSearch').click(function(){

                Network.mainAdmDongCdCnt = $('#mainAdmDongCdCnt option:selected').val(); // main 행정동 갯수
                Network.crossAdmDongCdCnt = $('#crossAdmDongCdCnt option:selected').val(); // cross 행정동 갯수

                callAjaxMainActivityArea(City.name, City.cd, "getCallbackChart6");

            });

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

                if(City.cd.length === 8 ) {
                    var dongName = $('#dongNm').text().split(' ')[2];
                }

                categoriesList[0] = {name: ''};
                categoriesList[1] = {name: ''};

                var confidenceSum = 0.0;
                for(var i=0; i<dataLinkList.length; i++){
                    confidenceSum += Number(dataLinkList[i].confidence);
                }

                var confidenceAve = confidenceSum / dataLinkList.length;

                $.each(dataNodeList, function(idx, data){

                    if(data.dongNm === categoriesList[0].name) {
                        categoryIdx = 0;
                    } else {
                        categoryIdx = 1;
                    }

                    nodeList[idx] = {

                        category: categoryIdx,
                        name: data.dongNm,
                        value: data.mbrCnt,
                        label: data.dongNm,
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
                                    if(City.cd.length === 8) {
                                        var cityColor = "";
                                        (dongName === d.dongNm) ? cityColor = '#ff4f84' : cityColor = '#49cdf4'
                                        return cityColor;
                                    } else {
                                        if (d.dongType === '1') {
                                            return '#ff4f84';
                                        } else {
                                            return '#49cdf4';
                                        }
                                    }
                                })(data)
                            }
                        }
                    }

                });

                $.each(dataLinkList, function(idx, data){

                    linkList[idx] = {
                        source: data.srcDongNm,
                        target: data.tgtDongNm,
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
                                linkSymbol: 'arrow',
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

            function getNetworkChartClickEvent(myChart) {

                var ecConfig = echarts.config;

                function focus(param) {

                    $.each(Network.option.series[0].nodes, function(idx, data){

                        if(data.name == param.name){

                            data.itemStyle.normal.color = '#ff4f84';
                            data.itemStyle.normal.label.textStyle.color = '#db0948';
                            data.itemStyle.normal.label.textStyle.fontSize = 30;
                            data.itemStyle.normal.label.textStyle.fontWeight = 'bold';

                        }else{

                            data.itemStyle.normal.color = Network.NODE_COLOR;
                            data.itemStyle.normal.label.textStyle.color = 'black';
                            data.itemStyle.normal.label.textStyle.fontSize = 14;
                            data.itemStyle.normal.label.textStyle.fontWeight = 'normal';
                            data.itemStyle.normal.label.textStyle.fontStyle = 'normal';

                        }

                    });

                    myChart.setOption(Network.option);

                    myChart.refresh();

                }

                myChart.on(ecConfig.EVENT.DBLCLICK, focus);

            }

            function getNetworkChartPopup(data, cityName, cityCd) {

                var height = 500;

                $('#modalChartLy').height(height); //  차트 박스 테두리
                $('#' + Network.MAX_CHART_ID_NM).height(height);

                $("#mainAdmDongCdCnt").selectBox("value", "10");
                $("#crossAdmDongCdCnt").selectBox("value", "5");

                getNetworkChart("chart6", data.arPocNetworkNodeList, data.arPocNetworkLinkList); // 확대/축소 팝업 네트워크 차트

            }

            function getNetworkChart(chartName, dataNodeList, dataLinkList) {
                var myChart = echarts.init(document.getElementById(chartName));

                myChart.setTheme(GV_CHART_THEME);

                myChart.setOption(_getNetworkChartOption(dataNodeList, dataLinkList));

                getNetworkChartClickEvent(myChart);

                resizeChartOnWinResizeHandler.on(myChart);

            }

            function openDongView(cityName, cityCd){
				callAjaxMainActivityArea(cityName, cityCd, function(data, cityName, cityCd ){
					// 타이틀
					if(data.mosuTableList.length > 0){
						var dongVO = data.mosuTableList[0];
						$("#dongNm").text((GV_PARENT_CITY_NM == "전국" ? "" : GV_PARENT_CITY_NM)+" "+GV_CITY_NM+" "+dongVO.mainAcvtDongNm); // GV_CITY_NM
						$("#dongMosu").text(String(dongVO.mosu).addComma());
						$("#dongPush").text(String(dongVO.push).addComma());
						$("#chartDong2SubTitle").text(GV_CITY_NM);
						$("#chartDong3SubTitle").text(cityName);
					}
					// 업종순위
					var rankTxt = "";
					var rankList = data.rankTableList;
					for(var i=0, len=rankList.length; i<len; i++){
						if(i==0){	rankTxt = rankTxt + ' <li class="wdh100"><span class="high">'+(i+1)+'</span><span class="txtHigh">'+rankList[i].ctgNm+'</span></li>';	}
						else{	rankTxt = rankTxt + ' <li class="wdh100"><span class="low">'+(i+1)+'</span>'+rankList[i].ctgNm+'</li>';	}
					}
					$("#dongRankGrid").empty();	$("#dongRankGrid").html(rankTxt);
					// Chart 
					GV_CITY_NM = cityName;
					getSexAgePieChart('chartDong2', 'chartDong3', data.sexBarList, data.ageBarList);
					getSexAgeBarChart('chartDong1', data.sexAgeBarList);
                    getNetworkChart("chart5", data.arPocNetworkNodeList, data.arPocNetworkLinkList); // 동 팝업 네트워크 차트
				});
			}

            function callAjaxMainActivityArea(cityName, cityCd, callbackFun) {

                City.name = cityName;
                City.cd = cityCd;

                if ((cityName != null && cityName != '') && (cityCd == null || cityCd == 'undefined' || cityCd == '')) {
                    if (chartDataList != null && chartDataList.length != 0) {
                        var selectedData = chartDataList.getDataByKey("mainAcvtDongNm", cityName);
                        if (selectedData != null) {
                            cityCd = selectedData.mainAcvtAdmDongCd;
                        }
                    }
                }

                $.ajax({
                    url: "/mainMosuList.do",
                    type: "POST",
                    dataType: "json",
                    data: {
                        "cityName": cityName,
                        "cityCd": cityCd,
                        "mainAdmDongCdCnt" : Network.mainAdmDongCdCnt,
                        "crossAdmDongCdCnt" : Network.crossAdmDongCdCnt
                    },
                    success: function (data) {

                        City.data = data;

                        // callback
                        if (callbackFun != null && callbackFun != 'undefined' && callbackFun != '') {

                            if ($.isFunction(callbackFun)) {
                                callbackFun(data, cityName, cityCd);
                            } else if (typeof(callbackFun) == "string") {
                                eval(callbackFun + "(data, cityName, cityCd);");
                            }
                        }
                    }
                });
            }

            var chartDataList = [];
            var GV_CITY_CD, GV_CITY_NM, GV_PARENT_CITY_NM;

            function getCallbackChart6(data, cityName, cityCd) {
                getNetworkChart("chart6", data.arPocNetworkNodeList, data.arPocNetworkLinkList);
            }

            function getCallBack(data, cityName, cityCd) {

//                var start = Date.now();

                GV_CITY_CD = cityCd;
                GV_CITY_NM = cityName;

                $('#chart2SubTitle').text(GV_CITY_NM);
                $("#baseDt").text("데이터 기준일 : "+data.baseDt);

                getAreaMosuTable(data.mosuTableList);
                getAreaMosuStackChart(data.mosuTableList); // 지역별 모수 현황 차트

                chartDataList = data.mosuTableList;

                if (cityCd == "" || cityCd == "00") {
                    $('#divSubData').hide();
                } else {
                    $('#divSubData').show();
                    getSexAgePieChart('chart1', 'chart2', data.sexBarList, data.ageBarList);
                    getSexAgeBarChart('chart3', data.sexAgeBarList);
                    getRankTable(data.rankTableList);


                    getNetworkChart("chart4", data.arPocNetworkNodeList, data.arPocNetworkLinkList);

                }

//                if (cityName == "") {
//                    getGeoMapMaker(); // 지도 호출
//                }

//                console.log("Page load took getCallBack " + (Date.now() - start)  + " milliseconds");
            }

            // 지역별 모수 현황
            function getAreaMosuTable(list) {
                var contentTxt = "";
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        if (i == 0) {
                            $("#areaDong").text(list[i].mainAcvtDongNm);
                            $("#areaMosu").text(String(list[i].mosu).addComma());
                            $("#areaPush").text(String(list[i].push).addComma());
                        } else {
                            contentTxt += '      <tr> ';
                            if (list[i].mainAcvtAdmDongCd.length > 5) {
                                contentTxt += '        <td class="txtC"><a href="#" onclick="openDongView(\''+list[i].mainAcvtDongNm+'\', \''+list[i].mainAcvtAdmDongCd+'\'); return false;" data-target="#myModa3" data-toggle="modal" id="inputTest_'+list[i].mainAcvtAdmDongCd+'">' + list[i].mainAcvtDongNm + '<span class="floatR"><i class="fa fa-chevron-right"></i></span></a></td> ';
                            } else {
                                contentTxt += '        <td class="txtC">' + list[i].mainAcvtDongNm + '</td> ';
                            }    
                            contentTxt += '        <td>' + String(list[i].mosu).addComma() + '</td> ';
                            contentTxt += '        <td>' + String(list[i].push).addComma() + '</td> ';
                            contentTxt += '      </tr> ';
                        }
                    }
                } else {
                    contentTxt += '      <tr>  ';
                    contentTxt += '        <td colspan="3" class="noData"><i class="fa fa-file-text-o"></i>데이터가 없습니다.</td>  ';
                    contentTxt += '      </tr>  ';
                }
                $("#mosuTable").empty();
                $("#mosuTable").append(contentTxt);
            }

            // 업종 순위
            function getRankTable(list) {
                var contentTxt = "";
                for (var i = 0; i < list.length; i++) {
                    if (i == 0) {
                        contentTxt += '<li class="wdh100"><span class="high">' + (i + 1) + '</span><span class="txtHigh">' + list[i].ctgNm + '</span></li>';
                    } else {
                        contentTxt += '<li class="wdh100"><span class="low">' + (i + 1) + '</span>' + list[i].ctgNm + '</li>';
                    }
                }
                $("#rankGrid").empty();
                $("#rankGrid").append(contentTxt);
            }
            /**
             * ##############  지역별 모수 현황 차트 START  ##############
             */
            //
            var areaMosuStackChart;

            function getAreaMosuStackChart(dataList) {
                var dataSize = dataList.length;
                if (dataSize > 30) {
                    $('#chartContainer').height('800px');
                } else if (dataSize > 25) {
                    $('#chartContainer').height('700px');
                } else if (dataSize > 15) {
                    $('#chartContainer').height('600px');
                } else if  (dataSize > 40) {
                    $('#chartContainer').height('900px');
                }
                else {
                    $('#chartContainer').height('500px');
                }

                var myChart = echarts.init(document.getElementById('chartContainer'));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getAreaMosuStackOption(dataList));

                myChart.on(echarts.config.EVENT.CLICK, function (param) {
                    var selectedData = dataList.getDataByKey("mainAcvtDongNm", param.name);
                    if (selectedData != null) {
                        var cityCd = selectedData.mainAcvtAdmDongCd;
                        if (cityCd.length > 5) {
                            $("#inputTest_"+cityCd).trigger("click");
                        } else {
                            var cityName = param.name;
                            if(cityName == "세종특별자치시") {
                                $("#inputTest_"+cityCd).trigger("click");
                            }
                        }
                    }
                });
            }

            // Chart의 Option 정보
            function _getAreaMosuStackOption(dataList) {
                var chartDatas = _getAreaMosuStackChartData(dataList);

                var option = {
                    title : {
                        text: $("#areaDong").text(),
                        subtext: "모수 : " + $("#areaMosu").text() + ", PUSH 동의 : " + $("#areaPush").text()
                    },
                    grid: {
                        x: 100
                    },
                    dataZoom: {
                        x: '850',
                        show: true
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                        formatter: function (params) {
                            return params[0].name + '<br/>' + params[0].seriesName + ' : ' + String(params[0].value).addComma() + '<br/>' + params[1].seriesName + ' : ' + String(params[1].value).addComma();
                        }
                    },
                    legend: {
                        selectedMode: false,
                        x: 'right',
                        data: ['모수-PUSH', 'PUSH']
                    },
                    calculable: true,
                    yAxis: [{
                        type: 'category',
                        axisLine: {
                            lineStyle: {
                                width: 1
                            }
                        },
                        axisLabel: 
                        {
                            clickable: (GV_CITY_NM != "세종특별자치시") ? (GV_CITY_CD.length >= 5) : (GV_CITY_CD.length >= 1), 
                            textStyle: {
                                color: ((GV_CITY_NM != "세종특별자치시") ? (GV_CITY_CD.length >= 5) : (GV_CITY_CD.length >= 1)) ? 'rgba(0, 0, 255, 1)' : 'rgba(0, 0, 0, 1)'
                            }
                        },
                        data: chartDatas[1]
                    }],
                    xAxis: [{
                        type: 'value',
                        axisLine: {
                            show: false,
                            lineStyle: {
                                width: 1
                            }
                        },
                        boundaryGap: [0, 0.01]
                    }],
                    series: chartDatas[0]
                };

                return option;
            }

            // Chart Data로 parsing
            function _getAreaMosuStackChartData(dataList) {
                var chartData = [],   categoryData = [];
                var data = [];
                data['모수-PUSH'] = [];
                data['PUSH'] = [];
                for (var status = 1, dataSize = dataList.length; status < dataSize; status++) {

                    if (status < 6) {
                        data['모수-PUSH'][dataSize - status - 1] = {
                            value: dataList[status].mosu,
                            itemStyle: {
                                normal: {
                                    color: GV_GENDER_COLOR.female(0.65),
                                    barBorderColor: GV_GENDER_COLOR.female(0.75)
                                }
                            }
                        };
                        data['PUSH'][dataSize - status - 1] = {
                            value: dataList[status].push,
                            itemStyle: {
                                normal: {
                                    barBorderColor: GV_GENDER_COLOR.female(0.75),
                                    label: {
                                        textStyle: {
                                            color: GV_GENDER_COLOR.female(0.75)
                                        }
                                    }
                                }
                            }
                        };
                    } else {
                        data['모수-PUSH'][dataSize - status - 1] = {	value: dataList[status].mosu	};
                        data['PUSH'][dataSize - status - 1] = {	value: dataList[status].push	};
                    }
                    categoryData[dataSize - status - 1] = dataList[status].mainAcvtDongNm;
                }
                
                
                
                
                chartData.push({
                    name: '모수-PUSH',
                    type: 'bar',
                    stack: 'sum',
                    barCategoryGap: '40%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.65),
                            barBorderColor: GV_GENDER_COLOR.male(0.75),
                            barBorderWidth: 2,
                            barBorderRadius: 0,
                            label: {
                                show: false,
                                position: 'insideBottom'
                            }
                        }
                    },
                    data: data['모수-PUSH']
                });

                chartData.push({
                    name: 'PUSH',
                    type: 'bar',
                    stack: 'sum',
                    itemStyle: {
                        normal: {
                            color: '#fff',
                            barBorderColor: GV_GENDER_COLOR.male(0.75),
                            barBorderWidth: 2,
                            barBorderRadius: 0,
                            label: {
                                show: true,
                                position: 'right',
                                textStyle: {
                                    color: GV_GENDER_COLOR.male(0.95),	fontStyle: 'italic', fontWeight : 'lighter'
                                },
                                formatter: function (params) {
                                    var idx = 0;
                                    for (var i = 0, l = categoryData.length; i < l; i++) {
                                        if(categoryData[i] === params.name) {
                                            idx = i;
                                            break;
                                        }
                                    }
                                    for (var i = 0, l = categoryData.length; i < l; i++) {
                                        return String(parseInt(data['모수-PUSH'][idx].value) + parseInt(params.value)).addComma();
                                    }
                                }
                            }
                        }
                    },
                    data: data['PUSH']
                });
                return [chartData, categoryData];
            }

            /**
             * ##############  지역별 모수 현황 차트 END  ##############
             */

            /**
             * ##############  성별/연령대별 차트 START  ##############
             */
             var sexMap = {
            	        'F' : '여성',
            	        'M' : '남성'
            	    }
             var ageRangeMap = {
                     '0009' : '10세 미만',
                     '1019' : '10대',
                     '2029' : '20대',
                     '3039' : '30대',
                     '4049' : '40대',
                     '5099' : '50세 이상',
                     'ZZZZ' : '기타(연령)'
                 }

            function getSexAgePieChart(allChartId, chartId, sexList, ageList) {
            	var isMain = allChartId.indexOf('Dong') < 0;
                var datas = _getSexAgePieChartData(isMain, sexList, ageList);
                var myChart = echarts.init(document.getElementById(allChartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgePieOptions(isMain, datas[0], datas[1]));

                myChart = echarts.init(document.getElementById(chartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgePieOptions(isMain, datas[2], datas[3]));

                resizeChartOnWinResizeHandler.on(myChart);
            }

            // Chart의 Option 정보
            function _getSexAgePieOptions(isMain, sexData, ageData) {
                var option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{b} : {c} ({d}%)" //{a} <br/>
                    },
                    legend: {
                        orient: 'vertical', x: 'right', // x: 'center',  y : 'bottom',
                        data: $.map(ageRangeMap, function(val, i){ return val; }) 
                        , show:isMain
                    },
                    calculable: false,
                    series: [{
                        name: '성별',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: isMain ? [0, 90] : [0, 45],
                        x: '20%',
                        width: '40%',
                        funnelAlign: 'right',
                        itemStyle: {
                            normal: {
                                label: {
                                    position: 'inner'
                                },
                                labelLine: {
                                    show: false
                                }
                            }
                        },
                        data: sexData
                    }, {
                        name: '연령별',
                        type: 'pie',
                        radius: isMain ? [105, 140] : [55, 70],
                        x: '60%',
                        width: '35%',
                        funnelAlign: 'left',
                        data: ageData
                    }]
                };
                return option;
            }

            // Chart Data로 parsing
            function _getSexAgePieChartData(isMain, sexList, ageList) {
                var sexAllData = [],
                        sexData = [],
                        ageAllData = [],
                        ageData = [];
                for (var status = 0, dataSize = sexList.length; status < dataSize; status++) {
                    if (sexList[status].admDongNm != GV_CITY_NM) {
                        if(isMain){
                        	GV_PARENT_CITY_NM = sexList[status].admDongNm;
                            $('#chart2ParentTitle').text(GV_PARENT_CITY_NM);	
                        }
                        sexAllData.push({
                            name: sexMap[sexList[status].sexCd],
                            value: sexList[status].totMbrCnt,
                            itemStyle: {
                                normal: {
                                    color: (sexList[status].sexCd == "M" ? GV_GENDER_COLOR.male(0.95) : GV_GENDER_COLOR.female(0.95))
                                }
                            }
                        });
                    } else {
                        sexData.push({
                            name: sexMap[sexList[status].sexCd],
                            value: sexList[status].totMbrCnt,
                            itemStyle: {
                                normal: {
                                    color: (sexList[status].sexCd == "M" ? GV_GENDER_COLOR.male(0.95) : GV_GENDER_COLOR.female(0.95))
                                }
                            }
                        });
                    }
                }
                for (var status = 0, dataSize = ageList.length; status < dataSize; status++) {
                	ageList[status].ageRngNm =ageRangeMap[ageList[status].ageRngCd]; 
                    if (ageList[status].admDongNm != GV_CITY_NM) {
                        //GV_PARENT_CITY_NM = ageList[status].admDongNm;
                        ageAllData.push({
                            name: ageList[status].ageRngNm,
                            value: ageList[status].totMbrCnt
                        });
                    } else {
                        ageData.push({
                            name: ageList[status].ageRngNm,
                            value: ageList[status].totMbrCnt
                        });
                    }
                }
                return [sexAllData, ageAllData, sexData, ageData];
            }

            /**
             * ##############  성별/연령대별 차트 END  ##############
             */

            /**
             * ##############  성연령대별 차트 START  ##############
             */
            //
            function getSexAgeBarChart(chartId, dataList) {
                var myChart = echarts.init(document.getElementById(chartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgeBarOptions(chartId.indexOf('Dong') < 0, dataList));
                resizeChartOnWinResizeHandler.on(myChart);
            }

            // Chart의 Option 정보
            function _getSexAgeBarOptions(isMain, dataList) {
                var chartDatas = _getSexAgeBarChartData(dataList);
                var chartDatas = _getSexAgeBarChartData(dataList);
                
                var option = {
                	grid : {}, 
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : { type : 'shadow' }
                    },
                    calculable: true,
                    legend: {
                        data: [GV_CITY_NM + '(남)', GV_CITY_NM + '(여)', GV_PARENT_CITY_NM + '(남)', GV_PARENT_CITY_NM + '(여)']
                        , show:isMain
                    },
                    xAxis: [{
                        type: 'category',
                        data: ['0~9세', '10~19세', '20~29세', '30~39세', '40~49세', '50세이상', '기타(연령)']
                    }],
                    yAxis: [{
                        type: 'value',
                        min: 0,
                        max: chartDatas[0],
                        axisLabel: {
                            formatter: function(value){	return isMain ? Math.round(value) +' %' : Math.round(value); }
                        }
                    }, {
                        type: 'value',
                        min: 0,
                        max: chartDatas[0],
                        axisLine: {
                            show: false
                        },
                        axisLabel: {
                            show: false,
                            formatter: '{value}'// %
                        }
                    }],
                    series: chartDatas[1]
                };
                if(!isMain){option.grid = {x:30, y:20, width:'90%', height:'70%'}; }
                return option;
            }

            // Chart Data로 parsing
            function _getSexAgeBarChartData(dataList) {
                var sexMAllData = [],
                        sexFAllData = [],
                        sexMData = [],
                        sexFData = [];
                for (var status = 0, dataSize = dataList.length; status < dataSize; status++) {
                    if (dataList[status].admDongNm != GV_CITY_NM) {
                        GV_PARENT_CITY_NM = dataList[status].admDongNm;
                        if (dataList[status].sexCd == 'M') {
                            sexMAllData.push(dataList[status].totMbrCnt);
                        } else {
                            sexFAllData.push(dataList[status].totMbrCnt); //sexFAllData.push(parseFloat(dataList[status].totMbrCnt)*-1);
                        }

                    } else {
                        if (dataList[status].sexCd == 'M') {
                            sexMData.push(dataList[status].totMbrCnt);
                        } else {
                            sexFData.push(dataList[status].totMbrCnt);
                        }
                    }
                }
                /*
                 return [sexMAllData, sexFAllData, sexMData, sexFData];
                 */
                var max = Math.max.apply(null, sexMAllData);
                var subMax = Math.max.apply(null, sexFAllData);
                if (max < subMax) {
                    max = subMax;
                }
                subMax = Math.max.apply(null, sexMData);
                if (max < subMax) {
                    max = subMax;
                }
                subMax = Math.max.apply(null, sexFData);
                if (max < subMax) {
                    max = subMax;
                }

                var chartData = [{
                    name: GV_PARENT_CITY_NM + '(남)',
                    type: 'bar',
                    data: sexMAllData,
                    barCategoryGap: '50%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.4)
                        }
                    }
                }, {
                    name: GV_PARENT_CITY_NM + '(여)',
                    type: 'bar',
                    data: sexFAllData,
                    barCategoryGap: '50%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.female(0.4)
                        }
                    }
                }, {
                    name: GV_CITY_NM + '(남)',
                    type: 'line',
                    yAxisIndex: 1,
                    data: sexMData,
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.95)
                        }
                    }
                }, {
                    name: GV_CITY_NM + '(여)',
                    type: 'line',
                    yAxisIndex: 1,
                    data: sexFData,
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.female(0.95)
                        }
                    }
                }];
                return [max, chartData];
            }

            /**
             * ##############  성연령대별 차트 END  ##############
             */
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>