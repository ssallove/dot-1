package kr.co.skplanet.aquamarine.presentation.interceptor;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.skplanet.aquamarine.common.util.AccountUtils;
import kr.co.skplanet.aquamarine.common.util.CustomUtils;
import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * <p>요청에 대한 공통적인 전처리 작업을 수행하는 인터셉터
 * 
 * @author 이도현
 * @since 2015. 3. 31.
 *
 */
public class PreprocessInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOG = LoggerFactory.getLogger(PreprocessInterceptor.class);

	private long accountTimeoutMillis;

	@Value("${account.timeout.secs}")
	public void setAccountTimeoutMilles(final int accountTimeoutSeconds) {
		this.accountTimeoutMillis = accountTimeoutSeconds * 1000;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(final HttpServletRequest request,
							 final HttpServletResponse response,
							 final Object handler) throws Exception {

		// request.setAttribute("requestPrefix", StringUtils.removeEnd(request.getRequestURL().toString(), request.getRequestURI()));
		// request.setAttribute("requestURI", request.getRequestURI());
		// request.setAttribute("requestURL", request.getRequestURL());
		// request.setAttribute("servletPath", request.getServletPath());
		// request.setAttribute("currentDomain", request.getServerName());

		AccountVO account = AccountUtils.getAccount(request);

		boolean isSessionFixation = false;

		if (account != null) {

			if (Calendar.getInstance()
						.getTimeInMillis()
				- account.getLastActionTimeMillis() < accountTimeoutMillis) {

				String userAgent = request.getHeader("User-Agent");

				if (isSessionFixation = !StringUtils.equals(account.getUserAgent(), userAgent))
					LOG.warn("Session fixation warnning : User-Agent ({} -> {})", account.getUserAgent(), userAgent);

				String remoteIp = request.getRemoteAddr();

				if (!StringUtils.equals(account.getRemoteIp(), remoteIp)) {

					LOG.warn("Session fixation warnning : IP ({} -> {})", account.getRemoteIp(), remoteIp);
					isSessionFixation = true;

				}

				if (isSessionFixation) {

					if (!request.getMethod()
								.equalsIgnoreCase(RequestMethod.GET.toString())
						|| !account.isGuest()) {

						AccountUtils.removeAccount(request, response);

						if (!CustomUtils.isAjaxRequest(request))
							throw new ModelAndViewDefiningException(new ModelAndView("error/401"));
						else {
							response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
							return false;
						}

					}

				}

			} else {

				account = AccountUtils.getGuestAccount(request);

				if (CustomUtils.isAjaxRequest(request)) {

					response.setStatus(HttpServletResponse.SC_REQUEST_TIMEOUT);
					return false;

				}

			}

			AccountUtils.setAccount(request, response, account);

		} else {

			AccountUtils.setAccount(request, response, AccountUtils.getGuestAccount(request));

			if (!request.getMethod()
						.equalsIgnoreCase(RequestMethod.GET.toString())) {

				// GET 이외의 요청이 쿠키에 member가 설정이 되어 있지 않을 경우 진행을 중지 시킨다.

				if (!CustomUtils.isAjaxRequest(request))
					throw new ModelAndViewDefiningException(new ModelAndView("error/401"));
				else {
					response.setStatus(HttpServletResponse.SC_PRECONDITION_FAILED);
					// response.setContentType("application/json");
					return false;
				}

			}

		}

		return true;

	}

}
