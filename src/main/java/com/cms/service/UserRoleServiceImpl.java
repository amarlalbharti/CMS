package com.cms.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.UserRoleDao;
import com.cms.domain.UserRole;

@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired private UserRoleDao userRoleDao;
	
	public List<UserRole> getUserRolesByUserid(String userid) {
		return userRoleDao.getUserRolesByUserid(userid);
	}

	public boolean updateUserRole(UserRole role)
	{
		return userRoleDao.updateUserRole(role);
	}
}
