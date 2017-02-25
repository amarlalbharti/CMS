package com.cms.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
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
import com.cms.domain.Registration;
import com.cms.model.RegistrationModel;
import com.cms.service.DepartmentService;
import com.cms.service.LoginInfoService;
import com.cms.service.MailService;
import com.cms.service.RegistrationService;
import com.cms.service.UserRoleService;
import com.cms.config.DateFormats;
import com.cms.config.Roles;
import com.cms.config.Validation;
import com.cms.domain.Department;
import com.cms.domain.LoginInfo;
import com.cms.domain.UserRole;


@Controller
public class AdminRegistrationController {
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private LoginInfoService loginInfoService;
	@Autowired
	private MailService mailService;
	@Autowired
	private UserRoleService userRoleService;
	
	
	
	@RequestMapping(value = "/appUsersDashboard", method = RequestMethod.GET)
	public String employees(ModelMap map, HttpServletRequest request, Principal principal)
	{
		List<Registration> regList = registrationService.getRegistrationList();
		Map<String, UserRole> roles = new HashMap<String, UserRole>();
		for(Registration reg : regList)
		{
			roles.put(reg.getUserId(), userRoleService.getUserRolesByUserid(reg.getUserId()).get(0));
		}
		
		map.addAttribute("regList", regList);
		map.addAttribute("roles", roles);
		return "appUsersDashboard";
	}
	
	@RequestMapping(value = "/appNewUser", method = RequestMethod.GET)
	public String appNewUser(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("regForm", new RegistrationModel());
		map.addAttribute("mode", "add");
		System.out.println("from appDepartment of application admin controller");
		
		//System.out.println("random number: "+registrationService.getRandomPassword());
	  
		return "appNewUser";
	}
	
	
	@RequestMapping(value = "/appAddUserDetail", method = RequestMethod.POST)
	public String appAddUserDetail(@ModelAttribute(value = "regForm") @Valid RegistrationModel model, BindingResult result,
			@ModelAttribute(value = "userMaster") @Valid Registration registration, 
			@ModelAttribute(value = "login") LoginInfo login, BindingResult loginResult,
			@ModelAttribute(value = "urole") UserRole urole, BindingResult userroleResult,
			@RequestParam("userId") String userId, ModelMap map, HttpServletRequest request, Principal principal)
	
	{
	
		System.out.println("userId in controller   :" + userId);
		boolean st = false;
		try
		{
			Registration reg = registrationService.getRegistrationByUserid(userId);
			if (reg != null)
			{
				result.addError(new FieldError("regForm", "userId", model.getUserId() , false, new String[1],new String[1], "User Id already registered "));
				st = true;
			}
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		if (result.hasErrors())
		{
			System.out.println("in validation");
			map.addAttribute("deptList", departmentService.getDepartments());
			map.addAttribute("mode", "add");
			return "appNewUser";
		}
		
		else
		{
			
			Date date = new Date();
			Date dt = new Date(date.getTime());
			registration.setRegdate(dt);
			registration.setJoiningDate(dt);
				
			try {
				
				Department department = departmentService.getDepartmentById(model.getDepartment().getDepartmentId());
				System.out.println("department Id..........."+model.getDepartment().getDepartmentId());
				Set<Department> dept = new HashSet<Department>();
				dept.add(department);
				registration.setDepartment(dept);
				registration.setUserId(model.getUserId());
				
				login.setIsactive("true");
				login.setUserId(model.getUserId());
				//login.setPassword("Test@123");
				login.setPassword(registrationService.getRandomPassword());
				login.setRegistration(registration);
						
				urole.setLog(login);
				Set<UserRole> roles = new HashSet<UserRole>();
				roles.add(urole);
				login.setRoles(roles);
				
				boolean success = loginInfoService.addLoginInfo(login);
			   
				Registration reg1 = registrationService.getRegistrationByUserid(userId);
				
				if(reg1 != null)
				{
					if(success){
						
						String subject="Welcome to CMS";
						String content="Dear Sir/ma'am,<br><br>"
			            +"This is your Login Credentials for CMS,<br><br>"
			            +"User Id : " + userId
			            +"<br><br>"
			            +"Password : "+ login.getPassword()
			            +"<br><br>"
			            +"<br><br><br>"
			            +"<b>Note: </b>Password is case case sensitive. If required, you can set your own password.";
						mailService.sendMail(userId,"", "", subject, content);
						
		            map.addAttribute("status", "success");
		            return "redirect:login";
					}
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				return "appNewUser";
			}
				
			}
			map.addAttribute("status", "failed");
			return "redirect:appNewUser";
		}
	
	
	
	@RequestMapping(value = "/appEditUser", method = RequestMethod.GET)
	public String adminEditEmployee(ModelMap map, HttpServletRequest request, Principal principal)
	{
		String userId = request.getParameter("userId");
		if(userId != null && userId.length() > 0)
		{
			Registration reg = registrationService.getRegistrationByUserid(userId);
			if(reg != null)
			{
				RegistrationModel model = new RegistrationModel();
				model.setUserId(userId);
				model.setName(reg.getName());
				model.setContactNumber(reg.getContactNumber());
				model.setGender(reg.getGender());
				
				List<UserRole> roles =  userRoleService.getUserRolesByUserid(userId);
				if(roles != null && !roles.isEmpty())
				{
					model.setUserrole(roles.get(0).getUserrole());
				}
				//model.setDepartment(reg.getDepartment());
				model.setDepartment((Department) reg.getDepartment());
				
				map.addAttribute("regForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("mode", "edit");
				map.addAttribute("empReg", reg);
				return "appNewUser";
			}
			
		}
		return "redirect:appUsersDashboard";
	}
	
	@RequestMapping(value = "/appEditUserDetail", method = RequestMethod.POST)
	public String adminEditEmployee(@ModelAttribute(value = "regForm") @Valid RegistrationModel model,BindingResult result, ModelMap map,
			HttpServletRequest request, Principal principal)
	{
		if(model.getUserId() == null)
		{
			return "redirect:appUsersDashboard";
		}
		if (result.hasErrors()|| model.getDepartment().getDepartmentId() <= 0)
		{
			
			if(model.getDepartment().getDepartmentId() <= 0)
			{
				result.addError(new FieldError("regForm", "department", model.getDepartment() , false, new String[1],new String[1], "Please select department"));
			}
			
			map.addAttribute("empReg", registrationService.getRegistrationByUserid(model.getUserId()));
			map.addAttribute("deptList", departmentService.getDepartments());
			
			System.out.println("in validation");
			return "appEditUser";
		} else
		{
		
			Registration reg = registrationService.getRegistrationByUserid(model.getUserId());
			if(reg != null)
			{
				try 
				{
					reg.setName(model.getName());
					reg.setGender(model.getGender());
					reg.setContactNumber(model.getContactNumber());
					
					//Department department = departmentService.getDepartmentById(model.getDepartment().getDepartmentId());
					Set<Department> department=(Set<Department>) departmentService.getDepartmentById(model.getDepartment().getDepartmentId());
					reg.setDepartment(department);
					reg.setModification_date(new java.sql.Date(new Date().getTime()));
					
					boolean success = registrationService.updateRegistration(reg);
					
					LoginInfo info = loginInfoService.getLoginInfoByUserid(model.getUserId());
					if(info != null)
					{
						List<UserRole> rList = userRoleService.getUserRolesByUserid(model.getUserId());
						if(rList != null && !rList.isEmpty())
						{
							UserRole role = rList.get(0);
							if(!role.getUserrole().equals(model.getUserrole()))
							{
								role.setUserrole(model.getUserrole());
								userRoleService.updateUserRole(role);
							}
						}
					}
					map.addAttribute("status", "success");
					//return "redirect:adminViewEmployee?empid="+model.getUserid();
					return "redirect:appUsersDashboard";
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
			map.addAttribute("status", "failed");
			return "redirect:appUsersDashboard";
		}
	}
	
	
	
	@RequestMapping(value = "/appViewUser", method = RequestMethod.GET)
	public String viewUser(ModelMap map, HttpServletRequest request, Principal principal)
	{
		String userId = request.getParameter("userId");
		if(userId != null && userId.length() > 0)
		{
			Registration registration = registrationService.getRegistrationByUserid(userId);
			if(registration != null)
			{
				map.addAttribute("roles", userRoleService.getUserRolesByUserid(userId));
				map.addAttribute("pwdstatus", request.getParameter("pwdstatus"));
				map.addAttribute(registration);
				return "appViewUser";
			}
		}
		
		return "redirect:appUsersDashboard";
	}
	
	
	@RequestMapping(value = "/appUserResetPassword", method = RequestMethod.POST)
	public String appUserResetPassword(ModelMap map, HttpServletRequest request, Principal principal)
	{
			
		String empid = request.getParameter("empid");
		if(empid != null)
		{
			String newPassword = request.getParameter("newPassword");
			String confPassword = request.getParameter("confPassword");
			if(newPassword != null && confPassword != null && newPassword.equals(confPassword) && Validation.validatePassword(newPassword))
			{
				Registration reg = registrationService.getRegistrationByUserid(empid);
				LoginInfo info = loginInfoService.getLoginInfoByUserid(empid);
				if(reg != null && info != null)
				{
					loginInfoService.resetPassword(empid, newPassword);
					map.addAttribute("pwdstatus", "success");
					return "redirect:appViewUser?empid="+empid;
				}
				map.addAttribute("pwdstatus", "notfound");
				return "redirect:appViewUser?empid="+empid;
			}
			map.addAttribute("pwdstatus", "notsame");
			return "redirect:appViewUser?empid="+empid;
		}
		map.addAttribute("pwdstatus", "error");
		return "redirect:appViewUser?empid="+empid;
	}
	
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changepassword(ModelMap map, HttpServletRequest request, Principal principal)
	{
		String oldPassword=request.getParameter("j_password1");
		String newPassword=request.getParameter("j_password2");
		String confirmPassword=request.getParameter("j_password3");
		if(newPassword.equals(confirmPassword))
		{
			if(Validation.validatePassword(newPassword))
			{
				String status = loginInfoService.changeUserPassword(principal.getName(), oldPassword, newPassword);
				map.addAttribute("pwdstatus", status);
			}
			else
			{
				map.addAttribute("pwdstatus", "notvalid");
			}
		}
		else
		{
			map.addAttribute("pwdstatus", "notsame");
		}
		
		if(request.isUserInRole(Roles.ROLE_APPADMIN))
		{
			return "redirect:appUserProfile";
		}
		else if(request.isUserInRole(Roles.ROLE_ADMIN))
		{
			return "redirect:adminUserProfile";
		}
		else if(request.isUserInRole(Roles.ROLE_USER))
		{
			return "redirect:userProfile";
		}
		else if(request.isUserInRole(Roles.ROLE_DEPT))
		{
			return "redirect:deptUserProfile";
		}
		else
		{
			return "redirect:error";
		}
		
	}
	
	
	@RequestMapping(value = "/appUserProfile", method = RequestMethod.GET)
	public String viewprofile(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("pwdstatus", request.getParameter("pwdstatus"));
		map.addAttribute("registration", registrationService.getRegistrationByUserid(principal.getName()));
		map.addAttribute("roles", userRoleService.getUserRolesByUserid(principal.getName()));
		return "appUserProfile";
	}
	
	
	@RequestMapping(value = "/appAddDept", method = RequestMethod.GET)
	public String appAddDept(ModelMap map, HttpServletRequest request, Principal principal)
	{
		String userId = request.getParameter("userId");
		if(userId != null && userId.length() > 0)
		{
			Registration registration = registrationService.getRegistrationByUserid(userId);
			if(registration != null)
			{
				map.addAttribute("regForm", new RegistrationModel());
				map.addAttribute("roles", userRoleService.getUserRolesByUserid(userId));
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("mode", "add");
				map.addAttribute(registration);
				return "appAddDept";
			}
		}
		
		return "redirect:appUsersDashboard";
	}
	
	
	
	
	
	
	
	
	
	
	
}
