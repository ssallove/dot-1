<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--modal-->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog2">
	    <div class="modal_content2 ">
	    	
			<button aria-label="Close" class="close2" data-dismiss="modal" type="button">
			 <span aria-hidden="true">close</span>
			</button>
			<p class="paper_lfBg "></p>
			<p class="paper_rgBg "></p>
			
			<div class="modal_header2">
				<h2 id="myModalLabel">남과 여.. 同床異夢
				    <span class="dottxt">11번가 구매패턴으로 본 그들.. 그들은 달랐다..</span>
				</h2>
			</div>
			
			<div class="modal_body2" id="modalBody1" style="height: 670px;">
				<div class="news mt30 ">
				    <h3>상품군별 男과 女 누구를 Target으로 하였나?</h3>
				    <p class="exp" style="font-size:15px">각 카테고리별 구매자 = 100명일 때,<br>자동차용품, 취미용품(자전거/골프/낚시/등산), 가전용품류은 남성이,<br>여성의류, 출산 및 아동용품, 애완용품, 생필품, 건강용품은 여성이 주로 구매했다.</p>
				    <div class="layoutLR mt10">
				        <li class=" floatL boxSty " style="width:100%;">
				            <p class="newsCbox chart" id="insights1_chart_0" style="height: 410px;"></p>
				        </li>
				    </div>
				</div>
				<div class="news mt50 ">
				    <h3>男과 女, 11번가에서 무얼 사나?</h3>
				    <p class="exp" style="font-size:15px">남성 중 14명은 휴대폰액세서리를 사러, 8명은 자동차용품을 사러<br>여성 중 14명은 화장품을 사러, 9명은 세제/화장지를 사러,
				        <br>11번가를 찾았다!</p>
				    <div class="layoutLR mt10">
				        <li class=" floatL boxSty " style="width:100%;">
				            <p class="newsCbox chart" id="insights1_chart_1" style="height: 460px;"></p>
				        </li>
				    </div>
				</div>
				<div class="news mt50 ">
				    <h3>男과 女, 구매패턴으로 본 그들의 Life Style</h3>
				    <p class="exp" style="font-size:15px">
				        <strong>남성</strong><br>&nbsp;&nbsp;&nbsp;남성 부동의 1위, 휴대폰/악세서리류<br>&nbsp;&nbsp;&nbsp;몸짱 - 20대 : 운동으로 가꾼 몸에 멋지게 차려입고, PC에도 관심있다..<br>&nbsp;&nbsp;&nbsp;My Car - 30대 : 관심은 PC관련 제품에서 자동차 용품으로, 운동용품 대신, 생필품으로..<br>&nbsp;&nbsp;&nbsp;My Home - 40대 : 공구관련 제품과 소형가전, 골프도 처음 top20에 진입한다.<br><br>
				        <strong>여성</strong><br>&nbsp;&nbsp;&nbsp;여성하면 피부, 전 연령층의 여성들은 피부만큼은 포기할 수 없다.
				        <br>&nbsp;&nbsp;&nbsp;Beauty - 20대 : 옷, 신발, 가방, 헤어제품 등 온통 나를 위한 소비로, 머리부터 발끝까지
				            나를 위해 아낌없이 투자..
				        <br>&nbsp;&nbsp;&nbsp;Baby - 30대 : 삶의 중심이 내가 아닌 아기에게로 이동하여,<br>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        유아용품/기저귀/물티슈/장난감과 세제/생수/생활용품 위주로 대변신..<br>&nbsp;&nbsp;&nbsp;Recovery
				            and Health - 40대 : 잃어버린 나를 찾는 시간으로, 다시 나를 가꾸고 건강에 관심이 높아진다..</p>
				    <div class="layoutLR mt10">
				        <li class=" floatL boxSty " style="width:100%;">
				            <p class="newsCbox chart" id="insights1_chart_2" style="height: 410px;"></p>
				        </li>
				    </div>
				</div>
			</div>
		</div>
	</div>
 </div>
 <!--!//modal -->
 
 
 
 
 <script>

 var incInsights1 = {
		 showInsight : function(){
			 var charts=[];
			 var myChart = echarts.init($('#insights1_chart_0')[0], GV_CHART_THEME);  this.drawChart0(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights1_chart_1')[0], GV_CHART_THEME);  this.drawChart1(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights1_chart_2')[0], GV_CHART_THEME);  this.drawChart2(myChart);   charts.push(myChart);
			 resizeChartOnWinResizeHandler.on(charts);
		 },
		 
		 drawChart0 : function(myChart){
			 $.ajax({
                 type: "GET",
                 url: '/resources/data/insights/samediff.csv',
                 dataType: "text",
                 success: function(data) {  
                	 var data_ = data.split("\n");
                     data_.forEach(function(entry) {
                         category.push(entry.split(",")[0]);
                         male.push(entry.split(",")[2]);
                         male_for_grp.push(  Math.round((100-entry.split(",")[1])*10)/10);
                         female.push(entry.split(",")[1]);
                     });
                     myChart.setOption(option);  
                 },
                 error: function(err){alert("err "+err); console.log(err)}
             });
             
			var category = [];
	        var male = [];
	        var male_for_grp = [];
	        var female = [];
			var option = {
			            title : {
			                text: '상품군별 男과 女',
			                subtext: '누구를 Target으로 하였나?'
			            },
			            tooltip : {
			                trigger: 'axis',
			                axisPointer : {
			                    type : 'shadow'
			                },
			            },
			            grid: {
			                y : 80,
			                y2 : 150
			            },
			            legend: {
			                data:['여성','남성'],
			                y : 40
			            },
			            xAxis : [
			                {   
			                    boundaryGap : false,
			                    type : 'category',
			                    data : category,
			                    axisLabel : {
			                        rotate : 70,
			                        textStyle:{
			                            fontWeight:'bold',
			                            formatter : function(d){
			                                return d + "%";
			                            } 
			                        }
			                    }
			                }
			            ],
			            yAxis : [
			                {
			                    type : 'value'
			                    , axisLabel : perLabel
			                }
			            ],
			              series : [
			                {
			                    name:'남성 ',
			                    type:'line',
			                    stack: 'area',
			                    symbolSize : 0,
			                    itemStyle: {
			                        normal: { color : GV_GENDER_COLOR.male(0.95),
			                            areaStyle: {type: 'default', color:GV_GENDER_COLOR.male(0.45)},
			                            lineStyle: {width : 0}
			                        }
			                    },
			                    data: male_for_grp
			                },
			                {
			                    name:'여성 ',
			                    type:'line',
			                    stack: 'area',
			                    symbolSize : 0,
			                    itemStyle: {normal: 
			                        {color : GV_GENDER_COLOR.female(0.95),
			                    	 areaStyle: {type: 'default', color:GV_GENDER_COLOR.female(0.35)},
			                         lineStyle: {width : 0}
			                        }},
			                    data: female
			                },
			                {name:'여성', type:'bar', barWidth : 0, itemStyle:{show:false, normal:{color:GV_GENDER_COLOR.female(0.95)} }, data : female },
			                {name:'남성', type:'bar', barWidth : 0, itemStyle:{show:false, normal:{color:GV_GENDER_COLOR.male(0.95)} }, data:male }
			            ]
			        };
		 },
		 

         
         drawChart1 : function(myChart){
        	 $.ajax({
                 type: "GET",
                 url: '/resources/data/insights/samediff3.csv',
                 dataType: "text",
                 success: function(data) {  
                	 var data_ = data.split("\n");
                      data_.forEach(function(entry) {
                          category.push(entry.split(",")[0]);
                          male.push(entry.split(",")[2]);
                          female.push(entry.split(",")[1]);
                      });
                     myChart.setOption(option);  
                 },
                 error: function(err){alert("err "+err); console.log(err)}
             });
             
        	 var category = [];
             var male = [];
             var female = [];
             var option = {
                     title : {
                         text: '11번가와 男과 女',
                         subtext: '11번가에서 무얼 사나?'
                     },
                     tooltip : {
                         trigger: 'axis',
                         axisPointer : {
                             type : 'shadow'   
                         },
                     },
                     grid: {
                         x : 150, y2 : 30, borderWidth : 1
                     },
                     legend: {
                         data:['여성','남성'],
                         y : 30
                     },
                     yAxis : [
                         {
                             type : 'category',
                             data : category,
                             axisLabel : {
                                 textStyle:{
                                     fontWeight:'bold'
                                 },
                             }
                         }
                     ],
                     xAxis : [
                         {
                             type : 'value',
                             axisLabel : perLabel
                         }
                     ],
                     series : [
                         {
                             name:'남성',
                             type:'bar',
                             barGap:'5%',
                             data:male,
                             itemStyle : {normal:{barBorderColor:GV_GENDER_COLOR.male(0.25), barBorderWidth: 30,color:GV_GENDER_COLOR.male(0.95), areaStyle:{ color:GV_GENDER_COLOR.male(0.45)}, lineStyle:{ color:GV_GENDER_COLOR.male(0.45)}}}
                         },
                         {
                             name:'여성',
                             type:'bar',
                             barGap:'5%',
                             data:female,
                             itemStyle : {normal:{barBorderColor:GV_GENDER_COLOR.female(0.25), barBorderWidth: 30,color:GV_GENDER_COLOR.female(0.95), areaStyle:{ color:GV_GENDER_COLOR.female(0.35)}, lineStyle:{ color:GV_GENDER_COLOR.female(0.35)}}}
                         }
                     ]
                 };
         },
         
		 drawChart2 : function(myChart){
			 
			 var markstyle = {
                     getStyle : function (position, color){
                         return {
                             normal : {
                                 color : color,
                                 label : {
                                     show : true,
                                     position : position,
                                     formatter: function(d){
                                         return(d.data.xAxis);
                                     },
                                     textStyle : {
                                         fontWeight : "bold",
                                         fontSize : 14
                                     }
                                 }
                             }
                         };
                 },
                 
                 rf : function(){ return this.getStyle('right', '#A50000'); },
                 lf : function(){ return this.getStyle('left', '#A50000'); },
                 rm : function(){ return this.getStyle('right', '#005766'); },
                 lm : function(){ return this.getStyle('left', '#005766'); },
             };


			 $.ajax({
                 type: "GET",
                 url: '/resources/data/insights/samediff2.csv',
                 dataType: "text",
                 success: function(data) {  dataProcess(data);  },
                 error: function(err){alert("err "+err); console.log(err)}
             });
             

			 var data_arr = [];
             var category = [], female = [], male= [];
             var categoryColor = [{"category":"화장품", "color":"#ED0000"},{"category":"운동취미", "color":"#005766"},{"category":"마트", "color":"#41AF39"},{"category":"생활", "color":"#660033"},{"category":"의류,잡화", "color":"#FF8224"},{"category":"출산아동", "color":"#F15F5F"},{"category":"가전", "color":"#78126a"},{"category":"PC", "color":"#3A3A3A"},{"category":"건강", "color":"#ff0066"},{"category":"가구", "color":"#DB9700"},{"category":"자동차", "color":"#0030DB"},{"category":"공구", "color":"#1993A8"}];
             
             function dataProcess(data){
                 var idx = 0;
                 data_ = data.split("\n");
                 data_.forEach(function(entry) {
                     entry = entry == "@" ? entry : entry.slice(0,entry.length-1);
                     if(entry.length == 1 && entry != "$"){ // @
                         data_arr[idx++] = [female, male];
                         female = []; male = []; 
                     } else if (entry != "$"){
                         var entry_ = entry.split("@");
                         if(entry_.length < 2){
                             var catData = entry_[0].split("&&");
                             var temp_cate = {"value":"","textStyle":{"fontWeight":"bold"}};
                             var colorObj =  $.grep(categoryColor, function(value, _idx){ return value.category == catData[0];    });
                             if(colorObj.length > 0) temp_cate.textStyle.color = colorObj[0].color;
                             temp_cate.value = catData[1];
                             category.push(temp_cate);
                         } else {
                             var dataidx = -1;
                             $.each(category, function(idx, _category){ if(_category.value == entry_[1])  dataidx = idx;  });
                             if(dataidx > -1){
                                 female[dataidx] = entry_[3]*1;
                                 male[dataidx] = entry_[2]*1;
                             }
                         }
                     }
                 });
                 
                 var option = {
                         timeline : {
                        	 show:true,
                             autoPlay : true, playInterval : 4000, 
                             type : 'number',
                             data : [
                                 '20-24세', '25-29세', '30-34세', '35-39세', '40-44세', '45-49세',
                             ]
                         },
                
                         options : [
                           {    
                             grid:{
                                 y2: 190
                             },
                             xAxis : [
                                 {
                                     type : 'category',
                                     data : category,
                                     boundaryGap : false,
                                     axisLabel : {
                                         rotate : 70
                                     },
                                 }
                             ],
                             yAxis : [
                                 {
                                     type : 'value',
                                     max : 20,
                                     axisLabel : perLabel
                                 }
                             ],
                             title : {
                                 text: '男과 女 , 연령대별 Shopping Style',
                                 subtext: '남/녀 가 11번가에서 구매한 상품 카테고리'
                             },
                             tooltip : {
                                 trigger : 'axis',
                                 axisPointer : {            
                                     type : 'shadow'   
                                 },
                             },
                             legend: {
                                 y : 30,
                                 data:['여성', '남성']
                             },
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.female(1)}},
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '화장품/향수/미용', yAxis: 17.5, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '여성의류', yAxis: 12.2, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '휴대폰/액세서리', yAxis: 14.6, itemStyle: markstyle.lf()},
                                             {name: 'markPoint4', symbol: 'emptyCircle', xAxis: 'e쿠폰/상품권/이용권', yAxis: 6.1, itemStyle: markstyle.rf()},
                                         ]
                                     },
                                     data: data_arr[0][0]
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint4', symbol: 'emptyCircle', xAxis: 'PC부품/주변기기', yAxis: 9.8, itemStyle: markstyle.rm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '남성의류/캐주얼의류', yAxis: 7.7, itemStyle: markstyle.rm()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '구기/수영/헬스/다이어트', yAxis: 6.3, itemStyle: markstyle.rm()},
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 17.2, itemStyle: markstyle.lm()},
                                         ]
                                     },
                                     data: data_arr[0][1]
                                 }
                                 
                             ]
                         },
                         {
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.female(1)}},
                                     data: data_arr[1][0],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', xAxis: '화장품/향수/미용', yAxis: 16.9, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '여성의류', yAxis: 9.2, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '휴대폰/액세서리', yAxis: 11, itemStyle: markstyle.lf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: 'e쿠폰/상품권/이용권', yAxis: 7.4, itemStyle: markstyle.rf()},
                                         ]
                                     }
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     data: data_arr[1][1],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: 'PC부품/주변기기', yAxis: 8.5, itemStyle: markstyle.rm()},
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 16.1, itemStyle: markstyle.lm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '구기/수영/헬스/다이어트', yAxis: 6.8, itemStyle: markstyle.rm()},
                                             {name: 'markPoint4', symbol: 'emptyCircle', xAxis: '자동차용품', yAxis: 7, itemStyle: markstyle.rm()},
                                         ]
                                     },
                                 }
        
                                 
                             ]
                         },
                         {
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.female(1)}},
                                     data: data_arr[2][0],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '화장품/향수/미용', yAxis: 13.4, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '출산/유아용품/임부복', yAxis: 11.9, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 9.3, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '물티슈/생리대/성인패드', yAxis: 7.9, itemStyle: markstyle.rf()},
                                         ]
                                     }
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     data: data_arr[2][1],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint2', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 15, itemStyle: markstyle.lm()},
                                             {name: 'markPoint1', symbol: 'emptyCircle', xAxis: 'PC부품/주변기기', yAxis: 7.4, itemStyle: markstyle.rm()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '구기/수영/헬스/다이어트', yAxis: 6.2, itemStyle: markstyle.rm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '자동차용품', yAxis: 9.5, itemStyle: markstyle.rm()},
                                         ]
                                     },
                                 }
                                 
                             ]
                         },
                         {
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color: GV_GENDER_COLOR.female(1)}},
                                     data: data_arr[3][0],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '화장품/향수/미용', yAxis: 11.4, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '출산/유아용품/임부복', yAxis: 10.2, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 9.8, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '장난감/인형/유아교육', yAxis: 8.9, itemStyle: markstyle.rf()},
                                         ]
                                     }
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     data: data_arr[3][1],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint2', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 14, itemStyle: markstyle.lm()},
                                             {name: 'markPoint1', symbol: 'emptyCircle', xAxis: 'PC부품/주변기기', yAxis: 6.4, itemStyle: markstyle.rm()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 7.8, itemStyle: markstyle.rm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '자동차용품', yAxis: 9.2, itemStyle: markstyle.rm()},
                                         ]
                                     },
                                 }
                                 
                             ]
                         },
                         {
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.female(1)}},
                                     data: data_arr[4][0],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '화장품/향수/미용', yAxis: 12.2, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '생활/수납/욕실/청소', yAxis: 7.1, itemStyle: markstyle.lf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 9.8, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '쌀/과일/농수축산물', yAxis: 8, itemStyle: markstyle.rf()},
                                         ]
                                     }
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     data: data_arr[4][1],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint2', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 14, itemStyle: markstyle.lm()},
                                             {name: 'markPoint1', symbol: 'emptyCircle', xAxis: '캠핑/낚시', yAxis: 5.9, itemStyle: markstyle.rm()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 7.4, itemStyle: markstyle.rm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '자동차용품', yAxis: 8.4, itemStyle: markstyle.rm()},
                                         ]
                                     },
                                 }
                                 
                             ]
                         },
                         {
                             series : [
                                 {
                                     name:'여성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.female(1)}},
                                     data: data_arr[5][0],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint1', symbol: 'pin', xAxis: '화장품/향수/미용', yAxis: 13.9, itemStyle: markstyle.rf()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 9.6, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '쌀/과일/농수축산물', yAxis: 9, itemStyle: markstyle.rf()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '헤어/바디', yAxis: 6.7, itemStyle: markstyle.lf()},
                                         ]
                                     }
                                 },
                                 {
                                     name:'남성',
                                     type:'line',
                                     itemStyle: {normal: {color:GV_GENDER_COLOR.male(1)}},
                                     data: data_arr[5][1],
                                     markPoint : {
                                         data : [
                                             {name: 'markPoint2', symbol: 'pin', xAxis: '휴대폰/액세서리', yAxis: 13.5, itemStyle: markstyle.lm()},
                                             {name: 'markPoint1', symbol: 'emptyCircle', xAxis: '주방/이미용/생활가전', yAxis: 6.3, itemStyle: markstyle.rm()},
                                             {name: 'markPoint2', symbol: 'emptyCircle', xAxis: '세제/세정/방향/제지', yAxis: 7, itemStyle: markstyle.rm()},
                                             {name: 'markPoint3', symbol: 'emptyCircle', xAxis: '자동차용품', yAxis: 7.2, itemStyle: markstyle.rm()},
                                         ]
                                     },
                                 }
                                 
                             ]
                         }
                     ]
                 };
                 
                 myChart.setOption(option);
             }
		 }
		 
		 
 };
 
 
 </script>