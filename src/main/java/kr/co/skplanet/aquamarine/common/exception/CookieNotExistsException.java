package kr.co.skplanet.aquamarine.common.exception;

import java.text.MessageFormat;

/**
 * <p>쿠키가 없을 시를 의미하는 예외
 * 
 * @author 이도현
 * @since 2015. 3. 31.
 *
 */
public class CookieNotExistsException extends Exception {

	private static final long serialVersionUID = -2993876095617346321L;

	public CookieNotExistsException(String name) {

		super(MessageFormat.format("쿠키를 찾지 못함 : {0}", name));

	}

}
