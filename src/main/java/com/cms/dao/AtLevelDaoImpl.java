package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.AtLevel;

@Repository
public class AtLevelDaoImpl implements AtLevelDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<AtLevel> getProcessList() {
		
		return this.sessionFactory.getCurrentSession().createCriteria(AtLevel.class).list();
	}

	public AtLevel getProcessById(int levelId) {
		
		return (AtLevel) this.sessionFactory.getCurrentSession().get(AtLevel.class, levelId);
	}

	public int addProcess(AtLevel atLevel) {
		
		this.sessionFactory.getCurrentSession().save(atLevel);
		this.sessionFactory.getCurrentSession().flush();
		return atLevel.getLevelId();
	}

	public boolean updateProcess(AtLevel atLevel) {
	
		try {
		
		this.sessionFactory.getCurrentSession().update(atLevel);
		this.sessionFactory.getCurrentSession().flush();
		return true;
		} 
	    catch (Exception e) {
		e.printStackTrace();
		return false;
	}

}
	
	@SuppressWarnings("unchecked")
	public List<AtLevel> getProcessByModuleId(int moduleId) {
		
		return this.sessionFactory.getCurrentSession().createCriteria(AtLevel.class)
				.add(Restrictions.eq("module.moduleId", moduleId)).list();
		
	}

}
