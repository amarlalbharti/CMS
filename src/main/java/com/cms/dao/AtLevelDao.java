package com.cms.dao;

import java.util.List;

import com.cms.domain.AtLevel;

public interface AtLevelDao {
	
	public List<AtLevel> getProcessList();
	
	public AtLevel getProcessById(int levelId);
	
	public int addProcess(AtLevel atLevel);
	
	public boolean updateProcess(AtLevel atLevel);
	
	public List<AtLevel> getProcessByModuleId(int moduleId);
	

}
