package com.cms.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="logininfo")
public class LoginInfo implements Serializable
{
	
	private static final long serialVersionUID = 503239969044315259L;

	private int loginId;
	
	private String userId;
	
	private String password;
	
	private Date modification_date;
	
	private String forgotpwdid;
	
	private Date forgetpwdIdExp;
	
	private String isactive;
	
	private Registration registration;
	
	private Set<UserRole> roles = new HashSet();

	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getLoginId() {
		return loginId;
	}
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	
	
	@Column(nullable=false, unique=true)

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Column(nullable=false)
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column
	public Date getModification_date() {
		return modification_date;
	}
	public void setModification_date(Date modification_date) {
		this.modification_date = modification_date;
	}
	
	@Column
	public String getForgotpwdid() {
		return forgotpwdid;
	}
	public void setForgotpwdid(String forgotpwdid) {
		this.forgotpwdid = forgotpwdid;
	}
	
	@Column
	public Date getForgetpwdIdExp()
	{
		return forgetpwdIdExp;
	}
	public void setForgetpwdIdExp(Date forgetpwdIdExp)
	{
		this.forgetpwdIdExp = forgetpwdIdExp;
	}
	
	
	@Column(nullable=false)
	public String getIsactive() {
		return isactive;
	}
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}
	
	@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="userrole" )  
	public Set<UserRole> getRoles() {
		return roles;
	}
	public void setRoles(Set<UserRole> roles) {
		this.roles = roles;
	}
	
	
	@OneToOne(mappedBy="log")
    public Registration getRegistration() {
		return registration;
	}
	public void setRegistration(Registration registration) {
		this.registration = registration;
	}
	
}
