package com.cms.dao;

import java.util.List;

import com.cms.domain.Application;


public interface ApplicationDao {
	
	
	public List<Application> getApplicationByDepartmentId(int deptId);
	
	public Application getApplicationById(int applicationId);
	
	public List<Application> getApplicationList();
	
	public int addApplication(Application application);
	
	public boolean updateApplication(Application application);
	
}
