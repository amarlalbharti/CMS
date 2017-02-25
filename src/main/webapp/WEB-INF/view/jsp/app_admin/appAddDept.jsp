<%@page import="com.cms.config.DateFormats"%>
<%@page import="com.cms.domain.UserRole"%>
<%@page import="com.cms.domain.Registration"%>
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
       <%
	
	Registration registration = (Registration)request.getAttribute("registration");
	List<UserRole> roles = (List)request.getAttribute("roles");
	System.out.println("Regi : " + registration);
	%>
    <section class="content-header">
      <h1 class="page-header">Add New Department</h1>
      <ol class="breadcrumb">
        <li><a href="appDashboard"><i class="fa fa-dashboard"></i>Home Page</a></li>
      </ol>
    </section>
       
    <!-- Main content -->
    <section class="content">
		
      <!-- Your Page Content Here -->
		<div class="row">
			<div class="col-xs-12 col-md-12">
				 
					<div class="box box-info">
					<%
				String mode=(String)request.getAttribute("mode");
				if(mode!=null){
				if ((mode).equalsIgnoreCase("add"))
				{
				
				%>
					<div class="box-header with-border">
						<h3 class="box-title">Add Department</h3>
					</div>
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="appAddDept" commandName="regForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			        
			            <div class="box-body">
			            
			         			<div class="form-group col-md-6 no-padding no-margin">
		                           <div class="form-group col-md-12 no-margin">
					                  <label class="col-sm-4 control-label" style="text-align: left;">Name</label>
					                  <div class="col-sm-8">
					                    <label class="form-control label-text"><%= registration.getName() %></label>
					                  </div>
					                </div>
					                <div class="form-group col-md-12 no-margin">
					                  <label class="col-sm-4 control-label"  style="text-align: left;">User ID</label>
					                  <div class="col-sm-8">
					                    <label class="form-control label-text"><%= registration.getUserId() %></label>
					                  </div>
					                </div>
					                
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Gender</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= registration.getGender()%></label>
				                  </div>
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Contact Number</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= registration.getContactNumber()%></label>
				                  </div>
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Registration</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= DateFormats.ddMMMyyyy().format(registration.getRegdate()) %></label>
				                  </div>
				                </div>
				        <%
				                	
				                	if(roles != null && !roles.isEmpty())
				                	{
				                		%>
				                			<div class="form-group col-md-6 no-margin">
							                  <label class="col-sm-4 control-label"  style="text-align: left;">User Role</label>
							                  <div class="col-sm-8">
							                    <label class="form-control"><%= roles.get(0).getUserrole() %></label>
							                  </div>
							                </div>
				                		<%
				                	}
				                
				                %>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Department</label><span class="text-danger">*</span>
			                  <form:select path="department.departmentId" class="form-control"  tabindex="1" id="department">
			                   <form:option value='0'>Select Department</form:option>
			                   <c:forEach var="dept" items="${deptList}">
								 <form:option value='${dept.departmentId }'>${dept.departmentName}</form:option>
							   </c:forEach>
			                  </form:select>
			                  <span class="text-danger"><form:errors path="department"/></span>
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
			              
				}else if((mode).equalsIgnoreCase("edit"))
				{
					Registration empReg = (Registration)request.getAttribute("empReg");
		          	if(empReg != null)
		          	{
			              %>
			              
			           <div class="box-header with-border">
						<h3 class="box-title">Edit New User</h3>
					</div>
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="appEditUserDetail" commandName="regForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			        
			            <div class="box-body">
			            
			              <div class="form-group col-md-6 no-padding no-margin">
		                           <div class="form-group col-md-12 no-margin">
					                  <label class="col-sm-4 control-label" style="text-align: left;">Name</label>
					                  <div class="col-sm-8">
					                    <label class="form-control label-text"><%= registration.getName() %></label>
					                  </div>
					                </div>
					                <div class="form-group col-md-12 no-margin">
					                  <label class="col-sm-4 control-label"  style="text-align: left;">User ID</label>
					                  <div class="col-sm-8">
					                    <label class="form-control label-text"><%= registration.getUserId() %></label>
					                  </div>
					                </div>
					                
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Gender</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= registration.getGender()%></label>
				                  </div>
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Contact Number</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= registration.getContactNumber()%></label>
				                  </div>
				                </div>
				                
				                <div class="form-group col-md-6 no-margin">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">Registration</label>
				                  <div class="col-sm-8">
				                    <label class="form-control"><%= DateFormats.ddMMMyyyy().format(registration.getRegdate()) %></label>
				                  </div>
				                </div>
				        <%
				                	
				                	if(roles != null && !roles.isEmpty())
				                	{
				                		%>
				                			<div class="form-group col-md-6 no-margin">
							                  <label class="col-sm-4 control-label"  style="text-align: left;">User Role</label>
							                  <div class="col-sm-8">
							                    <label class="form-control"><%= roles.get(0).getUserrole() %></label>
							                  </div>
							                </div>
				                		<%
				                	}
				                
				                %>
				                
               
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Department</label><span class="text-danger">*</span>
			                  <form:select path="department.departmentId" class="form-control"  tabindex="1" id="department">
			                   <form:option value='0'>Select Department</form:option>
			                   <c:forEach var="dept" items="${deptList}">
								 <form:option value='${dept.departmentId }'>${dept.departmentName}</form:option>
							   </c:forEach>
			                  </form:select>
			                  <span class="text-danger"><form:errors path="department"/></span>
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
				}}}
			              %>   
			              
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

  
 function validateForm() {
		
		var department = $("#department").val();
		

		var valid = true;
		$('.has-error').removeClass("has-error");
		$(".error-messages").text("").fadeIn();
		
		if (department == "" || department == "0") {
			$("#department").parent().addClass("has-error")
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