package com.cms.dao;

import java.util.List;

import com.cms.domain.ComplainDetail;

public interface ComplainDao {

	public int addComplainDetail(ComplainDetail complainDetail);
	
	public boolean editComplainDetail(ComplainDetail complainDetail);
	
	public ComplainDetail getComplainDetailById(int complainId);
	
	public List<ComplainDetail> getComplainList();
	
	
	
}
