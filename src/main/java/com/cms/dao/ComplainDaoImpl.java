package com.cms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cms.domain.ComplainDetail;

@Repository
public class ComplainDaoImpl implements ComplainDao{

	@Autowired private SessionFactory sessionFactory;
	
	public int addComplainDetail(ComplainDetail complainDetail) {
		
		this.sessionFactory.getCurrentSession().save(complainDetail);
		this.sessionFactory.getCurrentSession().flush();
		return complainDetail.getComplainId();
	}

	public boolean editComplainDetail(ComplainDetail complainDetail) {
		try {
			
			this.sessionFactory.getCurrentSession().save(complainDetail);
			this.sessionFactory.getCurrentSession().flush();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public ComplainDetail getComplainDetailById(int complainId) {
		
		return (ComplainDetail) this.sessionFactory.getCurrentSession().get(ComplainDetail.class, complainId);
	}

	public List<ComplainDetail> getComplainList() {
		
		return this.sessionFactory.getCurrentSession().createCriteria(ComplainDetail.class).list();
	}

}
