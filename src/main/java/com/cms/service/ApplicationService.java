package com.cms.service;

import java.util.List;

import com.cms.domain.Application;
import com.cms.domain.Department;

public interface ApplicationService {
	
	public List<Application> getApplicationByDepartmentId(int deptId);
	
	public Application getApplicationById(int applicationId);
	
	public List<Application> getApplicationList();
	
	public int addApplication(Application application);
	
	public boolean updateApplication(Application application);
	
}
