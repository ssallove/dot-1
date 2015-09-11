<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/directive.jsp"%>

<tiles:insertDefinition name="header.layout">

	<tiles:putAttribute name="content">
  	      	
        <!-- main-container -->
        <section >
            <!-- chart slider-->
            <div class="mainBox_bg">
                <div class="container txtC" >
                
                   <div id="showcase" class="showcase mt50">
                        <!--1 Syrup pay 분석-->
                        <div class="showcase-slide">
                            <div class="showcase-content">
                                <p class="main_insight_bg1">Syrup pay 분석</p>
                                <a href="<c:url value="/insights/insights.do?show=0"/>" class="overlay small">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                            <div class="showcase-thumbnail" ><a class="right tip" href="#" title="<ul><li>Syrup pay 분석</li></ul>"><p class="main_insight_sm1" >Syrup pay 분석</p></a></div>
                        </div>
                        <!--2 동상이몽--> 
                        <div class="showcase-slide">
                            <div class="showcase-content">
                                <p class="main_insight_bg3">동상이몽</p>
                                <a href="<c:url value="/insights/insights.do?show=1"/>" class="overlay small">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                             <div class="showcase-thumbnail"><a class="right tip" href="#" title="<ul><li>남과 여.. 同床異夢</li></ul>"><p class="main_insight_sm3">동상이몽</p></a></div>
                        </div>
                       <!--3 서비스별 인기 검색어 top 10--> 
                        <div class="showcase-slide">
                            <div class="showcase-content">
                                <p class="main_insight_bg4">검색어로 보는 남녀 탐구생활</p>
                                <a href="<c:url value="/insights/insights.do?show=3"/>" class="overlay small">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                            <div class="showcase-thumbnail"><a class="right tip" href="#" title="<ul><li>검색어로 보는 남녀 탐구생활</li></ul>"><p class="main_insight_sm4">검색어로 보는 남녀 탐구생활</p></a></div>
                        </div>


                       <!--4 Dig Out Treasure-->
                       <div class="showcase-slide">
                           <div class="showcase-content">
                               <p class="main_insight_bg5">Dig Out Treasure</p>
                           </div>
                           <div class="showcase-thumbnail"><a class="right tip" href="#" title="<ul><li>Dig Out Treasure</li></ul>"><p class="main_insight_sm5">Dig Out Treasure</p></a></div>
                       </div>

                    </div>
                    
                </div>
            </div>
            <!-- //chart slider-->
            
            <!--carousel slider-->
            <div class="mainPers_bg widthPers">
                <div class="container" >
                    <div id="carousel-example-generic" data-ride="carousel" class="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators" >
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="6"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="7"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="8"></li>
                        </ol>
        
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <!--Manager1-->
                            <div class="item personBox active">
                                <p class="photo manager1"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"전사 마케팅 DB 구축하고 상용 제공하였음에도 어떤 데이터가 있는지,<br>
                                            마케팅적으로 어떤 가치가 있는지 전달하기 어려워 시작한 프로젝트입니다. <br>
                                            우리가 갖고 있는 데이터의 가치가 모두에게 전달되고 <br>
                                            마케팅에 활용되어 성과까지 얻게되는 그날을 꿈꾸며..." </strong>
                                    <p class="name">김수진 (팀장)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager1-->
                            <!--Manager2-->
                             <div class="item personBox">
                                <p class="photo manager2"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"Beautiful things don't ask for attention" <span class="writer">- The Secret Life of Walter Mitty (Movie, 2013)</span></strong>
                                    <p class="name">김미경 (Manager)<span>Data Analyst</span></p>
                                </div>
                            </div>
                            <!--//Manager2-->
                            <!--Manager3-->
                             <div class="item personBox">
                                <p class="photo manager3"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"Marketer와의 소통의 통로가 되고자.."</strong>
                                    <p class="name">김승현 (Manager)<span>Data Engineer</span></p>
                                </div>
                            </div>
                            <!--//Manager3-->
                            <!--Manager4-->
                             <div class="item personBox">
                                <p class="photo manager4"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"Data 기반 Insight를 통한 Action으로! 실행의 중심이 되는 Data"</strong>
                                    <p class="name">김태희 (Manager)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager4-->
                            <!--Manager5-->
                             <div class="item personBox">
                                <p class="photo manager5"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>“Data that is loved tends to survive.”<span class="writer">– Kurt Bollacker, Data Scientist, Freebase/Infochimps</span></strong>
                                    <p class="name">박현경 (Manager)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager5-->
                             <!--Manager6-->
                             <div class="item personBox">
                                <p class="photo manager6"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"Data really powers everything that we do." <span class="writer">– Jeff Weiner, chief executive of LinkedIn.</span></strong>
                                    <p class="name">안미영 (Manager)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager6-->
                             <!--Manager7-->
                             <div class="item personBox">
                                <p class="photo manager7"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>“For every two degrees the temperature goes up, check-ins at ice cream shops go up by 2%.” <span class="writer">- Andrew Hogue, Foursquare</span> </strong>
                                    <p class="name">이봉기 (Manager)<span>Data Analyst</span></p>
                                </div>
                            </div>
                            <!--//Manager7-->
                            <!--Manager8-->
                             <div class="item personBox">
                                <p class="photo manager8"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"빅 데이터는 단순히 많은 데이터를 모으는 것이 아니라 다양한 데이터를 의미 있게 연결하는 것이다." <span class="writer">- 수다 램 애리조나주립대 교수</span></strong>
                                    <p class="name">이우민 (Manager)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager8-->
                            <!--Manager9-->
                             <div class="item personBox">
                                <p class="photo manager9"></p>
                                <div class="mgBox">
                                    <p class="triangle"></p>
                                    <strong>"Vague Goals Seed Big Data Failures" <span class="writer">- InformationWeek, Doug Henschen</span><br>
                                            "Big data insight without action is wasted effort" <span class="writer">- Duncan Ross</span></strong>
                                    <p class="name">한정 (Manager)<span>Data Scientist</span></p>
                                </div>
                            </div>
                            <!--//Manager9-->
                            
                        </div>
        
                        <!-- Controls button-->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span aria-hidden="true"><img src="<c:url value="/resources/images/btn_prev.png"/>" alt="Previous"/></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span aria-hidden="true"><img src="<c:url value="/resources/images/btn_next.png"/>"  alt="Next"/></span>
                        </a>
                    </div>
                </div>
            </div>
            <!--//carousel slider -->

        </section>
        <!--// main-container-->
	</tiles:putAttribute>
	<tiles:putAttribute name="javascript.footer">
	   <script type="text/javascript" src="<c:url value="/resources/js/jquery.aw-showcase.js"/>"></script>
	   <script type="text/javascript" src="<c:url value="/resources/js/unitip.js"/>"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
