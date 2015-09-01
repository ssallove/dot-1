package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

/**
 * 동의 모수
 * 
 * @author skplanet
 *
 */
public class AreaVO implements Serializable {
    
    private static final long serialVersionUID = 6222634385320712381L;
    
    private String baseDt;
    private String intKeyClCd;
    private String cmplsCrossAgrClCd;
    private String funcAgrClCd;
    private String periodClCd;
    private String mainAcvtDongNm;
    private String mosu;
    private String push;
    private String seq;
    private String mainAcvtAdmDongCd;
    private String sexCd;
    private String mbrCnt;
    private String ageRngCd;
    private String ctgNm;
    private String admDong;
    private String ageRngNm;
    private String totMbrCnt;
    private String admDongNm;
    private String joinAreaAdmDongCd;
    private String hBarLeft;
    private String hBarRight;
    /* 주활동지역 AR POC 사용변수 다른 변수들하고 짬뽕되서 주석을 달아서 구분하기 위해 기입.*/
    private String mainAdmDongCd;
    private String mainSido;
    private String mainSigungu;
    private String mainAdmDong;
    private String crossAdmDongCd;
    private String crossSido;
    private String crossSigungu;
    private String crossAdmDong;
    private String mainMbrCnt;
    private String mainMbrCntOfCorss;
    private String confidence;
    private String rn;
    
    public String getMainAdmDongCd() {
        return mainAdmDongCd;
    }

    public void setMainAdmDongCd(String mainAdmDongCd) {
        this.mainAdmDongCd = mainAdmDongCd;
    }

    public String getMainSido() {
        return mainSido;
    }

    public void setMainSido(String mainSido) {
        this.mainSido = mainSido;
    }

    public String getMainSigungu() {
        return mainSigungu;
    }

    public void setMainSigungu(String mainSigungu) {
        this.mainSigungu = mainSigungu;
    }

    public String getMainAdmDong() {
        return mainAdmDong;
    }

    public void setMainAdmDong(String mainAdmDong) {
        this.mainAdmDong = mainAdmDong;
    }

    public String getCrossAdmDongCd() {
        return crossAdmDongCd;
    }

    public void setCrossAdmDongCd(String crossAdmDongCd) {
        this.crossAdmDongCd = crossAdmDongCd;
    }

    public String getCrossSido() {
        return crossSido;
    }

    public void setCrossSido(String crossSido) {
        this.crossSido = crossSido;
    }

    public String getCrossSigungu() {
        return crossSigungu;
    }

    public void setCrossSigungu(String crossSigungu) {
        this.crossSigungu = crossSigungu;
    }

    public String getCrossAdmDong() {
        return crossAdmDong;
    }

    public void setCrossAdmDong(String crossAdmDong) {
        this.crossAdmDong = crossAdmDong;
    }

    public String getMainMbrCnt() {
        return mainMbrCnt;
    }

    public void setMainMbrCnt(String mainMbrCnt) {
        this.mainMbrCnt = mainMbrCnt;
    }

    public String getMainMbrCntOfCorss() {
        return mainMbrCntOfCorss;
    }

    public void setMainMbrCntOfCorss(String mainMbrCntOfCorss) {
        this.mainMbrCntOfCorss = mainMbrCntOfCorss;
    }

    public String getConfidence() {
        return confidence;
    }

    public void setConfidence(String confidence) {
        this.confidence = confidence;
    }

    public String getRn() {
        return rn;
    }

    public void setRn(String rn) {
        this.rn = rn;
    }
    /* 주활동지역 AR POC 사용변수 다른 변수들하고 짬뽕되서 주석을 달아서 구분하기 위해 기입.*/
    public String gethBarRight() {
        return hBarRight;
    }
    
    public void sethBarRight(String hBarRight) {
        this.hBarRight = hBarRight;
    }
    
    private String hBarTotal;
    private String leftTooltip;
    private String rightTooltip;
    private String totalTooltip;
    
    public String gethBarLeft() {
        return hBarLeft;
    }
    
    public void sethBarLeft(String hBarLeft) {
        this.hBarLeft = hBarLeft;
    }
    
    public String gethBarTotal() {
        return hBarTotal;
    }
    
    public void sethBarTotal(String hBarTotal) {
        this.hBarTotal = hBarTotal;
    }
    
    public String getLeftTooltip() {
        return leftTooltip;
    }
    
    public void setLeftTooltip(String leftTooltip) {
        this.leftTooltip = leftTooltip;
    }
    
    public String getRightTooltip() {
        return rightTooltip;
    }
    
    public void setRightTooltip(String rightTooltip) {
        this.rightTooltip = rightTooltip;
    }
    
    public String getTotalTooltip() {
        return totalTooltip;
    }
    
    public void setTotalTooltip(String totalTooltip) {
        this.totalTooltip = totalTooltip;
    }
    
    public String getJoinAreaAdmDongCd() {
        return joinAreaAdmDongCd;
    }
    
    public void setJoinAreaAdmDongCd(String joinAreaAdmDongCd) {
        this.joinAreaAdmDongCd = joinAreaAdmDongCd;
    }
    
    public String getAdmDongNm() {
        return admDongNm;
    }
    
    public void setAdmDongNm(String admDongNm) {
        this.admDongNm = admDongNm;
    }
    
    public String getAgeRngNm() {
        return ageRngNm;
    }
    
    public void setAgeRngNm(String ageRngNm) {
        this.ageRngNm = ageRngNm;
    }
    
    public String getTotMbrCnt() {
        return totMbrCnt;
    }
    
    public void setTotMbrCnt(String totMbrCnt) {
        this.totMbrCnt = totMbrCnt;
    }
    
    public String getBaseDt() {
        return baseDt;
    }
    
    public void setBaseDt(String baseDt) {
        this.baseDt = baseDt;
    }
    
    public String getIntKeyClCd() {
        return intKeyClCd;
    }
    
    public void setIntKeyClCd(String intKeyClCd) {
        this.intKeyClCd = intKeyClCd;
    }
    
    public String getCmplsCrossAgrClCd() {
        return cmplsCrossAgrClCd;
    }
    
    public void setCmplsCrossAgrClCd(String cmplsCrossAgrClCd) {
        this.cmplsCrossAgrClCd = cmplsCrossAgrClCd;
    }
    
    public String getFuncAgrClCd() {
        return funcAgrClCd;
    }
    
    public void setFuncAgrClCd(String funcAgrClCd) {
        this.funcAgrClCd = funcAgrClCd;
    }
    
    public String getPeriodClCd() {
        return periodClCd;
    }
    
    public void setPeriodClCd(String periodClCd) {
        this.periodClCd = periodClCd;
    }
    
    public String getMainAcvtDongNm() {
        return mainAcvtDongNm;
    }
    
    public void setMainAcvtDongNm(String mainAcvtDongNm) {
        this.mainAcvtDongNm = mainAcvtDongNm;
    }
    
    public String getMosu() {
        return mosu;
    }
    
    public void setMosu(String mosu) {
        this.mosu = mosu;
    }
    
    public String getPush() {
        return push;
    }
    
    public void setPush(String push) {
        this.push = push;
    }
    
    public String getSeq() {
        return seq;
    }
    
    public void setSeq(String seq) {
        this.seq = seq;
    }
    
    public String getMainAcvtAdmDongCd() {
        return mainAcvtAdmDongCd;
    }
    
    public void setMainAcvtAdmDongCd(String mainAcvtAdmDongCd) {
        this.mainAcvtAdmDongCd = mainAcvtAdmDongCd;
    }
    
    public String getSexCd() {
        return sexCd;
    }
    
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }
    
    public String getMbrCnt() {
        return mbrCnt;
    }
    
    public void setMbrCnt(String mbrCnt) {
        this.mbrCnt = mbrCnt;
    }
    
    public String getAgeRngCd() {
        return ageRngCd;
    }
    
    public void setAgeRngCd(String ageRngCd) {
        this.ageRngCd = ageRngCd;
    }
    
    public String getCtgNm() {
        return ctgNm;
    }
    
    public void setCtgNm(String ctgNm) {
        this.ctgNm = ctgNm;
    }
    
    public String getAdmDong() {
        return admDong;
    }
    
    public void setAdmDong(String admDong) {
        this.admDong = admDong;
    }
}
