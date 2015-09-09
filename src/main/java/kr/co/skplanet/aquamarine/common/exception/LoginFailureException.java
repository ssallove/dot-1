package kr.co.skplanet.aquamarine.common.exception;

/**
 * <p>로그인 실패에 대한 예외
 * @author 이도현
 *
 */
public class LoginFailureException extends Exception {

	private static final long serialVersionUID = -6275565717476252808L;
	
	public LoginFailureException(String message) {
		super(message);
	}

}
