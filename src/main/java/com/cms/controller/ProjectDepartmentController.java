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
import com.cms.service.DepartmentService;
import com.cms.service.ModuleService;
import com.cms.service.RegistrationService;
import com.cms.service.UserRoleService;



@Controller
public class ProjectDepartmentController {
	
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private UserRoleService userRoleService;
	
	@RequestMapping(value = "/deptDashboard", method = RequestMethod.GET)
	public String homePage(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptDashboard";
	}
	
	
	
	@RequestMapping(value = "/deptTrackLogComplain", method = RequestMethod.GET)
	public String deptTrackLogComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptTrackLogComplain";
	}
	
	
	@RequestMapping(value = "/deptSolvedComplain", method = RequestMethod.GET)
	public String deptSolvedComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptSolvedComplain";
	}
	
	

	
	@RequestMapping(value = "/deptLogNewSuggestion", method = RequestMethod.GET)
	public String logNewSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		Registration registration = (Registration) request.getSession().getAttribute("registration");
		System.out.println("from deptDashboard of dept controller");
		//map.addAttribute("appList", applicationService.getApplicationByDepartmentId(registration.getDepartment().getDepartmentId()));
	
		return "deptLogNewSuggestion";
	}
	
	@RequestMapping(value = "/deptTrackLogSuggestion", method = RequestMethod.GET)
	public String deptTrackLogSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptTrackLogSuggestion";
	}
	
	
	@RequestMapping(value = "/deptSolvedSuggestion", method = RequestMethod.GET)
	public String deptSolvedSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptSolvedSuggestion";
	}
	
	@RequestMapping(value = "/deptPendingSuggestion", method = RequestMethod.GET)
	public String deptPendingSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "deptPendingSuggestion";
	}
	
	
	
	
	@RequestMapping(value = "/deptNewUser", method = RequestMethod.GET)
	public String adminNewUser(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptList", departmentService.getDepartments());
		System.out.println("from adminDashboard of admin controller");
		return "deptNewUser";
	}
	
	@RequestMapping(value = "/deptUserProfile", method = RequestMethod.GET)
	public String viewprofile(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("pwdstatus", request.getParameter("pwdstatus"));
		map.addAttribute("registration", registrationService.getRegistrationByUserid(principal.getName()));
		map.addAttribute("roles", userRoleService.getUserRolesByUserid(principal.getName()));
		return "deptUserProfile";
	}
	
	
}
