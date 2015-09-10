package kr.co.skplanet.aquamarine.presentation.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.skplanet.aquamarine.model.AgreementParameterVO;
import kr.co.skplanet.aquamarine.model.AreaVO;
import kr.co.skplanet.aquamarine.model.CateVO;
import kr.co.skplanet.aquamarine.model.CommCodeVO;
import kr.co.skplanet.aquamarine.service.ParameterStatsService;
import kr.co.skplanet.aquamarine.service.AreaService;
import kr.co.skplanet.aquamarine.service.CateService;
import kr.co.skplanet.aquamarine.service.CommCodeService;
import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
//import kr.co.skplanet.aquamarine.service.SendMailService;

/**
 * POT 메인 컨트롤러
 *
 * @author skplanet
 */
@Controller
public class MainController {

    private static final Logger LOG = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private ParameterStatsService agreementMosuSvc; // 동의

    @Autowired
    private CateService cateSvc; // 업종

    @Autowired
    private AreaService areaSvc; // 주활동지역

    @Autowired
    private CommCodeService commCodeSvc; // 주활동지역

    // 동의모수 
    @RequestMapping("/chart_test")
    public String chartTest(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        return "chartTestPage";

    }

    // 동의모수 
    @RequestMapping("/echart")
    public String echart(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        return "echart";

    }

    @RequestMapping("/mainMosuList")
    public ModelAndView mainMosuList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String cityName = StringUtils.defaultIfEmpty(request.getParameter("cityName"), StringUtils.EMPTY);
        String cityCd = StringUtils.defaultIfEmpty(request.getParameter("cityCd"), StringUtils.EMPTY);
        String mainAdmDongCdCnt = StringUtils.defaultIfEmpty(request.getParameter("mainAdmDongCdCnt"), StringUtils.EMPTY);
        String crossAdmDongCdCnt = StringUtils.defaultIfEmpty(request.getParameter("crossAdmDongCdCnt"), StringUtils.EMPTY);

        HttpSession session = request.getSession();
        if (cityCd.length() == 0 || cityName.length() == 0) {
            cityCd = "00";
        }

        session.setAttribute("admDongCd", cityCd);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsonView");

        Map<String, Object> p = new HashMap<String, Object>();
        p.put("mainAcvtAdmDongCd", cityCd);
        p.put("mainAdmDongCdCnt", mainAdmDongCdCnt);
        p.put("crossAdmDongCdCnt", crossAdmDongCdCnt);

        List<AreaVO> list1 = areaSvc.selectAreaMosuList(p); // 지역별 모수현황
        List<AreaVO> list2 = areaSvc.selectAreaBusiRankList(p); // 업종순위
        List<AreaVO> list3 = areaSvc.selectAreaTogatherVisitAreaList(p); // 함께 방문하는 지역
        List<AreaVO> list4 = areaSvc.selectAreaSexAgeList1(p); // 성연령대별 현황1
        List<AreaVO> list5 = areaSvc.selectAreaSexAgeList2(p);
        List<AreaVO> list6 = areaSvc.selectAreaSexAgeList3(p);
        List<AreaVO> list7 = areaSvc.selectAreaNodeList(p); // AR POC
        List<AreaVO> list8 = areaSvc.selectAreaLinkList(p); // AR POC

        //기준일자
        String baseDt = "";

        for (AreaVO areaVo : list1) {
            baseDt = areaVo.getBaseDt();
            break;
        }

        modelAndView.addObject("baseDt", baseDt);
        modelAndView.addObject("mosuTableList", list1);
        modelAndView.addObject("sexBarList", list4);
        modelAndView.addObject("ageBarList", list5);
        modelAndView.addObject("sexAgeBarList", list6);
        modelAndView.addObject("rankTableList", list2);
        modelAndView.addObject("TogatherAreaTableList", list3);
        modelAndView.addObject("cityCd", cityCd);
        modelAndView.addObject("arPocNetworkNodeList", list7);
        modelAndView.addObject("arPocNetworkLinkList", list8);

        return modelAndView;

    }


    /**
     * 화면 공통 분류 Category List를 Json 형태로 조회
     *
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cateList")
    public ModelAndView cateList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        String comCd = StringUtils.defaultIfEmpty(request.getParameter("com_cd"), StringUtils.EMPTY);
        String propertiesGb = StringUtils.defaultIfEmpty(request.getParameter("properties_gb"), StringUtils.EMPTY);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("jsonView");

        modelAndView.addObject("cateList", commCodeSvc.getCodeList(comCd, propertiesGb));

        return modelAndView;

    }


    @RequestMapping("/admList")
    public ModelAndView admList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

        String comCd = StringUtils.defaultIfEmpty(request.getParameter("com_cd"), StringUtils.EMPTY);
        String propertiesGb = StringUtils.defaultIfEmpty(request.getParameter("properties_gb"), StringUtils.EMPTY);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("jsonView");

        modelAndView.addObject("admList", commCodeSvc.getAdmList(comCd, propertiesGb));

        return modelAndView;

    }


    // 주활동지역 
    @RequestMapping("/main_activity_area")
    public String main_activity_area(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        //System.out.println("\\n\\n\\n\\>>>>>>>>>>>>>>>>>>  mainActivityArea");
        /*
    	String admDongCd = StringUtils.defaultIfEmpty(request.getParameter("admDongCd"), StringUtils.EMPTY);
    	String siCd = StringUtils.defaultIfEmpty(request.getParameter("siCd"), StringUtils.EMPTY);
    	String guCd = StringUtils.defaultIfEmpty(request.getParameter("guCd"), StringUtils.EMPTY);
    	String dongCd = StringUtils.defaultIfEmpty(request.getParameter("dongCd"), StringUtils.EMPTY);
    	String siTx = StringUtils.defaultIfEmpty(request.getParameter("siTx"), StringUtils.EMPTY);
    	String guTx = StringUtils.defaultIfEmpty(request.getParameter("guTx"), StringUtils.EMPTY);
    	String dongTx = StringUtils.defaultIfEmpty(request.getParameter("dongTx"), StringUtils.EMPTY);
    	
    	HttpSession session = request.getSession();
    	
    	if ( "".equals(admDongCd) 
    			&& "".equals(siCd) 
    			&& "".equals(guCd) 
    			&& "".equals(dongCd) 
    			&& "".equals(siTx)
    			&& "".equals(guTx) 
    			&& "".equals(dongTx) ) { 
    		
    		admDongCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("admDongCd"), StringUtils.EMPTY );
    		siCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("siCd"), StringUtils.EMPTY );
    		guCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("guCd"), StringUtils.EMPTY );
    		dongCd = StringUtils.defaultIfEmpty( (String)session.getAttribute("dongCd"), StringUtils.EMPTY );
    		siTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("siTx"), StringUtils.EMPTY );
    		guTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("guTx"), StringUtils.EMPTY );
    		dongTx = StringUtils.defaultIfEmpty( (String)session.getAttribute("dongTx"), StringUtils.EMPTY );
    		
    	}

    	session.setAttribute("admDongCd", admDongCd);
    	session.setAttribute("siCd", siCd);
    	session.setAttribute("guCd", guCd);
    	session.setAttribute("dongCd", dongCd);
    	session.setAttribute("siTx", siTx);
    	session.setAttribute("guTx", guTx);
    	session.setAttribute("dongTx", dongTx);
    	
    	getMainDataCall(model, siCd, guCd, dongCd, siTx, guTx, dongTx);
    	*/
        return "mainActivityArea";

    }

    private void getMainDataCall(Model model, String siCd, String guCd,
                                 String dongCd, String siTx, String guTx, String dongTx)
            throws Exception {

        String admDongCd;

        Map<String, Object> pComboParam = new HashMap<String, Object>();

        pComboParam.put("admDongCd", siCd);

        List<CommCodeVO> admList1 = commCodeSvc.selectAdmL(pComboParam);
        List<CommCodeVO> admList2 = new ArrayList<CommCodeVO>();
        List<CommCodeVO> admList3 = new ArrayList<CommCodeVO>();

        pComboParam = new HashMap<String, Object>();

        if (!"00".equals(siCd)) {

            pComboParam.put("admDongCd", siCd);
            admList2 = commCodeSvc.selectAdmM(pComboParam);
            pComboParam = new HashMap<String, Object>();
            pComboParam.put("admDongCd", guCd);
            admList3 = commCodeSvc.selectAdmS(pComboParam);

        }

        if (admList2.size() == 0) {

            CommCodeVO com = new CommCodeVO();
            com.setAdmDongCd("00000");
            com.setSigungu("전체");
            admList2.add(com);

        }

        if (admList3.size() == 0) {

            CommCodeVO com = new CommCodeVO();
            com.setAdmDongCd("00000000");
            com.setAdmDong("전체");
            admList3.add(com);

        }

        //시 전체 코드 : 00
        //구 전체 코드 : 00000
        //동 전체 코드 : 00000000
        if (("00").equals(siCd)) {

            admDongCd = siCd;

        } else {

            if (("00000").equals(guCd)) {

                admDongCd = siCd;

            } else {

                if ("00000000".equals(dongCd)) {

                    admDongCd = guCd;

                } else {

                    admDongCd = dongCd;

                }

            }

        }

        Map<String, Object> p = new HashMap<String, Object>();
        p.put("mainAcvtAdmDongCd", admDongCd);
        List<Map<String, Object>> listArea = areaSvc.getAreaList(p);

        List<AreaVO> list1 = new ArrayList<AreaVO>();
        List<AreaVO> list2 = new ArrayList<AreaVO>();
        List<AreaVO> list3 = new ArrayList<AreaVO>();
        List<AreaVO> list4 = new ArrayList<AreaVO>();
        List<AreaVO> list5 = new ArrayList<AreaVO>();
        List<AreaVO> list6 = new ArrayList<AreaVO>();
        //List<AreaVO> list7 = new ArrayList<AreaVO>(); // bar chart

        for (Map<String, Object> m : listArea) {

            list1 = (List<AreaVO>) m.get("selectAreaMosuList"); // 지역별 모수현황
            list2 = (List<AreaVO>) m.get("selectAreaBusiRankList"); // 업종순위
            list3 = (List<AreaVO>) m.get("selectAreaTogatherVisitAreaList"); // 함께 방문하는 지역
            list4 = (List<AreaVO>) m.get("selectAreaSexAgeList1"); // 성연령대별 현황1
            list5 = (List<AreaVO>) m.get("selectAreaSexAgeList2");
            list6 = (List<AreaVO>) m.get("selectAreaSexAgeList3");
            //list7 = (List<AreaVO>) m.get("selectAreaMosuBarChartList");

        }

        List<Map<String, String>> ageBarListM1 = new ArrayList<Map<String, String>>();
        List<Map<String, String>> ageBarListF1 = new ArrayList<Map<String, String>>();
        List<Map<String, String>> ageBarListM2 = new ArrayList<Map<String, String>>();
        List<Map<String, String>> ageBarListF2 = new ArrayList<Map<String, String>>();
        List<Map<String, String>> ageBarListM3 = new ArrayList<Map<String, String>>();
        List<Map<String, String>> ageBarListF3 = new ArrayList<Map<String, String>>();

        Map<String, String> m1 = new HashMap<String, String>();
        Map<String, String> m2 = new HashMap<String, String>();
        Map<String, String> m3 = new HashMap<String, String>();

        String admDongNm1 = "";
        String admDongNm2 = "";
        String admDongNm3 = "";
        String acvtAdmDongCd = "";

        int row = 0;

        for (AreaVO areaVO : list4) {

            m1 = new HashMap<String, String>();
            // 대분류 고정
            if (row == 0) {
                acvtAdmDongCd = areaVO.getMainAcvtAdmDongCd();
            }

            if (acvtAdmDongCd.equals(areaVO.getMainAcvtAdmDongCd())) {

                m1.put("admDongNm", areaVO.getAdmDongNm());

                if ("M".equals(areaVO.getSexCd())) {
                    m1.put("sexCd", "남");
                } else {
                    m1.put("sexCd", "여");
                }

                m1.put("totMbrCnt", areaVO.getTotMbrCnt());
                ageBarListM1.add(m1);

            } else {

                m1.put("admDongNm", areaVO.getAdmDongNm());

                if ("M".equals(areaVO.getSexCd())) {
                    m1.put("sexCd", "남");
                } else {
                    m1.put("sexCd", "여");
                }

                m1.put("totMbrCnt", areaVO.getTotMbrCnt());
                admDongNm1 = areaVO.getAdmDongNm();
                ageBarListF1.add(m1);

            }

            row++;
        }

        row = 0;

        for (AreaVO areaVO : list5) {

            m2 = new HashMap<String, String>();
            // 대분류 고정
            if (row == 0) {
                acvtAdmDongCd = areaVO.getMainAcvtAdmDongCd();
            }

            if (acvtAdmDongCd.equals(areaVO.getMainAcvtAdmDongCd())) {

                m2.put("admDongNm", areaVO.getAdmDongNm());
                m2.put("totMbrCnt", areaVO.getTotMbrCnt());
                m2.put("ageRngNm", areaVO.getAgeRngNm());
                ageBarListM2.add(m2);

            } else {

                m2.put("admDongNm", areaVO.getAdmDongNm());
                m2.put("totMbrCnt", areaVO.getTotMbrCnt());
                m2.put("ageRngNm", areaVO.getAgeRngNm());
                admDongNm2 = areaVO.getAdmDongNm();
                ageBarListF2.add(m2);

            }

            row++;
        }

        row = 0;

        for (AreaVO areaVO : list6) {

            m3 = new HashMap<String, String>();
            // 대분류 고정
            if (row == 0) {
                acvtAdmDongCd = areaVO.getMainAcvtAdmDongCd();
            }

            if (acvtAdmDongCd.equals(areaVO.getMainAcvtAdmDongCd())) {

                m3.put("admDongNm", areaVO.getAdmDongNm());
                m3.put("totMbrCnt", areaVO.getTotMbrCnt());
                m3.put("ageRngNm", areaVO.getAgeRngNm());
                ageBarListM3.add(m3);

            } else {

                m3.put("admDongNm", areaVO.getAdmDongNm());
                m3.put("totMbrCnt", areaVO.getTotMbrCnt());
                m3.put("ageRngNm", areaVO.getAgeRngNm());
                admDongNm3 = areaVO.getAdmDongNm();
                ageBarListF3.add(m3);

            }

            row++;
        }

        //기준일자
        String baseDt = "";

        for (AreaVO areaVo : list1) {
            baseDt = areaVo.getBaseDt();
            break;
        }

        model.addAttribute("baseDt", baseDt);
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        model.addAttribute("list3", list3);
        model.addAttribute("list4", list4);
        model.addAttribute("list5", list5);
        model.addAttribute("list6", list6);
        //model.addAttribute("list7", list7);
        model.addAttribute("admList1", admList1);
        model.addAttribute("admList2", admList2);
        model.addAttribute("admList3", admList3);
        model.addAttribute("siCd", siCd);
        model.addAttribute("siTx", siTx);
        model.addAttribute("guCd", guCd);
        model.addAttribute("guTx", guTx);
        model.addAttribute("dongCd", dongCd);
        model.addAttribute("dongTx", dongTx);
        model.addAttribute("ageBarListM1", ageBarListM1);
        model.addAttribute("ageBarListF1", ageBarListF1);
        model.addAttribute("admDongNm1", admDongNm1);
        model.addAttribute("ageBarListM2", ageBarListM2);
        model.addAttribute("ageBarListF2", ageBarListF2);
        model.addAttribute("admDongNm2", admDongNm2);
        model.addAttribute("ageBarListM3", ageBarListM3);
        model.addAttribute("ageBarListF3", ageBarListF3);
        model.addAttribute("admDongNm3", admDongNm3);
    }

}
