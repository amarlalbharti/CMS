package com.cms.service;

import java.util.List;

import com.cms.domain.ComplainDetail;

public interface ComplainService {
	
	public int addComplainDetail(ComplainDetail complainDetail);
	
	public boolean editComplainDetail(ComplainDetail complainDetail);
	
	public ComplainDetail getComplainDetailById(int complainId);
	
	public List<ComplainDetail> getComplainList();

}
