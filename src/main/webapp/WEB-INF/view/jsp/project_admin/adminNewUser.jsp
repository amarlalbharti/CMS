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
					<%-- <%
				String mode=(String)request.getAttribute("mode");
				if(mode!=null){
				if ((mode).equalsIgnoreCase("add"))
				{
				
				%> --%>
					<div class="box-header with-border">
						<h3 class="box-title">Add New User</h3>
					</div>
						<div class="box-body table-responsive">
				            
	              <%--   	<form:form role="form" method="POST" action="adminAddUserDetail" commandName="userForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			      --%>   
			            <div class="box-body">
			            
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Name</label><span class="text-danger">*</span>
			                  <input type="text" id="subject" class="form-control"  placeholder="Enter User Name">
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>User Id</label><span class="text-danger">*</span>
			                  <input type="text" id="subject" class="form-control"  placeholder="Enter User Id">
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select User Role</label><span class="text-danger">*</span>
			                  <select id="roles" class="form-control"  tabindex="1">
			                  <option value=''>Select User role</option>
			                  	<option value='<%= Roles.ROLE_USER %>'><%= Roles.ROLE_USER %></option>
			                  	<%-- <option value='<%= Roles.ROLE_APPADMIN %>'><%= Roles.ROLE_APPADMIN %></option>
			                  	<option value='<%= Roles.ROLE_ADMIN %>'><%= Roles.ROLE_ADMIN %></option>
			                  	<option value='<%= Roles.ROLE_DEPT %>'><%= Roles.ROLE_DEPT %></option> --%>
			                 </select>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Enter Password</label><span class="text-danger">*</span>
			                  <input type="text" id="subject" class="form-control"  placeholder="Enter Process">
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Confirm Password</label><span class="text-danger">*</span>
			                  <input type="text" id="subject" class="form-control"  placeholder="Enter Process">
			                </div>
			            
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Department</label><span class="text-danger">*</span>
			                  <select id="department" class="form-control"  tabindex="1">
			                  <option value=''>Select Department</option>
			                   <c:forEach var="dept" items="${deptList}">
								 <option value='${dept.departmentId }'>${dept.departmentName}</option>
							   </c:forEach>
			                  </select>
			                </div>
			            </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="11">Submit</button>
			                </div>
			              </div>
			              </div>
				</div>
			</div>			
		</div>
	</section>       <%-- </form:form> --%>
</div>
				
	 
    <!-- /.content -->

<script src="js/jQuery-2.2.0.min.js"></script>
 <script type="text/javascript">

 
 </script>
 </body> 