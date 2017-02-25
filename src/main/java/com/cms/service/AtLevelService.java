package com.cms.service;

import java.util.List;

import com.cms.domain.AtLevel;

public interface AtLevelService {

	
	public List<AtLevel> getProcessList();
	
	public AtLevel getProcessById(int levelId);
	
	public int addProcess(AtLevel atLevel);
	
	public boolean updateProcess(AtLevel atLevel);
	
	public List<AtLevel> getProcessByModuleId(int moduleId);
}
