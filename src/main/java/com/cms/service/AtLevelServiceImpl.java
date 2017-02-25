package com.cms.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.AtLevelDao;
import com.cms.domain.AtLevel;

@Service
@Transactional
public class AtLevelServiceImpl implements AtLevelService{

	@Autowired 
	private AtLevelDao atLevelDao;
	
	public List<AtLevel> getProcessList() {
		
		return this.atLevelDao.getProcessList();
	}

	public AtLevel getProcessById(int levelId) {
		
		return this.atLevelDao.getProcessById(levelId);
	}

	public int addProcess(AtLevel atLevel) {
		
		return this.atLevelDao.addProcess(atLevel);
	}

	public boolean updateProcess(AtLevel atLevel) {
		
		return this.atLevelDao.updateProcess(atLevel);
	}

public List<AtLevel> getProcessByModuleId(int moduleId) {
		
		return this.atLevelDao.getProcessByModuleId(moduleId);
	}
}
