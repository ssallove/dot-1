<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/jsp/common/directive.jsp" %>

<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="stylesheet">

        <%-- <link href="<c:url value="/resources/nvd3/nv.d3.css"/>"	rel="stylesheet"> --%>
        <script type="text/javascript" src="<c:url value=" /resources/js/adm.common.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/js/common.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/d3/d3.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/nvd3/nv.d3.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/lib/d3.v3.4.8.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/dimple/dist/dimple.v2.1.2.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/geo/topojson.v1.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/geo/queue.v1.min.js "/>"></script>
        <script type="text/javascript" src="<c:url value=" /resources/d3/sankey.js "/>"></script>

        <script type="text/javascript" src="<c:url value=" /resources/vis/vis.js "/>"></script>


        <style>

            .axis path, .axis line {
                fill: none;
                stroke: black;
                shape-rendering: crispEdges;
            }

            .axis text {
                font-family: sans-serif;
                font-size: 11px;
            }

            #tooltip {
                position: absolute;
                text-align: center;
                width: 40px;
                height: auto;
                padding: 10px;
                background-color: white;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
                border-radius: 10px;
                -webkit-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
                -moz-box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
                box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.4);
                pointer-events: none;
            }

            #tooltip.hidden {
                display: none;
            }

            #tooltip p {
                margin: 0;
                font-family: sans-serif;
                font-size: 16px;
                line-height: 20px;
            }

            .node rect {
                cursor: move;
                fill-opacity: .9;
                shape-rendering: crispEdges;
            }

            .node text {
                pointer-events: none;
                text-shadow: 0 1px 0 #fff;
            }

            .link {
                fill: none;
                stroke: #000;
                stroke-opacity: .2;
            }

            .link:hover {
                stroke-opacity: .5;
            }

            #mynetwork {
                margin: 5px;
                border: 1px solid lightgray;
                height: 500px;
            }

            #config {
                float: left;
            }

        </style>

    </tiles:putAttribute>

    <tiles:putAttribute name="content">


        <!-- contents-->
        <div class="wrapMain">

            <div id="mynetwork"></div>
            <div id="config"></div>
            <pre id="eventSpan"></pre>

            <script type="text/javascript">
                // create an array with nodes
                var nodes = new vis.DataSet([{
                    id: 1,
                    value: 1,
                    label: '강남',
                    color: '#97C2FC',
                    x: 0,
                    y: 0,
                    fixed: true
                }, {
                    id: 2,
                    value: 2,
                    label: '서대문구',
                    color: '#FFFF00',
                    x: 0,
                    y: 0,
                    fixed: true
                }, {
                    id: 3,
                    value: 3,
                    label: '관악구',
                    x: 150,
                    y: 130,
                    physics: false
                }, {
                    id: 4,
                    value: 4,
                    label: '낙성대',
                    x: 80,
                    y: -80,
                    fixed: true,
                    mass: 10
                }, {
                    id: 5,
                    value: 5,
                    label: '판교'
                }, {
                    id: 6,
                    value: 6,
                    label: '구로'
                }, {
                    id: 7,
                    value: 7,
                    label: '신도림'
                }, {
                    id: 8,
                    value: 8,
                    label: '천호'
                },]);

                // create an array with edges
                /*
                 var edges = new vis.DataSet([
                 {from: 1, to: 8, arrows:'to', dashes:true},
                 {from: 1, to: 3, arrows:'to'},
                 {from: 1, to: 2, arrows:'to, from'},
                 {from: 2, to: 4, arrows:'to, middle'},
                 {from: 2, to: 5, arrows:'to, middle, from'},
                 {from: 5, to: 6, arrows:{to:{scaleFactor:2}}} ,
                 {from: 6, to: 7, arrows:{middle:{scaleFactor:0.5},from:true}}
                 ]);
                 */
                edges = [{
                    from: 2,
                    to: 8,
                    arrows: 'to',
                    value: 3,
                    title: '3 emails per week',
                    color: {
                        color: 'red'
                    }
                }, {
                    from: 2,
                    to: 5,
                    arrows: 'to, middle, from',
                    color: {
                        inherit: 'to'
                    }
                }, {
                    from: 5,
                    to: 6,
                    arrows: {
                        to: {
                            scaleFactor: 2
                        }
                    }
                }, {
                    from: 2,
                    to: 9,
                    value: 5,
                    title: '5 emails per week',
                    dashes: true
                }, {
                    from: 2,
                    to: 10,
                    value: 1,
                    title: '1 emails per week'
                }, {
                    from: 4,
                    to: 6,
                    value: 8,
                    title: '8 emails per week',
                    color: {
                        inherit: 'both'
                    }
                }, {
                    from: 5,
                    to: 7,
                    value: 2,
                    title: '2 emails per week'
                }, {
                    from: 4,
                    to: 5,
                    value: 1,
                    title: '1 emails per week'
                }, {
                    from: 9,
                    to: 10,
                    value: 2,
                    title: '2 emails per week'
                }, {
                    from: 2,
                    to: 3,
                    value: 6,
                    title: '6 emails per week',
                    dashes: false
                }, {
                    from: 3,
                    to: 9,
                    value: 4,
                    title: '4 emails per week',
                    dashes: [5, 5]
                }, {
                    from: 5,
                    to: 3,
                    value: 1,
                    title: '1 emails per week',
                    dashes: true
                }, {
                    from: 1,
                    to: 7,
                    value: 4,
                    title: '4 emails per week',
                    color: {
                        color: '#ff0000',
                        opacity: 0.3
                    },
                    dashes: true
                }];

                // create a network
                var container = document.getElementById('mynetwork');
                var data = {
                    nodes: nodes,
                    edges: edges
                };
                //var options = {};
                /*
                 var options = {
                 nodes: {
                 shape: 'dot',
                 scaling:{
                 label: {
                 min:0,
                 max:100
                 }
                 }
                 }
                 ,
                 configure: {
                 filter:function (option, path) {
                 if (path.indexOf('physics') !== -1) {
                 return true;
                 }
                 if (path.indexOf('smooth') !== -1 || option === 'smooth') {
                 return true;
                 }
                 return false;
                 },
                 container: document.getElementById('config')
                 }
                 };
                 */

                var option = {
                    title: {
                        text: '人物关系：乔布斯',
                        subtext: '数据来自人立方',
                        x: 'right',
                        y: 'bottom'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} : {b}'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            restore: {show: true},
                            magicType: {show: true, type: ['force', 'chord']},
                            saveAsImage: {show: true}
                        }
                    },
                    legend: {
                        x: 'left',
                        data: ['家人', '朋友']
                    },
                    series: [
                        {
                            type: 'force',
                            name: "人物关系",
                            ribbonType: false,
                            categories: [
                                {
                                    name: '人物'
                                },
                                {
                                    name: '家人'
                                },
                                {
                                    name: '朋友'
                                }
                            ],
                            linkSymbol: 'arrow',
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true,
                                        textStyle: {
                                            color: '#333'
                                        },
                                        position: 'right'
                                    },
                                    nodeStyle: {
                                        brushType: 'both',
                                        borderColor: 'rgba(255,215,0,0.4)',
                                        borderWidth: 1
                                    },
                                    linkStyle: {
                                        type: 'curve'
                                    }
                                },
                                emphasis: {
                                    label: {
                                        show: true
                                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                    },
                                    nodeStyle: {
                                        //r: 30
                                    },
                                    linkStyle: {}
                                }
                            },
                            useWorker: true,
                            minRadius: 15,
                            maxRadius: 25,
                            gravity: 1.1,
                            scaling: 1.1,
                            roam: 'move',
                            nodes: [
                                {category: 0, name: '乔布斯', value: 10, label: '乔布斯\n（主要）'},
                                {category: 1, name: '丽萨-乔布斯', value: 2},
                                {category: 1, name: '保罗-乔布斯', value: 3},
                                {category: 1, name: '克拉拉-乔布斯', value: 3},
                                {category: 1, name: '劳伦-鲍威尔', value: 7},
                                {category: 2, name: '史蒂夫-沃兹尼艾克', value: 5},
                                {category: 2, name: '奥巴马', value: 8},
                                {category: 2, name: '比尔-盖茨', value: 9},
                                {category: 2, name: '乔纳森-艾夫', value: 4},
                                {category: 2, name: '蒂姆-库克', value: 4},
                                {category: 2, name: '龙-韦恩', value: 1},
                            ],
                            links: [
                                {
                                    source: '丽萨-乔布斯', target: '乔布斯', weight: 1, name: '女儿', itemStyle: {
                                    normal: {
                                        type: 'curve',
                                        width: 10,
                                        color: 'black',
                                    }
                                }
                                },
                                {source: '保罗-乔布斯', target: '乔布斯', weight: 2, name: '父亲'},
                                {source: '克拉拉-乔布斯', target: '乔布斯', weight: 1, name: '母亲'},
                                {source: '劳伦-鲍威尔', target: '乔布斯', weight: 2},
                                {source: '史蒂夫-沃兹尼艾克', target: '乔布斯', weight: 3, name: '合伙人'},
                                {source: '奥巴马', target: '乔布斯', weight: 1},
                                {source: '比尔-盖茨', target: '乔布斯', weight: 6, name: '竞争对手'},
                                {source: '乔纳森-艾夫', target: '乔布斯', weight: 1, name: '爱将'},
                                {source: '蒂姆-库克', target: '乔布斯', weight: 1},
                                {source: '龙-韦恩', target: '乔布斯', weight: 1},
                                {source: '克拉拉-乔布斯', target: '保罗-乔布斯', weight: 1},
                                {source: '奥巴马', target: '保罗-乔布斯', weight: 1},
                                {source: '奥巴马', target: '克拉拉-乔布斯', weight: 1},
                                {source: '奥巴马', target: '劳伦-鲍威尔', weight: 1},
                                {source: '奥巴马', target: '史蒂夫-沃兹尼艾克', weight: 1},
                                {source: '比尔-盖茨', target: '奥巴马', weight: 6},
                                {source: '比尔-盖茨', target: '克拉拉-乔布斯', weight: 1},
                                {source: '蒂姆-库克', target: '奥巴马', weight: 1}
                            ]
                        }
                    ]
                };
                var ecConfig = require('echarts/config');
                function focus(param) {
                    var data = param.data;
                    var links = option.series[0].links;
                    var nodes = option.series[0].nodes;
                    if (
                            data.source !== undefined
                            && data.target !== undefined
                    ) { //点击的是边
                        var sourceNode = nodes.filter(function (n) {
                            return n.name == data.source
                        })[0];
                        var targetNode = nodes.filter(function (n) {
                            return n.name == data.target
                        })[0];
                        console.log("选中了边 " + sourceNode.name + ' -> ' + targetNode.name + ' (' + data.weight + ')');
                    } else { // 点击的是点
                        console.log("选中了" + data.name + '(' + data.value + ')');
                    }
                }
                myChart.on(ecConfig.EVENT.CLICK, focus)

                myChart.on(ecConfig.EVENT.FORCE_LAYOUT_END, function () {
                    console.log(myChart.chart.force.getPosition());
                });


                var network = new vis.Network(container, data, options);

                network.on("click", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>Click event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("doubleClick", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>doubleClick event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("oncontext", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>oncontext (right click) event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("dragStart", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>dragStart event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("dragging", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>dragging event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("dragEnd", function (params) {
                    params.event = "[original event]";
                    document.getElementById('eventSpan').innerHTML = '<h2>dragEnd event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("zoom", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h2>zoom event:</h2>' + JSON.stringify(params, null, 4);
                });
                network.on("showPopup", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h2>showPopup event: </h2>' + JSON.stringify(params, null, 4);
                });
                network.on("hidePopup", function () {
                    console.log('hidePopup Event');
                });
                network.on("select", function (params) {
                    console.log('select Event:', params);
                });
                network.on("selectNode", function (params) {
                    console.log('selectNode Event:', params);
                });
                network.on("selectEdge", function (params) {
                    console.log('selectEdge Event:', params);
                });
                network.on("deselectNode", function (params) {
                    console.log('deselectNode Event:', params);
                });
                network.on("deselectEdge", function (params) {
                    console.log('deselectEdge Event:', params);
                });
                network.on("hoverNode", function (params) {
                    console.log('hoverNode Event:', params);
                });
                network.on("hoverEdge", function (params) {
                    console.log('hoverEdge Event:', params);
                });
                network.on("blurNode", function (params) {
                    console.log('blurNode Event:', params);
                });
                network.on("blurEdge", function (params) {
                    console.log('blurEdge Event:', params);
                });

                network.on("startStabilizing", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h3>Starting Stabilization</h3>';
                    console.log("started")
                });
                network.on("stabilizationProgress", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h3>Stabilization progress</h3>' + JSON.stringify(params, null, 4);
                    console.log("progress:", params);
                });
                network.on("stabilizationIterationsDone", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h3>Stabilization iterations complete</h3>';
                    console.log("finished stabilization interations");
                });
                network.on("stabilized", function (params) {
                    document.getElementById('eventSpan').innerHTML = '<h3>Stabilized!</h3>' + JSON.stringify(params, null, 4);
                    console.log("stabilized!", params);
                });

                network.on("beforeDrawing", function (ctx) {
                    var nodeId = 1;
                    var nodePosition = network.getPositions([nodeId]);
                    ctx.strokeStyle = '#A6D5F7';
                    ctx.fillStyle = '#294475';
                    ctx.circle(nodePosition[nodeId].x, nodePosition[nodeId].y, 50);
                    ctx.fill();
                    ctx.stroke();
                });
                network.on("afterDrawing", function (ctx) {
                    var nodeId = 1;
                    var nodePosition = network.getPositions([nodeId]);
                    ctx.strokeStyle = '#294475';
                    ctx.lineWidth = 4;
                    ctx.fillStyle = '#A6D5F7';
                    ctx.circle(nodePosition[nodeId].x, nodePosition[nodeId].y, 20);
                    ctx.fill();
                    ctx.stroke();
                });
            </script>

            <div class="graph txtC mb30" id="chart">

                <div id="chartContainer"></div>
                <div id="chartContainer2"></div>

                <div id="tooltip" class="hidden">
                    <p><span id="value">100</span>
                    </p>
                </div>
                <div id="chartContainer3"></div>
                <div id="chartContainer4"></div>

                <div id="graphicview" height="100%"></div>

                <div id="chart"></div>

                <p id="chart1">

            </div>
            <!-- <div class="bar"></div>

            <svg width="500" height="800">
                <rect x="0" y="0" width="400" class="pumpkin" height="10" />
                <text x="405" y="9" fill="black" font-family="serif" font-size="20">Easy-peasy</text>
                <rect x="0" y="15" width="500" fill="yellow" stroke="orange" stoke-width="5" height="10"/>
            </svg>
             -->
        </div>
        <!-- //contents-->

        <!-- <div id="chart1"><svg></svg></div> -->

        <style>

            svg {
                background-color: #eee;
                cursor: default;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                -o-user-select: none;
                user-select: none;
            }

            svg:not(.active):not(.ctrl) {
                cursor: crosshair;
            }

            path.link {
                fill: none;
                stroke: #000;
                stroke-width: 4px;
                cursor: default;
            }

            svg:not(.active):not(.ctrl) path.link {
                cursor: pointer;
            }

            path.link.selected {
                stroke-dasharray: 10, 2;
            }

            path.link.dragline {
                pointer-events: none;
            }

            path.link.hidden {
                stroke-width: 0;
            }

            circle.node {
                stroke-width: 1.5px;
                cursor: pointer;
            }

            circle.node.reflexive {
                stroke: #000 !important;
                stroke-width: 0.5px;
            }

            text {
                font: 12px sans-serif;
                pointer-events: none;
            }

            text.id {
                text-anchor: middle;
                font-weight: bold;
            }

            svg .municipality {
                fill: red;
            }

            svg .municipality:hover {
                stroke: #333;
            }

            svg .municipality.p0 {
                fill: rgb(247, 251, 255);
            }

            svg .municipality.p1 {
                fill: rgb(222, 235, 247);
            }

            svg .municipality.p2 {
                fill: rgb(198, 219, 239);
            }

            svg .municipality.p3 {
                fill: rgb(158, 202, 225);
            }

            svg .municipality.p4 {
                fill: rgb(107, 174, 214);
            }

            svg .municipality.p5 {
                fill: rgb(66, 146, 198);
            }

            svg .municipality.p6 {
                fill: rgb(33, 113, 181);
            }

            svg .municipality.p7 {
                fill: rgb(8, 81, 156);
            }

            svg .municipality.p8 {
                fill: rgb(8, 48, 107);
            }

            svg text {
                font-size: 10px;
            }

        </style>

    </tiles:putAttribute>

    <tiles:putAttribute name="javascript.footer">

        <script type="text/javascript">


            networkChart();

            function networkChart() {
                // set up SVG for D3
                var width = 960,
                        height = 500,
                        colors = d3.scale.category10();

                var svg = d3.select('#graphicview')
                        .append('svg')
                        .attr('width', width)
                        .attr('height', height);

                // set up initial nodes and links
                //  - nodes are known by 'id', not by index in array.
                //  - reflexive edges are indicated on the node (as a bold black circle).
                //  - links are always source < target; edge directions are set by 'left' and 'right'.
                var nodes = [
                            {id: "강남", reflexive: false, size: 100000},
                            {id: "여의도", reflexive: true, size: 5000},
                            {id: "논현", reflexive: false, size: 3000}
                        ],
                        lastNodeId = 2,
                        links = [
                            {source: nodes[0], target: nodes[1], left: true, right: false, size: 10},
                            {source: nodes[1], target: nodes[2], left: false, right: true, size: 20}
                        ];

                // init D3 force layout
                var force = d3.layout.force()
                        .nodes(nodes)
                        .links(links)
                        .size([width, height])
                        .linkDistance(150)
                        .charge(-500)
                        .on('tick', tick)

                // define arrow markers for graph links
                svg.append('svg:defs').append('svg:marker')
                        .attr('id', 'end-arrow')
                        .attr('viewBox', '0 -5 10 10')
                        .attr('refX', 6)
                        .attr('markerWidth', 3)
                        .attr('markerHeight', 3)
                        .attr('orient', 'auto')
                        .append('svg:path')
                        .attr('d', 'M0,-5L10,0L0,5')
                        .attr('fill', '#000');

                svg.append('svg:defs').append('svg:marker')
                        .attr('id', 'start-arrow')
                        .attr('viewBox', '0 -5 10 10')
                        .attr('refX', 4)
                        .attr('markerWidth', 3)
                        .attr('markerHeight', 3)
                        .attr('orient', 'auto')
                        .append('svg:path')
                        .attr('d', 'M10,-5L0,0L10,5')
                        .attr('fill', '#000');

                // line displayed when dragging new nodes
                var drag_line = svg.append('svg:path')
                        .attr('class', 'link dragline hidden')
                        .attr('d', 'M0,0L0,0');

                // handles to link and node element groups
                var path = svg.append('svg:g').selectAll('path'),
                        circle = svg.append('svg:g').selectAll('g');

                // mouse event vars
                var selected_node = null,
                        selected_link = null,
                        mousedown_link = null,
                        mousedown_node = null,
                        mouseup_node = null;

                function resetMouseVars() {
                    mousedown_node = null;
                    mouseup_node = null;
                    mousedown_link = null;
                }

                // update force layout (called automatically each iteration)
                function tick() {
                    // draw directed edges with proper padding from node centers
                    path.attr('d', function (d) {
                        var deltaX = d.target.x - d.source.x,
                                deltaY = d.target.y - d.source.y,
                                dist = Math.sqrt(deltaX * deltaX + deltaY * deltaY),
                                normX = deltaX / dist,
                                normY = deltaY / dist,
                                sourcePadding = d.left ? 17 : 12,
                                targetPadding = d.right ? 17 : 12,
                                sourceX = d.source.x + (sourcePadding * normX),
                                sourceY = d.source.y + (sourcePadding * normY),
                                targetX = d.target.x - (targetPadding * normX),
                                targetY = d.target.y - (targetPadding * normY);
                        return 'M' + sourceX + ',' + sourceY + 'L' + targetX + ',' + targetY;
                    });

                    circle.attr('transform', function (d) {
                        return 'translate(' + d.x + ',' + d.y + ')';
                    });
                }

                // update graph (called when needed)
                function restart() {
                    // path (link) group
                    path = path.data(links);

                    // update existing links
                    path.classed('selected', function (d) {
                        return d === selected_link;
                    })
                            .style('marker-start', function (d) {
                                return d.left ? 'url(#start-arrow)' : '';
                            })
                            .style('marker-end', function (d) {
                                return d.right ? 'url(#end-arrow)' : '';
                            });


                    // add new links
                    path.enter().append('svg:path')
                            .attr('class', 'link')
                            .style('stroke-width', function (d, i) { /*선굵기*/
                                return Math.sqrt(d.size);
                            })
                            .classed('selected', function (d) {
                                return d === selected_link;
                            })
                            .style('marker-start', function (d) {
                                return d.left ? 'url(#start-arrow)' : '';
                            })
                            .style('marker-end', function (d) {
                                return d.right ? 'url(#end-arrow)' : '';
                            })
                            .on('mousedown', function (d) {
                                if (d3.event.ctrlKey) return;

                                // select link
                                mousedown_link = d;
                                if (mousedown_link === selected_link) selected_link = null;
                                else selected_link = mousedown_link;
                                selected_node = null;
                                restart();
                            });

                    // remove old links
                    path.exit().remove();


                    // circle (node) group
                    // NB: the function arg is crucial here! nodes are known by id, not by index!
                    circle = circle.data(nodes, function (d) {
                        return d.id;
                    });

                    // update existing nodes (reflexive & selected visual states)
                    circle.selectAll('circle')
                            .style('fill', function (d) {
                                return (d === selected_node) ? d3.rgb(colors(d.id)).brighter().toString() : colors(d.id);
                            })
                            .classed('reflexive', function (d) {
                                return d.reflexive;
                            });

                    // add new nodes
                    var g = circle.enter().append('svg:g');

                    g.append('svg:circle')
                            .attr('class', 'node')
                            .attr("r", function (d) { /*노드크기*/
                                return Math.sqrt(d.size) / 5 || 4.5;
                            })
                            .style('fill', function (d) {
                                return (d === selected_node) ? d3.rgb(colors(d.id)).brighter().toString() : colors(d.id);
                            })
                            .style('stroke', function (d) {
                                return d3.rgb(colors(d.id)).darker().toString();
                            })
                            .classed('reflexive', function (d) {
                                return d.reflexive;
                            })
                            .on('mouseover', function (d) {
                                if (!mousedown_node || d === mousedown_node) return;
                                // enlarge target node
                                d3.select(this).attr('transform', 'scale(1.1)');
                            })
                            .on('mouseout', function (d) {
                                if (!mousedown_node || d === mousedown_node) return;
                                // unenlarge target node
                                d3.select(this).attr('transform', '');
                            })
                            .on('mousedown', function (d) {
                                if (d3.event.ctrlKey) return;

                                // select node
                                mousedown_node = d;
                                if (mousedown_node === selected_node) selected_node = null;
                                else selected_node = mousedown_node;
                                selected_link = null;

                                // reposition drag line
                                drag_line
                                        .style('marker-end', 'url(#end-arrow)')
                                        .classed('hidden', false)
                                        .attr('d', 'M' + mousedown_node.x + ',' + mousedown_node.y + 'L' + mousedown_node.x + ',' + mousedown_node.y);

                                restart();
                            })
                            .on('mouseup', function (d) {
                                if (!mousedown_node) return;

                                // needed by FF
                                drag_line
                                        .classed('hidden', true)
                                        .style('marker-end', '');

                                // check for drag-to-self
                                mouseup_node = d;
                                if (mouseup_node === mousedown_node) {
                                    resetMouseVars();
                                    return;
                                }

                                // unenlarge target node
                                d3.select(this).attr('transform', '');

                                // add link to graph (update if exists)
                                // NB: links are strictly source < target; arrows separately specified by booleans
                                var source, target, direction;
                                if (mousedown_node.id < mouseup_node.id) {
                                    source = mousedown_node;
                                    target = mouseup_node;
                                    direction = 'right';
                                } else {
                                    source = mouseup_node;
                                    target = mousedown_node;
                                    direction = 'left';
                                }

                                var link;
                                link = links.filter(function (l) {
                                    return (l.source === source && l.target === target);
                                })[0];

                                if (link) {
                                    link[direction] = true;
                                } else {
                                    link = {source: source, target: target, left: false, right: false};
                                    link[direction] = true;
                                    links.push(link);
                                }

                                // select new link
                                selected_link = link;
                                selected_node = null;
                                restart();
                            });

                    // show node IDs
                    g.append('svg:text')
                            .attr('x', 0)
                            .attr('y', 4)
                            .attr('class', 'id')
                            .text(function (d) {
                                return d.id;
                            });

                    // remove old nodes
                    circle.exit().remove();

                    // set the graph in motion
                    force.start();
                }

                function mousedown() {
                    // prevent I-bar on drag
                    //d3.event.preventDefault();

                    // because :active only works in WebKit?
                    svg.classed('active', true);

                    if (d3.event.ctrlKey || mousedown_node || mousedown_link) return;

                    // insert new node at point
                    var point = d3.mouse(this),
                            node = {id: ++lastNodeId, reflexive: false};
                    node.x = point[0];
                    node.y = point[1];
                    nodes.push(node);

                    restart();
                }

                function mousemove() {
                    if (!mousedown_node) return;

                    // update drag line
                    drag_line.attr('d', 'M' + mousedown_node.x + ',' + mousedown_node.y + 'L' + d3.mouse(this)[0] + ',' + d3.mouse(this)[1]);

                    restart();
                }

                function mouseup() {
                    if (mousedown_node) {
                        // hide drag line
                        drag_line
                                .classed('hidden', true)
                                .style('marker-end', '');
                    }

                    // because :active only works in WebKit?
                    svg.classed('active', false);

                    // clear mouse event vars
                    resetMouseVars();
                }

                function spliceLinksForNode(node) {
                    var toSplice = links.filter(function (l) {
                        return (l.source === node || l.target === node);
                    });
                    toSplice.map(function (l) {
                        links.splice(links.indexOf(l), 1);
                    });
                }

                // only respond once per keydown
                var lastKeyDown = -1;

                function keydown() {
                    d3.event.preventDefault();

                    if (lastKeyDown !== -1) return;
                    lastKeyDown = d3.event.keyCode;

                    // ctrl
                    if (d3.event.keyCode === 17) {
                        circle.call(force.drag);
                        svg.classed('ctrl', true);
                    }

                    if (!selected_node && !selected_link) return;
                    switch (d3.event.keyCode) {
                        case 8: // backspace
                        case 46: // delete
                            if (selected_node) {
                                nodes.splice(nodes.indexOf(selected_node), 1);
                                spliceLinksForNode(selected_node);
                            } else if (selected_link) {
                                links.splice(links.indexOf(selected_link), 1);
                            }
                            selected_link = null;
                            selected_node = null;
                            restart();
                            break;
                        case 66: // B
                            if (selected_link) {
                                // set link direction to both left and right
                                selected_link.left = true;
                                selected_link.right = true;
                            }
                            restart();
                            break;
                        case 76: // L
                            if (selected_link) {
                                // set link direction to left only
                                selected_link.left = true;
                                selected_link.right = false;
                            }
                            restart();
                            break;
                        case 82: // R
                            if (selected_node) {
                                // toggle node reflexivity
                                selected_node.reflexive = !selected_node.reflexive;
                            } else if (selected_link) {
                                // set link direction to right only
                                selected_link.left = false;
                                selected_link.right = true;
                            }
                            restart();
                            break;
                    }
                }

                function keyup() {
                    lastKeyDown = -1;

                    // ctrl
                    if (d3.event.keyCode === 17) {
                        circle
                                .on('mousedown.drag', null)
                                .on('touchstart.drag', null);
                        svg.classed('ctrl', false);
                    }
                }

                // app starts here
                /* svg.on('mousedown', mousedown)
                 .on('mousemove', mousemove)
                 .on('mouseup', mouseup);
                 d3.select(window)
                 .on('keydown', keydown)
                 .on('keyup', keyup); */
                restart();

            }

            function getDefOptBar() {
                return {
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
            }

            function getDefOptLine1() {
                return {
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
            }

            function getDefOptLine2() {
                return {
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
            }
            function getDefOptLine3() {
                var memberCountArray = [
                    145861, 68823, 45977, 33409, 25934, 20748, 17139, 14611, 12741, 11299, 10175, 9181, 8106, 7697, 7141, 6359, 6284, 5630, 5276, 5077, 4785, 4642, 4410, 4107, 3970, 3730, 3677, 3422, 3400, 3259, 3129, 3016, 2915, 2800, 2727, 2572, 2606, 2609, 2455, 2369, 2272, 2147, 2113, 2157, 2099, 2007, 1886, 1867, 1871, 1819, 1802, 1640, 1607, 1700, 1558, 1508, 1484, 1335, 1269, 1239, 1166, 1221, 1128, 1010, 888, 830, 768, 683, 551, 480, 413, 366, 337, 284, 269, 215, 153, 145, 130, 140, 96, 102, 93, 79, 78, 59, 45, 55, 35, 34, 38, 39, 31, 22, 25, 22, 18, 15, 16, 5, 13, 12, 5, 7, 4, 4, 8, 8, 1, 3, 4, 1, 4, 4, 2, 2, 1, 2, 4, 5, 1, 1, 2, 1, 1, 3, 2, 1, 1, 1, 1, 2, 1, 3, 1, 1, 2, 2, 1
                ];

                var ctrArray = [
                    4.2, 9.7, 13.2, 17.0, 20.4, 23.8, 26.1, 29.2, 31.8, 34.0, 35.0, 37.4, 38.8, 40.6, 41.3, 42.5, 44.4, 45.1, 46.0, 48.1, 48.5, 49.6, 50.5, 51.4, 52.3, 53.2, 53.1, 54.4, 54.7, 57.1, 56.8, 57.5, 57.6, 58.0, 58.6, 59.7, 60.4, 61.6, 62.4, 60.9, 62.3, 61.3, 61.5, 63.4, 64.3, 62.3, 64.3, 63.6, 65.1, 65.0, 65.6, 64.9, 66.6, 67.0, 68.0, 66.0, 68.1, 67.0, 68.0, 70.1, 70.4, 70.2, 71.7, 69.9, 69.9, 70.4, 71.5, 70.0, 73.1, 70.2, 74.5, 75.0, 75.0, 75.4, 73.6, 72.9, 72.9, 75.9, 73.1, 75.6, 73.5, 73.8, 74.7, 75.2, 75.7, 77.6, 76.7, 76.3, 79.3, 76.2, 71.3, 77.8, 78.0, 85.4, 86.0, 79.3, 75.2, 82.6, 80.0, 82.5, 79.0, 64.6, 58.3, 85.3, 69.8, 79.1, 81.1, 87.0, 94.1, 94.4, 97.1, 44.4, 80.0, 73.8, 69.2, 88.9, 28.6, 38.9, 71.4, 91.2, 87.5, 100.0, 60.0, 100.0, 90.9, 94.1, 82.6, 66.7, 81.8, 55.0, 66.7, 73.7, 20.0, 93.8, 60.0, 88.2, 50.0, 64.5, 42.9
                ];

                return {
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
            }
            function getDefOptLine4() {
                var xArray = [
                    "신발/가방", "음식점 일반", "학원/교육 기타", "가전용품", "서적/문구/복사/인쇄", "카페/제과", "생활서비스기타", "패션/의류", "전자상거래(온라인)기타", "패스트푸드", "백화점", "패밀리레스토랑", "자동차 및 용품", "할인매장", "미용/이용실", "먹거리기타", "자동차렌트/정비(온라인)", "쇼핑", "슈퍼마켓/편의점", "기타", "안경/콘텍트 렌즈", "면세점", "유통점기타"
                ]

                var s1 = [
                    54.4, 54.7, 54.5, 52.7, 48.6, 47.3, 52.7, 42.7, 69.4, 46.6, 43.6, 61.9, 57.0, 37.9, 38.3, 42.7, 33.0, 34.2, 32.5, 29.5, 26.0, 28.2, 16.7
                ];

                var s2 = [
                    9.1, 9.5, 11.2, 10.6, 9.8, 9.0, 16.0, 6.2, 33.2, 11.8, 9.7, 28.1, 23.8, 8.0, 8.8, 13.4, 7.8, 10.7, 10.5, 13.2, 10.5, 14.3, 10.4
                ];
                return {
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
            }
            function getDefOptLine5() {
                var xArray = [
                    "유통점기타", "신발/가방", "패스트푸드", "가전용품", "면세점", "카페/제과", "슈퍼마켓/편의점", "서적/문구/복사/인쇄", "생활서비스기타", "음식점 일반", "할인매장", "패션/의류", "먹거리기타", "백화점", "자동차 및 용품", "패밀리레스토랑", "미용/이용실", "살거리기타", "안경/콘텍트 렌즈", "학원/교육 기타"
                ];

                var s1 = [
                    18.4, 18.1, 17.6, 16.5, 19.0, 17.6, 14.6, 12.4, 19.0, 14.9, 14.6, 14.7, 15.0, 14.4, 34.4, 43.2, 9.6, 5.8, 9.9, 11.1
                ];

                var s2 = [
                    8.7, 10.3, 12.1, 11.0, 13.9, 13.8, 10.9, 8.7, 15.7, 11.6, 11.7, 12.1, 12.6, 12.7, 33.8, 42.6, 10.0, 6.7, 10.9, 12.3
                ];

                return {
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
            }


            $(document).ready(function () {

            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
