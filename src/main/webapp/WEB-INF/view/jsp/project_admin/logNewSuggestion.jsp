<%-- <%@page import="com.testing.domain.UserRole"%> --%>
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
      <h1 class="page-header">Please Enter Following Detail to Log a New Suggestion</h1>
      <ol class="breadcrumb">
        <li><a href="deptDashboard"><i class="fa fa-dashboard"></i>Home Page</a></li>
      </ol>
    </section>
       
    <!-- Main content -->
    <section class="content">
		
      <!-- Your Page Content Here -->
		<div class="row">
			<div class="col-xs-12 col-md-12">
				 
					<div class="box box-info">
					<%-- <%
				String mode=(String)request.getAttribute("mode");
				if(mode!=null){
				if ((mode).equalsIgnoreCase("add"))
				{
				
				%> --%>
					<div class="box-header with-border">
						<h3 class="box-title">Log New Suggestion</h3>
					</div>
						
						
						<div class="box-body table-responsive">
				            
	              <%--   	<form:form role="form" method="POST" action="adminAddUserDetail" commandName="userForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			      --%>         <div class="box-body">
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Application</label><span class="text-danger">*</span>
			                  <select id="userName" class="form-control"  tabindex="1">
			                  <option value=''>Select Application</option>
			                  </select>
			                </div>

							<div class="form-group col-xs-12 col-md-6">
			                  <label>Select Module</label><span class="text-danger">*</span>
			                  <select id="module" class="form-control"  tabindex="1">
			                  <option value=''>Select Module<option>
			                  </select>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Link/Process</label><span class="text-danger">*</span>
			                  <select id="process" class="form-control"  tabindex="1">
			                  <option value=''>Select Process<option>
			                  </select>
			                </div>

							<div class="form-group col-xs-12 col-md-6">
			                  <label>Enter Subject</label><span class="text-danger">*</span>
			                  <input type="text" id="subject" class="form-control"  placeholder="Enter Subject">
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Enter Remark(Max 200 characters)</label><span class="text-danger">*</span>
			                  <textarea id="remark" class="form-control"  placeholder="Enter Remark">
			                  </textarea>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Add Attachment(Max 20 MB jpg/pdf)</label><span class="text-danger">*</span>
			                  <input type="file" id="attachment" class="form-control" value="upload">
			                </div>
			                
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="11">Submit</button>
			                </div>
			              </div>
			            <%-- </form:form> --%>
					</div>
					<%-- 	<%
				}
				else if ((mode).equalsIgnoreCase("edit"))
				{
						%>
						<div class="box-header with-border">
						  <h3 class="box-title">Edit Unit</h3>
						</div>
					   <div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="secureEditUserDetail" commandName="userForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateEditForm()">
			              <div class="box-body">
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Name</label><span class="text-danger">*</span>
			                  <form:hidden path="userId" cssClass="form-control" />
			                  <form:input path="userName" class="form-control titleCase"  placeholder="Enter user name" tabindex="1" maxlength="50" pattern="^(?!\s*$)[-a-zA-Z ]*$"/>
			                  <span class="text-danger"><form:errors path="userName" /></span>
			                </div>

							<div class="form-group col-xs-12 col-md-6">
			                  <label>User Code</label><span class="text-danger">*</span>
			                  <form:input path="userCode" class="form-control titleCase"  placeholder="Enter user code" tabindex="3" maxlength="10"/>
			                  <span class="text-danger"><form:errors path="userCode" /></span>
			                </div>
			                <div class="form-group col-xs-12 col-md-6">
			                  <label >User Role</label>
			                  <form:select path="userrole" class="form-control" tabindex="20" >
			                  	<form:option value=''>Select User role</form:option>
			                  	<form:option value='<%= Roles.ROLE_USER %>'><%= Roles.ROLE_USER %></form:option>
			                  	<form:option value='<%= Roles.ROLE_MANAGER %>'><%= Roles.ROLE_MANAGER %></form:option>
			                  	<form:option value='<%= Roles.ROLE_ADMIN %>'><%= Roles.ROLE_ADMIN %></form:option>
			                  	<form:option value='<%= Roles.ROLE_CHECKER %>'><%= Roles.ROLE_CHECKER %></form:option>
			                  </form:select>
			                  <span class="text-danger"><form:errors path="userrole" /></span>
			                </div>
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Designation</label><span class="text-danger">*</span>
			                  <form:input path="designation" class="form-control titleCase"  placeholder="Enter Designation" tabindex="4" maxlength="35"/>
			                  <span class="text-danger"><form:errors path="designation" /></span>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Unit Id</label><span class="text-danger">*</span>
			                  <form:select path="unitMaster.unitId" class="form-control" id="unitMaster" tabindex="5">
			                  		<form:option value='0'>---Select Unit---</form:option>
			                  		<c:forEach var="unit" items="${unitList}">
										<form:option value='${unit.unitId }'>${unit.unitDescription}</form:option>
									</c:forEach>
			                  </form:select> <span class="text-danger"><form:errors path="unitMaster" /></span>
			                </div>

			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="6">Update</button>
			                </div>
			              </div>
			            </form:form>
					</div>	
						
						
						<%
				 }
				 else if((mode).equalsIgnoreCase("view"))
				    {
					 
					 UserMaster userMaster=(UserMaster)request.getAttribute("userDetail");
					 
					 if(userMaster!=null){
						 
					%>
					
					<div class="box-header with-border">
						<h3 class="box-title">View User</h3>
					</div>
					
			<div class="box-body table-responsive">
				            
	 		     <div class="box-body">
					
					<div class="form-group col-md-6">
			          <label class="col-sm-4 control-label" style="text-align: left;">User Name</label>
				         <div class="col-sm-8">
				          <label class="form-control label-text"><%= userMaster.getUserName() %></label>
				         </div>
			      	</div>

					<div class="form-group col-md-6">
			          <label class="col-sm-4 control-label" style="text-align: left;">User Code</label>
				         <div class="col-sm-8">
				          <label class="form-control label-text"><%= userMaster.getUserCode() %></label>
				         </div>
			      	</div>
			      	
			      	<div class="form-group col-md-6">
			          <label class="col-sm-4 control-label" style="text-align: left;">Designation</label>
				         <div class="col-sm-8">
				          <label class="form-control label-text"><%= userMaster.getDesignation() %></label>
				         </div>
			      	</div>
			      	
			      	<div class="form-group col-md-6">
			          <label class="col-sm-4 control-label" style="text-align: left;">Unit Id</label>
				         <div class="col-sm-8">
				          <label class="form-control label-text"><%= userMaster.getUnitMaster().getUnitDescription() %></label>
				         </div>
			      	</div>
			      	
			      	 <%
	                	List<UserRole> roles = (List)request.getAttribute("roles");
	                	if(roles != null && !roles.isEmpty())
	                	{
	                		%>
	                			<div class="form-group col-md-6">
				                  <label class="col-sm-4 control-label"  style="text-align: left;">User Role</label>
				                  <div class="col-sm-8">
				                    <label class="form-control label-text"><%= roles.get(0).getUserrole() %></label>
				                  </div>
				                </div>
	                		<%
	                	}
	                
	                %>
							 
				<% 
				}
				    }
				}
			%> --%>
		</div></div>			
				</div>
		</section>		
			</div>
			
	
	
 
    <!-- /.content -->

<script src="js/jQuery-2.2.0.min.js"></script>
<!-- <script type="text/javascript">

$(document).ready(function()
{
	$("#form").trigger('reset');
});



 $(document).ready(function()
		{
			
			  $(document.body).on("change", "#userCode", function() {
				 
				 $(".userCode_error").html("");
				 var userCode = $(this).val();
				 $.ajax({
		 			type : "GET",
		 			 url : "validateUserId",
		 			data : {'userCode':userCode},
		 			contentType : "application/json",
		 			success : function(data) {
		 				var valid = true;
		 				var obj = jQuery.parseJSON(data);
		 				if(obj.UserCode_exist)
						{
							$(".userCode_error").html("User Code already exist !");
							$("#userCode").focus();
							$("#userCode").parent().addClass("has-error")
							valid = false;
						}
		 				if (!valid) {
							return false;
						}
		 			}
		 		});
			 });
		}); 





</script>

<script type="text/javascript">
	
	function validateForm() {
		var userName = $("#userName").val();
		var userCode = $("#userCode").val();
		var designation = $("#designation").val();
		var unitMaster = $("#unitMaster").val();
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val();
		var userrole = $("#userrole").val();
		
		var valid = true;
		$('.has-error').removeClass("has-error");
		$(".error-messages").text("").fadeIn();
		
		if (userName == "") {
			$("#userName").parent().addClass("has-error")
			valid = false;
		}

		if (userCode == "") {
			$("#userCode").parent().addClass("has-error")
			valid = false;
		}
		
		if (userrole == "") {
			$("#userrole").parent().addClass("has-error")
			valid = false;
		}
		
		if(password == "")
		{
			$("#password").parent().addClass("has-error")
			valid = false;
		}
		
		if(confirmPassword == "" || password != confirmPassword)
		{
			$("#confirmPassword").parent().addClass("has-error")
			valid = false;
		}
		
		if (designation == "") {
			$("#designation").parent().addClass("has-error")
			valid = false;
		}
		
		if (unitMaster == "" || unitMaster == "0") {
			$("#unitMaster").parent().addClass("has-error")
			valid = false;
		}
		
		if (!valid) {
			return false;
		}
		
		$(".submit_btn").attr("disabled", "disabled");
		$("#submit_btn").text("Saving...");
		
	}
	
	
	
	
	function validateEditForm() {
		var userName = $("#userName").val();
		var userCode = $("#userCode").val();
		var designation = $("#designation").val();
		var unitMaster = $("#unitMaster").val();
		var userrole = $("#userrole").val();
		
		var valid = true;
		$('.has-error').removeClass("has-error");
		$(".error-messages").text("").fadeIn();
		
		if (userName == "") {
			$("#userName").parent().addClass("has-error")
			valid = false;
		}

		if (userCode == "") {
			$("#userCode").parent().addClass("has-error")
			valid = false;
		}
		
		
		if (designation == "") {
			$("#designation").parent().addClass("has-error")
			valid = false;
		}
		
		if (unitMaster == "" || unitMaster == "0") {
			$("#unitMaster").parent().addClass("has-error")
			valid = false;
		}
		
		if (userrole == "") {
			$("#userrole").parent().addClass("has-error")
			valid = false;
		}
		
		if (!valid) {
			return false;
		}
		
		$(".submit_btn").attr("disabled", "disabled");
		$("#submit_btn").text("Updating...");
		
	}
	
	
	
	
</script> -->
 </body> 