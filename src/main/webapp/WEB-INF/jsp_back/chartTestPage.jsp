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
        </style>
        
	</tiles:putAttribute>

	<tiles:putAttribute name="content">
  	      	
  	      	<!-- contents-->
			<div class="wrapMain">
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
		
			sankeyChart();
		
			function sankeyChart() {
				
				var units = "Widgets";
				 
				var margin = {top: 10, right: 10, bottom: 10, left: 10},
				    width = 1200 - margin.left - margin.right,
				    height = 740 - margin.top - margin.bottom;
				 
				var formatNumber = d3.format(",.0f"),    // zero decimal places
				    format = function(d) { return formatNumber(d) + " " + units; },
				    color = d3.scale.category20();
				 
				// append the svg canvas to the page
				var svg = d3.select("#chart1").append("svg")
				    .attr("width", width + margin.left + margin.right)
				    .attr("height", height + margin.top + margin.bottom)
				  .append("g")
				    .attr("transform", 
				          "translate(" + margin.left + "," + margin.top + ")");
				 
				// Set the sankey diagram properties
				var sankey = d3.sankey()
				    .nodeWidth(36)
				    .nodePadding(10)
				    .size([width, height]);
				 
				var path = sankey.link();
				 
				// load the data
				d3.json("/resources/data/sankeygreenhouse.json", function(error, graph) {
				 
				    var nodeMap = {};
				    graph.nodes.forEach(function(x) { nodeMap[x.name] = x; });
				    graph.links = graph.links.map(function(x) {
				      return {
				        source: nodeMap[x.source],
				        target: nodeMap[x.target],
				        value: x.value
				      };
				    });
				 
				  sankey
				      .nodes(graph.nodes)
				      .links(graph.links)
				      .layout(32);
				 
				// add in the links
				  var link = svg.append("g").selectAll(".link")
				      .data(graph.links)
				    .enter().append("path")
				      .attr("class", "link")
				      .attr("d", path)
				      .style("stroke-width", function(d) { return Math.max(1, d.dy); })
				      .sort(function(a, b) { return b.dy - a.dy; });
				 
				// add the link titles
				  link.append("title")
				        .text(function(d) {
				      	return d.source.name + " → " + 
				                d.target.name + "\n" + format(d.value); });
				 
				// add in the nodes
				  var node = svg.append("g").selectAll(".node")
				      .data(graph.nodes)
				    .enter().append("g")
				      .attr("class", "node")
				      .attr("transform", function(d) { 
						  return "translate(" + d.x + "," + d.y + ")"; })
				    .call(d3.behavior.drag()
				      .origin(function(d) { return d; })
				      .on("dragstart", function() { 
						  this.parentNode.appendChild(this); })
				      .on("drag", dragmove));
				 
				// add the rectangles for the nodes
				  node.append("rect")
				      .attr("height", function(d) { return d.dy; })
				      .attr("width", sankey.nodeWidth())
				      .style("fill", function(d) { 
						  return d.color = color(d.name.replace(/ .*/, "")); })
				      .style("stroke", function(d) { 
						  return d3.rgb(d.color).darker(2); })
				    .append("title")
				      .text(function(d) { 
						  return d.name + "\n" + format(d.value); });
				 
				// add in the title for the nodes
				  node.append("text")
				      .attr("x", -6)
				      .attr("y", function(d) { return d.dy / 2; })
				      .attr("dy", ".35em")
				      .attr("text-anchor", "end")
				      .attr("transform", null)
				      .text(function(d) { return d.name; })
				    .filter(function(d) { return d.x < width / 2; })
				      .attr("x", 6 + sankey.nodeWidth())
				      .attr("text-anchor", "start");
				 
				// the function for moving the nodes
				  function dragmove(d) {
				    d3.select(this).attr("transform", 
				        "translate(" + (
				        	   d.x = Math.max(0, Math.min(width - d.dx, d3.event.x))
				        	) + "," + (
				                   d.y = Math.max(0, Math.min(height - d.dy, d3.event.y))
				            ) + ")");
				    sankey.relayout();
				    link.attr("d", path);
				  }
				});
			}
		
			geoMap();
		
			function geoMap() {
				
				var width = 960, height = 500;

			    var svg = d3.select("#chart").append("svg")
			        .attr("width", width)
			        .attr("height", height);
	
			    var projection = d3.geo.mercator()
			        .center([128, 36])
			        .scale(4000)
			        .translate([width/2, height/2]);
	
			    var path = d3.geo.path().projection(projection);
	
			    var quantize = d3.scale.quantize()
			        .domain([0, 1000])
			        .range(d3.range(9).map(function(i) { return "p" + i; }));
	
			    var popByName = d3.map();
	
			    queue()
			        .defer(d3.json, "/resources/geo/municipalities-topo-simple.json")
			        .defer(d3.csv, "/resources/geo/population-edited.csv", function(d) {
			            popByName.set(d.name, +d.population);
			        })
			        .await(ready);
	
			    function ready(error, data) {
			    	
			      var features = topojson.feature(data, data.objects["municipalities-geo"]).features;
			      
			      features.forEach(function(d) {
			        d.properties.population = popByName.get(d.properties.name);
			        d.properties.density = d.properties.population / path.area(d);
			        d.properties.quantized = quantize(d.properties.density);
			      });
	
			      svg.selectAll("path")
			          .data(features)
			          .enter().append("path")
			          .attr("class", function(d) { return "municipality " + d.properties.quantized; })
			          .attr("d", path)
			          .attr("id", function(d) { return d.properties.name; })
			          .append("title")
			          .text(function(d) { return d.properties.name + ": " + d.properties.population/10000 + "만 명" });
			        
			      svg.selectAll("text")
			          .data(features.filter(function(d) { return d.properties.name.endsWith("시"); }))
			          .enter().append("text")
			          .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
			          .attr("dy", ".35em")
			          .attr("class", "region-label")
			          .text(function(d) { return d.properties.name; });
			    }
			}
		
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
				//var dataset = [ 5, 10, 15, 20,25 ];
				
				//d3.select('.graph').append('p').text('New Paragraph!');
				
				// csv 불러오기
				/* d3.csv("food.csv", function(err, data) {
					if (err) {
						console.log(err);
					} else {
						console.log(data);
					}
				});
				
				d3.json("waterfallVeloctities.json", function(json) {
					console.log(json);
				}); */
				
				dimpleBar();
				
				function dimpleBar() {
					var svg = dimple.newSvg("#chartContainer", 590, 400);
				    d3.tsv("/resources/dimple/data/example_data.tsv", function (data) {
				      var myChart = new dimple.chart(svg, data);
				      myChart.setBounds(80, 30, 480, 330)
				      myChart.addMeasureAxis("x", "Unit Sales");
				      myChart.addCategoryAxis("y", ["Price Tier", "Channel"]);
				      myChart.addSeries("Owner", dimple.plot.bar);
				      myChart.addLegend(200, 10, 380, 20, "right");
				      myChart.draw();
				    });
				}
				
				dimpleBar2();
				
				function dimpleBar2() {
					var svg = dimple.newSvg("#chartContainer2", 590, 400);
				    d3.tsv("/resources/dimple/data/example_data.tsv", function (data) {
				      var myChart = new dimple.chart(svg, data);
				      myChart.setBounds(75, 30, 480, 330)
				      myChart.addMeasureAxis("x", "Unit Sales");
				      var y = myChart.addCategoryAxis("y", "Month");
				      y.addOrderRule("Date");
				      myChart.addSeries("Channel", dimple.plot.bar);
				      myChart.addLegend(60, 10, 510, 20, "right");
				      myChart.draw();
				    });
				}
				
				var data = [{
				    key: "모수",
				    color: "#d67777",
				    values: [{
				        label: "세종특별시",
				        value: 17177164
				    }, {
				        label: "제주도",
				        value: 4213964
				    }, {
				        label: "광주광역시",
				        value: 0.57072943117674
				    }, {
				        label: "울산광역시",
				        value: 2.4174010336624
				    }, {
				        label: "충청북도",
				        value: 0.72009071426284
				    }, {
				        label: "전라남도",
				        value: 0.77154485523777
				    }, {
				        label: "전라북도",
				        value: 0.90152097798131
				    }, {
				        label: "대전광역시",
				        value: 0.91445417330854
				    }, {
				        label: "강원도",
				        value: 0.055746319141851
				    }]
				}, {
				    key: "PUSH",
				    color: "#4f99b4",
				    values: [{
				        label: "세종특별시",
				        value: 4594952
				    }, {
				        label: "제주도",
				        value: 1380686
				    }, {
				        label: "광주광역시",
				        value: 18.451534877007
				    }, {
				        label: "울산광역시",
				        value: 8.6142352811805
				    }, {
				        label: "충청북도",
				        value: 7.8082472075876
				    }, {
				        label: "전라남도",
				        value: 5.259101026956
				    }, {
				        label: "전라북도",
				        value: 0.30947953487127
				    }, {
				        label: "대전광역시",
				        value: 0
				    }, {
				        label: "강원도",
				        value: 0
				    }]
				}];
				 
				 getBubbleChart3();
				 
				 function getBubbleChart3() {
					 var svg = dimple.newSvg("#chartContainer4", 590, 400);
					 //d3.tsv("/resources/dimple/data/example_data.tsv", function (data) {
						
						 var data = [];
						 data.push(
							{						
					    		"모수" : "5",	
								"대분류" : "시럽",
								"성별" : "남"
								
							}
						);
						 data.push(
							{						
					    		"모수" : "5",	
								"대분류" : "시럽",
								"성별" : "여"
							}
						);
						 data.push(
							{						
					    		"모수" : "7",	
								"대분류" : "ble",
								"성별" : "남"
							}
						);
						 data.push(
							{						
					    		"모수" : "10",	
								"대분류" : "ble",
								"성별" : "여"
							}
						);
						 data.push(
							{						
					    		"모수" : "1",	
								"대분류" : "ocb",
								"성별" : "남"
							}
						);
						 data.push(
							{						
					    		"모수" : "10",	
								"대분류" : "ocb",
								"성별" : "여"
							}
						);
						 data.push(
							{						
					    		"모수" : "60",	
								"대분류" : "11번가",
								"성별" : "남"
							}
						);
						 data.push(
							{						
					    		"모수" : "50",	
								"대분류" : "11번가",
								"성별" : "여"
							}
						);
				        
				        var myChart = new dimple.chart(svg, data);
				        myChart.setBounds(60, 30, 500, 330)
				        myChart.addCategoryAxis("x", "대분류");
				        myChart.addMeasureAxis("y", "모수");
				        //myChart.addMeasureAxis("x", "모수");
				        myChart.addMeasureAxis("p", "모수");
				        myChart.addMeasureAxis("z", "모수");
				        myChart.addSeries(["대분류", "성별"], dimple.plot.pie);
				        myChart.addLegend(200, 10, 360, 20, "right");
				        myChart.draw();
				      //});
				 }
				 
				 getBubbleChart2();
				 
				 function getBubbleChart2() {
					 var svg = dimple.newSvg("#chartContainer3", 590, 400);
					    d3.tsv("/resources/dimple/data/example_data.tsv", function (data) {
					      
					      // Focus on the top 6 brands
					      data = dimple.filterData(data, "Brand", ["먹거리", "살거리", "Kappa", "Beta", "Lambda", "Alpha"]);

					      // The main chart
					      var myChart = new dimple.chart(svg, data);
					      // The chart to show in a tooltip
					      var tipChart = null;
					      // The other popup shapes
					      var popup = null;
					      
					      // Position the main chart
					      myChart.setBounds(60, 40, 500, 320);
					      
					      // Add the main chart axes
					      myChart.addCategoryAxis("x", "Brand");
					      myChart.addMeasureAxis("y", "Unit Sales");
					      myChart.addMeasureAxis("z", "Sales Value");
					      
					      // Draw bubbles by SKU colored by brand
					      var s = myChart.addSeries(["SKU", "Brand"], dimple.plot.bubble);
					      
					      // Handle the hover event - overriding the default behaviour
					      s.addEventHandler("mouseover", onHover);
					      // Handle the leave event - overriding the default behaviour
					      s.addEventHandler("mouseleave", onLeave);
					      
					      // Draw the main chart
					      myChart.draw();
					      
					      // Event to handle mouse enter
					      function onHover(e) {
					        
					        // Get the properties of the selected shape
					        var cx = parseFloat(e.selectedShape.attr("cx")),
					            cy = parseFloat(e.selectedShape.attr("cy")),
					            r = parseFloat(e.selectedShape.attr("r")),
					            fill = e.selectedShape.attr("fill"),
					            stroke = e.selectedShape.attr("stroke");
					            
					        // Set the size and position of the popup
					        var width = 150,
					            height = 100,
					            x = (cx + r + width + 10 < svg.attr("width") ?
					                  cx + r + 10 :
					                  cx - r - width - 20);
					            y = (cy - height / 2 < 0 ?
					                  15 :
					                  cy - height / 2);
					                
					        // Fade the popup fill mixing the shape fill with 80% white
					        var popupFillColor = d3.rgb(
					                    d3.rgb(fill).r + 0.8 * (255 - d3.rgb(fill).r),
					                    d3.rgb(fill).g + 0.8 * (255 - d3.rgb(fill).g),
					                    d3.rgb(fill).b + 0.8 * (255 - d3.rgb(fill).b)
					                );
					        
					        // Create a group for the popup objects
					        popup = svg.append("g");
					        
					        // Add a rectangle surrounding the chart
					        popup
					          .append("rect")
					          .attr("x", x + 5)
					          .attr("y", y - 5)
					          .attr("width", width)
					          .attr("height", height)
					          .attr("rx", 5)
					          .attr("ry", 5)
					          .style("fill", popupFillColor)
					          .style("stroke", stroke)
					          .style("stroke-width", 2);
					        
					        // Add the series value text
					        popup
					          .append("text")
					          .attr("x", x + 10)
					          .attr("y", y + 10)
					          .text(e.seriesValue[0])
					          .style("font-family", "sans-serif")
					          .style("font-size", 10)
					          .style("fill", stroke);
					        
					        // Filter the data for the selected brand and sku
					        var hoverData = dimple.filterData(data, "Brand", e.xValue);
					        hoverData = dimple.filterData(hoverData, "SKU", e.seriesValue);
					        
					        // Create a new mini chart of Unit Sales over Months
					        tipChart = new dimple.chart(svg,  hoverData);
					        tipChart.setBounds(x + 10, y + 30, width - 10, height - 40);
					        tipChart.addCategoryAxis("x", "Date").hidden = true;
					        tipChart.addMeasureAxis("y", "Unit Sales").hidden = true;
					        
					        // Add a bar series, this can be changed to a line, area or bubble
					        // by changing the plot parameter accordingly.
					        var popUpSeries = tipChart.addSeries("SelectedSeries", dimple.plot.bar);
					        
					        // Set the gap to 80% - just a style preference
					        popUpSeries.barGap = 0.8;
					        
					        // Set the color to the stroke color of the selected node
					        tipChart.assignColor("SelectedSeries", stroke, stroke);
					        
					        // Draw the mini chart
					        tipChart.draw();
					        
					      };
					      
					      // Event to handle mouse exit
					      function onLeave(e) {
					        // Remove the chart
					        if (tipChart !== null) {
					          tipChart._group.remove();
					        }
					        // Remove the popup
					        if (popup !== null) {
					          popup.remove();
					        }
					      };
					    
					    });
				 }
				 
				 function getBubbleChart() {
					 var svg = dimple.newSvg("#chartContainer3", 590, 400);
				      d3.tsv("/resources/dimple/data/example_data.tsv", function (data) {
				        // Latest period only
				        dimple.filterData(data, "Date", "01/12/2012");
				        // Create the chart
				        var myChart = new dimple.chart(svg, data);
				        myChart.setBounds(60, 30, 420, 330)

				        // Create a standard bubble of SKUs by Price and Sales Value
				        // We are coloring by Owner as that will be the key in the legend
				        myChart.addMeasureAxis("x", "Price");
				        myChart.addMeasureAxis("y", "Sales Value");
				        myChart.addSeries(["SKU", "Channel", "Owner"], dimple.plot.bubble);
				        var myLegend = myChart.addLegend(530, 100, 60, 300, "Right");
				        myChart.draw();
				        
				        // This is a critical step.  By doing this we orphan the legend. This
				        // means it will not respond to graph updates.  Without this the legend
				        // will redraw when the chart refreshes removing the unchecked item and
				        // also dropping the events we define below.
				        myChart.legends = [];

				        // This block simply adds the legend title. I put it into a d3 data
				        // object to split it onto 2 lines.  This technique works with any
				        // number of lines, it isn't dimple specific.
				        svg.selectAll("title_text")
				          .data(["Click legend to","show/hide owners:"])
				          .enter()
				          .append("text")
				            .attr("x", 499)
				            .attr("y", function (d, i) { return 90 + i * 14; })
				            .style("font-family", "sans-serif")
				            .style("font-size", "10px")
				            .style("color", "Black")
				            .text(function (d) { return d; });

				        // Get a unique list of Owner values to use when filtering
				        var filterValues = dimple.getUniqueValues(data, "Owner");
				        // Get all the rectangles from our now orphaned legend
				        myLegend.shapes.selectAll("rect")
				          // Add a click event to each rectangle
				          .on("click", function (e) {
				            // This indicates whether the item is already visible or not
				            var hide = false;
				            var newFilters = [];
				            // If the filters contain the clicked shape hide it
				            filterValues.forEach(function (f) {
				              if (f === e.aggField.slice(-1)[0]) {
				                hide = true;
				              } else {
				                newFilters.push(f);
				              }
				            });
				            // Hide the shape or show it
				            if (hide) {
				              d3.select(this).style("opacity", 0.2);
				            } else {
				              newFilters.push(e.aggField.slice(-1)[0]);
				              d3.select(this).style("opacity", 0.8);
				            }
				            // Update the filters
				            filterValues = newFilters;
				            // Filter the data
				            myChart.data = dimple.filterData(data, "Owner", filterValues);
				            // Passing a duration parameter makes the chart animate. Without
				            // it there is no transition
				            myChart.draw(800);
				          });
				      });
				 }
				 
				 //getBarStackedChart();
				 
				 function getBarStackedChart() {
					 var margins = {
					    top: 12,
					    left: 48,
					    right: 24,
					    bottom: 24
					},
					legendPanel = {
					    width: 180
					},
					width = 500 - margins.left - margins.right - legendPanel.width,
					    height = 100 - margins.top - margins.bottom,
					    dataset = [{
					        data: [{
					            month: 'Aug',
					            count: 123
					        }, {
					            month: 'Sep',
					            count: 234
					        }, {
					            month: 'Oct',
					            count: 345
					        }],
					        name: 'Series #1'
					    }, {
					        data: [{
					            month: 'Aug',
					            count: 235
					        }, {
					            month: 'Sep',
					            count: 267
					        }, {
					            month: 'Oct',
					            count: 573
					        }],
					        name: 'Series #2'
					    }

					    ],
					    series = dataset.map(function (d) {
					        return d.name;
					    }),
					    dataset = dataset.map(function (d) {
					        return d.data.map(function (o, i) {
					            // Structure it so that your numeric
					            // axis (the stacked amount) is y
					            return {
					                y: o.count,
					                x: o.month
					            };
					        });
					    }),
					    stack = d3.layout.stack();

						stack(dataset);

						var dataset = dataset.map(function (group) {
						    return group.map(function (d) {
						        // Invert the x and y values, and y0 becomes x0
						        return {
						            x: d.y,
						            y: d.x,
						            x0: d.y0
						        };
						    });
						}),
					    svg = d3.select('#chartContainer3')
					        .append('svg')
					        .attr('width', width + margins.left + margins.right + legendPanel.width)
					        .attr('height', height + margins.top + margins.bottom)
					        .append('g')
					        .attr('transform', 'translate(' + margins.left + ',' + margins.top + ')'),
					    xMax = d3.max(dataset, function (group) {
					        return d3.max(group, function (d) {
					            return d.x + d.x0;
					        });
					    }),
					    xScale = d3.scale.linear()
					        .domain([0, xMax])
					        .range([0, width]),
					    months = dataset[0].map(function (d) {
					        return d.y;
					    }),
					    
					    yScale = d3.scale.ordinal()
					        .domain(months)
					        .rangeRoundBands([0, height], .1),
					    xAxis = d3.svg.axis()
					        .scale(xScale)
					        .orient('bottom'),
					    yAxis = d3.svg.axis()
					        .scale(yScale)
					        .orient('left'),
					    colours = d3.scale.category10(),
					    groups = svg.selectAll('g')
					        .data(dataset)
					        .enter()
					        .append('g')
					        .style('fill', function (d, i) {
					        return colours(i);
					    }),
					    rects = groups.selectAll('rect')
					        .data(function (d) {
					        return d;
					    })
					        .enter()
					        .append('rect')
					        .attr('x', function (d) {
					        return xScale(d.x0);
					    })
					        .attr('y', function (d, i) {
					        return yScale(d.y);
					    })
					        .attr('height', function (d) {
					        return yScale.rangeBand();
					    })
					        .attr('width', function (d) {
					        return xScale(d.x);
					    }).on('mouseover', function (d) {
					        var xPos = parseFloat(d3.select(this).attr('x')) / 2 + width / 2;
					        var yPos = parseFloat(d3.select(this).attr('y')) + yScale.rangeBand() / 2;

					        d3.select('#tooltip')
					            .style('left', xPos + 'px')
					            .style('top', yPos + 'px')
					            .select('#value')
					            .text(d.x);

					        d3.select('#tooltip').classed('hidden', false);
					    }).on('mouseout', function () {
					        d3.select('#tooltip').classed('hidden', true);
					    })

					    svg.append('g')
					        .attr('class', 'axis')
					        .attr('transform', 'translate(0,' + height + ')')
					        .call(xAxis);

						svg.append('g')
						    .attr('class', 'axis')
						    .call(yAxis);

						svg.append('rect')
						    .attr('fill', 'yellow')
						    .attr('width', 160)
						    .attr('height', 30 * dataset.length)
						    .attr('x', width + margins.left)
						    .attr('y', 0);

						series.forEach(function (s, i) {
						    svg.append('text')
						        .attr('fill', 'black')
						        .attr('x', width + margins.left + 8)
						        .attr('y', i * 24 + 24)
						        .text(s);
						    svg.append('rect')
						        .attr('fill', colours(i))
						        .attr('width', 60)
						        .attr('height', 20)
						        .attr('x', width + margins.left + 90)
						        .attr('y', i * 24 + 6);
						});
				 }
				
				/* d3.select(".graph").selectAll("p")
					.data(dataset)
					.enter()
					.append("p")
					.text("New paragraph!")
					.text(function(d) {
						return d;
					}).style("color", function(d){
						
						if (d > 15)
							return "red";
						else
							return "black";
						
					}).attr("class", "bar")
					.style("height", function(d){
						return d + "px";
					})
					; */
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
