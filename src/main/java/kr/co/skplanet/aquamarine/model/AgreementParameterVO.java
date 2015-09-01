package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

/**
 * 동의 모수
 * 
 * @author skplanet
 *
 */
public class AgreementParameterVO implements Serializable {

	private static final long serialVersionUID = 6222634385320712381L;

	private String lv;
	private String lvNm;
	private String funcAgrClCd; /* 기능별동의구분코드 */
	private String funcAgrClNm; /* 기능별동의구분코드 */
	private long tot;
	private long ocb;
	private long oct;
	private long syr;
	private long tma;
	private long tst;
	private long evs;

	private String sexCd;
	private String ageRngCd;

	private String baseDt; /* 기준일자 */
	private String intKeyClCd; /* 통합KEY구분코드 */
	private String cmplsCrossAgrClCd; /* 필수/교차동의구분코드 */
	private String svcCd; /* 서비스코드 */

	private long scbMbrCnt; /* 가입고객수 */
	private long actvMbrCnt; /* Active고객수 */
	private long mauCnt; /* MAU */
	private String operDtm; /* 작업일시 */

	private String crossSvcUnionCd;
	private long scbMbrCntTot;
	private long scbMbrCntPush;
	private long scbMbrCntGeo;
	private long scbMbrCntBle;
	private long actvMbrCntTot;
	private long actvMbrCntPush;
	private long actvMbrCntGeo;
	private long actvMbrCntBle;
	private long mauCntTot;
	private long mauCntPush;
	private long mauCntGeo;
	private long mauCntBle;

	public String getCrossSvcUnionCd() {
		return crossSvcUnionCd;
	}

	public void setCrossSvcUnionCd(String crossSvcUnionCd) {
		this.crossSvcUnionCd = crossSvcUnionCd;
	}

	public long getScbMbrCntTot() {
		return scbMbrCntTot;
	}

	public void setScbMbrCntTot(long scbMbrCntTot) {
		this.scbMbrCntTot = scbMbrCntTot;
	}

	public long getScbMbrCntPush() {
		return scbMbrCntPush;
	}

	public String getLvNm() {
		return lvNm;
	}

	public void setLvNm(String lvNm) {
		this.lvNm = lvNm;
	}

	public String getFuncAgrClNm() {
		return funcAgrClNm;
	}

	public void setFuncAgrClNm(String funcAgrClNm) {
		this.funcAgrClNm = funcAgrClNm;
	}

	public void setScbMbrCntPush(long scbMbrCntPush) {
		this.scbMbrCntPush = scbMbrCntPush;
	}

	public long getScbMbrCntGeo() {
		return scbMbrCntGeo;
	}

	public void setScbMbrCntGeo(long scbMbrCntGeo) {
		this.scbMbrCntGeo = scbMbrCntGeo;
	}

	public long getScbMbrCntBle() {
		return scbMbrCntBle;
	}

	public void setScbMbrCntBle(long scbMbrCntBle) {
		this.scbMbrCntBle = scbMbrCntBle;
	}

	public long getActvMbrCntTot() {
		return actvMbrCntTot;
	}

	public void setActvMbrCntTot(long actvMbrCntTot) {
		this.actvMbrCntTot = actvMbrCntTot;
	}

	public long getActvMbrCntPush() {
		return actvMbrCntPush;
	}

	public void setActvMbrCntPush(long actvMbrCntPush) {
		this.actvMbrCntPush = actvMbrCntPush;
	}

	public long getActvMbrCntGeo() {
		return actvMbrCntGeo;
	}

	public void setActvMbrCntGeo(long actvMbrCntGeo) {
		this.actvMbrCntGeo = actvMbrCntGeo;
	}

	public long getActvMbrCntBle() {
		return actvMbrCntBle;
	}

	public void setActvMbrCntBle(long actvMbrCntBle) {
		this.actvMbrCntBle = actvMbrCntBle;
	}

	public long getMauCntTot() {
		return mauCntTot;
	}

	public void setMauCntTot(long mauCntTot) {
		this.mauCntTot = mauCntTot;
	}

	public long getMauCntPush() {
		return mauCntPush;
	}

	public void setMauCntPush(long mauCntPush) {
		this.mauCntPush = mauCntPush;
	}

	public long getMauCntGeo() {
		return mauCntGeo;
	}

	public void setMauCntGeo(long mauCntGeo) {
		this.mauCntGeo = mauCntGeo;
	}

	public long getMauCntBle() {
		return mauCntBle;
	}

	public void setMauCntBle(long mauCntBle) {
		this.mauCntBle = mauCntBle;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public long getTot() {
		return tot;
	}

	public void setTot(long tot) {
		this.tot = tot;
	}

	public long getOcb() {
		return ocb;
	}

	public void setOcb(long ocb) {
		this.ocb = ocb;
	}

	public long getOct() {
		return oct;
	}

	public void setOct(long oct) {
		this.oct = oct;
	}

	public long getSyr() {
		return syr;
	}

	public void setSyr(long syr) {
		this.syr = syr;
	}

	public long getTma() {
		return tma;
	}

	public void setTma(long tma) {
		this.tma = tma;
	}

	public long getTst() {
		return tst;
	}

	public void setTst(long tst) {
		this.tst = tst;
	}

	public long getEvs() {
		return evs;
	}

	public void setEvs(long evs) {
		this.evs = evs;
	}

	public String getBaseDt() {
		return baseDt;
	}

	public String getIntKeyClCd() {
		return intKeyClCd;
	}

	public String getCmplsCrossAgrClCd() {
		return cmplsCrossAgrClCd;
	}

	public String getSvcCd() {
		return svcCd;
	}

	public String getFuncAgrClCd() {
		return funcAgrClCd;
	}

	public long getScbMbrCnt() {
		return scbMbrCnt;
	}

	public long getActvMbrCnt() {
		return actvMbrCnt;
	}

	public long getMauCnt() {
		return mauCnt;
	}

	public String getOperDtm() {
		return operDtm;
	}

	public void setBaseDt(String baseDt) {
		this.baseDt = baseDt;
	}

	public void setIntKeyClCd(String intKeyClCd) {
		this.intKeyClCd = intKeyClCd;
	}

	public void setCmplsCrossAgrClCd(String cmplsCrossAgrClCd) {
		this.cmplsCrossAgrClCd = cmplsCrossAgrClCd;
	}

	public void setSvcCd(String svcCd) {
		this.svcCd = svcCd;
	}

	public void setFuncAgrClCd(String funcAgrClCd) {
		this.funcAgrClCd = funcAgrClCd;
	}

	public void setScbMbrCnt(int scbMbrCnt) {
		this.scbMbrCnt = scbMbrCnt;
	}

	public void setActvMbrCnt(int actvMbrCnt) {
		this.actvMbrCnt = actvMbrCnt;
	}

	public void setMauCnt(int mauCnt) {
		this.mauCnt = mauCnt;
	}

	public void setOperDtm(String operDtm) {
		this.operDtm = operDtm;
	}

	public String getSexCd() {
		return sexCd;
	}

	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}

	public String getAgeRngCd() {
		return ageRngCd;
	}

	public void setAgeRngCd(String ageRngCd) {
		this.ageRngCd = ageRngCd;
	}

}
