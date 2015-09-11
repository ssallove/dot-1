<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--modal-->
<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog2">
        <div class="modal_content2 ">
        
            <button type="button" class="close2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">close</span></button>
            <p class="paper_lfBg "></p>
            <p class="paper_rgBg "></p>
            
            <div class="modal_header2">
                <h2>Syrup/OCB 고객 한 눈에 파악해요!<span class="dottxt">Segment별로 살펴보는 고객 특성</span></h2>
                
            </div>
            
            <div class="modal_body2">
                <!--내용1-->
                <div class="news mt10">
                    <h3 style="margin-bottom:20px;">▣ Syrup Segmentation <br/>&nbsp;&nbsp;&nbsp;&nbsp;: 2015.05 data 기준, 고객 4,890,108명 대상 </h3>
                    <!-- <p class="exp" style="font-size:15px"></br> 
                            &nbsp;&nbsp;&nbsp;월 방문일수가 높은 H1, H2, H3 고객은 30 ~ 40대 비중이 높으며, 5개 서비스와 교차 비율이 모두 높은 편입니다</br> 
                            &nbsp;&nbsp;&nbsp;월 방문일수가 4~9일인 A1, A2, A3 고객은 20 ~ 30대 비중이 높으며 T map, T store, Syrup에서의 교차 비율이 높은 편입니다.</br> 
                            &nbsp;&nbsp;&nbsp;카드 탭 이용 비율이 75% 이상인 H3, A3, C3 고객은 여성 비율이 높은 편입니다. </br>
                            &nbsp;&nbsp;&nbsp;여성의 경우 "카드"라는 목적하에 app을 사용하고 있네요. 반면, H1, H2, A1, A2 고객은 소식탭, 쿠폰탭도 함께 이용합니다.</br> 
                                    과연 어느 고객이 진정한 Syrup이 찾는 주요 고객일까요? 더 자세한 정보를 알고 싶으면, 각 segment를 클릭해주세요 ^^  </p> -->
                    <ul class="intxt mt0" style="margin-top:0px;">
                        <li>Syrup의 고객을 한 눈에 파악해요! Segment별 Syrup 고객의 특성</li>
                        <li>&nbsp;&nbsp;&nbsp;월 방문일수가 높은 H1, H2, H3 고객은 30 ~ 40대 비중이 높으며, 5개 서비스와 교차 비율이 모두 높은 편입니다.</li>
                        <li>&nbsp;&nbsp;&nbsp;월 방문일수가 4~9일인 A1, A2, A3 고객은 20 ~ 30대 비중이 높으며 T map, T store, Syrup에서의 교차 비율이 높은 편입니다.</li>
                        <li>&nbsp;&nbsp;&nbsp;카드 탭 이용 비율이 75% 이상인 H3, A3, C3 고객은 여성 비율이 높은 편입니다. </li>
                        <li>&nbsp;&nbsp;&nbsp;여성의 경우 "카드"라는 목적하에 app을 사용하고 있네요. 반면, H1, H2, A1, A2 고객은 소식탭, 쿠폰탭도 함께 이용합니다.</li>
                        <li>과연 어느 고객이 진정한 Syrup이 찾는 주요 고객일까요? 더 자세한 정보를 알고 싶으면, 각 segment를 클릭해주세요 ^^</li>
                    </ul>
                    <div class="layoutLR mt30 mb0">
                        <li class=" floatL boxSty newsCbox" style="width:60%;">
                            <img src="<c:url value="/resources/images/Syrup01.gif"/>" alt="Syrup" width="687" height="549" usemap="#Syrup"/>
                            <ul class="intxt txtL" style="margin-top:14px">
	                            <li>Data 사전 분석을 통해 segmentation에 가장 중요한 변수 2가지를 선택*</li> 
							    <li>&nbsp;&nbsp;&nbsp;1. 월 방문일수 --> 고객별 Syrup의 이용성, loyalty를 알 수 있는 변수 </li>
							    <li>&nbsp;&nbsp;&nbsp;2. 카드 탭 이용 비율 = 카드 탭 이용일수/방문일수 --> 고객의 syrup 이용 목적을 알 수 있는 변수</li> 
								<li></li>
								<li>* Feature selection 및 clustering 기법이 사용되었습니다.</li> 
                            </ul>  
                        </li>
                        <li class=" floatR boxSty newsCbox" style="width:38%" id="insights7_grid_0">
                            <p class="chart" style="height:180px; min-height:180px !important;margin-top: 0px; margin-bottom: 20px;" id="insights7_chart_0"></p>
                            <p class="exp" style="font-size:15px; height:30px; margin-top:0px; margin-bottom:0px;"></p>
                            <table class="listTB2 tStriped2 ">
                                 <colgroup>
                                 </colgroup>
                                 <thead>
                                     <tr class="thDepth">    <!-- longH -->
                                         <th>Rank</th>
                                         <th>1</th>
                                         <th>2</th>
                                         <th>3</th>
                                         <th>4</th>
                                         <th>5</th>
                                     </tr>
                                 </thead>
                                 <tbody></tbody>
                             </table>
                             
                            <p class="chart mt30" style="height:300px; min-height:300px !important;margin-top: 0px; margin-bottom: 0px;" id="insights7_chart_1"></p>
                            <p class="exp" style="font-size:15px; margin-top:0px; margin-bottom:0px;">* 해당 Segment의 전체 대비 상대적인 발급수로 계산 </p>
                        </li>
                    </div>
                </div>
                <!--//내용1-->
                
                
                
                
                <!--내용3-->
                <div class="news mt50">
	                <h3 style="margin-bottom:20px;">▣ OCB Segmentation <br/>&nbsp;&nbsp;&nbsp;&nbsp;: 2015.04 data 기준, 고객 2,244,307명 대상</h3>
	                <ul class="intxt mt0" style="margin-top:0px">
		                <li>OCB의 고객을 한 눈에 파악해요! Segment별 Syrup 고객의 특성</li> 
						    <li>&nbsp;&nbsp;&nbsp;FEED 클릭 비율이 67% 이상인 C1, C2, C3 고객은 여성의 비율이 높고, OCB 온/오프라인 활동성이 높은 편입니다.</li> 
						    <li>&nbsp;&nbsp;&nbsp;FEED 클릭 비율이 20% 미만인 A1, A2, A3 고객은 남성의 비율이 높고 OCB 온/오프라인 활동성도 낮은 편입니다. </li>
						    <li>&nbsp;&nbsp;&nbsp;PUSH로 인한 진입율이 75% 이상인 A1, B1, C1 고객은 30대 비율이 높습니다. </li>
						    <li>&nbsp;&nbsp;&nbsp;PUSH로 인한 진입율이 33% 미만인 A3, B3, C3 고객은 20대 비율이 가장 높습니다.</li>
						    <li>&nbsp;&nbsp;&nbsp;C2 고객은 천원페스티벌 관련 쿠폰을 상대적으로 많이 발급 받았습니다. 역시 알뜰한 40대 여성의 모습, OCB에서도 알 수 있네요!</li>
						    <li>&nbsp;&nbsp;&nbsp;A1, A2, B1, B2 고객은 T map과의 교차 비율이 다소 높습니다. 반면, B1, B2, C1, C2는 OCB, Syrup, 11번가, T store의 교차 비율이 높습니다.</li> 
						<li></li>
						<li>더 자세한 정보를 알고 싶으면, 각 segment를 클릭해주세요 ^^</li> 
                    </ul>
                    <div class="layoutLR mt30 mb0">
                        <li class=" floatL boxSty newsCbox" style="width:60%;">
                            <img src="<c:url value="/resources/images/OCB.gif"/>" alt="OCB" width="687" height="525" usemap="#OCB"/>
                            <ul class="intxt txtL" style="margin-top:14px">
                                <li>Data 사전 분석을 통해 segmentation에 가장 중요한 변수 2가지를 선택*</li> 
                                <li>&nbsp;&nbsp;&nbsp;1. PUSH에 인한 진입율 --> 고객별 유입경로를 알 수 있는 변수  </li>
                                <li>&nbsp;&nbsp;&nbsp;2. FEED 클릭 비율 = FEED 클릭일수/방문일수 --> 고객의 OCB app 이용 목적을 알 수 있는 변수 </li> 
                                <li></li>
                                <li>* Feature selection 및 clustering 기법이 사용되었습니다.</li> 
                            </ul>  
                        </li>
                        <li class=" floatR boxSty newsCbox" style="width:38%" id="insights7_grid_1">
                            <p class="chart" style="height:180px; min-height:180px !important;margin-top: 0px; margin-bottom: 20px;" id="insights7_chart_2"></p>
                            <p class="exp" style="font-size:15px; height:30px; margin-top:0px; margin-bottom:0px;"></p>
                            <table class="listTB2 tStriped2 ">
                                 <colgroup>
                                 </colgroup>
                                 <thead>
                                     <tr class="thDepth">    <!-- longH -->
                                         <th>Rank</th>
                                         <th>1</th>
                                         <th>2</th>
                                         <th>3</th>
                                         <th>4</th>
                                         <th>5</th>
                                     </tr>
                                 </thead>
                                 <tbody></tbody>
                             </table>
                             <p class="chart mt30" style="height:300px; min-height:300px !important;margin-top: 0px; margin-bottom: 0px;" id="insights7_chart_3"></p>
                            <p class="exp" style="font-size:15px; margin-top:0px; margin-bottom:0px;">* 해당 Segment의 전체 대비 상대적인 발급수로 계산 </p>
                        </li>
                    </div>
                </div>
                <!--//내용3-->
                
            </div>
        </div>
     </div>
 </div>
 
 <map name="Syrup">
        <area shape="rect" coords="84,41,237,181" href="javascript:incInsights7.clickSyrupFc('H1', '6');"><!--H1-->
        <area shape="rect" coords="242,41,406,180" href="javascript:incInsights7.clickSyrupFc('H2', '7');"><!--H2-->
        <area shape="rect" coords="411,43,587,180" href="javascript:incInsights7.clickSyrupFc('H3', '8');"><!--H3-->
        
        <area shape="rect" coords="83,185,239,351" href="javascript:incInsights7.clickSyrupFc('A1', '3');"><!--A1-->
        <area shape="rect" coords="242,184,405,351" href="javascript:incInsights7.clickSyrupFc('A2', '4');"><!--A2-->
        <area shape="rect" coords="411,185,584,351" href="javascript:incInsights7.clickSyrupFc('A3', '5');"><!--A3-->
        
        <area shape="rect" coords="84,353,237,517" href="javascript:incInsights7.clickSyrupFc('C1', '0');"><!--Cl-->
        <area shape="rect" coords="243,355,404,518" href="javascript:incInsights7.clickSyrupFc('C2', '1');"><!--C2-->
        <area shape="rect" coords="410,355,581,519" href="javascript:incInsights7.clickSyrupFc('C3', '2');"><!--C3-->
</map>
<map name="OCB">
    <area shape="rect" coords="99,56,254,187" href="javascript:incInsights7.clickOCBFc('A1', '6');"><!--A1-->
    <area shape="rect" coords="94,191,254,339" href="javascript:incInsights7.clickOCBFc('A2', '3');"><!--A2-->
    <area shape="rect" coords="96,346,253,499" href="javascript:incInsights7.clickOCBFc('A3', '0');"><!--A3-->
    
    
    <area shape="rect" coords="257,58,417,186" href="javascript:incInsights7.clickOCBFc('B1', '7');"><!--B1-->
    <area shape="rect" coords="257,191,419,338" href="javascript:incInsights7.clickOCBFc('B2', '4');"><!--B2-->
    <area shape="rect" coords="260,344,415,495" href="javascript:incInsights7.clickOCBFc('B3', '1');"><!--B3-->
    
    <area shape="rect" coords="419,58,581,189" href="javascript:incInsights7.clickOCBFc('C1', '8');"><!--C1-->
    <area shape="rect" coords="423,193,579,342" href="javascript:incInsights7.clickOCBFc('C2', '5');"><!--C2-->
    <area shape="rect" coords="421,347,578,493" href="javascript:incInsights7.clickOCBFc('C3', '2');"><!--C3-->
</map>
 <!--!//modal -->
 
 
 
 
 <script>

 var syrupGridData = { "C1":["천원의 행복(불고기브라더스)", "블랙야크", "GS25", "커스텀멜로우", "원더풀레이스"]
                     , "C2":["커스텀멜로우", "블랙야크", "원더플레이스", "솔가", "봉구스밥버거"]
					 , "C3":["커스텀멜로우", "현대리파트", "원더플레이스", "블랙야크", "카카오프렌즈</br>젤펜교환권"]
					 , "A1":["텐바이텐", "어린이 난타", "슈퍼커피", "대학로난타", "뮤지컬 파리넬리"]
					 , "A2":["원마운트", "워커힐면세점", "요거프레소", "외환은행", "원더플레이스"]
					 , "A3":["CGV 영화", "신세계닷컴", "교보문고", "공차", "동화면세점"]
					 , "H1":["블루캐니언", "디큐브시티", "라파스티", "명동", "coffee1896"]
					 , "H2":["투썸플레이스", "현대아울렛", "무스쿠스", "홈플러스 콩비지", "샤보텐"]
					 , "H3":["현대백화점</br>베이커리", "롯데카드</br>해외항공 할인쿠폰", "홈플러스</br>페브리즈", "현대아울렛", "하나투어</br>환율우대"]};

 var syrupGenderData = [ [190138,111974,230193,61615,89109,75648,24915,67753,138425],
                    [192355,111204,216020,85422,124785,100789,33456,97335,204518 ],
                    [7408,5073,55883,335,1819,6642,433,304,10756] ];
 var syrupAgeData = [ [46046,251742,320640,205066,106643,37813,339343],
                 [8077,91571,112057,59970,21098,6013,42684],
                 [13708,162170,178821,94519,35402,10901,80351],
                 [7432,109089,181296,100131,33606,10466,52462],
                 [6660,124348,164735,95301,25932,5762,16909],
                 [5679,132729,163408,89002,23879,5345,14120],
                 [3632,117999,249880,139017,35147,9788,32628],
                 [3709,117513,192427,129543,27878,4770,6001],
                 [1662,60997,87287,57294,13849,2671,3490]];
 var syrupAllAge = [96605,1168158,1650551,969843,323434,93529,587988];
 var syrupNomalizaton = [ 389901,228251,502096,147372,215713,183079,58804,165392,353699,2244307];


 var ocbGenderData = [[429959,116471,179730,198308,148098,119276,259154,146876,55422],
                    [537929,182310,315782,243710,274639,300766,296306,328962,168337],
                    [339405,42689,80360,52464,16910,14120,32631,6003,3491]];

 var ocbAgeData = [  [1872,57903,166410,107541,38074,10692,7409 ],
                  [818,34434,92724,66038,23091,6073,5073 ],
                  [3826,94301,190258,110478,36326,11019,55888 ],
                  [343,23372,67054,42480,11157,2631,335 ],
                  [1022,37315,89485,63664,17896,4510,1821 ],
                  [1471,37057,71008,47973,14764,4162,6644 ],
                  [478,10969,25034,16239,4536,1115,433 ],
                  [892,25842,70042,51859,13522,2931,304 ],
                  [4925,68985,134242,94400,31385,9001,10761 ]
               ];

 var ocbGridData = {"A1" :["엔제리너스", "롯데리아", "나뚜루", "오렌지팩토리", "크리스피크림"]
                     , "A2" : ["롯데리아", "엔제리너스", "나뚜루", "크리스피크림", "오렌지팩토리"]
					 , "A3" : ["롯데리아", "엔제리너스", "11번가", "G마켓", "크리스피크림"]
					 , "B1" : ["엔제리너스", "롯데리아", "오렌지팩토리", "TGIF", "버거킹"]
					 , "B2" : ["롯데리아", "버거킹", "엔제리너스", "오렌지팩토리", "TGIF"]
					 , "B3" : ["버거킹", "롯데리아", "배달의 민족", "엔제리너스", "요기요"]
					 , "C1" : ["롯데리아", "엔제리너스", "크리스피크림", "버거킹", "카라이프"]
					 , "C2" : ["천페(옥션)", "천페(11번가)", "불고기브라더스", "천페(입큰)", "롯데닷컴"]
					 , "C3" : ["롯데닷컴", "롯데월드", "불고기브라더스", "63빌딩", "CGV"]};
 var ocbAllAge = [ 15647,390178,906257,600672,190751,52134,88668 ];
 var ocbNomalizaton = [1307293,341470,575872,494482,439647,434162,588091,481841,227250,4890108];
 
 var pieTitle = " 전체 성별분포";
 var pieSub = " 대비 전체 성별분포";
 var lineTitle = " 전체 연령대 비교";
 var lineSub = " 대비 전체 연령대 비교";

 var maleStyle = {normal:{color:GV_GENDER_COLOR.male(0.95), label : {
     textStyle: {
         color:GV_GENDER_COLOR.male(0.95)
     }   
 }}};
 var femaleStyle = {normal:{color:GV_GENDER_COLOR.female(0.95), label : {
     textStyle: {
         color:GV_GENDER_COLOR.female(0.95)
     }   
 }}};
 var etcStyle = {normal:{color:GV_GENDER_COLOR.unknown(0.95), label : {
     textStyle: {
         color:GV_GENDER_COLOR.unknown(0.95)
     }   
 }}};

 var myChartSpie;
 var myChartSLine;
 var myChartOpie;
 var myChartOLine;
 
 var incInsights7 = {
		 showInsight : function(){
			 myChartSpie = echarts.init($('#insights7_chart_0')[0], GV_CHART_THEME);
			 myChartSLine = echarts.init($('#insights7_chart_1')[0], GV_CHART_THEME);
			 myChartOpie = echarts.init($('#insights7_chart_2')[0], GV_CHART_THEME);
			 myChartOLine = echarts.init($('#insights7_chart_3')[0], GV_CHART_THEME);
			 
			 this.clickSyrupFc('H1', '6');
             this.clickOCBFc('A1', '6');
			 resizeChartOnWinResizeHandler.on([myChartSpie, myChartSLine, myChartOpie, myChartOLine]);
		 },
	     
		 
		 clickSyrupFc : function(id, idx){
			 $("#insights7_grid_0 .exp:eq(0)").text(id+" segment 고객이 가장 많이 발급한 상위 5개 쿠폰*");
			 $("#insights7_grid_0 tbody").empty();
			 
			 var rankList = syrupGridData[id];
			 var tbody= $('#insights7_grid_0 tbody');    var tRow = $('<tr></tr>');
             for(var i = 0, len = rankList.length ; i < len ; i++){
                 if(i == 0){
                	 tRow.append($('<td class="depth2 txtC" >쿠폰</td>'));
                 }
                 tRow.append($('<td>'+ rankList[i] +'</td>'));
             }
             tbody.append(tRow);
             
			 var pieOpt = this.getDefPieOpt();
			 pieOpt.title.text = "[ " + id + " ] " + pieTitle;
             pieOpt.title.subtext = id + pieSub;
             pieOpt.series[1].name = id;
             pieOpt.series[1].data = [{name : '남자('+id+')', itemStyle:maleStyle,
                                         value : syrupGenderData[0][idx]}, 
                                        {name : '여자('+id+')', itemStyle:femaleStyle,
                                         value : syrupGenderData[1][idx]}, 
                                        {name : '기타('+id+')', itemStyle:etcStyle,
                                         value : syrupGenderData[2][idx]}];
              myChartSpie.setOption(pieOpt);
              myChartSpie.refresh();
              
              var lineOpt = this.getDefLineOpt();
              lineOpt.title.text = "[ " + id + " ] " + lineTitle;
              lineOpt.title.subtext = id + lineSub;
              lineOpt.legend.data[1] = id;
              lineOpt.series[0].name = id;
              lineOpt.series[0].data = cvtdata();
              lineOpt.tooltip.formatter = function(d){
                  return ("[" + d[0][1] + "]<br/>" +
                          d[0][0] + " : " + syrupAllAge[d[0].dataIndex] + " (" + d[0][2] + "%)<br/>" +
                          d[1][0] + " : " + syrupAgeData[idx][d[0].dataIndex] + " (" + d[1][2] + "%)");
              };
              
              function cvtdata(){
                  var list = [];
                  for(var j = 0; j < syrupAgeData[idx].length; j++){
                      list.push(Math.round( syrupAgeData[idx][j]/ 
                          syrupNomalizaton[idx]*100 ) );
                  }
                  return list;
              }
              myChartSLine.setOption(lineOpt);
              myChartSLine.refresh();
		 },

         
         clickOCBFc : function(id, idx){
        	 $("#insights7_grid_1 .exp:eq(0)").text(id+" segment 고객이 가장 많이 발급한 상위 5개 쿠폰*");
             $("#insights7_grid_1 tbody").empty();
             
             var rankList = ocbGridData[id];
             var tbody= $('#insights7_grid_1 tbody');    var tRow = $('<tr></tr>');
             for(var i = 0, len = rankList.length ; i < len ; i++){
                 if(i == 0){
                     tRow.append($('<td class="depth2 txtC" >쿠폰</td>'));
                 }
                 tRow.append($('<td>'+ rankList[i] +'</td>'));
             }
             tbody.append(tRow);
             
             var pieOpt = this.getDefPieOpt();
             pieOpt.title.text = "[ " + id + " ] " + pieTitle;
             pieOpt.title.subtext = id + pieSub;
             pieOpt.series[1].name = id;
             pieOpt.series[1].data = [{name : '남자('+id+')', itemStyle:maleStyle,
                                         value : ocbGenderData[0][idx]}, 
                                        {name : '여자('+id+')', itemStyle:femaleStyle,
                                         value : ocbGenderData[1][idx]}, 
                                        {name : '기타('+id+')', itemStyle:etcStyle,
                                         value : ocbGenderData[2][idx]}];
              myChartOpie.setOption(pieOpt);
              myChartOpie.refresh();
              
              var lineOpt = this.getDefLineOpt();
              lineOpt.title.text = "[ " + id + " ] " + lineTitle;
              lineOpt.title.subtext = id + lineSub;
              lineOpt.legend.data[1] = id;
              lineOpt.series[0].name = id;
              lineOpt.series[0].data = cvtdata();
              lineOpt.tooltip.formatter = function(d){
                  return ("[" + d[0][1] + "]<br/>" +
                          d[0][0] + " : " + ocbAllAge[d[0].dataIndex] + " (" + d[0][2] + "%)<br/>" +
                          d[1][0] + " : " + ocbAgeData[idx][d[0].dataIndex] + " (" + d[1][2] + "%)");
              };
              
              function cvtdata(){
                  var list = [];
                  for(var j = 0; j < ocbAgeData[idx].length; j++){
                      list.push(Math.round( ocbAgeData[idx][j]/ 
                          ocbNomalizaton[idx]*100 ) );
                  }
                  return list;
              }
              myChartOLine.setOption(lineOpt);
              myChartOLine.refresh();
         },
         
		 getDefPieOpt : function(){
			 var option = {
				        title:{
				            text: '',
				            subtext : ''
				        },
				        tooltip : {
				            trigger: 'item',
				            formatter: "[ {a} ] <br/>{b} : {c} ({d}%)"
				        },
				        legend: {
				            orient : 'vertical',
				            x : 'left',
				            data:['']
				        },
				        series : [
				            {
				                name:'전체',
				                type:'pie',
				                selectedMode: 'single',
				                radius : [0, 40],
				                center : ['50%', '60%'],
				                /* itemStyle : {
				                    normal : {
				                        label : {
				                            position : 'inner'
				                        },
				                        labelLine : {
				                            show : false
				                        }
				                    },
				                    emphasis: {
				                        label : {
				                            show: true
				                        }
				                    }
				                }, */
				                //funnelAlign: 'right',
				               /*  itemStyle : {
				                    normal : {
				                        label : {
				                            textStyle: {
				                                color:'#000000',
				                                fontSize : 14,
				                                fontWeight : 'bold'
				                            }   
				                        },
				                        labelLine : {
				                            length : 1
				                        }
				                        
				                    }
				                }, */
				                data:[ 

				                    {value:1653294, name:'남자 (전체)', itemStyle:maleStyle},
				                    {value:2648741, name:'여자 (전체)', itemStyle:femaleStyle},
				                    {value:588073, name:'기타 (전체)', itemStyle:etcStyle}
				                ]
				            },
				            {
				                name:'nope',
				                type:'pie',
				                radius : [50, 70],
				                center : ['50%', '60%'],
				                /* itemStyle : {
				                    normal : {
				                        label : {
				                            position : 'inner',
				                            textStyle: {
				                                fontSize : 14,
				                                fontWeight : 'bold'
				                            }   
				                        },
				                        labelLine : {
				                            show : false
				                        },
				                    }
				                }, */
				                data:[]
				            }
				        ]
				    };
			 return option;
		 },
		 
		 getDefLineOpt : function(){
			 var option = {
			            title:{
			                fontSize : 18,
			                text: '',
			                subtext : ''
			            },
			            legend : {
			                y :30,
			                data:['전체','해당']
			            },
			            tooltip : {
			                trigger : 'axis',
			                axisPointer : {            
			                    type : 'shadow'   
			                }
			            },
			            xAxis : [
			                {
			                    type : 'category',
			                    data : ['0-19세','20-29세','30-39세','0-49세','50-59세','60-99세','미상'],
			                     axisLabel : {
			                        textStyle:{
			                            fontWight : 'bold',
			                            color : '#000000',
			                            fontSize : 14
			                        }
			                    }
			                }
			            ],
			            yAxis : [
			                {
			                    type : 'value',
			                    axisLabel : {
			                        formatter: function(p){ 
			                            return p + "%";
			                        }
			                    }
			                }
			            ], 
			            series :[   
			                        {
			                            name:'해당',
			                            type : 'line',
			                            data : [0],
			                            symbolSize : 5,
			                            itemStyle: {
			                                normal: {
			                                    color : "#F15F5F",
			                                    lineStyle: {
			                                        width : 5
			                                    }
			                                }
			                            }
			                        },
			                        {
			                            name:'전체',
			                            type : 'line',
			                            data : function(){
			                                var list = [];
			                                for(var i = 0; i < syrupAllAge.length; i++){
			                                    list.push(Math.round(syrupAllAge[i]/ 
			                                        syrupNomalizaton[syrupNomalizaton.length-1]*100) );
			                                }
			                                return list;
			                            }(),
			                            symbolSize : 0,
			                            itemStyle: {
			                                normal: {
			                                    color : "#BCE55C",
			                                    lineStyle: {
			                                        width : 4
			                                    }
			                                }
			                            }
			                        },
			                        
			                    ]

			        };
			 return option;
		 }
		 
		 
		 
 };
 
 
 </script>