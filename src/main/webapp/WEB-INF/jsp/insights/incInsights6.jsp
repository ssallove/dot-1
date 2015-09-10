<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--modal-->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog2">
        <div class="modal_content2 ">

            <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">close</span></button>
            <p class="paper_lfBg "></p>

            <p class="paper_rgBg "></p>

            <div class="modal_header2">
                <h2>모바일전단, 얼마나 반응했나?</h2>

            </div>

            <div class="modal_body2">

                <div class="news mt10">
                    <!-- Prepare a Dom with size (width and height) for ECharts -->
                    <div id="wrapper_">
                        <div id="inner">
                            <%--<input class="ip" type="int" placeholder="지난 3개월간 이들 동종 모바일전단을 열람하셨나요?" id="a"/> <!-- 라디오 버튼 예 아니오 -->--%>
                            <h1>
                            지난 3개월간 이들 동종 모바일전단을 열람하셨나요?
                            <input name="arr_a" id ="a1" type="radio" value="1"><label for="a1"><strong>예</strong></label>
                            <input name="arr_a" id ="a2" type="radio" value="0"><label for="a2">아니오</label> <br class="mt10">

                            <%--<input class="ip" type="text" placeholder="지난 3개월간 이들 업종 관련해 SK Planet 서비스를 사용하셨나요?"  id="b"/>--%>
                            지난 3개월간 이들 업종 관련해 SK Planet 서비스를 사용하셨나요?
                            <input name="arr_b" id ="b1" type="radio" value="1"><label for="b1"><strong>예</strong></label>
                            <input name="arr_b" id ="b2" type="radio" value="0"><label for="b2">아니오</label> <br class="mt10">

                            <%--<input class="ip" type="int" placeholder="성별이 무엇인가요?" id="c"/> <!-- 라디오 -->--%>
                            성별이 무엇인가요?
                            <input name="arr_c" id ="c1" type="radio" value="1"><label for="c1"><strong>예</strong></label>
                            <input name="arr_c" id ="c2" type="radio" value="0"><label for="c2">아니오</label> <br class="mt10">

                            <input class="ip" type="int" placeholder="연령은 어떻게 되시나요?" id="d"/> <br class="mt10">
                            <button id='sbm' onclick="javascript:getReact();" class="mt10">반응 확률 보기</button>
                            </h1>
                        </div>
                    </div>
                    <div id="wrapper">
                        <div id="chart1" style="width:100%;height:500px;"></div>
                    </div>
                </div>

                <!--내용1-->
                <div class="news mt10">

                    <h3>발송 및 반응 규모</h3>

                    <p class="exp" style="font-size:15px">3개월간 330만 고객에게 발송되어, OCB Push 동의자 84%를 cover 하고 있다.<br>
                        1개월당 250만 회원에게 발송되고 55만에게 반응하며,<br>
                        1300만건이 발송되고, 190만건이 반응한다.<br></p>

                    <div class="layoutLR  mt30">

                        <ul>
                            <!--챠트-->
                            <li class="floatL boxSty" style="width:50%; margin-right:2%">
                                <p class="newsCbox chart" id="insights6_chart_0" style="height:468px"></p>
                            </li>
                            <!--//챠트-->

                            <!--table 1-->
                            <li class="floatR" style="width:48%;">
                                <table class="listTB2 tStriped3 tBorderT mt20">
                                    <colgroup>
                                        <col width="35%">
                                        <col width="65%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td class="th">동의대비 발송자</td>
                                        <td>83.8%</td>
                                    </tr>
                                    <tr>
                                        <td class="th">발송대비 클릭자</td>
                                        <td>29.9%</td>
                                    </tr>
                                    <tr>
                                        <td class="th">OCB Push 동의자</td>
                                        <td>3,552,671</td>
                                    </tr>
                                    <tr>
                                        <td class="th">발송회원수</td>
                                        <td>3,254,316</td>
                                    </tr>
                                    <tr>
                                        <td class="th">클릭회원수
                                        </th>
                                        <td>973,624</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <!--//table 1-->

                                <!--//table 2-->
                                <table class="listTB2 tStriped3 mt30">
                                    <tbody>
                                    <tr>
                                        <th>기준년월</th>
                                        <th>발송회원수</th>
                                        <th>클릭회원수</th>
                                        <th>CTR(회원수)</th>
                                        <th>발송건수</th>
                                        <th>클릭건수</th>
                                        <th>CTR(건수)</th>
                                    </tr>
                                    <tr>
                                        <td class="depth2 txtC">2015.06</td>
                                        <td>2,290,976</td>
                                        <td>566,940</td>
                                        <td>24.7%</td>
                                        <td>15,489,154</td>
                                        <td>2,350,302</td>
                                        <td>15.2%</td>
                                    </tr>
                                    <tr>
                                        <td class="depth2 txtC">2015.07</td>
                                        <td>2,567,056</td>
                                        <td>539,955</td>
                                        <td>21.%0</td>
                                        <td>13,227,038</td>
                                        <td>1,754,584</td>
                                        <td>13.3%</td>
                                    </tr>
                                    <tr>
                                        <td class="depth2 txtC">2015.08</td>
                                        <td>2,658,082</td>
                                        <td>581,654</td>
                                        <td>21.9%</td>
                                        <td>10,069,714</td>
                                        <td>1,722,709</td>
                                        <td>17.1%</td>
                                    </tr>
                                    <tr class="total">
                                        <td class="depth2 txtC">3개월</td>
                                        <td>3,254,316</td>
                                        <td>973,624</td>
                                        <td>29.9%</td>
                                        <td>38,785,906</td>
                                        <td>5,827,595</td>
                                        <td>18.0%</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </li>
                            <!--//table 2-->
                        </ul>
                    </div>

                </div>


                <!--//내용1-->

                <div class="news mt10">
                    <h3>절대반응하지 않는 고객 vs. 1회만 보내도 반응하는 고객<br> </h3>
                    <p class="exp" style="font-size:15px">
                        3 : 절반은 3건 이하의 전단을 받았고,<br>
                        7 : 10% 는 7건 이상의 전단을 받았으며,<br>
                        많이 받아도 절대 반응하지 않는 고객(A) 과,<br>
                        1회만 보내도 반응하는 고객(B) 이 존재한다.<br>
                    </p>

                    <div class="newsCbox mt30">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights6_chart_1" style="height:468px"></p>
                            </li>
                        </div>
                    </div>

                </div>

                <!--내용3-->
                <div class="news mt50">
                    <h3>어떤 고객이 반응할까?<br></h3>
                    <p class="exp" style="font-size:15px">
                    남성보다는 여성의 반응률이 높으며,<br>
                    여성은 2529~4044가, 남성은 3539~4549 가 반응률이 높다.<br>
                    </p>

                    <div class="newsCbox mt30">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights6_chart_2" style="height:468px"></p>
                            </li>
                        </div>
                    </div>

                </div>
                <!--//내용3-->

                <!--내용4-->
                <div class="news mt50">
                    <h3>이전에 반응을 잘 했던 고객의 반응률이 보다 높다.<br></h3>

                    <div class="newsCbox mt30">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights6_chart_3" style="height:468px"></p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용4-->

                <!--내용5-->
                <div class="news mt50">
                    <h3>동종 전단 반응경험자가 무경험자에 비해, 반응율이 높다.</h3>

                    <div class="newsCbox mt30">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights6_chart_4" style="height:468px"></p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용5-->

                <!--내용6-->
                <div class="news mt50">
                    <h3>TR 유경험자가 무경험자에 비해, 반응율이 높다.</h3>

                    <div class="newsCbox mt30">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights6_chart_5" style="height:468px"></p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용6-->

            </div>
        </div>
    </div>
</div>
<!--!//modal -->


<script>

    function cvtformat_val(p) {
        return "[" + p[0][1] + "]<br/>" +
                p[0][0] + " : " + p[0][2] + "%<br/>";
    }

    function getReact() {

        var Panel = ["패밀리레스토랑", "피자", "슈퍼마켓/편의점", "할인매장", "음식점 일반", "서적/문구/복사/인쇄",
            "미용/이용실", "생활서비스기타", "자동차렌트/정비(온라인)", "전자상거래(온라인)기타", "카페/제과", "백화점", "가전용품", "여행사"];

        var myChart_1 = echarts.init(document.getElementById('chart1'));

        var t_list = cvt();

        option1 = {
            title: {
                text: '모바일전단 반응확률'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                formatter: cvtformat_val
            },
            grid: {
                y: 85,
                y2: 230
            },
            legend: {
                y: 50,
                data: ['모바일전단 반응확률']
            },
            xAxis: [
                {
                    type: 'category',
                    data: Panel,
                    axisLabel: {
                        rotate: 90,
                        textStyle: {
                            fontSize: 18,
                            fontWeight: 'bold'
                        }
                    }
                }
            ],
            yAxis: [
                {
                    scale: false,
                    max: 55,
                    type: 'value',
                    axisLabel: {
                        formatter: '{value} %'
                    }

                }
            ],
            series: [
                {
                    name: '모바일전단 반응확률',
                    type: 'bar',
                    data: t_list,
                    barWidth: 50,
                    itemStyle: {
                        normal: {
                            color: '#9FC93C'
                        }
                    }
                }
            ]
        };
        myChart_1.setTheme('macarons', 'infographic');
        myChart_1.setOption(option1);
    }


    var cateVal = [-0.53959024, -0.5311912, -1.31059341, -1.16829615, -0.98189376, -0.58275043, -0.5873344, -0.59188453, -0.66397293,
        -0.2532986, -0.85232719, -0.80748513, -0.47722404, -0.3326929];
    var genderAdd = [-0.20678608, 0, 0, 0.29157798, -2.03904761, 0, 0, 0, 0.30781029, 0, 0.20213605, -0.07034319, 0, 0];

    function cvt() {

        var a = $("input[name='arr_a']:checked").val();
        var b = $("input[name='arr_b']:checked").val();
        var c = $("input[name='arr_c']:checked").val();
        return ( getReflectVal(a, b, c, $('#d').val()) );

    }

    function getReflectVal(n1, n2, n3, n4) {
        var firval = -3.2211742;
        var leftval = firval + getReadVal(n1) + getUseSkpVal(n2) + getGendereVal(n3) + getAgeVal(n4);
        return getCateVal(n3, leftval);
    }

    function getCateVal(n3, val) {
        var list = [];
        for (var i = 0; i < cateVal.length; i++) {
            if (n3 == 1)
                list.push(cateVal[i] + genderAdd[i] + val);
            else
                list.push(cateVal[i] + val);
        }
        for (var i = 0; i < list.length; i++) {
            var temp = list[i];
            list[i] = Math.round(Math.exp(temp) / (1 + Math.exp(temp)) * 100 * 100) / 100
        }

        console.log("모바일 전단 반응확률 : " + list);
        return list;
    }

    function getReadVal(n) {
        return n * 2.16026713;
    }

    function getUseSkpVal(n) {
        return n * 0.21435944;
    }

    function getGendereVal(n) {
        return n * -0.14049194;
    }

    function getAgeVal(n) {
        if (n < 20) {
            return 1.17048403;
        } else if (n < 25) {
            return 0.52442543;
        } else if (n < 30) {
            return 0.86284667;
        } else if (n < 35) {
            return 0.97987886;
        } else if (n < 40) {
            return 1.02351872;
        } else if (n < 45) {
            return 1.11421738;
        } else if (n < 50) {
            return 1.24232425;
        } else if (n < 60) {
            return 1.22519822;
        } else if (n < 100) {
            return 1.02191541;
        }
    }

    var incInsights6 = {
        showInsight: function () {
            var charts = [];
            var myChart = echarts.init($('#insights6_chart_0')[0], GV_CHART_THEME);
            this.drawChart0(myChart);
            charts.push(myChart);
            myChart = echarts.init($('#insights6_chart_1')[0], GV_CHART_THEME);
            this.drawChart1(myChart);
            charts.push(myChart);
            myChart = echarts.init($('#insights6_chart_2')[0], GV_CHART_THEME);
            this.drawChart2(myChart);
            charts.push(myChart);
            myChart = echarts.init($('#insights6_chart_3')[0], GV_CHART_THEME);
            this.drawChart3(myChart);
            charts.push(myChart);
            myChart = echarts.init($('#insights6_chart_4')[0], GV_CHART_THEME);
            this.drawChart4(myChart);
            charts.push(myChart);
            myChart = echarts.init($('#insights6_chart_5')[0], GV_CHART_THEME);
            this.drawChart5(myChart);
            charts.push(myChart);
            resizeChartOnWinResizeHandler.on(charts);
        },

        cvtformat_val: function (param) {
            return "[" + param[0][1] + "]<br/>" +
                    param[0][0] + " : " + param[0][2] + "억원<br/>" +
                    param[1][0] + " : " + param[1][2] + "<br/>" +
                    param[2][0] + " : " + param[2][2] + "<br/>";
        },
        drawChart0: function (myChart) {

            var option = {
                title: {
                    text: '3개월(6~8월)'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: [
                    {
                        type: 'category',
                        data: ['동의대비발송자', '발송대비클릭자']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '동의대비발송자',
                        type: 'bar',
                        data: [83.8, 29.9],
                        markPoint: {
                            data: [
                                {type: 'max', name: '최대값'},
                                {type: 'min', name: '최소값'}
                            ]
                        }
                    }
                ]
            };
            myChart.setOption(option);
        },

        drawChart1: function (myChart) {

            var option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['회원수비율', '회원수누적비율']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '회원수비율',
                        type: 'line',
                        data: [25.4, 19.5, 14.8, 10.9, 8.3, 6.1, 4.2, 2.9, 2.0, 1.4, 1.0, 0.8, 0.6, 0.5, 0.5, 0.4, 0.3, 0.2, 0.1, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
                    },
                    {
                        name: '회원수누적비율',
                        type: 'line',
                        data: [25.4, 44.9, 59.6, 70.5, 78.8, 84.9, 89.1, 92.0, 94.0, 95.4, 96.4, 97.1, 97.8, 98.3, 98.8, 99.2, 99.5, 99.7, 99.9, 99.9, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0]
                    }
                ]
            };
            myChart.setOption(option);
        },


        drawChart2: function (myChart) {

            var option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['F', 'M']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: [0019, 2024, 2529, 3034, 3539, 4044, 4549, 5059, 6099]
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        },
                        label: 'CTR'
                    }
                ],
                series: [
                    {
                        name: 'F',
                        type: 'line',

                        data: [5.3, 11.7, 16.0, 17.3, 17.8, 17.4, 16.2, 12.9, 9.6]
                    },
                    {
                        name: 'M',
                        type: 'line',

                        data: [2.8, 6.4, 9.0, 11.4, 14.4, 15.6, 14.6, 13.2, 10.0]
                    }
                ]
            };

            myChart.setOption(option);

        },

        drawChart3: function (myChart) {
            var memberCountArray = [
                145861, 68823, 45977, 33409, 25934, 20748, 17139, 14611, 12741, 11299, 10175, 9181, 8106, 7697, 7141, 6359, 6284, 5630, 5276, 5077, 4785, 4642, 4410, 4107, 3970, 3730, 3677, 3422, 3400, 3259, 3129, 3016, 2915, 2800, 2727, 2572, 2606, 2609, 2455, 2369, 2272, 2147, 2113, 2157, 2099, 2007, 1886, 1867, 1871, 1819, 1802, 1640, 1607, 1700, 1558, 1508, 1484, 1335, 1269, 1239, 1166, 1221, 1128, 1010, 888, 830, 768, 683, 551, 480, 413, 366, 337, 284, 269, 215, 153, 145, 130, 140, 96, 102, 93, 79, 78, 59, 45, 55, 35, 34, 38, 39, 31, 22, 25, 22, 18, 15, 16, 5, 13, 12, 5, 7, 4, 4, 8, 8, 1, 3, 4, 1, 4, 4, 2, 2, 1, 2, 4, 5, 1, 1, 2, 1, 1, 3, 2, 1, 1, 1, 1, 2, 1, 3, 1, 1, 2, 2, 1
            ];

            var ctrArray = [
                4.2, 9.7, 13.2, 17.0, 20.4, 23.8, 26.1, 29.2, 31.8, 34.0, 35.0, 37.4, 38.8, 40.6, 41.3, 42.5, 44.4, 45.1, 46.0, 48.1, 48.5, 49.6, 50.5, 51.4, 52.3, 53.2, 53.1, 54.4, 54.7, 57.1, 56.8, 57.5, 57.6, 58.0, 58.6, 59.7, 60.4, 61.6, 62.4, 60.9, 62.3, 61.3, 61.5, 63.4, 64.3, 62.3, 64.3, 63.6, 65.1, 65.0, 65.6, 64.9, 66.6, 67.0, 68.0, 66.0, 68.1, 67.0, 68.0, 70.1, 70.4, 70.2, 71.7, 69.9, 69.9, 70.4, 71.5, 70.0, 73.1, 70.2, 74.5, 75.0, 75.0, 75.4, 73.6, 72.9, 72.9, 75.9, 73.1, 75.6, 73.5, 73.8, 74.7, 75.2, 75.7, 77.6, 76.7, 76.3, 79.3, 76.2, 71.3, 77.8, 78.0, 85.4, 86.0, 79.3, 75.2, 82.6, 80.0, 82.5, 79.0, 64.6, 58.3, 85.3, 69.8, 79.1, 81.1, 87.0, 94.1, 94.4, 97.1, 44.4, 80.0, 73.8, 69.2, 88.9, 28.6, 38.9, 71.4, 91.2, 87.5, 100.0, 60.0, 100.0, 90.9, 94.1, 82.6, 66.7, 81.8, 55.0, 66.7, 73.7, 20.0, 93.8, 60.0, 88.2, 50.0, 64.5, 42.9
            ];

            var option =
            {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['F', 'M']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: ['NULL', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 123, 125, 126, 128, 130, 132, 133, 134, 136, 138, 139, 141, 142, 143, 144, 156, 176]
                    }
                ],
                yAxis: [
                    {
                        name: '회원수',
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        },
                        max: 100
                    },
                    {
                        name: 'CTR',
                        type: 'value'
                    }


                ],
                series: [
                    {
                        name: 'F',
                        type: 'line',
                        data: ctrArray
                    },
                    {
                        name: 'M',
                        type: 'line',
                        yAxisIndex: 1,
                        data: memberCountArray
                    }
                ]
            };
            myChart.setOption(option);
        },

        drawChart4: function (myChart) {

            var xArray = [
                "신발/가방", "음식점 일반", "학원/교육 기타", "가전용품", "서적/문구/복사/인쇄", "카페/제과", "생활서비스기타", "패션/의류", "전자상거래(온라인)기타", "패스트푸드", "백화점", "패밀리레스토랑", "자동차 및 용품", "할인매장", "미용/이용실", "먹거리기타", "자동차렌트/정비(온라인)", "쇼핑", "슈퍼마켓/편의점", "기타", "안경/콘텍트 렌즈", "면세점", "유통점기타"
            ]

            var s1 = [
                54.4, 54.7, 54.5, 52.7, 48.6, 47.3, 52.7, 42.7, 69.4, 46.6, 43.6, 61.9, 57.0, 37.9, 38.3, 42.7, 33.0, 34.2, 32.5, 29.5, 26.0, 28.2, 16.7
            ];

            var s2 = [
                9.1, 9.5, 11.2, 10.6, 9.8, 9.0, 16.0, 6.2, 33.2, 11.8, 9.7, 28.1, 23.8, 8.0, 8.8, 13.4, 7.8, 10.7, 10.5, 13.2, 10.5, 14.3, 10.4
            ];

            var option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['F', 'M']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: xArray
                    }
                ],
                yAxis: [
                    {
                        name: '회원수',
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        },
                        max: 100
                    },
                    {
                        name: 'CTR',
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: 'F',
                        type: 'line',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: s1
                    },
                    {
                        name: 'M',
                        type: 'line',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: s2
                    }
                ]
            };

            myChart.setOption(option);
        },

        drawChart5: function (myChart) {

            var xArray = [
                "유통점기타", "신발/가방", "패스트푸드", "가전용품", "면세점", "카페/제과", "슈퍼마켓/편의점", "서적/문구/복사/인쇄", "생활서비스기타", "음식점 일반", "할인매장", "패션/의류", "먹거리기타", "백화점", "자동차 및 용품", "패밀리레스토랑", "미용/이용실", "살거리기타", "안경/콘텍트 렌즈", "학원/교육 기타"
            ];

            var s1 = [
                18.4, 18.1, 17.6, 16.5, 19.0, 17.6, 14.6, 12.4, 19.0, 14.9, 14.6, 14.7, 15.0, 14.4, 34.4, 43.2, 9.6, 5.8, 9.9, 11.1
            ];

            var s2 = [
                8.7, 10.3, 12.1, 11.0, 13.9, 13.8, 10.9, 8.7, 15.7, 11.6, 11.7, 12.1, 12.6, 12.7, 33.8, 42.6, 10.0, 6.7, 10.9, 12.3
            ];

            var option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['F', 'M']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: xArray
                    }
                ],
                yAxis: [
                    {
                        name: '회원수',
                        type: 'value',
                        axisLabel: {
                            formatter: function (value) {
                                return Math.round(value) + ' %';
                            }
                        },
                        max: 100
                    },
                    {
                        name: 'CTR',
                        type: 'value'
                    }


                ],
                series: [
                    {
                        name: 'F',
                        type: 'line',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: s1
                    },
                    {
                        name: 'M',
                        type: 'line',
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: s2
                    }
                ]
            };

            myChart.setOption(option);
        }

    };


</script>