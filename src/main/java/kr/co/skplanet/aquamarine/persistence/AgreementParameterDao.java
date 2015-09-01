package kr.co.skplanet.aquamarine.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.skplanet.aquamarine.model.AgreementParameterVO;

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

//	public List<AgreementMosuVO> selectCrossMosuChart() {
//		Map<String, Object> param = new HashMap<String, Object>();
//		return getSqlSession().selectList("AgreementMosu.selectCrossMosuChart", param);
//	}

	/**
	 * <p>서비스 조합별 동의 모수 통계 조회
	 * @param setType 합집합/교집합
	 * @return 조회 결과 리스트
	 */
	public List<AgreementParameterVO> selectMixedServiceMbrSum(SetType setType) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("setTypeCode", setType.getCode());
		
		return getSqlSession().selectList("AgreementParameter.selectMixedServiceMbrSum", param);
		
	}
	
}
