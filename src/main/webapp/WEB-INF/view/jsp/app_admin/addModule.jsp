<%-- <%@page import="com.testing.domain.UserRole"%> --%>
<%@page import="com.cms.domain.Module"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cms.config.Roles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
</head>
<body>
<input type="hidden" id=mode name="mode" value="${mode}">
	<div class="content-wrapper">
       <%-- <%
       		UserMaster registration = (UserMaster) request.getSession().getAttribute("registration");
       %> --%>
    <section class="content-header">
      <h1 class="page-header">Please Enter Following Detail to Add New Module</h1>
      <ol class="breadcrumb">
        <li><a href="appDashboard"><i class="fa fa-dashboard"></i>Home Page</a></li>
      </ol>
    </section>
       
    <!-- Main content -->
    <section class="content">
		
      <!-- Your Page Content Here -->
		<div class="row">
			<div class="col-xs-12 col-md-12">
				 <%
				String status = (String)request.getParameter("status");
			    if(status != null)
				{
					if(status.equalsIgnoreCase("success"))
					{
						%>
							<div class="alert alert-success alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Success !
								</h4>
								Record Saved successfully !
							</div>
						<%
					}
					else if(status.equalsIgnoreCase("updated"))
					{
						%>
							<div class="alert alert-success alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Success !
								</h4>
								Record Updated successfully !
							</div>
						<%
					}
					else if(status.equalsIgnoreCase("failed"))
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, Some error occurs !
							</div>
						<%
					}
				}
					%>
			
			  <div class="box box-info">
				<%
					String mode=(String)request.getAttribute("mode");
					if(mode!=null){
					if ((mode).equalsIgnoreCase("add"))
					{
				
				%>
					<div class="box-header with-border">
						<h3 class="box-title">Add New Module</h3>
					</div>
				<%
				
					} else if ((mode).equalsIgnoreCase("edit"))
					{
				%>	
					
					<div class="box-header with-border">
						<h3 class="box-title">Add New Module</h3>
					</div>
					
				<%
				     }
				%>
					
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="appAddModule" commandName="modForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			              <div class="box-body">
				                <div class="form-group col-xs-12 col-md-6">
				                  <form:hidden path="moduleId" cssClass="form-control" />
				                  <label>Select Department</label><span class="text-danger">*</span>
				                  <form:select path="department.departmentId" class="form-control"  tabindex="1" id="department">
				                   <form:option value='0'>Select Department</form:option>
				                   <c:forEach var="dept" items="${deptList}">
									 <form:option value='${dept.departmentId }'>${dept.departmentName}</form:option>
								   </c:forEach>
				                  </form:select>
				                  <span class="text-danger"><form:errors path="department" /></span>
				                </div>
				                
				                
				                <div class="form-group col-xs-12 col-md-6">
				                  <label>Select Application</label><span class="text-danger">*</span>
				                  <form:select path="application.applicationId" id="application" class="form-control"  tabindex="2">
				                    <form:option value='0'>Select Application</form:option>
				                    <c:forEach var="app" items="${appList}">
										<form:option value='${app.applicationId }'>${app.applicationName}</form:option>
									</c:forEach>
				                  </form:select>
				                  <span class="text-danger"><form:errors path="application" /></span>
				                </div>

							
								<div class="form-group col-xs-12 col-md-6">
				                  <label>Enter Module</label><span class="text-danger">*</span>
				                  <form:input path="moduleDesc" class="form-control titleCase"  placeholder="Enter Module" tabindex="3"/>
				                  <span class="text-danger"><form:errors path="moduleDesc" /></span>
				                </div>
				                
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="11">Submit</button>
			                </div>
			              </div>
			            </form:form>
			        </div>
			        <%
					}
			        %>
				</div>
			</div>			
		</div>
  </section>      
			 
	<section class="content">            
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Module List</h3>
						<div class="pull-right " style="padding-left: 20px;">
				           <a href="appModule" class="btn btn-primary xs btn-xs">Add Module</a>
			            </div>
 					</div>
					<div class="box-body table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="10%">S.n.</th>
									<th width="20%">Department</th>
									<th width="20%">Application</th>
									<th width="20%">Module</th>
									<th width="20%" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							
							
							
							<!-- <tr>
									<td>1</td>
									<td>Treasury</td>
									<td>DDO Portal</td>
									<td>Transaction</td>
									
									<td class="text-center"> 
									  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> Edit</a>
									  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> View</a>
									  <a class="btn btn-danger btn-xs delete" href="#" ><i class="fa fa-fw fa-remove"></i> Delete</a>
									</td>
								</tr> -->
							
							
							<%
								List<Module> moduleList = (List)request.getAttribute("moduleList");
								if(moduleList != null && !moduleList.isEmpty())
								{
									int i = 1;
									for(Module module : moduleList)
									{
										%>
											<tr>
												<td><%= i++ %></td>
												
												<td><%= module.getApplication().getDepartment().getDepartmentName() %> </td>
												<td><%= module.getApplication().getApplicationName() %> </td>
												<td><%= module.getModuleDesc() %> </td>
												<td class="text-center"> 
												<a class="btn btn-primary btn-xs" href="appModule?moduleId=<%= module.getModuleId() %>" ><i class="fa fa-fw fa-edit"></i> Edit</a>
												</td>
											</tr>
										<%
									}
								}
								else
								{
									%>
										<tr>
											<td colspan="9">No data in the data source.</td>
										</tr>
									<%
								}
							%>
							</tbody>
						</table>
					</div>
				</div>
    		</div>
	</div>	
				</section>
					</div>
				
			
	
	
 
    <!-- /.content -->

<script src="js/jQuery-2.2.0.min.js"></script>
 <script type="text/javascript">

 
 $(document).ready(function()
		 {
		 	$("#form").trigger('reset');
		 });
 
 $(function () {
	    $("#department").change(function () {
	    	//alert('hi');
	        var selectedText = $(this).find("option:selected").text();
	        var selectedValue = $(this).val();
	    	
			$.ajax({
				type : "GET",
				url : "getDepartmentApps",
				data : {'deptId':selectedValue},
				contentType : "application/json",
				success : function(data) {
					var obj = jQuery.parseJSON(data);
					if(!obj.error)
						{
							var list = obj.appList;
							$("#application").html("<option value='0' >---SELECT---</option>");
							jQuery.each( list, function( i, val ) {
							  $("#application").append("<option value='"+val.id+"' > "+val.name+"</option>");
							});
						}
					
				}
			});
	    });
	});


 function validateForm() {
		
		var department = $("#department").val();
		var application = $("#application").val();
		var moduleDesc = $("#moduleDesc").val();

		var valid = true;
		$('.has-error').removeClass("has-error");
		$(".error-messages").text("").fadeIn();
		
		if (department == ""||department == "0") {
			$("#department").parent().addClass("has-error")
				valid = false;
		}
		
		if (application == ""|| application =="0") {
			$("#application").parent().addClass("has-error")
				valid = false;
		}

		if (moduleDesc == "") {
			$("#moduleDesc").parent().addClass("has-error")
				valid = false;
		}
		
		if (!valid) {
			return false;
		}
		$(".submit_btn").attr("disabled", "disabled");
		if (($("#mode").val()) == 'add') {
			$("#submit_btn").text("Saving...");
		}

		if (($("#mode").val()) == 'edit') {
			$("#submit_btn").text("Updating...");
		}
	}

 
 </script>
 </body> 