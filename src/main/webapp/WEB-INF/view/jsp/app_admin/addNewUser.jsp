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
       <%-- <%
       		UserMaster registration = (UserMaster) request.getSession().getAttribute("registration");
       %> --%>
    <section class="content-header">
      <h1 class="page-header">Please Enter Following Detail to Add New User</h1>
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
						<h3 class="box-title">Add New User</h3>
					</div>
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="appAddUserDetail" commandName="regForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			        
			            <div class="box-body">
			            
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Name</label><span class="text-danger">*</span>
			                  <form:input path="name" class="form-control titleCase"  placeholder="Enter User Name" maxlength="50"/>
			                  <span class="text-danger"><form:errors path="name" /></span>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Id</label><span class="text-danger">*</span>
			                  <form:input path="userId" class="form-control"  placeholder="Enter User Id" maxlength="50"/>
			                  <span class="text-danger userId_error"><form:errors path="userId" /></span>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select User Role</label><span class="text-danger">*</span>
			                  <form:select path="userrole" id="userrole" class="form-control"  tabindex="3">
			                  <option value='0'>Select User role</option>
			                  	<%-- <form:option value='<%= Roles.ROLE_USER %>'><%= Roles.ROLE_USER %></form:option> --%>
			                  	<form:option value='<%= Roles.ROLE_APPADMIN %>'><%= Roles.ROLE_APPADMIN %></form:option>
			                  	<form:option value='<%= Roles.ROLE_ADMIN %>'><%= Roles.ROLE_ADMIN %></form:option>
			                  	<form:option value='<%= Roles.ROLE_DEPT %>'><%= Roles.ROLE_DEPT %></form:option>
			                 </form:select>
			                 <span class="text-danger"><form:errors path="userrole" /></span>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Contact Number</label><span class="text-danger">*</span>
			                  <form:input path="contactNumber" class="form-control"  placeholder="Enter Number" maxlength="10" pattern="^[0-9]+$"/>
			                  <span class="text-danger"><form:errors path="contactNumber" /></span>
			                </div>
			                
			                <div class="clearfix"></div>
			                <div class="form-group col-xs-12 col-md-6">
			                  <div class="col-lg-6  no-padding">
				                  <label>Gender<span class="text-danger">*</span></label>
				                  <div class="input-group">
				                        <span class="input-group-addon">
				                          <form:radiobutton path="gender" value="male" tabindex="9" />
				                        </span>
				                    <label class="form-control">Male</label>
				                  </div>
				                  <!-- /input-group -->
				                </div>
				                <div class="col-lg-6">
				                  <label >&nbsp;</label>
				                  <div class="input-group">
				                        <span class="input-group-addon">
				                          <form:radiobutton path="gender" value="female" tabindex="10"/>
				                        </span>
				                    <label class="form-control">Female</label>
				                  </div>
				                  <!-- /input-group -->
				                </div>
			                </div>
			                
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
			            
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Name</label><span class="text-danger">*</span>
			                  <form:input path="name" class="form-control titleCase"  placeholder="Enter User Name" maxlength="50"/>
			                  <form:hidden path="userId" />
			                  <span class="text-danger"><form:errors path="name" /></span>
			                </div>
			                
			                <%-- <div class="form-group col-xs-12 col-md-6">
			                  <label>User Id</label><span class="text-danger">*</span>
			                  <form:input path="userId" class="form-control"  placeholder="Enter User Id" maxlength="50"/>
			                  <span class="text-danger userId_error"><form:errors path="userId" /></span>
			                </div> --%>
			                
			                <!-- <div class="clearfix"></div> -->
			                <div class="form-group col-xs-12 col-md-6">
			                  <label >User Id</label>
			                  <label class="form-control" ><%= empReg.getUserId() %></label>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select User Role</label><span class="text-danger">*</span>
			                  <form:select path="userrole" id="userrole" class="form-control"  tabindex="3">
			                  <option value='0'>Select User role</option>
			                  	<form:option value='<%= Roles.ROLE_USER %>'><%= Roles.ROLE_USER %></form:option>
			                  	<form:option value='<%= Roles.ROLE_APPADMIN %>'><%= Roles.ROLE_APPADMIN %></form:option>
			                  	<form:option value='<%= Roles.ROLE_ADMIN %>'><%= Roles.ROLE_ADMIN %></form:option>
			                  	<form:option value='<%= Roles.ROLE_DEPT %>'><%= Roles.ROLE_DEPT %></form:option>
			                 </form:select>
			                 <span class="text-danger"><form:errors path="userrole" /></span>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Contact Number</label><span class="text-danger">*</span>
			                  <form:input path="contactNumber" class="form-control"  placeholder="Enter Number" maxlength="10" pattern="^[0-9]+$"/>
			                  <span class="text-danger"><form:errors path="contactNumber" /></span>
			                </div>
			                
			                <div class="clearfix"></div>
			                <div class="form-group col-xs-12 col-md-6">
			                  <div class="col-lg-6  no-padding">
				                  <label>Gender<span class="text-danger">*</span></label>
				                  <div class="input-group">
				                        <span class="input-group-addon">
				                          <form:radiobutton path="gender" value="male" tabindex="9" />
				                        </span>
				                    <label class="form-control">Male</label>
				                  </div>
				                  <!-- /input-group -->
				                </div>
				                <div class="col-lg-6">
				                  <label >&nbsp;</label>
				                  <div class="input-group">
				                        <span class="input-group-addon">
				                          <form:radiobutton path="gender" value="female" tabindex="10"/>
				                        </span>
				                    <label class="form-control">Female</label>
				                  </div>
				                  <!-- /input-group -->
				                </div>
			                </div>
			                
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

 
 
 $(document).ready(function()
			{
				  $(document.body).on("change", "#userId", function() {
					 //alert('hi');
					 $(".userId_error").html("");
					 var userId = $(this).val();
					 $.ajax({
			 			type : "GET",
			 			 url : "validateUserId",
			 			data : {'userId':userId},
			 			contentType : "application/json",
			 			success : function(data) {
			 				var valid = true;
			 				var obj = jQuery.parseJSON(data);
			 				if(obj.UserId_exist)
							{
								$(".userId_error").html("User Id already exist !");
								$("#userId").focus();
								$("#userId").parent().addClass("has-error")
								valid = false;
							}
			 				if (!valid) {
								return false;
							}
			 			}
			 		});
				 });
			}); 


 
 
 function validateForm() {
		
		var department = $("#department").val();
		var name = $("#name").val();
		var userId = $("#userId").val();
		var contactNumber = $("#contactNumber").val();
		var userrole = $("#userrole").val();
		var radioValue = $("input[name='gender']:checked").val();

		var valid = true;
		$('.has-error').removeClass("has-error");
		$(".error-messages").text("").fadeIn();
		
		if (department == "" || department == "0") {
			$("#department").parent().addClass("has-error")
				valid = false;
		}
		
		if (userrole == "" || userrole =="0") {
			$("#userrole").parent().addClass("has-error")
				valid = false;
		}

		if (name == "" ) {
			$("#name").parent().addClass("has-error")
				valid = false;
		}
		
		if (userId == "" ) {
			$("#userId").parent().addClass("has-error")
				valid = false;
		}
		
		if (contactNumber == "" || !ContactNo(contactNumber)) {
			$("#contactNumber").parent().addClass("has-error")
				valid = false;
		}
		
		if(radioValue == undefined)
		{
			$("input[name='gender']").parent().parent().addClass("has-error");
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