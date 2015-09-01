package kr.co.skplanet.aquamarine.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.CateVO;
import kr.co.skplanet.aquamarine.persistence.CateDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author skplanet
 *
 */
@Service("cateSvc")
public class CateService  {

    private static final Logger LOG = LoggerFactory.getLogger(CateService.class);
    
    @Autowired
    private CateDao cateDao;
    
    private List<Map<String, Object>> listCate = new ArrayList<Map<String, Object>>();
    
    public List<Map<String, Object>> getCateList(Map<String, String> p) throws Exception {
    	
    	listCate = new ArrayList<Map<String, Object>>();
    	
    	Map m = new HashMap<String, Object>();
    	
    	m.put("selectCateServiceMosuReportList", selectCateServiceMosuReportList(p));
    	m.put("selectCateSexAgeList1", selectCateSexAgeList1(p));
    	m.put("selectCateSexAgeList2", selectCateSexAgeList2(p));
    	m.put("selectCateSexList", selectCateSexList(p));
    	m.put("selectCateMainActiveAreaList", selectCateMainActiveAreaList(p));
    	p.put("cnctCtgCd", "-");
    	m.put("selectCateSexAgeListAll", selectCateSexAgeList2(p));
    	listCate.add(m);
    	
    	return listCate;
    	
    }
    
    
/*    
    public List<Map<String, Object>> getCateBubbleList(Map<String, String> p) throws Exception {
    	listCate = new ArrayList<Map<String, Object>>();
    	
    	Map m = new HashMap<String, Object>();
    	
    	m.put("selectBubbleXLine", selectBubbleXLine(p));
    	m.put("selectBubbleData", selectBusyBubbleChartData(p));
    	
    	listCate.add(m);
    	
    	return listCate;
    }
    */
    
    
	/**
	 * E-Chart 버블차트  X축 조회
	 * @return X축 Category List
	 * @throws Exception
	 */
    public List<String> selectBusyBubbleXLine(Map<String, String> p) throws Exception {
    	List<String> voList = cateDao.selectBusyBubbleXLine(p);
        LOG.debug("## CateVO Result : ", voList.size());
        return voList;
    }
    public List<String> selectBusyBubbleXLineView(Map<String, String> p) throws Exception {
    	List<String> voList = cateDao.selectBusyBubbleXLineView(p);
        LOG.debug("## CateVO Result : ", voList.size());
        return voList;
    }
    
    public List<CateVO> selectBusyBubbleChartData(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectBusyBubbleChartData(p);
    	LOG.debug("## CateVO Result : ", voList.size());
    	
    	return voList;
    	
    }



    public List<CateVO> selectCateServiceMosuReportList(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectCateServiceMosuReportList(p);
        LOG.debug("## CateVO Result : ", voList.size());
        
        return voList;
        
    }
    
    
    
    public List<CateVO> selectCateSexAgeList1(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectCateSexAgeList1(p);
    	LOG.debug("## CateVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<CateVO> selectCateSexAgeList2(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectCateSexAgeList2(p);
    	LOG.debug("## CateVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<CateVO> selectCateSexList(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectCateSexList(p);
    	LOG.debug("## CateVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<CateVO> selectCateMainActiveAreaList(Map<String, String> p) throws Exception {
    	
    	List<CateVO> voList = cateDao.selectCateMainActiveAreaList(p);
    	LOG.debug("## CateVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
}
