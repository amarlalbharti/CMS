package com.cms.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.ProjectAdmin;

@Repository
public class ProjectAdminDaoImpl implements ProjectAdminDao{

	@Autowired private SessionFactory sessionFactory;
	
	public int addProjectAdmin(ProjectAdmin projectAdmin) {
		this.sessionFactory.getCurrentSession().save(projectAdmin);
		this.sessionFactory.getCurrentSession().flush();
		return projectAdmin.getProjectAdminId();
	}
	
	

}
