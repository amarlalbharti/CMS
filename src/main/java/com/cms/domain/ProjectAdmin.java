package com.cms.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="projectadmin")
public class ProjectAdmin implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3287906144499083932L;

	private int projectAdminId;
	
	private String projectAdminDesc;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private Registration registration;
	
	private Application application;

	
	@Id
	@Column(nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getProjectAdminId() {
		return projectAdminId;
	}

	public void setProjectAdminId(int projectAdminId) {
		this.projectAdminId = projectAdminId;
	}

	@Column
	public String getProjectAdminDesc() {
		return projectAdminDesc;
	}

	public void setProjectAdminDesc(String projectAdminDesc) {
		this.projectAdminDesc = projectAdminDesc;
	}

	@Column
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	
	@ManyToOne(cascade=CascadeType.ALL) 
	@JoinColumn(name="registrationId", referencedColumnName="registrationId")
	public Registration getRegistration() {
		return registration;
	}

	public void setRegistration(Registration registration) {
		this.registration = registration;
	}

	
	@ManyToOne(cascade=CascadeType.ALL) 
	@JoinColumn(name="applicationId", referencedColumnName="applicationId")
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

}
