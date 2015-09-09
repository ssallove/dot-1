package kr.co.skplanet.aquamarine.service;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.skplanet.aquamarine.common.exception.LoginFailureException;
import kr.co.skplanet.aquamarine.model.AccountVO;
import kr.co.skplanet.aquamarine.persistence.AccountDao;
import static kr.co.skplanet.aquamarine.persistence.AccountDao.HistoryTypeCode.*;

/**
 * @author skplanet
 *
 */
@Service("loginSvc")
public class AccountService {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(AccountService.class);

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private LdapService ldapService;

	public void login(final AccountVO account,
					  String userId,
					  String password) throws LoginFailureException {

		if (StringUtils.isNotBlank(userId) && StringUtils.isNotBlank(password)) {

			account.setUserId(userId.trim()
									.toUpperCase());
			password = password.trim();

			if (ldapService.login(account, password)) {

				account.setRoleId(AccountVO.MEMBER_ROLE_ID);

				accountDao.insertLoginHistory(account, LOGIN);

			} else
				throw new LoginFailureException("Pnet 인증 실패");

		} else
			throw new LoginFailureException("유효하지 않은 아이디, 또는 비밀번호");

	}

	public void logout(final AccountVO account) {

		accountDao.insertLoginHistory(account, LOGOUT);

	}

}
