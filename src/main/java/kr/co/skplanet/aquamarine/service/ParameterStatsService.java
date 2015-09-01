package kr.co.skplanet.aquamarine.service;

import static kr.co.skplanet.aquamarine.persistence.AgreementParameterDao.AgreementClass.*;
import static kr.co.skplanet.aquamarine.persistence.AgreementParameterDao.SetType.*;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.skplanet.aquamarine.model.AgreementParameterVO;
import kr.co.skplanet.aquamarine.persistence.AgreementParameterDao;

/**
 * @author skplanet
 *
 */
@Service
public class ParameterStatsService {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(ParameterStatsService.class);

	@Autowired
	private AgreementParameterDao agreementPopParamDao;

	// private List<Map<String, Object>> listAmv = new ArrayList<Map<String, Object>>();

	// public List<Map<String, Object>> getListAmv() throws Exception {
	//
	// listAmv = new ArrayList<Map<String, Object>>();
	//
	// Map dataMap = new HashMap();
	//
	// dataMap.put("essentialMosu", selectEssentialMosu());
	// dataMap.put("crossMosu", selectCrossMosu());
	// dataMap.put("union", selectMixedServiceMbrUnion());
	// dataMap.put("intersect", selectMixedServiceMbrIntersect());
	//
	// listAmv.add(dataMap);
	//
	// return listAmv;
	// }

	public List<AgreementParameterVO> getEachServiceMbrSumBySexAge4Essential() {

		List<AgreementParameterVO> voList = agreementPopParamDao.selectEachServiceMbrSumBySexAge(Essential);

		return voList;

	}

	public List<AgreementParameterVO> getEachServiceMbrSumBySexAge4Cross() {

		List<AgreementParameterVO> voList = agreementPopParamDao.selectEachServiceMbrSumBySexAge(Cross);

		return voList;

	}

	// public List<AgreementMosuVO> selectCrossMosuChart() {
	//
	// List<AgreementMosuVO> voList = agreementPopParamDao.selectCrossMosuChart();
	// LOG.debug("## AgreementMosuVO Result : ", voList.size());
	//
	// return voList;
	//
	// }

	public List<AgreementParameterVO> getMixedServiceMbrUnion() {

		List<AgreementParameterVO> voList = agreementPopParamDao.selectMixedServiceMbrSum(Union);

		return voList;

	}

	public List<AgreementParameterVO> getMixedServiceMbrIntersect() {

		List<AgreementParameterVO> voList = agreementPopParamDao.selectMixedServiceMbrSum(Intersect);

		return voList;

	}

}
