package com.cms.service;

import java.util.List;

import com.cms.domain.Department;
import com.cms.domain.Priority;

public interface DepartmentService {

	public List<Department> getDepartments();
	
	public Department getDepartmentById(int deptId);
	
	public boolean updateDepartment(Department department);
	
	public int addDepartment(Department department);

	public List<Priority> getPriorityList();
	
	
}
