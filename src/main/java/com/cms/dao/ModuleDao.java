package com.cms.dao;

import java.util.List;
import com.cms.domain.Module;

public interface ModuleDao {
	
	public List<Module> getModuleByAppId(int appId);
	
	public Module getModuleById(int moduleId);
	
	public List<Module> getModuleList();
	
	public int addModule(Module module);
	
	public boolean updateModule(Module module);

}
