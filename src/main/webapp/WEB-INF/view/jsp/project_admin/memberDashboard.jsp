<%-- <%@page import="com.testing.domain.UserMaster"%> --%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
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
</head>
<body>
<input type="hidden" id=mode name="mode" value="${mode}">
	<div class="content-wrapper">
       
       <section class="content-header">
      <h1 class="page-header">Manage Members For Work Assignment</h1>
      <ol class="breadcrumb">
        <li><a href="adminDashboard"><i class="fa fa-dashboard"></i> Home Page</a></li>
        <!-- <li><a href="adminUserList"><i class="fa fa-dashboard"></i> User List</a></li> -->
       
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
						<h3 class="box-title">Add Member</h3>
					</div>
						
						
						<div class="box-body table-responsive">
				            
	              <%--   	<form:form role="form" method="POST" action="adminAddUserDetail" commandName="userForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			      --%>         <div class="box-body">
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Department</label><span class="text-danger">*</span>
			                  <select id="department" class="form-control"  tabindex="1">
			                  <option value=''>Select Department</option>
			                   <c:forEach var="dept" items="${deptList}">
								 <option value='${dept.departmentId }'>${dept.departmentName}</option>
							   </c:forEach>
			                  </select>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Application</label><span class="text-danger">*</span>
			                  <select id="application" class="form-control"  tabindex="1">
			                  <option value=''>Select Application</option>
			                   
			                  </select>
			                </div>
			                
			                <div class="form-group col-xs-12 col-md-6">
			                  <label>Select Project Admin</label><span class="text-danger">*</span>
			                  <select id="projectAdmin" class="form-control"  tabindex="1">
			                  <option value=''>Select Project Admin</option>
			                   
			                  </select>
			                </div>

							<div class="form-group col-xs-12 col-md-6">
			                  <label>Select Member</label><span class="text-danger">*</span>
			                  <input type="text" id="member" class="form-control"  placeholder="Enter Member">
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
			     </section>
    
    
    <section class="content">
		
      <!-- Your Page Content Here -->
		<div class="row">
				<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Members List</h3>
						
						<div class="pull-right " style="padding-left: 20px;">
				           <a href="#" class="btn btn-primary xs btn-xs">Add Process/Link</a>
			            </div>
						
 					</div>
					<div class="box-body table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="5%">S.n.</th>
									<th width="15%">Member Name</th>
									<th width="10%">Department</th>
									<th width="10%">Application</th>
									
									<th width="20%" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>1</td>
									<td>Saumya Srivastava</td>
									<td>Treasury</td>
									<td>DDO Portal</td>
									<td class="text-center"> 
									  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> Edit</a>
									  <a class="btn btn-primary btn-xs" href="#" ><i class="fa fa-fw fa-edit"></i> View</a>
									  <a class="btn btn-danger btn-xs delete" href="#" ><i class="fa fa-fw fa-remove"></i> Delete</a>
									</td>
								</tr>
					<%-- <%
								List<UserMaster> userList = (List)request.getAttribute("userList");
								if(userList != null && !userList.isEmpty())
								{
									int i = 1;
									for(UserMaster ul : userList)
									{
										%>
											<tr>
												<td><%= i++ %></td>
												
												<td><%= ul.getUserName() %> </td>
												<td><%= ul.getUserCode() %> </td>
												<td><%= ul.getDesignation() %> </td>
												<td><%= ul.getUnitMaster().getUnitDescription() %> </td>
												
												<td class="text-center"> 
												  <a class="btn btn-primary btn-xs" href="secureEditUser?userId=<%= ul.getUserId() %>" ><i class="fa fa-fw fa-edit"></i> Edit</a>
												  <a class="btn btn-primary btn-xs" href="secureViewUser?userId=<%= ul.getUserId() %>" ><i class="fa fa-fw fa-edit"></i> View</a>
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
    <!-- /.content -->
  </div>
  
  
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

 
 
 </script>
 </body> 