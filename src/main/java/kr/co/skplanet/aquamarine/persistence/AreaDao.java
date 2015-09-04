package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.AreaVO;

import org.springframework.stereotype.Repository;

/**
 * @author skplanet
 *
 */
@Repository("areaDao")
public class AreaDao extends AbstractDao4PTGT {
    
    public List<AreaVO> selectAreaMosuList(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaMosuList", param);
    	
    }

    public List<AreaVO> selectAreaNodeList(Map<String, Object> p) {

        Map<String, Object> param = new HashMap<String, Object>();

        param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
        param.put("mainAdmDongCdCnt", p.get("mainAdmDongCdCnt"));
        param.put("crossAdmDongCdCnt", p.get("crossAdmDongCdCnt"));

        return getSqlSession().selectList("Area.selectAreaNodeList", param);

    }

    public List<AreaVO> selectAreaLinkList(Map<String, Object> p) {

        Map<String, Object> param = new HashMap<String, Object>();

        param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
        param.put("mainAdmDongCdCnt", p.get("mainAdmDongCdCnt"));
        param.put("crossAdmDongCdCnt", p.get("crossAdmDongCdCnt"));

        return getSqlSession().selectList("Area.selectAreaLinkList", param);

    }



    public List<AreaVO> selectAreaArPocList(Map<String, Object> p) {
        
        Map<String, Object> param = new HashMap<String, Object>();
        
        param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
        param.put("mainAdmDongCdCnt", p.get("mainAdmDongCdCnt"));
        param.put("crossAdmDongCdCnt", p.get("crossAdmDongCdCnt"));

        return getSqlSession().selectList("Area.selectAreaArPocList", param);
        
    } 

    
    
    public List<AreaVO> selectAreaMosuBarChartList(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaMosuBarChartList", param);
    	
    } 
    
    
    
    public List<AreaVO> selectAreaSexAgeList1(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaSexAgeList1", param);
    	
    } 
    
    
    
    public List<AreaVO> selectAreaSexAgeList2(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaSexAgeList2", param);
    	
    } 
    
    
    
    public List<AreaVO> selectAreaSexAgeList3(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaSexAgeList3", param);
    	
    } 
    
    
    
    public List<AreaVO> selectAreaBusiRankList(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaBusiRankList", param);
    	
    } 
    
    
    
    public List<AreaVO> selectAreaTogatherVisitAreaList(Map<String, Object> p) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("mainAcvtAdmDongCd", p.get("mainAcvtAdmDongCd"));
    	
    	return getSqlSession().selectList("Area.selectAreaTogatherVisitAreaList", param);
    	
    } 
   
}
