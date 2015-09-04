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

	public String getLvNm() {
		return lvNm;
	}

	public void setLvNm(String lvNm) {
		this.lvNm = lvNm;
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

	public String getFuncAgrClCd() {
		return funcAgrClCd;
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

	public void setFuncAgrClCd(String funcAgrClCd) {
		this.funcAgrClCd = funcAgrClCd;
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
