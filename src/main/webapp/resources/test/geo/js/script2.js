

var width = 800,
    height = 700,
    initialScale = 5500,
    initialX = -11835,
    initialY = 4050,
    centered,
    circles,
    labels;




var svg = d3.select("#container").append('svg')
    .attr("width", width)
    .attr("height", height)
    .attr('id', 'map');

var svg_chart = d3.select("#chart").append("svg") 
.attr("width", width) 
.attr("height", height); 


var states = svg.append("g")
.attr("id", "states");
//.call(zoom);

var map_chart = svg.append("g").attr("id", "map"), 
	places_chart = svg.append("g").attr("id", "places"); 


var projection = d3.geo.mercator()
    .scale(5500)
    .translate([-11835, 4050]);

var projection_chart = d3.geo.mercator() 
	.center([126.9895, 37.5651]) 
	.scale(100000) 
	.translate([width/2, height/2]);

var path = d3.geo.path().projection(projection);
var path_chart = d3.geo.path().projection(projection); 


/*
var zoom = d3.behavior.zoom()
    .translate(projection.translate())
    .scale(projection.scale())
    .scaleExtent([height, 800 * height])
    .on("zoom", zoom);




states.append("rect")
    .attr("class", "background")
    .attr("width", width)
    .attr("height", height);
*/

var data = {};



var waitOnDataUpload = function() {
	alert("waitOnDataUpload");
    var r = $.Deferred();
    loadData();

    var timeID = setInterval(function() {
        var millisec = 1000 * 3600 * 24;
        // repeatedly wait for 50 millisec until currdata gets uploaded
        if (Object.keys(data).length > (new Date(maxDate_str) - new Date(minDate_str)) / millisec) {
            clearInterval(timeID);
            r.resolve();
        }
    }, 50);

    return r.promise();
};


d3.json("data/skorea_municipalities_geo_simple.json", function(muni) {
    d3.json("data/skorea_provinces_geo_simple.json", function(prov) {
    	
    	/*
 alert("d3 path "+path);
 console.log("d3 muni.features "+muni.features[0]);
 alert("d3 prov.features "+prov.features[0]);
var muniData = muni.features;
console.log(muniData.length);
$(muniData).each(function (idx, data){
	//console.log(data.properties);	// Object {code: "39020", name: "서귀포시", name_eng: "Seogwipo-si", base_year: "2013"}
	//console.log(data.geometry);	// coordinates, type
	console.log(data.properties.name+" :: "+data.geometry.type+" :: "+data.geometry.coordinates.length);	// coordinates, type
});
*//*
      states.selectAll("path.muni")
          .data(muni.features)
        .enter().append("path")
          .attr("d", path)
          .attr("class", "muni");
      		//.attr("id", function(d) { console.log("path.muni id "+d.id); return d.id; });
          //.on("click", click);
*/
      states.selectAll("path.prov")
          .data(prov.features)
        .enter().append("path")
          .attr("d", path)
          .attr("class", "prov")
          .attr("id", function(d) { return 'path-'+d.id; });
          //.on("click", click);
    }); 
});

function zoom() {
	console.log(d3.event);
	console.log("zoom d3.event.translate "+d3.event.translate);
	console.log("zoom d3.event.scale "+d3.event.scale);
	console.log("zoom path "+path);
  projection.translate(d3.event.translate).scale(d3.event.scale);
  states.selectAll("path").attr("d", path);

  showMuni(d3.event.scale);
  /*
  circles.attr("transform", circlesTransform);
circles.attr("r", function() {
                    var r = (4*zoom.scale() - 2000)/10000;
                    return Math.min(r, 4) + "px"; })
                    */
}

function showMuni(scale) {

	states.selectAll("path.muni").style("visibility", "visible");
    states.selectAll("path.prov").style("fill-opacity", 0);
    /*
  if (scale > 15000) {
    states.selectAll("path.muni").style("visibility", "visible");
    states.selectAll("path.prov").style("fill-opacity", 0);
  } else {
    states.selectAll("path.muni").style("visibility", "hidden");
    states.selectAll("path.prov").style("fill-opacity", 1);
  }*/

}