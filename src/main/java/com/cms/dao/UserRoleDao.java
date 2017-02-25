package com.cms.dao;

import java.util.List;

import com.cms.domain.UserRole;

public interface UserRoleDao {
	
	public List<UserRole> getUserRolesByUserid(String userid);
	
	public boolean updateUserRole(UserRole role);
	
}
