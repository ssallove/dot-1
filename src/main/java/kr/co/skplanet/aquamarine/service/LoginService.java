package kr.co.skplanet.aquamarine.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.skplanet.aquamarine.model.AccountVO;
import kr.co.skplanet.aquamarine.persistence.LoginDao;

/**
 * @author skplanet
 *
 */
@Service("loginSvc")
public class LoginService  {

    private static final Logger LOG = LoggerFactory.getLogger(LoginService.class);
    
    @Autowired
    private LoginDao loginDao;
    
    public AccountVO login(String userId, String password) {
    	
        Map<String, Object> param = new HashMap<String, Object>();
        
        param.put("userId", userId);
        param.put("password", password);
//        param.put("password", CipherManager.encrypt(password));
        AccountVO vo = loginDao.selectLoginInfo(param);
        
        LOG.debug("## login result", vo);
        
        return vo;
        
    }

    
    
    public AccountVO statusLogin(String userId, String password) {
    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	
    	param.put("userId", userId);
    	param.put("password", password);
//        param.put("password", CipherManager.encrypt(password));
    	AccountVO vo = loginDao.selectLoginAdminUser(param);
    	
    	LOG.debug("## login result", vo);
    	
    	return vo;
    	
    }
    
}
