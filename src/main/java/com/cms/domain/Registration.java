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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="registration")
public class Registration implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8719433485080003372L;
	
	private int registrationId;
	
	private String name;
	
	private String userId;
	
	private String contactNumber;

	private Date joiningDate; 
	
	private Date regdate;

	private Date modification_date;
	
	private String gender;
	
	private LoginInfo log;
	
	//private Department department;
	
	private Set<Department> department = new HashSet<Department>();

	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(int registrationId) {
		this.registrationId = registrationId;
	}
		
	@Column(nullable=false)

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Column(nullable=false)
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	@Column(nullable=false)
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Column
	public Date getModification_date() {
		return modification_date;
	}

	public void setModification_date(Date modification_date) {
		this.modification_date = modification_date;
	}

	
	@Column(nullable=false)
	public Date getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	
	
	@Column(nullable= false)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column
	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	@OneToOne(fetch = FetchType.LAZY) 
    @JoinColumn(name="loginId" , referencedColumnName="loginId") 
	public LoginInfo getLog() {
		return log;
	}

	public void setLog(LoginInfo log) {
		this.log = log;
	}

	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	@JoinTable(name="reg_dept", joinColumns = { @JoinColumn(name="registrationId")}, inverseJoinColumns={@JoinColumn(name="departmentId")})
	
	//@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="registration") 
	public Set<Department> getDepartment() {
		return department;
	}

	public void setDepartment(Set<Department> department) {
		this.department = department;
	}

	
	/*@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="departmentId", referencedColumnName="departmentId")
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}*/
	
	


}

