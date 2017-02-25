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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

@Entity
@Table(name="department")
public class Department implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 3993793370221922782L;

	private int departmentId;
	
	private String departmentName;
	
	private Date createDate;
	
	private Date updatedDate;
	
	private Set<Registration> registration = new HashSet<Registration>();
	//private Set<Application> application = new HashSet<Application>();
	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	@Column(nullable=false)
	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Column
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	

	
	/*@OneToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="department" ) 
	public Set<Application> getApplication() {
		return application;
	}

	public void setApplication(Set<Application> application) {
		this.application = application;
	}*/
	

	//@ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	//@JoinTable(name="reg_dept", joinColumns = { @JoinColumn(name="departmentId")}, inverseJoinColumns={@JoinColumn(name="registrationId")})
	@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="department")
	public Set<Registration> getRegistration() {
		return registration;
	}

	public void setRegistration(Set<Registration> registration) {
		this.registration = registration;
	}
	
	
}
