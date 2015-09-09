package kr.co.skplanet.aquamarine.common.util;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
import com.fasterxml.jackson.databind.ObjectWriter;

import kr.co.skplanet.aquamarine.common.exception.CookieNotExistsException;
import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * <p>사용자 계정 처리
 * 
 * @author 이도현
 * @since 2015. 9. 9.
 */
public class AccountUtils {

	private static final Logger LOG = LoggerFactory.getLogger(AccountUtils.class);

	private static final String ACCOUNT_KEY = "account";

	private static ObjectWriter JSON_WRITER_4_ACCOUNT = null;
	private static ObjectReader JSON_READER_4_ACCOUNT = null;

	static {

		ObjectMapper jsonMapper = new ObjectMapper();

		TypeReference<AccountVO> apiResponseTypeRef = new TypeReference<AccountVO>() {
		};

		JSON_WRITER_4_ACCOUNT = jsonMapper.writerWithType(apiResponseTypeRef);
		JSON_READER_4_ACCOUNT = jsonMapper.reader(apiResponseTypeRef);

	}

	public static AccountVO getGuestAccount(HttpServletRequest request) {

		AccountVO account = new AccountVO();

		account.setUserId(getGuestUserId(request));
		account.setRoleId(AccountVO.GUEST_ROLE_ID);

		return account;

	}

	public static String getGuestUserId(HttpServletRequest request) {

		return MessageFormat.format("{0}@{1}:{2}", request.getSession()
														  .getId(),
									request.getLocalAddr(), String.valueOf(request.getLocalPort()));

	}

	public static void setAccount(HttpServletRequest request,
								  HttpServletResponse response,
								  AccountVO account) {

		account.setUserAgent(request.getHeader("User-Agent"));
		account.setRemoteIp(request.getRemoteAddr());
		account.setLastActionTimeMillis(Calendar.getInstance()
												.getTimeInMillis());

		try {
			CookieUtils.setCookie(response, ACCOUNT_KEY, JSON_WRITER_4_ACCOUNT.writeValueAsString(account), -1);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}

		setAccount(request, account);

	}

	private static void setAccount(HttpServletRequest request,
								   AccountVO account) {

		request.setAttribute(ACCOUNT_KEY, account);

	}

	public static AccountVO getAccount(HttpServletRequest request) {

		AccountVO account = (AccountVO) request.getAttribute(ACCOUNT_KEY);

		if (account != null)
			return account;
		else {

			try {

				try {
					account = JSON_READER_4_ACCOUNT.readValue(CookieUtils.getCookieData(request, ACCOUNT_KEY));
				} catch (IOException e) {
					throw new RuntimeException(e);
				}

				setAccount(request, account);

				return account;

			} catch (CookieNotExistsException e) {
				LOG.debug(e.getMessage(), e);
				return null;
			}

		}

	}

	public static void removeAccount(HttpServletRequest request,
									 HttpServletResponse response) {

		request.removeAttribute(ACCOUNT_KEY);

		try {
			CookieUtils.delCookie(request, response, ACCOUNT_KEY);
		} catch (CookieNotExistsException e) {
			LOG.debug(e.getMessage(), e);
		}

	}

}
