package com.cms.model;

import com.cms.domain.Application;
import com.cms.domain.Department;
import com.cms.domain.Registration;

public class ProjectAdminModel {
	
	private int projectAdminId;
	
	private String projectAdminDesc;
	
	private Registration registration;
	
	private Application application;
	
	private Department department;

	public int getProjectAdminId() {
		return projectAdminId;
	}

	public void setProjectAdminId(int projectAdminId) {
		this.projectAdminId = projectAdminId;
	}

	public String getProjectAdminDesc() {
		return projectAdminDesc;
	}

	public void setProjectAdminDesc(String projectAdminDesc) {
		this.projectAdminDesc = projectAdminDesc;
	}

	public Registration getRegistration() {
		return registration;
	}

	public void setRegistration(Registration registration) {
		this.registration = registration;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


	
}
