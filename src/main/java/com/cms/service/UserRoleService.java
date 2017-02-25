package com.cms.service;

import java.util.List;

import com.cms.domain.UserRole;

public interface UserRoleService {
	public List<UserRole> getUserRolesByUserid(String userid);
	
	public boolean updateUserRole(UserRole role);
}
