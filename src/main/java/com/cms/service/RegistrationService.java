package com.cms.service;

import java.util.List;

import com.cms.domain.Registration;

public interface RegistrationService 
{
	public Registration getRegistrationByUserid(String userid);
	
	public String getRandomPassword();
	
	public List<Registration> getAdminByDepartmentId(int deptId);
	
	public Registration getRegistrationById(int regId);
	
	public boolean updateRegistration(Registration registration);
	
	public List<Registration> getRegistrationList();
	
	public List<Registration> getEmpRegistrationList();
	
	/*public long countEmployees();
	
	public long countOnlyEmployees();
		
	public List<Registration> getEmpRegistrationListByCountry(int countryId);
	
	public List<Registration> getEmpRegistrationListByBranch(int branchId);
	
	public List<Registration> searchEmp(String text);
	
	public Registration getRegistrationByEid(String eid);*/
	
	
}
