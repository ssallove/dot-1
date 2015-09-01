package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

/**
 * 동의 모수
 * 
 * @author skplanet
 *
 */
public class CommCodeVO implements Serializable {

    private static final long serialVersionUID = 6222634385320712381L;
    
    private String lclCd; /* 대분류코드 */
    private String comCd; /* 공통코드 */
    private String cdNm; /* 코드명 */
    private String useYn; /* 사용여부 */
    private String cdRmk; /* 비고 */
    private int sortSeq; /* 정렬순서 */
    private String operDtm; /* 작업일시 */
    
	private String sido;
	private String sigungu;
	private String admDong;
	private String admDongCd;
	
	private String svcUnionNm;

    public String getSvcUnionNm() {
		return svcUnionNm;
	}
	public void setSvcUnionNm(String svcUnionNm) {
		this.svcUnionNm = svcUnionNm;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getAdmDong() {
		return admDong;
	}
	public void setAdmDong(String admDong) {
		this.admDong = admDong;
	}
	public String getAdmDongCd() {
		return admDongCd;
	}
	public void setAdmDongCd(String admDongCd) {
		this.admDongCd = admDongCd;
	}
	public String getLclCd() { return lclCd; }
    public String getComCd() { return comCd; }
    public String getCdNm() { return cdNm; }
    public String getUseYn() { return useYn; }
    public String getCdRmk() { return cdRmk; }
    public int getSortSeq() { return sortSeq; }
    public String getOperDtm() { return operDtm; }

    public void setLclCd(String lclCd) { this.lclCd = lclCd; }
    public void setComCd(String comCd) { this.comCd = comCd; }
    public void setCdNm(String cdNm) { this.cdNm = cdNm; }
    public void setUseYn(String useYn) { this.useYn = useYn; }
    public void setCdRmk(String cdRmk) { this.cdRmk = cdRmk; }
    public void setSortSeq(int sortSeq) { this.sortSeq = sortSeq; }
    public void setOperDtm(String operDtm) { this.operDtm = operDtm; }
    
    
}
