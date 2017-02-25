package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.Application;
import com.cms.domain.Department;

@Repository
public class ApplicationDaoImpl implements ApplicationDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Application> getApplicationByDepartmentId(int deptId) {
		
		return this.sessionFactory.getCurrentSession().createCriteria(Application.class)
				.add(Restrictions.eq("department.departmentId", deptId)).list();
	}

	public Application getApplicationById(int applicationId) {
		
		return (Application) this.sessionFactory.getCurrentSession().get(Application.class, applicationId);
	}

	public List<Application> getApplicationList() {
		
		return this.sessionFactory.getCurrentSession().createCriteria(Application.class).list();
	}

	public int addApplication(Application application) {
		
		this.sessionFactory.getCurrentSession().save(application);
		this.sessionFactory.getCurrentSession().flush();
		return application.getApplicationId();
	}

	public boolean updateApplication(Application application) {
		try {
			
			this.sessionFactory.getCurrentSession().update(application);
			this.sessionFactory.getCurrentSession().flush();
			return true;
			
		} 
			catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
