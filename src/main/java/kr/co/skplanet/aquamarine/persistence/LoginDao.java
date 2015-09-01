package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skplanet.aquamarine.model.AccountVO;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

/**
 * @author skplanet
 *
 */
@Repository("loginDao")
public class LoginDao extends AbstractDao4PTGT {
    
    public AccountVO selectLoginInfo(Map<String, Object> param) {
        return getSqlSession().selectOne("Login.selectLoginInfo", param);
    }

    
    
    public AccountVO selectLoginAdminUser(Map<String, Object> param) {
    	return getSqlSession().selectOne("Login.selectLoginAdminUser", param);
    }
    
}
