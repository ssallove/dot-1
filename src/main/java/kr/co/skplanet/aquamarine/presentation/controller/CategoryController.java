package kr.co.skplanet.aquamarine.presentation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.skplanet.aquamarine.model.CateVO;
import kr.co.skplanet.aquamarine.model.CommCodeVO;
import kr.co.skplanet.aquamarine.service.CateService;
import kr.co.skplanet.aquamarine.service.CommCodeService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/category")
public class CategoryController {
    private static final Logger LOG = LoggerFactory.getLogger(CategoryController.class);
    
    @Autowired
    private CateService cateSvc; // 업종
    
    @Autowired
    private CommCodeService commCodeSvc; 


    /**
     * 업종 - 업종별 현황을 조회
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/categoryBusy")
    public String categoryBusy(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	
    	Map<String, String> paramMap = getRequestMap(request, model, new String[]{"periodClCd", "cnctCtgCd", "largeCd", "midCd"});
    	if("-".equals(paramMap.get("cnctCtgCd"))){
    		paramMap.put("cnctCtgCd", "");
    	}
    	searchCategoryList(paramMap, model);
    	
    	List<String> voListXLine = cateSvc.selectBusyBubbleXLine(paramMap);
    	List<CateVO> voBubbleList = cateSvc.selectBusyBubbleChartData(paramMap);
    	JSONArray jsonArray = new JSONArray();
    	model.addAttribute("jsonCategorylist", jsonArray.fromObject(voListXLine));
    	model.addAttribute("jsonBubbleChartList", jsonArray.fromObject(voBubbleList));
    	
    	//Root Category 조회(_selectBusyBubbleXLine) &&  voListXLineView로 조회된 Category만 조회 시
    	//List<String> voListXLineView = cateSvc.selectBusyBubbleXLineView(paramMap);
    	//model.addAttribute("jsonCategoryViewlist", jsonArray.fromObject(voListXLineView));
    	
    	// 기준일자
    	String baseDt = "";
    	try{    	baseDt = voBubbleList.get(0).getBaseDt();	}catch(Exception e){}
    	model.addAttribute("baseDt", baseDt);
        return "category/categoryBusy";
    }

    
    /**
     * 업종 - 서비스별 모수 현황을 조회
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/categoryMosu")
    public String categoryMosu(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	//getCateData (request, response, model);

    	Map paramMap = getRequestMap(request, model, new String[]{"svcUnionCd", "periodClCd", "cnctCtgCd", "svcUnionCdNm"
    			, "largeCd", "midCd", "smallCd", "largeTx", "midTx", "smallTx", "periodTx"});
    	searchCategoryList(paramMap, model);
    	
    	// 기준일자 조회
    	List<CateVO> voList = cateSvc.selectCateServiceMosuReportList(paramMap);
    	String baseDt = "";
    	try{    	baseDt = voList.get(0).getBaseDt();	}catch(Exception e){}
    	
    	model.addAttribute("mosulist", voList);
    	model.addAttribute("baseDt", baseDt);
    	
    	JSONArray jsonArray = new JSONArray();
    	model.addAttribute("jsonMosuList", jsonArray.fromObject(voList));
    	return "category/categoryMosu";
    	
    }
    
    
    /**
     * 업종 - 서비스별 데모 현황을 조회
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value={"/categoryDemo", "/categoryTest"})
    public String categoryDemo(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	
    	Map<String, String> paramMap = getRequestMap(request, model, new String[]{"svcUnionCd", "svcUnionCdNm", "periodClCd", "cnctCtgCd"
    																, "largeCd", "midCd", "smallCd"});
    	// Default Value
    	if(paramMap.get("largeCd") == null || paramMap.get("largeCd").equals("")){	
    		paramMap.put("largeCd", "GRP10");	
    		paramMap.put("midCd", "GRP1001");
    		paramMap.put("cnctCtgCd", "GRP1001");
    		model.addAllAttributes(paramMap);
    	}
    	
    	searchCategoryList(paramMap, model);
    	
    	List<CateVO> voList2 = cateSvc.selectCateSexAgeList1(paramMap);
    	List<CateVO> voList3 = cateSvc.selectCateSexAgeList2(paramMap);
    	List<CateVO> voList4 = cateSvc.selectCateSexList(paramMap);
    	List<CateVO> voList5 = cateSvc.selectCateMainActiveAreaList(paramMap);
    	List<CateVO> voList6 = voList3;
    	if(!"-".equals(paramMap.get("cnctCtgCd"))){
    		paramMap.put("cnctCtgCd", "-");
    		voList6 = cateSvc.selectCateSexAgeList2(paramMap);
    	}
    	
    	String baseDt = "";
    	try{    	baseDt = voList6.get(0).getBaseDt();	}catch(Exception e){}
    	model.addAttribute("baseDt", baseDt);
    	
    	model.addAttribute("rankingList", voList5);	/* 순위 */

    	model.addAttribute("sexChartList", voList4);	/* 성별 현황 (전체, 카테고리별) */
    	model.addAttribute("ageChartList", voList2);	/* 연령대별 현황 (전체) */
    	model.addAttribute("sexAgeChartList", voList3);	/* 성연령대별 현황 (카테고리별) */
    	model.addAttribute("sexAgeAllChartList", voList6); /* 성연령대별 현황 (전체) */
    	
    	JSONArray jsonArray = new JSONArray();
    	model.addAttribute("jsonSexChartList", jsonArray.fromObject(voList4));
    	model.addAttribute("jsonAgeChartList", jsonArray.fromObject(voList2));
    	model.addAttribute("jsonSexAgeChartList", jsonArray.fromObject(voList3));
    	model.addAttribute("jsonSexAgeAllChartList", jsonArray.fromObject(voList6));
    	
    	if(request.getRequestURI().indexOf("Test") > 0) return "test/categoryTest";
    	return "category/categoryDemo";
    }
   
   
    /**
     * 요청 파라미터를 Map으로 생성
     * @param request
     * @param model
     * @param paramNames
     * @return
     * @throws Exception
     */
    private Map<String, String> getRequestMap(HttpServletRequest request, Model model, String[] paramNames) throws Exception {
    	HttpSession session = request.getSession();
    	Map<String, String> paramMap = new HashMap<String, String>();
    	for(String paramNm:paramNames){
    		String paramVal = StringUtils.defaultIfEmpty(request.getParameter(paramNm), "");
    		if(paramNm.equals("periodClCd") && StringUtils.isBlank(paramVal)){    			paramVal = "3M";    		}
    		if(paramNm.equals("svcCd") && StringUtils.isBlank(paramVal)){    		paramVal = "TOT";    			}
    		if(paramNm.equals("svcUnionCdNm") && StringUtils.isBlank(paramVal)){    		paramVal = "2";    			}
    		if(paramNm.equals("cnctCtgCd") && StringUtils.isBlank(paramVal)){    		paramVal = "-";    			}
    		if(paramNm.equals("svcUnionCd") && StringUtils.isBlank(paramVal)){    		paramVal = "31";    			}
    		
        	session.setAttribute(paramNm, paramVal);
        	paramMap.put(paramNm, paramVal);
    	}
    	model.addAllAttributes(paramMap);
    	return paramMap;
    }
    
    /**
     * 분류 Category 목록을 조회
     * @param paramMap
     * @param model
     * @throws Exception
     */
    private void searchCategoryList(Map<String, String> paramMap, Model model) throws Exception{
    	List<CommCodeVO> cateList1 = commCodeSvc.selectCategoryL();
    	model.addAttribute("cateList1", cateList1);

    	Map<String, Object> pComboParam = new HashMap<String, Object>();
    	pComboParam.put("comCd", paramMap.get("largeCd"));
    	List<CommCodeVO> cateList2 = commCodeSvc.selectCategoryM(pComboParam);
    	model.addAttribute("cateList2", cateList2);
    	
    	if(paramMap.get("midCd") != null && StringUtils.isNotBlank(paramMap.get("midCd"))){
    		pComboParam.put("comCd", paramMap.get("midCd"));
    		List<CommCodeVO> cateList3 = commCodeSvc.selectCategoryS(pComboParam);
    		model.addAttribute("cateList3", cateList3);
    	}
    	
    	if(paramMap.get("svcUnionCd") != null){
    		CommCodeVO commCodeVO = commCodeSvc.selectSearchOption(paramMap);	// svcUnionCd
       		if(commCodeVO != null)	model.addAttribute("svcUnionNm", commCodeVO.getSvcUnionNm());
    	}
    }

    
    /*
    
	private void getCateData (HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
    	
		String svcUnionCd = StringUtils.defaultIfEmpty(request.getParameter("svcUnionCd"), StringUtils.EMPTY);
    	String periodClCd = StringUtils.defaultIfEmpty(request.getParameter("periodClCd"), "3M");
    	String cnctCtgCd = StringUtils.defaultIfEmpty(request.getParameter("cnctCtgCd"), StringUtils.EMPTY);
    	String svcUnionCdNm = StringUtils.defaultIfEmpty(request.getParameter("svcUnionCdNm"), "2");
    	String largeCd = StringUtils.defaultIfEmpty(request.getParameter("largeCd"), "");
    	String midCd = StringUtils.defaultIfEmpty(request.getParameter("midCd"), "");
    	String smallCd = StringUtils.defaultIfEmpty(request.getParameter("smallCd"), "");
    	String largeTx = StringUtils.defaultIfEmpty(request.getParameter("largeTx"), "");
    	String midTx = StringUtils.defaultIfEmpty(request.getParameter("midTx"), "");
    	String smallTx = StringUtils.defaultIfEmpty(request.getParameter("smallTx"), "");
    	String periodTx = StringUtils.defaultIfEmpty(request.getParameter("periodTx"), "");

    	HttpSession session = request.getSession();
    	
    	if ( "".equals(svcUnionCd) 
    			&& "3M".equals(periodClCd) 
    			&& "".equals(cnctCtgCd) 
    			&& "2".equals(svcUnionCdNm) 
    			&& "".equals(largeCd)
    			&& "".equals(midCd) 
    			&& "".equals(smallCd) 
    			&& "".equals(largeTx) 
    			&& "".equals(midTx) 
    			&& "".equals(smallTx) 
    			&& "".equals(periodTx) ) {
    		
    		svcUnionCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("svcUnionCd"), StringUtils.EMPTY );
    		periodClCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("periodClCd"), "3M" );
    		cnctCtgCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("cnctCtgCd"), StringUtils.EMPTY );
    		svcUnionCdNm = StringUtils.defaultIfEmpty( (String)session.getAttribute("svcUnionCdNm"), "2" );
    		largeCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("largeCd"), StringUtils.EMPTY );
    		midCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("midCd"), StringUtils.EMPTY );
    		smallCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("smallCd"), StringUtils.EMPTY );
    		largeTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("largeTx"), StringUtils.EMPTY );
    		midTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("midTx"), StringUtils.EMPTY );
    		smallTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("smallTx"), StringUtils.EMPTY );
    		periodTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("periodTx"), StringUtils.EMPTY );
    		
    	}

    	session.setAttribute("svcUnionCd", svcUnionCd);
    	session.setAttribute("periodClCd", periodClCd);
    	session.setAttribute("cnctCtgCd", cnctCtgCd);
    	session.setAttribute("svcUnionCdNm", svcUnionCdNm);
    	session.setAttribute("largeCd", largeCd);
    	session.setAttribute("midCd", midCd);
    	session.setAttribute("smallCd", smallCd);
    	session.setAttribute("largeTx", largeTx);
    	session.setAttribute("midTx", midTx);
    	session.setAttribute("smallTx", smallTx);
    	session.setAttribute("periodTx", periodTx);
    	
    	Map<String, Object> pComboParam = new HashMap<String, Object>();
    	pComboParam.put("comCd", largeCd);
    	List<CommCodeVO> cateList1 = commCodeSvc.selectCategoryL(pComboParam);
    	
    	pComboParam = new HashMap<String, Object>();
    	pComboParam.put("comCd", largeCd);
    	List<CommCodeVO> cateList2 = commCodeSvc.selectCategoryM(pComboParam);
    	
    	pComboParam = new HashMap<String, Object>();
    	pComboParam.put("comCd", midCd);
    	List<CommCodeVO> cateList3 = commCodeSvc.selectCategoryS(pComboParam);
    	
    	Map<String, String> pMap = new HashMap<String, String>();
    	pMap.put("svcUnionCd", svcUnionCd); // 서비스
    	pMap.put("periodClCd", periodClCd); // 기간
    	pMap.put("cnctCtgCd", cnctCtgCd); // 업종
    	List<Map<String, Object>> listCate = cateSvc.getCateList(pMap);
    	
    	List<CateVO> voList = new ArrayList<CateVO>();
    	List<CateVO> voList2 = new ArrayList<CateVO>();
    	List<CateVO> voList3 = new ArrayList<CateVO>();
    	List<CateVO> voList4 = new ArrayList<CateVO>();
    	List<CateVO> voList5 = new ArrayList<CateVO>();
    	List<CateVO> voList6 = new ArrayList<CateVO>();
    	
    	
    	for (Map<String, Object> m : listCate) {

    		voList = (List<CateVO>) m.get("selectCateServiceMosuReportList");
    		voList2 = (List<CateVO>) m.get("selectCateSexAgeList1");
    		voList3 = (List<CateVO>) m.get("selectCateSexAgeList2");
    		voList4 = (List<CateVO>) m.get("selectCateSexList");
    		voList5 = (List<CateVO>) m.get("selectCateMainActiveAreaList");
    		voList6 = (List<CateVO>) m.get("selectCateSexAgeListAll");
    		
    	}
    	
    	// 기준일자
    	String baseDt = "";
    	try{    	baseDt = voList.get(0).getBaseDt();	}catch(Exception e){}
    	
    	List<Map<String, String>> ageLineList1 = new ArrayList<Map<String, String>>();
    	List<Map<String, String>> ageLineList2 = new ArrayList<Map<String, String>>();
    	Map<String, String> m = new HashMap<String, String>();

    	String ageListTitle1  = "";
    	String ageListTitle2  = "";
    	String ageListTitle3  = "";
    	String ageListTitle4 = "";
    	String ageListTitle5 = "";
    	String ageListTitle6 = "";
    	
    	for (CateVO cateVo : voList2) { // 전체
    		
    		if ( "-".equals(cateVo.getCnctCtgCd()) && "31".equals(cateVo.getSvcUnionCd()) ) {
    			
    			m = new HashMap<String, String>();
        		m.put("ageRngNm", cateVo.getAgeRngNm());
        		m.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList1.add(m);	
        		ageListTitle1 = cateVo.getCtgNm();
        		
    		} else {
    			
    			m = new HashMap<String, String>();
    			m.put("ageRngNm", cateVo.getAgeRngNm());
        		m.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList2.add(m);
        		ageListTitle2 = cateVo.getCtgNm();
        		
    		}
    		
    	}
    	
    	List<Map<String, String>> ageLineList3 = new ArrayList<Map<String, String>>();
    	List<Map<String, String>> ageLineList4 = new ArrayList<Map<String, String>>();
    	Map<String, String> m2 = new HashMap<String, String>();
    	
    	for (CateVO cateVo : voList3) { // 전체
    		
    		if ("F".equals(cateVo.getSexCd())) {
    			
    			m2 = new HashMap<String, String>();
        		m2.put("ageRngNm", cateVo.getAgeRngNm());
        		m2.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList3.add(m2);	
        		ageListTitle3 = cateVo.getSexCd();
        		
    		} else {
    			
    			m2 = new HashMap<String, String>();
    			m2.put("ageRngNm", cateVo.getAgeRngNm());
        		m2.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList4.add(m2);
        		ageListTitle4 = cateVo.getSexCd();
    		}
    	}

    	List<Map<String, String>> ageLineList5 = new ArrayList<Map<String, String>>();
    	List<Map<String, String>> ageLineList6 = new ArrayList<Map<String, String>>();
    	Map<String, String> m3 = new HashMap<String, String>();
    	
    	for (CateVO cateVo : voList4) { // 전체
    	
    		if ( "-".equals(cateVo.getCnctCtgCd()) && "31".equals(cateVo.getSvcUnionCd()) ) {
    			
    			m3 = new HashMap<String, String>();
        		m3.put("sexCd", cateVo.getSexCd());
        		m3.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList5.add(m3);	
        		ageListTitle5 = cateVo.getCtgNm();
        		
    		} else {
    			
    			m3 = new HashMap<String, String>();
    			m3.put("sexCd", cateVo.getSexCd());
        		m3.put("totMbrCnt", cateVo.getTotMbrCnt());
        		ageLineList6.add(m3);
        		ageListTitle6 = cateVo.getCtgNm();
        		
    		}
    	}
    	
    	List<Map<String, Object>> arrayList5 = new ArrayList<Map<String, Object>>();
    	Map<String, Object> mainActiveMap = new HashMap<String, Object>();
    	
    	for (CateVO cateVO : voList5) {
    		
    		mainActiveMap = new HashMap<String, Object>();
    		mainActiveMap.put("seq", cateVO.getSeq());
    		mainActiveMap.put("mainArea", cateVO.getMainArea());
    		arrayList5.add(mainActiveMap);
    		
    	}
    	
    	Map<String ,Object> p = new HashMap<String, Object>();
    	p.put("svcUnionCd", svcUnionCd);
    	List<CommCodeVO> listCommCodeVO = commCodeSvc.selectSearchOption(p);
    	
    	for (CommCodeVO codeNm : listCommCodeVO) {
    		model.addAttribute("svcUnionNm", codeNm.getSvcUnionNm());
    	}
    	
    	JSONArray jsonArray = new JSONArray();
    	
    	model.addAttribute("baseDt", baseDt);
    	model.addAttribute("list", voList);
    	model.addAttribute("list2", voList2);
    	model.addAttribute("jsonList2", jsonArray.fromObject(voList2));
    	model.addAttribute("list3", voList3);
    	model.addAttribute("jsonList3", jsonArray.fromObject(voList3));
    	model.addAttribute("jsonList6", jsonArray.fromObject(voList6));
    	
    	model.addAttribute("list4", voList4);
    	model.addAttribute("list5", voList5);
    	model.addAttribute("cateList1", cateList1);
    	model.addAttribute("cateList2", cateList2);
    	model.addAttribute("cateList3", cateList3);
    	model.addAttribute("cnctCtgCd", cnctCtgCd);
    	model.addAttribute("periodClCd", periodClCd);
    	model.addAttribute("svcUnionCdNm", svcUnionCdNm);
    	model.addAttribute("ageLineList1", ageLineList1);
    	model.addAttribute("ageLineList2", ageLineList2);
    	model.addAttribute("ageLineList3", ageLineList3);
    	model.addAttribute("ageLineList4", ageLineList4);
    	model.addAttribute("ageLineList5", ageLineList5);
    	model.addAttribute("jsonAgeLineList5", jsonArray.fromObject(ageLineList5));
    	model.addAttribute("ageLineList6", ageLineList6);
    	model.addAttribute("jsonAgeLineList6", jsonArray.fromObject(ageLineList6));
    	model.addAttribute("largeCd", largeCd);
    	model.addAttribute("midCd", midCd);
    	model.addAttribute("smallCd", smallCd);
    	model.addAttribute("largeTx", largeTx);
    	model.addAttribute("midTx", midTx);
    	model.addAttribute("smallTx", smallTx);
    	model.addAttribute("periodTx", periodTx);
    	model.addAttribute("ageListTitle1", ageListTitle1);
    	model.addAttribute("ageListTitle2", ageListTitle2);
    	model.addAttribute("ageListTitle3", ageListTitle3);
    	model.addAttribute("ageListTitle4", ageListTitle4);
    	model.addAttribute("ageListTitle5", ageListTitle5);
    	model.addAttribute("ageListTitle6", ageListTitle6);
    	model.addAttribute("arrayList5", arrayList5);
    	
	}    */
}
