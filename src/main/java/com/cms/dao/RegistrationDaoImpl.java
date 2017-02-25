package com.cms.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.config.Roles;
import com.cms.domain.Application;
import com.cms.domain.Registration;
import com.cms.domain.UserRole;

@Repository
public class RegistrationDaoImpl implements RegistrationDao
{
	@Autowired private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public Registration getRegistrationByUserid(String userid)
	{
		List<Registration> list = this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				.createAlias("log", "logAlias")
				.add(Restrictions.eq("logAlias.userId", userid))
				.setFetchMode("log", FetchMode.JOIN)
				.list();
		if(!list.isEmpty())
		{
			return list.get(0);
		}
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Registration> getAdminByDepartmentId(int deptId) {
		return this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				//.add(Restrictions.eq("log.userrole", Roles.ROLE_ADMIN.toString()))
				.add(Restrictions.eq("department.departmentId", deptId))
				//.setFetchMode("log", FetchMode.JOIN)
				.list();
	
	}


	public Registration getRegistrationById(int regId) {
	
		return (Registration) this.sessionFactory.getCurrentSession().get(Registration.class, regId);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Registration> getRegistrationList()
	{
		return this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				.addOrder(Order.desc("regdate"))
				.setFetchMode("log", FetchMode.JOIN)
				.list();
	}
	
	public boolean updateRegistration(Registration registration)
	{
		try 
		{
			this.sessionFactory.getCurrentSession().update(registration);
			this.sessionFactory.getCurrentSession().flush();
			return true;
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<Registration> getEmpRegistrationList() {
		
		List<UserRole> list = this.sessionFactory.getCurrentSession().createCriteria(UserRole.class)
                .add(Restrictions.or(Restrictions.eq("userrole", Roles.ROLE_ADMIN.toString()),Restrictions.eq("userrole", Roles.ROLE_APPADMIN.toString()),Restrictions.eq("userrole", Roles.ROLE_DEPT.toString())))
                .list();
        List<String> rl = new ArrayList<String>();
        for(UserRole role : list)
        {
            rl.add(role.getLog().getUserId());
        }
        
        return this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
                .add(Restrictions.not(Restrictions.in("userId",rl)))
                .createAlias("log", "logalias")
                .add(Restrictions.eq("logalias.isactive", "true"))
                .addOrder(Order.desc("regdate"))
                .setFetchMode("log", FetchMode.JOIN)
                .list();
	}
	
	/*public long countEmployees()
	{
		return (Long)this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.setProjection(Projections.rowCount())
				.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public long countUserEmployees()
	{
		List<UserRole> list = this.sessionFactory.getCurrentSession().createCriteria(UserRole.class)
                .add(Restrictions.or(Restrictions.eq("userrole", Roles.ROLE_ADMIN.toString()),Restrictions.eq("userrole", Roles.ROLE_MANAGER.toString())))
                .list();
        List<String> rl = new ArrayList<String>();
        for(UserRole role : list)
        {
            rl.add(role.getLog().getUserId());
        }
		return (Long)this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				.add(Restrictions.not(Restrictions.in("userId",rl)))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.setProjection(Projections.rowCount())
				.uniqueResult();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Registration> getEmpRegistrationListByCountry(int countryId)
	{
		List<UserRole> list = this.sessionFactory.getCurrentSession().createCriteria(UserRole.class)
                
				.add(Restrictions.or(Restrictions.eq("userrole", Roles.ROLE_ADMIN.toString()),Restrictions.eq("userrole", Roles.ROLE_MANAGER.toString())))
                .list();
        List<String> rl = new ArrayList<String>();
        for(UserRole role : list)
        {
            rl.add(role.getLog().getUserId());
        }
        
        return this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
        		.createAlias("branch", "branchAlias")
        		.createAlias("branchAlias.country", "countryAlias")
        		
                .add(Restrictions.not(Restrictions.in("userid",rl)))
                .add(Restrictions.eq("country.countryId", countryId))
                .setFetchMode("log", FetchMode.JOIN)
                .list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Registration> getEmpRegistrationListByBranch(int branchId)
	{
		List<UserRole> list = this.sessionFactory.getCurrentSession().createCriteria(UserRole.class)
				.add(Restrictions.or(Restrictions.eq("userrole", Roles.ROLE_ADMIN.toString()),Restrictions.eq("userrole", Roles.ROLE_MANAGER.toString())))
                .list();
        List<String> rl = new ArrayList<String>();
        for(UserRole role : list)
        {
            rl.add(role.getLog().getUserId());
        }
        
        return this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
        		.add(Restrictions.eq("branch.branchId", branchId))
                .add(Restrictions.not(Restrictions.in("userid",rl)))
                .setFetchMode("log", FetchMode.JOIN)
                .list();
	}

	@SuppressWarnings("unchecked")
	public List<Registration> searchEmp(String text)
	{
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.like("userId", "%" + text + "%"));
		or.add(Restrictions.like("name", "%" + text + "%"));
		or.add(Restrictions.like("gender",text+"%"));
		
		return this.sessionFactory.getCurrentSession().createCriteria(Registration.class).add(or).setMaxResults(5)
				.setFetchMode("log", FetchMode.JOIN).list();
	}
	
	@SuppressWarnings("unchecked")
	public Registration getRegistrationByEid(String eid)
	{
		List<Registration> list = this.sessionFactory.getCurrentSession().createCriteria(Registration.class)
				.add(Restrictions.eq("eId", eid))
				.setMaxResults(1)
				.list();
		
		if(list != null && !list.isEmpty())
		{
			return list.get(0);
		}
		return null;
		
	}
*/
	
}
