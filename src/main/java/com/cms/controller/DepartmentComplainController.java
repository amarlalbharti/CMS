package com.cms.controller;

import java.security.Principal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cms.domain.AtLevel;
import com.cms.domain.ComplainDetail;
import com.cms.domain.Department;
import com.cms.domain.LoginInfo;
import com.cms.domain.Registration;
import com.cms.domain.UserRole;
import com.cms.model.ComplainDetailModel;
import com.cms.model.RegistrationModel;
import com.cms.service.AtLevelService;
import com.cms.service.ComplainService;
import com.cms.service.DepartmentService;

@Controller
public class DepartmentComplainController {

	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private AtLevelService atLevelService;
	@Autowired
	private ComplainService complainService;
	
	
	
	@RequestMapping(value = "/deptViewComplain", method = RequestMethod.GET)
	public String deptPendingComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		map.addAttribute("complainList", complainService.getComplainList());
		return "deptPendingComplain";
	}
	
	@RequestMapping(value = "/deptLogNewComplain", method = RequestMethod.GET)
	public String logNewComplain(ModelMap map, HttpServletRequest request, Principal principal)
	{
		Registration registration = (Registration) request.getSession().getAttribute("registration");
		System.out.println("from deptDashboard of dept controller");
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("logForm", new ComplainDetailModel());
		return "deptLogNewComplain";
	}
	
	
	
	@RequestMapping(value = "/deptLogNewComplain", method = RequestMethod.POST)
	public String appAddUserDetail(@ModelAttribute(value = "logForm") @Valid ComplainDetailModel model, BindingResult result,
			@ModelAttribute(value = "complainDetail") @Valid ComplainDetail complainDetail, 
			 ModelMap map, HttpServletRequest request, Principal principal)
	
	{
				
		if (result.hasErrors())
		{
			System.out.println("in validation");
			map.addAttribute("deptList", departmentService.getDepartments());
			map.addAttribute("mode", "add");
			return "deptLogNewComplain";
		}
		else
		{
			Date date = new Date();
			Date dt = new Date(date.getTime());
			complainDetail.setCreateDate(dt);
			
			try {
				
				AtLevel atLevel = atLevelService.getProcessById(model.getAtLevel().getLevelId());
				complainDetail.setAtLevel(atLevel);
				complainDetail.setStatus("pending");
				complainDetail.setTokenNumber("abc"+dt);
				int complainId=complainService.addComplainDetail(complainDetail);
				if(complainId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				return "deptLogNewComplain";
			}
		  }
			return "redirect:deptLogNewComplain";
		}
	
	
}
