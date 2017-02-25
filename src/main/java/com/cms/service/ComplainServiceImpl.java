package com.cms.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.ComplainDao;
import com.cms.domain.ComplainDetail;

@Service
@Transactional
public class ComplainServiceImpl implements ComplainService{

	@Autowired private ComplainDao complainDao;
	
	public int addComplainDetail(ComplainDetail complainDetail) {
	
		return this.complainDao.addComplainDetail(complainDetail);
	}

	public boolean editComplainDetail(ComplainDetail complainDetail) {
		
		return this.complainDao.editComplainDetail(complainDetail);
	}

	public ComplainDetail getComplainDetailById(int complainId) {
		
		return this.complainDao.getComplainDetailById(complainId);
	}

	public List<ComplainDetail> getComplainList() {
		
		return this.complainDao.getComplainList();
	}

}
