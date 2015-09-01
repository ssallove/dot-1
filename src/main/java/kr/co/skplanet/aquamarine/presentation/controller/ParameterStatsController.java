package kr.co.skplanet.aquamarine.presentation.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.skplanet.aquamarine.model.AgreementParameterVO;
import kr.co.skplanet.aquamarine.service.ParameterStatsService;

/**
 * 동의 모수 통계 컨트롤러
 * 
 * @author skplanet
 *
 */
@Controller
@RequestMapping("/parameterStats")
public class ParameterStatsController {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(ParameterStatsController.class);

	@Autowired
	private ParameterStatsService agreementPopParamService; // 동의
	
	@RequestMapping("/overview")
	public String overview(){
		
		return "parameterStats/overview";
		
	}

	@RequestMapping("/agreement/{type:essential|cross}")
	public String agreement(@PathVariable String type,
							Model model) {

		List<AgreementParameterVO> listVoTemp = null;
		List<AgreementParameterVO> listVoSum = null;
		List<AgreementParameterVO> listVoSumBySex = null;
		List<AgreementParameterVO> listVoSumByAge = null;

		switch (type) {

			case "essential":
				listVoTemp = agreementPopParamService.getEachServiceMbrSumBySexAge4Essential();

				break;

			case "cross":
				listVoTemp = agreementPopParamService.getEachServiceMbrSumBySexAge4Cross();

				break;

			default:
				throw new RuntimeException();

		}

		if (!listVoTemp.isEmpty()) {

			listVoSum = new ArrayList<AgreementParameterVO>();
			listVoSumBySex = new ArrayList<AgreementParameterVO>();
			listVoSumByAge = new ArrayList<AgreementParameterVO>();

			AgreementParameterVO tempSumVO = null, tempSumBySexVO = null, tempSumByAgeVO = null;

			Map<String, AgreementParameterVO> tempSumBySexMap = new LinkedHashMap<String, AgreementParameterVO>(),
							tempSumByAgeMap = new LinkedHashMap<String, AgreementParameterVO>();

			for (Iterator<AgreementParameterVO> iterator = listVoTemp.iterator(); iterator.hasNext();) {

				AgreementParameterVO tempVO = (AgreementParameterVO) iterator.next();

				if (tempSumVO != null && (tempVO.getLv()
												.equals(tempSumVO.getLv())
										  && tempVO.getFuncAgrClCd()
												   .equals(tempSumVO.getFuncAgrClCd()))) {
					// 1. 전체 집계
					aggrateValues(tempSumVO, tempVO);

					// 2. 성별 집계
					tempSumBySexVO = tempSumBySexMap.get(tempVO.getSexCd());

					if (tempSumBySexVO != null && tempSumBySexVO.getSexCd()
																.equals(tempVO.getSexCd())) {

						aggrateValues(tempSumBySexVO, tempVO);

					} else {

						tempSumBySexVO = getCopiedVO(tempVO);

						tempSumBySexMap.put(tempSumBySexVO.getSexCd(), tempSumBySexVO);

					}

					// 3. 연령대별 집계
					tempSumByAgeVO = tempSumByAgeMap.get(tempVO.getAgeRngCd());

					if (tempSumByAgeVO != null && tempSumByAgeVO.getAgeRngCd()
																.equals(tempVO.getAgeRngCd())) {

						aggrateValues(tempSumByAgeVO, tempVO);

					} else {

						tempSumByAgeVO = getCopiedVO(tempVO);

						tempSumByAgeMap.put(tempSumByAgeVO.getAgeRngCd(), tempSumByAgeVO);

					}

					if (!iterator.hasNext()) {

						listVoSumBySex.addAll(tempSumBySexMap.values());
						listVoSumByAge.addAll(tempSumByAgeMap.values());

					}

				} else {

					// 1. 전체 집계 - 초기화
					listVoSum.add(tempSumVO = tempVO);

					// 2. 성별 집계 - 초기화
					tempSumBySexVO = getCopiedVO(tempVO);

					if (tempSumBySexMap != null)
						listVoSumBySex.addAll(tempSumBySexMap.values());

					tempSumBySexMap.clear();
					tempSumBySexMap.put(tempSumBySexVO.getSexCd(), tempSumBySexVO);

					// 3. 연령대별 집계 - 초기화
					tempSumByAgeVO = getCopiedVO(tempVO);

					if (tempSumByAgeMap != null)
						listVoSumByAge.addAll(tempSumByAgeMap.values());

					tempSumByAgeMap.clear();
					tempSumByAgeMap.put(tempSumByAgeVO.getAgeRngCd(), tempSumByAgeVO);

				}

			}

		}

		List<AgreementParameterVO> listVoUnion = agreementPopParamService.getMixedServiceMbrUnion();
		List<AgreementParameterVO> listVoIntersect = agreementPopParamService.getMixedServiceMbrIntersect();

		model.addAttribute("listVoSum", listVoSum);
		model.addAttribute("listVoSumBySex", listVoSumBySex);
		model.addAttribute("listVoSumByAge", listVoSumByAge);
		model.addAttribute("listVoUnion", listVoUnion);
		model.addAttribute("listVoIntersect", listVoIntersect);

		return "parameterStats/agreement";

	}

	private void aggrateValues(AgreementParameterVO target,
							   AgreementParameterVO added) {

		target.setTot(target.getTot() + added.getTot());
		target.setSyr(target.getSyr() + added.getSyr());
		target.setEvs(target.getEvs() + added.getEvs());
		target.setOcb(target.getOcb() + added.getOcb());
		target.setOct(target.getOct() + added.getOct());
		target.setTma(target.getTma() + added.getTma());
		target.setTst(target.getTst() + added.getTst());

	};

	private AgreementParameterVO getCopiedVO(AgreementParameterVO origin) {

		AgreementParameterVO copied = new AgreementParameterVO();

		try {
			BeanUtils.copyProperties(copied, origin);
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new RuntimeException(e);
		}

		return copied;

	}

	// private void getClientIP(Model model) throws UnknownHostException {
	//
	// HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	//
	// String ip = req.getHeader("X-FORWARDED-FOR");
	//
	// InetAddress currentIP = InetAddress.getLocalHost();
	//
	// if (ip == null)
	// ip = req.getRemoteAddr();
	//
	// model.addAttribute("localIP", ip);
	//
	// model.addAttribute("clientIP", currentIP);
	// }

}
