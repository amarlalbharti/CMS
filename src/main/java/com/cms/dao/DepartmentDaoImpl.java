package com.cms.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.Application;
import com.cms.domain.Department;
import com.cms.domain.Priority;
import com.cms.domain.Registration;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{
	
	@Autowired private SessionFactory sessionFactory;
	
	 public List<Department> getDepartments() {
			
		    return this.sessionFactory.getCurrentSession().createCriteria(Department.class).list();
		
	 }
	
	public List<Priority> getPriorityList() {
		
		 return this.sessionFactory.getCurrentSession().createCriteria(Priority.class).list();
	}

	public Department getDepartmentById(int deptId) {
		
		return (Department) this.sessionFactory.getCurrentSession().get(Department.class,deptId);
	}

	public boolean updateDepartment(Department department) {
		
		try {
			
			this.sessionFactory.getCurrentSession().update(department);
			this.sessionFactory.getCurrentSession().flush();
			return true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
	}

	public int addDepartment(Department department) {
		this.sessionFactory.getCurrentSession().save(department);
		this.sessionFactory.getCurrentSession().flush();
		return department.getDepartmentId();
	}

	/*public List<Department> getDepartmentByRegistrationId(int registrationId) {
	
		return this.sessionFactory.getCurrentSession().createCriteria(Department.class).add(Restrictions.);
	}*/

	

	
		
		

}
