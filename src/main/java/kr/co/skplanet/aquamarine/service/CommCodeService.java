package kr.co.skplanet.aquamarine.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.CommCodeVO;
import kr.co.skplanet.aquamarine.persistence.CommCodeDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author skplanet
 *
 */
@Service("commCodeSvc")
public class CommCodeService  {

    private static final Logger LOG = LoggerFactory.getLogger(CommCodeService.class);
    
    @Autowired
    private CommCodeDao commCodeDao;
    
    public List<CommCodeVO> getCodeList(String comCd, String propertiesGb) throws Exception {
    	
    	Map<String, Object> comboParam = new HashMap<String, Object>();
    	
    	comboParam.put("comCd", comCd);
    	
    	List<CommCodeVO> list = new ArrayList<CommCodeVO>();
    	
    	list = getList(propertiesGb, comboParam, list, "C");
    	
    	return list;
    	
    }



	private List<CommCodeVO> getList(String propertiesGb, Map<String, Object> comboParam, List<CommCodeVO> list, String gubun) throws Exception {
		
		if ("".equals(propertiesGb) || "L".equals(propertiesGb) ) {
			
			if ("C".equals(gubun))
				list = selectCategoryM(comboParam);
			else if ("A".equals(gubun))
				list = selectAdmM(comboParam);
				
    	} else if("M".equals(propertiesGb)) {
    	
    		if ("C".equals(gubun))
    			list = selectCategoryS(comboParam);
    		else if ("A".equals(gubun))
    			list = selectAdmS(comboParam);
    		
    	}
		
		return list;
	}

    
    
    public List<CommCodeVO> getAdmList(String comCd, String propertiesGb) throws Exception {
    	
    	Map<String, Object> comboParam = new HashMap<String, Object>();
    	
    	comboParam.put("admDongCd", comCd);
    	
    	List<CommCodeVO> list = new ArrayList<CommCodeVO>();
    	
    	list = getList(propertiesGb, comboParam, list, "A");
    	
    	return list;
    	
    }
    

    
	public List<CommCodeVO> selectCategoryL() throws Exception {
    	
    	List<CommCodeVO> voList = commCodeDao.selectCategoryL();
        LOG.debug("## CommCodeVO selectCategoryL Result : ", voList.size());
        
        return voList;
        
    }
    
    
    
    public List<CommCodeVO> selectCategoryM(Map<String, Object> p ) throws Exception {
    	
    	List<CommCodeVO> voList = commCodeDao.selectCategoryM(p);
    	LOG.debug("## CommCodeVO selectCategoryM Result : ", voList.size());
    	
    	return voList;
    	
    }
    
    
    
    public List<CommCodeVO> selectCategoryS(Map<String, Object> p ) throws Exception {
    	
    	List<CommCodeVO> voList = commCodeDao.selectCategoryS(p);
    	LOG.debug("## CommCodeVO selectCategoryS Result : ", voList.size());
    	
    	return voList;
    }
    
    
    
    public List<CommCodeVO> selectAdmL(Map<String, Object> p ) throws Exception {
    
    	List<CommCodeVO> voList = commCodeDao.selectAdmL(p);
    	LOG.debug("## CommCodeVO selectAdmL Result : ", voList.size());
    	
    	return voList;
    
    }
    
    
    
    public List<CommCodeVO> selectAdmM(Map<String, Object> p ) throws Exception {
    	
    	List<CommCodeVO> voList = commCodeDao.selectAdmM(p);
    	LOG.debug("## CommCodeVO selectAdmM Result : ", voList.size());
    	
    	return voList;
    }
    
    
    
    public List<CommCodeVO> selectAdmS(Map<String, Object> p ) throws Exception {
    
    	List<CommCodeVO> voList = commCodeDao.selectAdmS(p);
    	LOG.debug("## CommCodeVO selectAdmS Result : ", voList.size());
    	
    	return voList;
    }
    
    
    
    public CommCodeVO selectSearchOption(Map<String, String> p) {
    	CommCodeVO voCode = commCodeDao.selectSearchOption(p);
    	LOG.debug("## CommCodeVO selectSearchOption Result : ", voCode);
    	return voCode;
    }
    
}
