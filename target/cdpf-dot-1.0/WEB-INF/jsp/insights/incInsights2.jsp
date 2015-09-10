<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--modal-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog2">
        <div class="modal_content2 ">
        
            <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">close</span></button>
            <p class="paper_lfBg "></p>
            <p class="paper_rgBg "></p>
            
            <div class="modal_header2">
                <h2>간단한 통계로 본  Syrup<span class="dottxt"></span></h2>
                
            </div>
            
            <div class="modal_body2">
                <!--내용1-->
                <div class="news mt10" style="background: url(/resources/images/dottedLine_blue.gif) 0 bottom repeat-x;">
                    <h3>Syrup 의 신규 가입 고객은 점차적으로 줄어 드는 추세에 있어, 신규 가입을 올리기 위한 Lead Generation 필요!<br>
                        2/30대 여성의 신규 가입 추세는 점차 줄어들고 있는 반면, 40대 여성 고객의 신규 가입 추이는 점차 상승</h3>
                        <!-- <p class="exp"> </p> -->
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%;height:270px !important;min-height:270px !important; ">
                                <p class="chart" id="insights2_chart_0" style="min-height:260px !important;"></p>
                            </li>
                            <li class=" floatL boxSty" style="width:100%;height:270px !important;min-height:270px !important; ">
                                <p class="chart" id="insights2_chart_1" style="min-height:260px !important;"></p>
                            </li>
                        </div>
                </div>
                <!--//내용1-->
                
                <!--내용3-->
                <div class="news mt50">
                    <h3>경제 활동 대비 Syrup의 Penetration은 21% 이며, <br>
                               이중 20대 여성의 Penetration 은 60.7% 로 시장 점유율 상승에는 한계가 있음.<br>
                               반면, 40대 여성은 시장 Penetration이 25.1%에 불과하여,<br>
                               신규 고객 유입 기회가 높고 Syrup의 활동성 또한 2/30대 비하여 낮지 않음.</h3>
                    
                        <div class="layoutLR">
                            <li class=" floatL boxSty newsCbox" style="width:60%">
                                <p class="chart" id="insights2_chart_2" style="height:418px"></p>
                            </li>
                            <li class=" floatR boxTable" style="width:38%">
                                <table class="listTB2 tStriped2 ">
                                    <colgroup>
                                    </colgroup>
                                    <thead>
                                        <tr class="thDepth">    <!-- longH -->
                                            <th colspan="2">&nbsp;</th>
                                            <th>인구수</th>
                                            <th>Syrup지갑<br/>가입자수</th>
                                            <th>Penetration<br/>Rate</th>
                                            <th>3개월<br/>Active 고객</th>
                                            <th>3개월<br/>Active 비중</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="depth2 txtC" rowspan="5">남성</td>
                                            <td class="depth2 txtC">20세이하</td>
                                            <!-- <td class="total">3.94</td> -->
                                            <td>5,866,657</td>
                                            <td>220,682</td>
                                            <td>3.8%</td>
                                            <td> 80,153</td>
                                            <td>36.3%</td>
                                        </tr>
                                        <tr>
                                            <td class="depth2 txtC">20대</td>
                                            <td>3,428,176</td>
                                            <td>1,147,757</td>
                                            <td>33.5%</td>
                                            <td>457,095</td>
                                            <td>39.8%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">30대</td>
                                          <td>3,926,630</td>
                                          <td>1,591,230</td>
                                          <td>40.5%</td>
                                          <td>764,015</td>
                                          <td>48.0%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC total">40대</td>
                                          <td class="total">4,116,072</td>
                                          <td class="total">981,953</td>
                                          <td class="total">23.9%</td>
                                          <td class="total">463,877</td>
                                          <td class="total">47.2%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">50세이상</td>
                                          <td>6,598,097</td>
                                          <td>523,721</td>
                                          <td>7.9%</td>
                                          <td>185,658</td>
                                          <td>35.4%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC" rowspan="5">여성</td>
                                          <td class="depth2 txtC">20세이하</td>
                                          <td>5,358,730</td>
                                          <td>321,290</td>
                                          <td>6.0%</td>
                                          <td>149,567</td>
                                          <td>46.6%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">20대</td>
                                          <td>3,166,193</td>
                                          <td>1,920,332</td>
                                          <td>60.7%</td>
                                          <td>1,034,215</td>
                                          <td>53.9%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">30대</td>
                                          <td>3,867,865</td>
                                          <td>1,797,931</td>
                                          <td>46.5%</td>
                                          <td>1,052,350</td>
                                          <td>58.5%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC total">40대</td>
                                          <td class="total">4,088,709</td>
                                          <td class="total">1,027,162</td>
                                          <td class="total">25.1%</td>
                                          <td class="total">563,464</td>
                                          <td class="total">54.9%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">50세이상</td>
                                          <td>7,940,241</td>
                                          <td>635,120</td>
                                          <td>8.0%</td>
                                          <td>270,660</td>
                                          <td>42.6%</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC" colspan="2">합계</td>
                                          <td class="total">48,357,370</td>
                                          <td class="total">10,167,178</td>
                                          <td class="total">21.0%</td>
                                          <td class="total">5,021,054</td>
                                          <td class="total">10.4%</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </li>
                        </div>
                </div>
                <!--//내용3-->
                
                 <!--내용4-->
                <div class="news mt50">
                    <h3>Syrup 방문 고객의 58.5%는 가입 2년 이상 경과한 고객이며,  <br>
	                        최근 3개월 이내 가입 고객의 비중은 10.9%로 기존 고객 중심의 서비스가 운영 되고 있음. <br>
	                        방문 고객의 82.3%가 다음월 Syrup을 유지하고 있고, 17.7% 고객은 이탈 하고 있음. <br>
	                        특히, 당월 방문 일수가 2일 이하인 Light User의 42.8%가 다음 월 이탈.     </h3>
                    <div class="newsCbox">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:56%">
                                <p class="chart" id="insights2_chart_3"></p>
                            </li>
                            <li class=" floatL boxSty" style="width:4%; padding-top:120px;">
                                <img src="<c:url value="/resources/images/icon_arrow.png"/>"  title="Insights 상단 이미지"/>
                            </li>
                            <li class=" floatL boxSty" style="width:38%">
                                <p class="chart" id="insights2_chart_4"></p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용4-->
                
                <!--내용5-->
                <div class="news mt50">
                    <h3>신규 가입 고객의 52.6%는 가입 당월 Syrup을 이탈하고 있어, 신규 고객의 Care Program (Early Engagement Program) 필요</h3>
                    <div class="newsCbox">
                        <div class="layoutLR">
                            <li class=" floatL boxSty" style="width:100%">
                                <p class="chart" id="insights2_chart_5"></p>
                            </li>
                        </div>
                    </div>
                </div>
                <!--//내용5-->
                
                <!--내용6-->
                <div class="news mt50">
                    <h3>향후 , CDPF Team에서는…   <br>
                    이탈 고객 예측 모형(Modeling) 개발을 통하여 이탈 고객을 예측하고 ,  <br>
                신규 고객 Rentention 모형 개발을 통하여 활동 가능성 높은 신규 고객을 예측 하여 마케팅에 적용 될 수 있도록 할 예정입니다. <br></h3>
                        <div class="layoutLR" align="center">
                        <li class=" floatL boxSty" style="width:33%;height:120px !important;min-height:120px !important;">
                                <strong style="font-size:21px; padding-top:80px;">이탈 모형 예시</strong>
                        </li>
                        <li class=" floatR boxTable" style="width:65%;height:120px !important;min-height:120px !important; ">
                                <table class="listTB2 tStriped2 ">
                                    <colgroup>
<!--                                     <col width="320px">
		                            <col width="280px">
		                            <col width=""> -->
                                    </colgroup>
                                    <thead></thead>
                                    <tbody>
                                        <tr>
                                            <td class="depth2 txtC">연령이 어떻게 되나요?</td>
                                            <td class="txtC"><input type="int" placeholder="나이" id="age"></input></td>
                                            <td>0 ~ 99세</td>
                                        </tr>
                                        <tr>
                                            <td class="depth2 txtC">성별이 어떻게 되나요?</td>
                                            <td class="txtC"><label class="checkB pr30"  >
		                                            <input type="radio" name="gender" id="gender" value="남성" checked="checked" />  남성
		                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                            <input type="radio" name="gender" id="gender" value="" />  여성
                                            </label></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">지난달 몇일 Syrup을 방문 하셨나요?</td>
                                          <td class="txtC"><input type="int" placeholder="지난달 방문" id="visitFre"></input></td>
                                          <td>1 ~ 30일</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC">Syrup에 가입 한후 몇 개월 경과 하였나요?</td>
                                          <td class="txtC"><input type="int" placeholder="가입 경과(개월)" id="stayMon"></input></td>
                                          <td>1 ~ 36개월</td>
                                        </tr>
                                        <tr>
                                          <td class="depth2 txtC  total">이탈 확률</td>
                                          <td class="txtC"><span id="calculData"></span></td>
                                          <td class="txtC"><a href="javascript:incInsights2.calcul();">이탈 확률 계산</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </li>
                        </div>
                </div>
                <!--//내용6-->
                
                <div class="news mt100" style="height:100px">
                    <h3>To Be Contitued 기대해주세요~^^</h3>
                </div>
                
            </div>
        </div>
     </div>
 </div>
 <!--!//modal -->
 
 
 
 
 <script>

 $("#myModal2 #age").on("keyup", function(){
	 $(this).val($(this).val().replace(/[^0-9]/gi, ""));
 });
 
 var incInsights2 = {
		 showInsight : function(){
			 var charts=[];
			 var myChart = echarts.init($('#insights2_chart_0')[0], GV_CHART_THEME);  this.drawChart0(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights2_chart_1')[0], GV_CHART_THEME);  this.drawChart1(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights2_chart_2')[0], GV_CHART_THEME);  this.drawChart2(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights2_chart_3')[0], GV_CHART_THEME);  this.drawChart3(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights2_chart_4')[0], GV_CHART_THEME);  this.drawChart4(myChart);   charts.push(myChart);
			 myChart = echarts.init($('#insights2_chart_5')[0], GV_CHART_THEME);  this.drawChart5(myChart);   charts.push(myChart);
			 resizeChartOnWinResizeHandler.on(charts);
		 },
		 
		 calcul : function calcul(){
	            var firstVal = -3.862187;
	            var x = firstVal + getAgeVal($('#myModal2 #age').val()) + 
	                    getGenderVal($('#myModal2 #gender').val()) + getVisitVal($('#myModal2 #visitFre').val()) + 
	                    getStayVal($('#myModal2 #stayMon').val());
	            
	            $('#myModal2 #calculData').text(Math.round( Math.exp(x)/(1+Math.exp(x)) * 100 * 10)/10  + "%");
	            
	            function getAgeVal(val_age){
	                if(val_age==0){return 0.005961;}
	                else if(val_age<=16){return 0.074545;}
	                else if(val_age<=21){return 0;}
	                else if(val_age<=24){return -0.084787;}
	                else if(val_age<=47){return -0.211127;}
	                else if(val_age<=56){return -0.314806;}
	                else if(val_age>57){return -0.31481;}


	            }

	            function getGenderVal(val_gender){
	                if(val_gender==""){return 0.151235;}
	                else if(val_gender=="남성"){return 0.030436;}
	                else return 0;
	            }

	            function getVisitVal(val_visit){
	                if(val_visit==1){return 0;}
	                else if(val_visit==2){return -0.983044;}
	                else if(val_visit==3){return -1.691774;}
	                else if(val_visit==4){return -2.248533;}
	                else if(val_visit<=9){return -3.409469;}
	                else if(val_visit<=14){return -5.176601;}
	                else if(val_visit>=15){return -6.905679;}
	            }

	            function getStayVal(val_stay){
	                if(val_stay==0){return 3.400749;}
	                else if(val_stay==1){return 5.59555;}
	                else if(val_stay<=3){return 4.336102;}
	                else if(val_stay<=10){return 4.045835;}
	                else if(val_stay<=17){return 3.950014;}
	                else if(val_stay<=23){return 3.839289;}
	                else if(val_stay>=24){return 3.916774;}
	            }
	            
	            
	        },

	        
		 drawChart0 : function(myChart){
			 var option = {
			         backgroundColor : '#fff',
			         title : {
			             text: '월별 Syrup 고객 신규 가입',
			         },
			         tooltip : {
			             trigger: 'axis',
			             axisPointer:{
			                 show: true,
			                 type : 'shadow'
			            },
			            formatter:function(p){ 
			                     return "[" + p[0][0] + "]<br/>" +
			                            p[0][1] + " : " + p[0].value + "명";
			             }
			         },
			         legend: {
			             data:['Syrup 고객 신규 가입'],
			             y : 20,
			             textStyle:{fontSize : 14}
			         },
			         grid: {
			             y : 60
			         },
			         calculable : true,
			         xAxis : [
			             {
			                 type : 'category',
			                 data : ['2015.01','2015.02','2015.03','2015.04','2015.05','2015.06','2015.07']
			             }
			         ],
			         yAxis : [
			             {
			                 type : 'value',
			                 axisLabel:{formatter:function(p) { return p/10000 +' 만명';}}
			             }
			         ],
			         series : [
			             {
			                 name:'Syrup 고객 신규 가입',
			                 type:'bar',
			                 data:[244203, 208157, 168041, 166377, 157322, 162074, 190059],
			                itemStyle: {
			                  normal: {
			                    label:{
			                      position : 'inside',
			                      show:true,
			                      formatter:function(p){ 
			                        return p.value + '명';
			                      },
			                      textStyle:{
			                        fontSize : 14,
			                        fontWeight : 'bold',
			                        color:'rgba(76,76,76,0.9)'
			                      }
			                    }
			                  }
			                },
			                 markLine : {
			                     data : [
			                         {type : 'average', name: '평균', 
			                         itemStyle: {
			                             normal: {
			                                 color:'#FF8383', 
			                                 label : {
			                                     show: true,
			                                     formatter:function(p){ 
			                                         return  '평균 ' + Math.round(p.value/1000)/10 + ' 만';
			                                     }
			                                 },
			                                 labelLine : {
			                                     show : true
			                                 },
			                                 lineStyle: {
			                                     width : 2.5
			                                 }
			                             }
			                         },}
			                     ]
			                 }
			             }
			         ]
			     };
             myChart.setOption(option);
		 },
		 
		 drawChart1 : function(myChart){
			var test20 = [];
            var test30 = [];
            var test40 = [];

            initData();

            function initData(){
                $.ajax({
                    type: "GET",
                    url: '/resources/data/insights/ageSyrup.csv',
                    dataType: "text",
                    success: function(data) {dataProcess(data);},
                    error: function(err){alert("err"); console.log(err)}
                });

            }

            function dataProcess(data){
                data_ = data.split("\n");
                data_.forEach(function(entry) {
                    var entry_ = entry.split(",");
                    test20.push(entry_[0]);
                    test30.push(entry_[1]);
                    test40.push(entry_[2]);
                });

                var option = {
                    title : {
                        text: 'Syrup 여성 고객의 가입 추이'
                    },
                    tooltip : {
                        trigger : 'axis',
                        axisPointer : {            
                            type : 'shadow'   
                        },
                        formatter:function(p){ 
                                return "[" + p[0][1] + "]<br/>" +
                                       p[0][0] + " : " +  Math.round( p[0].value * 100) / 100 +'% <br>' +
                                       p[1][0] + " : " +  Math.round( p[1].value * 100) / 100 +'% <br>' +
                                       p[2][0] + " : " +  Math.round( p[2].value * 100) / 100 +'% <br>'; 
                        }
                    },
                    legend: {
                        data:['20대','30대','40대'],
                        y : 20,
                        textStyle:{fontSize : 14}
                    },
                    grid: {
                        y : 60
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : function(){
                                var list=[];
                                for(var i = 1; i < 6; i++){
                                    for(var j = 1; j < 13; j++){
                                      var dt = '201'+i+'.';
                                      if(j < 10) dt += '0';
                                      list.push(dt+j)
                                      if(i == 5 && j == 7) break;
                                    }
                                }
                                return list;
                            }()
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            scale: true,
                            axisLabel : {
                                formatter : function(d){
                                    return d + "%";
                                } 
                            }
                        } 
                    ],
                    series : [
                          {
                                name:'20대',
                                type : 'line',
                                symbolSize : 0,
                                data : test20,
                                itemStyle: {
                                 normal: {
                                   lineStyle: {
                                        width : 3.5
                                    }
                                 }
                               },
                         },{
                                name:'30대',
                                type : 'line',
                                symbolSize : 0,
                                data : test30,
                                itemStyle: {
                                 normal: {
                                   lineStyle: {
                                        width : 3.5
                                    }
                                 }
                               },
                         },{
                                name:'40대',
                                type : 'line',
                                symbolSize : 0,
                                data : test40,
                                itemStyle: {
                                 normal: {
                                   lineStyle: {
                                        width : 3.5
                                    }
                                 }
                               },
                         },
                    ]
                };
                 
                 myChart.setOption(option);
	         }
		 },
		 
		 
		 
		 drawChart2 : function(myChart){

		        var datajson = [
		            {   
		                'gender' : '남성',
		                'age' : '20세이하',
		                'population' : '5866657',
		                'syrupMem' : '220682',
		                'penRate' : '3.8',
		                '3monAct' : '80153',
		                '3monActRate' : '36.3',
		            },{   
		                'gender' : '남성',
		                'age' : '20대',
		                'population' : '3428176',
		                'syrupMem' : '1147757',
		                'penRate' : '33.5',
		                '3monAct' : '457095',
		                '3monActRate' : '39.8',
		            },{   
		                'gender' : '남성',
		                'age' : '30대',
		                'population' : '3926630',
		                'syrupMem' : '1591230',
		                'penRate' : '40.5',
		                '3monAct' : '764015',
		                '3monActRate' : '48.0',
		            },{   
		                'gender' : '남성',
		                'age' : '40대',
		                'population' : '4116072',
		                'syrupMem' : '981953',
		                'penRate' : '23.9',
		                '3monAct' : '463877',
		                '3monActRate' : '47.2',
		            },{   
		                'gender' : '남성',
		                'age' : '50세이상',
		                'population' : '523721',
		                'syrupMem' : '220682',
		                'penRate' : '25.1',
		                '3monAct' : '185658',
		                '3monActRate' : '35.4',
		            },
		            {   
		                'gender' : '여성',
		                'age' : '20세이하',
		                'population' : '5358730',
		                'syrupMem' : '321290',
		                'penRate' : '6.0',
		                '3monAct' : '149567',
		                '3monActRate' : '46.6',
		            },{   
		                'gender' : '여성',
		                'age' : '20대',
		                'population' : '3166193',
		                'syrupMem' : '1920332',
		                'penRate' : '60.7',
		                '3monAct' : '1034215',
		                '3monActRate' : '53.9',
		            },{   
		                'gender' : '여성',
		                'age' : '30대',
		                'population' : '3867865',
		                'syrupMem' : '1797931',
		                'penRate' : '46.5',
		                '3monAct' : '1052350',
		                '3monActRate' : '58.5',
		            },{   
		                'gender' : '여성',
		                'age' : '40대',
		                'population' : '4088709',
		                'syrupMem' : '1027162',
		                'penRate' : '25.1',
		                '3monAct' : '563464',
		                '3monActRate' : '54.9',
		            },{   
		                'gender' : '여성',
		                'age' : '50세이상',
		                'population' : '7940241',
		                'syrupMem' : '635120',
		                'penRate' : '8.0',
		                '3monAct' : '270660',
		                '3monActRate' : '42.6',
		            }
		        ];


		       var option = {
		            title : {
		                text: 'Syrup 여성 Penetration Rate',
		            },
		            tooltip : {
		                trigger: 'axis',
		                axisPointer:{
		                    show: true,
		                    type : 'shadow',
		                },
		            },
		            legend: {
		                y : 50,
		                data:['여성 Penetration']
		            },
		            grid: {
		                y : 100, y2:20
		            },
		            xAxis : [
		                {
		                    type : 'value',
		                }
		            ],
		            yAxis : [
		                {
		                    type : 'category',
		                    data : ['20세 이하','20대', '30대', '40대', '50세 이상']
		                }
		            ],
		            series : [
		                {
		                    name:'여성 Penetration',
		                    type:'bar',
		                    data:[datajson[5].penRate, datajson[6].penRate, datajson[7].penRate,
		                          datajson[8].penRate, datajson[9].penRate],
		                    itemStyle: {
		                      normal: {
		                        color:'rgba(252,206,16,1)', 
		                        label:{
		                          position : 'inside',
		                          show:true,
		                          formatter:function(p){ 
		                            return p.value  + "%";
		                          },
		                          textStyle:{
		                            color:'rgba(76,76,76,0.8)',
		                            fontSize : 14,
		                            fontWeight : 'bold',
		                          }
		                        }
		                      }
		                    },
		                },
		            ]
		        };
		       
               myChart.setOption(option);
		                    
		 },
		 
		 drawChart3 : function(myChart){
			 var oridata = [2659114, 722712, 664607, 493728];
		        var outdata = [3786245, 761741];

		        function cvtformat_bar(p){ 
		            return p.seriesName;
		        }


		        var label_bar_right_sv = {
		            normal : {
		                color : "#FF8383",
		                label : {
		                    show : true,
		                    position : 'inside',
		                    formatter : cvtformat_bar,
		                    textStyle: {
		                        fontSize : 18,
		                        fontWeight : 'bold'
		                    }
		                }
		            }
		        };
		        var label_bar_right_fl = {
		            normal : {
		                color : "#8C8C8C",
		                label : {
		                    show : true,
		                    position : 'inside',
		                    formatter : cvtformat_bar,
		                    textStyle: {
		                        fontSize : 18,
		                        fontWeight : 'bold'
		                    }
		                }
		            }
		        };

		        var label_bar_left = {
		            normal : {
		                label : {
		                    show : true,
		                    position : 'left',
		                    formatter : cvtformat_bar,
		                    textStyle: {
		                        fontSize : 18,
		                        fontWeight : 'bold'
		                    }
		                }
		            }
		        };
		        
		        var markPointX = $(document).width()/1366;
		        var option = {
		            title : {
		                x : 20,
		                text: 'Syrup5.0 방문 고객 Migration',
		            },
		            tooltip : {
		               trigger: 'item',
		               formatter:function(p){ 
		                    return oridata[p.seriesIndex] + "명 <br/>" +
		                           "(" + p[2] + "%)";
		                }
		            },
		            grid : {
		                borderColor : '#fff',
		                x : 100, y:80, y2:30
		            },
		            xAxis : [
		                {   
		                    type : 'category',
		                    axisLine: {show:false},
		                    axisTick: {show:false},
		                    splitLine: {show:false},
		                    data : ['2015.07', '2015.08']
		                },
		               
		            ],
		            yAxis : [
		                {
		                    max : 100,
		                    show : false,
		                    type : 'value',
		                },
		            ],
		            series : [
		                {
		                    name:'가입 2년이상 경과',
		                    type:'bar',
		                    stack: 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 58.5, itemStyle : label_bar_left},
		                    ],
		                  markLine : {
		                        symbolSize:0,
		                        itemStyle:{
		                        normal:{
		                            lineStyle:{
		                                type: 'solid'
		                              , width : 2
		                              , color : 'rgba(170,198,255,1)'
		                            }
		                         }
		                    },
		                    data : [
		                        [{xAxis:'2015.07', yAxis:'100' }, {xAxis:'2015.08', yAxis:'82.3'}]
		                    ]
		            }
		                   
		                },
		                {
		                    name:'2년 이내 가입 고객',
		                    type:'bar',
		                    stack: 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 15.9, itemStyle : label_bar_left}
		                    ]
		                },
		                {
		                    name:'1년 이내 가입 고객',
		                    type:'bar',
		                    stack: 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 14.6, itemStyle : label_bar_left}
		                    ]
		                },
		                {
		                    name:'3개월 이내 가입 고객',
		                    type:'bar',
		                    stack: 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 10.9, itemStyle : label_bar_left}
		                    ]
		                },
		               {
		                    name:'유지',
		                    type:'bar',
		                    stack : 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 0},
		                      {value: 82.3, itemStyle : label_bar_right_sv}
		                    ]
		                },
		                {
		                    name:'이탈',
		                    type:'bar',
		                    stack : 'ST1',
		                    barWidth : 105,
		                    data:[
		                        {value: 0},
		                        {value: 17.8, itemStyle : label_bar_right_fl}
		                    ]
		                }
		            ]
		        }

			 
             myChart.setOption(option);
		 },
		 
		 
		 drawChart4 : function(myChart){
			 var option = {
			            tooltip : {
			                trigger: 'axis',
			                axisPointer:{
			                  show: true,
			                  type : 'shadow'
			                },
			            },
			            gird:{
			                height: 800,
			                borderWidth : 0,
			                borderColor : '#fff',
			                y2 : 0
			                
			            },
			            xAxis : [
			                {
			                    max : 100,
			                    type : 'value',
			                    show:false,
			                    axisLine: {show:false},
			                    axisTick: {show:false},
			                    splitArea: {show:false},
			                    splitLine: {show:false},
			                    axisLabel: {show:false},
			                }
			            ],
			            legend: {
			                y : 20,
			                x : 'center',
			                data:['유지','이탈']
			             },
			            yAxis : [
			                {
			                    type : 'category',
			                    show:false,
			                    axisLine: {show:false},
			                    axisTick: {show:false},
			                    splitArea: {show:false},
			                    splitLine: {show:false},
			                    axisLabel: {show:false},
			                    data : ['Light(1~2 days)','Medium(3~9 days)','Heavy(10~ days)']
			                }
			            ],
			            series : [
			                {
			                    name:'유지',
			                    type:'bar',
			                    barWidth : 55,
			                    stack: '总量',
			                    itemStyle : { normal: { color:'#FF8383', label : {show: true, 
			                        formatter : function(v){return v.value+"%";}, position: 'inside'}}},
			                    data : [99.3 , 93.9, 57.2]
			                },
			                {
			                    name:'이탈',
			                    type:'bar',
			                    stack: '总量',
			                    itemStyle : { normal: { color:'#8C8C8C', label : {show: true, 
			                        formatter : function(v){return v.value+"%";}, position: 'right'}}},
			                    data : [0.7 , 6.1, 42.8]
			                },
			            ]
			        };
             myChart.setOption(option);
		 },
		 
		 
		drawChart5 : function(myChart){
	       var option = {
	            title : {
	                text: '신규 고객 유지율',
	                subtext : '(2015.01 ~ 2015.07 평균)'
	            },
	            tooltip : {
	                trigger: 'axis',
	                axisPointer:{
	                    show: true,
	                    type : 'shadow'
	               },
	               formatter:function(p){ 
	                        return "[" + p[0][0] + "]<br/>" +
	                               p[0][1] + " : " + p[0].value + "명";
	                }
	            },
	            legend: {
	                data:['신규 고객 유지율'],
	                y : 50,
	                textStyle:{fontSize : 14}
	            },
	            grid: {
	                y : 100
	            },
	            calculable : true,
	            xAxis : [
	                {
	                    type : 'category',
	                    data : ['M','M+1','M+2','M+3','M+4','M+5','M+6']
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value',
	                    axisLabel:{formatter:function(p) { return p +' %';}}
	                }
	            ],
	            series : [
	                {
	                    name:'신규 고객 유지율',
	                    type:'line',
	                    data:[100, 48.4, 41.6, 37.6, 34.8, 32.1, 31.0],
	                   itemStyle: {
	                     normal: {
	                        lineStyle: {
	                            width : 4.5
	                       },
	                       label:{
	                         show:true,
	                         formatter:function(p){ 
	                           return p.value + '%';
	                         },
	                         textStyle:{
	                           fontSize : 18,
	                           fontWeight : 'bold',
	                           color:'rgba(76,76,76,0.9)'
	                         },
	                       }
	                     }
	                   }
	                }
	            ]
	        };
            myChart.setOption(option);
		}
 };
 
 
 </script>