package kr.co.skplanet.aquamarine.presentation.interceptor;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>클라이언트 캐시에 관련된 일련의 해더 정보를 설정하는 인터셉터
 * 
 * @author 이도현
 * @since 2013. 4. 1.
 *
 */
public class ClientCacheInterceptor implements HandlerInterceptor {

	private int second = 0;

	@Override
	public boolean preHandle(final HttpServletRequest request,
							 final HttpServletResponse response,
							 final Object handler) throws Exception {

		if (second > 0) {

			response.setHeader("Cache-Control", "max-age=" + second);
			response.setDateHeader("Expires", Calendar.getInstance(request.getLocale())
													  .getTimeInMillis() + (second * 1000));

		} else {

			response.setHeader("Cache-Control", "private, max-age=0, must-revalidate, no-cache, no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);

		}

		return true;

	}

	@Override
	public void postHandle(final HttpServletRequest request,
						   final HttpServletResponse response,
						   final Object handler,
						   final ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(final HttpServletRequest request,
								final HttpServletResponse response,
								final Object handler,
								final Exception ex) throws Exception {

	}

	public int getSecond() {
		return second;
	}

	public void setSecond(final int second) {
		this.second = second;
	}

}
