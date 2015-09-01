<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

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
      }, ]);

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
          title : {
            text: '人物关系：乔布斯',
            subtext: '数据来自人立方',
            x:'right',
            y:'bottom'
        },
        tooltip : {
            trigger: 'item',
            formatter: '{a} : {b}'
        },
        toolbox: {
            show : true,
            feature : {
                restore : {show: true},
                magicType: {show: true, type: ['force', 'chord']},
                saveAsImage : {show: true}
            }
        },
        legend: {
            x: 'left',
            data:['家人','朋友']
        },
        series : [
            {
                type:'force',
                name : "人物关系",
                ribbonType: false,
                categories : [
                    {
                        name: '人物'
                    },
                    {
                        name: '家人'
                    },
                    {
                        name:'朋友'
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
                          position:'right'
                        },
                        nodeStyle : {
                            brushType : 'both',
                            borderColor : 'rgba(255,215,0,0.4)',
                            borderWidth : 1
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
                        nodeStyle : {
                            //r: 30
                        },
                        linkStyle : {
                        }
                    }
                },
                useWorker: true,
                minRadius : 15,
                maxRadius : 25,
                gravity: 1.1,
                scaling: 1.1,
                roam: 'move',
                nodes:[
                    {category:0, name: '乔布斯', value : 10, label: '乔布斯\n（主要）'},
                    {category:1, name: '丽萨-乔布斯',value : 2},
                    {category:1, name: '保罗-乔布斯',value : 3},
                    {category:1, name: '克拉拉-乔布斯',value : 3},
                    {category:1, name: '劳伦-鲍威尔',value : 7},
                    {category:2, name: '史蒂夫-沃兹尼艾克',value : 5},
                    {category:2, name: '奥巴马',value : 8},
                    {category:2, name: '比尔-盖茨',value : 9},
                    {category:2, name: '乔纳森-艾夫',value : 4},
                    {category:2, name: '蒂姆-库克',value : 4},
                    {category:2, name: '龙-韦恩',value : 1},
                ],
                links : [
                    {source : '丽萨-乔布斯', target : '乔布斯', weight : 1, name: '女儿',itemStyle: {
                        normal: {
                               type: 'curve',
                            width: 10,
                            color: 'black',
                        }
                    }},
                    {source : '保罗-乔布斯', target : '乔布斯', weight : 2, name: '父亲'},
                    {source : '克拉拉-乔布斯', target : '乔布斯', weight : 1, name: '母亲'},
                    {source : '劳伦-鲍威尔', target : '乔布斯', weight : 2},
                    {source : '史蒂夫-沃兹尼艾克', target : '乔布斯', weight : 3, name: '合伙人'},
                    {source : '奥巴马', target : '乔布斯', weight : 1},
                    {source : '比尔-盖茨', target : '乔布斯', weight : 6, name: '竞争对手'},
                    {source : '乔纳森-艾夫', target : '乔布斯', weight : 1, name: '爱将'},
                    {source : '蒂姆-库克', target : '乔布斯', weight : 1},
                    {source : '龙-韦恩', target : '乔布斯', weight : 1},
                    {source : '克拉拉-乔布斯', target : '保罗-乔布斯', weight : 1},
                    {source : '奥巴马', target : '保罗-乔布斯', weight : 1},
                    {source : '奥巴马', target : '克拉拉-乔布斯', weight : 1},
                    {source : '奥巴马', target : '劳伦-鲍威尔', weight : 1},
                    {source : '奥巴马', target : '史蒂夫-沃兹尼艾克', weight : 1},
                    {source : '比尔-盖茨', target : '奥巴马', weight : 6},
                    {source : '比尔-盖茨', target : '克拉拉-乔布斯', weight : 1},
                    {source : '蒂姆-库克', target : '奥巴马', weight : 1}
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
            var sourceNode = nodes.filter(function (n) {return n.name == data.source})[0];
            var targetNode = nodes.filter(function (n) {return n.name == data.target})[0];
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

      network.on("click", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>Click event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("doubleClick", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>doubleClick event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("oncontext", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>oncontext (right click) event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("dragStart", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>dragStart event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("dragging", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>dragging event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("dragEnd", function(params) {
         params.event = "[original event]";
         document.getElementById('eventSpan').innerHTML = '<h2>dragEnd event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("zoom", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h2>zoom event:</h2>' + JSON.stringify(params, null, 4);
      });
      network.on("showPopup", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h2>showPopup event: </h2>' + JSON.stringify(params, null, 4);
      });
      network.on("hidePopup", function() {
         console.log('hidePopup Event');
      });
      network.on("select", function(params) {
         console.log('select Event:', params);
      });
      network.on("selectNode", function(params) {
         console.log('selectNode Event:', params);
      });
      network.on("selectEdge", function(params) {
         console.log('selectEdge Event:', params);
      });
      network.on("deselectNode", function(params) {
         console.log('deselectNode Event:', params);
      });
      network.on("deselectEdge", function(params) {
         console.log('deselectEdge Event:', params);
      });
      network.on("hoverNode", function(params) {
         console.log('hoverNode Event:', params);
      });
      network.on("hoverEdge", function(params) {
         console.log('hoverEdge Event:', params);
      });
      network.on("blurNode", function(params) {
         console.log('blurNode Event:', params);
      });
      network.on("blurEdge", function(params) {
         console.log('blurEdge Event:', params);
      });

      network.on("startStabilizing", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h3>Starting Stabilization</h3>';
         console.log("started")
      });
      network.on("stabilizationProgress", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h3>Stabilization progress</h3>' + JSON.stringify(params, null, 4);
         console.log("progress:", params);
      });
      network.on("stabilizationIterationsDone", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h3>Stabilization iterations complete</h3>';
         console.log("finished stabilization interations");
      });
      network.on("stabilized", function(params) {
         document.getElementById('eventSpan').innerHTML = '<h3>Stabilized!</h3>' + JSON.stringify(params, null, 4);
         console.log("stabilized!", params);
      });

      network.on("beforeDrawing", function(ctx) {
         var nodeId = 1;
         var nodePosition = network.getPositions([nodeId]);
         ctx.strokeStyle = '#A6D5F7';
         ctx.fillStyle = '#294475';
         ctx.circle(nodePosition[nodeId].x, nodePosition[nodeId].y, 50);
         ctx.fill();
         ctx.stroke();
      });
      network.on("afterDrawing", function(ctx) {
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
				  stroke-dasharray: 10,2;
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
								
			    svg .municipality { fill: red; }
			    svg .municipality:hover { stroke: #333; }
			    svg .municipality.p0 { fill: rgb(247,251,255); }
			    svg .municipality.p1 { fill: rgb(222,235,247); }
			    svg .municipality.p2 { fill: rgb(198,219,239); }
			    svg .municipality.p3 { fill: rgb(158,202,225); }
			    svg .municipality.p4 { fill: rgb(107,174,214); }
			    svg .municipality.p5 { fill: rgb(66,146,198); }
			    svg .municipality.p6 { fill: rgb(33,113,181); }
			    svg .municipality.p7 { fill: rgb(8,81,156); }
			    svg .municipality.p8 { fill: rgb(8,48,107); }
			    svg text { font-size: 10px; }
				
  	      	</style>

	</tiles:putAttribute>

	<tiles:putAttribute name="javascript.footer">
	
		<script type="text/javascript">
		
			
		
			networkChart();
			
			function networkChart() {
				// set up SVG for D3
				var width  = 960,
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
				    {id: "여의도", reflexive: true, size: 5000 },
				    {id: "논현", reflexive: false, size: 3000}
				  ],
				  lastNodeId = 2,
				  links = [
				      {source: nodes[0], target: nodes[1], left: true, right: false, size:10 },
				      {source: nodes[1], target: nodes[2], left: false, right: true, size:20 }
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
				  path.attr('d', function(d) {
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

				  circle.attr('transform', function(d) {
				    return 'translate(' + d.x + ',' + d.y + ')';
				  });
				}

				// update graph (called when needed)
				function restart() {
				  // path (link) group
				  path = path.data(links);

				  // update existing links
				  path.classed('selected', function(d) { return d === selected_link; })
				    .style('marker-start', function(d) { return d.left ? 'url(#start-arrow)' : ''; })
				    .style('marker-end', function(d) { return d.right ? 'url(#end-arrow)' : ''; });


				  // add new links
				  path.enter().append('svg:path')
				    .attr('class', 'link')
				    .style('stroke-width', function(d, i) { /*선굵기*/return Math.sqrt(d.size); }) 
				    .classed('selected', function(d) { return d === selected_link; })
				    .style('marker-start', function(d) { return d.left ? 'url(#start-arrow)' : ''; })
				    .style('marker-end', function(d) { return d.right ? 'url(#end-arrow)' : ''; })
				    .on('mousedown', function(d) {
				      if(d3.event.ctrlKey) return;

				      // select link
				      mousedown_link = d;
				      if(mousedown_link === selected_link) selected_link = null;
				      else selected_link = mousedown_link;
				      selected_node = null;
				      restart();
				    });

				  // remove old links
				  path.exit().remove();


				  // circle (node) group
				  // NB: the function arg is crucial here! nodes are known by id, not by index!
				  circle = circle.data(nodes, function(d) { return d.id; });

				  // update existing nodes (reflexive & selected visual states)
				  circle.selectAll('circle')
				    .style('fill', function(d) { return (d === selected_node) ? d3.rgb(colors(d.id)).brighter().toString() : colors(d.id); })
				    .classed('reflexive', function(d) { return d.reflexive; });

				  // add new nodes
				  var g = circle.enter().append('svg:g');

				  g.append('svg:circle')
				    .attr('class', 'node')
				    .attr("r", function(d) { /*노드크기*/return Math.sqrt(d.size) / 5 || 4.5; })
				    .style('fill', function(d) { return (d === selected_node) ? d3.rgb(colors(d.id)).brighter().toString() : colors(d.id); })
				    .style('stroke', function(d) { return d3.rgb(colors(d.id)).darker().toString(); })
				    .classed('reflexive', function(d) { return d.reflexive; })
				    .on('mouseover', function(d) {
				      if(!mousedown_node || d === mousedown_node) return;
				      // enlarge target node
				      d3.select(this).attr('transform', 'scale(1.1)');
				    })
				    .on('mouseout', function(d) {
				      if(!mousedown_node || d === mousedown_node) return;
				      // unenlarge target node
				      d3.select(this).attr('transform', '');
				    })
				    .on('mousedown', function(d) {
				      if(d3.event.ctrlKey) return;

				      // select node
				      mousedown_node = d;
				      if(mousedown_node === selected_node) selected_node = null;
				      else selected_node = mousedown_node;
				      selected_link = null;

				      // reposition drag line
				      drag_line
				        .style('marker-end', 'url(#end-arrow)')
				        .classed('hidden', false)
				        .attr('d', 'M' + mousedown_node.x + ',' + mousedown_node.y + 'L' + mousedown_node.x + ',' + mousedown_node.y);

				      restart();
				    })
				    .on('mouseup', function(d) {
				      if(!mousedown_node) return;

				      // needed by FF
				      drag_line
				        .classed('hidden', true)
				        .style('marker-end', '');

				      // check for drag-to-self
				      mouseup_node = d;
				      if(mouseup_node === mousedown_node) { resetMouseVars(); return; }

				      // unenlarge target node
				      d3.select(this).attr('transform', '');

				      // add link to graph (update if exists)
				      // NB: links are strictly source < target; arrows separately specified by booleans
				      var source, target, direction;
				      if(mousedown_node.id < mouseup_node.id) {
				        source = mousedown_node;
				        target = mouseup_node;
				        direction = 'right';
				      } else {
				        source = mouseup_node;
				        target = mousedown_node;
				        direction = 'left';
				      }

				      var link;
				      link = links.filter(function(l) {
				        return (l.source === source && l.target === target);
				      })[0];

				      if(link) {
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
				      .text(function(d) { return d.id; });

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

				  if(d3.event.ctrlKey || mousedown_node || mousedown_link) return;

				  // insert new node at point
				  var point = d3.mouse(this),
				      node = {id: ++lastNodeId, reflexive: false};
				  node.x = point[0];
				  node.y = point[1];
				  nodes.push(node);

				  restart();
				}

				function mousemove() {
				  if(!mousedown_node) return;

				  // update drag line
				  drag_line.attr('d', 'M' + mousedown_node.x + ',' + mousedown_node.y + 'L' + d3.mouse(this)[0] + ',' + d3.mouse(this)[1]);

				  restart();
				}

				function mouseup() {
				  if(mousedown_node) {
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
				  var toSplice = links.filter(function(l) {
				    return (l.source === node || l.target === node);
				  });
				  toSplice.map(function(l) {
				    links.splice(links.indexOf(l), 1);
				  });
				}

				// only respond once per keydown
				var lastKeyDown = -1;

				function keydown() {
				  d3.event.preventDefault();

				  if(lastKeyDown !== -1) return;
				  lastKeyDown = d3.event.keyCode;

				  // ctrl
				  if(d3.event.keyCode === 17) {
				    circle.call(force.drag);
				    svg.classed('ctrl', true);
				  }

				  if(!selected_node && !selected_link) return;
				  switch(d3.event.keyCode) {
				    case 8: // backspace
				    case 46: // delete
				      if(selected_node) {
				        nodes.splice(nodes.indexOf(selected_node), 1);
				        spliceLinksForNode(selected_node);
				      } else if(selected_link) {
				        links.splice(links.indexOf(selected_link), 1);
				      }
				      selected_link = null;
				      selected_node = null;
				      restart();
				      break;
				    case 66: // B
				      if(selected_link) {
				        // set link direction to both left and right
				        selected_link.left = true;
				        selected_link.right = true;
				      }
				      restart();
				      break;
				    case 76: // L
				      if(selected_link) {
				        // set link direction to left only
				        selected_link.left = true;
				        selected_link.right = false;
				      }
				      restart();
				      break;
				    case 82: // R
				      if(selected_node) {
				        // toggle node reflexivity
				        selected_node.reflexive = !selected_node.reflexive;
				      } else if(selected_link) {
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
				  if(d3.event.keyCode === 17) {
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
		
			$(document).ready(function() {
				
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
