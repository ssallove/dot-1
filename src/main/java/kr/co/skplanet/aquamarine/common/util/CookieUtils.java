package kr.co.skplanet.aquamarine.common.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.skplanet.aquamarine.common.exception.CookieNotExistsException;

/**
 * <p>쿠키 암호화 처리
 * 
 * @author 이도현
 *
 */
public class CookieUtils {

	private static final String COOKIE_SECRET_KEY = "Tov/e7TiKVFOJRe1ygHkIA==";
	private static final String COOKIE_DEFAULT_PATH = "/";

	/**
	 * <p>쿠키 암호화 설정 - 문자열
	 * @param response
	 * @param name 쿠키 이름
	 * @param value 쿠키에 설정할 문자열
	 * @param expireDays 만료 기간(일)
	 */
	public static void setCookie(HttpServletResponse response,
								 String name,
								 String value,
								 int expireDays) {

		byte[] data = null;

		try {
			data = value.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}

		setCookie(response, name, data, expireDays);

	}

	/**
	 * <p>쿠키 암호화 설정 - 바이트
	 * @param response
	 * @param name 쿠키 이름
	 * @param value 쿠키에 설정할 바이트 배열
	 * @param expireDays 만료 기간(일)
	 */
	public static void setCookie(HttpServletResponse response,
								 String name,
								 byte[] value,
								 int expireDays) {

		Cookie cookie = new Cookie(name, CipherUtils.encrypt(value, COOKIE_SECRET_KEY));

		cookie.setPath(COOKIE_DEFAULT_PATH);
		cookie.setMaxAge(expireDays > 0 ? expireDays * (60 * 60 * 24) : expireDays);

		response.addCookie(cookie);

	}

	/**
	 * <p>쿠키 가져오기
	 * @param request
	 * @param name 쿠키 이름
	 * @return Cookie : 이름에 해당하는 쿠키로 쿠키의 값은 복호화 되어 있지 않음
	 * @throws CookieNotExistsException : 쿠키를 못찾았을 경우
	 */
	public static Cookie getCookie(HttpServletRequest request,
								   String name) throws CookieNotExistsException {

		Cookie[] cookies = request.getCookies();

		if (cookies != null) for (Cookie cookie : cookies)
			if (cookie.getName().equals(name)) return cookie;

		throw new CookieNotExistsException(name);

	}

	/**
	 * <p>쿠키 가져오기 - 바이트
	 * @param request 
	 * @param name 쿠키 이름
	 * @return byte[] : 복호화된 바이트 배열
	 * @throws CookieNotExistsException : 쿠키를 못찾았을 경우
	 */
	public static byte[] getCookieData(HttpServletRequest request,
									   String name) throws CookieNotExistsException {

		return CipherUtils.decrypt(getCookie(request, name).getValue(), COOKIE_SECRET_KEY);

	}

	/**
	 * <p>쿠키 가져오기 - 문자열
	 * @param request
	 * @param name 쿠키 이름
	 * @return String : 복호화된 바이트 배열을 문자열로 변환 시킨것
	 * @throws CookieNotExistsException : 쿠키를 못찾았을 경우
	 */
	public static String getCookieString(HttpServletRequest request,
										 String name) throws CookieNotExistsException {

		try {
			return new String(getCookieData(request, name), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * <p>쿠키 삭제
	 * @param request
	 * @param response
	 * @param name 쿠키 이름
	 * @throws CookieNotExistsException : 쿠키를 못찾았을 경우
	 */
	public static void delCookie(HttpServletRequest request,
								 HttpServletResponse response,
								 String name) throws CookieNotExistsException {

		Cookie cookie = getCookie(request, name);

		cookie.setMaxAge(0);
		cookie.setPath(COOKIE_DEFAULT_PATH);
		response.addCookie(cookie);

	}

}
