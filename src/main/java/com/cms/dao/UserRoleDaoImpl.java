package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.UserRole;

@Repository
public class UserRoleDaoImpl implements UserRoleDao {

	@Autowired private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<UserRole> getUserRolesByUserid(String userid) {
		try{
		return this.sessionFactory.getCurrentSession().createCriteria(UserRole.class)
				.add(Restrictions.eq("log.userId", userid)).list();
		}
		catch(Exception ee)
		{
			ee.printStackTrace();
			return null;
		}
	}

	public boolean updateUserRole(UserRole role)
	{
		try 
		{
			this.sessionFactory.getCurrentSession().update(role);
			this.sessionFactory.getCurrentSession().flush();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
