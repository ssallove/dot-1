package kr.co.skplanet.aquamarine.presentation.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import kr.co.skplanet.aquamarine.model.AccountVO;

/**
 * 로그인 인터셉터
 * 
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response,
								Object handler,
								Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void postHandle(HttpServletRequest request,
						   HttpServletResponse response,
						   Object handler,
						   ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response,
							 Object handler) throws Exception {

		HttpSession session = request.getSession();

		// LOG.info("request.getContextPath():" + request.getContextPath());
		// LOG.info("request.getRequestURI():" + request.getRequestURI());
		// LOG.info("request.getQueryString(): {}", StringUtils.defaultString(request.getQueryString()));

		AccountVO user = (AccountVO) session.getAttribute("AccountVO");

		if (user == null) {

			String redirectURI = request.getContextPath() + "/login.do";

			if (request.getMethod()
					   .equalsIgnoreCase(RequestMethod.GET.toString())) {

				String returnURI = request.getRequestURI()
										  .substring(request.getContextPath()
															.length());
				String queryString = request.getQueryString();

				if (StringUtils.isNotEmpty(queryString))
					returnURI += ("?" + queryString);

				redirectURI += ("?returnURI=" + Base64.encodeBase64URLSafeString(returnURI.getBytes()));

			}

			session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, LocaleContextHolder.getLocale());

			response.sendRedirect(redirectURI);

			return false;

		} else
			return true;

	}

}
