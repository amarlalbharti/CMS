package com.cms.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.dao.ModuleDao;
import com.cms.domain.Module;

@Service
@Transactional
public class ModuleServiceImpl implements ModuleService{

	@Autowired
	private ModuleDao moduleDao;
	
	
	public List<Module> getModuleByAppId(int appId) {
		
		return this.moduleDao.getModuleByAppId(appId);
	}


	public Module getModuleById(int moduleId) {
		
		return this.moduleDao.getModuleById(moduleId);
	}


	public List<Module> getModuleList() {
		
		return this.moduleDao.getModuleList();
	}


	public int addModule(Module module) {
	
		return this.moduleDao.addModule(module);
	}


	public boolean updateModule(Module module) {
		
		return this.moduleDao.updateModule(module);
	}

}
