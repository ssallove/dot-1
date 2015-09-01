var cityCd = "";
var idxDataArr = [];
var subDataArr = [];

function getGeoMapMaker() {

    var subChartDataList = {};
    var mainPath = "/resources/geo/";
    var dataArr = [];
    var j = 0;

    for (var i = 0; i < chartDataList.length; i++) {

        if (i != 0) {

            idxDataArr[chartDataList[i].mainAcvtDongNm] = chartDataList[i].mainAcvtAdmDongCd;

            dataArr[j] = {
                name: chartDataList[i].mainAcvtDongNm,
                value: parseInt(chartDataList[i].mosu) + parseInt(chartDataList[i].push),
                cd: chartDataList[i].mainAcvtAdmDongCd
            };

            j++;

        }

    }

    var maxMosuValue = _.max(dataArr, function (dataArr) {
        return dataArr.value;
    });
    var minMosuValue = _.min(dataArr, function (dataArr) {
        return dataArr.value;
    });
    var dataCount = dataArr.length;
    
 // Initialize after dom ready
    var myChart = echarts.init(document.getElementById('koreaMap'));
    
    myChart.setTheme(GV_CHART_THEME);
    
    echarts.util.mapData.params.params.korea = {
        getGeoJson: function (callback) {
            $.getJSON(mainPath + 'korea.json', callback);
        }
    }

    option = {

        series: [{

            name: '우리나라',
            type: 'map',
            mapType: 'korea',
            mapLocation: {
                x: 'left',
                y: 'top',
                width: '100%'
            },
            roam: false,
            selectedMode: 'single',
            itemStyle: {
                // normal: {
                // label: {
                // show: true
                // }
                // },
                emphasis: {
                    label: {
                        show: true
                    }
                }
            },
            data: dataArr
        }],

        animation: true
    };
    option.dataRange = {
        orient: 'horizontal',
        x: 'bottom',
        min: minMosuValue.value,
        max: maxMosuValue.value,
        color: ['#33b7d8', '#d4faff'],
        text: ['강', '약'],
        splitNumber: dataCount,
        calculable: true
    };

    //var ecConfig = require('echarts/config');
    var ecConfig = echarts.config;

    var cityArray = [{
        name: "서울특별시",
        path: mainPath + "Seoul.json"
    }, {
        name: "경기도",
        path: mainPath + "Gyeonggi.json"
    }, {
        name: "강원도",
        path: mainPath + "Gangwon.json"
    }, {
        name: "인천광역시",
        path: mainPath + "Incheon.json"
    }, {
        name: "충청남도",
        path: mainPath + "Chungcheongnam.json"
    }, {
        name: "충청북도",
        path: mainPath + "Chungcheongbuk.json"
    }, {
        name: "대전광역시",
        path: mainPath + "Daejeon.json"
    }, {
        name: "경상남도",
        path: mainPath + "Gyeongsangnam.json"
    }, {
        name: "경상북도",
        path: mainPath + "Gyeongsangbuk.json"
    }, {
        name: "대구광역시",
        path: mainPath + "Daegu.json"
    }, {
        name: "울산광역시",
        path: mainPath + "Ulsan.json"
    }, {
        name: "부산광역시",
        path: mainPath + "Busan.json"
    }, {
        name: "전라북도",
        path: mainPath + "Jeollabuk.json"
    }, {
        name: "광주광역시",
        path: mainPath + "Gwangju.json"
    }, {
        name: "전라남도",
        path: mainPath + "Jeollanam.json"
    }, {
        name: "제주특별자치도",
        path: mainPath + "Jejudo.json"
    }, {
        name: "세종특별자치시",
        path: mainPath + "Sejongsi.json"
    },

    ];

    // 시도 클릭시
    myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param) {
        getSubResultChart(param, cityArray, option, myChart, idxDataArr);
    });

    // Load data into the ECharts instance
    myChart.setOption(option);
    
}



function getSubResultChart(param, cityArray, option, myChart, idxDataArr) {
    var ecConfig = echarts.config;
    var cityName = param.target;
    var cityCd = idxDataArr[param.target];

    callAjaxMainActivityArea(cityName, cityCd, function (data) {

        getCallBack(data, cityName, cityCd);

        subChartDataList = data.mosuTableList;

        var j = 0;

        for (var i = 0; i < subChartDataList.length; i++) {

            idxDataArr[subChartDataList[i].mainAcvtDongNm] = subChartDataList[i].mainAcvtAdmDongCd;

            subDataArr[j] = {
                name: subChartDataList[i].mainAcvtDongNm,
                value: parseInt(subChartDataList[i].mosu) + parseInt(subChartDataList[i].push),
                cd: subChartDataList[i].mainAcvtDongCd,
            };

            j++;

        }

        var subMaxMosuValue = _.max(subDataArr, function (subDataArr) {
            return subDataArr.value;
        });

        var subMinMosuValue = _.min(subDataArr, function (subDataArr) {
            return subDataArr.value;
        });

        var dataCount = subDataArr.length;
        var cityPath = "";

        for (var i = 0; i < cityArray.length; i++) {

            if (param.target == cityArray[i].name) {

                cityPath = cityArray[i].path;
                break;

            }

        }

        if (cityPath == "") {
            return;
        }

        echarts.util.mapData.params.params.seoul = {
            getGeoJson: function (callback) {
                $.getJSON(cityPath, callback);
            }
        }
        
        option = {

            series: [{

                name: '서울시',
                type: 'map',
                mapType: 'seoul',
                mapLocation: {
                    x: 'left',
                    y: 'top',
                    width: '70%'
                },
                roam: false,
                //마우스 확대/축소
                selectedMode: 'single',
                itemStyle: {
                    // normal: {
                    // label: {
                    // show: true
                    // }
                    // },
                    emphasis: {
                        label: {
                            show: true
                        }
                    }
                },
                data: subDataArr
            }],

            animation: true
        };
        option.dataRange = {
            orient: 'horizontal',
            x: 'bottom',
            min: subMinMosuValue.value,
            max: subMaxMosuValue.value,
            color: ['#33b7d8', '#d4faff'],
            text: ['강', '약'],
            splitNumber: dataCount,
            calculable: true
        };

        // 시도 클릭 EVNET 삭제
        myChart.un(ecConfig.EVENT.MAP_SELECTED);
        myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param) {	// 구군 EVENT 추가

            var selected = param.selected;
            var isSelected = false;

            $.each(selected, function (data) {

                if (eval("selected['" + data + "']")) {

                    console.log(data + " :: selected[] " + eval("selected['" + data + "']"));

                    isSelected = true;

                }

            });

            if (isSelected) {
                getSubResultChart(param, cityArray, option, myChart, idxDataArr);
            } else {
                callAjaxMainActivityArea(cityName, cityCd, "getCallBack");
            }

        });

        myChart.setOption(option, true);

    });

}
   
   
