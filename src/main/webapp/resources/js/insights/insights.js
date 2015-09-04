/*        	var chartList = [];
        	$.each(${jsonBubbleChartList}, function (idx, _data){
        		chartList.push({legend:_data.svcCd, category:_data.cnctCtgNm, value:_data.mbrCnt});
        	});
        	
        	return eChartOpt.getMultiBarOpt(chartList, 'TEST');
*/
var insights = {
		getDefOpt : function(_title, _subtitle){
			return { 
				backgroundColor : '#fff'
				, title		: { text: (_title == null || _title == 'undefined') ? '' : _title, textStyle:{fontSize: 16, color:'gray'}, subtext: (_subtitle == null || _subtitle == 'undefined') ? '' : _subtitle , subtextStyle:{fontSize: 14},}
				, grid		: { borderWidth : 1, x2:30}
				, tooltip	: { trigger: 'item', textStyle : { align : 'left'}, axisPointer : { type : 'shadow' }, formatter: "{a}</br>{b} : {c}" }
				, legend	: { show:true, x:'right', data : []      }
				, xAxis		: [ { show:true, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] } ]
				, yAxis		: [ { show:true, type: 'value',     axisLine: { lineStyle: { width: 1 } }                    }]
				, series	: [ ]}	; 
		},
		
		 getDefBarOpt : function(_title, _subtitle){
			 var option = this.getDefOpt(_title, _subtitle);
			 option.tooltip.formatter = "{b} : {c}";
			 option.legend.show = false;
			 option.series = [ { type:'bar', barGap:'3%',    itemStyle:{normal: { label : {show : true, position: 'top'}}},	data:[]	}];
			 return option;
		 },
		getDefPieOpt : function(_title){
			var option = this.getDefOpt(_title, _subtitle);
			option.grid.borderWidth = 0;
			option.tooltip.formatter = "{b} : {c} ({d}%)";
			option.legend.orient = 'vertical';
			option.legend.x = 'left';
			option.xAxis[0].show = false;
			option.yAxis[0].show = false;
			option.series = [ { type:'pie',        itemStyle:{normal: { label : {show : true, position: 'top'}}},	data:[]	}];
			return option;
		},
		
		getDefMultiBarOpt : function(_title, _subtitle){
			var option = this.getDefOpt(_title, _subtitle);
			option.tooltip.formatter = "{a}</br>{b} : {c}";
			return option;
		},
		
		
		getDefAreaLineOpt : function(_title, _subtitle){
			var option = this.getDefOpt(_title, _subtitle);
			option.tooltip = {  trigger: 'axis', axisPointer : { type : 'shadow', show : false }
							, formatter :  function (param){
					            var rtndata = "";
					            rtndata += param[0].name;
					            rtndata += "<br/>" +  param[0].data.name + " : " + param[0].data.value + "% ("+param[2].data.name+" "+param[2].data.value+"%)";
					            rtndata += "<br/> " +  param[1].data.name + " : " + (param[1].data.value * -1) +"% ("+param[3].data.name+" "+(param[3].data.value*-1) +"%)";
					            return rtndata;
					        }};
			option.xAxis[0] =  { show:true, type: 'value'
								, axisLine: { lineStyle: { width: 1 } }, splitLine: {lineStyle:{type:'dashed'}}
								, axisLabel:{formatter:function(value){ if(value > 0) return value + "%"; else return (-1 * value)  + "%"; }} };
			option.yAxis[0] = { show:true, type : 'category', axisLine: { lineStyle: { width: 1 } }, data : [] }; 
			return option;
		},
		
		
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
		
		getMultiBarOpt : function(chartList, title, subtitle, legend, category){
			var color = ['rgba(252,206,16,1)', '#FF8383'];
			var opt = this.getDefMultiBarOpt(title, subtitle);
			
			if(legend == null || legend == 'undefined' || category == null || category == 'undefined'){
				var legendData = [], categoryData = [];
				$.each(chartList, function(_idx, _data){ 
					if((legend == null || legend == 'undefined') && legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend); 
					if((category == null || category == 'undefined') && categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);  
				});
				if(legend == null || legend == 'undefined')	legend = legendData;	
				if(category == null || category == 'undefined')	category = categoryData;
			}
			
			opt.legend.data = legend;	
			opt.xAxis[0].data = category; 
			
			var series = [];	
			$.each(legend, function(_idx, _legend){
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
		
		
		
		

	    drawInsightTable : function(tableId, chartList, legend, category, timeline){
	    	if(legend == null || legend == 'undefined' || category == null || category == 'undefined'){
				var legendData = [], categoryData = [];
				$.each(chartList, function(_idx, _data){ 
					if((legend == null || legend == 'undefined') && legendData.indexOf(_data.legend) < 0)  legendData.push(_data.legend); 
					if((category == null || category == 'undefined') && categoryData.indexOf(_data.category) < 0)  categoryData.push(_data.category);  
				});
				if(legend == null || legend == 'undefined')	legend = legendData;	
				if(category == null || category == 'undefined')	category = categoryData;
			}
	        
	    	if(timeline == null || timeline == 'undefined'){
	    		this._drawTable(tableId, chartList, legend, category);
	    	}else{
	    		this._drawTimeLineTable(tableId, chartList, legend, category, timeline);
	    	}
	    },

	    _drawTimeLineTable : function(tableId, chartList, legend, category, timeline){
	        var thead= $(tableId+' thead'); var tRow = $('<tr class="longH"></tr>');  var subTRow = $('<tr class="thDepth"></tr>');
	        for(var i = 0, end = timeline.length ; i < end ; i++){
	            var tCell = null;
	            if(i == 0) tRow.append(tCell = $('<th rowspan="2">     </th>'));
	            tRow.append(tCell = $('<th colspan=\''+legend.length+'\'>'+ timeline[i] +'</th>'));
	            
	            for(var sub = 0, subEnd = legend.length ; sub < subEnd ; sub++){
	            var subTCell = null; subTRow.append(subTCell = $('<th>'+ legend[sub] +'</th>'));
	            }
	        }
	         thead.append(tRow);  thead.append(subTRow);
	              
	         var tbody= $(tableId+' tbody');
	         for(var i = 0, cateLen = category.length ; i < cateLen ; i++){
	             var tRow = $('<tr></tr>');
	             var tCell = null; tRow.append(tCell = $('<td>'+ category[i] +'</td>'));   tCell.addClass('depth2').addClass('txtC');
	             var _cateData = $.grep(chartList, function(_data){    return _data.category == category[i];    });
	             for(var j = 0, timeLen = timeline.length ; j < timeLen ; j++){
	                 var _timeData = $.grep(_cateData, function(_data){    return _data.name == timeline[j];    });
	                 for(var k = 0, legLen = legend.length ; k < legLen ; k++){
	                     var _lenData = $.grep(_timeData, function(_data){    return _data.legend == legend[k];    });
	                     tCell = null; tRow.append(tCell = $('<td>'+ formatCurrency(_lenData[0].tablevalue) +'</td>'));
	                 }
	             }
	             tbody.append(tRow);
	         }
	    },
	    
	    _drawTable : function(tableId, chartList, legend, category){
	        var thead= $(tableId+' thead'); var tRow = $('<tr></tr>'); 
	        for(var i = 0, end = legend.length ; i < end ; i++){
	            if(i == 0) tRow.append(tCell = $('<th>     </th>'));
	            var tCell = null; tRow.append(tCell = $('<th>'+ legend[i] +'</th>'));
	        }
	        thead.append(tRow);

	        var tbody= $(tableId+' tbody');
	        for(var i = 0, cateLen = category.length ; i < cateLen ; i++){
	            var tRow = $('<tr></tr>');
	            var tCell = null; tRow.append(tCell = $('<td>'+ category[i] +'</td>'));   tCell.addClass('depth2').addClass('txtC');
	            var _cateData = $.grep(chartList, function(_data){    return _data.category == category[i];    });
	            for(var k = 0, legLen = legend.length ; k < legLen ; k++){
	            var _lenData = $.grep(_cateData, function(_data){    return _data.legend == legend[k];    });
	            tCell = null; tRow.append(tCell = $('<td>'+ formatCurrency(_lenData[0].tablevalue) +'</td>'));
	            }
	            tbody.append(tRow);
	        }
	    },
	    
	    
	    
	    drawiFrame : function(mIdx, data){		
	    	var mDiv = '';
	    	//mDiv+='<div class="modal fade" id="myModal'+mIdx+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
	    	mDiv+='<div class="modal-dialog" >';
	    	mDiv+='  <div class="modal_content2 ">';
			mDiv+='    <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">close</span></button>';
			mDiv+='    <p class="paper_lfBg "></p>';
			mDiv+='    <p class="paper_rgBg "></p>';
			mDiv+='    <div class="modal_header2">';
			mDiv+='    <h2>'+data.title+'</h2>';
			mDiv+='    <span class="dottxt">'+data.subtitle+'</span>';
			mDiv+='  </div>';
			mDiv+='  <div class="modal_body2">';
			
			mDiv+= '			<div class="news mt30">                     ';
			mDiv+= '    			<h3>'+data.toptitle+'</h3>                                                 ';

			if(data.top != null && data.top != 'undefined'){	mDiv+='<p class="exp" style="font-size:15px">'+data.top+'</p>'; }
			
			mDiv+='    			<p class="iframeLy mt10"><iframe id="" name="" src="'+data.iframeSrc+'" scrolling="auto" frameborder="0" allowtransparency="true" style="width:100%;height:410px"></iframe></p>';
			
			if(data.bottom != null && data.bottom != 'undefined'){	mDiv+=this._getSubText(data.bottom); }
			
			mDiv+='    		</div>';
			mDiv+='  </div>';
			mDiv+='	</div>';
			//mDiv+='</div>';
			  
			$("#myModal"+mIdx).html(mDiv);
	    },
	    
	    drawModalDiv : function (mIdx, title, subtitle){
	      var mDiv = '';
	      //mDiv+='<div class="modal fade" id="myModal'+mIdx+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
	      mDiv+='<div class="modal-dialog">';
	      mDiv+='  <div class="modal_content2 ">';
	      mDiv+='    <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">close</span></button>';
	      mDiv+='    <p class="paper_lfBg "></p>';
	      mDiv+='    <p class="paper_rgBg "></p>';
	      mDiv+='    <div class="modal_header2">';
	      mDiv+='    <h2 id="myModalLabel">'+title+'</h2>';
	      mDiv+='    <span class="dottxt">'+subtitle+'</span>';
	      mDiv+='  </div>';
	      mDiv+='  <div class="modal_body2" id="modalBody'+mIdx+'"></div>';
	      mDiv+='</div>';
          //mDiv+='</div>';
	      
	      $("#myModal"+mIdx).html(mDiv);
	    },

	    getChartDiv : function (mIdx, idx, data){
	    	var title = data.title, showgrid = data.showgrid == 'true', top = data.top, bottom = data.bottom;
	        var chartDiv = '';
	        chartDiv+= '<div class="news '+(idx == 0?"mt30" : "mt100")+' " style="background: url(/resources/images/dottedLine_blue.gif) 0 bottom repeat-x;">                     ';
	        chartDiv+= '    <h3>'+title+'</h3>                                                 ';
	        
	        if(top != null && top != 'undefined'){	chartDiv+='<p class="exp" style="font-size:15px">'+top+'</p>'; }
	        
	        chartDiv+= '    <div class="layoutLR mt30">                                             ';
	        if(showgrid){
	            chartDiv+= '        <li class=" floatL boxSty" style="width:68%"><p class="newsCbox chart" id="chart'+mIdx+'_'+idx+'"  '+(data.height != null && data.height != 'undefined' ? 'style="height:'+data.height+'"' : "")+'>Chart Area</p></li>  ';
	            chartDiv+= '        <li class=" floatR boxTable" style="width:30%" id="grid'+mIdx+'_'+idx+'"> <table class="listTB2 tStriped2 mt10"  '+(data.height != null && data.height != 'undefined' ? 'style="height:'+data.height+'"' : "")+'><colgroup></colgroup><thead></thead><tbody></tbody></table></li> ';
	        }else{
	            chartDiv+= '        <li class=" floatL boxSty " style="width:100%;"><p class="newsCbox chart" id="chart'+mIdx+'_'+idx+'"  '+(data.height != null && data.height != 'undefined' ? 'style="height:'+data.height+'"' : "")+'>Chart Area</p></li>  ';
	        }
	        chartDiv+= '    </div>                                                             ';
	        
	        if(bottom != null && bottom != 'undefined'){	chartDiv+=this._getSubText(bottom); }
	        
	        chartDiv+= '</div>                                                                 ';
	        return chartDiv; 
	    }, 
	    
	    _getSubText : function(text){
	    	var texts = text.split("<br/>");
	    	var ul = '';
	    	ul+='<ul class="intxt">';
	    	texts.forEach(function(entry) {
	    		var entrys = entry.split(":");
	    		if(entrys.length > 1){
	    			ul+='	<li><strong>'+entrys[0]+':</strong> '+entrys[1]+'</li>';	
	    		}else{
	    			ul+='	<li>'+entry+'</li>';	
	    		}	
	    	});
	        ul+='</ul>';
	        return ul;
	    }
	    
	    
	    
	    
	    
	    

		
		/*
		getDefLineOpt : function(_title, _subtitle){
			return option = {
				    title	: { text:(_title == null || _title == 'undefined') ? '' : _title },
				    tooltip	: { trigger: 'axis' },
				    legend	: { data:[]	// KKKKKK  },
				    calculable : true,
				    xAxis	: [ { type : 'category', boundaryGap : false, data : []	// KKKKKK   } ],
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
			           , markPoint : {
			                data : [
			                    {type : 'max'}, {type : 'min'}
			                ]
			            },
			            markLine : {
			                data : [{type : 'average'}]
			            }
			        },
			        {
			            name:'男性',
			            type:'scatter',
			            data: [['20대', 65.6], ['30대', 71.8], ['40대', 80.7]]
			        }
			    ]
			};
		},
			         */           
		
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
	    
	}
