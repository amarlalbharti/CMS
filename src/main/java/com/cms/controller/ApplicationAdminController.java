package com.cms.controller;

import java.security.Principal;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cms.domain.Application;
import com.cms.domain.AtLevel;
import com.cms.domain.Department;
import com.cms.domain.Module;
import com.cms.domain.ProjectAdmin;
import com.cms.domain.Registration;
import com.cms.model.ApplicationModel;
import com.cms.model.AtLevelModel;
import com.cms.model.DepartmentModel;
import com.cms.model.ModuleModel;
import com.cms.model.ProjectAdminModel;
import com.cms.service.ApplicationService;
import com.cms.service.AtLevelService;
import com.cms.service.DepartmentService;
import com.cms.service.ModuleService;
import com.cms.service.ProjectAdminService;
import com.cms.service.RegistrationService;



@Controller
public class ApplicationAdminController {
	
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private AtLevelService atLevelService;
	@Autowired
	private ProjectAdminService projectAdminService;
	@Autowired
	private RegistrationService registrationService;
	
	@RequestMapping(value = "/appDashboard", method = RequestMethod.GET)
	public String appDashboard(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		System.out.println("from appDashboard of application admin controller");
		return "appDashboard";
	}
	
	
	
	@RequestMapping(value = "/appDepartment", method = RequestMethod.GET)
	public String appDepartment(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptForm", new DepartmentModel());
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("mode", "add");
		String deptId = (String)request.getParameter("departmentId");
		if(deptId!=null){
			Department department= departmentService.getDepartmentById(Integer.parseInt(deptId));
			if(department != null)
			{
				DepartmentModel model = new DepartmentModel();
				
				model.setDepartmentId(Integer.parseInt(deptId));
				model.setDepartmentName(department.getDepartmentName());
				map.addAttribute("deptForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("mode", "edit");
				return "appDepartment";
			}
			else
			{
				return "appDepartment";
			}
		}
			
		return "appDepartment";
	}
	
	
	
	@RequestMapping(value = "/appAddDepartment", method = RequestMethod.POST)
	public String addDepartmentDetail(@ModelAttribute(value = "deptForm") @Valid DepartmentModel model, BindingResult result,
			@ModelAttribute(value = "department") @Valid Department department, ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		if (result.hasErrors())
		{
			map.addAttribute("deptList", departmentService.getDepartments());
			System.out.println("in validation");
			return "appDepartment";
		}
		else
		{
			boolean flag=false;
			Date date = new Date();
			Date dt = new Date(date.getTime());
			
			Department dept = departmentService.getDepartmentById(model.getDepartmentId());
			if(dept != null)
			{
				
				dept.setDepartmentName(model.getDepartmentName());
				dept.setUpdatedDate(dt);
				flag = departmentService.updateDepartment(dept);
				if(flag == true)
				{
					map.addAttribute("status", "updated");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			else
			{
				department.setCreateDate(dt);
				int deptId=departmentService.addDepartment(department);
				if(deptId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			return "redirect:appDepartment";
		}
	}
	

	
	
	@RequestMapping(value = "/appApplication", method = RequestMethod.GET)
	public String appApplication(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("appForm", new ApplicationModel());
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("appList", applicationService.getApplicationList());
		map.addAttribute("mode", "add");
		String applicationId = (String)request.getParameter("applicationId");
		if(applicationId!=null){
			Application application =applicationService.getApplicationById(Integer.parseInt(applicationId));
		
			if(application != null)
			{
				ApplicationModel model = new ApplicationModel();
				
				model.setApplicationId(Integer.parseInt(applicationId));
				model.setDepartment(application.getDepartment());
				model.setApplicationName(application.getApplicationName());
				map.addAttribute("appForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("appList", applicationService.getApplicationList());
				map.addAttribute("mode", "edit");
				return "appApplication";
			}
			else
			{
				return "appApplication";
			}
		}
		return "appApplication";
	}
	
	
	
	
	@RequestMapping(value = "/appAddApplication", method = RequestMethod.POST)
	public String addApplicationDetail(@ModelAttribute(value = "appForm") @Valid ApplicationModel model, BindingResult result,
			@ModelAttribute(value = "application") @Valid Application application, ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		if (result.hasErrors())
		{
			map.addAttribute("deptList", departmentService.getDepartments());
			map.addAttribute("appList", applicationService.getApplicationList());
			System.out.println("in validation");
			return "appApplication";
		}
		else
		{
			boolean flag=false;
			Date date = new Date();
			Date dt = new Date(date.getTime());
			
			Application app = applicationService.getApplicationById(model.getApplicationId());
			if(app != null)
			{
				Department dept = departmentService.getDepartmentById(model.getDepartment().getDepartmentId());
				app.setDepartment(dept);
				app.setApplicationName(model.getApplicationName());
				app.setUpdatedDate(dt);
				flag = applicationService.updateApplication(app);
				if(flag == true)
				{
					map.addAttribute("status", "updated");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			else
			{
				application.setCreateDate(dt);
				Department dept = departmentService.getDepartmentById(application.getDepartment().getDepartmentId());
				application.setDepartment(dept);
				int appId=applicationService.addApplication(application);
				if(appId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			return "redirect:appApplication";
		}
	}
	
	
	
	
	
	
	@RequestMapping(value = "/appModule", method = RequestMethod.GET)
	public String appModule(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("modForm", new ModuleModel());
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("moduleList", moduleService.getModuleList());
		map.addAttribute("mode", "add");
		String moduleId = (String)request.getParameter("moduleId");
		if(moduleId!=null){
			
			Module module=moduleService.getModuleById(Integer.parseInt(moduleId));
		
			if(module != null)
			{
				ModuleModel model = new ModuleModel();
				
				model.setModuleId(Integer.parseInt(moduleId));
				model.setApplication(module.getApplication());
				model.setDepartment(module.getApplication().getDepartment());
				model.setModuleDesc(module.getModuleDesc());
				map.addAttribute("modForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("appList", applicationService.getApplicationByDepartmentId(module.getApplication().getDepartment().getDepartmentId()));
				map.addAttribute("moduleList", moduleService.getModuleList());
				map.addAttribute("mode", "edit");
				return "appModule";
			}
			else
			{
				return "appModule";
			}
		}
		return "appModule";
	}
	
	
	
	
	
	@RequestMapping(value = "/appAddModule", method = RequestMethod.POST)
	public String addModuleDetail(@ModelAttribute(value = "modForm") @Valid ModuleModel model, BindingResult result,
			@ModelAttribute(value = "module") @Valid Module module, ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		if (result.hasErrors())
		{
			map.addAttribute("deptList", departmentService.getDepartments());
			map.addAttribute("moduleList", moduleService.getModuleList());
			System.out.println("in validation");
			return "appModule";
		}
		else
		{
			boolean flag=false;
			Date date = new Date();
			Date dt = new Date(date.getTime());
			
			Module mod = moduleService.getModuleById(model.getModuleId());
		
			if(mod != null)
			{
				Application app=applicationService.getApplicationById(model.getApplication().getApplicationId());
				mod.setApplication(app);
				mod.setModuleDesc(model.getModuleDesc());
				mod.setUpdatedDate(dt);
				flag = moduleService.updateModule(mod);
				if(flag == true)
				{
					map.addAttribute("status", "updated");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			else
			{
				module.setCreateDate(dt);
				Application app=applicationService.getApplicationById(module.getApplication().getApplicationId());
				module.setApplication(app);
				int moduleId=moduleService.addModule(module);
				if(moduleId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			return "redirect:appModule";
		}
	}
	
	
	
	
	
	
	@RequestMapping(value = "/appProcess", method = RequestMethod.GET)
	public String appProcess(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("processForm", new AtLevelModel());
		map.addAttribute("deptList", departmentService.getDepartments());
		map.addAttribute("processList", atLevelService.getProcessList());
		map.addAttribute("mode", "add");
		String levelId = (String)request.getParameter("levelId");
		if(levelId!=null){
			
			
			AtLevel atLevel=atLevelService.getProcessById(Integer.parseInt(levelId));
			if(atLevel != null)
			{
				AtLevelModel model = new AtLevelModel();
				
				model.setLevelId(Integer.parseInt(levelId));
				model.setApplication(atLevel.getModule().getApplication());
				model.setDepartment(atLevel.getModule().getApplication().getDepartment());
				model.setModule(atLevel.getModule());
				model.setAtLevel(atLevel.getAtLevel());
				map.addAttribute("processForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("appList", applicationService.getApplicationByDepartmentId(atLevel.getModule().getApplication().getDepartment().getDepartmentId()));
				map.addAttribute("moduleList", moduleService.getModuleByAppId(atLevel.getModule().getApplication().getApplicationId()));
				map.addAttribute("processList", atLevelService.getProcessList());
				map.addAttribute("mode", "edit");
				return "appProcess";
			}
			else
			{
				return "appProcess";
			}
		}
		return "appProcess";
	}
	
	
	
	@RequestMapping(value = "/appAddProcess", method = RequestMethod.POST)
	public String addProcessDetail(@ModelAttribute(value = "processForm") @Valid AtLevelModel model, BindingResult result,
			@ModelAttribute(value = "atLevel") @Valid AtLevel atLevel, ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		if (result.hasErrors())
		{
			map.addAttribute("deptList", departmentService.getDepartments());
			map.addAttribute("processList", atLevelService.getProcessList());
			System.out.println("in validation");
			return "appProcess";
		}
		else
		{
			boolean flag=false;
			Date date = new Date();
			Date dt = new Date(date.getTime());
			
			AtLevel level = atLevelService.getProcessById(model.getLevelId());
			if(level != null)
			{
				Module module=moduleService.getModuleById(model.getModule().getModuleId());
				level.setModule(module);
				level.setAtLevel(model.getAtLevel());
				level.setUpdatedDate(dt);
				flag = atLevelService.updateProcess(level);
				if(flag == true)
				{
					map.addAttribute("status", "updated");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			else
			{
				atLevel.setCreateDate(dt);
				Module module=moduleService.getModuleById(model.getModule().getModuleId());
				atLevel.setModule(module);
				int levelId=atLevelService.addProcess(atLevel);
				if(levelId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			return "redirect:appProcess";
		}
	}
	
	
	
	
	
	@RequestMapping(value = "/appProjectAdmin", method = RequestMethod.GET)
	public String homePage(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("proAdminForm", new ProjectAdminModel());
		map.addAttribute("deptList", departmentService.getDepartments());
		//map.addAttribute("processList", atLevelService.getProcessList());
		map.addAttribute("mode", "add");
		/*String projectAdminId = (String)request.getParameter("projectAdminId");
		if(projectAdminId!=null){
			
			
			AtLevel atLevel=atLevelService.getProcessById(Integer.parseInt(levelId));
			if(atLevel != null)
			{
				AtLevelModel model = new AtLevelModel();
				
				model.setLevelId(Integer.parseInt(levelId));
				model.setApplication(atLevel.getModule().getApplication());
				model.setDepartment(atLevel.getModule().getApplication().getDepartment());
				model.setModule(atLevel.getModule());
				model.setAtLevel(atLevel.getAtLevel());
				map.addAttribute("processForm", model);
				map.addAttribute("deptList", departmentService.getDepartments());
				map.addAttribute("appList", applicationService.getApplicationByDepartmentId(atLevel.getModule().getApplication().getDepartment().getDepartmentId()));
				map.addAttribute("moduleList", moduleService.getModuleByAppId(atLevel.getModule().getApplication().getApplicationId()));
				map.addAttribute("processList", atLevelService.getProcessList());
				map.addAttribute("mode", "edit");
				return "appProjectAdmin";
			}
			else
			{
				return "appProjectAdmin";
			}
		}
		*/
		return "appProjectAdmin";
	}
	
	
	
	
	@RequestMapping(value = "/addProjectAdmin", method = RequestMethod.POST)
	public String addProjectAdmin(@ModelAttribute(value = "proAdminForm") @Valid ProjectAdminModel model, BindingResult result,
			@ModelAttribute(value = "projectAdmin") @Valid ProjectAdmin projectAdmin, ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		if (result.hasErrors())
		{
			map.addAttribute("deptList", departmentService.getDepartments());
			//map.addAttribute("processList", atLevelService.getProcessList());
			System.out.println("in validation");
			return "appProjectAdmin";
		}
		else
		{
			boolean flag=false;
			Date date = new Date();
			Date dt = new Date(date.getTime());
			
			/*AtLevel level = atLevelService.getProcessById(model.getLevelId());
			if(level != null)
			{
				Module module=moduleService.getModuleById(model.getModule().getModuleId());
				level.setModule(module);
				level.setAtLevel(model.getAtLevel());
				level.setUpdatedDate(dt);
				flag = atLevelService.updateProcess(level);
				if(flag == true)
				{
					map.addAttribute("status", "updated");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			else
			{*/
				projectAdmin.setCreatedDate(dt);
				Application app=applicationService.getApplicationById(projectAdmin.getApplication().getApplicationId());
				projectAdmin.setApplication(app);
				Registration reg=registrationService.getRegistrationById(projectAdmin.getRegistration().getRegistrationId());
				projectAdmin.setRegistration(reg);
				int projectAdminId=projectAdminService.addProjectAdmin(projectAdmin);
				if(projectAdminId > 0)
				{
					map.addAttribute("status", "success");
				}
				else
				{
					map.addAttribute("status", "failed");
				}
			}
			return "redirect:appProjectAdmin";
		//}
	}
	
	
	
	
	
	
	@RequestMapping(value = "/appProjectMember", method = RequestMethod.GET)
	public String appProjectMember(ModelMap map, HttpServletRequest request, Principal principal)
	{
		map.addAttribute("deptList", departmentService.getDepartments());
		System.out.println("from appDepartment of application admin controller");
		return "appProjectMember";
	}
	

}
