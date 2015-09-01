/*        	var chartList = [];
        	$.each(${jsonBubbleChartList}, function (idx, _data){
        		chartList.push({legend:_data.svcCd, category:_data.cnctCtgNm, value:_data.mbrCnt});
        	});
        	
        	return eChartOpt.getMultiBarOpt(chartList, 'TEST');
*/
var insights = {
		 getDefBarOpt : function(_title, _subtitle){
			 return { 
				 title		: { text: (_title == null || _title == 'undefined') ? '' : _title, subtext: (_subtitle == null || _subtitle == 'undefined') ? '' : _subtitle }
				, grid		: { borderWidth : 1}
				, tooltip	: { trigger: 'item', formatter: "{b} : {c}" }
				, legend	: { show:false, orient : 'vertical', x : 'left' , data : []      }
				, xAxis		: [ { show:true, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] } ]
				, yAxis		: [ { show:true, type: 'value',     axisLine: { lineStyle: { width: 1 } }                    }]
				, series	: [ { type:'bar', barGap:'3%',    itemStyle:{normal: { label : {show : true, position: 'top'}}},	data:[]	}]}
		 },
		getDefPieOpt : function(_title){
			return { 
				title		: { text: (_title == null || _title == 'undefined') ? '' : _title, subtext: (_subtitle == null || _subtitle == 'undefined') ? '' : _subtitle }
				, grid		: { borderWidth : 0}
				, tooltip	: { trigger: 'item', formatter: "{b} : {c} ({d}%)" }
				, legend	: { show:true, orient : 'vertical', x : 'left' , data : []      }
				, xAxis		: [ { show:false, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] } ]
				, yAxis		: [ { show:false, type: 'value',     axisLine: { lineStyle: { width: 1 } }                    }]
				, series	: [ { type:'pie',        itemStyle:{normal: { label : {show : true, position: 'top'}}},	data:[]	}]};
		},
		
		getDefMultiBarOpt : function(_title, _subtitle){
			return { 
				backgroundColor : '#fff'
				, title		: { text: (_title == null || _title == 'undefined') ? '' : _title, subtext: (_subtitle == null || _subtitle == 'undefined') ? '' : _subtitle }
				, grid		: { borderWidth : 1}
				, tooltip	: { trigger: 'item', axisPointer : { type : 'shadow' }, formatter: "{a}</br>{b} : {c}" }
				, legend	: { show:true , x:'right', data : []      } // , orient : 'vertical', x : 'left'
				, xAxis		: [ { show:true, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] } ]
				, yAxis		: [ { show:true, type: 'value',     axisLine: { lineStyle: { width: 1 } }                    }]
				, series	: [ ]}	; 
		},
		
		
		getDefAreaLineOpt : function(_title, _subtitle){
			return { 
				backgroundColor : '#fff'
				, title		: { text: (_title == null || _title == 'undefined') ? '' : _title, subtext: (_subtitle == null || _subtitle == 'undefined') ? '' : _subtitle }
				, grid		: { borderWidth : 1}
				, tooltip	: {  trigger: 'axis', axisPointer : { type : 'shadow', show : false }
							, formatter :  function (param){
						            var rtndata = "";
						            rtndata += param[0].name;
						            rtndata += "<br/>" +  param[0].data.name + " : " + param[0].data.value + "% ("+param[2].data.name+" "+param[2].data.value+"%)";
						            rtndata += "<br/> " +  param[1].data.name + " : " + (param[1].data.value * -1) +"% ("+param[3].data.name+" "+(param[3].data.value*-1) +"%)";
						            return rtndata;
						        }}
				, legend	: { show:true , x:'right' , data : []      } // , orient : 'vertical', x : 'left'
				, xAxis		: [ { show:true, type: 'value',     axisLine: { lineStyle: { width: 1 } }, axisLabel:{formatter:function(value){ if(value > 0) return value + "%"; else return (-1 * value)  + "%"; }}
								, splitLine: {lineStyle:{type:'dashed'}}                    }]
				, yAxis		: [ { show:true, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] } ]
				, series	: [ ]}	; 
		},
		
		
		
		getDefLineOpt : function(_title, _subtitle){
			return option = {
				    title	: { text:(_title == null || _title == 'undefined') ? '' : _title },
				    tooltip	: { trigger: 'axis' },
				    legend	: { data:[]	/*// KKKKKK  */},
				    calculable : true,
				    xAxis	: [ { type : 'category', boundaryGap : false, data : []	/*// KKKKKK  */ } ],
				    yAxis	: [ { type : 'value' } ],
				    series : [
				        {
				            name:'最高气温',	// legend 명
				            type:'line',
				            data:[11, 11, 15, 13, 12, 13, 10],	// category 개수 만큼
				            markPoint : { data : [ {type : 'max'}, {type : 'min'} ] }
				        },
				        {
				            name:'最低气温',
				            type:'line',
				            data:[1, -2, 2, 5, 3, 2, 0]
				        }
				    ]
				};            
		},
		
		getDefScatterOpt : function(_title){
			return {
				title		: { text: (_title == null || _title == 'undefined') ? '' : _title }
				, tooltip	: { trigger: 'item'
						        , formatter		: function (params) {
						            if (params.value.length > 1) {	return params.seriesName + ' <br/>' + params.value[0] + ' : ' + params.value[1] ;	}
						            else {	return params.seriesName + ' <br/>' + params.name + ' : '+ params.value; }	}
								, axisPointer	:{ show: false, type : 'cross', lineStyle: { type : 'dashed', width : 1 } } }
				, legend	: { data:[] }
				, xAxis		: [ { type : 'category', data : [] } ]
			    , yAxis		: [ { type : 'value' } ]
			    , series	: [ { name : '女性', type:'scatter', data: [['20대', 25.6], ['30대', 81.8], ['40대', 40.7]]
			           /*, markPoint : {
			                data : [
			                    {type : 'max'}, {type : 'min'}
			                ]
			            },
			            markLine : {
			                data : [{type : 'average'}]
			            }*/
			        },
			        {
			            name:'男性',
			            type:'scatter',
			            data: [['20대', 65.6], ['30대', 71.8], ['40대', 80.7]]
			        }
			    ]
			};
		},
			                    
		
		/*
		var firOpt =  {
    title : {
        text: '某站点用户访问来源',
        subtext: '纯属虚构',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'访问来源',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:335, name:'直接访问'},
                {value:310, name:'邮件营销'},
                {value:234, name:'联盟广告'},
                {value:135, name:'视频广告'},
                {value:1548, name:'搜索引擎'}
            ]
        }
    ]
};
		option = {
			    timeline : {
			        data : [
			            '2013-01-01', '2013-02-01', '2013-03-01', '2013-04-01', '2013-05-01',
			            { name:'2013-06-01', symbol:'emptyStar6', symbolSize:8 },
			            '2013-07-01', '2013-08-01', '2013-09-01', '2013-10-01', '2013-11-01',
			            { name:'2013-12-01', symbol:'star6', symbolSize:8 }
			        ],
			        label : {
			            formatter : function(s) {
			                return s.slice(0, 7);
			            }
			        }
			    },
			    options : []
			};
			
			
var ecConfig = require('echarts/config');
echarts.config
function eConsole(param) {
  console.log( '【' + param.type + '】');
    console.log(param);
    if(param.currentIndex%2 == 0){	// param.data
    
    }else{
    }
}
myChart.on(ecConfig.EVENT.TIMELINE_CHANGED, eConsole);

			   */           
		
		getBarOpt : function(chartList, title, subtitle){
			return this._getChartData(this.getDefBarOpt(title, subtitle), chartList);
		},
		
		getPieOpt : function(chartList, title, subtitle){
			return this._getChartOption(this.getDefPieOpt(title, subtitle), chartList);
		},
		
		_getChartOption : function(chartOpt, chartList){
			var legendData = [], categoryData = [];
			$.each(chartList, function(_idx, _data){ 
				try{	if(legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend);	}catch(exception){} 
				try{	if(categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);	}catch(exception){}  
			});
			chartOpt.legend.data = legendData;
			chartOpt.xAxis.data = categoryData;
			
			var chartData = [];	
			$.each(chartList, function(idx, _data){	
				if(_data.itemStyle == null || _data.itemStyle == 'undefined') 
					chartData.push({value:_data.value, name:_data.category});
				else chartData.push({value:_data.value, name:_data.category, itemStyle:_data.itemStyle});
				});
			chartOpt.series.data = chartData;
			return chartOpt;
		},
		
		getMultiBarOpt : function(chartList, title, subtitle){
			var color = ['rgba(252,206,16,1)', '#FF8383'];
			var opt = this.getDefMultiBarOpt(title, subtitle);
			
			var legendData = [], categoryData = [];
			$.each(chartList, function(_idx, _data){ 
				if(legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend); 
				if(categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);  
			});
			opt.legend.data = legendData;	
			opt.xAxis[0].data = categoryData; 
			
			var series = [];	
			$.each(legendData, function(_idx, _legend){
				var data = [];
				var _grepData = $.grep(chartList, function(_data){    return _data.legend == _legend;    });
				$.each(_grepData, function(_subIdx, _data){
					if(_data.itemStyle == null || _data.itemStyle == 'undefined') 
						data.push({value:_data.value, name:_data.name});
					else data.push({value:_data.value, name:_data.name, itemStyle:_data.itemStyle});
					});
				series.push({name:_legend, type:'bar', barGap:'3%',itemStyle:{normal: { color:color[_idx], label : {show : true, position: 'top'}}}, data:data, markPoint:{show:false, data:[]}});
				
			});
			opt.series = series;

			return opt;
		},	
		
		
		getAreaLineOpt : function(chartList, title, subtitle){
			var color = ['rgba(252,206,16,1)', '#FF8383'];
			var opt = this.getDefAreaLineOpt(title, subtitle);
			
			var legendData = [], categoryData = [];
			$.each(chartList, function(_idx, _data){ 
				if(legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend); 
				if(categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);  
			});
			opt.legend.data = legendData;	
			opt.yAxis[0].data = categoryData; 
			
			var series = [];	
			$.each(legendData, function(_idx, _legend){
				var data = [];
				var _grepData = $.grep(chartList, function(_data){    return _data.legend == _legend;    });
				$.each(_grepData, function(_subIdx, _data){
					if(_data.itemStyle == null || _data.itemStyle == 'undefined') 
						data.push({value:_data.value, name:_data.name});
					else data.push({value:_data.value, name:_data.name, itemStyle:_data.itemStyle});
					});
				series.push({name:_legend, type:'line', symbolSize : 5, itemStyle:{normal: { color:color[_idx], label : {show : true, position: 'top'}}}, data:data, markPoint:{show:false, data:[]}});
				
			});
			opt.series = series;

			return opt;
		},	
		
		
		
		

	    drawInsightTable : function(tableId, chartList, timeline){
	    	var legendData = [], categoryData = [];
	        $.each(chartList, function(_idx, _data){ 
	            try{    if(legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend);    }catch(exception){} 
	            try{    if(categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);    }catch(exception){}  
	        });
	        
	    	if(timeline == null || timeline == 'undefined'){
	    		this._drawTable(tableId, chartList, legendData, categoryData);
	    	}else{
	    		this._drawTimeLineTable(tableId, chartList, legendData, categoryData, timeline);
	    	}
	    },

	    _drawTimeLineTable : function(tableId, chartList, legend, category, timeline){
	        var thead= $('#'+tableId+' thead'); var tRow = $('<tr class="longH"></tr>');  var subTRow = $('<tr class="thDepth"></tr>');
	        for(var i = 0, end = timeline.length ; i < end ; i++){
	            var tCell = null;
	            if(i == 0) tRow.append(tCell = $('<th rowspan="2">     </th>'));
	            tRow.append(tCell = $('<th colspan=\''+legend.length+'\'>'+ timeline[i] +'</th>'));
	            
	            for(var sub = 0, subEnd = legend.length ; sub < subEnd ; sub++){
	            var subTCell = null; subTRow.append(subTCell = $('<th>'+ legend[sub] +'</th>'));
	            }
	        }
	         thead.append(tRow);  thead.append(subTRow);
	              
	         var tbody= $('#'+tableId+' tbody');
	         for(var i = 0, cateLen = category.length ; i < cateLen ; i++){
	             var tRow = $('<tr></tr>');
	             var tCell = null; tRow.append(tCell = $('<td>'+ category[i] +'</td>'));   tCell.addClass('depth2').addClass('txtC');
	             var _cateData = $.grep(chartList, function(_data){    return _data.category == category[i];    });
	             for(var j = 0, timeLen = timeline.length ; j < timeLen ; j++){
	                 var _timeData = $.grep(_cateData, function(_data){    return _data.name == timeline[j];    });
	                 for(var k = 0, legLen = legend.length ; k < legLen ; k++){
	                     var _lenData = $.grep(_timeData, function(_data){    return _data.legend == legend[k];    });
	                     tCell = null; tRow.append(tCell = $('<td>'+ _lenData[0].value +'</td>'));
	                 }
	             }
	             tbody.append(tRow);
	         }
	    },
	    
	    _drawTable : function(tableId, chartList, legend, category){
	        var thead= $('#'+tableId+' thead'); var tRow = $('<tr></tr>'); 
	        for(var i = 0, end = legend.length ; i < end ; i++){
	            if(i == 0) tRow.append(tCell = $('<th>     </th>'));
	            var tCell = null; tRow.append(tCell = $('<th>'+ legend[i] +'</th>'));
	        }
	        thead.append(tRow);

	        var tbody= $('#'+tableId+' tbody');
	        for(var i = 0, cateLen = category.length ; i < cateLen ; i++){
	            var tRow = $('<tr></tr>');
	            var tCell = null; tRow.append(tCell = $('<td>'+ category[i] +'</td>'));   tCell.addClass('depth2').addClass('txtC');
	            var _cateData = $.grep(chartList, function(_data){    return _data.category == category[i];    });
	            for(var k = 0, legLen = legend.length ; k < legLen ; k++){
	            var _lenData = $.grep(_cateData, function(_data){    return _data.legend == legend[k];    });
	            tCell = null; tRow.append(tCell = $('<td>'+ _lenData[0].value +'</td>'));
	            }
	            tbody.append(tRow);
	        }
	    }
	    
	}
