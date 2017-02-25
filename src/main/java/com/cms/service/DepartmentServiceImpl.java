package com.cms.service;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cms.dao.DepartmentDao;
import com.cms.domain.Department;
import com.cms.domain.Priority;


@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired private DepartmentDao departmentDao;
	
public List<Department> getDepartments() {
		
		return this.departmentDao.getDepartments();
	}

public List<Priority> getPriorityList() {
	
	return this.departmentDao.getPriorityList();
}

public Department getDepartmentById(int deptId) {
	
	return this.departmentDao.getDepartmentById(deptId);
}

public boolean updateDepartment(Department department) {
	
	return this.departmentDao.updateDepartment(department);
}

public int addDepartment(Department department) {

	return this.departmentDao.addDepartment(department);
}

}
