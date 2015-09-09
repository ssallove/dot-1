package kr.co.skplanet.aquamarine.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/**
 * <p>공통 사용자 정의 메소드
 * <p>메소드 추가 전 다음 사항 반드시 확인
 * <ul>
 * <li>Apache Commons 와 같은 이미 포함된 각종 유틸리티 라이브러리에서 도저히 찾을 수 없을 경우에만 메소드 추가
 * <li>만약 메소드를 추가할 경우, 되도록 이면 <strong>static</strong> 으로 선언
 * <li>
 * 이외의 또 다른 유틸리티 클래스 추가는 하지 않도록 하나, 특정 비지니스 로직이 특정 레이어에서 반복적으로 쓰이고,
 * 그 수가, 하나의 분류로 묶을 수 있을 경우에 한하도록 한다.
 * 
 * @author 이도현
 *
 */
public class CustomUtils {

	/**
	 * <p>{@link HttpServletRequest} 가 AJAX 로 호출되었는지 판단 (jQuery를 사용한 경우에 한함)
	 * <br>단, 이 메소드는 jQuery 라이브러리의 AJAX 관련 함수를 통해 호출할 경우에 한하며, 그외의 경우는 호출 시에, HTTP 요청 헤더 추가가 필요함
	 * @param request HTTP 요청
	 * @return AJAX 호출 여부
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {

		return StringUtils.equals(request.getHeader("X-Requested-With"), "XMLHttpRequest");

	}
	
}
