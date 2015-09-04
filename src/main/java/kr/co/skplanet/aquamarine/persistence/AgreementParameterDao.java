package kr.co.skplanet.aquamarine.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import kr.co.skplanet.aquamarine.model.AgreementParameterVO;
import kr.co.skplanet.aquamarine.model.CamelizedKeyMap;

/**
 * <p>동의 모수 통계 DAO
 * @author skplanet
 *
 */
@Repository
public class AgreementParameterDao extends AbstractDao4PTGT {

	/**
	 * <p>동의 분류
	 * <ul>
	 * <li>필수 : {@link #Essential}
	 * <li>교차 : {@link #Cross}
	 * </ul>
	 */
	public enum AgreementClass {

		Essential("01"),
		Cross("02");

		private String code;

		private AgreementClass(String code) {
			this.code = code;
		}

		public String getCode() {
			return code;
		}

	}

	/**
	 * <p>집합 분류
	 * <ul>
	 * <li>합집합 : {@link #Union}
	 * <li>교집합 : {@link #Intersect}
	 * </ul>
	 */
	public enum SetType {

		Union("U"),
		Intersect("I");

		private String code;

		private SetType(String code) {
			this.code = code;
		}

		public String getCode() {
			return code;
		}

	}

	/**
	 * <p>서비스 별 필수/교차 동의 모수 성별/연령별 통계 조회
	 * @param agreementClass 필수/교차
	 * @return 조회 결과 리스트
	 */
	public List<AgreementParameterVO> selectEachServiceMbrSumBySexAge(AgreementClass agreementClass) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("agreementClassCode", agreementClass.getCode());

		return getSqlSession().selectList("AgreementParameter.selectEachServiceMbrSumBySexAge", param);

	}

	// public List<AgreementMosuVO> selectCrossMosuChart() {
	// Map<String, Object> param = new HashMap<String, Object>();
	// return getSqlSession().selectList("AgreementMosu.selectCrossMosuChart", param);
	// }

	/**
	 * <p>서비스 별 BM 간 교차 동의 교집합 통계 조회
	 * @return 조회 결과 리스트
	 */
	public List<Map<String, ?>> selectEachServiceCrossIntersect() {

		final List<Map<String, ?>> resultList = new ArrayList<Map<String, ?>>();

		getSqlSession().select("AgreementParameter.selectEachServiceCrossIntersect", new ResultHandler() {

			@Override
			public void handleResult(ResultContext rc) {

				@SuppressWarnings("unchecked")
				Map<String, ?> item = (Map<String, ?>) rc.getResultObject();
				Map<String, Object> result = new CamelizedKeyMap();

				for (Entry<String, ?> entry : item.entrySet()) {

					String key = entry.getKey();

					if (StringUtils.endsWith(key, "_CNT")) {

						String[] splitedKey = key.toLowerCase()
												 .split("_");

						@SuppressWarnings("unchecked")
						Map<String, Long> countMap = (Map<String, Long>) result.get(splitedKey[0]);

						if (countMap == null)
							result.put(splitedKey[0], countMap = new HashMap<String, Long>());

						countMap.put(splitedKey[1], Long.parseLong(ObjectUtils.toString(entry.getValue())));

					} else
						result.put(key, entry.getValue());

				}
				
				resultList.add(result);

			}
		});

		return resultList;

	}

	/**
	 * <p>서비스 조합별 동의 모수 통계 조회
	 * @param setType 합집합/교집합
	 * @return 조회 결과 리스트
	 */
	public List<Map<String, ?>> selectMixedServiceMbrSum(AgreementClass agreementClass, SetType setType) {

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("agreementClassCode", agreementClass.getCode());
		param.put("setTypeCode", setType.getCode());

		return getSqlSession().selectList("AgreementParameter.selectMixedServiceMbrSum", param);

	}

}
