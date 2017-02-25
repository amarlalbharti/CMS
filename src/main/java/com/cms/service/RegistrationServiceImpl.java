package com.cms.service;

import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.RegistrationDao;
import com.cms.domain.Registration;

@Service
@Transactional
public class RegistrationServiceImpl implements RegistrationService
{
	@Autowired private RegistrationDao registrationDao;
	
	public Registration getRegistrationByUserid(String userid)
	{
		return this.registrationDao.getRegistrationByUserid(userid);
	}
	
	
	public String getRandomPassword() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz@#$%&*()";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }


	public List<Registration> getAdminByDepartmentId(int deptId) {
		
		return this.registrationDao.getAdminByDepartmentId(deptId);
	}


	public Registration getRegistrationById(int regId) {
	
		return this.registrationDao.getRegistrationById(regId);
	}
	
	/**
	 * Returns the list of object of registration class
	 * @return
	 */
	public List<Registration> getRegistrationList()
	{
		return this.registrationDao.getRegistrationList();
	}
	
	
	public boolean updateRegistration(Registration registration)
	{
		return this.registrationDao.updateRegistration(registration);
	}
	
	public List<Registration> getEmpRegistrationList() {
		return this.registrationDao.getEmpRegistrationList();
	}
	
	/*	public long countEmployees()
	{
		return this.registrationDao.countEmployees();
	}
	
	

	public long countOnlyEmployees() 
	{
		return this.registrationDao.countUserEmployees();
	}

	public List<Registration> getEmpRegistrationListByCountry(int countryId)
	{
		return this.registrationDao.getEmpRegistrationListByCountry(countryId);
	}
	
	public List<Registration> getEmpRegistrationListByBranch(int branchId)
	{
		return this.registrationDao.getEmpRegistrationListByBranch(branchId);
	}
	
	public List<Registration> searchEmp(String text)
	{
		return this.registrationDao.searchEmp(text);
	}
	public Registration getRegistrationByEid(String eid)
	{
		return this.registrationDao.getRegistrationByEid(eid);
	}*/
	
}
