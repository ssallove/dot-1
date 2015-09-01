<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script type="text/javascript" src="<c:url value=" /resources/echart/echarts-all.js "/>"></script>
<!-- contents-->
<div class="wrapMain">
    <div id="main" style="height: 600px;"></div>
</div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById('main'));
    var hash = "maroon";
    echarts.require([ '/resources/echart/theme/' + hash ], function(tarTheme) {
        curTheme = tarTheme;
        myChart.hideLoading();
        myChart.setTheme(curTheme);
    });

    function random() {
        var r = Math.round(Math.random() * 100);
        return (r * (r % 2 == 0 ? 1 : -1));
    }

    function randomDataArray() {
        var d = [];
        var len = 100;
        while (len--) {
            d.push([ random(), random(), Math.abs(random()), ]);
        }
        return d;
    }

    option = {
    title : {
    text : '人物关系：乔布斯',
    subtext : '数据来自人立方',
    x : 'right',
    y : 'bottom'
    },
    tooltip : {
    trigger : 'item',
    formatter : '{a} : {b}'
    },
    toolbox : {
    show : true,
    feature : {
    restore : {
        show : true
    },
    magicType : {
    show : true,

    type : [ 'force', 'chord' ]
    },
    saveAsImage : {
        show : true
    }
    }
    },
    legend : {
    x : 'left',
    data : [ '家人', '朋友' ]
    },
    series : [ {
    type : 'force',
    name : "人物关系",
    ribbonType : false,
    categories : [ {
        name : '人物'
    }, {
        name : '家人'
    }, {
        name : '朋友'
    } ],
    linkSymbol : 'arrow',
    itemStyle : {
    normal : {
    label : {
    show : true,
    textStyle : {
        color : '#333'
    },
    position : 'right'
    },
    nodeStyle : {
    brushType : 'both',
    borderColor : 'rgba(255,215,0,0.4)',
    borderWidth : 1
    },
    linkStyle : {
        type : 'line'
    }
    },
    emphasis : {
    label : {
        show : true
    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
    },
    nodeStyle : {
    //r: 30
    },
    linkStyle : {}
    }
    },
    useWorker : true,
    minRadius : 15,
    maxRadius : 25,
    gravity : 1.1,
    scaling : 1.1,
    roam : 'move',
    nodes : [ {
    category : 0,
    name : '乔布斯',
    value : 10,
    label : '乔布斯\n（主要）'
    }, {
    category : 1,
    name : '丽萨-乔布斯',
    value : 2
    }, {
    category : 1,
    name : '保罗-乔布斯',
    value : 3
    }, {
    category : 1,
    name : '克拉拉-乔布斯',
    value : 3
    }, {
    category : 1,
    name : '劳伦-鲍威尔',
    value : 7
    }, {
    category : 2,
    name : '史蒂夫-沃兹尼艾克',
    value : 5
    }, {
    category : 2,
    name : '奥巴马',
    value : 8
    }, {
    category : 2,
    name : '比尔-盖茨',
    value : 9
    }, {
    category : 2,
    name : '乔纳森-艾夫',
    value : 4
    }, {
    category : 2,
    name : '蒂姆-库克',
    value : 4
    }, {
    category : 2,
    name : '龙-韦恩',
    value : 1
    }, ],
    links : [ {
    source : '丽萨-乔布斯',
    target : '乔布斯',
    weight : 1,
    name : '女儿',
    itemStyle : {
        normal : {
        type : 'line',
        width : 3,
        color : 'black',
        }
    }
    }, {
    source : '保罗-乔布斯',
    target : '乔布斯',
    weight : 2,
    name : '父亲',
    itemStyle : {
        normal : {
        type : 'dashed',
        width : 2,
        color : 'blue',
        }
    }
    }, {
    source : '克拉拉-乔布斯',
    target : '乔布斯',
    weight : 1,
    name : '母亲',
    itemStyle : {
        normal : {
        type : 'curve',
        width : 1,
        color : 'red',
        }
    }
    }, {
    source : '劳伦-鲍威尔',
    target : '乔布斯',
    weight : 2
    }, {
    source : '史蒂夫-沃兹尼艾克',
    target : '乔布斯',
    weight : 3,
    name : '合伙人'
    }, {
    source : '奥巴马',
    target : '乔布斯',
    weight : 1
    }, {
    source : '比尔-盖茨',
    target : '乔布斯',
    weight : 6,
    name : '竞争对手'
    }, {
    source : '乔纳森-艾夫',
    target : '乔布斯',
    weight : 1,
    name : '爱将'
    }, {
    source : '蒂姆-库克',
    target : '乔布斯',
    weight : 1
    }, {
    source : '龙-韦恩',
    target : '乔布斯',
    weight : 1
    }, {
    source : '克拉拉-乔布斯',
    target : '保罗-乔布斯',
    weight : 1
    }, {
    source : '奥巴马',
    target : '保罗-乔布斯',
    weight : 1
    }, {
    source : '奥巴马',
    target : '克拉拉-乔布斯',
    weight : 1
    }, {
    source : '奥巴马',
    target : '劳伦-鲍威尔',
    weight : 1
    }, {
    source : '奥巴马',
    target : '史蒂夫-沃兹尼艾克',
    weight : 1
    }, {
    source : '比尔-盖茨',
    target : '奥巴马',
    weight : 6
    }, {
    source : '比尔-盖茨',
    target : '克拉拉-乔布斯',
    weight : 1
    }, {
    source : '蒂姆-库克',
    target : '奥巴马',
    weight : 1
    } ]
    } ]
    };
    var ecConfig = require('echarts/config');
    function focus(param) {
        var data = param.data;
        var links = option.series[0].links;
        var nodes = option.series[0].nodes;
        if (data.source !== undefined && data.target !== undefined) { //点击的是边
            var sourceNode = nodes.filter(function(n) {
                return n.name == data.source
            })[0];
            var targetNode = nodes.filter(function(n) {
                return n.name == data.target
            })[0];
            console.log("选中了边 " + sourceNode.name + ' -> ' + targetNode.name + ' (' + data.weight + ')');
        } else { // 点击的是点
            console.log("选中了" + data.name + '(' + data.value + ')');
        }
    }
    myChart.on(ecConfig.EVENT.CLICK, focus)

    myChart.on(ecConfig.EVENT.FORCE_LAYOUT_END, function() {
        console.log(myChart.chart.force.getPosition());
    });

    /* option = {
        tooltip : {
            trigger: 'axis',
            showDelay : 0,
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
            data:['scatter1','scatter2']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataZoom : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        xAxis : [
            {
                type : 'value',
                splitNumber: 4,
                scale: true
            }
        ],
        yAxis : [
            {
                type : 'value',
                splitNumber: 4,
                scale: true
            }
        ],
        series : [
            {
                name:'scatter1',
                type:'scatter',
                symbolSize: function (value){
                    return Math.round(value[2] / 5);
                },
                data: randomDataArray()
            },
            {
                name:'scatter2',
                type:'scatter',
                symbolSize: function (value){
                    return Math.round(value[2] / 5);
                },
                data: randomDataArray()
            }
        ]
    }; */

    /* 
    var option = {
    tooltip: {
        show: true
    },
    legend: {
        data:['Sales']
    },
    xAxis : [
        {
            type : 'category',
            data : ["Shirts", "Sweaters", "Chiffon Shirts", "Pants", "High Heels", "Socks"]
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            "name":"Sales",
            "type":"bar",
            "data":[5, 20, 40, 10, 10, 20]
        }
    ]
    }; */

    // Load data into the ECharts instance
    myChart.setOption(option);
</script>
