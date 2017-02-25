package com.cms.dao;

import java.util.List;

import com.cms.domain.Application;
import com.cms.domain.Department;
import com.cms.domain.Priority;
import com.cms.domain.Registration;

public interface DepartmentDao {
	
	public List<Department> getDepartments();
	
	public Department getDepartmentById(int deptId);
	
	public boolean updateDepartment(Department department);
	
	public int addDepartment(Department department);
	
	//public List<Department> getDepartmentByRegistrationId(int registrationId);
	
	public List<Priority> getPriorityList();
	
	

}
