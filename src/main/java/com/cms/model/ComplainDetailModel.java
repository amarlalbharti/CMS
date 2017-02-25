package com.cms.model;

import java.io.File;

import com.cms.domain.Application;
import com.cms.domain.AtLevel;
import com.cms.domain.Department;
import com.cms.domain.Module;

public class ComplainDetailModel {
	
	private int complainId;
	
	private String subject;
	
	private String remark;
	
	private AtLevel atLevel;
	
	private Module module;
	
	private Application application;
	
	private Department department;
	
	private File attachment;

	public int getComplainId() {
		return complainId;
	}

	public void setComplainId(int complainId) {
		this.complainId = complainId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public AtLevel getAtLevel() {
		return atLevel;
	}

	public void setAtLevel(AtLevel atLevel) {
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

	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

}
