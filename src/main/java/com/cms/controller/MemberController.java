package com.cms.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cms.service.RegistrationService;
import com.cms.service.UserRoleService;

@Controller
public class MemberController {
	
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private UserRoleService userRoleService;
	
	
	@RequestMapping(value = "/userDashboard", method = RequestMethod.GET)
	public String homePage(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from memberDashboard of member controller");
		return "userDashboard";
	}
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET)
	public String viewprofile(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("pwdstatus", request.getParameter("pwdstatus"));
		map.addAttribute("registration", registrationService.getRegistrationByUserid(principal.getName()));
		map.addAttribute("roles", userRoleService.getUserRolesByUserid(principal.getName()));
		return "userProfile";
	}

}
