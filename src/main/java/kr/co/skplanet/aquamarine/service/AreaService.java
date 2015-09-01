package kr.co.skplanet.aquamarine.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.AreaVO;
import kr.co.skplanet.aquamarine.persistence.AreaDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author skplanet
 *
 */
@Service("areaSvc")
public class AreaService  {

    private static final Logger LOG = LoggerFactory.getLogger(AreaService.class);
    
    @Autowired
    private AreaDao areaDao;
    
    private List<Map<String, Object>> listArea = new ArrayList<Map<String, Object>>();
    
    public List<Map<String, Object>> getAreaList(Map<String,Object> p) throws Exception {
    	
    	listArea = new ArrayList<Map<String, Object>>();
    	
    	Map m = new HashMap();
    	
    	m.put("selectAreaMosuList", selectAreaMosuList(p));
    	m.put("selectAreaMosuBarChartList", selectAreaMosuBarChartList(p));
    	m.put("selectAreaSexAgeList1", selectAreaSexAgeList1(p));
    	m.put("selectAreaSexAgeList2", selectAreaSexAgeList2(p));
    	m.put("selectAreaSexAgeList3", selectAreaSexAgeList3(p));
    	m.put("selectAreaBusiRankList", selectAreaBusiRankList(p));
    	m.put("selectAreaTogatherVisitAreaList", selectAreaTogatherVisitAreaList(p));
    	
    	listArea.add(m);
    	
    	return listArea;
    	
    }
    
    
    
    public List<AreaVO> selectAreaMosuList(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaMosuList(p);
        LOG.debug("## AreaVO Result : ", voList.size());
        
        return voList;
        
    }
    
    
    
    public List<AreaVO> selectAreaArPocList(Map<String, Object> p ) throws Exception {
        
        List<AreaVO> voList = areaDao.selectAreaArPocList(p);
          LOG.debug("## AreaVO Result : ", voList.size());
          
          return voList;
          
      }
    
    
    
    public List<AreaVO> selectAreaMosuBarChartList(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaMosuBarChartList(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<AreaVO> selectAreaSexAgeList1(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaSexAgeList1(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<AreaVO> selectAreaSexAgeList2(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaSexAgeList2(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<AreaVO> selectAreaSexAgeList3(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaSexAgeList3(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<AreaVO> selectAreaBusiRankList(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaBusiRankList(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<AreaVO> selectAreaTogatherVisitAreaList(Map<String, Object> p ) throws Exception {
    	
    	List<AreaVO> voList = areaDao.selectAreaTogatherVisitAreaList(p);
    	LOG.debug("## AreaVO Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
}
