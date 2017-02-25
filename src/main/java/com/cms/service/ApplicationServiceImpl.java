package com.cms.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.ApplicationDao;
import com.cms.domain.Application;
import com.cms.domain.Department;


@Service
@Transactional
public class ApplicationServiceImpl implements ApplicationService{

	
	@Autowired
	private ApplicationDao applicationDao;
	
	public List<Application> getApplicationByDepartmentId(int deptId) {
		
		return this.applicationDao.getApplicationByDepartmentId(deptId);
	}

	public Application getApplicationById(int applicationId) {
	
		return this.applicationDao.getApplicationById(applicationId);
	}

	public List<Application> getApplicationList() {
		
		return this.applicationDao.getApplicationList();
	}

	public int addApplication(Application application) {
		
		return this.applicationDao.addApplication(application);
	}

	public boolean updateApplication(Application application) {
		
		return this.applicationDao.updateApplication(application);
	}

	

}
