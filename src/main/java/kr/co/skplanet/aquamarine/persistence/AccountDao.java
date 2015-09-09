package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * @author skplanet
 *
 */
@Repository
public class AccountDao extends AbstractDao4PTGT {
	
	public enum HistoryTypeCode {

		LOGIN("LI"),
		LOGOUT("LO");

		private String code;

		private HistoryTypeCode(String code) {
			this.code = code;
		}

		public String getCode() {
			return code;
		}

	}
    
	public int insertLoginHistory(AccountVO account, HistoryTypeCode historyTypeCode){
		
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("account", account);
		param.put("historyTypeCode", historyTypeCode.getCode());
		
		return getSqlSession().insert("Account.insertLoginHistory", param);
		
	}
    
}
