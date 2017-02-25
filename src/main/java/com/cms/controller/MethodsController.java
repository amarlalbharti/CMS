package com.cms.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.domain.Application;
import com.cms.domain.AtLevel;
import com.cms.domain.Module;
import com.cms.domain.Registration;
import com.cms.service.ApplicationService;
import com.cms.service.AtLevelService;
import com.cms.service.ModuleService;
import com.cms.service.RegistrationService;

@Controller
public class MethodsController {
	
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private AtLevelService atLevelService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getDepartmentApps", method = RequestMethod.GET)
	@ResponseBody
	public String getDepartmentApps(ModelMap map, HttpServletRequest request, Principal principal)
	{
		JSONObject object = new JSONObject();

		String deptId = (String)request.getParameter("deptId");
		if(deptId != null && deptId.length() > 0)
		{
			List<Application> appList = (List<Application>)applicationService.getApplicationByDepartmentId(Integer.parseInt(deptId));
			JSONArray array = new  JSONArray();
			if(appList != null && !appList.isEmpty())
			{
				for(Application application : appList)
				{
					JSONObject at = new JSONObject();
					at.put("id", application.getApplicationId());
					at.put("name", application.getApplicationName());
					array.add(at);
				}
			}
			object.put("appList", array);
			object.put("error", false);
			return object.toJSONString();
		}
		object.put("error", true);
		return object.toJSONString();
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getAppModules", method = RequestMethod.GET)
	@ResponseBody
	public String getAppModules(ModelMap map, HttpServletRequest request, Principal principal)
	{
		JSONObject object = new JSONObject();

		String appId = (String)request.getParameter("appId");
		if(appId != null && appId.length() > 0)
		{
			List<Module> moList = (List<Module>)moduleService.getModuleByAppId(Integer.parseInt(appId));
			JSONArray array = new  JSONArray();
			if(moList != null && !moList.isEmpty())
			{
				for(Module module : moList)
				{
					JSONObject at = new JSONObject();
					at.put("id", module.getModuleId());
					at.put("name", module.getModuleDesc());
					array.add(at);
				}
			}
			object.put("moduleList", array);
			object.put("error", false);
			return object.toJSONString();
		}
		object.put("error", true);
		return object.toJSONString();
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getModulesProcess", method = RequestMethod.GET)
	@ResponseBody
	public String getModulesProcess(ModelMap map, HttpServletRequest request, Principal principal)
	{
		JSONObject object = new JSONObject();

		String moduleId = (String)request.getParameter("moduleId");
		if(moduleId != null && moduleId.length() > 0)
		{
			List<AtLevel> prList = (List<AtLevel>)atLevelService.getProcessByModuleId(Integer.parseInt(moduleId));
			JSONArray array = new  JSONArray();
			if(prList != null && !prList.isEmpty())
			{
				for(AtLevel process : prList)
				{
					JSONObject at = new JSONObject();
					at.put("id", process.getLevelId());
					at.put("name", process.getAtLevel());
					array.add(at);
				}
			}
			object.put("processList", array);
			object.put("error", false);
			return object.toJSONString();
		}
		object.put("error", true);
		return object.toJSONString();
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getDepartmentAdmins", method = RequestMethod.GET)
	@ResponseBody
	public String getDepartmentAdmins(ModelMap map, HttpServletRequest request, Principal principal)
	{
		JSONObject object = new JSONObject();

		String deptId = (String)request.getParameter("deptId");
		if(deptId != null && deptId.length() > 0)
		{
			List<Registration> adminList = (List<Registration>)registrationService.getAdminByDepartmentId(Integer.parseInt(deptId));
			JSONArray array = new  JSONArray();
			if(adminList != null && !adminList.isEmpty())
			{
				for(Registration registration : adminList)
				{
					JSONObject at = new JSONObject();
					at.put("id", registration.getRegistrationId());
					at.put("name", registration.getName());
					array.add(at);
				}
			}
			object.put("adminList", array);
			object.put("error", false);
			return object.toJSONString();
		}
		object.put("error", true);
		return object.toJSONString();
	}
	
	
	@RequestMapping(value = "/validateUserId", method = RequestMethod.GET)
	@ResponseBody
	public String validateUserId(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("in validate method");
		JSONObject obj = new JSONObject();
		
		String userId = request.getParameter("userId");
		
		System.out.println("userId..."+userId);
		
		if(userId != null && !userId.trim().isEmpty())
		{
			
			Registration reg = registrationService.getRegistrationByUserid(userId);
			if(reg!= null)
			{
				obj.put("UserId_exist", true);
				return obj.toJSONString();
			}
		}
		obj.put("UserId_exist", false);
		return obj.toJSONString();
	}


}
