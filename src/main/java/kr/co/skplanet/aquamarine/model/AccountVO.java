package kr.co.skplanet.aquamarine.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 사용자 정보 VO
 * 
 * @author skplanet
 *
 */
public class AccountVO implements Serializable {

	private static final long serialVersionUID = 6222634385320712381L;

	public static final String GUEST_ROLE_ID = "G";
	public static final String MEMBER_ROLE_ID = "M";

	private String userId;
	private String roleId;
	private String userName;
	private String email;
	private String department;
	private String userAgent;
	private String remoteIp;
	private long lastActionTimeMillis;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getRemoteIp() {
		return remoteIp;
	}

	public void setRemoteIp(String remoteIp) {
		this.remoteIp = remoteIp;
	}

	public long getLastActionTimeMillis() {
		return lastActionTimeMillis;
	}

	public void setLastActionTimeMillis(long lastActionTimeMillis) {
		this.lastActionTimeMillis = lastActionTimeMillis;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	@JsonIgnore
	public boolean isGuest() {
		return roleId.equals(GUEST_ROLE_ID);
	}
}
