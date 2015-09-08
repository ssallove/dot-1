<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp"
%><tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="stylesheet">
    
    <style type="text/css">
    table.listTB  th{background-repeat: repeat-x};
    </style>
    
    </tiles:putAttribute>

    <tiles:putAttribute name="content">

<!-- 
    /*
,{"name":"그날엔 우리", "title":"그날에 우리"
    , "subtitle":"우리 회사 서비스는 그날이 되면 어떻게 이용될까요? (Tmap 이동, 11번가 구매, OCB  적립)"
    , "iframeSrc":"http://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1LhJyYLwoLeRpUhSVZQnEc1mt0c07jxnBv_mDUI2-2Hw&font=Default&lang=en&start_at_end=true&initial_zoom=3&height=410"
    , "toptitle":"Tmap 사용자들은 그날 어디에 많이가고,<br/>11번가 고객은 그날을 앞두고 무엇을 많이 구매할까요?<br/>또 OCB 적립의 경우 그날엔 어떤 적립이 많을까요?"
  }
  */
   -->
   
        <!-- main-container -->
        <section >
            <p class="Insights2"><img src="<c:url value="/resources/images/Insights2_img.jpg"/>"  title="상단 이미지"/></p>
            <div class="container mb100">
                <h1>그날에 우리</h1>
                <div class="theDay mt50">
                    <div class="headLy">
                        <h3 class="title">우리 회사 서비스는 그날이 되면 어떻게 이용될까요? (T map 이동, 11번가 구매, OCB 적립)</h3>
                        <h4 class="exp">Tmap 사용자들은 그날 어디에 많이가고, 11번가 고객은 그날을 앞두고 무엇을 많이 구매할까요?<br>
                            또 OCB 적립의 경우 그날엔 어떤 적립이 많을까요?</h4>
                        <p class="img"></p>
                    </div>
                    <p class="iframeLy">
                        <iframe id='todayUsSrc' name='' src='http://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1LhJyYLwoLeRpUhSVZQnEc1mt0c07jxnBv_mDUI2-2Hw&font=Default&lang=en&start_at_end=true&initial_zoom=3&height=650'scrolling='auto' frameborder='0' allowtransparency='true' style="width:100%;height:650px"></iframe>
                    </p>
                </div>
                
             </div>
        </section>
        <!--// main-container-->
        
    
    </tiles:putAttribute>

</tiles:insertDefinition>



