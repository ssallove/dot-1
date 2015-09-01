package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.CommCodeVO;

import org.springframework.stereotype.Repository;

/**
 * @author skplanet
 *
 */
@Repository("commCodeDao")
public class CommCodeDao extends AbstractDao4PTGT {
    
    public List<CommCodeVO> selectCategoryL() {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    
    	return getSqlSession().selectList("CommCode.selectCategoryL", param);
    	
    } 
    
    
    
    public List<CommCodeVO> selectCategoryM(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("comCd", p.get("comCd"));
    	
    	return getSqlSession().selectList("CommCode.selectCategoryM", param);
    	
    } 
    
    
    
    public List<CommCodeVO> selectCategoryS(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("comCd", p.get("comCd"));
    	
    	return getSqlSession().selectList("CommCode.selectCategoryS", param);
    	
    } 
    
    
    
    public List<CommCodeVO> selectAdmL(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	return getSqlSession().selectList("CommCode.selectAdmL", param);
    	
    } 
    
    
    
    public List<CommCodeVO> selectAdmM(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("admDongCd", p.get("admDongCd"));
    	
    	return getSqlSession().selectList("CommCode.selectAdmM", param);
    	
    } 
    
    
    
    public List<CommCodeVO> selectAdmS(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("admDongCd", p.get("admDongCd"));
    	
    	return getSqlSession().selectList("CommCode.selectAdmS", param);
    	
    }
    
    
    public CommCodeVO selectSearchOption(Map<String, String> param) {
    	return getSqlSession().selectOne("CommCode.selectSearchOption", param);
    }
}
