package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.CateVO;

import org.springframework.stereotype.Repository;

/**
 * @author skplanet
 *
 */
@Repository("cateDao")
public class CateDao extends AbstractDao4PTGT {
    
    public List<CateVO> selectCateServiceMosuReportList(Map<String, String> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("periodClCd", p.get("periodClCd"));
    	param.put("cnctCtgCd", p.get("cnctCtgCd"));
    	
    	return getSqlSession().selectList("Category.selectCateServiceMosuReportList", param);
    	
    } 
    
    
    
    /**
     * E-Chart 버블차트  보여지는 X축 조회
     * @return X축 Category List
     */
    public List<String> selectBusyBubbleXLineView(Map<String, String> p) {
    	return getSqlSession().selectList("Category.selectBusyBubbleXLineView", p);
    }
    
    public List<String> selectBusyBubbleXLine(Map<String, String> p) {
    	return getSqlSession().selectList("Category.selectBusyBubbleXLine", p);
    	
    }
    
    public List<CateVO> selectBusyBubbleChartData(Map<String, String> p) {
    	return getSqlSession().selectList("Category.selectBusyBubbleChartData", p);
    	
    }
    
    
    
    public List<CateVO> selectCateSexAgeList1(Map<String, String> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("svcUnionCd", p.get("svcUnionCd"));
    	param.put("periodClCd", p.get("periodClCd"));
    	param.put("cnctCtgCd", p.get("cnctCtgCd"));
    	
    	return getSqlSession().selectList("Category.selectCateSexAgeList1", param);
    	
    } 
    
    
    
    public List<CateVO> selectCateSexAgeList2(Map<String, String> p) {
    
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("svcUnionCd", p.get("svcUnionCd"));
    	param.put("periodClCd", p.get("periodClCd"));
    	param.put("cnctCtgCd", p.get("cnctCtgCd"));
    	
    	return getSqlSession().selectList("Category.selectCateSexAgeList2", param);
    	
    } 
    
    
    
    public List<CateVO> selectCateSexList(Map<String, String> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("svcUnionCd", p.get("svcUnionCd"));
    	param.put("periodClCd", p.get("periodClCd"));
    	param.put("cnctCtgCd", p.get("cnctCtgCd"));
    	
    	return getSqlSession().selectList("Category.selectCateSexList", param);
    } 
    
    
    
    public List<CateVO> selectCateMainActiveAreaList(Map<String, String> p) {
    
    	Map<String, Object> param = new HashMap<String, Object>();

    	param.put("svcUnionCd", p.get("svcUnionCd"));
    	param.put("periodClCd", p.get("periodClCd"));
    	param.put("cnctCtgCd", p.get("cnctCtgCd"));
    	
    	return getSqlSession().selectList("Category.selectCateMainActiveAreaList", param);
    } 
    
}
