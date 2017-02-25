package com.cms.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cms.domain.Registration;
import com.cms.domain.UserRole;
import com.cms.service.DepartmentService;
import com.cms.service.RegistrationService;
import com.cms.service.UserRoleService;

@Controller
public class AdminNicController {
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private UserRoleService userRoleService;
	
	
	@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
	public String homePage(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from adminDashboard of admin controller");
		return "adminDashboard";
	}
	
	
	@RequestMapping(value = "/adminLogNewSuggestion", method = RequestMethod.GET)
	public String logNewSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminLogNewSuggestion";
	}
	
	@RequestMapping(value = "/adminTrackLogSuggestion", method = RequestMethod.GET)
	public String adminTrackLogSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminTrackLogSuggestion";
	}
	
	
	@RequestMapping(value = "/adminSolvedSuggestion", method = RequestMethod.GET)
	public String adminSolvedSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminSolvedSuggestion";
	}
	
	@RequestMapping(value = "/adminPendingSuggestion", method = RequestMethod.GET)
	public String adminPendingSuggestion(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminPendingSuggestion";
	}
	
	@RequestMapping(value = "/adminTrackLogComplain", method = RequestMethod.GET)
	public String adminTrackLogComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminTrackLogComplain";
	}
	
	
	@RequestMapping(value = "/adminSolvedComplain", method = RequestMethod.GET)
	public String adminSolvedComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminSolvedComplain";
	}
	
	@RequestMapping(value = "/adminPendingComplain", method = RequestMethod.GET)
	public String adminPendingComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminPendingComplain";
	}
	
	@RequestMapping(value = "/adminMemberDashboard", method = RequestMethod.GET)
	public String adminMemberDashboard(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptList", departmentService.getDepartments());
		System.out.println("from deptDashboard of dept controller");
		return "adminMemberDashboard";
	}
	
	@RequestMapping(value = "/adminManageProcess", method = RequestMethod.GET)
	public String adminManageProcess(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminManageProcess";
	}
	
	
	@RequestMapping(value = "/adminViewComplain", method = RequestMethod.GET)
	public String adminViewComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from deptDashboard of dept controller");
		return "adminViewComplain";
	}
	
	
	@RequestMapping(value = "/adminSetPriority", method = RequestMethod.GET)
	public String adminSetPriority(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("prtList", departmentService.getPriorityList());
		System.out.println("from deptDashboard of dept controller");
		return "adminSetPriority";
	}
	
	
	@RequestMapping(value = "/adminWorkAssignment", method = RequestMethod.GET)
	public String adminWorkAssignment(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("from deptDashboard of dept controller");
		return "adminWorkAssignment";
	}
	
	@RequestMapping(value = "/adminNewUser", method = RequestMethod.GET)
	public String adminNewUser(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptList", departmentService.getDepartments());
		System.out.println("from adminDashboard of admin controller");
		return "adminNewUser";
	}
	
	@RequestMapping(value = "/adminUserProfile", method = RequestMethod.GET)
	public String viewprofile(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("pwdstatus", request.getParameter("pwdstatus"));
		map.addAttribute("registration", registrationService.getRegistrationByUserid(principal.getName()));
		map.addAttribute("roles", userRoleService.getUserRolesByUserid(principal.getName()));
		return "adminUserProfile";
	}
	
	@RequestMapping(value = "/adminUsersDashboard", method = RequestMethod.GET)
	public String adminUsersDashboard(ModelMap map, HttpServletRequest request, Principal principal)
	{
		List<Registration> regList = registrationService.getEmpRegistrationList();
		Map<String, UserRole> roles = new HashMap<String, UserRole>();
		for(Registration reg : regList)
		{
			roles.put(reg.getUserId(), userRoleService.getUserRolesByUserid(reg.getUserId()).get(0));
		}
		
		map.addAttribute("regList", regList);
		map.addAttribute("roles", roles);
		return "adminUsersDashboard";
	}
	

}
