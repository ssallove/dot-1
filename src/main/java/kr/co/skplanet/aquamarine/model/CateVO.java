package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

/**
 * 동의 모수
 * 
 * @author skplanet
 *
 */
public class CateVO implements Serializable {

    private static final long serialVersionUID = 6222634385320712381L;
	
	private String lv;
	private String funcAgrClCd;     /* 기능별동의구분코드 */
	private String tot;
	private String ocb;
	private String oct;
	private String syr;
	private String tma;
	private String tst;
	private String evs;
	
	private String syrGrp;
	private String ocbGrp;
	private String tmaGrp;
	private String octGrp;
	private String evsGrp;
	private String tstGrp;
	
	private String baseDt;
	private String intKeyClCd;
	private String cmplsCrossAgrClCd;
	private String svcUnionCd;
	private String periodClCd;
	private String cnctCtgCd;
	private String ctgNm;
	private String mainAcvtAdmDongCd;
	private String ageRngCd;
	private String sexCd;
	private long mbrCnt;
	private long totMbrCnt;
	private String ageRngNm;
	
	private String lCdNm;
	private String comCd;
	private String cdNm;
	private String svcCd;
	private String srcSvcCd;
	private String lCtgCd;
	private String cnctCtgNm;
	private String svcRank;
	
	private long pushMbrCnt;	/* push 동의 */
	private long bleMbrCnt;		/* ble 동의 */
	private long locMbrCnt;		/* 위치 동의 */

    private String ctgCd;
    private String lCtgNm;
    private String mCtgNm;
    private String sCtgNm;
    private String ctgType;

    private String srcCtgCd;
    private String srcLCtgNm;
    private String srcMCtgNm;
    private String srcSCtgNm;
    private String tgtCtgCd;
    private String tgtLCtgNm;
    private String tgtMCtgNm;
    private String tgtSCtgNm;
    private String confidence;
    private String weight;

    public String getSrcCtgCd() {
        return srcCtgCd;
    }

    public void setSrcCtgCd(String srcCtgCd) {
        this.srcCtgCd = srcCtgCd;
    }

    public String getSrcLCtgNm() {
        return srcLCtgNm;
    }

    public void setSrcLCtgNm(String srcLCtgNm) {
        this.srcLCtgNm = srcLCtgNm;
    }

    public String getSrcMCtgNm() {
        return srcMCtgNm;
    }

    public void setSrcMCtgNm(String srcMCtgNm) {
        this.srcMCtgNm = srcMCtgNm;
    }

    public String getSrcSCtgNm() {
        return srcSCtgNm;
    }

    public void setSrcSCtgNm(String srcSCtgNm) {
        this.srcSCtgNm = srcSCtgNm;
    }

    public String getTgtCtgCd() {
        return tgtCtgCd;
    }

    public void setTgtCtgCd(String tgtCtgCd) {
        this.tgtCtgCd = tgtCtgCd;
    }

    public String getTgtLCtgNm() {
        return tgtLCtgNm;
    }

    public void setTgtLCtgNm(String tgtLCtgNm) {
        this.tgtLCtgNm = tgtLCtgNm;
    }

    public String getTgtMCtgNm() {
        return tgtMCtgNm;
    }

    public void setTgtMCtgNm(String tgtMCtgNm) {
        this.tgtMCtgNm = tgtMCtgNm;
    }

    public String getTgtSCtgNm() {
        return tgtSCtgNm;
    }

    public void setTgtSCtgNm(String tgtSCtgNm) {
        this.tgtSCtgNm = tgtSCtgNm;
    }

    public String getConfidence() {
        return confidence;
    }

    public void setConfidence(String confidence) {
        this.confidence = confidence;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getlCdNm() {
        return lCdNm;
    }

    public void setlCdNm(String lCdNm) {
        this.lCdNm = lCdNm;
    }

    public String getCtgCd() {
        return ctgCd;
    }

    public void setCtgCd(String ctgCd) {
        this.ctgCd = ctgCd;
    }

    public String getmCtgNm() {
        return mCtgNm;
    }

    public void setmCtgNm(String mCtgNm) {
        this.mCtgNm = mCtgNm;
    }

    public String getsCtgNm() {
        return sCtgNm;
    }

    public void setsCtgNm(String sCtgNm) {
        this.sCtgNm = sCtgNm;
    }

    public String getCtgType() {
        return ctgType;
    }

    public void setCtgType(String ctgType) {
        this.ctgType = ctgType;
    }

    public String getlCtgCd() {
		return lCtgCd;
	}
	public void setlCtgCd(String lCtgCd) {
		this.lCtgCd = lCtgCd;
	}
	public String getlCtgNm() {
		return lCtgNm;
	}
	public void setlCtgNm(String lCtgNm) {
		this.lCtgNm = lCtgNm;
	}
	public String getCnctCtgNm() {
		return cnctCtgNm;
	}
	public void setCnctCtgNm(String cnctCtgNm) {
		this.cnctCtgNm = cnctCtgNm;
	}
	public String getSvcRank() {
		return svcRank;
	}
	public void setSvcRank(String svcRank) {
		this.svcRank = svcRank;
	}
	public String getSvcCd() {
		return svcCd;
	}
	public void setSvcCd(String svcCd) {
		this.svcCd = svcCd;
	}
	public String getComCd() {
		return comCd;
	}
	public void setComCd(String comCd) {
		this.comCd = comCd;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getOcbGrp() {
		return ocbGrp;
	}
	public void setOcbGrp(String ocbGrp) {
		this.ocbGrp = ocbGrp;
	}
	public String getOctGrp() {
		return octGrp;
	}
	public void setOctGrp(String octGrp) {
		this.octGrp = octGrp;
	}
	public String getSyrGrp() {
		return syrGrp;
	}
	public void setSyrGrp(String syrGrp) {
		this.syrGrp = syrGrp;
	}
	public String getTmaGrp() {
		return tmaGrp;
	}
	public void setTmaGrp(String tmaGrp) {
		this.tmaGrp = tmaGrp;
	}
	public String getTstGrp() {
		return tstGrp;
	}
	public void setTstGrp(String tstGrp) {
		this.tstGrp = tstGrp;
	}
	public String getEvsGrp() {
		return evsGrp;
	}
	public void setEvsGrp(String evsGrp) {
		this.evsGrp = evsGrp;
	}
	public String getCtgNm() {
		return ctgNm;
	}
	public void setCtgNm(String ctgNm) {
		this.ctgNm = ctgNm;
	}
	public String getAgeRngNm() {
		return ageRngNm;
	}
	public void setAgeRngNm(String ageRngNm) {
		this.ageRngNm = ageRngNm;
	}
	private String seq;
	private String mainArea;
    
	public long getTotMbrCnt() {
		return totMbrCnt;
	}
	public void setTotMbrCnt(long totMbrCnt) {
		this.totMbrCnt = totMbrCnt;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMainArea() {
		return mainArea;
	}
	public void setMainArea(String mainArea) {
		this.mainArea = mainArea;
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
	public String getSvcUnionCd() {
		return svcUnionCd;
	}
	public void setSvcUnionCd(String svcUnionCd) {
		this.svcUnionCd = svcUnionCd;
	}
	public String getPeriodClCd() {
		return periodClCd;
	}
	public void setPeriodClCd(String periodClCd) {
		this.periodClCd = periodClCd;
	}
	public String getCnctCtgCd() {
		return cnctCtgCd;
	}
	public void setCnctCtgCd(String cnctCtgCd) {
		this.cnctCtgCd = cnctCtgCd;
	}
	public String getMainAcvtAdmDongCd() {
		return mainAcvtAdmDongCd;
	}
	public void setMainAcvtAdmDongCd(String mainAcvtAdmDongCd) {
		this.mainAcvtAdmDongCd = mainAcvtAdmDongCd;
	}
	public String getAgeRngCd() {
		return ageRngCd;
	}
	public void setAgeRngCd(String ageRngCd) {
		this.ageRngCd = ageRngCd;
	}
	public String getSexCd() {
		return sexCd;
	}
	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}
	public long getMbrCnt() {
		return mbrCnt;
	}
	public void setMbrCnt(long mbrCnt) {
		this.mbrCnt = mbrCnt;
	}
	public String getFuncAgrClCd() {
		return funcAgrClCd;
	}
	public void setFuncAgrClCd(String funcAgrClCd) {
		this.funcAgrClCd = funcAgrClCd;
	}
	public String getLv() {
		return lv;
	}
	public void setLv(String lv) {
		this.lv = lv;
	}
	public String getTot() {
		return tot;
	}
	public void setTot(String tot) {
		this.tot = tot;
	}
	public String getOcb() {
		return ocb;
	}
	public void setOcb(String ocb) {
		this.ocb = ocb;
	}
	public String getOct() {
		return oct;
	}
	public void setOct(String oct) {
		this.oct = oct;
	}
	public String getSyr() {
		return syr;
	}
	public void setSyr(String syr) {
		this.syr = syr;
	}
	public String getTma() {
		return tma;
	}
	public void setTma(String tma) {
		this.tma = tma;
	}
	public String getTst() {
		return tst;
	}
	public void setTst(String tst) {
		this.tst = tst;
	}
	public String getEvs() {
		return evs;
	}
	public void setEvs(String evs) {
		this.evs = evs;
	}
	public long getPushMbrCnt() {
		return pushMbrCnt;
	}
	public void setPushMbrCnt(long pushMbrCnt) {
		this.pushMbrCnt = pushMbrCnt;
	}
	public long getBleMbrCnt() {
		return bleMbrCnt;
	}
	public void setBleMbrCnt(long bleMbrCnt) {
		this.bleMbrCnt = bleMbrCnt;
	}
	public long getLocMbrCnt() {
		return locMbrCnt;
	}
	public void setLocMbrCnt(long locMbrCnt) {
		this.locMbrCnt = locMbrCnt;
	}
	public String getSrcSvcCd() {
		return srcSvcCd;
	}
	public void setSrcSvcCd(String srcSvcCd) {
		this.srcSvcCd = srcSvcCd;
	}
	
	
	
    
}
