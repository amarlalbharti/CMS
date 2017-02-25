package com.cms.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.ProjectAdminDao;
import com.cms.domain.ProjectAdmin;

@Service
@Transactional

public class ProjectAdminServiceImpl implements ProjectAdminService{

	@Autowired private ProjectAdminDao projectAdminDao;
	
	public int addProjectAdmin(ProjectAdmin projectAdmin) {
		
		return this.projectAdminDao.addProjectAdmin(projectAdmin);
	}

}
