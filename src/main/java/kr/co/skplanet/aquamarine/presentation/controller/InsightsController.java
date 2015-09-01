package kr.co.skplanet.aquamarine.presentation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.skplanet.aquamarine.service.CateService;
import kr.co.skplanet.aquamarine.service.CommCodeService;

@Controller
@RequestMapping("/insights/{type:syruppay|timeseries|mobile}")
public class InsightsController {
    private static final Logger LOG = LoggerFactory.getLogger(InsightsController.class);
    
    @Autowired
    private CateService cateSvc; // 업종
    
    @Autowired
    private CommCodeService commCodeSvc; 


	/**
	 * Syrup Pay (/w 한정M) 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping
    public String insights(@PathVariable String type, Model model) throws Exception {
    	
        return "insights/"+type;
    }


    
}
