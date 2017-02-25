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
      <h1 class="page-header">Please Enter Following Detail to Add New Project Admin</h1>
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
						<h3 class="box-title">Add New Project Admin</h3>
					</div>
						
						
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="addProjectAdmin" commandName="proAdminForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			              <div class="box-body">
				                <div class="form-group col-xs-12 col-md-6">
				                  <form:hidden path="projectAdminId" cssClass="form-control" />
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
				                  <label>Select Project Admin</label><span class="text-danger">*</span>
				                  <form:select path="registration.registrationId" id="registration" class="form-control"  tabindex="3">
				                    <form:option value='0'>Select Project Admin</form:option>
				                    <c:forEach var="reg" items="${regList}">
										<form:option value='${reg.registrationId }'>${reg.name}</form:option>
									</c:forEach>
				                  </form:select>
				                  <span class="text-danger"><form:errors path="registration" /></span>
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
				</div>
			</div>			
		</div>
			     </section>       <%--  --%>
			 <section class="content">            
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Project Admin List</h3>
						<div class="pull-right " style="padding-left: 20px;">
				           <a href="appProjectAdmin" class="btn btn-primary xs btn-xs">Add Project Admin</a>
			            </div>
 					</div>
					<div class="box-body table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="10%">S.n.</th>
									<th width="20%">Department</th>
									<th width="20%">Application</th>
									<th width="20%">Project Admin</th>
									<th width="20%" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<td>1</td>
								<td>Treasury</td>
								<td>DDO Portal</td>
								<td>Varun Nangia</td>
								
								<td class="text-center"> 
								  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> Edit</a>
								  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> View</a>
								  <a class="btn btn-danger btn-xs delete" href="#" ><i class="fa fa-fw fa-remove"></i> Delete</a>
								</td>
							</tr>
							
							
							<%-- <%
								List<Comments> commentsList = (List)request.getAttribute("commentsList");
								if(commentsList != null && !commentsList.isEmpty())
								{
									int i = 1;
									for(Comments comment : commentsList)
									{
										%>
											<tr>
												<td><%= i++ %></td>
												
												<td><%= comment.getCommentDetail() %> </td>
												<td><%= comment.getCommentedBy() %> </td>
												<td><%= DateFormats.fullformat().format(comment.getCommentDate()) %> </td>
												<td class="text-center"> 
												<a class="btn btn-primary btn-xs" href="adminCountryMaster?countryId=<%= comment.getCommentsId() %>" ><i class="fa fa-fw fa-edit"></i> Edit</a>
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
							%> --%>
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

 
 
 $(function () {
	    $("#department").change(function () {
	    	//alert('hi');
	        var selectedText = $(this).find("option:selected").text();
	        var selectedValue = $(this).val();
	    	
			$.ajax({
				type : "GET",
				url : "getDepartmentAdmins",
				data : {'deptId':selectedValue},
				contentType : "application/json",
				success : function(data) {
					var obj = jQuery.parseJSON(data);
					if(!obj.error)
						{
							var list = obj.adminList;
							//alert(list);
							$("#registration").html("<option value='0' >---SELECT---</option>");
							jQuery.each( list, function( i, val ) {
							  $("#registration").append("<option value='"+val.id+"' > "+val.name+"</option>");
							});
						}
					}
				});
		    });
		});

 
 
 
 
 </script>
 </body> 