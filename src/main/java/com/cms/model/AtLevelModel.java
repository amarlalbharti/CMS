package com.cms.model;

import com.cms.domain.Application;
import com.cms.domain.Department;
import com.cms.domain.Module;

public class AtLevelModel {
	
	private int levelId;
	
	private String atLevel;
	
	private Module module;
	
	private Application application;
	
	private Department department;

	
	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

		
	public String getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(String atLevel) {
		this.atLevel = atLevel;
	}

	
	
	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
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
