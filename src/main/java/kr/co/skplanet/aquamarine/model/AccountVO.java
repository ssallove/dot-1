package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 사용자 정보 VO
 * 
 * @author skplanet
 *
 */
public class AccountVO implements Serializable {

    private static final long serialVersionUID = 6222634385320712381L;
    
    private String user_no;
    private String user_nm;
    private String passwd;
    private String fullname;
    private String email;
    private String team;
    private String scrb_stat_cd;
    private String scrb_stat_nm;
    private String scrb_desc;    
    private String mobile;
    private String user_cl_cd;
    private String scrb_dt;
    private String term_dt;
    private String oper_dtm;
    private String admin_yn;
    private int rnum;
    private int user_cnt;
    
    private String id;
    private String pw;
    private String status;
    
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUser_no() {
		return user_no;
	}


	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}


	public String getUser_nm() {
		return user_nm;
	}


	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTeam() {
		return team;
	}


	public void setTeam(String team) {
		this.team = team;
	}


	public String getScrb_stat_cd() {
		return scrb_stat_cd;
	}


	public void setScrb_stat_cd(String scrb_stat_cd) {
		this.scrb_stat_cd = scrb_stat_cd;
	}


	public String getScrb_stat_nm() {
		return scrb_stat_nm;
	}


	public void setScrb_stat_nm(String scrb_stat_nm) {
		this.scrb_stat_nm = scrb_stat_nm;
	}


	public String getScrb_desc() {
		return scrb_desc;
	}


	public void setScrb_desc(String scrb_desc) {
		this.scrb_desc = scrb_desc;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getUser_cl_cd() {
		return user_cl_cd;
	}


	public void setUser_cl_cd(String user_cl_cd) {
		this.user_cl_cd = user_cl_cd;
	}


	public String getScrb_dt() {
		return scrb_dt;
	}


	public void setScrb_dt(String scrb_dt) {
		this.scrb_dt = scrb_dt;
	}


	public String getTerm_dt() {
		return term_dt;
	}


	public void setTerm_dt(String term_dt) {
		this.term_dt = term_dt;
	}


	public String getOper_dtm() {
		return oper_dtm;
	}


	public void setOper_dtm(String oper_dtm) {
		this.oper_dtm = oper_dtm;
	}


	public String getAdmin_yn() {
		return admin_yn;
	}


	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getUser_cnt() {
		return user_cnt;
	}


	public void setUser_cnt(int user_cnt) {
		this.user_cnt = user_cnt;
	}


	public String toString() {
    	return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }   
}
