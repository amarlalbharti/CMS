package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.AtLevel;
import com.cms.domain.Module;


@Repository
public class ModuleDaoImpl implements ModuleDao{

	
	@Autowired 
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Module> getModuleByAppId(int appId) {
		
		return this.sessionFactory.getCurrentSession().createCriteria(Module.class)
				.add(Restrictions.eq("application.applicationId", appId)).list();
	}

	public Module getModuleById(int moduleId) {
		
		return (Module) this.sessionFactory.getCurrentSession().get(Module.class, moduleId);
	}

	public List<Module> getModuleList() {
		
		return this.sessionFactory.getCurrentSession().createCriteria(Module.class).list();
	}

	public int addModule(Module module) {
		
		this.sessionFactory.getCurrentSession().save(module);
		this.sessionFactory.getCurrentSession().flush();
		return module.getModuleId();
	}

	public boolean updateModule(Module module) {
		
	try {
		
		this.sessionFactory.getCurrentSession().update(module);
		this.sessionFactory.getCurrentSession().flush();
		return true;
		
	} catch (Exception e) {
	    e.printStackTrace();
		return false;
	}
	
}

}
