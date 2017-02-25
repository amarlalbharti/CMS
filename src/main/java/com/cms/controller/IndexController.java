package com.cms.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.config.Roles;
import com.cms.domain.Registration;
import com.cms.service.RegistrationService;


@Controller
public class IndexController {
	
	@Autowired private  RegistrationService registrationService; 
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("from index page of index controller");
		return "redirect:login";
	}
	
	
	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public String homePage(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from home Page of index controller");
		if(request.isUserInRole(Roles.ROLE_ADMIN))
		{
			return "redirect:adminDashboard";
		}
		else if(request.isUserInRole(Roles.ROLE_DEPT))
		{
			return "redirect:deptDashboard";
		}
		else if(request.isUserInRole(Roles.ROLE_APPADMIN))
		{
			return "redirect:appDashboard";
		}
		else
		{
			return "redirect:userDashboard";
		}
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("from login page of index controller");
		//System.out.println("pricipal   :"+principal.getName());
		if(principal != null)
		{
			return "redirect:homePage";
		}
	
		return "login";
	}
	
	
	@RequestMapping(value = "/getLogedIn", method = RequestMethod.GET)
	public String getLogedIn(ModelMap map, HttpServletRequest request, Principal principal)
	{
		Registration registration = registrationService.getRegistrationByUserid(principal.getName());
		System.out.println("pricipal   :"+principal.getName());
		if(registration != null)
		{
			request.getSession(true).setAttribute("registration", registration);
			return "redirect:homePage";
		}
		
		return "redirect:login";
	}
	
	
	
	@RequestMapping(value = "/failtologin", method = RequestMethod.GET)
	public String failtologin(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("from failtologin page of index controller");
		String error="true";
		return "redirect:/login?error="+error;
		
	}
	
	
	/**
	 * Destroy user session and delete cookies for this JSESSIONID
	 * @param map
	 * @param request
	 * @param principal
	 * @return redirect to the index page after  login failed
	 */
	
	@RequestMapping(value = "/insertLogOut", method = RequestMethod.GET)
	public @ResponseBody String insertLogOut(ModelMap map, HttpServletRequest request)
	{
		System.out.println("from logout page");
		return "logedOut";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap map, HttpServletRequest request, Principal principal)
	{
		System.out.println("from logout successfully");
		
		return "redirect:/login";
		
	}
		
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(ModelMap map, HttpServletRequest request, Principal principal)
	{
		//System.out.println("from error page of index controller");
		return "error";
	}
	
	
	@RequestMapping(value = "/errorExcp", method = RequestMethod.GET)
	public String errorExcp(ModelMap map, HttpServletRequest request, Principal principal)
	{
		//System.out.println("from errorExcp page of index controller");
		return "errorExcp";
	}

}
