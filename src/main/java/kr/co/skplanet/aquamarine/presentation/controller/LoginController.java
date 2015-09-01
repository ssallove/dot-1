package kr.co.skplanet.aquamarine.presentation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.skplanet.aquamarine.model.AccountVO;
import kr.co.skplanet.aquamarine.service.LoginService;

/**
 * 로그인 컨트롤러
 * 
 * @author skplanet
 *
 */
@Controller
public class LoginController {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);

	// @Autowired
	// private LdapService ldapService;

	@Autowired
	private LoginService loginService;

	/*
	 * 로그인 페이지 이동
	 */
	@RequestMapping("/login")
	public String login() {

		return "login";

	}

	/*
	 * 로그인 프로세스
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginproc(@RequestParam String userId,
							@RequestParam String password,
							@RequestParam String returnURI,
							HttpSession session,
							Model model) {

		if (StringUtils.isNotBlank(userId) && StringUtils.isNotBlank(password)) {

			AccountVO vo = loginService.statusLogin(userId, password);

			String status = vo.getStatus();

			if ("1".equals(status)) { // 로그인 성공

				// session.setMaxInactiveInterval(60 * 60); // 40분으로 늘림
				session.setAttribute("AccountVO", vo);
				
				if(StringUtils.isBlank(returnURI))
					return "redirect:/home.do";
				else
					return "redirect:"+ new String(Base64.decodeBase64(returnURI));

			} else
				model.addAttribute("status", status);

		}

		return "login";

		/*
		 * } else if ("2".equals(status)) { // 아이디는 존재하나 패스워가 맞지 않습니다.
		 * 
		 * return "redirect:/login.do";
		 * 
		 * } else if ("3".equals(status)) { // 존재하지 않는 ID 입니다.
		 * 
		 * return "redirect:/login.do";
		 * 
		 * } else {
		 * 
		 * return "redirect:/login.do";
		 * 
		 * }
		 */

	}

	/*
	 * 로그아웃
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,
						 Model model,
						 HttpSession session) {

		session.invalidate();

		return "redirect:/";

	}

	/*
	 * 사번인증 프로세스
	 */
	// @RequestMapping(value = "/certify", method = RequestMethod.POST)
	// @ResponseBody
	// public Map<String, Boolean> certifyproc(@RequestParam String userId,
	// @RequestParam String password,
	// HttpServletRequest request,
	// HttpServletResponse response,
	// HttpSession session) throws Exception {
	//
	// boolean success = false;
	//
	// try {
	//
	// AccountVO vo = ldapService.login(userId, password);
	//
	// if (vo != null) {
	// success = true;
	// }
	//
	// success = true; // 현재 무조건 통과
	//
	// } catch (Exception e) {
	//
	// LOG.warn(e.getMessage(), e);
	// throw new Exception("시스템 오류가 발생했습니다.");
	//
	// }
	//
	// Map<String, Boolean> map = new HashMap<String, Boolean>();
	// map.put("correct", success);
	//
	// return map;
	//
	// }

}
